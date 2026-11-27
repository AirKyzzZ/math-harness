# mh Verification Core Implementation Plan

> **Amendment, 2026-11-27:** the pin moved from v4.36.0 to `leanprover/lean4:v4.37.0-rc1` with Mathlib `v4.37.0-rc1`. On v4.36.0 `lake comparator` has no `--json` (the flag is silently ignored and stdout is a text log), and the JSON report the gate parses only exists from v4.37.0-rc1, see `docs/spike-comparator.md`. Mentions of v4.36.0 below are historical. Also corrected during implementation: comparator runs `build_challenge`, `export_challenge`, `build_solution`, `export_solution` in that order (Task 4 had the middle two swapped), `renamed_theorem` fails at `export_solution` and is now asserted like the other cases, and Task 5 gains the spec's `implemented_by_trick` and `redefined_mathlib_name` fixtures.

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Ship the trust core of `mh`: a pinned Lean verification workspace, the Lean gate (gate 1) built on `lake comparator`, a fixture suite proving the gate rejects every known cheat, and the `mh doctor` and `mh check` commands.

**Architecture:** A Python package wraps `lake comparator --json` from Lean v4.36.0. Each check copies only `Challenge.lean`, `Solution.lean`, the lakefile, toolchain and manifest into a fresh directory (comparator requires no pre-existing `.lake`), runs comparator, and turns its JSON report into a `LeanVerdict`. Sandboxing uses bubblewrap where available; on macOS only proofs from the user's own agents may run with `--inadvisably-no-sandbox`.

**Tech Stack:** Python 3.11+, uv, hatchling, Typer, Rich, pytest. Lean `leanprover/lean4:v4.36.0` with Mathlib `v4.36.0`.

**Spec:** `docs/superpowers/specs/2026-11-26-math-harness-design.md`

**Roadmap (separate plans, written after this one ships):**
1. Verification core (this plan).
2. Catalogue: extract open `@[category research open]` theorems and `@[question]` yes/no propositions from formal-conjectures, strip FC metadata, recompile on our pin, join teorth/erdosproblems statuses, generate affirm and negated challenges, `mh list` / `mh show`.
3. Agents and solve loop: Claude Code and Codex adapters (including `mh doctor` login-state checks), parallel attempts, gate 2 cross-model audit, notes merge, statuses table, Rich live view, `mh solve` / `mh status`.
4. Trust outputs: literature gate, submission package, full `mh check` (gate 2 + literature, Linux container for untrusted input on macOS), API-mode cost estimate.

## Global Constraints

- All paths are relative to the repository root (`math-harness/`). Python package `math_harness`, console script `mh`.
- Python `>=3.11`. Runtime deps: `typer`, `rich` only. Dev deps: `pytest`.
- Lean toolchain pin `leanprover/lean4:v4.36.0`; Mathlib `rev = "v4.36.0"`. Comparator ships in Lean core since v4.35.0.
- `permitted_axioms` is exactly `["propext", "Quot.sound", "Classical.choice"]`.
- No output, status or message ever says "solved". The gate says "accepted" or "rejected".
- `mh` never reads, stores or prompts for any credential or credential file.
- On a machine without `bwrap`, `--inadvisably-no-sandbox` is allowed only when `origin == "own"`. `origin == "untrusted"` without `bwrap` must refuse.
- Subprocesses are always called with an argument list, never `shell=True`.
- Code comments: zero by default. Only a hidden constraint, a non-obvious invariant, an upstream-bug workaround, or surprising platform behaviour earns one, as a single short line. No docstrings on clearly named functions.
- Commits: conventional, subject only, one line. Work on branch `feature/verification-core`. Never push.
- Default test run excludes Lean integration tests: `addopts = "-m 'not lean'"`. Integration tests carry `@pytest.mark.lean`.

## Review Focus

