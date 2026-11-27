import os
import shutil
from collections.abc import Mapping, Sequence
from pathlib import Path

from math_harness.process import CommandResult, CommandRunner


def elan_bin_dir(env: Mapping[str, str] | None = None) -> Path:
    elan_home = (os.environ if env is None else env).get("ELAN_HOME")
    return (Path(elan_home) if elan_home else Path.home() / ".elan") / "bin"


IS_WINDOWS = os.name == "nt"


def git_usr_bin(git_path: str | None) -> Path | None:
    if not git_path:
        return None
    usr_bin = Path(git_path).resolve().parent.parent / "usr" / "bin"
    return usr_bin if (usr_bin / "which.exe").is_file() else None


def windows_which_dir() -> Path | None:
    if shutil.which("which"):
        return None
    return git_usr_bin(shutil.which("git"))


def with_elan_on_path(runner: CommandRunner) -> CommandRunner:
    def wrapped(
        args: Sequence[str],
        cwd: Path,
        timeout_s: float | None = None,
        env: Mapping[str, str] | None = None,
    ) -> CommandResult:
        merged = dict(os.environ if env is None else env)
        bin_dir = str(elan_bin_dir(merged))
        front = [bin_dir]
        which_dir = windows_which_dir() if IS_WINDOWS else None
        if which_dir is not None:
            # lake comparator finds git by spawning `which`, absent on native Windows (Lake/CLI/Check.lean whichExe)
            front.append(str(which_dir))
        rest = [entry for entry in merged.get("PATH", "").split(os.pathsep) if entry and entry not in front]
        merged["PATH"] = os.pathsep.join([*front, *rest])
        return runner(args, cwd, timeout_s, merged)

    return wrapped
