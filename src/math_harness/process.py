import os
import shutil
import signal
import subprocess
import time
from collections.abc import Mapping, Sequence
from dataclasses import dataclass
from pathlib import Path
from typing import Protocol

IS_WINDOWS = os.name == "nt"


def resolve_executable(args: Sequence[str], env: Mapping[str, str] | None, windows: bool = IS_WINDOWS) -> list[str]:
    command = list(args)
    if not windows or env is None or not command:
        return command
    # CreateProcess searches the parent's PATH, not the env given to Popen
    found = shutil.which(command[0], path=env.get("PATH", ""))
    return [found, *command[1:]] if found else command

POST_KILL_GRACE_S = 5


@dataclass(frozen=True)
class CommandResult:
    args: list[str]
    returncode: int
    stdout: str
    stderr: str
    duration_s: float
    timed_out: bool


class CommandRunner(Protocol):
    def __call__(
        self,
        args: Sequence[str],
        cwd: Path,
        timeout_s: float | None = None,
        env: Mapping[str, str] | None = None,
    ) -> CommandResult: ...


def _text(value: str | bytes | None) -> str:
    if value is None:
        return ""
    return value.decode(errors="replace") if isinstance(value, bytes) else value


def run_command(
    args: Sequence[str],
    cwd: Path,
    timeout_s: float | None = None,
    env: Mapping[str, str] | None = None,
) -> CommandResult:
    start = time.monotonic()
    try:
        proc = subprocess.Popen(
            resolve_executable(args, env),
            cwd=cwd,
            env=dict(env) if env is not None else None,
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            encoding="utf-8",
            errors="replace",
            start_new_session=not IS_WINDOWS,
            creationflags=subprocess.CREATE_NEW_PROCESS_GROUP if IS_WINDOWS else 0,
        )
    except OSError as exc:
        return CommandResult(list(args), 127, "", f"{args[0]}: {exc}", time.monotonic() - start, False)
    try:
        stdout, stderr = proc.communicate(timeout=timeout_s)
    except subprocess.TimeoutExpired:
        _kill_group(proc)
        try:
            stdout, stderr = proc.communicate(timeout=POST_KILL_GRACE_S)
        except subprocess.TimeoutExpired as exc:
            stdout, stderr = exc.stdout, exc.stderr
            for pipe in (proc.stdout, proc.stderr):
                if pipe is not None:
                    pipe.close()
        return CommandResult(list(args), -1, _text(stdout), _text(stderr), time.monotonic() - start, True)
    except BaseException:
        _kill_group(proc)
        raise
    return CommandResult(list(args), proc.returncode, stdout, stderr, time.monotonic() - start, False)


def windows_kill_command(pid: int) -> list[str]:
    return ["taskkill", "/T", "/F", "/PID", str(pid)]


def _kill_group(proc: subprocess.Popen[str]) -> None:
    if IS_WINDOWS:
        subprocess.run(windows_kill_command(proc.pid), capture_output=True, check=False)
        proc.kill()
    else:
        try:
            os.killpg(proc.pid, signal.SIGKILL)
        except ProcessLookupError:
            proc.kill()
    proc.wait()