1. A `Solution.lean` that does not compile must yield a rejected verdict with `failed_step == "build_solution"` and the compiler output in `detail`, never a traceback. (Task 4 unit test, Task 5 fixture `does_not_compile`.)
2. A solution that renamed the theorem must be rejected with a readable reason. (Task 5 fixture `renamed_theorem`.)
3. A challenge or solution path sitting next to an existing `.lake` must never carry that `.lake` into the check directory. (Task 3 unit test.)
4. First-time workspace setup failing (no network, disk full) must surface as `TemplateSetupError` with the failing command's stderr, and `mh doctor` must report it as a failed check. (Task 3 and Task 7 unit tests.)
5. A comparator run that hangs must end at `timeout_s` as a rejected verdict with `failed_step == "timeout"`. (Task 4 unit test.)

---

### Task 1: Repository scaffold and CLI entry point

**Files:**
- Create: `math-harness/pyproject.toml`, `math-harness/.gitignore`, `math-harness/LICENSE` (Apache-2.0), `math-harness/README.md`, `math-harness/src/math_harness/__init__.py`, `math-harness/src/math_harness/cli.py`
- Move: `maths/docs/superpowers/specs/2026-11-26-math-harness-design.md` and this plan into `math-harness/docs/superpowers/`
- Test: `math-harness/tests/test_cli.py`

**Interfaces:**
- Produces: `math_harness.__version__ = "0.1.0"`; `math_harness.cli.app: typer.Typer`; console script `mh = "math_harness.cli:app"`.

- [ ] **Step 1:** `git init` in `math-harness`, initial commit `chore: initial commit` with `.gitignore` (Python, `.venv`, `.lake`, `spike/`) only, then `git switch -c feature/verification-core`.
- [ ] **Step 2: Write the failing test**

```python
from typer.testing import CliRunner
from math_harness.cli import app

def test_version_flag_prints_version():
    result = CliRunner().invoke(app, ["--version"])
    assert result.exit_code == 0
    assert result.stdout.strip() == "mh 0.1.0"
```

- [ ] **Step 3:** Run `uv run pytest tests/test_cli.py -q`. Expected: FAIL (module not found).
- [ ] **Step 4:** Write `pyproject.toml` (hatchling, `src` layout, deps and `addopts` from Global Constraints, `markers = ["lean: needs a Lean toolchain"]`), `__init__.py`, and `cli.py` with a Typer app and an eager `--version` option.
- [ ] **Step 5:** Run `uv run pytest -q`. Expected: PASS.
- [ ] **Step 6:** Commit `feat: scaffold mh package and cli entry point`.

### Task 2: Comparator feasibility spike (throwaway, decides whether the plan continues)

**Files:**
- Create: `math-harness/spike/` (git-ignored scratch), `math-harness/tests/data/comparator_accepted.json`, `math-harness/tests/data/comparator_rejected_sorry.json`, `math-harness/docs/spike-comparator.md`

- [ ] **Step 1:** Check `elan --version`. If elan is missing, ask the user before installing it.
- [ ] **Step 2:** In `spike/template/`, write `lean-toolchain` (`leanprover/lean4:v4.36.0`) and the lakefile below, then run `lake update` and `lake exe cache get`.

```toml
name = "mhcheck"

[[require]]
name = "mathlib"
git = "https://github.com/leanprover-community/mathlib4"
rev = "v4.36.0"

[[lean_lib]]
name = "Challenge"

[[lean_lib]]
name = "Solution"
```

- [ ] **Step 3:** Create `spike/run1/` containing only `lakefile.toml`, `lean-toolchain`, `lake-manifest.json` copied from the template, plus:

```lean
-- Challenge.lean
import Mathlib.Data.Nat.Prime.Basic
theorem two_prime : Nat.Prime 2 := by sorry
```
```lean
-- Solution.lean
import Mathlib.Data.Nat.Prime.Basic
theorem two_prime : Nat.Prime 2 := Nat.prime_two
```
and `comparator.json` with `challenge_module "Challenge"`, `solution_module "Solution"`, `theorem_names ["two_prime"]`, and the permitted axioms.

