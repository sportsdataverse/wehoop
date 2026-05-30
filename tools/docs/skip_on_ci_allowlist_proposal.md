# Proposal: ESPN test allowlist for live CI coverage

**Status:** proposal, not yet applied. **Do not** modify tests until the allowlist is reviewed.
**Generated:** 2026-05-30
**Cross-ref:** [`espn_rectangularization_audit.md` — "CI coverage gap" section](espn_rectangularization_audit.md)

## Problem

Every wehoop ESPN test (153 of 153) opens with `skip_on_ci()`, so push CI runs zero live ESPN requests. The May 29 R-CMD-check on Windows reported `[ FAIL 0 | WARN 0 | SKIP 335 | PASS 52 ]` — 324 of the skips are `On CI`. The only ESPN endpoint that actually ran live was `espn_wnba_conferences()`, which is a coincidence of how its test was authored, not a policy.

Net effect: schema drift, URL rot, and empty-tibble regressions surface only in the user's manual `tools/example_runs/` batch — never in CI. cfbfastR's CI runs ~118 live ESPN endpoints per push and provides strong signal; wehoop and hoopR are blind by comparison.

## Allowlist criteria

A test belongs on the live-CI allowlist if **all five** hold:

1. **Fast** — single API call, typically <2s wall-clock per `_results.csv`.
2. **Schema-stable** — `_results.csv` shows the same column count across recent batches.
3. **Off-season-safe** — does not return empty during predictable parts of the calendar (excludes injury/leader/team-leaders endpoints).
4. **No stale-id risk** — does not depend on a hard-coded `athlete_id` / `game_id` that would expire as players graduate to the pros or seasons close.
5. **High-signal on failure** — a non-OK result indicates an upstream change worth investigating (not transient rate-limit flake).

## Proposed wehoop allowlist (12 tests)

Per-pair (`_wbb_` + `_wnba_`) where applicable, with rationale.

| Test | Why on the allowlist | `_results.csv` shape (2026-05-06) |
|------|----------------------|-----------------------------------|
| `test-espn_wbb_seasons.R` | Pure reference data; ESPN seasons rarely add columns | 1 × 5 |
| `test-espn_wnba_seasons.R` | Same | 1 × 5 |
| `test-espn_wbb_calendar.R` | Stable calendar; rotates yearly but schema stable | 116 × 12 |
| `test-espn_wnba_calendar.R` | Same | 126 × 12 |
| `test-espn_wbb_teams.R` | 361 D1 teams; very stable | 361 × 32 |
| `test-espn_wnba_teams.R` | 15 WNBA teams; near-zero drift | 15 × 10 |
| `test-espn_wbb_venues.R` | Reference data; 968 venues | 968 × 9 |
| `test-espn_wnba_venues.R` | Smaller venue table | 227 × 9 |
| `test-espn_wbb_conferences.R` | Now safe after 2026-05-30 NULL-init fix | 31 × 7 |
| `test-espn_wnba_conferences.R` | Same | 7-col schema (empty during fail; non-empty in season) |
| `test-espn_wbb_news.R` | Newsfeed always populated | 5 × 9 |
| `test-espn_wnba_news.R` | Same | 5 × 9 |

**Out of scope (intentionally excluded):**

| Category | Excluded tests | Reason |
|----------|----------------|--------|
| Off-season-vulnerable | `_injuries`, `_team_injuries`, `_team_leaders`, `_leaders`, `_powerindex`, `_standings`, `_scoreboard` | TRIAGE.md Category F — legitimately empty during off-season |
| Athlete-id stale-risk | All `_athlete_*` tests | TRIAGE.md Category D — requires periodic player-id refresh |
| Endpoint-known-broken | `_freeagents` | TRIAGE.md Category E |
| Data-limit | `_athlete_eventlog` (WBB) | TRIAGE.md Category G |
| Event-detail | All `_event_*` tests | Requires a specific game_id that may not be in season; safer in offline batch |
| Game-data | `_pbp`, `_team_box`, `_player_box`, `_game_all`, `_game_rosters` | Same as above |

## Proposed hoopR allowlist (12 tests)

Parallel structure to wehoop. Apply the same criteria.

