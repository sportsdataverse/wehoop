## Release summary

This is a minor release (3.1.0) on top of 3.0.0 (CRAN, 2026-08-24). The
full list of changes is in NEWS.md. The main additions:

* International women's basketball: 8 new league families (FIBA, Genius
  Sports, Sportradar Atrium, NBL / WNBL, the German DBBL, the Spanish FEB,
  the Turkish Basketball Federation and Japan's W League) plus
  per-competition shortcuts. Each family waits at least 1 s between
  requests to a host and raises classed conditions (`wehoop_no_data`,
  `wehoop_asset_fetch`, `wehoop_bad_request`) instead of returning an empty
  result.
* WNBA referee assignments from official.nba.com
  (`wnba_referee_assignments()`), new conference and division membership
  loaders (`load_wbb_groups()`, `load_wnba_groups()` and friends) and Fox
  Sports, Basketball-Reference and crosswalk improvements.
* Fixes for ESPN play-by-play running scores, past-season ESPN rosters,
  `wnba_todays_scoreboard()` and the cdn.nba.com / cdn.wnba.com headers,
  `wbb_team_crosswalk()` and `bart_wbb_ratings()`.
* The release loaders accept exactly the seasons the data releases
  publish, fall back to the newest published season when the current one
  is not out yet, and return ESPN and WNBA Stats join ids as integer.
* Dependencies: jsonlite now requires (>= 1.6) for parse_json(), httr2
  (>= 1.0.4) for req_retry(retry_on_failure = ), and withr is a new import.
  Rcpp and RcppParallel (unused; the package has no compiled code) are no
  longer imported, usethis is no longer suggested (messages go through cli,
  already imported), and glmnet, Matrix and stringdist moved to Suggests.

## Deprecations

The 3.0.0 cran-comments said the following defunct wrappers (they call
`lifecycle::deprecate_stop()` because their WNBA Stats endpoints no longer
return data) would be removed in 3.1.0. They stay exported in 3.1.0 to give
users more notice; their error messages and help pages now say they will
be removed in a future release, no earlier than 3.2.0:

* `wnba_boxscorehustlev2()`
* `wnba_hustlestatsboxscore()`
* `wnba_leaguehustlestatsplayer()`
* `wnba_leaguehustlestatsplayerleaders()`
* `wnba_leaguehustlestatsteam()`
* `wnba_leaguehustlestatsteamleaders()`
* `wnba_videodetails()`
* `wnba_videodetailsasset()`

## Examples

* Examples that call stats.wnba.com or basketball-reference.com run only
  in interactive sessions (`@examplesIf interactive()`): those hosts stall
  or refuse requests from data-centre machines. This covers
  `wnba_player_crosswalk()`, `wnba_shot_zones()` and the three
  `bref_wnba_*()` functions.
* `wbb_schedule_crosswalk()` and `wbb_player_crosswalk()` also run only
  interactively. Each builds a whole season from several sources and took
  195 s and 111 s under `--run-donttest`.
* The Her Hoop Stats examples are in `\dontrun{}`: the functions need a
  paid subscription.
* The other networked examples are in `\donttest{}`. They fail gracefully
  without network access: the ESPN, WNBA Stats and NCAA wrappers catch HTTP
  and parsing errors internally (`tryCatch()`), print a message and return
  an empty result, and the international-family wrappers, which raise
  classed errors instead, have their examples wrapped in `try()`. Many WNBA
  Stats wrappers show their usage as a code block in `@details` instead of
  `@examples`.

## Tests

Every test that needs the network is skipped on CRAN (`skip_on_cran()` plus
an opt-in environment variable per source). The tests that run on CRAN read
committed fixtures and mock the HTTP layer.

## Writing files

`update_wbb_db()`, `update_wnba_db()` and `update_wnba_stats_db()` used to
default `dbdir` to the working directory. They now default to
`tools::R_user_dir("wehoop", "data")`; no example or test calls them.

## R CMD check results

0 errors | 0 warnings | 0 notes

* Local Windows 10, R 4.6.0 (ucrt), `R CMD check --as-cran --timings` on
  the built tarball (2026-11-06; NOT_CRAN unset and an empty user
  `.Renviron`, so every networked test skips; `\donttest` examples not
  run): Status: OK. Tests: 0 failures, 8,760 passes. The PDF and HTML
  manuals build.
* win-builder (devel and release): to be run before submission.

The help pages name Basketball-Reference without linking to it: the site
answers automated requests (such as the incoming URL check) with HTTP 503.

### Expected NOTE: installed package size

Every platform we checked reports the installed size as INFO, but we
expect CRAN's machines to raise it as a NOTE. Locally (R 4.6.0):

    checking installed package size ... INFO
      installed size is  6.7Mb
      sub-directories of 1Mb or more:
        R      2.0Mb
        help   4.3Mb

The size is mostly help pages. wehoop is a set of thin wrappers over many
data APIs: it exports 754 functions (up from 452 in 3.0.0; 289 of them
belong to the new international league families) documented in 553 Rd
files, and each wrapper's help page carries a table of the columns it
returns. The package has no compiled code and ships no large data (the
`data/` directory is 4 KB), and the source tarball is 1.9 MB.

## Other platforms

* GitHub Actions R-CMD-check: R release on Ubuntu, macOS and Windows,
  R oldrel-1 and R-devel on Ubuntu, run on every pull request.

## revdepcheck results

There are no reverse dependencies on CRAN
(`tools::package_dependencies("wehoop", reverse = TRUE)` is empty).