- [ ] **Step 4:** Run `/usr/bin/time -p lake comparator --json --inadvisably-no-sandbox > report.json` in `spike/run1`. Record exit code, wall time, and whether Mathlib was rebuilt or fetched. Save the report as `tests/data/comparator_accepted.json`.
- [ ] **Step 5:** Repeat in a new `spike/run2/` (warm run). Then `spike/run3/` with `Solution.lean` proving `two_prime` by `sorry`; save that report as `tests/data/comparator_rejected_sorry.json`.
- [ ] **Step 6: Decision rule.** If the warm run finishes in 300 s or less, continue. If not, try variant B once: copy the template's `.lake/packages` (trusted dependencies only, no build outputs) into a fresh dir and rerun. If comparator refuses variant B or it is still over 300 s, **stop and report the measurements to the user**. Do not invent another workaround.
- [ ] **Step 7:** Write `docs/spike-comparator.md`: commands, cold and warm times, Mathlib behaviour, chosen variant, and the exact step names seen in the reports. Commit `docs: record comparator feasibility spike` with the two JSON files.

### Task 3: Toolchain constants, platform detection, and the verification workspace

**Files:**
- Create: `src/math_harness/process.py`, `src/math_harness/platform.py`, `src/math_harness/lean/__init__.py`, `src/math_harness/lean/toolchain.py`, `src/math_harness/lean/workspace.py`
- Test: `tests/test_platform.py`, `tests/test_workspace.py`

**Interfaces:**
- Produces:
  - `process.CommandResult(args: list[str], returncode: int, stdout: str, stderr: str, duration_s: float, timed_out: bool)` (frozen dataclass)
  - `process.run_command(args: Sequence[str], cwd: Path, timeout_s: float | None = None, env: Mapping[str, str] | None = None) -> CommandResult`, which returns `timed_out=True` and `returncode=-1` on timeout instead of raising
  - `process.CommandRunner`: a `Protocol` matching `run_command`
  - `toolchain.LEAN_TOOLCHAIN = "leanprover/lean4:v4.36.0"`, `toolchain.MATHLIB_REV = "v4.36.0"`, `toolchain.PERMITTED_AXIOMS = ("propext", "Quot.sound", "Classical.choice")`
  - `platform.PlatformInfo(os: Literal["linux", "macos", "other"], has_bwrap: bool)`, `platform.detect_platform(which: Callable[[str], str | None] = shutil.which) -> PlatformInfo`
  - `workspace.mh_home() -> Path` (`$MH_HOME` or `~/.mh`)
  - `workspace.TemplateSetupError(RuntimeError)`
  - `workspace.ensure_template(home: Path, runner: CommandRunner = run_command) -> Path` returns `home / "template"`, writes the Task 2 lakefile and toolchain, runs `lake update` and `lake exe cache get`, and is a no-op when `lake-manifest.json` and `.lake/packages/mathlib` already exist
  - `workspace.fresh_check_dir(template: Path, challenge: Path, solution: Path, theorem_names: Sequence[str], parent: Path) -> Path`, which creates a new directory under `parent` holding exactly `lakefile.toml`, `lean-toolchain`, `lake-manifest.json`, `Challenge.lean`, `Solution.lean`, `comparator.json` (plus `.lake/packages` only if Task 2 chose variant B)

- [ ] **Step 1: Write the failing tests**

