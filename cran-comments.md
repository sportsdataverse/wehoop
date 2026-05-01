## Release summary

This is a minor release that:

### New / restored functionality

* Adds V3 WNBA Stats API wrappers: `wnba_playbyplayv3()`, `wnba_boxscoresummaryv3()`, `wnba_boxscoreusagev3()`, plus a V3 → V2 compatibility pipeline used by `wnba_pbp()` that retains V2-compatible columns while adding V3-only columns (`x_legacy`, `y_legacy`, `shot_distance`, `shot_result`, `is_field_goal`, `points_total`, `shot_value`).
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

## R CMD check results

0 errors | 0 warnings | 0 notes

On some local Windows runs, R CMD check emits the transient

    N  checking for future file timestamps
       unable to verify current time

NOTE. This is caused by R's clock-skew check failing to reach
`worldtimeapi.org` from the dev environment, not by anything in the
package; it does not appear on win-builder / CRAN. Setting
`_R_CHECK_SYSTEM_CLOCK_=0` suppresses it locally.

## revdepcheck results

We checked 0 reverse dependencies, comparing R CMD check results across CRAN and dev versions of this package.

 * We saw 0 new problems
 * We failed to check 0 packages
