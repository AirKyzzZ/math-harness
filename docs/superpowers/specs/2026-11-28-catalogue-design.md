# Catalogue (plan 2)

Approved in conversation on 2026-11-27. It refines the "Catalogue" section of `2026-11-26-math-harness-design.md` with what the 2026-11-27 trial run taught.

## Why
Maxime's goal for mh is a verified result on an Erdős problem nobody has solved. Choosing the problem matters more than compute: Erdős 458 turned out to need Legendre-strength input. The catalogue's job is to make that choice informed: which statements are machine-checkable on our pin, which are reachable, and which already have prior work somewhere.

## Goals
- A build script turns a pinned formal-conjectures checkout plus teorth/erdosproblems data into a versioned `catalogue.json`, plus one frozen `Challenge.lean` per statement (and a negated `ChallengeNeg.lean` for `@[question]`).
- Extraction follows the trial's rules:
  - strip `module`, `public import`, `@[expose] public section`, `@[category …]`, `@[AMS …]`, `@[question]`, `formal_proof …` attributes and `set_option linter…` lines;
  - keep local defs, proved lemmas, `open`s, namespaces and the target statement;
  - drop every other `sorry`-ended theorem or lemma;
  - replace the import with `import Mathlib`.
- Validation is a separate, resumable step. It compiles each challenge on the pin and records `compiles: true/false` with the first error. Statements that depend on `FormalConjecturesForMathlib` definitions fail here and are excluded in v1.
- Signals per entry: fc category, erdosproblems informal status, forum posts, prize, tags, statement length, discrete vs analytic (reals, limits, `atTop`), whether the question is falsifiable or decidable, and fc/erdosproblems status disagreement.
- Two tracks:
  - `formalize`: fc says open but erdosproblems says proved, disproved or solved (55 statements on 2026-11-27);
  - `open`: everything else that is open.
- A transparent score. Each entry exposes its ranking inputs, and `mh list` sorts by them.
- `mh list [--track open|formalize] [--compiles] [--limit N]` reads the packaged catalogue.

## Later PRs in this plan (not in the first one)
- Minimal imports, computed at validation time, to cut gate cost. With the artifact cache (PR #3) this matters less.
- Model triage of the top ~50: a short budgeted Claude session per entry that returns a structured verdict (depends on a famous conjecture? plausible approach? missing Mathlib infrastructure?), stored as "unreviewed".
- A prior-work index queried before a run and after a candidate: open fc PRs, GitHub code search on the theorem name, open-math-agents, isitsolved (read-only), and the teorth AI-contributions wiki.

## Non-goals
- Value questions (`@[question value]`, `answer(sorry)`), per the main spec.
- Inlining `FormalConjecturesForMathlib` definitions (v2).
- Any network access from `mh list`.

## Anti-goals
- A statement that silently differs from fc's. The extractor never rewrites the target statement, and validation compiles it as is.
- A score presented as a probability of success. It is a sort key, and the CLI says so.

## Approaches
- **Chosen: a build script producing versioned data, with validation as a separate step.** It is reproducible, reviewable in PRs, and matches the spec's "versioned data pinned to one revision".
- Querying fc live from `mh list`: rejected, because results would move under a run and mh would need network access.
- Validating during the build: rejected, because compiling 666 files takes hours. A separate, resumable step can run on the gpu PC overnight.

## Left to the builder
Exact score weights, as long as each term is shown; the JSON field names; where the data lives in the package.