```python
def test_detect_platform_macos_without_bwrap(monkeypatch):
    monkeypatch.setattr(sys, "platform", "darwin")
    assert detect_platform(which=lambda _: None) == PlatformInfo(os="macos", has_bwrap=False)

def test_fresh_check_dir_has_exact_files_and_config(tmp_path, template_dir):
    challenge_src = tmp_path / "in"; challenge_src.mkdir()
    (challenge_src / ".lake").mkdir()
    (challenge_src / "Challenge.lean").write_text("theorem t : True := by sorry")
    (challenge_src / "Solution.lean").write_text("theorem t : True := trivial")
    d = fresh_check_dir(template_dir, challenge_src / "Challenge.lean", challenge_src / "Solution.lean", ["t"], tmp_path / "runs")
    assert sorted(p.name for p in d.iterdir()) == ["Challenge.lean", "Solution.lean", "comparator.json", "lake-manifest.json", "lakefile.toml", "lean-toolchain"]
    assert json.loads((d / "comparator.json").read_text()) == {
        "challenge_module": "Challenge", "solution_module": "Solution",
        "theorem_names": ["t"], "permitted_axioms": ["propext", "Quot.sound", "Classical.choice"]}

def test_ensure_template_raises_with_stderr_when_lake_update_fails(tmp_path):
    def failing(args, cwd, timeout_s=None, env=None):
        return CommandResult(list(args), 1, "", "error: could not resolve host", 0.1, False)
    with pytest.raises(TemplateSetupError, match="could not resolve host"):
        ensure_template(tmp_path, runner=failing)
```

`template_dir` is a fixture in `tests/conftest.py` that builds a fake template with the three config files and no `.lake`.

- [ ] **Step 2:** Run `uv run pytest tests/test_platform.py tests/test_workspace.py -q`. Expected: FAIL (imports).
- [ ] **Step 3:** Implement the interfaces above. `fresh_check_dir` names the directory with a UTC timestamp plus a short random suffix.
- [ ] **Step 4:** Run `uv run pytest -q`. Expected: PASS.
- [ ] **Step 5:** Commit `feat: add pinned lean verification workspace`.

### Task 4: Lean gate runner and verdict

**Files:**
- Create: `src/math_harness/gates/__init__.py`, `src/math_harness/gates/lean_gate.py`, `src/math_harness/receipt.py`
- Test: `tests/test_lean_gate.py`, `tests/test_receipt.py`

**Interfaces:**
- Consumes: Task 3 `CommandResult`, `run_command`, `CommandRunner`, `PlatformInfo`, `detect_platform`, `ensure_template`, `fresh_check_dir`, `LEAN_TOOLCHAIN`, `MATHLIB_REV`.
- Produces:
  - `lean_gate.Origin = Literal["own", "untrusted"]`
  - `lean_gate.GateCouldNotStart(RuntimeError)`, `lean_gate.SandboxUnavailable(RuntimeError)`
  - `lean_gate.LeanVerdict(accepted: bool, sandboxed: bool, failed_step: str | None, detail: str, command: list[str], lean_toolchain: str, duration_s: float, raw_report: dict[str, object])` (frozen dataclass)
  - `lean_gate.verdict_from_result(result: CommandResult) -> LeanVerdict`
  - `lean_gate.run_lean_gate(challenge: Path, solution: Path, theorem_names: Sequence[str], origin: Origin, *, home: Path | None = None, platform: PlatformInfo | None = None, runner: CommandRunner = run_command, timeout_s: float = 1800) -> LeanVerdict`
  - `receipt.write_receipt(verdict: LeanVerdict, challenge: Path, solution: Path, path: Path) -> None`, which writes JSON with keys `mh_version`, `created_utc`, `challenge_sha256`, `solution_sha256`, `lean_toolchain`, `mathlib_rev`, `command`, `sandboxed`, `accepted`, `failed_step`, `detail`, `duration_s`

`failed_step` is the first step in the report, in pipeline order, whose `judgement` is not `"success"`: `resolve_dependencies`, `build_challenge`, `build_solution`, `export_challenge`, `export_solution`, `compare_statements`, `check_axioms`, then each `kernel_reports` entry as `kernel:<name>`. Use the step names recorded in `docs/spike-comparator.md` if they differ. `detail` is that step's `stderr` + `stdout`, or its `string` output.

- [ ] **Step 1: Write the failing tests**

