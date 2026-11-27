# Comparator feasibility spike

Final pin: Lean `leanprover/lean4:v4.37.0-rc1` (Lake with `lake comparator --json`), Mathlib `v4.37.0-rc1`. The v4.36.0 findings are kept below as history. Machine: macOS, no bubblewrap, so every run uses `--inadvisably-no-sandbox`.

## Results on v4.37.0-rc1

Template: `lake update` plus `lake exe cache get` (cache get 8.8 s, oleans already local from the earlier pin). `lake help comparator` lists `--json` ("With `--json` comparator only prints one final JSON report to stdout").

| Run | Solution | Wall (s) | Exit | Top-level judgement |
|---|---|---|---|---|
| ok (cold) | `Nat.prime_two` | 172.5 | 0 | `accepted` |
| ok2 (warm) | same | 198.4 | 0 | `accepted` |
| sorry | `by sorry` | 147.8 | 1 | `failure` |
| syntax | `Nat.prime_two !!!` | 135.8 | 1 | `failure` |

Each run is a fresh directory without `.lake`: Mathlib and the other packages are re-cloned and ~1290 jobs built from cache every time. Cold and warm are within noise (all under 300 s), so no variant B.

Recordings (real stdout; local absolute paths in the build recording replaced by `/home/user/...`): `tests/data/comparator_accepted.json`, `comparator_rejected_sorry.json`, `comparator_rejected_build.json`.

### Output channels
- stdout is exactly one JSON document in all four runs, including exit 1 (`json.loads` of the whole file succeeds, no extra lines).
- stderr carries only Lake `info: ... materializing/fetching/checking out` lines and `/usr/bin/time` output. No sandbox warning with `--json`.

### Report shape
- Top level keys: `version` ("0.1.0"), `sandboxed` (false here), `report`, `judgement`. Top-level judgement is `accepted` or `failure` (not `rejected`).
- `report` keys (unordered): `resolve_dependencies`, `kernel_reports`, `export_solution`, `export_challenge`, `config`, `compare_statements`, `check_axioms`, `build_solution`, `build_challenge`.
- `kernel_reports` is inside `report`, keyed by checker name (`"Lean default"`), each value `{output, judgement}`.
- Step output is `{"proc": {"stdout", "stderr"}}` (resolve_dependencies, exports, builds) or `{"str": {"string"}}` (compare_statements, check_axioms).
- Step judgement strings seen: `success`, `failure`, `skipped`.
- Execution order (`compareIt` in `Lake/CLI/Check.lean`): `resolve_dependencies`, `build_challenge`, `export_challenge`, `build_solution`, `export_solution`, `compare_statements`, `check_axioms`, then the kernels. Every step after the first `failure` is reported as `skipped`.

### Failure shapes
- sorry: `check_axioms` = `failure`, string `Illegal axiom detected: 'sorryAx'`; `kernel_reports["Lean default"]` = `skipped`; builds and exports succeed.
- syntax error: `build_solution` = `failure` (proc stdout holds the Lake log ending with `error: Solution.lean:3:0: unexpected end of input`); `export_solution`, `compare_statements`, `check_axioms` and the kernel report = `skipped`.

### Test suite impact
The recordings replaced the provisional fixtures, and `test_sorry_report_names_failing_step` now asserts the real detail `Illegal axiom detected: 'sorryAx'` instead of the provisional `two_prime uses sorryAx`. `uv run pytest -q` is green on this pin.

### Follow-ups
- Bump to stable `v4.37.0` (Lean and Mathlib) once it is tagged, and verify the in-place template upgrade: a template built for `v4.37.0-rc1` has a stale ready marker, so `ensure_template` reruns `lake update` and `lake exe cache get` in the same directory, which has not been tried on a real upgrade yet.

---

# History: v4.36.0 findings

Machine: macOS, no bubblewrap, elan 4.4.0, toolchain `leanprover/lean4:v4.36.0`, Lake 5.0.0, Mathlib `v4.36.0` (rev fc4f59e5).

## Verdict on speed

Feasible. Variant A (fresh directory with no `.lake`, the only layout comparator accepts) is fast enough, no variant B needed.

| Step | Command | Wall (s) | Exit |
|---|---|---|---|
| template | `lake update` | 106.7 | 0 |
| template | `lake exe cache get` | 10.6 | 0 |
| run1 cold (accepted) | `lake comparator --json --inadvisably-no-sandbox` | 157.2 | 0 |
| run2 warm (accepted) | same | 133.2 | 0 |
| run3 (`sorry` solution) | same | 142.7 | 1 |
| run4 (syntax error solution) | same | 128.0 | 1 |

Every fresh directory re-clones Mathlib, batteries, Cli etc. into its own `.lake/packages` (`materializing new dependency` lines on stderr), then builds ~1285 jobs. Mathlib oleans come from the cache populated by `lake exe cache get` in the template; nothing heavy is compiled. Cold and warm are within 20 s of each other, so time is dominated by clone plus build of the two modules, not by a cache miss.

## `--json` does not exist in Lake 5.0.0 / Lean v4.36.0 (reason for the move)

`lake help comparator` on v4.36.0 lists no `--json` option, and the flag is silently ignored (`lake comparator --bogusflag` errors with `unknown long option`, `--json` does not, because it is a global Lake flag meant for `lake query`). Result: stdout is NOT a JSON document. It is the human log of the run, 500+ lines, for example the tail of an accepted run:

```
Build completed successfully (1278 jobs).
Exporting #[Quot, ...]
Running Lean default kernel on solution
Lean default kernel accepts the solution
Your solution is okay!
```

No line of stdout starts with `{`. The `[--json]` usage and the JSON report only exist from `v4.37.0-rc1` (released 2026-11-18; checked in `src/lake/Lake/CLI/Help.lean` at that tag and on master). The reference doc (`lake-comparator-reference.md`) was written from master, not from v4.36.0.

Consequences: the recordings `comparator_accepted.json`, `comparator_rejected_sorry.json`, `comparator_rejected_build.json` could not be produced, and the three provisional fixtures were left untouched. The gate must either pin a toolchain at v4.37.0-rc1 or later, or parse the text output (not recommended).

## Facts recorded from v4.36.0 text output

stdout and stderr (all runs):
- stderr carries `WARNING: Sandbox disabled, this run is not trustworthy.`, the `info: ... materializing new dependency` lines and the `/usr/bin/time` lines. Rejections also print their reason on stderr, e.g. `error: Illegal axiom detected: 'sorryAx'` (run3).
- stdout carries Lake build progress (unicode check marks), warnings, and the final verdict lines.

Exit codes: accepted 0; `sorry` solution 1 (`Illegal axiom detected: 'sorryAx'`); syntax error in Solution.lean 1 (stdout ends with `error: Solution.lean:3:0: unexpected end of input`, `Some required targets logged failures:`, `- Solution`).

Both Challenge and Solution emit a harmless module-system warning (`imports ... designed for use with the module system`) on every run with Mathlib imports.

## Not yet answered (needs v4.37.0-rc1 or later)

Exact step names and nesting of the real JSON, whether `kernel_reports` sits inside `report`, exact failure judgement strings, stdout/stderr separation of the JSON document. `uv run pytest -q` was not affected because no fixture was replaced.
