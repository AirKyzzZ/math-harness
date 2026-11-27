import builtins
import os
from pathlib import Path

import pytest
from typer.testing import CliRunner

from math_harness import doctor
from math_harness.cli import app
from math_harness.doctor import DoctorCheck, apply_fixes, run_doctor
from math_harness.lean.workspace import CURRENT_MARKER, READY_MARKER
from math_harness.platform import PlatformInfo
from math_harness.process import CommandResult

BIG = 50 * 10**9


def ok_runner(args, cwd, timeout_s=None, env=None):
    return CommandResult(list(args), 0, "tool 1.2.3\n", "", 0.0, False)


def all_present(name):
    return f"/usr/bin/{name}"


def by_name(checks, name):
    return next(c for c in checks if c.name == name)


def mark_ready(home: Path) -> None:
    (home / "template").mkdir(parents=True)
    (home / "template" / READY_MARKER).write_text(CURRENT_MARKER)


def test_check_order(tmp_path):
    checks = run_doctor(tmp_path, PlatformInfo("linux", True), which=all_present, runner=ok_runner, free_bytes=lambda _: BIG)
    assert [c.name for c in checks] == ["python", "elan", "verification workspace", "disk", "sandbox", "claude CLI", "codex CLI"]
    assert [c.required for c in checks] == [True, True, True, True, False, False, False]


def test_missing_elan_is_required_failure(tmp_path):
    checks = run_doctor(tmp_path, PlatformInfo("macos", False), which=lambda _: None, runner=ok_runner, free_bytes=lambda _: BIG, elan_bin=tmp_path / "no-elan")
    elan = by_name(checks, "elan")
    assert not elan.ok and elan.required and elan.fix_hint


def test_low_disk_fails(tmp_path):
    checks = run_doctor(tmp_path, PlatformInfo("linux", True), which=all_present, runner=ok_runner, free_bytes=lambda _: 2 * 10**9)
    assert not by_name(checks, "disk").ok


def test_workspace_ok_only_with_ready_marker(tmp_path):
    kwargs = dict(which=all_present, runner=ok_runner, free_bytes=lambda _: BIG)
    assert not by_name(run_doctor(tmp_path, PlatformInfo("linux", True), **kwargs), "verification workspace").ok
    mark_ready(tmp_path)
    assert by_name(run_doctor(tmp_path, PlatformInfo("linux", True), **kwargs), "verification workspace").ok


def test_workspace_not_ready_when_built_for_another_pin(tmp_path):
    kwargs = dict(which=all_present, runner=ok_runner, free_bytes=lambda _: BIG)
    mark_ready(tmp_path)
    (tmp_path / "template" / READY_MARKER).write_text("leanprover/lean4:v4.36.0 mathlib v4.36.0\n")
    check = by_name(run_doctor(tmp_path, PlatformInfo("linux", True), **kwargs), "verification workspace")
    assert not check.ok
    assert check.detail == f"built for leanprover/lean4:v4.36.0 mathlib v4.36.0, need {CURRENT_MARKER.strip()}"


def test_macos_sandbox_check_ok_with_own_only_detail(tmp_path):
    checks = run_doctor(tmp_path, PlatformInfo("macos", False), which=all_present, runner=ok_runner, free_bytes=lambda _: BIG)
    sandbox = by_name(checks, "sandbox")
    assert sandbox.ok and not sandbox.required
    assert sandbox.detail == "own-agent proofs only, unsandboxed"


def test_linux_without_bwrap_sandbox_not_ok_but_optional(tmp_path):
    checks = run_doctor(tmp_path, PlatformInfo("linux", False), which=all_present, runner=ok_runner, free_bytes=lambda _: BIG)
    sandbox = by_name(checks, "sandbox")
    assert not sandbox.ok and not sandbox.required and sandbox.fix_hint


def test_agent_clis_use_version_only_with_a_timeout(tmp_path):
    calls = []

    def recording(args, cwd, timeout_s=None, env=None):
        calls.append((list(args), timeout_s))
        return CommandResult(list(args), 0, "1.0.0\n", "", 0.0, False)

    checks = run_doctor(tmp_path, PlatformInfo("macos", False), which=all_present, runner=recording, free_bytes=lambda _: BIG)
    assert by_name(checks, "claude CLI").ok and by_name(checks, "claude CLI").detail == "1.0.0"
    assert sorted(calls) == [(["/usr/bin/claude", "--version"], 10), (["/usr/bin/codex", "--version"], 10)]


