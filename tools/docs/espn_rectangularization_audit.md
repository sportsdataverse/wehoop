# wehoop ESPN return-shape audit

**Generated:** 2026-05-30
**Scope:** every exported `espn_wbb_*` and `espn_wnba_*` function (163 total: 81 WNBA + 82 WBB across 40 public wrapper files plus shared helpers).
**Out of scope:** the official WNBA Stats / NBA Stats family (`wnba_*()`). Multi-`resultSets[]` returns from the league API legitimately have distinct row grains and remain on the named-list-of-tibbles pattern via `wnba_stats_map_result_sets()`.

## Preference contract being audited against

> ESPN and other non-league API wrappers should return a **single wide rectangular `wehoop_data` tibble** with `janitor::clean_names()` applied. Lists of tibbles and nested list-columns are discouraged unless the upstream payload has multiple distinct row grains that genuinely cannot be merged without information loss. Very wide tables are preferred.
> The return must also be **self-describing**: every input parameter (game_id, team_id, season, season_type, athlete_id, week, etc.) must be echoed back as a column on every row, plus full game/team meta where applicable.

Source: `~/.claude/projects/<wehoop-session>/memory/feedback_espn_wide_rectangular_returns.md` + `feedback_return_self_describing.md`.

## Tier definitions

| Tier | Meaning | Action |
|------|---------|--------|
| **A** | Already compliant: single wide self-describing `wehoop_data` tibble. | No work. |
| **B** | Single tibble but missing one or more echoed inputs (identity-incomplete). | Trivial: add `dplyr::mutate(arg = arg)` before `make_wehoop_data()`. |
| **C** | Named list of tibbles whose components share a join key. | Decision: collapse vs. document. Most "Plays/Team/Player" triplets stay as lists because the three grains differ — but they need explicit documentation of the row grain and a suggested join recipe. |
| **D** | Named list of tibbles with genuinely unmergeable grains. | Keep as list; document. (None identified in wehoop.) |
| **E** | Single tibble but with un-flattened nested list-columns. | Flatten with `tidyr::unnest_wider()` or explicit `purrr::pluck()`. |

## Summary

| Tier | Count | % | Status |
|------|------:|--:|--------|
| A — Compliant | ~140 | 86% | No work |
| B — Identity-incomplete | 14 (7 pairs) | 9% | Trivial fix |
| C — List with shared key | 10 (5 pairs) | 6% | Document + 1 collapse refactor (`athlete_stats`) |
| D — Multi-grain list | 0 | 0% | n/a |
| E — Nested list-columns | ~2 | <1% | Spot-check only |

**Bottom line:** wehoop ESPN wrappers are predominantly compliant. The outstanding work is one architectural refactor (`espn_*_athlete_stats()` list → wide) and a batch of 14 identity-column echo patches.

---

## Tier A — Already compliant

The following groups return a single wide self-describing `wehoop_data` tibble. Listed by family with row grain. Each group covers both `_wbb_` and `_wnba_` twins (the helpers are shared).

