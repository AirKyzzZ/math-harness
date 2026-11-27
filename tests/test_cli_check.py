import json

import pytest
from typer.testing import CliRunner

from math_harness import cli
from math_harness.gates.lean_gate import GateCouldNotStart, LeanVerdict, SandboxUnavailable
from math_harness.lean.workspace import TemplateSetupError

ACCEPTED = LeanVerdict(True, True, None, "", ["lake", "comparator"], "v4.x", 1.5, {"ok": True})
REJECTED = LeanVerdict(False, True, "compare_statements", "statement differs", ["lake"], "v4.x", 2.0, {})


@pytest.fixture
def files(tmp_path):
    challenge = tmp_path / "C.lean"
    solution = tmp_path / "S.lean"
    challenge.write_text("theorem t : True := by sorry")
    solution.write_text("theorem t : True := trivial")
    return challenge, solution


def invoke(files, *extra):
    challenge, solution = files
    args = ["check", "--challenge", str(challenge), "--solution", str(solution), "--theorem", "t", *extra]
    return CliRunner().invoke(cli.app, args)


def test_accepted_exits_0(monkeypatch, files):
    monkeypatch.setattr(cli, "run_lean_gate", lambda *a, **k: ACCEPTED)
    r = invoke(files, "--origin", "own")
    assert r.exit_code == 0
    assert "accepted" in r.stdout.lower() and "solved" not in r.stdout.lower()


def test_rejected_exits_1_and_names_step(monkeypatch, files):
    monkeypatch.setattr(cli, "run_lean_gate", lambda *a, **k: REJECTED)
    r = invoke(files, "--origin", "own")
    assert r.exit_code == 1 and "compare_statements" in r.stdout and "rejected" in r.stdout.lower()


def test_sandbox_unavailable_exits_2_with_hint(monkeypatch, files):
    def refuse(*a, **k):
        raise SandboxUnavailable("bubblewrap is Linux-only")

    monkeypatch.setattr(cli, "run_lean_gate", refuse)
    r = invoke(files)
    assert r.exit_code == 2 and "--origin own" in r.stdout


@pytest.mark.parametrize(
    "exc", [GateCouldNotStart("no elan"), TemplateSetupError("setup broke"), ValueError("bad origin")]
)
def test_start_failures_exit_2_without_traceback(monkeypatch, files, exc):
    def boom(*a, **k):
        raise exc

    monkeypatch.setattr(cli, "run_lean_gate", boom)
    r = invoke(files, "--origin", "own")
    assert r.exit_code == 2 and str(exc) in r.stdout
    assert r.exception is None or isinstance(r.exception, SystemExit)


def test_origin_defaults_to_untrusted_and_theorems_repeat(monkeypatch, files):
    seen = {}

    def spy(challenge, solution, theorem_names, origin, **k):
        seen.update(theorems=list(theorem_names), origin=origin)
        return ACCEPTED

    monkeypatch.setattr(cli, "run_lean_gate", spy)
    challenge, solution = files
    r = CliRunner().invoke(
        cli.app,
        ["check", "--challenge", str(challenge), "--solution", str(solution), "--theorem", "a", "--theorem", "b"],
    )
    assert r.exit_code == 0 and seen == {"theorems": ["a", "b"], "origin": "untrusted"}


def test_invalid_origin_is_rejected_by_typer(files):
    r = invoke(files, "--origin", "bogus")
    assert r.exit_code == 2


def test_missing_file_is_rejected_by_typer(tmp_path):
    r = CliRunner().invoke(
        cli.app,
        ["check", "--challenge", str(tmp_path / "no"), "--solution", str(tmp_path / "no"), "--theorem", "t"],
    )
    assert r.exit_code == 2


def test_writes_receipt_when_asked(monkeypatch, files, tmp_path):
    monkeypatch.setattr(cli, "run_lean_gate", lambda *a, **k: ACCEPTED)
    receipt = tmp_path / "out" / "receipt.json"
    r = invoke(files, "--origin", "own", "--receipt", str(receipt))
    assert r.exit_code == 0 and receipt.exists()
    assert json.loads(receipt.read_text())["accepted"] is True


def test_json_flag_prints_only_verdict_json(monkeypatch, files):
    monkeypatch.setattr(cli, "run_lean_gate", lambda *a, **k: REJECTED)
    r = invoke(files, "--origin", "own", "--json")
    data = json.loads(r.stdout)
    assert r.exit_code == 1
    assert data["accepted"] is False and data["failed_step"] == "compare_statements"


