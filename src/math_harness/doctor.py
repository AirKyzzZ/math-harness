import os
import shutil
import sys
import tempfile
import urllib.request
import zipfile
from collections.abc import Callable
from dataclasses import dataclass
from pathlib import Path

from math_harness.lean.elan import elan_bin_dir, with_elan_on_path
from math_harness.lean.workspace import CURRENT_MARKER, TemplateSetupError, ensure_template, template_marker
from math_harness.platform import PlatformInfo
from math_harness.process import CommandRunner, run_command

ELAN_INIT_URL = "https://raw.githubusercontent.com/leanprover/elan/master/elan-init.sh"
ELAN_WINDOWS_ZIP_URL = "https://github.com/leanprover/elan/releases/latest/download/elan-x86_64-pc-windows-msvc.zip"
MIN_FREE_BYTES = 10 * 10**9
MIN_PYTHON = (3, 11)
AGENT_VERSION_TIMEOUT_S = 10


@dataclass(frozen=True)
class DoctorCheck:
    name: str
    ok: bool
    required: bool
    detail: str
    fix_hint: str | None


def _free_bytes(path: Path) -> int:
    probe = path
    while not probe.exists() and probe != probe.parent:
        probe = probe.parent
    return shutil.disk_usage(probe).free


def _download(url: str, dest: Path) -> None:
    with urllib.request.urlopen(url, timeout=60) as response:
        dest.write_bytes(response.read())


def _check_python() -> DoctorCheck:
    version = ".".join(str(part) for part in sys.version_info[:3])
    ok = sys.version_info >= MIN_PYTHON
    return DoctorCheck("python", ok, True, version, None if ok else "install Python 3.11 or newer")


def _check_agent_cli(name: str, which: Callable[[str], str | None], runner: CommandRunner) -> DoctorCheck:
    label = f"{name} CLI"
    path = which(name)
    if path is None:
        return DoctorCheck(label, False, False, "not found", f"install the {name} CLI to use its agent")
    result = runner([path, "--version"], Path.cwd(), AGENT_VERSION_TIMEOUT_S)
    if result.timed_out:
        return DoctorCheck(
            label, False, False, f"`{name} --version` timed out after {AGENT_VERSION_TIMEOUT_S}s", f"check the {name} CLI"
        )
    if result.returncode != 0:
        return DoctorCheck(label, False, False, f"`{name} --version` failed", f"reinstall the {name} CLI")
    lines = result.stdout.strip().splitlines()
    return DoctorCheck(label, True, False, lines[0] if lines else path, None)


def _check_sandbox(platform: PlatformInfo) -> DoctorCheck:
    if platform.os in ("macos", "windows"):
        return DoctorCheck("sandbox", True, False, "own-agent proofs only, unsandboxed", None)
    if platform.os == "linux" and platform.has_bwrap:
        return DoctorCheck("sandbox", True, False, "bwrap found", None)
    if platform.os == "linux":
        return DoctorCheck("sandbox", False, False, "bwrap not found", "install bubblewrap (bwrap)")
    return DoctorCheck("sandbox", False, False, "unsupported platform", None)


def run_doctor(
    home: Path,
    platform: PlatformInfo,
    which: Callable[[str], str | None] = shutil.which,
    runner: CommandRunner = run_command,
    free_bytes: Callable[[Path], int] = _free_bytes,
    elan_bin: Path | None = None,
) -> list[DoctorCheck]:
    fallback = (elan_bin or elan_bin_dir()) / "elan"
    elan_path = which("elan") or (str(fallback) if fallback.is_file() and os.access(fallback, os.X_OK) else None)
    elan = (
        DoctorCheck("elan", True, True, elan_path, None)
        if elan_path
        else DoctorCheck("elan", False, True, "not found", "run `mh doctor --fix` or install from https://github.com/leanprover/elan")
    )
    built_for = template_marker(home / "template")
    if built_for == CURRENT_MARKER:
        workspace = DoctorCheck("verification workspace", True, True, str(home / "template"), None)
    elif built_for is None:
        workspace = DoctorCheck("verification workspace", False, True, "not set up", "run `mh doctor --fix`")
    else:
        workspace = DoctorCheck(
            "verification workspace",
            False,
            True,
            f"built for {built_for.strip()}, need {CURRENT_MARKER.strip()}",
            "run `mh doctor --fix`",
        )
    free = free_bytes(home)
    disk = DoctorCheck(
        "disk",
        free >= MIN_FREE_BYTES,
        True,
        f"{free / 10**9:.1f} GB free",
        None if free >= MIN_FREE_BYTES else "free at least 10 GB under the mh home directory",
    )
    return [
        _check_python(),
        elan,
        workspace,
        disk,
        _check_sandbox(platform),
        _check_agent_cli("claude", which, runner),
        _check_agent_cli("codex", which, runner),
    ]


def _install_elan(runner: CommandRunner, download: Callable[[str, Path], None], windows: bool = False) -> DoctorCheck:
    name = "install elan"
    with tempfile.TemporaryDirectory() as tmp:
        try:
            if windows:
                archive = Path(tmp) / "elan.zip"
                download(ELAN_WINDOWS_ZIP_URL, archive)
                with zipfile.ZipFile(archive) as zipped:
                    zipped.extract("elan-init.exe", tmp)
                command = [str(Path(tmp) / "elan-init.exe")]
            else:
                script = Path(tmp) / "elan-init.sh"
                download(ELAN_INIT_URL, script)
                command = ["sh", str(script)]
        except (OSError, zipfile.BadZipFile, KeyError) as exc:
            return DoctorCheck(name, False, True, f"download failed: {exc}", None)
        result = runner([*command, "-y", "--default-toolchain", "none"], Path(tmp))
    if result.returncode != 0:
        detail = result.stderr.strip() or result.stdout.strip()
        return DoctorCheck(name, False, True, f"exit {result.returncode}: {detail}", None)
    return DoctorCheck(name, True, True, "installed", None)


def apply_fixes(
    home: Path,
    checks: list[DoctorCheck],
    runner: CommandRunner = run_command,
    download: Callable[[str, Path], None] = _download,
    platform: PlatformInfo | None = None,
) -> list[DoctorCheck]:
    failing = {c.name for c in checks if not c.ok}
    runner = with_elan_on_path(runner)
    results: list[DoctorCheck] = []
    if "elan" in failing:
        install = _install_elan(runner, download, windows=platform is not None and platform.os == "windows")
        results.append(install)
        if not install.ok:
            return results
    if "verification workspace" in failing:
        name = "prepare workspace"
        try:
            ensure_template(home, runner=runner)
        except TemplateSetupError as exc:
            results.append(DoctorCheck(name, False, True, str(exc), None))
        else:
            results.append(DoctorCheck(name, True, True, "ready", None))
    return results
