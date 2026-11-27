# Terminal Banner and README Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Bare `mh` shows a responsive half-block banner generated from the brand icon, and the README gets badges, buttons and real terminal screenshots.

**Architecture:** A dev script rasterises `docs/brand/icon.svg` and commits the art as a Python data module of colour cells. `math_harness/ui/banner.py` picks wide, compact or minimal from the console width and renders it with Rich. The CLI callback prints it when no subcommand is given. A screenshot script captures real ANSI output and renders it to PNG for the README.

**Tech Stack:** Python 3.11+, Typer, Rich, pytest; dev-only: `rsvg-convert`, Pillow via `uv run --with pillow`.

**Spec:** `docs/superpowers/specs/2026-11-27-banner-readme-design.md`

## Global Constraints

- Runtime dependencies stay `typer`, `rich`. Pillow is used only by scripts, through `uv run --with pillow`.
- Colours: ink `#121212`, safety orange `#FF5A1F`, paper `#F2EFE8`. Tagline exactly `Checked, not claimed.`. Wordmark `math-harness`.
- Zero code comments, except the four allowed kinds in the user's CLAUDE.md. Conventional commits, subject only.
- README wording: "verified candidate", never "solved".

## Review Focus

- Output piped or redirected (`mh | cat`): no escape codes, plain wordmark only. Test in Task 2.
- `NO_COLOR=1` on a TTY: plain wordmark, no colour cells. Test in Task 2.
- A very narrow terminal (20 columns): minimal layout, no wrapped art. Test in Task 2.
- `mh --json`-style machine output and existing subcommands: no banner printed before them. Test in Task 3.
- `mh --version` still prints exactly `mh 0.1.0`. Existing test covers it, and it must stay green in Task 3.

---

### Task 1: Logo art generated from the icon

**Files:**
- Create: `scripts/gen_logo.py`
- Create: `src/math_harness/ui/__init__.py` (empty), `src/math_harness/ui/logo_art.py` (generated)
- Test: `tests/test_logo_art.py`

**Interfaces:**
- Produces: `LOGO: tuple[tuple[Cell, ...], ...]` in `math_harness.ui.logo_art`, where `Cell = tuple[str | None, str | None]` is `(top_hex, bottom_hex)`, each `"#RRGGBB"` or `None` for transparent. Every row has the same length.

- [ ] **Step 1: Write the failing test**

```python
from math_harness.ui.logo_art import LOGO

def test_logo_is_rectangular_and_small():
    assert 6 <= len(LOGO) <= 12
    widths = {len(row) for row in LOGO}
    assert len(widths) == 1 and 16 <= widths.pop() <= 32

def test_logo_uses_brand_colours():
    colours = {c for row in LOGO for cell in row for c in cell if c}
    assert "#FF5A1F" in colours
```

- [ ] **Step 2: Run it to verify it fails**

Run: `uv run pytest tests/test_logo_art.py -v`. Expected: FAIL, `ModuleNotFoundError`.

- [ ] **Step 3: Implement `scripts/gen_logo.py`**

CLI: `uv run --with pillow python scripts/gen_logo.py [--cols 24]`. It runs `rsvg-convert -w <cols> docs/brand/icon.svg`, reads RGBA with Pillow, pairs pixel rows (top, bottom) into cells, maps alpha < 128 to `None`, snaps each colour to the nearest of the three brand colours (anti-aliased edges otherwise produce dozens of greys), and writes `src/math_harness/ui/logo_art.py` containing only the `LOGO` literal. Run it with the default 24 columns and commit the output.

- [ ] **Step 4: Run the test to verify it passes**

Run: `uv run pytest tests/test_logo_art.py -v`. Expected: PASS.

- [ ] **Step 5: Commit**

`git commit -m "feat: generate terminal logo art from the brand icon"`

### Task 2: Responsive banner renderer

**Files:**
- Create: `src/math_harness/ui/banner.py`
- Test: `tests/test_banner.py`

**Interfaces:**
- Consumes: `LOGO` from Task 1.
- Produces: `render_banner(console: rich.console.Console, version: str) -> None`, and `layout_for(width: int) -> Literal["wide", "compact", "minimal"]`.

Layouts: wide is the art with a block of `math-harness` (bold), `Checked, not claimed.` (dim) and `v{version}` (dim) vertically centred to its right, gap 3, indent 2. Compact is the art, then the same three lines under it. Minimal is `math-harness` alone in bold orange. `WIDE_MIN = 2 + art_width + 3 + len(tagline)` and `COMPACT_MIN = 2 + max(art_width, len(tagline))`, both computed from `LOGO`. Cells render as `▀` (fg = top, bg = bottom), `▄` (fg = bottom), `█`, or space, via `rich.text.Text` styles. When `console.no_color` is true or `not console.is_terminal`, use minimal regardless of width.

- [ ] **Step 1: Write the failing tests**

