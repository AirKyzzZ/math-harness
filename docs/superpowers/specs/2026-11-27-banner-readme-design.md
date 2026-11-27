# Terminal banner and README refresh

Small change, approved in conversation on 2026-11-27.

## Why
Maxime wants `mh` to feel like a real tool the moment it opens, as `cli-citeme` does, and a README that looks current: badges, buttons, real terminal screenshots. The interactive TUI (`mh` opens a Claude Code-style prompt with slash commands) is decided but belongs to plan 3, because it needs the solve loop to have anything to launch. This change gives it its banner ahead of time.

## Goals
- A responsive half-block truecolor banner, generated from `docs/brand/icon.svg` (`m■h`, ink `#121212`, safety orange `#FF5A1F`), so the art can never drift from the brand.
- Three layouts picked from terminal width: wide (art beside `math-harness`, the tagline "Checked, not claimed." and the version), compact (stacked), minimal (wordmark only). Breakpoints are computed from the art's width, not hard-coded.
- Bare `mh` prints the banner and the command list. `mh --help` keeps Typer's help. `NO_COLOR` and non-TTY output fall back to a plain wordmark.
- README: dark/light banner kept, a badge row (license, Python, pinned Lean/Mathlib, status), "Quickstart" / "How it works" buttons, and 2–3 real terminal screenshots (`mh`, `mh doctor`, an accepted `mh check`).
- A reproducible `scripts/screenshots.sh` + `scripts/render-ansi.py` (as in cli-citeme) that renders block characters as exact rectangles.

## Non-goals
- The TUI itself (plan 3). No GIF/asciinema for now.
- No new runtime dependency: Rich only. Pillow is used only by the screenshot script, through `uv run --with pillow`.

## Anti-goals
- No hype in the README: "verified candidate", never "solved".
- No banner noise on machine output (`--json`, pipes).

## Approaches
- **Chosen: art generated from the SVG** (`rsvg-convert` to a small PNG, then a script turns pixels into `▀▄█` cells with per-cell RGB) and committed as a Python module. The logo stays faithful and is regenerated with one command.
- Hand-drawn ASCII: rejected, because it drifts from the brand.
- figlet-style text logo: rejected, because it ignores the approved `m■h` identity.

## Left to the builder
Exact art size (aim for ~24 columns × 8–10 rows), the placement of the version line, and the badge targets (static shields until CI exists).