def test_agent_cli_version_timeout_is_optional_failure(tmp_path):
    def hangs(args, cwd, timeout_s=None, env=None):
        return CommandResult(list(args), -1, "", "", float(timeout_s), True)

    checks = run_doctor(tmp_path, PlatformInfo("macos", False), which=all_present, runner=hangs, free_bytes=lambda _: BIG)
    claude = by_name(checks, "claude CLI")
    assert not claude.ok and not claude.required and "timed out" in claude.detail


def test_agent_cli_missing_is_optional_failure(tmp_path):
    which = lambda n: None if n == "codex" else f"/usr/bin/{n}"
    checks = run_doctor(tmp_path, PlatformInfo("macos", False), which=which, runner=ok_runner, free_bytes=lambda _: BIG)
    codex = by_name(checks, "codex CLI")
    assert not codex.ok and not codex.required


def test_doctor_never_opens_credential_paths(tmp_path, monkeypatch):
    opened = []
    real_open = builtins.open
    monkeypatch.setattr(builtins, "open", lambda p, *a, **k: (opened.append(str(p)), real_open(p, *a, **k))[1])
    run_doctor(tmp_path, PlatformInfo("macos", False), which=all_present, runner=ok_runner, free_bytes=lambda _: BIG)
    assert not any(s in p for p in opened for s in (".ssh", ".aws", "auth.json", ".claude", ".codex"))


def failing_checks():
    return [
        DoctorCheck("elan", False, True, "not found", "install elan"),
        DoctorCheck("verification workspace", False, True, "not set up", "run fix"),
    ]


def test_apply_fixes_installs_elan_without_shell_then_sets_up_template(tmp_path, monkeypatch):
    calls = []
    downloads = []

    def runner(args, cwd, timeout_s=None, env=None):
        calls.append(list(args))
        return CommandResult(list(args), 0, "", "", 0.0, False)

    def download(url, dest):
        downloads.append(url)
        dest.write_text("#!/bin/sh\n")

    ensured = []
    monkeypatch.setattr(doctor, "ensure_template", lambda home, runner: ensured.append(home) or home / "template")
    results = apply_fixes(tmp_path, failing_checks(), runner=runner, download=download)
    assert downloads == ["https://raw.githubusercontent.com/leanprover/elan/master/elan-init.sh"]
    assert calls[0][0] == "sh" and calls[0][2:] == ["-y", "--default-toolchain", "none"]
    assert ensured == [tmp_path]
    assert all(r.ok for r in results)


def test_apply_fixes_skips_elan_when_present(tmp_path, monkeypatch):
    checks = [DoctorCheck("elan", True, True, "ok", None), DoctorCheck("verification workspace", False, True, "x", "y")]
    downloads = []
    monkeypatch.setattr(doctor, "ensure_template", lambda home, runner: home / "template")
    apply_fixes(tmp_path, checks, runner=ok_runner, download=lambda u, d: downloads.append(u))
    assert downloads == []


def test_template_setup_error_reported_not_raised(tmp_path, monkeypatch):
    def boom(home, runner):
        raise doctor.TemplateSetupError("`lake update` failed (exit 1): no network")

    monkeypatch.setattr(doctor, "ensure_template", boom)
    checks = [DoctorCheck("elan", True, True, "ok", None), DoctorCheck("verification workspace", False, True, "x", "y")]
    results = apply_fixes(tmp_path, checks, runner=ok_runner, download=lambda u, d: None)
    assert len(results) == 1 and not results[0].ok and "no network" in results[0].detail


def test_failed_elan_install_skips_template(tmp_path, monkeypatch):
    def runner(args, cwd, timeout_s=None, env=None):
        return CommandResult(list(args), 1, "", "boom", 0.0, False)

    called = []
    monkeypatch.setattr(doctor, "ensure_template", lambda home, runner: called.append(1))
    results = apply_fixes(tmp_path, failing_checks(), runner=runner, download=lambda u, d: d.write_text(""))
    assert called == [] and not results[0].ok


def test_download_failure_reported(tmp_path):
    def download(url, dest):
        raise OSError("offline")

    results = apply_fixes(tmp_path, failing_checks()[:1], runner=ok_runner, download=download)
    assert not results[0].ok and "offline" in results[0].detail