```python
import io
from rich.console import Console
from math_harness.ui.banner import layout_for, render_banner, WIDE_MIN, COMPACT_MIN

def _render(width, **kw):
    buf = io.StringIO()
    console = Console(file=buf, width=width, force_terminal=kw.get("tty", True), no_color=kw.get("no_color", False), color_system="truecolor")
    render_banner(console, "0.1.0")
    return buf.getvalue()

def test_breakpoints_are_ordered():
    assert COMPACT_MIN < WIDE_MIN
    assert layout_for(WIDE_MIN) == "wide"
    assert layout_for(WIDE_MIN - 1) == "compact"
    assert layout_for(COMPACT_MIN - 1) == "minimal"

def test_wide_has_tagline_beside_art():
    out = _render(WIDE_MIN)
    assert "Checked, not claimed." in out and ("▀" in out or "▄" in out)

def test_narrow_terminal_gets_minimal():
    out = _render(20)
    assert "math-harness" in out and "▀" not in out and "▄" not in out

def test_no_color_gets_plain_wordmark():
    out = _render(120, no_color=True)
    assert "\x1b[38;2" not in out and "math-harness" in out

def test_non_tty_gets_plain_wordmark():
    out = _render(120, tty=False)
    assert "\x1b[" not in out and out.strip() == "math-harness"
```

- [ ] **Step 2: Run them to verify they fail.** `uv run pytest tests/test_banner.py -v`. Expected: FAIL, import error.
- [ ] **Step 3: Implement `banner.py` as specified above.**
- [ ] **Step 4: Run them to verify they pass.** Expected: 5 passed.
- [ ] **Step 5: Commit.** `git commit -m "feat: add responsive terminal banner"`

### Task 3: Show the banner on bare `mh`

**Files:**
- Modify: `src/math_harness/cli.py:20-35` (the `app = typer.Typer(no_args_is_help=True)` line and the `main` callback)
- Test: `tests/test_cli.py`

**Interfaces:**
- Consumes: `render_banner` from Task 2.

Change to `typer.Typer(invoke_without_command=True)`. In `main(ctx: typer.Context, ...)`, when `ctx.invoked_subcommand is None`, call `render_banner(Console(), __version__)`, then print `ctx.get_help()` and exit 0.

- [ ] **Step 1: Write the failing tests**

```python
def test_bare_mh_prints_wordmark_and_commands():
    result = CliRunner().invoke(app, [])
    assert result.exit_code == 0
    assert "math-harness" in result.stdout
    assert "check" in result.stdout and "doctor" in result.stdout

def test_subcommands_print_no_banner():
    result = CliRunner().invoke(app, ["check", "--help"])
    assert "Checked, not claimed." not in result.stdout
```

- [ ] **Step 2: Run them to verify they fail.** `uv run pytest tests/test_cli.py -v`. Expected: `test_bare_mh_prints_wordmark_and_commands` fails, exit code 2 or no wordmark.
- [ ] **Step 3: Implement the callback change.**
- [ ] **Step 4: Run the whole suite.** `uv run pytest -q`. Expected: all pass, including `test_version_flag_prints_version`.
- [ ] **Step 5: Check it by eye.** Run `mh` in a terminal at a width of 100 and of 40, and confirm the wide and compact layouts.
- [ ] **Step 6: Commit.** `git commit -m "feat: show banner when mh runs without a command"`

### Task 4: Screenshots and README

**Files:**
- Create: `scripts/render-ansi.py` (adapted from `cli-citeme/scripts/render-ansi.py`: same block-as-rectangle rendering, background `#121212`), `scripts/screenshots.sh`
- Create: `docs/assets/mh.png`, `docs/assets/doctor.png`, `docs/assets/check.png`
- Modify: `README.md`

`screenshots.sh` captures `FORCE_COLOR=3 COLUMNS=92 uv run mh`, `uv run mh doctor`, and an accepted `uv run mh check` on `tests/fixtures/lean/good_decide` with `--origin own` (needs the Lean workspace; it exports `LAKE_ARTIFACT_CACHE=true LAKE_RESTORE_ARTIFACTS=true` so the check runs in about 2 min), into ANSI files, then calls `uv run --with pillow python scripts/render-ansi.py in.ansi out.png`. Rich must be forced to colour through a pipe: set `FORCE_COLOR`, and confirm Rich honours it, otherwise add `TTY_COMPATIBLE=1`/`COLUMNS`.

README layout, top to bottom: the existing `<picture>` banner; a centred badge row (shields.io static: `license-Apache--2.0`, `python-3.11+`, `Lean-v4.37.0--rc1`, `Mathlib-v4.37.0--rc1`, `status-alpha`) in brand orange `FF5A1F`; two centred "buttons" (shields `for-the-badge` style linking to `#quickstart` and `#how-it-works`); the one-paragraph pitch; `docs/assets/mh.png`; Quickstart (install, `mh doctor --fix`, `mh check`) with `docs/assets/doctor.png` and `docs/assets/check.png`; How it works (the comparator steps as a short list); the existing "What it is and is not" section kept verbatim.

- [ ] **Step 1: Run `scripts/screenshots.sh`.** Expected: three PNGs, with the half-block logo drawn crisply (open them and check).
- [ ] **Step 2: Rewrite the README** as laid out above, and keep the existing honesty wording.
- [ ] **Step 3: Check the result.** Confirm every image path exists (`ls docs/assets`) and that every README link target (`#quickstart`, `#how-it-works`) matches a heading.
- [ ] **Step 4: Commit.** `git commit -m "docs: refresh readme with badges and terminal screenshots"`
