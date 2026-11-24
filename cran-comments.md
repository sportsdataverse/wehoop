## Release summary

This is a minor release (3.1.0), an update to 3.0.0 (CRAN, 2026-08-24). The
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
  loaders (`load_wbb_groups()`, `load_wnba_groups()` and friends), WNBA
  Stats release loaders (game lineups, player and team box scores, metric
  curves, rolling windows and matchups) and Fox Sports,
  Basketball-Reference and crosswalk improvements.
* Fixes for ESPN play-by-play running scores, past-season ESPN rosters,
  `wnba_todays_scoreboard()` and the cdn.nba.com / cdn.wnba.com headers,
  `wbb_team_crosswalk()` and `bart_wbb_ratings()`.
* Three stats.ncaa.org to ESPN crosswalk loaders
  (`load_wbb_ncaa_espn_team_crosswalk()`, `load_wbb_ncaa_espn_schools()`,
  `load_wbb_ncaa_espn_school_seasons()`), and the `load_ncaa_wbb_*()`
  loaders now return their numeric stats.ncaa.org and ESPN join ids as
  integer.
* The release loaders accept exactly the seasons the data releases
  publish, fall back to the newest published season when the current one
  is not out yet, retry slow downloads, and return ESPN and WNBA Stats join
  ids as integer (including `entity_id` / `team_id` in
  `load_wnba_stats_metric_curves()` and `load_wnba_stats_rolling_windows()`;
  an id that is not a whole number becomes NA with a warning).
  `update_wbb_db()` / `update_wnba_db()` read the games index in full
  before they drop or rebuild a table. After the data releases' 2026-11
  backfill, the WBB and WNBA loaders no longer skip seasons that used to be
  missing, every published season is available as `.rds`, so no loader
  needs arrow for an older season, and `load_wbb_player_stats()` starts in
  2010 (the withdrawn 2006-2009 files held multi-season totals),
  `load_wbb_standings()` in 2001, `load_wbb_player_crosswalk()` in 2007
  (the WBB schedule and player crosswalks also gain integer stats.ncaa.org
  ids), and `load_wnba_team_stats()` and `load_wnba_player_stats()` in
  1997. `load_wnba_stats_coaches()` skips the unpublished 2019 season (also
  for `seasons = TRUE` and `update_wnba_stats_db()`), warning without a
  download when 2019 is asked for.
* Dependencies: jsonlite now requires (>= 1.6) for parse_json(), httr2
  (>= 1.0.4) for req_retry(retry_on_failure = ), withr is a new import and
  tibble moved from Suggests to Imports. Rcpp and RcppParallel (unused; the
  package has no compiled code) are no longer imported, glmnet, Matrix and
  stringdist moved to Suggests, and usethis, cachem, crayon, ggrepel, gh,
  memoise, piggyback and tictoc (all unused) are no longer suggested.

## Test environments

All local checks below ran on 2026-11-24 on one tarball built (`R CMD
build`, 1,876,893 bytes) from `git archive` of commit 661c66fc6. The
commits after it change only this file, which is in `.Rbuildignore`, so
the tarball contents are the same.

* Local Windows 10 x64, R 4.6.0 (ucrt), `R CMD check --as-cran
  --run-donttest --timings`, with `_R_CHECK_CRAN_INCOMING_REMOTE_=true`,
  NOT_CRAN unset and an empty user `.Renviron` (no API keys, no live-test
  switches): `Status: OK`. Tests: 0 failures, 0 warnings, 697 skips,
  8,781 passes. The PDF and HTML manuals build.
* The same check under R 4.6.1 (ucrt) on the same machine: 0 errors, 0
  warnings and 1 NOTE, "Found the following files/directories: ''NULL''"
  (non-standard things in the check directory). That NOTE comes from R
  4.6.1 on this machine, not from the package: started with
  `R_LIBS_USER='NULL'` (the value R CMD check gives it, quotes included on
  Windows), R 4.6.1 creates a directory with that name in its working
  directory, before any package loads. A one-function dummy package checked
  the same way gets the same `'NULL'` directory, and R 4.6.0 creates none.
  Tests and examples were otherwise identical (0 failures, 0 warnings, 697
  skips, 8,781 passes).
* The same tarball checked offline under R 4.6.0 (`R CMD check
  --run-donttest --no-tests --no-manual` with every proxy variable pointed
  at a closed local port): `Status: OK`. With no network, every
  `\donttest{}` example runs to the end: the failed requests show up as
  warnings or as errors caught by the examples' `try()`, and none stops
  the run.
* GitHub Actions R-CMD-check: R release on macOS, Windows and Ubuntu, R
  oldrel-1 and R-devel on Ubuntu. All five passed on this release branch
  at 42a8175b0 (2026-11-24). The commits after it change only an internal
  id-cast helper (a non-whole id now becomes NA with a warning instead of
  being truncated), its tests and contributor docs; the
  local checks above cover them.
