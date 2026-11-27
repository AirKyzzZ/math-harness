# Math harness: design

Date: 2026-11-26
Working name: `mh` (placeholder, final name open)
Background research: `reports/AI agent harnesses for math discovery.md`

## Intent

An open-source command-line tool that lets curious, technical non-mathematicians point the frontier AI they already pay for (Claude Code, Codex) and their own machine at open, machine-checkable math problems, with Claude and Codex working together, and come out with results that hold up.

Why now: frontier models have collapsed the cost of candidate proofs. Cinna Davis disproved the Caiolo–Ferroni–Hoster conjecture with roughly 10% of a weekly ChatGPT Pro limit, and said the trick is the harness. But the community has turned against unverified volume: erdosproblems.com froze AI proof claims on 2026-10-06, Palomar refuses to certify novelty, Tao assigns priority to the first human exposition, OEIS bans AI submissions. Davis's own catalogue shows the failure modes: AI-only review, statements the AI wrote itself, and batches of withdrawals for prior art.

So the product is a solver (A) with a trust layer (C) as its core. Generating candidates is cheap. Rejecting bad ones well is the value.

## Users

Curious technical people (developers, students, researchers) comfortable with a terminal, who are not professional mathematicians. Not the general public.

## Goals

1. One-command install, plus a `doctor` command that installs or checks Lean (elan), the pinned Mathlib cache, and the presence and login state of Claude Code and Codex CLI.
2. A curated catalogue of open, machine-checkable problems with plain-English summaries.
3. A solve loop that runs parallel Claude Code and Codex attempts on a frozen statement, cross-audits each candidate with the other model, and shares dead ends between rounds.
4. Verification gates the agents cannot reach or influence: Lean check of the solution against the frozen statement, axiom audit, statement-faithfulness review, literature/novelty check.
5. A standalone check mode that runs the same gates on any claim (someone else's Lean proof and statement).
6. A submission package for human review, built to the 2026 community norms.
7. Budget control: per-session wall clock, attempts and rounds caps, and resume after interruption.

## Non-goals (v1)

- Web UI or desktop app.
- Posting or submitting anything on the user's behalf (no PRs to erdosproblems, no tweets, no OEIS, no email).
- Evolutionary program search for bounds and constructions (OpenEvolve-style). Candidate for v2.
- A tutor/learner mode that teaches the user the proof. The person's role is deliberately left open; the package must serve both an operator and a learner, and a tutor can be layered on later.
- Natural-language-only proofs for mathematics beyond Mathlib's reach (Rethlas/Danus style). v1 requires a Lean target.
- A hosted service, shared compute, or crowd platform.
- Training or fine-tuning models.
- Problems whose `answer(sorry)` stands for a value (a number, a set, a function). Lean cannot judge whether a value answer is explicit enough, so v1's catalogue keeps only plain theorems and yes/no questions. Candidate for v2 with its own answer gate.
- Check mode on claims built against other Lean/Mathlib versions or spread across many solution modules. v1 check mode accepts claims on the catalogue's pinned toolchain with a single solution file and refuses anything else with a clear message.

## Anti-goals (failure even if it technically works)

- Becoming another firehose of "solved" claims. Nothing is ever labelled "solved". The strongest status the tool emits is "verified candidate".
- Trusting an agent's own "done". Only gates outside the agent's reach decide.
- Proving a different statement than the real problem.
- Presenting rediscovered results as new.
- Touching user credentials in any way.
- Surprise costs.

## Constraints

- **Subscriptions.** The tool runs the user's own installed `claude` and `codex` CLIs as subprocesses. It never reads, stores, proxies or prompts for credentials. Anthropic's legal page forbids third-party developers from offering claude.ai login or routing requests through plan credentials on behalf of users ([legal and compliance](https://code.claude.com/docs/en/legal-and-compliance)). Anthropic's support page says `claude -p` and Agent SDK usage draw from the user's own plan limits; a planned change to that was paused in June 2026 ([support article](https://support.claude.com/en/articles/15036540-use-the-claude-agent-sdk-with-your-claude-plan)). OpenAI recommends API keys for `codex exec` automation and documents the ChatGPT-login path separately ([Codex non-interactive mode](https://developers.openai.com/codex/noninteractive)). Therefore: API-key mode is first-class for both vendors, subscription mode uses only the user's own CLI login, and the README links the official terms. Re-check the terms before the v1 release.
- **Lean.** Pinned Lean toolchain and Mathlib version per catalogue release, matched to the formal-conjectures revision the catalogue was built from. Mathlib cache is about 5 GB. Local Mathlib search indexing in lean-lsp-mcp can peak around 13 GiB RAM, so it must be optional. Pin a Lean version that includes the August 2026 soundness fix.
- **Comparator.** In Lean core since v4.35.0 as `lake comparator` / `lake check`. It checks that an untrusted `Solution.lean` proves exactly what a trusted `Challenge.lean` states using only `propext`, `Classical.choice` and `Quot.sound`, and sandboxes the build. It assumes the untrusted solution has not already been compiled in the checking environment.
- **Platforms.** macOS and Linux first. Windows via WSL. The comparator's landrun sandbox is Linux-only as far as its README shows. On macOS, gate 1 runs without that sandbox for proofs the user's own agents wrote (those agents already executed code on the machine during the attempts, so the sandbox adds little there). `mh check` on untrusted third-party input requires a Linux container (Docker or OrbStack) on macOS and refuses to run without one. Verify at build time whether `lake comparator` in v4.35+ changes this.
- **Vendors.** Works with either vendor alone or both. With one vendor, the gate 2 auditor is a fresh session of the same model, and every report and package says "single-model review" instead of "cross-model review".
- **Stack.** Python 3.11+, distributed with `uv tool install`, asyncio for concurrency.

## Approaches considered

1. **Thin orchestrator over the user's own coding-agent CLIs (chosen).** Sets up a workspace per problem, launches headless Claude Code and Codex sessions with Lean tools attached, and runs its own verification gates and packaging. Uses subscriptions the legitimate way, inherits the agents' strong Lean edit/compile loops, and stays thin so it survives model improvement ("harness decay"). Trade-off: depends on the CLIs' flags and behaviour, less control of the inner loop.
2. **Own agent loop on model APIs (h1 / mini-Lean-agent style).** Full control and best published benchmark numbers, cheap models possible. Rejected because it needs API keys rather than subscriptions, which breaks the main goal, and is much more code.
3. **GitHub repo template (Davis style).** Policy files, scripts and CI as judge. Almost no code. Rejected because verification depends on agents obeying prose rules; Davis's results show where that fails. Its good ideas (handoff notes, duplicate gate, verification receipts) are absorbed into approach 1 and enforced in code.

## Decisions made by the user

- Approach 1, combining the solver (A) and the checker (C).
- Command-line tool for curious technical users, not the general public.
- Open source on GitHub.
- Python with Lean.
- Claude and Codex collaborate in the same run.
- The person's role is left open; packages serve both an operator and a learner.
- The tool never posts or submits on the user's behalf.

## Design

### Commands

```
mh doctor                      install/check Lean, Mathlib cache, claude/codex CLIs and login state
mh list [--tag --area --checkable]   browse the catalogue
mh show <id>                   plain-English summary, formal statement, sources, prior AI attempts
mh solve <id> [--claude N --codex N --hours H --rounds R]
mh status [<id>]               live and past runs
mh check <path>                run the gates on any claim (part C standalone)
mh package <id>                build the submission bundle
```

### Workspace per problem

```
<workspace>/problems/<id>/
  problem.yaml        source links, plain-English summary, tags, status, catalogue revision
  Challenge.lean      frozen trusted statement; its hash is recorded at run start
  PROMPT.md           rigorous restatement, what counts as a resolution, what does not, known traps
  notes.md            shared memory across rounds: dead ends, compiled lemmas, useful Mathlib names
  attempts/<round>-<agent>-<n>/   isolated dir per session: Solution.lean, transcript.jsonl, handoff.md
  audits/             structured cross-model verdicts
  literature/         novelty report
  package/            final bundle
```

### Catalogue

- Statements come from `google-deepmind/formal-conjectures` (problems tagged `research open`), joined with statuses and flags from `teorth/erdosproblems` (open, falsifiable, verifiable, decidable, AI-attempts tracker). Falsifiable and decidable problems rank first because a finite check settles them.
- Using third-party formal statements is deliberate: the Erdős wiki recommends the statement be formalized by someone other than the prover.
- Plain-English summaries are model-generated once, reviewed by a human through PRs to the catalogue, and flagged as unreviewed until then.
- The catalogue ships as versioned data pinned to one Mathlib/formal-conjectures revision.
- Before a run, `mh solve` refreshes the AI-attempts tracker and warns if the problem was recently attempted or resolved.
- User-supplied problems are allowed, but their statement is flagged "self-formalized" in every report and package.

### Solve loop

Each round:

1. **Independent attempts.** Launch K Claude Code and K Codex sessions in parallel. Each gets its own directory, a read-only copy of `Challenge.lean`, `PROMPT.md` and `notes.md`, lean-lsp-mcp attached, web search disabled, and a hard wall-clock limit (default 2 h). In round 1 nobody gets the others' ideas; most sessions are not told any favoured approach.
2. **Gate 1, Lean (deterministic, local).** Copy only `Solution.lean` into a fresh pinned environment and run the comparator against the frozen `Challenge.lean`, plus an axiom audit. Rejects `sorry`, new axioms, `native_decide` (extra axiom), statement edits and metaprogramming tricks. Agents never choose keep or discard.
3. **Gate 2, cross-model audit.** A fresh session of the *other* vendor's model receives the informal problem, `Challenge.lean` and the passing `Solution.lean`. Since Lean already guarantees the proof is valid, the audit targets what Lean cannot: does the formal statement faithfully capture the informal problem, is the result trivial because of a misformalization, and the wiki's red flags (suspiciously short, proves much more than asked, ignores a hypothesis). Output is a structured verdict.
4. **Handoff.** If no candidate passes, each session writes `handoff.md`. The orchestrator merges these into `notes.md` (dead ends, lemmas that compiled), and the next round starts.
5. **Stop** on a candidate that passes both gates, on budget exhaustion, or at the round limit.

Compiled lemmas from failed attempts are kept in `notes.md` as a lemma bank for later rounds.

### Gate authority and statuses

Gate 1 (Lean) is the only veto. Gate 2 and the literature gate are model-judged, so they label rather than discard: a Lean-valid proof is always kept, and its status records every concern.

| Outcome | Status |
|---|---|
| Gate 1 passes, gate 2 clean, literature "no prior found" | verified candidate |
| Gate 2 objects to faithfulness or flags red flags | Lean-verified, statement concern |
| Literature "possible prior" | Lean-verified, possible prior |
| Literature "known" | known result (package marked not novel) |
| Gate 1 fails on every attempt within budget | no result (notes and lemma bank kept) |

If gate 2 concludes the frozen statement itself misformalizes the problem, the run stops solving that problem and reports the misformalization as its finding, with a draft issue for the catalogue source.

### Literature and novelty gate

Runs after a candidate passes gates 1 and 2: separate session(s), web search enabled, specifically covering the last 12 months of arXiv, Google Scholar, zbMATH, the teorth AI-attempts tracker and wiki, formal-conjectures `solved` tags, and public AI-math archives. Output: queries made, closest hits, and a verdict of "no prior found", "possible prior" or "known". The report states that absence of evidence is not proof of novelty.

### Check mode (part C standalone)

`mh check` takes a Lean project, the claimed theorem, the informal statement and, optionally, a trusted `Challenge.lean`. It runs gate 1 (or a build plus axiom audit when no trusted statement exists, flagged as weaker), gate 2 and the literature gate, and outputs a report. All input is treated as untrusted and only built inside the comparator sandbox.

### Submission package

- Pinned Lean project (`lake-manifest.json`), `Challenge.lean` with its hash and source revision, `Solution.lean`.
- Gate receipts: exact commands, tool versions and outputs.
- Every attempt transcript, for AI-use disclosure.
- Audit verdicts and the literature report.
- A plain-English explanation of the result, marked as AI-written.
- A write-up skeleton for the human to fill in themselves.
- A next-steps checklist: register on Palomar, get expert review, write the exposition, contact the maintainer by email, do not announce on social media first.
- Status wording: "verified candidate", never "solved".

### Model adapters

One interface: start a session (prompt, working dir, tools, timeout), stream events, return the result and usage. Two implementations in v1:

- Claude Code: `claude -p` with streaming JSON output, an MCP config for lean-lsp-mcp, tools restricted to the working directory, web tools disabled.
- Codex: `codex exec --json` with a workspace-write sandbox, MCP config, web search off.

Both support an API-key mode. Other CLIs (Gemini CLI etc.) can be added through the same interface later.

### Terminal UX

A live table (Rich): one row per attempt with agent, elapsed time, last action in plain language and gate status. Everything is logged so runs can resume. Subscription quota cannot be read, so subscription mode shows elapsed time and session counts. In API-key mode, `mh solve` prints a worst-case cost estimate from the budget settings and asks for confirmation before starting, then shows a running dollar tally from token usage. A hard mid-run dollar cap is deferred.

### Security

Agents execute code, and Lean runs code at compile time (`#eval`, `initialize`, macros). The boundary for agent sessions is the vendor's own sandbox (Claude Code permission settings, Codex workspace-write) plus deny rules that `mh` writes into each session's config for common secret locations (`~/.ssh`, `~/.aws`, `~/.config/gh`, `~/.codex/auth.json`, `~/.claude*` credential files, `.env` files outside the attempt directory). `mh` itself never reads them. Full container isolation for agent sessions is out of scope for v1, because the CLIs need their own login inside the boundary. Final verification always happens in a fresh directory. Content from the catalogue or from `mh check` inputs is untrusted.

### Testing (the pass/fail signal)

- **Gate fixtures:** known-good proofs, and known-bad ones the gates must reject: `sorry`, extra `axiom`, edited statement, `native_decide`, `implemented_by` / `extern` tricks, redefined Mathlib names, statement-weakening. Gates must reject every bad fixture and accept every good one.
- **Adapter tests** against recorded transcripts.
- **End-to-end smoke test** on an easy problem already solved in formal-conjectures, run with both vendors.

## My calls (correct any of these)

- Collaboration pattern: independent parallel attempts, then cross-model audit, then shared notes between rounds. A planner/worker split is deferred.
- v1 targets Lean-checkable statements only, sourced from formal-conjectures.
- `uv tool install` distribution, Rich for the terminal UI.
- "Verified candidate" as the strongest status.
- Default budget: 2 sessions per vendor, 2 h per session, 3 rounds.
- Working name `mh`.
- Model-judged gates label instead of veto; only the Lean gate rejects.
- Value-answer problems excluded from v1; catalogue keeps plain theorems and yes/no questions.
- Single-vendor runs allowed, labelled "single-model review".
- Check mode v1 limited to the pinned toolchain and a single solution file.
- macOS: gate 1 unsandboxed for the user's own agents' proofs; untrusted check-mode input needs a Linux container.
- Agent isolation: vendor sandboxes plus secret-path deny rules, no containers in v1.
- API mode: worst-case estimate and confirmation before a run, running tally, no hard cap yet.
- Disproofs are checked against a mechanically negated challenge.

## Left to the builder

- Exact flags for `claude`, `codex` and `lake comparator` / `lake check` at build time.
- The notes merge strategy (deterministic merge versus a cheap summarization call).
- The catalogue build script.
- Default timeouts tuning.

## Open risks

- Subscription terms may change; re-check before release.
- Many formal-conjectures statements contain `answer(sorry)` for questions whose answer is unknown. The agent must choose an answer and prove it, and the comparator setup must allow that choice without letting the agent alter anything else. This needs a concrete design during planning.
- Lean and Mathlib version pinning has to match the formal-conjectures revision.
- Lean-verified is not the same as significant. The catalogue's selection and the literature gate carry that weight.
