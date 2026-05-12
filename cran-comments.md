## Release summary

This is a minor release that:

### New / restored functionality

* Adds V3 WNBA Stats API wrappers: `wnba_playbyplayv3()`, `wnba_boxscoresummaryv3()`, `wnba_boxscoreusagev3()`, plus a V3 → V2 compatibility pipeline used by `wnba_pbp()` that retains V2-compatible columns while adding V3-only columns (`x_legacy`, `y_legacy`, `shot_distance`, `shot_result`, `is_field_goal`, `points_total`, `shot_value`).
* Adds 28 new bulk-data loaders backed by new `sportsdataverse-data` release tags, all following the existing `load_wnba_pbp()` shape (`(seasons, ..., dbConnection = NULL, tablename = NULL)`, `progressively()` decorator, optional DB write, `wehoop_data` class on the in-memory result):
    * Rosters / per-player stats (8): `load_wbb_rosters()`, `load_wbb_player_stats()`, `load_wnba_rosters()`, `load_wnba_player_stats()`, `load_wnba_stats_rosters()`, `load_wnba_stats_coaches()`, `load_wnba_stats_player_stats()`, `load_wnba_stats_lineups()`.
    * Team summaries / standings / draft (8): `load_wbb_team_stats()`, `load_wbb_standings()`, `load_wnba_team_stats()`, `load_wnba_standings()`, `load_wnba_draft()`, `load_wnba_stats_team_stats()`, `load_wnba_stats_standings()`, `load_wnba_stats_draft()`.
    * Shot events / per-game rosters / game officials (9): `load_wbb_shots()`, `load_wbb_game_rosters()`, `load_wbb_officials()`, `load_wnba_shots()`, `load_wnba_game_rosters()`, `load_wnba_officials()`, `load_wnba_stats_shots()`, `load_wnba_stats_game_rosters()`, `load_wnba_stats_officials()`.
    * WNBA Stats schedules + player game logs + play-by-play (3): `load_wnba_stats_schedule()`, `load_wnba_stats_player_game_logs()`, `load_wnba_stats_pbp()`, reading from the `wnba_stats_schedules`, `wnba_stats_player_game_logs` (new tag) and `wnba_stats_pbp` release tags populated by the rewritten `wehoop-wnba-stats-data/R/wnba_stats_01_pbp.R` pipeline (V3 PBP with on-court lineups supplied directly by `wnba_pbp()`, plus possession assignment, FT-to-foul attribution, garbage-time flag, and a master schedule build). All three are also wired into `update_wnba_stats_db()`.
    * New `most_recent_wnba_stats_season()` helper (a thin wrapper around `most_recent_wnba_season()` for naming symmetry with the `wnba_stats_*` family).
* Rewrites `wnba_draftboard()` against the new upstream endpoint `https://content-api-prod.nba.com/public/1/leagues/wnba/draft/{season}/board` (the former `wnba.com/wp-json/api/v1/get_draft_board` endpoint no longer serves data). Returns a named list of two tibbles — `board` and `picks`.

### Bug fixes

* Corrects `.players_on_court()` quarter-length math to use 10-minute WNBA quarters (600 seconds per quarter, 2400 seconds of regulation) rather than the NBA 12-minute constants.
* Fixes `espn_wbb_conferences()` against ESPN's dropped `subGroups` column by using `dplyr::select(-dplyr::any_of("subGroups"))`.
* Fixes `ncaa_wbb_NET_rankings()` against NCAA.com's renamed `Conf`/`Prev` columns via `dplyr::rename(dplyr::any_of(c("conference" = "conf", "previous" = "prev")))`.
* Initializes the return variable before `tryCatch` across ~124 WNBA and ESPN wrappers so an upstream API error now falls through to a `cli::cli_alert_danger` + empty list/data.frame instead of `object '<var>' not found`.

### Deprecations

The following wrappers target WNBA Stats API endpoints that no longer return data. They are marked `@keywords internal`, their bodies are `cli::cli_alert_danger()` stubs, and they are slated for removal in `wehoop 3.1.0`:

* `wnba_boxscorehustlev2()`
* `wnba_hustlestatsboxscore()`
* `wnba_leaguehustlestatsplayer()`
* `wnba_leaguehustlestatsplayerleaders()`
* `wnba_leaguehustlestatsteam()`
* `wnba_leaguehustlestatsteamleaders()`
* `wnba_videodetails()`
* `wnba_videodetailsasset()`

### Test suite hardening

* Flipped 394 strict column assertions in 115 test files to the subset direction (`expect_in(expected_cols, actual_cols)`) so upstream column additions no longer fail the test suite.
* Injected skip-if-empty guards in 114 test files so transient API failures degrade to `skip("No rows returned from endpoint at test time")` instead of cascading into assertion failures.

### ESPN endpoint expansion

* Adds 58 new ESPN basketball endpoint wrappers (27 `espn_wbb_*`,
  31 `espn_wnba_*`) covering reference and catalog data, team detail,
  athlete coverage, event-level enrichments (odds, win probability,
  officials, broadcasts), WNBA-only artifacts (draft, free agents,
  transactions), and league-wide catalogs (leaders, venues, coaches,
  athletes index, season metadata). Internal helpers in
  `R/espn_basketball_*_helpers.R` keep WBB and WNBA implementations
  DRY. New vignette `vignettes/espn-endpoints.Rmd` documents the
  full surface; the pkgdown reference index has been split into
  per-domain subsections so the rendered nav scales for the new
  surface (80 ESPN wrappers total, up from 22).

## R CMD check results

0 errors | 0 warnings | 0 notes

On some local Windows runs, R CMD check emits the transient

    N  checking for future file timestamps
       unable to verify current time

NOTE. This is caused by R's clock-skew check failing to reach
`worldtimeapi.org` from the dev environment, not by anything in the
package; it does not appear on win-builder / CRAN. Setting
`_R_CHECK_SYSTEM_CLOCK_=0` suppresses it locally.

## Documentation conventions

Per the project's long-standing convention, executable code samples for
many wrappers appear inside the `@details` section as fenced markdown
code blocks. The 58 net-new ESPN wrappers added in this release also
carry standard `@examples \donttest{...}` blocks; the live-API examples
are marked `\donttest{}` because every wrapper requires network access
to ESPN, the WNBA Stats API, or NCAA.com, and the responses depend on
the current season state. The 141 pre-existing wrappers retain the
historical `@details`-only example pattern accepted in `wehoop` 2.x;
no functional change to those is included in this release.

## URL check note

`urlchecker::url_check()` reports HTTP 403 ("Forbidden") for several
`https://x.com/<user>` profile links in `README.md`. These pages render
correctly in browsers; X (Twitter) blocks anonymous bot traffic with a
403 response, so the URLs are reachable for end users but appear broken
to automated checkers. They have been left unchanged.

`R CMD check --as-cran` may emit a "CRAN incoming feasibility" NOTE
listing 2-3 `https://www.nba.com/stats/...` or `https://www.wnba.com/standings/...`
URLs as "(possibly) invalid" with `libcurl error code 92: HTTP/2 stream
... was not closed cleanly: INTERNAL_ERROR`. These URLs are reachable in
browsers and from CRAN's win-builder; the failure is a transient HTTP/2
stream error caused by NBA / WNBA edge servers terminating libcurl
streams in some dev environments. The URLs have been retained as-is.

## revdepcheck results

We checked 0 reverse dependencies, comparing R CMD check results across CRAN and dev versions of this package.

 * We saw 0 new problems
 * We failed to check 0 packages