def patch_cli(monkeypatch, tmp_path, checks):
    monkeypatch.setenv("MH_HOME", str(tmp_path))
    monkeypatch.setattr("math_harness.cli.run_doctor", lambda *a, **k: checks)


def test_doctor_exit_code_1_when_required_check_fails(monkeypatch, tmp_path):
    patch_cli(monkeypatch, tmp_path, [DoctorCheck("elan", False, True, "not found", "install")])
    result = CliRunner().invoke(app, ["doctor"])
    assert result.exit_code == 1
    assert "elan" in result.stdout


def test_doctor_exit_code_0_when_only_optional_fails(monkeypatch, tmp_path):
    patch_cli(monkeypatch, tmp_path, [DoctorCheck("elan", True, True, "ok", None), DoctorCheck("codex CLI", False, False, "missing", "x")])
    assert CliRunner().invoke(app, ["doctor"]).exit_code == 0


def test_fix_declined_changes_nothing(monkeypatch, tmp_path):
    patch_cli(monkeypatch, tmp_path, failing_checks())
    applied = []
    monkeypatch.setattr("math_harness.cli.apply_fixes", lambda *a, **k: applied.append(1) or [])
    result = CliRunner().invoke(app, ["doctor", "--fix"], input="n\n")
    assert applied == [] and result.exit_code == 1


def test_fix_confirmed_applies_and_rechecks(monkeypatch, tmp_path):
    state = {"fixed": False}

    def fake_run(*a, **k):
        return [DoctorCheck("elan", state["fixed"], True, "d", None)]

    def fake_apply(*a, **k):
        state["fixed"] = True
        return [DoctorCheck("install elan", True, True, "done", None)]

    monkeypatch.setenv("MH_HOME", str(tmp_path))
    monkeypatch.setattr("math_harness.cli.run_doctor", fake_run)
    monkeypatch.setattr("math_harness.cli.apply_fixes", fake_apply)
    result = CliRunner().invoke(app, ["doctor", "--fix"], input="y\n")
    assert result.exit_code == 0 and "install elan" in result.stdout


def test_fix_runner_has_elan_on_path(tmp_path, monkeypatch):
    monkeypatch.setenv("ELAN_HOME", str(tmp_path / "elan"))
    monkeypatch.setenv("PATH", "/usr/bin")
    envs = []

    def runner(args, cwd, timeout_s=None, env=None):
        envs.append(env)
        return CommandResult(list(args), 0, "", "", 0.0, False)

    monkeypatch.setattr(doctor, "ensure_template", lambda home, runner: runner(["lake", "update"], home))
    apply_fixes(tmp_path, failing_checks(), runner=runner, download=lambda u, d: d.write_text(""))
    assert len(envs) == 2
    assert all(env["PATH"] == f"{tmp_path / 'elan' / 'bin'}{os.pathsep}/usr/bin" for env in envs)


def test_elan_fallback_respects_elan_home(tmp_path, monkeypatch):
    make_elan(tmp_path / "elan" / "bin")
    monkeypatch.setenv("ELAN_HOME", str(tmp_path / "elan"))
    checks = run_doctor(
        tmp_path / "home", PlatformInfo("macos", False), which=lambda _: None, runner=ok_runner, free_bytes=lambda _: BIG
    )
    assert by_name(checks, "elan").ok and by_name(checks, "elan").detail == str(tmp_path / "elan" / "bin" / "elan")


@pytest.mark.parametrize(
    "message",
    [
        "`lake update` failed (exit 1): cannot write [/x/.mh/template/.lake]",
        "boom [/] tail",
        "needs [mathlib] here",
        "esc \x1b[31mred\x1b[0m \x1b]0;spoof\x07 end",
    ],
)
def test_doctor_shows_template_errors_literally(monkeypatch, tmp_path, message):
    def boom(home, runner):
        raise doctor.TemplateSetupError(message)

    patch_cli(monkeypatch, tmp_path, [DoctorCheck("verification workspace", False, True, "not set up", "run fix")])
    monkeypatch.setattr(doctor, "ensure_template", boom)
    result = CliRunner().invoke(app, ["doctor", "--fix"], input="y\n")
    assert result.exit_code == 1 and isinstance(result.exception, SystemExit)
    flat = " ".join(result.stdout.replace("│", " ").split())
    assert "\x1b" not in result.stdout and "\x07" not in result.stdout
    for piece in ("[/x/.mh/template/.lake]", "[/]", "[mathlib]", "red", "end"):
        if piece in message:
            assert piece in flat