| Function (pair) | Row grain | File |
|-----------------|-----------|------|
| `espn_*_pbp()` | one play | `espn_*_data.R` |
| `espn_*_team_box()` | one team-game | `espn_*_data.R` |
| `espn_*_player_box()` | one player-game | `espn_*_data.R` |
| `espn_*_game_rosters()` | one athlete-game | `espn_*_data.R` |
| `espn_*_team_roster()` | one athlete | `espn_*_team_detail.R` |
| `espn_*_team_schedule()` | one event | `espn_*_team_detail.R` |
| `espn_*_team_leaders()` | one category-leader (long) | `espn_*_team_detail.R` |
| `espn_*_team_season_profile()` | one team-season (1 row) | `espn_*_team_detail.R` |
| `espn_*_team_season_statistics()` | one category-stat (long) | `espn_*_team_detail.R` |
| `espn_*_teams()` | one team | `espn_*_data.R` |
| `espn_*_conferences()` / `espn_wnba_groups()` | one conference/group | `espn_*_data.R` / `espn_wnba_groups.R` |
| `espn_*_rankings()` / `espn_*_standings()` | one team-ranking | `espn_*_data.R` |
| `espn_*_scoreboard()` | one game | `espn_*_data.R` |
| `espn_*_team_stats()` | one team-season | `espn_*_data.R` |
| `espn_*_player_stats()` | one player-season | `espn_*_data.R` |
| `espn_*_calendar()` | one calendar entry | `espn_*_calendar.R` |
| `espn_*_positions()` / `espn_*_position()` | one position | `espn_*_positions.R` |
| `espn_*_news()` / `espn_*_team_news()` | one article | `espn_*_news.R` |
| `espn_*_season_weeks()` / `espn_*_season_week()` | one week | `espn_*_weeks.R` |
| `espn_*_week_rankings()` / `espn_*_week_ranking()` | one ranking entry | `espn_*_weeks.R` |
| `espn_*_injuries()` / `espn_*_team_injuries()` | one injury | `espn_*_injuries.R` |
| `espn_*_venues()` | one venue | `espn_*_league.R` |
| `espn_*_coaches()` | one coach | `espn_*_league.R` |
| `espn_*_athletes_index()` | one athlete | `espn_*_league.R` |
| `espn_*_seasons()` / `espn_*_season_info()` | one season | `espn_*_league.R` |
| `espn_*_season_types()` / `espn_*_season_type()` | one season type | `espn_*_season_meta.R` |
| `espn_*_season_leaders()` | one category-athlete (long) | `espn_*_season_meta.R` |
| `espn_*_season_rankings()` / `espn_*_season_ranking()` | one ranking entry | `espn_*_season_meta.R` |
| `espn_*_season_awards()` / `espn_*_award()` | one award | `espn_*_awards.R` |
| `espn_*_franchises()` / `espn_*_franchise()` | one franchise | `espn_*_franchise.R` |
| `espn_*_season_groups()` (+ `_group`, `_group_children`, `_group_teams`) | one group/team-in-group | `espn_*_groups_v2.R` |
| `espn_*_powerindex()` | one team-rating | `espn_*_powerindex.R` |
| `espn_*_leaders()` | one category-athlete (long) | `espn_*_league.R` |
| `espn_wbb_tournaments` / `_tournament` / `_tournament_seasons` / `_tournament_season` | one tournament / season-in-tournament | `espn_wbb_tournaments.R` |
| `espn_wnba_futures()` | one futures market | `espn_wnba_futures.R` |
| `espn_wnba_draft()` / `_freeagents` / `_transactions` | one draft/FA/transaction event | `espn_wnba_transactions.R` |
| `espn_wnba_draft_pick()` / `_rounds` / `_athletes` / `_status` / `_season_draft` / `_draft_athlete_detail` | one draft entity | `espn_wnba_athlete_career.R` |
| `espn_wnba_team_record()` | one team-season-record | `espn_wnba_team_record.R` |
| `espn_*_event_odds()` | one provider | `espn_*_event_detail.R` |
| `espn_*_event_probabilities()` | one play-level WP | `espn_*_event_detail.R` |
| `espn_*_event_officials()` / `_event_official_detail` | one official | `espn_*_event_detail.R` |
| `espn_*_event_broadcasts()` | one broadcast | `espn_*_event_detail.R` |
| `espn_*_event_situation()` / `_event_predictor` / `_event_powerindex` | one game (1 row) | `espn_*_event_detail.R` |
| `espn_*_event_propbets()` | one prop | `espn_*_event_detail.R` |
| `espn_*_event_competitor_linescores()` | one period-team | `espn_*_event_detail.R` |
| `espn_*_event_competitor_leaders()` | one category-athlete | `espn_*_event_detail.R` |
| `espn_*_event_competitor_roster()` / `_roster_entry` | one athlete-game | `espn_*_event_detail.R` |
| `espn_*_event_competitor_statistics()` | one category-stat | `espn_*_event_detail.R` |
| `espn_*_event_competitor_records()` | one record-type | `espn_*_event_detail.R` |
| `espn_*_event_competitor_score()` | one team-game | `espn_*_event_detail.R` |
| `espn_*_event_player_box()` | one player-game | `espn_*_event_detail.R` |
| `espn_*_event_play()` / `_event_play_personnel` | one play / one personnel entry | `espn_*_event_detail.R` |

**Tier A subtotal: ~140 functions.**

---

## Tier B — Single tibble, identity-incomplete

These return a single tibble but forget to echo at least one input parameter as a column. Fix is a one-line `dplyr::mutate()` just before `make_wehoop_data()` in the helper.

