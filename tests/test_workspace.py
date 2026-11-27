import json
import sys
from pathlib import Path

import pytest

from math_harness.lean import toolchain
from math_harness.lean.workspace import CURRENT_MARKER, TemplateSetupError, ensure_template, fresh_check_dir, mh_home
from math_harness.process import CommandResult, run_command


def test_fresh_check_dir_has_exact_files_and_config(tmp_path, template_dir):
    challenge_src = tmp_path / "in"
    challenge_src.mkdir()
    (challenge_src / ".lake").mkdir()
    (challenge_src / "Challenge.lean").write_text("theorem t : True := by sorry")
    (challenge_src / "Solution.lean").write_text("theorem t : True := trivial")
    d = fresh_check_dir(template_dir, challenge_src / "Challenge.lean", challenge_src / "Solution.lean", ["t"], tmp_path / "runs")
    assert sorted(p.name for p in d.iterdir()) == ["Challenge.lean", "Solution.lean", "comparator.json", "lake-manifest.json", "lakefile.toml", "lean-toolchain"]
    assert json.loads((d / "comparator.json").read_text()) == {
        "challenge_module": "Challenge", "solution_module": "Solution",
        "theorem_names": ["t"], "permitted_axioms": ["propext", "Quot.sound", "Classical.choice"]}
    assert (d / "Solution.lean").read_text() == "theorem t : True := trivial"


def test_fresh_check_dir_is_unique_per_call(tmp_path, template_dir):
    (tmp_path / "C.lean").write_text("c")
    (tmp_path / "S.lean").write_text("s")
    a = fresh_check_dir(template_dir, tmp_path / "C.lean", tmp_path / "S.lean", ["t"], tmp_path / "runs")
    b = fresh_check_dir(template_dir, tmp_path / "C.lean", tmp_path / "S.lean", ["t"], tmp_path / "runs")
    assert a != b and a.parent == b.parent == tmp_path / "runs"


def test_ensure_template_raises_with_stderr_when_lake_update_fails(tmp_path):
    def failing(args, cwd, timeout_s=None, env=None):
        return CommandResult(list(args), 1, "", "error: could not resolve host", 0.1, False)
    with pytest.raises(TemplateSetupError, match="could not resolve host"):
        ensure_template(tmp_path, runner=failing)


def test_ensure_template_writes_pinned_files_and_runs_lake(tmp_path):
    calls = []

    def ok(args, cwd, timeout_s=None, env=None):
        calls.append(list(args))
        return CommandResult(list(args), 0, "", "", 0.0, False)

    template = ensure_template(tmp_path, runner=ok)
    assert template == tmp_path / "template"
    assert calls == [["lake", "update"], ["lake", "exe", "cache", "get"]]
    assert (template / "lean-toolchain").read_text().strip() == toolchain.LEAN_TOOLCHAIN
    lakefile = (template / "lakefile.toml").read_text()
    assert f'rev = "{toolchain.MATHLIB_REV}"' in lakefile
    assert 'name = "Challenge"' in lakefile and 'name = "Solution"' in lakefile


def test_ensure_template_is_noop_when_marker_present(tmp_path):
    template = tmp_path / "template"
    template.mkdir()
    (template / ".mh-template-ready").write_text(CURRENT_MARKER)

    def boom(args, cwd, timeout_s=None, env=None):
        raise AssertionError("runner must not be called")

    assert ensure_template(tmp_path, runner=boom) == template


def test_ensure_template_writes_marker_only_after_both_commands(tmp_path):
    def ok(args, cwd, timeout_s=None, env=None):
        return CommandResult(list(args), 0, "", "", 0.0, False)

    ensure_template(tmp_path, runner=ok)
    assert (tmp_path / "template" / ".mh-template-ready").is_file()


def test_failed_cache_get_leaves_no_marker_and_next_call_reruns(tmp_path):
    calls = []

    def cache_fails(args, cwd, timeout_s=None, env=None):
        calls.append(list(args))
        code = 1 if args[:3] == ["lake", "exe", "cache"] else 0
        return CommandResult(list(args), code, "", "cache download failed", 0.0, False)

    with pytest.raises(TemplateSetupError, match="cache download failed"):
        ensure_template(tmp_path, runner=cache_fails)
    assert not (tmp_path / "template" / ".mh-template-ready").exists()
    with pytest.raises(TemplateSetupError):
        ensure_template(tmp_path, runner=cache_fails)
    assert len(calls) == 4


def test_ensure_template_names_missing_lake_executable(tmp_path, monkeypatch):
    monkeypatch.setenv("PATH", str(tmp_path / "empty"))
    with pytest.raises(TemplateSetupError, match="lake"):
        ensure_template(tmp_path)


def test_run_command_missing_executable_returns_127():
    r = run_command(["definitely-not-a-real-binary-xyz"], cwd=Path.cwd())
    assert r.returncode == 127 and not r.timed_out
    assert "definitely-not-a-real-binary-xyz" in r.stderr


def test_mh_home_respects_env(monkeypatch, tmp_path):
    monkeypatch.setenv("MH_HOME", str(tmp_path))
    assert mh_home() == tmp_path
    monkeypatch.delenv("MH_HOME")
    assert mh_home() == Path.home() / ".mh"


def test_run_command_captures_output():
    r = run_command([sys.executable, "-c", "print('hi')"], cwd=Path.cwd())
    assert (r.returncode, r.stdout.strip(), r.timed_out) == (0, "hi", False)


def test_run_command_timeout_does_not_raise():
    r = run_command([sys.executable, "-c", "import time; time.sleep(5)"], cwd=Path.cwd(), timeout_s=0.3)
    assert r.timed_out and r.returncode == -1


def test_ensure_template_rebuilds_when_marker_is_for_another_pin(tmp_path):
    template = tmp_path / "template"
    template.mkdir()
    (template / ".mh-template-ready").write_text("leanprover/lean4:v4.36.0 mathlib v4.36.0\n")
    calls = []

    def ok(args, cwd, timeout_s=None, env=None):
        calls.append(list(args))
        return CommandResult(list(args), 0, "", "", 0.0, False)

    ensure_template(tmp_path, runner=ok)
    assert calls == [["lake", "update"], ["lake", "exe", "cache", "get"]]
    assert (template / ".mh-template-ready").read_text() == CURRENT_MARKER


def test_ensure_template_stale_marker_removed_when_rebuild_fails(tmp_path):
    template = tmp_path / "template"
    template.mkdir()
    (template / ".mh-template-ready").write_text("old\n")

    def failing(args, cwd, timeout_s=None, env=None):
        return CommandResult(list(args), 1, "", "no network", 0.0, False)

    with pytest.raises(TemplateSetupError):
        ensure_template(tmp_path, runner=failing)
    assert not (template / ".mh-template-ready").exists()