def test_output_never_says_solved(monkeypatch, tmp_path):
    patch_cli(monkeypatch, tmp_path, [DoctorCheck("elan", True, True, "ok", None)])
    assert "solved" not in CliRunner().invoke(app, ["doctor"]).stdout.lower()


def make_elan(bin_dir: Path) -> None:
    bin_dir.mkdir(parents=True)
    exe = bin_dir / "elan"
    exe.write_text("#!/bin/sh\n")
    exe.chmod(0o755)


def test_elan_found_via_elan_bin_fallback_when_not_on_path(tmp_path):
    make_elan(tmp_path / "bin")
    checks = run_doctor(
        tmp_path / "home", PlatformInfo("macos", False),
        which=lambda n: None if n == "elan" else f"/usr/bin/{n}",
        runner=ok_runner, free_bytes=lambda _: BIG, elan_bin=tmp_path / "bin",
    )
    assert by_name(checks, "elan").ok


def test_elan_fallback_ignores_non_executable(tmp_path):
    (tmp_path / "bin").mkdir()
    (tmp_path / "bin" / "elan").write_text("")
    checks = run_doctor(
        tmp_path / "home", PlatformInfo("macos", False), which=lambda _: None,
        runner=ok_runner, free_bytes=lambda _: BIG, elan_bin=tmp_path / "bin",
    )
    assert not by_name(checks, "elan").ok


def test_fix_then_recheck_sees_elan_via_fallback_and_exits_0(monkeypatch, tmp_path):
    home = tmp_path / "mhhome"
    bin_dir = tmp_path / "bin"
    monkeypatch.setenv("MH_HOME", str(home))
    real_run_doctor = doctor.run_doctor

    def recheck(h, platform):
        return real_run_doctor(
            h, platform, which=lambda _: None, runner=ok_runner,
            free_bytes=lambda _: BIG, elan_bin=bin_dir,
        )

    def fake_apply(h, checks, **kwargs):
        make_elan(bin_dir)
        mark_ready(h)
        return [DoctorCheck("install elan", True, True, "installed", None)]

    monkeypatch.setattr("math_harness.cli.run_doctor", recheck)
    monkeypatch.setattr("math_harness.cli.apply_fixes", fake_apply)
    result = CliRunner().invoke(app, ["doctor", "--fix"], input="y\n")
    assert result.exit_code == 0, result.stdout


def test_windows_sandbox_check_ok_with_own_only_detail(tmp_path):
    checks = run_doctor(tmp_path, PlatformInfo("windows", False), which=all_present, runner=ok_runner, free_bytes=lambda _: BIG)
    sandbox = by_name(checks, "sandbox")
    assert sandbox.ok and not sandbox.required
    assert sandbox.detail == "own-agent proofs only, unsandboxed"


def test_apply_fixes_on_windows_installs_elan_from_the_release_zip(tmp_path, monkeypatch):
    import zipfile

    calls = []
    downloads = []

    def runner(args, cwd, timeout_s=None, env=None):
        calls.append(list(args))
        return CommandResult(list(args), 0, "", "", 0.0, False)

    def download(url, dest):
        downloads.append(url)
        with zipfile.ZipFile(dest, "w") as archive:
            archive.writestr("elan-init.exe", b"MZ")

    monkeypatch.setattr(doctor, "ensure_template", lambda home, runner: home / "template")
    results = apply_fixes(tmp_path, failing_checks(), runner=runner, download=download, platform=PlatformInfo("windows", False))
    assert downloads == ["https://github.com/leanprover/elan/releases/latest/download/elan-x86_64-pc-windows-msvc.zip"]
    assert calls[0][0].endswith("elan-init.exe") and calls[0][1:] == ["-y", "--default-toolchain", "none"]
    assert all(r.ok for r in results)


def test_elan_exe_in_elan_home_is_found_on_windows(tmp_path, monkeypatch):
    monkeypatch.setattr(doctor, "EXE_SUFFIX", ".exe")
    bin_dir = tmp_path / "elan" / "bin"
    bin_dir.mkdir(parents=True)
    exe = bin_dir / "elan.exe"
    exe.write_bytes(b"MZ")
    exe.chmod(0o755)
    checks = run_doctor(
        tmp_path, PlatformInfo("windows", False), which=lambda _: None, runner=ok_runner, free_bytes=lambda _: BIG, elan_bin=bin_dir
    )
    assert by_name(checks, "elan").ok