```python
def test_accepted_report_yields_accepted_verdict():
    report = (DATA / "comparator_accepted.json").read_text()
    v = verdict_from_result(CommandResult(["lake", "comparator"], 0, report, "", 12.0, False))
    assert v.accepted and v.failed_step is None

def test_sorry_report_names_failing_step():
    report = (DATA / "comparator_rejected_sorry.json").read_text()
    v = verdict_from_result(CommandResult(["lake", "comparator"], 1, report, "", 12.0, False))
    assert not v.accepted and v.failed_step == "check_axioms"

def test_build_failure_is_a_verdict_not_a_crash():
    report = {"sandboxed": False, "judgement": "rejected", "report": {
        "build_solution": {"output": {"proc": {"stdout": "", "stderr": "unknown identifier 'foo'"}}, "judgement": "failure"}}}
    v = verdict_from_result(CommandResult(["lake", "comparator"], 1, json.dumps(report), "", 3.0, False))
    assert v.failed_step == "build_solution" and "unknown identifier 'foo'" in v.detail

def test_exit_code_2_raises_could_not_start():
    with pytest.raises(GateCouldNotStart):
        verdict_from_result(CommandResult(["lake", "comparator"], 2, "", "bwrap not found", 0.1, False))

def test_timeout_is_rejected_verdict():
    v = verdict_from_result(CommandResult(["lake", "comparator"], -1, "", "", 1800.0, True))
    assert not v.accepted and v.failed_step == "timeout"

def test_untrusted_without_bwrap_refuses(tmp_path):
    with pytest.raises(SandboxUnavailable):
        run_lean_gate(tmp_path / "C.lean", tmp_path / "S.lean", ["t"], "untrusted",
                      home=tmp_path, platform=PlatformInfo(os="macos", has_bwrap=False))

def test_own_without_bwrap_passes_no_sandbox_flag(tmp_path, fake_template, recording_runner):
    run_lean_gate(C, S, ["t"], "own", home=fake_template.home,
                  platform=PlatformInfo(os="macos", has_bwrap=False), runner=recording_runner)
    assert recording_runner.calls[-1][:2] == ["lake", "comparator"]
    assert "--inadvisably-no-sandbox" in recording_runner.calls[-1] and "--json" in recording_runner.calls[-1]
```

`C`, `S`, `fake_template` (a home whose template already looks set up, so `ensure_template` is a no-op) and `recording_runner` (records each `args` list and returns the accepted report) live in `tests/conftest.py`. Expected step names follow `docs/spike-comparator.md` wherever the spike recorded different ones.

Add a receipt test asserting the twelve keys and that `challenge_sha256` equals `hashlib.sha256(challenge.read_bytes()).hexdigest()`.

- [ ] **Step 2:** Run `uv run pytest tests/test_lean_gate.py tests/test_receipt.py -q`. Expected: FAIL.
- [ ] **Step 3:** Implement. `run_lean_gate` checks the sandbox rule before touching the filesystem, calls `ensure_template`, builds a `fresh_check_dir` under `home / "runs"`, and runs `lake comparator --json` (plus `--inadvisably-no-sandbox` when allowed) with `timeout_s`.
- [ ] **Step 4:** Run `uv run pytest -q`. Expected: PASS.
- [ ] **Step 5:** Commit `feat: add lean gate on lake comparator`.

### Task 5: Cheat fixture suite (the pass/fail signal)

**Files:**
- Create: `tests/fixtures/lean/<case>/Challenge.lean`, `Solution.lean`, `case.json` (`{"theorem_names": [...], "expect_accepted": bool, "expect_failed_step": str | null}`) for each case below
- Test: `tests/integration/test_lean_gate_fixtures.py`

**Interfaces:**
- Consumes: Task 4 `run_lean_gate`, `LeanVerdict`.

