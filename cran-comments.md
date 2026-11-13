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
  loaders (`load_wbb_groups()`, `load_wnba_groups()` and friends), the
  stats.ncaa.org to ESPN crosswalk loaders (`load_wbb_ncaa_espn_*()`) and Fox
  Sports, Basketball-Reference and crosswalk improvements.
* Fixes for ESPN play-by-play running scores, past-season ESPN rosters,
  `wnba_todays_scoreboard()` and the cdn.nba.com / cdn.wnba.com headers,
  `wbb_team_crosswalk()` and `bart_wbb_ratings()`.
* The release loaders accept exactly the seasons the data releases
  publish, fall back to the newest published season when the current one
  is not out yet, retry slow downloads, and return ESPN, WNBA Stats and
  stats.ncaa.org join ids as integer. `update_wbb_db()` / `update_wnba_db()` read the games
  index in full before they drop or rebuild a table. After the data
  releases' 2026-11 backfill, the WBB and WNBA loaders no longer skip
  seasons that used to be missing, every published season is available
  as `.rds`, so no loader needs arrow for an older season, and
  `load_wbb_player_stats()` starts in 2010 (the withdrawn 2006-2009 files
  held multi-season totals), `load_wbb_standings()` in 2001, and
  `load_wnba_team_stats()` and `load_wnba_player_stats()` in 1997.
* Dependencies: jsonlite now requires (>= 1.6) for parse_json(), httr2
  (>= 1.0.4) for req_retry(retry_on_failure = ), and withr is a new import.
  Rcpp and RcppParallel (unused; the package has no compiled code) are no
  longer imported, usethis is no longer suggested (messages go through cli,
  already imported), and glmnet, Matrix and stringdist moved to Suggests.

## Test environments

* Local Windows 10 x64, R 4.6.0 (ucrt), `R CMD check --as-cran
  --run-donttest --timings` on a tarball built from `git archive` of the
  submitted commit (2026-11-09), with `_R_CHECK_CRAN_INCOMING_REMOTE_=true`,
  NOT_CRAN unset. Tests: 0 failures, 4 warnings, 491 skips, 8,685 passes.
  The PDF and HTML manuals build. The test suite also passes with an empty
  user `.Renviron` (0 failures).
* The same tarball checked offline (`R CMD check --run-donttest --no-tests
  --no-manual` with every proxy variable pointed at a closed local port):
  `Status: OK`. With no network, every `\donttest{}` example runs to the end:
  they warn and return empty results, and none of them errors.
