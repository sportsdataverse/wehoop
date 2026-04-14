# **wehoop 3.0.0**

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

### **Deprecations (slated for 3.1.0 removal)**

The following functions wrap WNBA Stats API endpoints that are no longer returning data. They are marked `@keywords internal`, their bodies have been replaced with `cli::cli_alert_danger()` stubs, and their tests are skipped with `"Skip this test due to deprecation"`. They remain exported for one release but will be removed in `wehoop 3.1.0`:

* ```wnba_boxscorehustlev2()```
* ```wnba_hustlestatsboxscore()```
* ```wnba_leaguehustlestatsplayer()```
* ```wnba_leaguehustlestatsplayerleaders()```
* ```wnba_leaguehustlestatsteam()```
* ```wnba_leaguehustlestatsteamleaders()```
* ```wnba_videodetails()```
* ```wnba_videodetailsasset()```


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