| Case | Solution does | Expected |
|---|---|---|
| `good_core` | `theorem t (n : Nat) : n + 0 = n := rfl` | accepted |
| `good_mathlib` | `Nat.Prime 2` via `Nat.prime_two` | accepted |
| `good_decide` | `theorem t : 2 ^ 10 = 1024 := by decide` | accepted |
| `good_disproof` | challenge `theorem t : ¬ ∀ n : Nat, n < 5`, solution proves it | accepted |
| `sorry` | proof by `sorry` | rejected, `check_axioms` |
| `extra_axiom` | `axiom cheat : False` then `cheat.elim` | rejected, `check_axioms` |
| `native_decide` | `by native_decide` | rejected, `check_axioms` |
| `edited_statement` | same name, proves `n + 0 = n ∨ True` | rejected, `compare_statements` |
| `weakened_statement` | adds hypothesis `(h : False)` | rejected, `compare_statements` |
| `redefined_local_def` | challenge defines `def good (n : Nat) : Prop := n + 0 = n` and states `∀ n, good n`; solution redefines `good` as `True` | rejected, `compare_statements` |
| `renamed_theorem` | proves the statement under name `t'` | rejected, readable `detail` |
| `does_not_compile` | syntax error | rejected, `build_solution` |

- [ ] **Step 1:** Write the fixtures and one parametrized test marked `@pytest.mark.lean` that runs `run_lean_gate(..., origin="own")` on each case and asserts `accepted` and `failed_step` against `case.json`. For `renamed_theorem`, assert only `not accepted` and a non-empty `detail`.
- [ ] **Step 2:** Run `uv run pytest -m lean tests/integration -q`. Expected: every case matches. Any bad case that is accepted is a blocker: stop and report it to the user.
- [ ] **Step 3:** Commit `test: add lean gate cheat fixtures`.

### Task 6: `mh check` command

**Files:**
- Modify: `src/math_harness/cli.py`
- Test: `tests/test_cli_check.py`

**Interfaces:**
- Consumes: Task 4 `run_lean_gate`, `write_receipt`, `GateCouldNotStart`, `SandboxUnavailable`.
- Produces: `mh check --challenge PATH --solution PATH --theorem NAME [--theorem NAME ...] [--origin own|untrusted] [--receipt PATH] [--json]`. Default origin is `untrusted`. Exit codes: 0 accepted, 1 rejected, 2 could not start or sandbox unavailable.

- [ ] **Step 1: Write the failing tests** (monkeypatch `math_harness.cli.run_lean_gate`)

```python
def test_check_accepted_exits_0_and_says_accepted(monkeypatch, tmp_path):
    monkeypatch.setattr(cli, "run_lean_gate", lambda *a, **k: ACCEPTED)
    r = CliRunner().invoke(cli.app, ["check", "--challenge", str(C), "--solution", str(S), "--theorem", "t", "--origin", "own"])
    assert r.exit_code == 0 and "accepted" in r.stdout.lower() and "solved" not in r.stdout.lower()

def test_check_rejected_exits_1_and_names_step(monkeypatch):
    monkeypatch.setattr(cli, "run_lean_gate", lambda *a, **k: REJECTED_COMPARE)
    r = CliRunner().invoke(cli.app, [...same args...])
    assert r.exit_code == 1 and "compare_statements" in r.stdout

def test_check_untrusted_on_macos_exits_2_with_hint(monkeypatch):
    def refuse(*a, **k): raise SandboxUnavailable("bubblewrap is Linux-only")
    monkeypatch.setattr(cli, "run_lean_gate", refuse)
    r = CliRunner().invoke(cli.app, ["check", "--challenge", str(C), "--solution", str(S), "--theorem", "t"])
    assert r.exit_code == 2 and "--origin own" in r.stdout

def test_check_writes_receipt_when_asked(monkeypatch, tmp_path): ...
def test_check_json_flag_prints_verdict_json(monkeypatch): ...
```

- [ ] **Step 2:** Run `uv run pytest tests/test_cli_check.py -q`. Expected: FAIL.
- [ ] **Step 3:** Implement the command. Human output is a Rich panel: verdict, sandboxed yes/no, failed step, detail (truncated to 40 lines), receipt path. On `SandboxUnavailable`, print that untrusted input needs Linux with bubblewrap (container support comes in plan 4) and that proofs from your own agents can use `--origin own`.
- [ ] **Step 4:** Run `uv run pytest -q`. Expected: PASS. Then run `uv run mh check` against `tests/fixtures/lean/good_core` with `--origin own` and confirm exit 0.
- [ ] **Step 5:** Commit `feat: add mh check command`.

