import json
import os

import pytest

from conftest import DATA, RecordingRunner
from math_harness.gates.lean_gate import GateCouldNotStart, SandboxUnavailable, run_lean_gate, verdict_from_result
from math_harness.platform import PlatformInfo
from math_harness.process import CommandResult

NO_BWRAP = PlatformInfo(os="macos", has_bwrap=False)
BWRAP = PlatformInfo(os="linux", has_bwrap=True)


def result(stdout: str, code: int = 0, stderr: str = "", timed_out: bool = False) -> CommandResult:
    return CommandResult(["lake", "comparator"], code, stdout, stderr, 12.0, timed_out)


def test_accepted_report_yields_accepted_verdict():
    v = verdict_from_result(result((DATA / "comparator_accepted.json").read_text()))
    assert v.accepted and v.failed_step is None and not v.sandboxed


def test_sorry_report_names_failing_step():
    v = verdict_from_result(result((DATA / "comparator_rejected_sorry.json").read_text(), 1))
    assert not v.accepted and v.failed_step == "check_axioms"
    assert "Illegal axiom detected: 'sorryAx'" in v.detail


def test_real_build_failure_report_names_build_solution():
    v = verdict_from_result(result((DATA / "comparator_rejected_build.json").read_text(), 1))
    assert not v.accepted and v.failed_step == "build_solution"
    assert "unexpected end of input" in v.detail


def test_build_failure_is_a_verdict_not_a_crash():
    report = {"sandboxed": False, "judgement": "rejected", "report": {
        "build_solution": {"output": {"proc": {"stdout": "", "stderr": "unknown identifier 'foo'"}}, "judgement": "failure"}}}
    v = verdict_from_result(result(json.dumps(report), 1))
    assert v.failed_step == "build_solution" and "unknown identifier 'foo'" in v.detail


def test_failed_step_follows_pipeline_order_not_key_order():
    report = {"judgement": "rejected", "report": {
        "check_axioms": {"output": {"str": {"string": "late"}}, "judgement": "failure"},
        "build_challenge": {"output": {"proc": {"stdout": "", "stderr": "early"}}, "judgement": "failure"}}}
    assert verdict_from_result(result(json.dumps(report), 1)).failed_step == "build_challenge"


def test_challenge_export_failure_is_named_not_the_skipped_steps_after_it():
    doc = json.loads((DATA / "comparator_accepted.json").read_text())
    doc["judgement"] = "failure"
    doc["report"]["export_challenge"] = {"output": {"proc": {"stdout": "", "stderr": "unknown constant 'two'"}}, "judgement": "failure"}
    for name in ("build_solution", "export_solution", "compare_statements", "check_axioms"):
        doc["report"][name] = {"output": {"str": {"string": ""}}, "judgement": "skipped"}
    doc["report"]["kernel_reports"] = {"Lean default": {"output": {"str": {"string": ""}}, "judgement": "skipped"}}
    v = verdict_from_result(result(json.dumps(doc), 1))
    assert not v.accepted and v.failed_step == "export_challenge" and "unknown constant 'two'" in v.detail


def test_skipped_steps_without_any_failure_are_not_accepted():
    doc = json.loads((DATA / "comparator_accepted.json").read_text())
    doc["report"]["check_axioms"] = {"output": {"str": {"string": ""}}, "judgement": "skipped"}
    v = verdict_from_result(result(json.dumps(doc), 0))
    assert not v.accepted and v.failed_step == "check_axioms"


def test_kernel_failure_is_named_with_prefix():
    report = {"judgement": "rejected", "report": {
        "check_axioms": {"output": {"str": {"string": ""}}, "judgement": "success"},
        "kernel_reports": {"Lean default": {"output": {"proc": {"stdout": "", "stderr": "kernel says no"}}, "judgement": "failure"}}}}
    v = verdict_from_result(result(json.dumps(report), 1))
    assert v.failed_step == "kernel:Lean default" and "kernel says no" in v.detail


def test_exit_code_2_raises_could_not_start():
    with pytest.raises(GateCouldNotStart, match="bwrap not found"):
        verdict_from_result(result("", 2, "bwrap not found"))


def test_exit_code_127_raises_could_not_start():
    with pytest.raises(GateCouldNotStart, match="lake"):
        verdict_from_result(result("", 127, "lake: not found"))


def test_timeout_is_rejected_verdict():
    v = verdict_from_result(result("", -1, timed_out=True))
    assert not v.accepted and v.failed_step == "timeout"


