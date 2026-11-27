import json
import shutil
from collections.abc import Mapping, Sequence
from dataclasses import dataclass, replace
from pathlib import Path
from typing import Literal

from math_harness.lean.elan import with_elan_on_path
from math_harness.lean.toolchain import LEAN_TOOLCHAIN
from math_harness.lean.workspace import ensure_template, fresh_check_dir, mh_home
from math_harness.platform import PlatformInfo, detect_platform
from math_harness.process import CommandResult, CommandRunner, run_command

Origin = Literal["own", "untrusted"]

PIPELINE = (
    "resolve_dependencies",
    "build_challenge",
    "export_challenge",
    "build_solution",
    "export_solution",
    "compare_statements",
    "check_axioms",
)
NO_SANDBOX_FLAG = "--inadvisably-no-sandbox"


class GateCouldNotStart(RuntimeError):
    pass


class SandboxUnavailable(RuntimeError):
    pass


@dataclass(frozen=True)
class LeanVerdict:
    accepted: bool
    sandboxed: bool
    failed_step: str | None
    detail: str
    command: list[str]
    lean_toolchain: str
    duration_s: float
    raw_report: dict[str, object]
    check_dir: str | None = None


def _step_detail(step: Mapping[str, object]) -> str:
    output = step.get("output")
    if not isinstance(output, Mapping):
        return ""
    proc = output.get("proc")
    if isinstance(proc, Mapping):
        return f"{proc.get('stderr', '')}{proc.get('stdout', '')}"
    text = output.get("str")
    if isinstance(text, Mapping):
        return str(text.get("string", ""))
    return ""


def _is_success(step: object) -> bool:
    return isinstance(step, Mapping) and step.get("judgement") == "success"


def _first_failure(report: object) -> tuple[str, str] | None:
    if not isinstance(report, Mapping):
        return "report", "comparator report is missing or malformed"
    kernels = report.get("kernel_reports")
    kernel_steps = list(kernels.items()) if isinstance(kernels, Mapping) else []
    for name in PIPELINE:
        step = report.get(name)
        if isinstance(step, Mapping) and step.get("judgement") == "failure":
            return name, _step_detail(step)
    for name, step in kernel_steps:
        if isinstance(step, Mapping) and step.get("judgement") == "failure":
            return f"kernel:{name}", _step_detail(step)
    for name in PIPELINE:
        if not _is_success(report.get(name)):
            return name, "step missing or malformed in comparator report"
    if not kernel_steps:
        return "kernel_reports", "no kernel reports in comparator report"
    for name, step in kernel_steps:
        if not _is_success(step):
            return f"kernel:{name}", "kernel report malformed"
    return None


def verdict_from_result(result: CommandResult) -> LeanVerdict:
    if result.timed_out:
        return LeanVerdict(
            False, False, "timeout", f"lake comparator timed out after {result.duration_s:.0f}s",
            result.args, LEAN_TOOLCHAIN, result.duration_s, {},
        )
    if result.returncode in (2, 127):
        raise GateCouldNotStart(result.stderr.strip() or result.stdout.strip() or f"exit {result.returncode}")
    try:
        parsed = json.loads(result.stdout)
    except json.JSONDecodeError as exc:
        raise GateCouldNotStart(
            f"unparseable comparator output (exit {result.returncode}): {result.stderr.strip() or exc}"
        ) from exc
    if not isinstance(parsed, dict):
        raise GateCouldNotStart(f"unexpected comparator output (exit {result.returncode})")
    sandboxed = NO_SANDBOX_FLAG not in result.args and parsed.get("sandboxed") is True
    failure = _first_failure(parsed.get("report"))
    accepted = result.returncode == 0 and parsed.get("judgement") == "accepted" and failure is None
    failed_step, detail = failure if failure else (None, "")
    if not accepted and failed_step is None:
        failed_step, detail = "report", f"comparator exit {result.returncode}, judgement {parsed.get('judgement')!r}"
    return LeanVerdict(
        accepted, sandboxed, failed_step, detail,
        result.args, LEAN_TOOLCHAIN, result.duration_s, parsed,
    )


def run_lean_gate(
    challenge: Path,
    solution: Path,
    theorem_names: Sequence[str],
    origin: Origin,
    *,
    home: Path | None = None,
    platform: PlatformInfo | None = None,
    runner: CommandRunner = run_command,
    timeout_s: float = 1800,
    keep_check_dir: bool = False,
) -> LeanVerdict:
    if origin not in ("own", "untrusted"):
        raise ValueError(f"unknown origin {origin!r}")
    if isinstance(theorem_names, str) or not theorem_names:
        raise ValueError("theorem_names must be a non-empty list of names")
    for name in theorem_names:
        if not isinstance(name, str) or not name.strip():
            raise ValueError(f"invalid theorem name {name!r}")
    platform = platform or detect_platform()
    if origin != "own" and not platform.has_bwrap:
        raise SandboxUnavailable("bwrap is required to check untrusted proofs; refusing to run unsandboxed")
    runner = with_elan_on_path(runner)
    home = home or mh_home()
    template = ensure_template(home, runner)
    check_dir = fresh_check_dir(template, challenge, solution, theorem_names, home / "runs")
    args = ["lake", "comparator", "--json"]
    if origin == "own" and not platform.has_bwrap:
        args.append(NO_SANDBOX_FLAG)
    try:
        verdict = verdict_from_result(runner(args, check_dir, timeout_s))
    finally:
        if not keep_check_dir:
            shutil.rmtree(check_dir, ignore_errors=True)
    return replace(verdict, check_dir=str(check_dir)) if keep_check_dir else verdict
