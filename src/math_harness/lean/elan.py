import os
from collections.abc import Mapping, Sequence
from pathlib import Path

from math_harness.process import CommandResult, CommandRunner


def elan_bin_dir(env: Mapping[str, str] | None = None) -> Path:
    elan_home = (os.environ if env is None else env).get("ELAN_HOME")
    return (Path(elan_home) if elan_home else Path.home() / ".elan") / "bin"


def with_elan_on_path(runner: CommandRunner) -> CommandRunner:
    def wrapped(
        args: Sequence[str],
        cwd: Path,
        timeout_s: float | None = None,
        env: Mapping[str, str] | None = None,
    ) -> CommandResult:
        merged = dict(os.environ if env is None else env)
        bin_dir = str(elan_bin_dir(merged))
        rest = [entry for entry in merged.get("PATH", "").split(os.pathsep) if entry and entry != bin_dir]
        merged["PATH"] = os.pathsep.join([bin_dir, *rest])
        return runner(args, cwd, timeout_s, merged)

    return wrapped
