import dataclasses
import json
from enum import Enum
from pathlib import Path

import typer
from rich.console import Console
from rich.panel import Panel
from rich.table import Table
from rich.text import Text

from math_harness import __version__
from math_harness.doctor import DoctorCheck, apply_fixes, run_doctor
from math_harness.gates.lean_gate import GateCouldNotStart, LeanVerdict, SandboxUnavailable, run_lean_gate
from math_harness.lean.workspace import TemplateSetupError, mh_home
from math_harness.platform import detect_platform
from math_harness.receipt import write_receipt
from math_harness.terminal import sanitize, truncate
from math_harness.ui.banner import render_banner

app = typer.Typer(invoke_without_command=True)


def _show_version(value: bool) -> None:
    if value:
        typer.echo(f"mh {__version__}")
        raise typer.Exit()


@app.callback()
def main(
    ctx: typer.Context,
    version: bool = typer.Option(
        False, "--version", callback=_show_version, is_eager=True, help="Show version and exit."
    ),
) -> None:
    if ctx.invoked_subcommand is not None:
        return
    render_banner(Console(), __version__)
    typer.echo(ctx.get_help())
    raise typer.Exit()


def _status(check: DoctorCheck) -> str:
    if check.ok:
        return "[green]ok[/green]"
    return "[red]fail[/red]" if check.required else "[yellow]warn[/yellow]"


def _print_checks(checks: list[DoctorCheck]) -> None:
    table = Table("check", "status", "detail", "fix")
    for check in checks:
        table.add_row(
            Text(sanitize(check.name)), _status(check), Text(truncate(check.detail)), Text(sanitize(check.fix_hint or ""))
        )
    Console(width=120).print(table)


@app.command(help="Check that Lean and the verification workspace are ready.")
def doctor(
    fix: bool = typer.Option(False, "--fix", help="Install missing elan and prepare the verification workspace."),
) -> None:
    home = mh_home()
    platform = detect_platform()
    checks = run_doctor(home, platform)
    fix_results: list[DoctorCheck] = []
    fixable = [c for c in checks if not c.ok and c.name in ("elan", "verification workspace")]
    if fix and fixable:
        names = ", ".join(c.name for c in fixable)
        if typer.confirm(f"This will change your system to fix: {names}. Continue?"):
            fix_results = apply_fixes(home, checks, platform=platform)
            checks = run_doctor(home, platform)
    _print_checks(checks + fix_results)
    required_ok = all(c.ok for c in checks if c.required) and all(c.ok for c in fix_results)
    raise typer.Exit(0 if required_ok else 1)


class OriginChoice(str, Enum):
    own = "own"
    untrusted = "untrusted"


def _print_verdict(verdict: LeanVerdict, receipt: Path | None) -> None:
    body = Text()
    if verdict.accepted:
        body.append("accepted\n" if verdict.sandboxed else "accepted (unsandboxed)\n", style="bold green")
    else:
        body.append("rejected\n", style="bold red")
    body.append(f"sandboxed: {'yes' if verdict.sandboxed else 'no'}\n")
    if verdict.failed_step:
        body.append(f"failed step: {sanitize(verdict.failed_step)}\n")
    if verdict.detail:
        body.append(f"\n{truncate(verdict.detail)}\n")
    if verdict.check_dir:
        body.append(f"\ncheck dir kept: {sanitize(verdict.check_dir)}")
    if receipt:
        body.append(f"\nreceipt: {sanitize(str(receipt))}")
    Console(width=120).print(Panel(body, title="mh check"))


def _fail(message: str) -> None:
    typer.echo(message)
    raise typer.Exit(2)


@app.command(help="Verify a Lean solution against a frozen challenge.")
def check(
    challenge: Path = typer.Option(..., exists=True, dir_okay=False, help="Challenge .lean file."),
    solution: Path = typer.Option(..., exists=True, dir_okay=False, help="Solution .lean file."),
    theorem: list[str] = typer.Option(..., "--theorem", help="Theorem name to compare. Repeatable."),
    origin: OriginChoice = typer.Option(OriginChoice.untrusted, help="Where the solution came from."),
    receipt: Path | None = typer.Option(None, help="Write a JSON receipt to this path."),
    as_json: bool = typer.Option(False, "--json", help="Print the verdict as JSON."),
    keep_check_dir: bool = typer.Option(False, "--keep-check-dir", help="Keep the check directory for debugging."),
) -> None:
    try:
        verdict = run_lean_gate(challenge, solution, theorem, origin.value, keep_check_dir=keep_check_dir)
    except SandboxUnavailable as exc:
        _fail(
            f"sandbox unavailable: {truncate(str(exc))}\n"
            "Untrusted input needs Linux with bubblewrap (container support comes later). "
            "Proofs from your own agents can use --origin own."
        )
    except (GateCouldNotStart, TemplateSetupError, ValueError) as exc:
        _fail(f"could not start: {truncate(str(exc))}")
    if as_json:
        typer.echo(json.dumps(dataclasses.asdict(verdict)))
    else:
        _print_verdict(verdict, receipt)
    if receipt:
        try:
            write_receipt(verdict, challenge, solution, receipt)
        except OSError as exc:
            typer.echo(f"could not write receipt: {' '.join(sanitize(str(exc)).split())}", err=True)
            raise typer.Exit(2)
    raise typer.Exit(0 if verdict.accepted else 1)
