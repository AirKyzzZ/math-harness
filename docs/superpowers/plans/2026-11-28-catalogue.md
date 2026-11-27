# Catalogue Implementation Plan (first PR)

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:executing-plans. Steps use checkbox (`- [ ]`) syntax.

**Goal:** a versioned Erdős catalogue built from formal-conjectures and erdosproblems, with frozen challenges, transparent ranking signals and `mh list`.

**Architecture:** the pure-Python package `math_harness.catalogue` (extract, signals, store) is tested on fixture text. `scripts/build_catalogue.py` writes `src/math_harness/catalogue/data/catalogue.json` plus `challenges/<id>.lean`. `scripts/validate_catalogue.py` compiles the challenges in a Lean workspace and merges `compiles` back in.

**Tech Stack:** Python 3.11+, PyYAML only in the build script (`uv run --with pyyaml`), Typer + Rich for `mh list`.

**Spec:** `docs/superpowers/specs/2026-11-28-catalogue-design.md`

## Global Constraints
- Runtime deps stay `typer`, `rich`. The build and validate scripts may use `uv run --with pyyaml`.
- The target theorem's statement text is copied verbatim. Only metadata is stripped.
- Zero code comments outside the four allowed kinds. Conventional commits, subject only.

## Review Focus
- A file whose target theorem uses `answer(sorry)` or `@[question value]`: excluded, never emitted. Test in Task 1.
- `open scoped Classical in` right before the target theorem: kept, since the statement depends on it. Test in Task 1.
- A `sorry`-ended lemma placed between local defs and the target: dropped without dropping the defs. Test in Task 1.
- An entry whose erdosproblems record is missing: still emitted, with null signals and no crash. Test in Task 2.
- `mh list` with an empty or missing catalogue file: a clear message and exit 2. Test in Task 4.

---

### Task 1: Statement extraction
**Files:** create `src/math_harness/catalogue/__init__.py` and `src/math_harness/catalogue/extract.py`. Test: `tests/test_catalogue_extract.py`.
**Produces:** `@dataclass(frozen=True) Statement(id: str, problem: str, category: str, question: bool, statement: str, challenge: str, challenge_neg: str | None)` and `extract_statements(source: str, problem: str) -> list[Statement]`. The function returns every `research open|solved` theorem whose name starts with `erdos_<problem>`, ends in `:= by sorry`, and has no `question value` or `answer(`.

The challenge is `import Mathlib`, then the file body with the metadata removed (see spec), other `sorry`-ended theorems and lemmas dropped, and the target ending in `:= by\n  sorry`. `challenge_neg` (only for `question`) has the same prefix, with the target renamed `<name>_neg` and its type wrapped as `¬ (<type>)`. Binders before the colon move into a `∀` so the negation is of the full proposition.

- [ ] Write the tests on an inline fixture modelled on fc's 458.lean and 375.lean (defs, a proved API lemma, an unrelated `sorry` lemma, `open scoped Classical in`, a `question` target, a `question value` target), and watch them fail.
- [ ] Implement it, and watch the tests pass.
- [ ] Commit: `feat: extract frozen challenges from formal-conjectures files`

### Task 2: Signals, track and score
**Files:** create `src/math_harness/catalogue/signals.py`. Test: `tests/test_catalogue_signals.py`.
**Produces:** `signals(stmt: Statement, record: dict | None) -> dict` with the keys `fc_category`, `ep_status`, `forum_posts`, `prize`, `tags`, `length`, `analytic`, `falsifiable`, and `track` (`formalize` when fc says open and `ep_status` is in {proved, disproved, solved}, otherwise `open`), plus `score(sig: dict) -> float`. The score is a weighted sum with the weights in a module-level `WEIGHTS` dict, where lower forum posts, a shorter statement, non-analytic, falsifiable and the formalize track all rank higher.

- [ ] Tests: the formalize track, the open track, a missing record (all fields null, no crash), and the ordering (a short, discrete, 0-post statement scores above a long analytic one). Watch them fail.
- [ ] Implement, watch them pass, and commit: `feat: add catalogue signals and ranking`

### Task 3: Build and validate scripts, plus data
**Files:** create `scripts/build_catalogue.py`, `scripts/validate_catalogue.py`, `src/math_harness/catalogue/store.py`, and the data under `src/math_harness/catalogue/data/`. Test: `tests/test_catalogue_store.py`.
**Produces:** `load_catalogue(path: Path | None = None) -> dict` (the packaged file by default). The JSON looks like `{"fc_revision", "ep_revision", "built", "entries": [{id, problem, statement, signals, score, compiles, error, challenge, challenge_neg}]}`, where `challenge` and `challenge_neg` are relative paths.

`build_catalogue.py --fc DIR --ep DIR` writes the data. `validate_catalogue.py --workspace DIR [--jobs N]` runs `lake env lean` on each challenge with resumable results, then merges `compiles` and `error`.

- [ ] Store test: loads a written fixture and rejects a file with no `entries`. Watch it fail, implement, watch it pass.
- [ ] Run the build on the trial checkouts (`maths/trials/2026-11-27/src/{fc,ep}`) and check the counts against the 2026-11-27 scan (about 666 open plus the solved variants).
- [ ] Commit: `feat: build the erdos catalogue from formal-conjectures`

### Task 4: `mh list`
**Files:** modify `src/math_harness/cli.py`. Test: `tests/test_cli_list.py`.
`mh list [--track open|formalize] [--compiles] [--limit N=20]` prints a table (id, track, score, posts, status, compiles) sorted by score, then the footer "score is a sort key, not a chance of success". A missing catalogue gives exit 2.

- [ ] Tests with a fixture catalogue: the track filter, the limit, sorting, the missing-file case. Watch them fail, implement, watch them pass.
- [ ] Commit: `feat: add mh list`
