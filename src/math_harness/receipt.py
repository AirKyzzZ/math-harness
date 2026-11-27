import hashlib
import json
from datetime import datetime, timezone
from pathlib import Path

from math_harness import __version__
from math_harness.gates.lean_gate import LeanVerdict
from math_harness.lean.toolchain import MATHLIB_REV


def _sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def write_receipt(verdict: LeanVerdict, challenge: Path, solution: Path, path: Path) -> None:
    receipt = {
        "mh_version": __version__,
        "created_utc": datetime.now(timezone.utc).isoformat(),
        "challenge_sha256": _sha256(challenge),
        "solution_sha256": _sha256(solution),
        "lean_toolchain": verdict.lean_toolchain,
        "mathlib_rev": MATHLIB_REV,
        "command": verdict.command,
        "sandboxed": verdict.sandboxed,
        "accepted": verdict.accepted,
        "failed_step": verdict.failed_step,
        "detail": verdict.detail,
        "duration_s": verdict.duration_s,
    }
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(receipt, indent=2))