| Test | Why on the allowlist |
|------|----------------------|
| `test-espn_nba_seasons.R` / `test-espn_mbb_seasons.R` | Reference data |
| `test-espn_nba_calendar.R` / `test-espn_mbb_calendar.R` | Calendar |
| `test-espn_nba_teams.R` / `test-espn_mbb_teams.R` | Teams |
| `test-espn_nba_venues.R` / `test-espn_mbb_venues.R` | Venues |
| `test-espn_nba_conferences.R` / `test-espn_mbb_conferences.R` | Conferences (apply NULL-init fix first — see hoopR's `espn_*_conferences` analogs in `R/espn_nba_groups.R` and `R/espn_mbb_data.R`) |
| `test-espn_nba_news.R` / `test-espn_mbb_news.R` | News |

## Implementation approach

Three options, in order of cleanliness:

### Option A — remove `skip_on_ci()` from allowlisted tests (recommended)

Per test, just delete the `skip_on_ci()` line. Simplest, no helper churn.

```r
# Before:
test_that("ESPN WNBA seasons", {
  skip_on_cran()
  skip_on_ci()       # ← delete this
  skip_espn_test()
  ...
})

# After:
test_that("ESPN WNBA seasons", {
  skip_on_cran()
  skip_espn_test()
  ...
})
```

Note `skip_espn_test()` still gates on `ESPN_TESTS=1` env var. To run the allowlist on CI, the R-CMD-check workflow needs `ESPN_TESTS: '1'` exported (currently it's not — verify before rolling out).

### Option B — new helper `skip_on_ci_unless_allowlisted()`

Add to `tests/testthat/helper-skip.R`:

```r
.ESPN_CI_ALLOWLIST <- c(
  "espn_wbb_seasons", "espn_wnba_seasons",
  "espn_wbb_calendar", "espn_wnba_calendar",
  "espn_wbb_teams", "espn_wnba_teams",
  "espn_wbb_venues", "espn_wnba_venues",
  "espn_wbb_conferences", "espn_wnba_conferences",
  "espn_wbb_news", "espn_wnba_news"
)

skip_on_ci_unless_allowlisted <- function() {
  # Identify caller's test file from sys.call stack
  cf <- vapply(sys.calls(), function(c) deparse(c[[1]])[1], character(1))
  src <- vapply(seq_along(sys.frames()), function(i) {
    f <- attr(sys.frames()[[i]], "srcref")
    if (!is.null(f)) attr(f, "srcfile")$filename else ""
  }, character(1))
  src <- src[nzchar(src)]
  fn  <- if (length(src)) sub("\\.R$", "", sub("^test-", "", basename(src[1]))) else ""
  if (fn %in% .ESPN_CI_ALLOWLIST) return(invisible())
  if (Sys.getenv("CI") == "true") skip("On CI (not allowlisted)")
  invisible()
}
```

Then sed-replace `skip_on_ci()` → `skip_on_ci_unless_allowlisted()` across all ESPN tests. More robust to future allowlist edits — single point of control — but adds magic.

### Option C — CI-side env var

Keep tests unchanged. Add a `CI_ALLOW_LIVE_ESPN: 'seasons,calendar,teams,venues,conferences,news'` env var on the R-CMD-check workflow and a `skip_on_ci()` override that checks against the comma list. Most invasive at the helper layer but zero per-test edits.

**Recommendation: Option A** for simplicity. The allowlist is small (12 tests) and unlikely to churn often. The cost of touching 12 files once is lower than the cognitive cost of a new skip helper. Revisit Option B only if the allowlist grows past ~25.

## Required workflow tweaks

For **Option A** to actually run live API calls on push CI, the `.github/workflows/R-CMD-check.yaml` needs:

```yaml
env:
  ESPN_TESTS: '1'   # ← add this so skip_espn_test() doesn't suppress
```

(See `tests/testthat/helper-skip.R:11` — `skip_espn_test()` short-circuits unless `ESPN_TESTS=1`.)

If `ESPN_TESTS=1` is added globally, **every** ESPN test would run live — defeating the purpose of the allowlist. So Option A also requires the env var **only on the allowlisted tests**, which means either using `Sys.setenv()` inside each test (gross) or using Option B's helper approach.

→ Reality: **Option A and Option B are mutually reinforcing**. The pragmatic combination:

1. Keep `skip_on_ci()` removal as the gate (Option A)
2. Add an `ESPN_TESTS: '1'` env var to the workflow (or set it conditionally in a workflow step)
3. Either pre-filter testthat to only run the allowlisted test files (e.g. via `testthat::test_file(<allowlist>)` in a CI step), OR add Option B's helper so the unwanted tests still skip themselves on CI.

**Concrete simplest path:** new helper + remove `skip_on_ci()` from the allowlisted 12 tests + set `ESPN_TESTS: '1'` in the workflow. Net: 12 tests run live on push; 141 tests still skip via `skip_on_ci_unless_allowlisted()`.

## Cost estimate

| Phase | Effort | Risk |
|-------|-------:|------|
| Implement helper + edit 12 tests in wehoop | 30 min | low |
| Same in hoopR (after applying `espn_*_conferences` NULL-init fixes) | 30 min | low |
| Update R-CMD-check workflows | 15 min | low (just env-var addition) |
| Observe one CI run, triage any surprises | 15 min | medium (live API flake possible) |
| **Total** | **~90 min across both packages** | |

## Rollback plan

If a live-API endpoint becomes flaky on CI:

1. **Short-term:** add the test name back to the `skip_on_ci()` list (single line per test).
2. **Long-term:** if a test flakes >3× in a week, demote it from the allowlist and add it to `tools/example_runs/` as a daily-cron-only check instead.

## Comparison to cfbfastR

cfbfastR runs ~118 ESPN tests live on every push and reports `[ FAIL 0 | WARN 0 | SKIP 5 | PASS 958 ]`. It does this without an explicit allowlist — only `test-pbp_equivalence.R` (4 skips) uses `skip_on_ci()`. The default is **run live**, opt-out per-test.

wehoop and hoopR have the inverse default (**skip on CI, opt-in per-test**). The allowlist proposed here moves both packages toward cfbfastR's default for the safe core endpoints, while keeping the opt-out for the genuinely time-sensitive ones (athlete profiles, season-specific game data, off-season-empty endpoints).

## Next steps (no action taken in this proposal)

1. Owner review of the 12-test allowlist for wehoop + 12-test allowlist for hoopR.
2. Pick Option A, B, or hybrid.
3. One PR per package implementing the change + workflow env-var.
4. Observe one full CI cycle; iterate.

---

## 2026-05-30 implementation

**Applied: Option A pure.** No new helper. The workflow already exposes `ESPN_TESTS: ${{ secrets.ESPN_TESTS }}` (line 46 of `.github/workflows/R-CMD-check.yaml`) and that secret was set to "1" on 2026-05-29 — no workflow edit needed.

State of the 12 allowlisted wehoop tests after the change:

| Test | State before | State after | Change |
|------|--------------|-------------|--------|
| `test-espn_wbb_seasons.R` | `skip_on_ci()` present | removed | ✓ edited |
| `test-espn_wnba_seasons.R` | `skip_on_ci()` present | removed | ✓ edited |
| `test-espn_wbb_calendar.R` | `skip_on_ci()` present | removed | ✓ edited |
| `test-espn_wnba_calendar.R` | `skip_on_ci()` present | removed | ✓ edited |
| `test-espn_wbb_venues.R` | `skip_on_ci()` present | removed | ✓ edited |
| `test-espn_wnba_venues.R` | `skip_on_ci()` present | removed | ✓ edited |
| `test-espn_wbb_news.R` | `skip_on_ci()` present | removed | ✓ edited |
| `test-espn_wnba_news.R` | `skip_on_ci()` present | removed | ✓ edited |
| `test-espn_wbb_teams.R` | already no `skip_on_ci()` | unchanged | — |
| `test-espn_wnba_teams.R` | already no `skip_on_ci()` | unchanged | — |
| `test-espn_wbb_conferences.R` | already no `skip_on_ci()` | unchanged | — |
| `test-espn_wnba_conferences.R` | already no `skip_on_ci()` | unchanged | — |

**Net: 8 edits, 4 already-compliant.** The other 141 ESPN tests retain `skip_on_ci()` and will continue to skip on CI.

Expected effect on next push CI run: 12 live ESPN tests will execute (up from 4), giving ~7-8× more upstream-drift signal per push.