def test_unparseable_output_raises_could_not_start():
    with pytest.raises(GateCouldNotStart):
        verdict_from_result(result("not json", 1))


def test_exit_zero_with_rejected_judgement_is_not_accepted():
    report = {"judgement": "rejected", "report": {}}
    assert not verdict_from_result(result(json.dumps(report), 0)).accepted


def test_exit_one_with_accepted_judgement_is_not_accepted():
    assert not verdict_from_result(result((DATA / "comparator_accepted.json").read_text(), 1)).accepted


def test_untrusted_without_bwrap_refuses_before_touching_filesystem(tmp_path):
    home = tmp_path / "home"
    with pytest.raises(SandboxUnavailable):
        run_lean_gate(tmp_path / "C.lean", tmp_path / "S.lean", ["t"], "untrusted", home=home, platform=NO_BWRAP)
    assert not home.exists()


def test_own_without_bwrap_passes_no_sandbox_flag(fake_template, challenge_solution, recording_runner):
    c, s = challenge_solution
    v = run_lean_gate(c, s, ["t"], "own", home=fake_template.home, platform=NO_BWRAP, runner=recording_runner)
    call = recording_runner.calls[-1]
    assert call[:2] == ["lake", "comparator"] and "--json" in call and "--inadvisably-no-sandbox" in call
    assert not v.sandboxed


def test_bwrap_present_never_passes_no_sandbox_flag(fake_template, challenge_solution):
    c, s = challenge_solution
    runner = RecordingRunner(json.dumps({**ACC, "sandboxed": True}))
    for origin in ("own", "untrusted"):
        v = run_lean_gate(c, s, ["t"], origin, home=fake_template.home, platform=BWRAP, runner=runner)
        assert "--inadvisably-no-sandbox" not in runner.calls[-1]
        assert v.sandboxed


@pytest.mark.parametrize(
    "args, reported, expected",
    [
        (["lake", "comparator", "--json"], True, True),
        (["lake", "comparator", "--json"], False, False),
        (["lake", "comparator", "--json"], None, False),
        (["lake", "comparator", "--json"], "true", False),
        (["lake", "comparator", "--json", "--inadvisably-no-sandbox"], True, False),
    ],
)
def test_sandboxed_needs_both_no_flag_and_the_report_saying_so(args, reported, expected):
    doc = {k: v for k, v in ACC.items() if k != "sandboxed"}
    if reported is not None:
        doc["sandboxed"] = reported
    v = verdict_from_result(CommandResult(args, 0, json.dumps(doc), "", 1.0, False))
    assert v.accepted and v.sandboxed is expected


def test_gate_runs_in_fresh_check_dir_with_timeout(fake_template, challenge_solution, recording_runner):
    c, s = challenge_solution
    run_lean_gate(c, s, ["t"], "own", home=fake_template.home, platform=BWRAP, runner=recording_runner, timeout_s=77)
    assert recording_runner.cwds[-1].parent == fake_template.home / "runs"
    assert "Solution.lean" in recording_runner.files[-1]
    assert recording_runner.timeouts[-1] == 77


def test_gate_puts_elan_bin_first_on_path(fake_template, challenge_solution, recording_runner, monkeypatch, tmp_path):
    monkeypatch.setenv("ELAN_HOME", str(tmp_path / "elan"))
    monkeypatch.setenv("PATH", "/usr/bin")
    c, s = challenge_solution
    run_lean_gate(c, s, ["t"], "own", home=fake_template.home, platform=BWRAP, runner=recording_runner)
    assert recording_runner.envs[-1]["PATH"] == f"{tmp_path / 'elan' / 'bin'}{os.pathsep}/usr/bin"


def runs(home):
    return list((home / "runs").iterdir())


@pytest.mark.parametrize(
    "stdout, code, timed_out",
    [
        ((DATA / "comparator_accepted.json").read_text(), 0, False),
        ((DATA / "comparator_rejected_sorry.json").read_text(), 1, False),
        ("", -1, True),
    ],
)
def test_check_dir_is_removed_after_the_verdict(stdout, code, timed_out, fake_template, challenge_solution):
    seen = []

    def runner(args, cwd, timeout_s=None, env=None):
        seen.append((cwd / "Solution.lean").is_file())
        return CommandResult(list(args), code, stdout, "", 1.0, timed_out)

    c, s = challenge_solution
    v = run_lean_gate(c, s, ["t"], "own", home=fake_template.home, platform=BWRAP, runner=runner)
    assert seen == [True] and runs(fake_template.home) == [] and v.check_dir is None


