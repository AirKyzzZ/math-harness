import argparse
import json
import os
import subprocess
import tempfile
from concurrent.futures import ThreadPoolExecutor
from pathlib import Path

from math_harness.catalogue.store import CATALOGUE_FILE, load_catalogue


def compile_one(workspace: Path, file: Path, timeout: int) -> tuple[bool, str | None]:
    try:
        result = subprocess.run(
            ["lake", "env", "lean", str(file)], cwd=workspace, capture_output=True, text=True, timeout=timeout, env=os.environ
        )
    except subprocess.TimeoutExpired:
        return False, f"timeout after {timeout}s"
    errors = [line for line in result.stdout.splitlines() if ": error" in line]
    if result.returncode == 0 and not errors:
        return True, None
    return False, (errors[0] if errors else (result.stderr.strip() or f"exit {result.returncode}"))[:300]


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--workspace", type=Path, required=True)
    parser.add_argument("--catalogue", type=Path, default=CATALOGUE_FILE)
    parser.add_argument("--jobs", type=int, default=2)
    parser.add_argument("--timeout", type=int, default=600)
    parser.add_argument("--limit", type=int, default=0)
    args = parser.parse_args()
    doc = load_catalogue(args.catalogue)
    todo = [e for e in doc["entries"] if e["compiles"] is None and e["signals"]["track"] != "formalized"]
    if args.limit:
        todo = todo[: args.limit]

    def run(entry: dict) -> None:
        with tempfile.TemporaryDirectory() as tmp:
            results = []
            for key in ("challenge", "challenge_neg"):
                if entry.get(key):
                    file = Path(tmp) / f"{key}.lean"
                    file.write_text(entry[key], encoding="utf-8")
                    results.append(compile_one(args.workspace.resolve(), file, args.timeout))
            failed = [error for ok, error in results if not ok]
            entry["compiles"], entry["error"] = not failed, (failed[0] if failed else None)
        print(f"{'ok ' if entry['compiles'] else 'ERR'} {entry['id']}", flush=True)

    def save() -> None:
        tmp = args.catalogue.with_suffix(".json.tmp")
        tmp.write_text(json.dumps(doc, indent=1, ensure_ascii=False) + "\n", encoding="utf-8")
        os.replace(tmp, args.catalogue)

    with ThreadPoolExecutor(max_workers=args.jobs) as pool:
        for done, _ in enumerate(pool.map(run, todo), 1):
            if done % 10 == 0:
                save()
    save()


if __name__ == "__main__":
    main()