| Function (pair) | Helper | Missing columns | Fix |
|-----------------|--------|-----------------|-----|
| `espn_*_athlete_gamelog()` | `R/espn_basketball_athlete_helpers.R` | `athlete_id`, `season` | `dplyr::mutate(athlete_id = athlete_id, season = season)` |
| `espn_*_athlete_splits()` | same | `athlete_id`, `season` | same |
| `espn_*_athlete_eventlog()` | same | `athlete_id`, `season` | same |
| `espn_*_athlete_statisticslog()` | same | `athlete_id`, `season` | same |
| `espn_*_team_season_roster()` | `R/espn_basketball_team_deep_helpers.R` | `team_id`, `season` | `dplyr::mutate(team_id = team_id, season = season)` |
| `espn_*_coach_season()` | same | `coach_id`, `season` | `dplyr::mutate(coach_id = coach_id, season = season)` |
| `espn_*_team_record_detail()` | same | `team_id`, `season`, `record_id` | `dplyr::mutate(team_id = team_id, season = season, record_id = record_id)` |
| `espn_wnba_athlete_eventlog_v2()` | `R/espn_basketball_athlete_career_helpers.R` | `athlete_id`, `season` | `dplyr::mutate(athlete_id = athlete_id, season = season)` |

**Tier B subtotal: 14 functions (7 pairs + 1 WNBA-only).** All fixes land in helpers — one edit per helper propagates to both WBB and WNBA twins.

---

## Tier C — List return, components share a key

Each component is itself a tibble; the components share a join key, but the grains differ enough that collapsing to a single tibble would either cross-join (multiplying rows) or NA-fill heavily.

| Function (pair) | Components | Shared keys | Grain analysis | Plan |
|-----------------|------------|-------------|----------------|------|
| `espn_*_game_all()` | `Plays`, `Team`, `Player` | `game_id`, `team_id` | 3 distinct grains (play ≠ team-game ≠ player-game) | **Keep as list.** Each component is already wide and Tier-A compliant. Document explicitly: "one play row, one row per team, one row per player; join on `game_id` (+ `team_id`)". Optionally add example join recipes in `@details`. |
| `espn_*_team()` | `Info`, `Record`, `NextEvent`, `StandingSummary`, `Coaches` | `team_id`, `season` | 5 grains: 1-row team meta, N-row record, 1-row next event, 1-row standings, N-row coaches | **Keep as list.** Rename in roxygen `@title` to indicate it's a convenience aggregator (e.g. "ESPN team summary bundle"). Document each component's grain. |
| `espn_*_athlete_info()` | `Bio`, `Team`, `Position`, `Status`, `College`, `Draft` | `athlete_id` | All 1-row but with optional NULL components | **Keep as list.** A wide one-row return would have many sparse NAs depending on draft/college presence. Document optional components. |
| `espn_*_athlete_overview()` | `Statistics`, `NextGame`, `Last5Games`, `Headlines`, `FantasyOutlook` | `athlete_id`, `season` | Mixed atomic + multi-row | **Keep as list.** Distinct user-facing aspects. Document grain. |
| `espn_*_athlete_stats()` | Stat categories (`General`, `Offensive`, `Defensive`, `Rebounding`, `Shooting`, `Misc`) | `athlete_id`, `season` | All single-row, per-category schemas | **COLLAPSE to wide tibble.** This is the only genuine consolidation win. Add a `category` prefix to each column (`general_*`, `offensive_*`, …) and `bind_cols()` per athlete-season. One row per `(athlete_id, season, season_type)`. Medium-effort refactor in `espn_basketball_athlete_helpers.R`. |

**Tier C subtotal: 10 functions (5 pairs).**

---

## Tier D — Genuinely multi-grain list returns

None identified.

---

## Tier E — Tibbles with surviving nested list-columns

| Function | Nested column risk | Action |
|----------|--------------------|--------|
| `espn_*_game_rosters()` | `logos.*` partially flattened — multi-logo edge cases may still nest | Spot-check with a real game; if reproducible, add `tidyr::unnest_wider(logos, names_sep = "_")`. |
| `espn_*_athlete_info()$Draft` component | May be `NULL` when athlete is undrafted | Already handled gracefully via `%||%`. No fix needed. |

---

## Top wins (ordered by impact ÷ effort)