* GitHub Actions R-CMD-check: R release on macOS, Windows and Ubuntu, R
  oldrel-1 and R-devel on Ubuntu. All five passed on main at 3be435572
  (2026-11-09). The commits after it reorganise the help pages (with the
  internal R helpers that build the family index pages, and one test) and
  recompress one `.rda` file. The last of them makes a past-season ESPN
  roster warn and return zero rows instead of erroring when its box-score
  file cannot be downloaded. The local checks above cover all of them. The README rework (#119)
  landed after those checks ran, and so did the example changes listed
  under "Example timing changes" below (examples only; no R code changed).
* R-hub v2 (linux, macos, macos-arm64 and windows, all R-devel): passed on
  2026-11-06 at 59bac3e3b, an earlier commit than the one submitted.
* win-builder (devel and release): to be run before submission.

## R CMD check results

0 errors | 0 warnings | 1 note

* **Example timing (NOTE).** The final local check (`Status: 1 NOTE`)
  listed one example:

      Examples with CPU (user + system) or elapsed time > 5s
                                user system elapsed
      fiba_gamepage_box_players 0.19   0.01    7.72

  It is the first FIBA game-page example to run, so it makes the
  session's first FIBA requests: it looks up the competition and its
  schedule, which the other `fiba_gamepage_*` examples then reuse, and
  fetches the game page.
  The CPU time is 0.2 s and the rest is network wait. Run on its own in a
  fresh session it took 2.6 to 3.4 s elapsed (5.1 s once, with a check
  running alongside). Other checks run on this
  machine at the same time, which inflates elapsed times, so it is left
  as is.

* **Example timing changes.** Earlier local checks listed the help pages below
  as taking more than 5 s. Each page re-run on its own from the installed
  package (`system.time(example(fn, package = "wehoop", run.donttest = TRUE))`,
  the slower of two runs), before and after the changes in this
  submission:

  | help page                 | before: CPU / elapsed (s) | after: CPU / elapsed (s) |
  |:--------------------------|--------------------------:|-------------------------:|
  | load_wnba_stats_coaches   |              0.83 / 14.51 |              0.16 / 0.98 |
  | wjbl_pbp                  |               0.21 / 9.39 |              0.09 / 1.19 |
  | load_wnba_draft           |               0.48 / 6.32 |              0.22 / 0.83 |
  | load_wbb_game_rosters     |               0.68 / 5.87 |              0.29 / 1.37 |
  | espn_wbb_game_all         |              4.55 / 11.26 |              2.71 / 3.63 |
  | espn_wnba_game_all        |               2.68 / 9.59 |              2.43 / 3.17 |
  | espn_wbb_teams            |              0.60 / 21.99 |              0.07 / 0.26 |
  | atrium_player_stats       |               0.64 / 6.72 |              0.25 / 2.03 |
  | nbl_rosetta_matches       |               3.07 / 5.34 |              0.47 / 1.35 |
  | fiba_gamepage_box_players |               0.20 / 5.24 |   0.16 / 2.96 (no change) |
  | atrium_box_score          |               0.22 / 0.56 |   0.34 / 0.85 (no change) |

  The three `load_*` pages each document 12 to 14 loaders; each now runs
  two of them. `nbl_rosetta_matches()` asks for 10 matches. On the
  `wjbl_pbp`, `atrium_player_stats` and `espn_wbb_teams` pages a quick
  call to a related function (`wjbl_game()`, `atrium_players()`,
  `espn_wbb_conferences()`) runs instead of the slow one. These examples
  run only in interactive sessions (`@examplesIf interactive()`):
  * The other loaders on the `load_wnba_stats_coaches`, `load_wnba_draft`
    and `load_wbb_game_rosters` pages, one release-file download each.
  * `wjbl_pbp()` (the route takes 5 to 10 s to answer),
    `atrium_player_stats()` (the server can take 5 s to build a season's
    tables) and `espn_wbb_teams()` (one request per conference, about 30).
  * On the `espn_wbb_game_all` and `espn_wnba_game_all` pages: the team
    and player box examples (`game_all()` returns those tables too) and
    the game roster example (one request per team).
  * `wnba_schedule_crosswalk()`, `wbb_schedule_crosswalk()` and
    `wbb_player_crosswalk()`: each builds a whole season's crosswalk from
    several sources, one request per game date or team.
  * The season loaders whose file is several MB and grows through the
    season: `load_ncaa_wbb_{pbp,shots,lineups,matchup_stints,possessions,player_box}()`,
    `load_wbb_{pbp,shots,game_rosters,player_box}()`, `load_wnba_pbp()`
    and `load_wnba_stats_pbp()`.
  * `wnba_player_crosswalk()`, `wnba_shot_zones()` and the three
    `bref_wnba_*()` functions: stats.wnba.com and basketball-reference.com
    stall or refuse requests from data-centre machines.

* **Installed package size (INFO).** Locally (R 4.6.0):

      checking installed package size ... INFO
        installed size is  5.3Mb
        sub-directories of 1Mb or more:
          R      2.0Mb
          help   2.9Mb

  This is down from 6.7 MB earlier in this release cycle. The large
  families now link to one family index page in "See also" instead of n²
  cross-links, each family's shared notes are printed once, alias pages
  link to the return table of the function they wrap instead of repeating
  it, and the nine Turkish federation leaders wrappers share one help page.
  What remains is mostly the documented return-column tables: wehoop
  exports 754 functions (up from 452 in 3.0.0; 289 of them belong to the new
  international league families), and 395 of its 554 help pages carry a
  table of the columns the function returns. The package has no compiled
  code and ships no large data (the `data/` directory is 4 KB).

The URL check (CRAN incoming feasibility) passed. The help pages name
Basketball-Reference without linking to it: the site answers automated
requests with HTTP 503. They give stats.wnba.com deep pages as plain text
for the same reason: that host stalls requests from data-centre machines.
The DESCRIPTION link to <https://stats.wnba.com/> is unchanged since 3.0.0.

## Reverse dependencies

There are no reverse dependencies on CRAN
(`tools::package_dependencies("wehoop", reverse = TRUE, db = available.packages())`
is empty, 2026-11-09).

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

* The interactive-only examples are listed under "Example timing changes" above.
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
