import json
from pathlib import Path

import pytest

from math_harness.gates.lean_gate import run_lean_gate

FIXTURES = Path(__file__).parent.parent / "fixtures" / "lean"
CASES = sorted(path.name for path in FIXTURES.iterdir() if path.is_dir())


@pytest.fixture(scope="session")
def lean_home(tmp_path_factory: pytest.TempPathFactory) -> Path:
    return tmp_path_factory.mktemp("mh-home")


@pytest.mark.lean
@pytest.mark.parametrize("case", CASES)
def test_gate_matches_expectation(case: str, lean_home: Path) -> None:
    directory = FIXTURES / case
    expected = json.loads((directory / "case.json").read_text())
    verdict = run_lean_gate(
        directory / "Challenge.lean",
        directory / "Solution.lean",
        expected["theorem_names"],
        "own",
        home=lean_home,
    )
    assert verdict.accepted is expected["expect_accepted"], verdict
    assert verdict.failed_step == expected["expect_failed_step"], verdict
    assert expected.get("expect_detail", "") in verdict.detail, verdict
    assert list((lean_home / "runs").iterdir()) == []