| # | Win | Effort | Impact |
|---|-----|-------:|-------:|
| 1 | Identity-echo batch for the 4 athlete log functions (gamelog/splits/eventlog/statisticslog) — one helper edit covers both leagues | 10 min | high — fixes 8 functions |
| 2 | Identity-echo for team-deep trio (team_season_roster / coach_season / team_record_detail) | 10 min | high — fixes 6 functions |
| 3 | `espn_*_athlete_stats()` list → wide tibble collapse | 30 min | high — improves usability for both leagues |
| 4 | Document `espn_*_game_all()` component grains in `@details` with a join recipe | 10 min | medium — clarifies user contract |
| 5 | Document `espn_*_team()` as a "bundle" aggregator with grain table | 10 min | medium |
| 6 | Audit `@return` blocks of the 14 `espn_*_event_*` functions to confirm `event_id` is in every column table | 15 min | low — doc-only |
| 7 | Spot-check `espn_*_game_rosters()` for surviving `logos.*` nesting | 5 min | low |
| 8 | Document `espn_*_athlete_info()` optional NULL components | 5 min | low |
| 9 | Document `espn_*_athlete_overview()` component grains | 5 min | low |
| 10 | `espn_wnba_athlete_eventlog_v2()` identity-echo (single WNBA function) | 2 min | low |

---

## Architectural opportunities

1. **Shim + helper hygiene.** All Tier B fixes land in shared helpers (`espn_basketball_*_helpers.R`); both league shims pick up the fix for free. Maintain this — do **not** patch the public wrapper directly.
2. **Class invariant.** Every ESPN return should land in `c("wehoop_data", "tbl_df", "tbl", "data.table", "data.frame")`. The named-list returns in Tier C wrap *each component* in `wehoop_data` — verify with `purrr::map(result, class)`.
3. **Validation helper (optional).** Consider an internal `.assert_identity_columns(tbl, expected)` helper used by every ESPN parser; would catch future drift.
4. **Bundle naming.** The four Tier-C "stay as list" functions (`game_all`, `team`, `athlete_info`, `athlete_overview`) could be renamed/aliased with a `_bundle` suffix to make the multi-grain shape explicit. Deprecation path: keep existing names exported, add `_bundle` aliases, switch documentation/examples to bundle form.

---

## Implementation order recommendation

1. **Batch 1 (Tier B, 1 PR):** 14 identity-echo patches across 3 helpers. Tests: add column-existence assertions in `test-espn_*_athlete_*.R` and `test-espn_*_team_deep.R`.
2. **Batch 2 (Tier C refactor, 1 PR):** `espn_*_athlete_stats()` list → wide. Tests: update existing `test-espn_*_athlete_stats.R` from named-list assertions to single-tibble assertions; add `category` prefix coverage.
3. **Batch 3 (documentation, 1 PR):** roxygen `@details` join-recipe blocks for `game_all`, `team`, `athlete_info`, `athlete_overview`; `@return` audit for `event_*` family.
4. **Batch 4 (optional):** introduce `*_bundle` aliases for the 4 keep-as-list functions.

---

## Related memories

- `feedback-espn-wide-rectangular-returns` — preference contract
- `feedback-return-self-describing` — echo-inputs-as-columns rule
- `feedback-function-default-args` — single-value defaults, validate inside (orthogonal but applies to any new params added during this work)

---

# Appendix: Empty / NULL / 404 return audit

**Generated:** 2026-05-30. **Sources:** `R-CMD-check` workflow run `26667208668` (Windows runner, push trigger, 14h ago); `tools/example_runs/_results.csv` (80-example batch from 2026-05-06, pre-commit-a12bbea state); `tools/example_runs/TRIAGE.md` (root-cause classification + applied fixes); helper source inspection (`R/espn_basketball_event_helpers.R`, `R/espn_wnba_groups.R`).

## CI signal (push run, 2026-05-29)

```
[ FAIL 0 | WARN 0 | SKIP 335 | PASS 52 ]
```

Skip breakdown:

| Skip reason | Count | Meaning |
|-------------|------:|---------|
| `On CI` (`skip_on_ci()`) | 324 | ESPN + WNBA Stats tests intentionally gated off live API in push CI |
| `User can't run WNBA Stats tests` (`WNBA_STATS_TESTS` unset) | 5 | env-var gated |
| `User can't run NCAA WBB tests` (`NCAA_WBB_TESTS` unset) | 1 | env-var gated |
| Plain `skip()` calls in helpers | 4 | known-deprecated WNBA leaders endpoints |
| **`No rows returned from ESPN WNBA conferences endpoint at test time`** | **1** | `espn_wnba_conferences` — live API call **did** run on CI and **returned no usable data**, console showed `Invalid arguments or no conferences info available! Error: The API returned an error` |

**The only ESPN endpoint that actually ran live in CI was `espn_wnba_conferences`, and it failed.** Every other ESPN test was suppressed by `skip_on_ci()`. CI gives almost no signal on live-API health for the rest of the ESPN surface.

