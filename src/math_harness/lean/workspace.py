import json
import os
import secrets
import shutil
from collections.abc import Sequence
from datetime import datetime, timezone
from pathlib import Path

from math_harness.lean.toolchain import LEAN_TOOLCHAIN, MATHLIB_REV, PERMITTED_AXIOMS
from math_harness.process import CommandRunner, run_command

LAKEFILE = f"""name = "mhcheck"

[[require]]
name = "mathlib"
git = "https://github.com/leanprover-community/mathlib4"
rev = "{MATHLIB_REV}"

[[lean_lib]]
name = "Challenge"

[[lean_lib]]
name = "Solution"
"""

READY_MARKER = ".mh-template-ready"
CURRENT_MARKER = f"{LEAN_TOOLCHAIN} mathlib {MATHLIB_REV}\n"
CONFIG_FILES = ("lakefile.toml", "lean-toolchain", "lake-manifest.json")


class TemplateSetupError(RuntimeError):
    pass


def mh_home() -> Path:
    override = os.environ.get("MH_HOME")
    return Path(override) if override else Path.home() / ".mh"


def template_marker(template: Path) -> str | None:
    marker = template / READY_MARKER
    return marker.read_text() if marker.is_file() else None


def ensure_template(home: Path, runner: CommandRunner = run_command) -> Path:
    template = home / "template"
    if template_marker(template) == CURRENT_MARKER:
        return template
    (template / READY_MARKER).unlink(missing_ok=True)
    template.mkdir(parents=True, exist_ok=True)
    (template / "lakefile.toml").write_text(LAKEFILE)
    (template / "lean-toolchain").write_text(LEAN_TOOLCHAIN + "\n")
    for args in (["lake", "update"], ["lake", "exe", "cache", "get"]):
        result = runner(args, template)
        if result.returncode != 0:
            detail = result.stderr.strip() or result.stdout.strip()
            raise TemplateSetupError(f"`{' '.join(args)}` failed (exit {result.returncode}): {detail}")
    (template / READY_MARKER).write_text(CURRENT_MARKER)
    return template


def fresh_check_dir(
    template: Path,
    challenge: Path,
    solution: Path,
    theorem_names: Sequence[str],
    parent: Path,
) -> Path:
    stamp = datetime.now(timezone.utc).strftime("%Y%m%dT%H%M%SZ")
    check_dir = parent / f"{stamp}-{secrets.token_hex(3)}"
    check_dir.mkdir(parents=True)
    for name in CONFIG_FILES:
        shutil.copy2(template / name, check_dir / name)
    shutil.copy2(challenge, check_dir / "Challenge.lean")
    shutil.copy2(solution, check_dir / "Solution.lean")
    config = {
        "challenge_module": "Challenge",
        "solution_module": "Solution",
        "theorem_names": list(theorem_names),
        "permitted_axioms": list(PERMITTED_AXIOMS),
    }
    (check_dir / "comparator.json").write_text(json.dumps(config, indent=2))
    return check_dir
