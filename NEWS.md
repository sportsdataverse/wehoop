<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [**wehoop 3.0.0**](#wehoop-300)
- [**wehoop 2.1.0**](#wehoop-210)
- [**wehoop 2.0.0**](#wehoop-200)
- [**wehoop 1.9.0**](#wehoop-190)
- [**wehoop 1.8.0**](#wehoop-180)
- [**wehoop 1.7.0**](#wehoop-170)
- [**wehoop 1.6.0**](#wehoop-160)
- [**wehoop 1.5.0**](#wehoop-150)
- [~106 WNBA Stats API functions added](#106-wnba-stats-api-functions-added)
- [Adds 4 ESPN WBB and WNBA functions](#adds-4-espn-wbb-and-wnba-functions)
- [**wehoop 1.2.1**](#wehoop-121)
- [**wehoop 1.2.0**](#wehoop-120)
- [**wehoop 1.1.1**](#wehoop-111)
- [**wehoop 1.1.0**](#wehoop-110)
- [**wehoop 1.0.0**](#wehoop-100)
- [**wehoop 0.9.2**](#wehoop-092)
- [**wehoop 0.9.1**](#wehoop-091)
- [**wehoop 0.9.0**](#wehoop-090)
- [**wehoop 0.3.0**](#wehoop-030)
- [**wehoop 0.2.0**](#wehoop-020)
- [**wehoop 0.1.0**](#wehoop-010)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# **wehoop 3.0.0**

### **New data loaders**

* feat: add `load_*` functions for season-level rosters and player stats,
  backed by new `sportsdataverse-data` release tags published by the
  `wehoop-wbb-data`, `wehoop-wnba-data`, and `wehoop-wnba-stats-data`
  pipelines. Each function follows the existing `load_wnba_pbp()` shape —
  `(seasons, ..., dbConnection = NULL, tablename = NULL)`,
  `progressively()` decorator, `data.table::rbindlist(use.names = TRUE, fill = TRUE)`,
  optional DB write, and a final `wehoop_data` class set on the in-memory result.
    - ESPN-backed loaders: `load_wbb_rosters()`, `load_wbb_player_stats()`,
      `load_wnba_rosters()`, `load_wnba_player_stats()` reading from the
      `espn_womens_college_basketball_rosters`,
      `espn_womens_college_basketball_player_season_stats`, `espn_wnba_rosters`,
      and `espn_wnba_player_season_stats` release tags respectively.
    - WNBA Stats API-backed loaders: `load_wnba_stats_rosters()`,
      `load_wnba_stats_coaches()`, `load_wnba_stats_player_stats()`,
      `load_wnba_stats_lineups()` reading from the `wnba_stats_rosters`,
      `wnba_stats_coaches`, `wnba_stats_player_season_stats`, and
      `wnba_stats_lineups` release tags respectively. New file
      `R/load_wnba_stats.R` houses the four `wnba_stats_*` loaders.
    - Adds `most_recent_wnba_stats_season()` helper in `R/utils.R` (a thin
      wrapper around `most_recent_wnba_season()` for naming symmetry with the
      `wnba_stats_*` family).
    - Tests gated by the existing `WEHOOP_LOAD_TESTS=1` env var via
      `skip_load_test()` (`tests/testthat/helper-skip.R`).
* feat: add additional `load_*` season-summary loaders backed by new
  `sportsdataverse-data` release tags. Each follows the same
  `(seasons, ..., dbConnection = NULL, tablename = NULL)` shape, single
  `.rds` per season, `progressively()` decorator, and final
  `wehoop_data` class set on the in-memory result.
    - ESPN-backed loaders: `load_wbb_team_stats()`, `load_wbb_standings()`,
      `load_wnba_team_stats()`, `load_wnba_standings()`, `load_wnba_draft()`
      reading from the
      `espn_womens_college_basketball_team_season_stats`,
      `espn_womens_college_basketball_standings`,
      `espn_wnba_team_season_stats`, `espn_wnba_standings`, and
      `espn_wnba_draft` release tags respectively.
    - WNBA Stats API-backed loaders: `load_wnba_stats_team_stats()`,
      `load_wnba_stats_standings()`, `load_wnba_stats_draft()` reading
      from the `wnba_stats_team_season_stats`, `wnba_stats_standings`,
      and `wnba_stats_draft` release tags respectively.
    - Tests gated by the existing `WEHOOP_LOAD_TESTS=1` env var via
      `skip_load_test()`.
* feat: add `load_*` loaders for shot events, per-game rosters, and
  game officials backed by new `sportsdataverse-data` release tags.
  Each follows the same `(seasons, ..., dbConnection = NULL,
  tablename = NULL)` shape, single `.rds` per season, `progressively()`
  decorator, and final `wehoop_data` class set on the in-memory result.
    - ESPN-backed loaders: `load_wbb_shots()`, `load_wbb_game_rosters()`,
      `load_wbb_officials()`, `load_wnba_shots()`,
      `load_wnba_game_rosters()`, `load_wnba_officials()` reading from
      the `espn_womens_college_basketball_shots`,
      `espn_womens_college_basketball_game_rosters`,
      `espn_womens_college_basketball_officials`, `espn_wnba_shots`,
      `espn_wnba_game_rosters`, and `espn_wnba_officials` release tags
      respectively.
    - WNBA Stats API-backed loaders: `load_wnba_stats_shots()`,
      `load_wnba_stats_game_rosters()`, `load_wnba_stats_officials()`
      reading from the `wnba_stats_shots`, `wnba_stats_game_rosters`,
      and `wnba_stats_officials` release tags respectively.
    - Tests gated by the existing `WEHOOP_LOAD_TESTS=1` env var via
      `skip_load_test()`.
* feat: add 25 `load_*_manifest()` helpers (one per non-PBP/non-schedule
  dataset across the three release-tag families) plus a `datasets=`
  argument on `update_wnba_db()` / `update_wbb_db()` and a new
  `update_wnba_stats_db()` for selective DB population. Manifest helpers
  return the per-season `season` / `row_count` / `generated_at_utc` /
  `source_endpoint` CSV attached to each release tag, so users can
  discover available seasons without triggering a heavy `load_*()` call.
  The `datasets=` arg lets callers populate specific tables (e.g.
  `update_wbb_db(datasets = c("rosters", "player_stats"))`); when `NULL`
  the historical play-by-play behavior is preserved.
* feat: add `load_wnba_stats_schedule()`, `load_wnba_stats_player_game_logs()`
  and `load_wnba_stats_pbp()` plus the matching
  `load_wnba_stats_schedule_manifest()` /
  `load_wnba_stats_player_game_logs_manifest()` /
  `load_wnba_stats_pbp_manifest()` helpers. These read from the
  `wnba_stats_schedules`, `wnba_stats_player_game_logs` (new tag) and
  `wnba_stats_pbp` release tags now populated by the rewritten
  `wehoop-wnba-stats-data/R/wnba_stats_01_pbp.R` pipeline (V3 PBP with
  on-court lineups supplied directly by `wnba_pbp()`, plus possession
  assignment, FT-to-foul attribution, garbage-time flag, and a
  per-season + master schedule build). All three new datasets are also
  wired into `update_wnba_stats_db()`
  (`datasets = c("schedule", "player_game_logs", "pbp", ...)`).

### **ESPN endpoint expansion**

* feat: add ESPN news + calendar endpoint wrappers — `espn_wbb_news()`, `espn_wnba_news()`, `espn_wbb_team_news()`, `espn_wnba_team_news()`, `espn_wbb_calendar()`, `espn_wnba_calendar()`. League-level and team-level news feeds (site-v2 `/news`) plus scoreboard calendar blocks (site-v2 `/scoreboard?dates={season}`) parsed into tidy tibbles. Shared internal helpers (`.espn_basketball_news()`, `.espn_basketball_team_news()`, `.espn_basketball_calendar()`) keep WBB and WNBA DRY.
* feat: add ESPN injury endpoint wrappers — `espn_wbb_injuries()`, `espn_wnba_injuries()`, `espn_wbb_team_injuries()`, `espn_wnba_team_injuries()`. League-wide and team-scoped injury feeds (site-v2 `/injuries` and `/teams/{id}/injuries`) parsed into flat tidy tibbles. Note: WBB injury data is typically sparse on ESPN; both league and team variants return an empty tibble (rather than erroring) when no injuries are reported. The `season` parameter on the league-wide functions is attached as a constant output column for downstream joins (ESPN's injury endpoint does not accept a server-side season filter). Shared internal helpers (`.espn_basketball_league_injuries()`, `.espn_basketball_team_injuries()`) keep WBB and WNBA DRY.
* feat: add ESPN team-detail endpoint wrappers — `espn_wbb_team()`, `espn_wnba_team()`, `espn_wbb_team_roster()`, `espn_wnba_team_roster()`, `espn_wbb_team_schedule()`, `espn_wnba_team_schedule()`, `espn_wbb_team_leaders()`, `espn_wnba_team_leaders()`. Single-team info (named list: `Info`, `Record`, `NextEvent`, `StandingSummary`, `Coaches`), roster (one row per athlete with position, height, weight, headshot), schedule (one row per event with opponent, venue, broadcast, result), and statistical leaders (long format per category-rank-athlete) via site-v2 `/teams/{id}`, `/teams/{id}/roster`, `/teams/{id}/schedule`, and `/teams/{id}/leaders`. Shared internal helpers (`.espn_basketball_team()`, `.espn_basketball_team_roster()`, `.espn_basketball_team_schedule()`, `.espn_basketball_team_leaders()` in `R/espn_basketball_team_helpers.R`) keep WBB and WNBA DRY.
* feat: add ESPN athlete coverage endpoint wrappers -- `espn_wbb_athlete_info()`, `espn_wnba_athlete_info()`, `espn_wbb_athlete_overview()`, `espn_wnba_athlete_overview()`, `espn_wbb_athlete_stats()`, `espn_wnba_athlete_stats()`, `espn_wbb_athlete_gamelog()`, `espn_wnba_athlete_gamelog()`, `espn_wbb_athlete_splits()`, `espn_wnba_athlete_splits()`, `espn_wbb_athlete_eventlog()`, `espn_wnba_athlete_eventlog()`, `espn_wbb_athlete_awards()`, `espn_wnba_athlete_awards()`, `espn_wbb_athlete_statisticslog()`, `espn_wnba_athlete_statisticslog()`. Athlete bio/team/position/status/college/draft info (site-v2), season overview and last-5-games (web-common-v3), per-category stats as named list (web-common-v3), game-by-game log (web-common-v3), long-format splits (web-common-v3), per-event log with ref URLs as character columns (core-v2), awards (core-v2, sparse/often empty), and statistics log (core-v2). The awards endpoint returns an empty tibble with canonical columns when no data exist. The eventlog `statistics.$ref` URLs are returned as a `statistics_ref` character column and are not auto-resolved. Shared internal helpers (`.espn_basketball_athlete_info()`, `.espn_basketball_athlete_overview()`, `.espn_basketball_athlete_stats()`, `.espn_basketball_athlete_gamelog()`, `.espn_basketball_athlete_splits()`, `.espn_basketball_athlete_eventlog()`, `.espn_basketball_athlete_awards()`, `.espn_basketball_athlete_statisticslog()` in `R/espn_basketball_athlete_helpers.R`) keep WBB and WNBA DRY.
* feat: add WNBA-only ESPN endpoint wrappers -- `espn_wnba_draft()`, `espn_wnba_freeagents()`, `espn_wnba_transactions()`, `espn_wnba_conferences()`. `espn_wnba_draft()` paginates the core-v2 `/seasons/{year}/draft` endpoint (up to 20 pages) and returns a flat tibble of picks (round, pick, overall, team, athlete, position, college). `espn_wnba_freeagents()` wraps core-v2 `/seasons/{year}/freeagents` and returns an empty tibble outside the free-agent window. `espn_wnba_transactions()` wraps site-v2 `/transactions?season={year}&limit={limit}` with null-safe `to_team_id` for release transactions. `espn_wnba_conferences()` mirrors `espn_wbb_conferences()` using the WNBA scoreboard-conferences endpoint (site-v2 `/scoreboard/conferences?seasontype=2`) with the same column shape and `dplyr::select(-dplyr::any_of("subGroups"))` drift guard.
* feat: add ESPN event-detail endpoint wrappers -- `espn_wbb_event_odds()`, `espn_wnba_event_odds()`, `espn_wbb_event_probabilities()`, `espn_wnba_event_probabilities()`, `espn_wbb_event_officials()`, `espn_wnba_event_officials()`, `espn_wbb_event_broadcasts()`, `espn_wnba_event_broadcasts()`. Game-level odds (one row per provider; WBB typically empty), paginated play-level win probabilities (core-v2 `/probabilities` with internal page loop capped at 50 pages, respects `limit` parameter), per-game officials, and broadcast outlets. All via core-v2 `/events/{id}/competitions/{id}/`. Shared internal helpers (`.espn_basketball_event_odds()`, `.espn_basketball_event_probabilities()`, `.espn_basketball_event_officials()`, `.espn_basketball_event_broadcasts()` in `R/espn_basketball_event_helpers.R`) keep WBB and WNBA DRY.
* feat: add ESPN league-wide catalog endpoint wrappers -- `espn_wbb_leaders()`, `espn_wnba_leaders()`, `espn_wbb_venues()`, `espn_wnba_venues()`, `espn_wbb_coaches()`, `espn_wnba_coaches()`, `espn_wbb_athletes_index()`, `espn_wnba_athletes_index()`, `espn_wbb_seasons()`, `espn_wnba_seasons()`, `espn_wbb_season_info()`, `espn_wnba_season_info()`. League leaders (web-common-v3 statistics/byathlete), venue catalog, coach roster, athlete index (paginated with progress messages; WBB default limit 25000, WNBA 5000), season list, and single-season info parsed into tidy tibbles. `$ref` components in season info are returned as character columns and not auto-resolved. Shared internal helpers (`.espn_basketball_leaders()`, `.espn_basketball_venues()`, `.espn_basketball_coaches()`, `.espn_basketball_athletes_index()`, `.espn_basketball_seasons()`, `.espn_basketball_season_info()` in `R/espn_basketball_league_helpers.R`) keep WBB and WNBA DRY.
* docs: add `vignettes/espn-endpoints.Rmd` covering all 80 ESPN basketball wrappers (existing 22 + 58 new). Reorganize the pkgdown reference index into 14 per-domain ESPN subsections so the rendered nav scales for the new surface.

### **CRAN preparation**

* Add `cph` (copyright holder) role to `Saiem Gilani` in `Authors@R` (CRAN strict requirement).
* Bump `LICENSE` and `LICENSE.md` copyright year from 2020 to 2026.
* Add full roxygen blocks (description, `@return`, `@examples`) to `most_recent_wbb_season()` and `most_recent_wnba_season()`, which had been title/`@export`-only.
* Add `@examples \donttest{}` blocks to all 58 new ESPN endpoint wrappers. Live-API examples are wrapped in `\donttest{}` so they do not run during routine `R CMD check` but are still exercised under `--run-donttest`. The redundant `@details` code-block samples were removed from these 58 functions; the legacy `@details`-with-code-block convention is retained for the WNBA Stats API (`wnba_*`) and NCAA (`ncaa_wbb_*`) wrappers per the project's documentation conventions in `CLAUDE.md`.
* Modernize `inst/CITATION`: replace deprecated `citEntry()` / `personList()` with `bibentry()` / `c(person(), ...)` (R 4.x deprecation cleanup).
* Add `parameter_descriptions` (dataset) and `year_to_season` (utility) to `_pkgdown.yml` reference index so `pkgdown::check_pkgdown()` passes (resolves the gh-pages deploy failure).

### **WNBA Stats API V3 Endpoints Added**

* ```wnba_playbyplayv3()``` function added. V3 play-by-play endpoint wrapper, plus a V3-to-V2 compatibility pipeline used by ```wnba_pbp()``` (via ```.v3_to_v2_format_wnba()```, ```.build_player_roster_wnba()```, ```.players_on_court_v3_wnba()```) that retains V2-compatible columns while adding V3-only columns (```x_legacy```, ```y_legacy```, ```shot_distance```, ```shot_result```, ```is_field_goal```, ```points_total```, ```shot_value```).
* ```wnba_boxscoresummaryv3()``` function added.
* ```wnba_boxscoreusagev3()``` function added.

### **WNBA Time Calculation Fix**

* ```.players_on_court()``` — corrected quarter-length math to use 10-minute WNBA quarters (600 seconds/quarter, 2400 seconds of regulation) rather than the NBA 12-minute quarter constants.

### **Data Loaders**

* ```update_wnba_db()``` function updated to use `sportsdataverse-data` releases url instead of `wehoop-data` repository URL
* ```update_wbb_db()``` function updated to use `sportsdataverse-data` releases url instead of `wehoop-data` repository URL

### **Restored Functionality**

* ```wnba_draftboard()``` — rewritten against the new upstream endpoint `https://content-api-prod.nba.com/public/1/leagues/wnba/draft/{season}/board`. The old `wnba.com/wp-json/api/v1/get_draft_board` endpoint stopped serving data; the replacement returns a tidied named list of two tibbles — `board` (draft metadata) and `picks` (one row per pick with team, prospect, career stats, and headshot URL). See `?wnba_draftboard` for the column schema.

### **Bug Fixes**

* ```espn_wbb_conferences()``` — ESPN dropped the `subGroups` column from its scoreboard-conferences response; the function now uses `dplyr::select(-dplyr::any_of("subGroups"))` so new column drops no longer break the call. Also initializes `conferences <- NULL` before the `tryCatch` so a transient error surfaces a `cli_alert_danger` instead of `object 'conferences' not found`.
* ```ncaa_wbb_NET_rankings()``` — the NCAA.com rankings table now exposes `Conf`/`Prev`/`Quad 1..4` headers; after `janitor::clean_names()` these land as `conf`/`prev`/`quad_1..4`, breaking the documented schema. The function now renames `conf → conference` and `prev → previous` via `dplyr::rename(dplyr::any_of(...))` so existing consumers keep working while the new `quad_*` columns ride along untouched.
* **Return-value initialization pattern** — swept ~124 WNBA and ESPN wrappers that `return(df_list)` (or returned other vars assigned only inside `tryCatch(expr = ...)`) without initializing the return value first. When the API errored, callers saw `object 'df_list' not found` instead of the intended `cli::cli_alert_danger` + empty-list fallback. Each wrapper now initializes its return variable before `tryCatch`, so errors degrade gracefully to an empty list / NULL. Affected files: `R/wnba_stats_boxscore.R`, `R/wnba_stats_boxscore_v3.R`, `R/wnba_stats_cume.R`, `R/wnba_stats_draft.R`, `R/wnba_stats_franchise.R`, `R/wnba_stats_leaders.R`, `R/wnba_stats_league.R`, `R/wnba_stats_league_dash.R`, `R/wnba_stats_lineups.R`, `R/wnba_stats_pbp.R`, `R/wnba_stats_player.R`, `R/wnba_stats_player_dash.R`, `R/wnba_stats_roster.R`, `R/wnba_stats_scoreboard.R`, `R/wnba_stats_shotchart.R`, `R/wnba_stats_team.R`, `R/wnba_stats_team_dash.R`, `R/wnba_stats_video.R`, `R/espn_wbb_data.R`, `R/espn_wnba_data.R`, `R/wnba_data_pbp.R`.
* ```wnba_data_pbp()``` — added `plays_df <- data.frame()` init so HTTP/2 stream errors from `data.wnba.com` return an empty data frame with a `cli_alert_danger` rather than `object 'plays_df' not found`.

### **Test Suite Hardening**

* Flipped **394** column assertions from strict `expect_equal(sort(colnames(x)), sort(cols))` to subset checks `expect_in(sort(cols), sort(colnames(x)))` across **115** test files — per the CLAUDE.md guidance, WNBA / ESPN APIs add columns without removing old ones, and the strict checks were brittle.
* Injected `skip("No rows returned from endpoint at test time")` guards into **114** test files so tests which access `x[[1]]` degrade gracefully to a skip (rather than a subscript-out-of-bounds error) when the upstream endpoint errors or returns empty.
* Cleaned stale column names out of expected `cols` lists where ESPN renamed/removed columns (`jersey`, `active`, `team_x_ref_2`, `team_is_all_star`, `Team_ID` → `TEAM_ID`).
* Added per-element null/empty-column check helpers to `test-wnba_teamvsplayer.R` and `test-wnba_playerdashboardbyclutch.R` so tests tolerate the WNBA Stats API returning fewer result-set elements than the test expects.
* Added `tools/` directory (excluded from the package build via `.Rbuildignore`) containing the one-off R scripts used to apply the above sweeps: `patch_df_list_init.R`, `patch_return_var_init.R`, `flip_expect_equal_cols.R`, `inject_skip_guard.R`.

### **Deprecations (lifecycle, slated for 3.1.0 removal)**

Adds `lifecycle` to `Imports` and migrates every existing
`cli::cli_alert_danger()` deprecation stub to `lifecycle::deprecate_stop()`,
matching the style used in `hoopR`. Calling any of these functions now
errors with a structured `lifecycleDeprecatedError` that names a
replacement (or, where none exists, an explanation). Their tests skip
with a `"Deprecated: <fn>() now errors by design; use <replacement>."`
message before the function call.

Newly deprecated in 3.0.0 — endpoints returned `<!DOCTYPE html>` (HTTP
404 / maintenance page) at test time:

* `wnba_boxscoreplayertrackv2()` → `wnba_boxscoreplayertrackv3()`
* `wnba_data_pbp()` → `wnba_pbp()` (the `data.wnba.com` mobile_teams feed
  is unstable; HTTP/2 stream errors are routine)
* `wnba_leaguelineupviz()` → details only; nearest substitute is
  `wnba_leaguedashlineups()`
* `wnba_playercareerbycollege()` → details only; consider
  `wnba_playercareerbycollegerollup()` or `wnba_leaguedashplayerbiostats()`
* `wnba_teamgamestreakfinder()` → `wnba_teamgamelogs()`
* `wnba_teamhistoricalleaders()` → `wnba_franchiseleaders()`
* `wnba_teamyearbyyearstats()` → details only; consider
  `wnba_franchisehistory()` or `wnba_teamdashboardbyyearoveryear()`

Already deprecated, re-stated under the lifecycle pattern:

* `wnba_boxscorehustlev2()` (3.0.0) — endpoint dead, no replacement
* `wnba_hustlestatsboxscore()` (3.0.0) — endpoint dead, no replacement
* `wnba_leaguehustlestatsplayer()` (3.0.0) — endpoint dead, no replacement
* `wnba_leaguehustlestatsplayerleaders()` (3.0.0) — endpoint dead, no replacement
* `wnba_leaguehustlestatsteam()` (3.0.0) — endpoint dead, no replacement
* `wnba_leaguehustlestatsteamleaders()` (3.0.0) — endpoint dead, no replacement
* `wnba_homepageleaders()` (2.1.0) → `wnba_homepagewidget()`
* `wnba_homepagev2()` (2.1.0) → `wnba_homepagewidget()`
* `wnba_leaderstiles()` (2.1.0) → `wnba_homepagewidget()`
* `wnba_scoreboard()` (2.1.0) → `wnba_scoreboardv3()`
* `wnba_teaminfocommon()` (2.1.0) → `wnba_teamdetails()`
* `wnba_videodetails()` (3.0.0) → `wnba_videoevents()`
* `wnba_playerprofilev2()` (3.0.0) → `wnba_playercareerstats()`. The
  upstream `playerprofilev2` endpoint still returns the named-list
  shape but every `SeasonTotals*` and `CareerTotals*` table comes back
  zero-row in 2025 (verified against multiple active players).
  `wnba_playercareerstats()` exposes the same career totals.
* `wnba_videodetailsasset()` (3.0.0) → `wnba_videoevents()`

Soft warning (lifecycle::deprecate_warn) — function still runs but
recommends a replacement; will escalate to `deprecate_stop` if the
upstream endpoint isn't restored:

* `wnba_boxscoresummaryv3()` → `wnba_boxscoresummaryv2()`. The V3
  endpoint still answers 200 OK with the full schema, but the core
  result sets (`game_summary`, `line_score`, `inactive_players`,
  `other_stats`, `available_video`, `game_info`, `arena_info`) come
  back zero-row in 2025; only `officials` and `last_five_meetings`
  populate. The V2 variant still returns full data.

### **HTTP layer**

* **Restored proxy support.** When wehoop migrated from `httr` to `httr2`
  in the V3 work, the legacy `httr::use_proxy()` plumbing was dropped
  and `request_with_proxy()` quietly stopped honoring proxies (its
  `...` was preserved purely for source compatibility — see the prior
  comment "currently unused (preserved for backwards compatibility
  with callers that previously passed `httr::use_proxy()` etc.)"). Both
  `request_with_proxy()` and the lower-level `.retry_request()` now
  accept a `proxy =` argument:
    - `proxy = NULL` (default) — libcurl reads `http_proxy` /
      `https_proxy` / `no_proxy` env vars automatically.
    - `proxy = "http://host:port"` — string form, forwarded to
      `httr2::req_proxy(url = ...)`.
    - `proxy = list(url=, port=, username=, password=, auth=)` —
      named list spread into `httr2::req_proxy()` for authenticated
      proxies.
  Resolution order in `.retry_request()`: explicit `proxy =` arg →
  `getOption("wehoop.proxy")` → libcurl env vars. The `...` thread
  works for WNBA Stats wrappers (which forward into
  `request_with_proxy()`); ESPN / NCAA wrappers call `.retry_request()`
  directly without `...`, so use `options(wehoop.proxy = ...)` at the
  top of the session to cover those without per-function plumbing.
  Validated end-to-end: `ncaa_wbb_teams()` and `espn_wnba_game_all()`
  both routed through an authenticated test proxy via the option
  fallback.

### **Test infrastructure**

* **Empty / NULL responses now FAIL the test instead of silently
  SKIPping.** The earlier `skip("No rows returned from endpoint at
  test time")` guard was hiding regressions: when an upstream endpoint
  starts returning HTML (404 / maintenance) or breaks in some other
  silent way, the test should flag it. Converted all 117 such guards
  across `tests/testthat/test-*.R` from `skip(...)` to `fail(...) +
  return(invisible(NULL))` so the test surfaces a FAIL count for
  follow-up. Deprecation skips and the env-gated `skip_*_test()` /
  `skip_on_cran()` / `skip_on_ci()` helpers are unchanged.
* Pinned 16 `wnba_team*` test files from `most_recent_wnba_season()` to
  `most_recent_wnba_season() - 1` so the team-stats endpoints have a
  known-completed season to query and don't degenerate to "no rows" in
  the WNBA off-season window. `wnba_teams()` and standings tests still
  track the live season because that's what they're meant to verify.
* Bumped `.ncaa_headers()` user-agent to Chrome 130 and added the
  `Sec-Fetch-*` / `sec-ch-ua-*` headers a real browser sends.
* `ncaa_wbb_teams()` keeps its legacy `stats.ncaa.org/team/inst_team_list`
  scrape (per-season per-division team list with `season_id` populated),
  and now threads the `proxy =` argument from `...` through to
  `.retry_request()` at the top level. `stats.ncaa.org` is fronted by
  Akamai and returns HTTP 403 (`Reference #18.<...>`) to many
  residential and cloud IP ranges; pass a proxy that egresses from a
  non-blocked address — either per-call
  (`ncaa_wbb_teams(year, division, proxy = list(url=, port=, username=,
  password=))`) or session-wide (`options(wehoop.proxy = list(...))`).
  See the `Network access` section of `?ncaa_wbb_teams` for the full
  resolution order.


# **wehoop 2.1.0**

* ```wnba_homepagewidget()``` function added to replace the following homepage functions being deprecated.
* ```wnba_homepageleaders()``` function deprecated due to WNBA Stats API deprecation.
* ```wnba_homepagev2()``` function deprecated due to WNBA Stats API deprecation.
* ```wnba_leaderstiles()``` function deprecated due to WNBA Stats API deprecation.
* ```wnba_scoreboard()``` function deprecated due to WNBA Stats API deprecation (use ```wnba_scoreboardv3()```).
* ```wnba_teaminfocommon()``` function deprecated due to WNBA Stats API deprecation (use ```wnba_teamdetails()```).

# **wehoop 2.0.0**

* ```load_wnba_*()``` functions now use `sportsdataverse-data` releases url instead of `wehoop-data` repository URL
* ```load_wbb_*()``` functions now use `sportsdataverse-data` releases url instead of `wehoop-data` repository URL
* ```wnba_pbp()``` function and new ```wnba_pbps()``` function added with `on_court` (default `TRUE`) parameter to return on court players for each play event

# **wehoop 1.9.0**

### **WNBA Stats API Live Endpoints**

* ```wnba_live_pbp()``` function added.
* ```wnba_live_boxscore()``` function added.
* ```wnba_todays_scoreboard()``` function added.

### **WNBA Boxscore V3 (and V3-styled) Endpoints Added**

* ```wnba_scoreboardv3()``` function added.
* ```wnba_boxscoretraditionalv3()``` function added.
* ```wnba_boxscoreadvancedv3()``` function added.
* ```wnba_boxscoremiscv3()``` function added.
* ```wnba_boxscorescoringv3()``` function added.
* ```wnba_boxscoreusagev3()``` function added.
* ```wnba_boxscorefourfactorsv3()``` function added.
* ```wnba_boxscoreplayertrackv3()``` function added.
* ```wnba_boxscorehustlev2()``` function added.

### **Other WNBA Stats API functions added**

* ```wnba_shotchartlineupdetail()``` function added.
* ```wnba_franchiseleaderswrank()``` function added.
* ```wnba_leaderstiles()``` function added.
* ```wnba_leagueleaders()``` function added.
* ```wnba_videodetailsasset()``` function added.
* ```wnba_infographicfanduelplayer()``` function added.

### **Other Functions Added**

- ```ncaa_wbb_teams()``` function added.

### **Proxy Capability Added and Other Notes**

- Add rlang dots option for passing ```httr::use_proxy()``` option to `wnba_*()` functions
- Returns documentation added for all working WNBA Stats API endpoints and ESPN functions
- Tests added for all working WNBA Stats API endpoints and ESPN functions, over 750 tests when
  run locally

# **wehoop 1.8.0**

* Add proxy rlang dots option for passing httr::use_proxy() option to wnba_stats_*() functions
* Improved output for ```espn_wbb_team_box()```, ```espn_wbb_player_box()```, ```espn_wnba_team_box()```, ```espn_wnba_player_box()```

# **wehoop 1.7.0**

* ```espn_wbb_game_rosters()``` function added.
* ```espn_wnba_game_rosters()``` function added.
* ```wnba_teams()``` function added. Useful for cross-walking between ESPN and WNBA Stats API

# **wehoop 1.6.0**

* Updates tidyr and dplyr statements to use quotations on columns instead of data masking per tidyselect deprecation notice.

# **wehoop 1.5.0**

## ~106 WNBA Stats API functions added

|name                                           |file                       |
|:----------------------------------------------|:--------------------------|
|```wnba_alltimeleadersgrids()```               |R/wnba_stats_leaders.R     |
|```wnba_assistleaders()```                     |R/wnba_stats_leaders.R     |
|```wnba_assisttracker()```                     |R/wnba_stats_leaders.R     |
|```wnba_boxscoreadvancedv2()```                |R/wnba_stats_boxscore.R    |
|```wnba_boxscorefourfactorsv2()```             |R/wnba_stats_boxscore.R    |
|```wnba_boxscoremiscv2()```                    |R/wnba_stats_boxscore.R    |
|```wnba_boxscoreplayertrackv2()```             |R/wnba_stats_boxscore.R    |
|```wnba_boxscorescoringv2()```                 |R/wnba_stats_boxscore.R    |
|```wnba_boxscoresummaryv2()```                 |R/wnba_stats_boxscore.R    |
|```wnba_boxscoretraditionalv2()```             |R/wnba_stats_boxscore.R    |
|```wnba_boxscoreusagev2()```                   |R/wnba_stats_boxscore.R    |
|```wnba_commonallplayers()```                  |R/wnba_stats_roster.R      |
|```wnba_commonplayerinfo()```                  |R/wnba_stats_roster.R      |
|```wnba_commonplayoffseries()```               |R/wnba_stats_roster.R      |
|```wnba_commonteamroster()```                  |R/wnba_stats_roster.R      |
|```wnba_cumestatsplayer()```                   |R/wnba_stats_cume.R        |
|```wnba_cumestatsplayergames()```              |R/wnba_stats_cume.R        |
|```wnba_cumestatsteam()```                     |R/wnba_stats_cume.R        |
|```wnba_cumestatsteamgames()```                |R/wnba_stats_cume.R        |
|```wnba_data_pbp()```                          |R/wnba_data_pbp.R          |
|```wnba_draftboard()```                        |R/wnba_stats_draft.R       |
|```wnba_draftcombinedrillresults()```          |R/wnba_stats_draft.R       |
|```wnba_draftcombinenonstationaryshooting()``` |R/wnba_stats_draft.R       |
|```wnba_draftcombineplayeranthro()```          |R/wnba_stats_draft.R       |
|```wnba_draftcombinespotshooting()```          |R/wnba_stats_draft.R       |
|```wnba_draftcombinestats()```                 |R/wnba_stats_draft.R       |
|```wnba_drafthistory()```                      |R/wnba_stats_draft.R       |
|```wnba_fantasywidget()```                     |R/wnba_stats_lineups.R     |
|```wnba_franchisehistory()```                  |R/wnba_stats_franchise.R   |
|```wnba_franchiseleaders()```                  |R/wnba_stats_franchise.R   |
|```wnba_franchiseplayers()```                  |R/wnba_stats_franchise.R   |
|```wnba_gamerotation()```                      |R/wnba_stats_boxscore.R    |
|```wnba_homepageleaders()```                   |R/wnba_stats_leaders.R     |
|```wnba_homepagev2()```                        |R/wnba_stats_leaders.R     |
|```wnba_hustlestatsboxscore()```               |R/wnba_stats_boxscore.R    |
|```wnba_leaguedashlineups()```                 |R/wnba_stats_lineups.R     |
|```wnba_leaguedashplayerbiostats()```          |R/wnba_stats_league_dash.R |
|```wnba_leaguedashplayerclutch()```            |R/wnba_stats_league_dash.R |
|```wnba_leaguedashplayershotlocations()```     |R/wnba_stats_league_dash.R |
|```wnba_leaguedashplayerstats()```             |R/wnba_stats_league_dash.R |
|```wnba_leaguedashteamclutch()```              |R/wnba_stats_league_dash.R |
|```wnba_leaguedashteamshotlocations()```       |R/wnba_stats_league_dash.R |
|```wnba_leaguedashteamstats()```               |R/wnba_stats_league_dash.R |
|```wnba_leaguegamefinder()```                  |R/wnba_stats_league.R      |
|```wnba_leaguegamelog()```                     |R/wnba_stats_league.R      |
|```wnba_leaguehustlestatsplayer()```           |R/wnba_stats_hustle.R      |
|```wnba_leaguehustlestatsplayerleaders()```    |R/wnba_stats_hustle.R      |
|```wnba_leaguehustlestatsteam()```             |R/wnba_stats_hustle.R      |
|```wnba_leaguehustlestatsteamleaders()```      |R/wnba_stats_hustle.R      |
|```wnba_leaguelineupviz()```                   |R/wnba_stats_lineups.R     |
|```wnba_leagueplayerondetails()```             |R/wnba_stats_lineups.R     |
|```wnba_leagueseasonmatchups()```              |R/wnba_stats_lineups.R     |
|```wnba_leaguestandingsv3()```                 |R/wnba_stats_league.R      |
|```wnba_pbp()```                               |R/wnba_stats_pbp.R         |
|```wnba_playerawards()```                      |R/wnba_stats_player.R      |
|```wnba_playercareerbycollege()```             |R/wnba_stats_player.R      |
|```wnba_playercareerbycollegerollup()```       |R/wnba_stats_player.R      |
|```wnba_playercareerstats()```                 |R/wnba_stats_player.R      |
|```wnba_playercompare()```                     |R/wnba_stats_player.R      |
|```wnba_playerdashboardbyclutch()```           |R/wnba_stats_player_dash.R |
|```wnba_playerdashboardbygamesplits()```       |R/wnba_stats_player_dash.R |
|```wnba_playerdashboardbygeneralsplits()```    |R/wnba_stats_player_dash.R |
|```wnba_playerdashboardbylastngames()```       |R/wnba_stats_player_dash.R |
|```wnba_playerdashboardbyopponent()```         |R/wnba_stats_player_dash.R |
|```wnba_playerdashboardbyshootingsplits()```   |R/wnba_stats_player_dash.R |
|```wnba_playerdashboardbyteamperformance()```  |R/wnba_stats_player_dash.R |
|```wnba_playerdashboardbyyearoveryear()```     |R/wnba_stats_player_dash.R |
|```wnba_playerestimatedmetrics()```            |R/wnba_stats_player.R      |
|```wnba_playerfantasyprofile()```              |R/wnba_stats_player.R      |
|```wnba_playerfantasyprofilebargraph()```      |R/wnba_stats_player.R      |
|```wnba_playergamelog()```                     |R/wnba_stats_player.R      |
|```wnba_playergamelogs()```                    |R/wnba_stats_player.R      |
|```wnba_playergamestreakfinder()```            |R/wnba_stats_player.R      |
|```wnba_playerheadshot()```                    |R/wnba_stats_player.R      |
|```wnba_playerindex()```                       |R/wnba_stats_player.R      |
|```wnba_playernextngames()```                  |R/wnba_stats_player.R      |
|```wnba_playerprofilev2()```                   |R/wnba_stats_player.R      |
|```wnba_playervsplayer()```                    |R/wnba_stats_player.R      |
|```wnba_scoreboard()```                        |R/wnba_stats_scoreboard.R  |
|```wnba_scoreboardv2()```                      |R/wnba_stats_scoreboard.R  |
|```wnba_shotchartdetail()```                   |R/wnba_stats_shotchart.R   |
|```wnba_shotchartleaguewide()```               |R/wnba_stats_shotchart.R   |
|```wnba_teamdashboardbyclutch()```             |R/wnba_stats_team_dash.R   |
|```wnba_teamdashboardbygamesplits()```         |R/wnba_stats_team_dash.R   |
|```wnba_teamdashboardbygeneralsplits()```      |R/wnba_stats_team_dash.R   |
|```wnba_teamdashboardbylastngames()```         |R/wnba_stats_team_dash.R   |
|```wnba_teamdashboardbyopponent()```           |R/wnba_stats_team_dash.R   |
|```wnba_teamdashboardbyshootingsplits()```     |R/wnba_stats_team_dash.R   |
|```wnba_teamdashboardbyteamperformance()```    |R/wnba_stats_team_dash.R   |
|```wnba_teamdashboardbyyearoveryear()```       |R/wnba_stats_team_dash.R   |
|```wnba_teamdashlineups()```                   |R/wnba_stats_team_dash.R   |
|```wnba_teamdetails()```                       |R/wnba_stats_team.R        |
|```wnba_teamestimatedmetrics()```              |R/wnba_stats_team.R        |
|```wnba_teamgamelog()```                       |R/wnba_stats_team.R        |
|```wnba_teamgamelogs()```                      |R/wnba_stats_team.R        |
|```wnba_teamgamestreakfinder()```              |R/wnba_stats_team.R        |
|```wnba_teamhistoricalleaders()```             |R/wnba_stats_team.R        |
|```wnba_teaminfocommon()```                    |R/wnba_stats_team.R        |
|```wnba_teamplayerdashboard()```               |R/wnba_stats_team.R        |
|```wnba_teamplayeronoffdetails()```            |R/wnba_stats_team.R        |
|```wnba_teamplayeronoffsummary()```            |R/wnba_stats_team.R        |
|```wnba_teamvsplayer()```                      |R/wnba_stats_team.R        |
|```wnba_teamyearbyyearstats()```               |R/wnba_stats_team.R        |
|```wnba_videodetails()```                      |R/wnba_stats_video.R       |
|```wnba_videoevents()```                       |R/wnba_stats_video.R       |
|```wnba_videostatus()```                       |R/wnba_stats_video.R       |

## Adds 4 ESPN WBB and WNBA functions
- ```wehoop::espn_wbb_player_stats()``` function added.
- ```wehoop::espn_wbb_team_stats()``` function added.
- ```wehoop::espn_wnba_player_stats()``` function added.
- ```wehoop::espn_wnba_team_stats()``` function added.

* Removes ```furrr``` and ```future``` dependencies and replaces with ```purrr (>= 0.3.0)```

# **wehoop 1.2.1**
- Minor release to stay ahead of `tidyr` release revdepchecks

# **wehoop 1.2.0**
- Add returns for all the functions
- Update a handful of field names from the scoreboard functions and to also include neutral_site and conference_competition columns for the women's college basketball scoreboard function.

# **wehoop 1.1.1**
- Change functions from ```furrr::future_map_dfr()``` functions to ```data.table::rbindlist()``` functions for loaders.

# **wehoop 1.1.0**
### **Add schedule loaders**
- [```wehoop::load_wbb_schedule()```](https://wehoop.sportsdataverse.org/reference/load_wbb_schedule.html) function added
- [```wehoop::load_wnba_schedule()```](https://wehoop.sportsdataverse.org/reference/load_wnba_schedule.html) function added

# **wehoop 1.0.0**
### **Add team box score loaders**
- [```wehoop::load_wbb_team_box()```](https://wehoop.sportsdataverse.org/reference/load_wbb_team_box.html) function added
- [```wehoop::load_wnba_team_box()```](https://wehoop.sportsdataverse.org/reference/load_wnba_team_box.html) function added

### **Add player box score loaders**
- [```wehoop::load_wbb_player_box()```](https://wehoop.sportsdataverse.org/reference/load_wbb_player_box.html) function added
- [```wehoop::load_wnba_player_box()```](https://wehoop.sportsdataverse.org/reference/load_wnba_player_box.html) function added

### **Standings functions**
- [```wehoop::espn_wnba_standings()```](https://wehoop.sportsdataverse.org/reference/espn_wnba_standings.html)
- [```wehoop::espn_wbb_standings()```](https://wehoop.sportsdataverse.org/reference/espn_wbb_standings.html)

### **Getting Started vignette**
- [Getting started with wehoop data](https://wehoop.sportsdataverse.org/articles/getting-started-wehoop.html)

# **wehoop 0.9.2**
### **Quick fix for update db functions**

### **Dependency pruning**
This update is a non-user facing change to package dependencies to shrink the list of dependencies.

# **wehoop 0.9.1**
### **Clean names and team returns**
- All functions have now been given the [```janitor::clean_names()```](https://rdrr.io/cran/janitor/man/clean_names.html) treatment
- [```wehoop::espn_wbb_teams()```](https://wehoop.sportsdataverse.org/reference/espn_wbb_teams.html) has updated the returns to be more identity information related only
- [```wehoop::espn_wnba_teams()```](https://wehoop.sportsdataverse.org/reference/espn_wnba_teams.html) to be more identity information related only
- All tests were updated

# **wehoop 0.9.0**
### **Loading capabilities added to the package**
- [```wehoop::load_wbb_pbp()```](https://wehoop.sportsdataverse.org/reference/load_wbb_pbp.html) and [```wehoop::update_wbb_db()```](https://wehoop.sportsdataverse.org/reference/update_wbb_db.html) functions added
- [```wehoop::load_wnba_pbp()```](https://wehoop.sportsdataverse.org/reference/load_wnba_pbp.html) and [```wehoop::update_wnba_db()```](https://wehoop.sportsdataverse.org/reference/update_wnba_db.html) functions added

# **wehoop 0.3.0**
###  **Dependencies**
- ```R``` version 3.5.0 or greater dependency added
- ```purrr``` version 0.3.0 or greater dependency added
- ```rvest``` version 1.0.0 or greater dependency added
- ```progressr``` version 0.6.0 or greater dependency added
- ```usethis``` version 1.6.0 or greater dependency added
- ```xgboost``` version 1.1.0 or greater dependency added
- ```tidyr``` version 1.0.0 or greater dependency added
- ```stringr``` version 1.3.0 or greater dependency added
- ```tibble``` version 3.0.0 or greater dependency added
- ```furrr``` dependency added
- ```future``` dependency added

### **Test coverage**
* Added tests for all ESPN functions

#### **Function Naming Convention Change**
* Similarly, data and metrics sourced from ESPN will begin with `espn_` as opposed to `wbb_` or `wnba_`.
* Data sourced directly from the NCAA website will start the function with `ncaa_`

# **wehoop 0.2.0**
- Added support for ESPN's play-by-play endpoints with the addition of the following functions:
- ```wehoop::espn_wnba_game_all()``` - a convenience wrapper function around the following three functions (returns the results as a list of three data frames)
- ```wehoop::espn_wnba_team_box()```
- ```wehoop::espn_wnba_player_box()```
- ```wehoop::espn_wnba_pbp()```
- ```wehoop::espn_wnba_teams()```
- ```wehoop::espn_wbb_scoreboard()```

# **wehoop 0.1.0**
- Added support for ESPN's play-by-play endpoints with the addition of the following functions:
- ```wehoop::espn_wbb_game_all()``` - a convenience wrapper function around the following three functions (returns the results as a list of three data frames)
- ```wehoop::espn_wbb_team_box()```
- ```wehoop::espn_wbb_player_box()```
- ```wehoop::espn_wbb_pbp()```
- ```wehoop::espn_wbb_teams()```
- ```wehoop::espn_wbb_conferences()```
- ```wehoop::espn_wbb_scoreboard()```
- ```wehoop::ncaa_wbb_NET_rankings()```
- ```wehoop::espn_wbb_rankings()```
