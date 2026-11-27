import hashlib
import json

from math_harness.gates.lean_gate import LeanVerdict
from math_harness.lean.toolchain import LEAN_TOOLCHAIN, MATHLIB_REV
from math_harness.receipt import write_receipt


def test_receipt_has_expected_keys_and_hashes(tmp_path, challenge_solution):
    c, s = challenge_solution
    verdict = LeanVerdict(False, True, "check_axioms", "uses sorryAx", ["lake", "comparator", "--json"], LEAN_TOOLCHAIN, 3.5, {})
    path = tmp_path / "out" / "receipt.json"
    write_receipt(verdict, c, s, path)
    data = json.loads(path.read_text())
    assert set(data) == {
        "mh_version", "created_utc", "challenge_sha256", "solution_sha256", "lean_toolchain", "mathlib_rev",
        "command", "sandboxed", "accepted", "failed_step", "detail", "duration_s"}
    assert data["challenge_sha256"] == hashlib.sha256(c.read_bytes()).hexdigest()
    assert data["solution_sha256"] == hashlib.sha256(s.read_bytes()).hexdigest()
    assert data["mathlib_rev"] == MATHLIB_REV and data["accepted"] is False and data["failed_step"] == "check_axioms"