@pytest.mark.parametrize("failure", [RuntimeError("runner blew up"), KeyboardInterrupt()])
def test_check_dir_is_removed_when_the_runner_raises(failure, fake_template, challenge_solution):
    def runner(args, cwd, timeout_s=None, env=None):
        raise failure

    c, s = challenge_solution
    with pytest.raises(type(failure)):
        run_lean_gate(c, s, ["t"], "own", home=fake_template.home, platform=BWRAP, runner=runner)
    assert runs(fake_template.home) == []


def test_check_dir_is_removed_when_comparator_could_not_start(fake_template, challenge_solution):
    def runner(args, cwd, timeout_s=None, env=None):
        return CommandResult(list(args), 2, "", "bwrap not found", 0.0, False)

    c, s = challenge_solution
    with pytest.raises(GateCouldNotStart):
        run_lean_gate(c, s, ["t"], "own", home=fake_template.home, platform=BWRAP, runner=runner)
    assert runs(fake_template.home) == []


def test_check_dir_is_kept_when_asked(fake_template, challenge_solution, recording_runner):
    c, s = challenge_solution
    v = run_lean_gate(
        c, s, ["t"], "own", home=fake_template.home, platform=BWRAP, runner=recording_runner, keep_check_dir=True
    )
    assert runs(fake_template.home) == [recording_runner.cwds[-1]]
    assert v.check_dir == str(recording_runner.cwds[-1]) and (recording_runner.cwds[-1] / "Solution.lean").is_file()


def test_missing_lake_surfaces_as_could_not_start(fake_template, challenge_solution):
    c, s = challenge_solution

    def missing(args, cwd, timeout_s=None, env=None):
        return CommandResult(list(args), 127, "", "lake: No such file", 0.0, False)

    with pytest.raises(GateCouldNotStart):
        run_lean_gate(c, s, ["t"], "own", home=fake_template.home, platform=BWRAP, runner=missing)


ACC = json.loads((DATA / "comparator_accepted.json").read_text())


def mutated(**changes):
    doc = json.loads(json.dumps(ACC))
    for key, value in changes.items():
        if key == "report_steps":
            doc["report"].update(value)
        else:
            doc[key] = value
    return doc


@pytest.mark.parametrize(
    "doc, step",
    [
        ({"judgement": "accepted"}, "report"),
        ({"judgement": "accepted", "report": None}, "report"),
        ({"judgement": "accepted", "report": []}, "report"),
        (mutated(report_steps={"check_axioms": "failure"}), "check_axioms"),
        (mutated(report_steps={"kernel_reports": {}}), "kernel_reports"),
        (mutated(report_steps={"kernel_reports": {"Lean default": "failure"}}), "kernel:Lean default"),
        (mutated(report_steps={"kernel_reports": None}), "kernel_reports"),
        (mutated(report_steps={"compare_statements": {"output": {}}}), "compare_statements"),
    ],
)
def test_malformed_report_is_never_accepted(doc, step):
    v = verdict_from_result(result(json.dumps(doc), 0))
    assert not v.accepted and v.failed_step == step


def test_missing_step_is_not_accepted():
    doc = mutated()
    del doc["report"]["export_solution"]
    v = verdict_from_result(result(json.dumps(doc), 0))
    assert not v.accepted and v.failed_step == "export_solution"


@pytest.mark.parametrize("origin", ["Untrusted", "untrusted ", "external", ""])
def test_unexpected_origin_is_rejected(origin, fake_template, challenge_solution, recording_runner):
    c, s = challenge_solution
    with pytest.raises(ValueError):
        run_lean_gate(c, s, ["t"], origin, home=fake_template.home, platform=NO_BWRAP, runner=recording_runner)
    assert recording_runner.calls == []


@pytest.mark.parametrize("names", [[], "comm", (), [""], ["   "], ["t", "\t\n"], [None], ["t", 1], [b"t"]])
def test_bad_theorem_names_are_rejected_before_any_work(names, tmp_path, challenge_solution, recording_runner):
    c, s = challenge_solution
    home = tmp_path / "home"
    with pytest.raises(ValueError):
        run_lean_gate(c, s, names, "own", home=home, platform=BWRAP, runner=recording_runner)
    assert recording_runner.calls == [] and not home.exists()