### Task 7: `mh doctor` command

**Files:**
- Create: `src/math_harness/doctor.py`
- Modify: `src/math_harness/cli.py`
- Test: `tests/test_doctor.py`

**Interfaces:**
- Consumes: Task 3 `PlatformInfo`, `ensure_template`, `TemplateSetupError`, `CommandRunner`, `mh_home`.
- Produces: `doctor.DoctorCheck(name: str, ok: bool, required: bool, detail: str, fix_hint: str | None)`; `doctor.run_doctor(home: Path, platform: PlatformInfo, which: Callable[[str], str | None] = shutil.which, runner: CommandRunner = run_command, free_bytes: Callable[[Path], int] = ...) -> list[DoctorCheck]`; `mh doctor [--fix]`, which exits 0 when every required check is ok and 1 otherwise.

Checks, in order: `python` (required, `>=3.11`), `elan` (required), `verification workspace` (required, template ready), `disk` (required, at least 10 GB free under `home`), `sandbox` (not required; Linux: bwrap present; macOS: ok with detail "own-agent proofs only, unsandboxed"), `claude CLI` and `codex CLI` (not required in this plan; presence via `which` and `--version` only). `--fix` asks for confirmation, then installs elan with the official `elan-init.sh` (`-y --default-toolchain none`) if missing, then calls `ensure_template`.

- [ ] **Step 1: Write the failing tests**

```python
def test_missing_elan_is_required_failure(tmp_path):
    checks = run_doctor(tmp_path, PlatformInfo("macos", False), which=lambda _: None, runner=ok_runner, free_bytes=lambda _: 50 * 10**9)
    elan = next(c for c in checks if c.name == "elan")
    assert not elan.ok and elan.required and elan.fix_hint

def test_low_disk_fails(tmp_path):
    checks = run_doctor(tmp_path, PlatformInfo("linux", True), which=all_present, runner=ok_runner, free_bytes=lambda _: 2 * 10**9)
    assert not next(c for c in checks if c.name == "disk").ok

def test_template_setup_error_reported_not_raised(tmp_path): ...
def test_macos_sandbox_check_ok_with_own_only_detail(tmp_path): ...
def test_doctor_exit_code_1_when_required_check_fails(monkeypatch): ...
def test_doctor_never_opens_credential_paths(tmp_path, monkeypatch):
    opened = []
    real_open = builtins.open
    monkeypatch.setattr(builtins, "open", lambda p, *a, **k: (opened.append(str(p)), real_open(p, *a, **k))[1])
    run_doctor(tmp_path, PlatformInfo("macos", False), which=all_present, runner=ok_runner, free_bytes=lambda _: 50 * 10**9)
    assert not any(s in p for p in opened for s in (".ssh", ".aws", "auth.json", ".claude", ".codex"))
```

- [ ] **Step 2:** Run `uv run pytest tests/test_doctor.py -q`. Expected: FAIL.
- [ ] **Step 3:** Implement `run_doctor` and the `doctor` command (Rich table: check, status, detail, fix hint).
- [ ] **Step 4:** Run `uv run pytest -q` and `uv run mh doctor` on this machine. Expected: tests PASS; doctor prints the table and exits 0 once elan and the workspace are set up.
- [ ] **Step 5:** Commit `feat: add mh doctor command`.

### Task 8: README and final verification

**Files:**
- Modify: `README.md`

- [ ] **Step 1:** README covers: what `mh` is and is not (no "solved" claims, never posts for you), install with `uv tool install`, `mh doctor --fix`, `mh check` usage and exit codes, the macOS sandbox caveat, and the roadmap of plans 2 to 4. Short, plain prose.
- [ ] **Step 2:** Run `uv run pytest -q` and `uv run pytest -m lean -q`. Expected: both PASS.
- [ ] **Step 3:** Commit `docs: add readme for verification core`.
