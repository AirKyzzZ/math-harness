# math-harness

Verify AI-generated Lean proofs. It wraps `lake comparator` so you get a clear accepted or rejected answer for a proof against a fixed challenge statement. The command is `math-harness`, and `mh` is a short alias.

## What it is and is not

It checks that a Lean solution proves exactly the theorem in the challenge file, using the official comparator, and it writes an optional JSON receipt of the run.

It never claims a problem is "solved". Today `mh check` says accepted or rejected. The strongest status planned later is "verified candidate". It never posts or submits anything for you. And Lean-verified does not mean new or significant: a proof can be correct and already known, or about a statement that does not matter.

## Install

Not on PyPI yet. From a git clone:

```
uv tool install .
```

Once published:

```
uv tool install math-harness
```

Then let the tool set up Lean:

```
mh doctor --fix
```

`doctor` reports what is missing. With `--fix` it asks for confirmation, then installs `elan`, a pinned Lean toolchain, and prepares the verification workspace. The first run takes a while because it downloads Mathlib.

Everything `mh` keeps lives in `~/.mh`, set `MH_HOME` to put it somewhere else. The verification workspace there takes about 8 GB, mostly Mathlib, so `doctor` asks for at least 10 GB free.

## Check a proof

```
mh check --challenge Challenge.lean --solution Solution.lean --theorem my_theorem
```

Options:

- `--theorem NAME`, repeatable, the theorems to compare.
- `--origin own|untrusted`, where the solution came from. Default is `untrusted`.
- `--receipt PATH`, write a basic JSON receipt: hashes of both files, toolchain, command and verdict.
- `--json`, print the verdict as JSON.
- `--keep-check-dir`, keep the directory the check ran in and print its path, for debugging.

Exit codes: 0 accepted, 1 rejected, 2 could not start (missing toolchain, bad input, sandbox unavailable) or the receipt could not be written. The verdict is always printed before the receipt is written.

A check takes roughly 1 to 3 minutes on a recent Mac, since each run builds in a fresh directory under `~/.mh/runs`. That directory is about 200 MB, or 2 GB when the files import Mathlib, and it is deleted when the check ends unless you pass `--keep-check-dir`.

## Sandbox caveat

Untrusted proofs are run inside a bubblewrap sandbox, which is Linux-only. On macOS only `--origin own` works, and it runs unsandboxed, so a passing check says `accepted (unsandboxed)`. Do not check untrusted input on macOS. Use Linux, or wait for container support, which is on the roadmap.

## Roadmap

1. Verification core: `doctor`, `check` and a basic `--receipt` (this release).
2. Catalogue of problems to attempt.
3. Agents and a solve loop driven by your own `claude` and `codex` CLIs.
4. Trust outputs: fuller receipts and reports, and container-based sandboxing for untrusted input on macOS.

Design notes are in `docs/superpowers/specs/2026-11-26-math-harness-design.md`.

## License

Apache-2.0.