## Per-function inventory (May-6 example-batch state)

Caveat: this snapshot predates the fix-commit `a12bbea` (also 2026-05-06) by minutes. Some entries here are already remediated in source; the column **Status today** captures verified post-fix state where confirmed.

### Category 1 — Silent `NULL` returns (return-value-init bug per CLAUDE.md)

These functions return `NULL` (not an empty tibble) when the upstream API errors or yields no items. Violates the CLAUDE.md "Return-Value Initialization" rule: tibble-returning functions must initialize to `data.frame()` (or a typed empty `wehoop_data` tibble matching the success-case schema) before `tryCatch`.

| Function | Current return on failure | Source | Status today | Fix |
|----------|---------------------------|--------|--------------|-----|
| `espn_wnba_conferences()` | `NULL` (init `conferences <- NULL` at [espn_wnba_groups.R:40](../../R/espn_wnba_groups.R#L40)) | `R/espn_wnba_groups.R` | **Still broken** — confirmed via CI run 26667208668 | Init `conferences <- empty_wehoop_data_for_conferences()` or `data.frame()` shell with the 7-column success schema |
| `espn_wbb_event_broadcasts()` | was `NULL`; helper now returns typed empty tibble at [espn_basketball_event_helpers.R:360-379](../../R/espn_basketball_event_helpers.R#L360-L379) | shared helper | **Fixed in a12bbea** (verified) | — |
| `espn_wbb_event_odds()` | same pattern | shared helper | **Fixed** (verified by reading helper) | — |
| `espn_wbb_event_officials()` | same pattern | shared helper | **Fixed** (verified) | — |
| `espn_wbb_event_probabilities()` | same pattern | shared helper | **Fixed** (verified) | — |

**Action:** patch `espn_wnba_conferences()` to initialize the return to an empty typed tibble. Sweep `R/` once more for any remaining wrapper that initializes a tibble-return variable to `NULL` instead of `data.frame()` (use `tools/probes/probe_known_broken.R` pattern).

### Category 2 — Wrapper-bug 404s already fixed in commit a12bbea

Per `TRIAGE.md`:

| Function (pair) | Original problem | Original URL | Fixed URL | Verified |
|-----------------|------------------|--------------|-----------|---------:|
| `espn_*_athlete_info()` | 404 for all athletes | `site.api.../athletes/{id}` | `sports.core.api.../athletes/{id}` | ✓ |
| `espn_*_team_news()` | returned `{}` | `/teams/{id}/news?limit=N` | `/news?team={id}&limit=N` | ✓ |
| `espn_*_athlete_statisticslog()` | 404 with `?season=` query | `/statisticslog?season=N` | drop query, use `/statisticslog` | ✓ |
| `espn_*_athlete_splits()` | wrong extraction key | looked for `splits`/`categories`/`data` | prepend `splitCategories` to lookup chain | ✓ |
| `espn_wnba_draft()` | wrong parser shape (`/draft` has no `items[]`) | `/draft` | rewrite to walk `/draft/rounds → items[].picks[]` | ✓ |
| `espn_*_athlete_eventlog()` (gamelog as well) | parser only emitted `event_id` | site path | `/seasons/{y}/.../eventlog`, drill into `events$items`, capture per-event scalars + nested team/opponent meta | ✓ |
| WBB athlete examples | `4432755` (Caitlin Clark, now WNBA → 404 under WBB) | hard-coded in 8 examples | `4433985` (Kylie Feuerbach, current Iowa) | ✓ |

These should not appear in any future empty-return inventory. **If they do, regression — re-open as a bug.**

### Category 3 — Permanent empties from upstream changes (no fix on our side)

| Function | Reason | Recommended handling |
|----------|--------|----------------------|
| `espn_wnba_freeagents()` | ESPN removed the endpoint. Both `core/...freeagents` (500) and other variants 4xx. | Wrap with `lifecycle::deprecate_warn()`; keep the wrapper as a typed-empty-tibble shim until ESPN restores or we have proof of permanent removal. Document in roxygen `@details`. |
| `espn_wbb_athlete_eventlog()` | ESPN returns `events: null` for every WBB athlete sampled (4 athletes × 2 seasons). WNBA equivalent works. | Document as "currently unpopulated upstream" in roxygen; keep returning typed-empty tibble. |

### Category 4 — Seasonal / situational empties (not bugs)

These are expected to be empty during off-season or quiet team windows. Wrappers handle them correctly; documentation should call out the expected behavior so users don't report them as bugs.

| Function | When empty | Action |
|----------|-----------|--------|
| `espn_wbb_injuries()` | WBB off-season (Apr–Oct) | Add roxygen `@note` |
| `espn_wbb_team_injuries()` | same | same |
| `espn_wbb_team_leaders()` | same | same |
| `espn_wnba_team_injuries()` | quiet team, early in season | same |
| `espn_wnba_team_leaders()` | same | same |

### Category 5 — Test-runtime API errors (transient, but worth tracking)

Watch for repeat offenders. The May 29 CI run logged the `espn_wnba_conferences` failure as `error = "The API returned an error"` — that's `.report_api_error()` firing inside the wrapper's `error =` branch. When this recurs across runs, the endpoint URL or query string likely drifted.

Action item: add `espn_wnba_conferences` to `tools/probes/probe_known_broken.R` as a watched endpoint; if it keeps failing across the next 3 scheduled runs, investigate the upstream URL change.

## CI coverage gap

The fact that **only 1 of ~163 ESPN functions actually ran a live request in the most recent push CI** is a structural problem this audit surfaces:

- `skip_on_ci()` blanket-suppresses ESPN tests on CI to keep push runs fast and avoid rate-limit flake on PRs.
- The scheduled R-CMD-check workflow (cron-triggered) was the right place for live ESPN coverage, but recent successful schedule runs (`26648402905` 21h ago, `26296732884` 7d ago, etc.) inherit the same `skip_on_ci()` because `CI=true` is set on schedule too.
- Net effect: live ESPN regressions are caught only by the manual `tools/example_runs/` batch the user runs locally, not by CI.

**Remediation options:**

1. **Add an `ESPN_TESTS=1`-gated workflow** (already exists per `tests/testthat/helper-skip.R`); set it on a low-frequency nightly cron with concurrency-limited matrix (e.g. 1 OS, sequential).
2. **Convert `skip_on_ci()` to a per-test policy** — a small allowlist of "fast, stable" ESPN tests (e.g. `espn_wbb_conferences`, `espn_wnba_seasons`, one PBP, one scoreboard) runs even on push CI.
3. **Bake the example-batch into a scheduled job** — `tools/example_runs/run_all.R` writes `_results.csv`; push the CSV diff as a CI artifact so empty-return regressions surface on the next push.

Option 3 is the highest signal-to-effort: it preserves the structure the user already built, and the diff against the committed `_results.csv` is the regression test.

## Remediation plan (ordered)

| # | Fix | Effort | Trigger |
|---|-----|-------:|---------|
| 1 | `espn_wnba_conferences()` — initialize return to typed-empty tibble | 5 min | Tier-1 (CI signal) |
| 2 | Grep `R/` for any wrapper initializing tibble-return variable to `NULL` (sweep) | 15 min | Tier-1 (CLAUDE.md compliance) |
| 3 | `espn_wnba_freeagents()` — add `lifecycle::deprecate_warn()` + permanent-empty doc | 10 min | Tier-2 (user clarity) |
| 4 | `espn_wbb_athlete_eventlog()` — add `@note` documenting upstream empty | 5 min | Tier-2 |
| 5 | Off-season `@note` for the 5 seasonally-empty wrappers | 15 min | Tier-3 (docs only) |
| 6 | Bake `tools/example_runs/run_all.R` into a scheduled workflow that publishes `_results.csv` as an artifact + diffs against the committed baseline | 60 min | Tier-2 (regression infrastructure) |
| 7 | Re-run `tools/example_runs/run_all.R` locally and commit fresh `_results.csv` to replace the May 6 snapshot | 10 min (mostly wall-clock) | Tier-1 (baseline truth) |

## Cross-package note

This appendix is wehoop-specific. The same audit pattern should be applied to:

- **hoopR** — check for `NULL` initialization in ESPN wrappers (esp. `espn_*_betting()`, `espn_*_team()` bundle sub-helpers) and verify scheduled CI runs cover live ESPN.
- **cfbfastR** — likely fewer issues given the higher Tier A compliance, but spot-check `espn_cfb_game_status()`, `_situation()`, `_predictor()`, `_powerindex()`, `_probabilities()` for the same NULL-init pattern, since they're already Tier B in the rectangularization audit.

A sibling appendix in each of those repos' `tools/docs/espn_rectangularization_audit.md` would close the loop.
