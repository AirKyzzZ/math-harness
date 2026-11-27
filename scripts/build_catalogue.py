import argparse
import json
import subprocess
from datetime import date
from pathlib import Path

import yaml

from math_harness.catalogue.extract import extract_statements
from math_harness.catalogue.signals import score, signals
from math_harness.catalogue.store import DATA_DIR


def revision(repo: Path) -> str:
    return subprocess.run(["git", "-C", str(repo), "rev-parse", "HEAD"], capture_output=True, text=True, check=True).stdout.strip()


def build(fc: Path, ep: Path, out: Path) -> dict:
    records = {str(p["number"]): p for p in yaml.safe_load((ep / "data" / "problems.yaml").read_text())}
    out.mkdir(parents=True, exist_ok=True)
    entries = []
    for path in sorted((fc / "FormalConjectures" / "ErdosProblems").glob("*.lean"), key=lambda p: (len(p.stem), p.stem)):
        if not path.stem.isdigit():
            continue
        for stmt in extract_statements(path.read_text(encoding="utf-8"), path.stem):
            sig = signals(stmt, records.get(path.stem))
            entries.append(
                {
                    "id": stmt.id,
                    "problem": stmt.problem,
                    "statement": stmt.statement,
                    "signals": sig,
                    "score": score(sig),
                    "compiles": None,
                    "error": None,
                    "challenge": stmt.challenge,
                    "challenge_neg": stmt.challenge_neg,
                }
            )
    entries.sort(key=lambda e: -e["score"])
    doc = {"fc_revision": revision(fc), "ep_revision": revision(ep), "built": date.today().isoformat(), "entries": entries}
    (out / "catalogue.json").write_text(json.dumps(doc, indent=1, ensure_ascii=False) + "\n", encoding="utf-8")
    return doc


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--fc", type=Path, required=True)
    parser.add_argument("--ep", type=Path, required=True)
    parser.add_argument("--out", type=Path, default=DATA_DIR)
    args = parser.parse_args()
    doc = build(args.fc, args.ep, args.out)
    tracks: dict[str, int] = {}
    for entry in doc["entries"]:
        tracks[entry["signals"]["track"]] = tracks.get(entry["signals"]["track"], 0) + 1
    print(f"{len(doc['entries'])} entries {tracks} fc {doc['fc_revision'][:7]}")


if __name__ == "__main__":
    main()