* R-hub v2 (linux, macos, macos-arm64 and windows, all R-devel), run on
  42a8175b0 on 2026-11-24 (before the id-cast helper change above):
  linux and windows passed. macos-arm64 stopped while
  installing the suggested package arrow, whose source build failed in its
  bundled Boost CMake step before the wehoop check started. A run on the
  submitted commit was dispatched on 2026-11-24, results pending.
* win-builder (devel and release): not yet run (win-builder unreachable
  2026-11-24); to be run before submission.

## R CMD check results

0 errors | 0 warnings | 0 notes (R 4.6.0; see above for the R 4.6.1
`'NULL'` directory NOTE).

* **Example timing.** No example took more than 5 s. The slowest in the
  R 4.6.0 check were `nbl_rosetta_players` (2.01 s CPU, 3.52 s elapsed),
  `bart_wbb_game_schedule` (2.66 s / 3.41 s) and
  `load_ncaa_wbb_lineups` (0.34 s / 3.39 s).

* **Installed package size (INFO).** Locally (R 4.6.0):

      checking installed package size ... INFO
        installed size is  5.5Mb
        sub-directories of 1Mb or more:
          R      2.1Mb
          help   3.0Mb

  This is down from 6.7 MB earlier in this release cycle. The large
  families link to one family index page in "See also" instead of n²
  cross-links, each family's shared notes are printed once, alias pages
  link to the return table of the function they wrap instead of repeating
  it, and the nine Turkish federation leaders wrappers share one help page.
  What remains is mostly the documented return-column tables: wehoop
  exports 764 functions (up from 452 in 3.0.0; 289 of them belong to the new
  international league families), and 398 of its 560 help pages carry a
  table of the columns the function returns. The package has no compiled
  code and ships no large data (`data/` holds one 2.6 KB file).

The URL check (CRAN incoming feasibility) passed. The help pages name
Basketball-Reference without linking to it: the site answers automated
requests with HTTP 503. They give stats.wnba.com deep pages as plain text
for the same reason: that host stalls requests from data-centre machines.
The DESCRIPTION link to <https://stats.wnba.com/> is unchanged since 3.0.0.

## Reverse dependencies

There are no reverse dependencies on CRAN
(`tools::package_dependencies("wehoop", reverse = TRUE, db = available.packages(), which = "all")`
is empty, 2026-11-24).

## Notes for the CRAN team

### Deprecations

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

### Examples

* Some examples run only in interactive sessions (`@examplesIf
  interactive()`), because each takes several seconds or many requests.
  The help pages that document several loaders run two of them; the rest
  are interactive-only:
  * The other loaders on the `load_wnba_stats_coaches`, `load_wnba_draft`
    and `load_wbb_game_rosters` pages, one release-file download each.
  * `wjbl_pbp()` (the route takes 5 to 10 s to answer),
    `atrium_player_stats()` (the server can take 5 s to build a season's
    tables) and `espn_wbb_teams()` (one request per conference, about 30).
    A quick call to a related function (`wjbl_game()`, `atrium_players()`,
    `espn_wbb_conferences()`) runs on those pages instead.
  * On the `espn_wbb_game_all` and `espn_wnba_game_all` pages: the team
    and player box examples (`game_all()` returns those tables too) and
    the game roster example (one request per team).
  * `wnba_schedule_crosswalk()`, `wbb_schedule_crosswalk()` and
    `wbb_player_crosswalk()`: each builds a whole season's crosswalk from
    several sources, one request per game date or team.
  * The season loaders whose file is several MB and grows through the
    season: `load_ncaa_wbb_{pbp,shots,lineups,matchup_stints,possessions,player_box}()`,
    `load_wbb_{pbp,shots,game_rosters,player_box}()`, `load_wnba_pbp()`,
    `load_wnba_stats_pbp()` and `load_wnba_stats_game_lineups()`.
  * `wnba_player_crosswalk()`, `wnba_shot_zones()` and the three
    `bref_wnba_*()` functions: stats.wnba.com and basketball-reference.com
    stall or refuse requests from data-centre machines.
* The Her Hoop Stats examples are in `\dontrun{}`: the functions need a
  paid subscription.
* The other networked examples are in `\donttest{}` and read public data.
  Many WNBA Stats wrappers show their usage as a code block in `@details`
  instead of `@examples`.

### Tests

Every test that needs the network is skipped on CRAN (`skip_on_cran()` plus
an opt-in environment variable per source). The tests that run on CRAN read
committed fixtures and mock the HTTP layer.

### Writing files

`update_wbb_db()`, `update_wnba_db()` and `update_wnba_stats_db()` used to
default `dbdir` to the working directory. They now default to
`tools::R_user_dir("wehoop", "data")`; no example or test calls them.