@pytest.mark.parametrize("exc_type", [GateCouldNotStart, SandboxUnavailable])
def test_error_messages_have_control_characters_removed(monkeypatch, files, exc_type):
    def boom(*a, **k):
        raise exc_type("bad\x1b[2K\rACCEPTED\x1b]0;spoof\x07 end\x9b")

    monkeypatch.setattr(cli, "run_lean_gate", boom)
    r = invoke(files, "--origin", "own")
    assert r.exit_code == 2
    assert "\x1b" not in r.stdout and "\r" not in r.stdout and "\x07" not in r.stdout and "\x9b" not in r.stdout
    assert "spoof" not in r.stdout and "end" in r.stdout


def test_long_error_message_is_truncated(monkeypatch, files):
    def boom(*a, **k):
        raise GateCouldNotStart("\n".join(f"line{i}" for i in range(500)))

    monkeypatch.setattr(cli, "run_lean_gate", boom)
    r = invoke(files, "--origin", "own")
    assert "line39" in r.stdout and "line40" not in r.stdout and "more lines" in r.stdout


def test_verdict_detail_has_control_characters_removed(monkeypatch, files):
    verdict = LeanVerdict(False, True, "build_solution", "x\x1b[2K\rACCEPTED\x1b]0;t\x07y", [], "v", 1.0, {})
    monkeypatch.setattr(cli, "run_lean_gate", lambda *a, **k: verdict)
    r = invoke(files, "--origin", "own")
    assert r.exit_code == 1 and "\x1b" not in r.stdout and "\r" not in r.stdout and "\x07" not in r.stdout


UNSANDBOXED = LeanVerdict(True, False, None, "", ["lake", "comparator"], "v4.x", 1.5, {})


def test_accepted_without_sandbox_says_unsandboxed(monkeypatch, files):
    monkeypatch.setattr(cli, "run_lean_gate", lambda *a, **k: UNSANDBOXED)
    r = invoke(files, "--origin", "own")
    assert r.exit_code == 0 and "accepted (unsandboxed)" in r.stdout


def test_sandboxed_accept_has_no_unsandboxed_tag(monkeypatch, files):
    monkeypatch.setattr(cli, "run_lean_gate", lambda *a, **k: ACCEPTED)
    r = invoke(files, "--origin", "own")
    assert r.exit_code == 0 and "accepted" in r.stdout and "unsandboxed" not in r.stdout


@pytest.mark.parametrize("extra", [(), ("--json",)])
def test_unwritable_receipt_keeps_the_verdict_and_exits_2(monkeypatch, files, tmp_path, extra):
    monkeypatch.setattr(cli, "run_lean_gate", lambda *a, **k: ACCEPTED)
    (tmp_path / "blocker").write_text("a file, not a directory")
    r = invoke(files, "--origin", "own", "--receipt", str(tmp_path / "blocker" / "receipt.json"), *extra)
    assert r.exit_code == 2 and isinstance(r.exception, SystemExit)
    assert "accepted" in r.stdout
    if extra:
        assert json.loads(r.stdout)["accepted"] is True
    assert "could not write receipt" in r.stderr and len(r.stderr.strip().splitlines()) == 1


def test_keep_check_dir_is_passed_and_the_path_printed(monkeypatch, files):
    seen = {}

    def spy(*a, keep_check_dir=False, **k):
        seen["keep"] = keep_check_dir
        return LeanVerdict(False, False, "check_axioms", "x", [], "v", 1.0, {}, "/runs/kept-dir")

    monkeypatch.setattr(cli, "run_lean_gate", spy)
    r = invoke(files, "--origin", "own", "--keep-check-dir")
    assert r.exit_code == 1 and seen == {"keep": True} and "check dir kept: /runs/kept-dir" in r.stdout


def test_check_dir_is_not_kept_by_default(monkeypatch, files):
    seen = {}

    def spy(*a, keep_check_dir=None, **k):
        seen["keep"] = keep_check_dir
        return ACCEPTED

    monkeypatch.setattr(cli, "run_lean_gate", spy)
    r = invoke(files, "--origin", "own")
    assert r.exit_code == 0 and seen == {"keep": False} and "check dir kept" not in r.stdout


@pytest.mark.parametrize("name", ["", "   "])
def test_blank_theorem_name_exits_2_before_any_work(monkeypatch, files, tmp_path, name):
    monkeypatch.setenv("MH_HOME", str(tmp_path / "mh"))
    challenge, solution = files
    r = CliRunner().invoke(
        cli.app,
        ["check", "--challenge", str(challenge), "--solution", str(solution), "--theorem", name, "--origin", "own"],
    )
    assert r.exit_code == 2 and "invalid theorem name" in r.stdout and not (tmp_path / "mh").exists()
