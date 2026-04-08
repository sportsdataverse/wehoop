# Changelog

## **wehoop 2.1.0**

CRAN release: 2024-07-21

- [`wnba_homepagewidget()`](https://wehoop.sportsdataverse.org/reference/wnba_homepagewidget.md)
  function added to replace the following homepage functions being
  deprecated.
- [`wnba_homepageleaders()`](https://wehoop.sportsdataverse.org/reference/wnba_homepageleaders.md)
  function deprecated due to WNBA Stats API deprecation.
- [`wnba_homepagev2()`](https://wehoop.sportsdataverse.org/reference/wnba_homepagev2.md)
  function deprecated due to WNBA Stats API deprecation.
- [`wnba_leaderstiles()`](https://wehoop.sportsdataverse.org/reference/wnba_leaderstiles.md)
  function deprecated due to WNBA Stats API deprecation.
- [`wnba_scoreboard()`](https://wehoop.sportsdataverse.org/reference/wnba_scoreboard.md)
  function deprecated due to WNBA Stats API deprecation (use
  [`wnba_scoreboardv3()`](https://wehoop.sportsdataverse.org/reference/wnba_scoreboardv3.md)).
- [`wnba_teaminfocommon()`](https://wehoop.sportsdataverse.org/reference/wnba_teaminfocommon.md)
  function deprecated due to WNBA Stats API deprecation (use
  [`wnba_teamdetails()`](https://wehoop.sportsdataverse.org/reference/wnba_teamdetails.md)).

## **wehoop 2.0.0**

CRAN release: 2023-11-25

- `load_wnba_*()` functions now use `sportsdataverse-data` releases url
  instead of `wehoop-data` repository URL
- `load_wbb_*()` functions now use `sportsdataverse-data` releases url
  instead of `wehoop-data` repository URL
- [`wnba_pbp()`](https://wehoop.sportsdataverse.org/reference/wnba_pbp.md)
  function and new
  [`wnba_pbps()`](https://wehoop.sportsdataverse.org/reference/wnba_pbps.md)
  function added with `on_court` (default `TRUE`) parameter to return on
  court players for each play event

## **wehoop 1.9.0**

#### **WNBA Stats API Live Endpoints**

- [`wnba_live_pbp()`](https://wehoop.sportsdataverse.org/reference/wnba_live_pbp.md)
  function added.
- [`wnba_live_boxscore()`](https://wehoop.sportsdataverse.org/reference/wnba_live_boxscore.md)
  function added.
- [`wnba_todays_scoreboard()`](https://wehoop.sportsdataverse.org/reference/wnba_todays_scoreboard.md)
  function added.

#### **WNBA Boxscore V3 (and V3-styled) Endpoints Added**

- [`wnba_scoreboardv3()`](https://wehoop.sportsdataverse.org/reference/wnba_scoreboardv3.md)
  function added.
- [`wnba_boxscoretraditionalv3()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoretraditionalv3.md)
  function added.
- [`wnba_boxscoreadvancedv3()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoreadvancedv3.md)
  function added.
- [`wnba_boxscoremiscv3()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoremiscv3.md)
  function added.
- [`wnba_boxscorescoringv3()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscorescoringv3.md)
  function added.
- `wnba_boxscoreusagev3()` function added.
- [`wnba_boxscorefourfactorsv3()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscorefourfactorsv3.md)
  function added.
- [`wnba_boxscoreplayertrackv3()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoreplayertrackv3.md)
  function added.
- [`wnba_boxscorehustlev2()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscorehustlev2.md)
  function added.

#### **Other WNBA Stats API functions added**

- [`wnba_shotchartlineupdetail()`](https://wehoop.sportsdataverse.org/reference/wnba_shotchartlineupdetail.md)
  function added.
- [`wnba_franchiseleaderswrank()`](https://wehoop.sportsdataverse.org/reference/wnba_franchiseleaderswrank.md)
  function added.
- [`wnba_leaderstiles()`](https://wehoop.sportsdataverse.org/reference/wnba_leaderstiles.md)
  function added.
- [`wnba_leagueleaders()`](https://wehoop.sportsdataverse.org/reference/wnba_leagueleaders.md)
  function added.
- [`wnba_videodetailsasset()`](https://wehoop.sportsdataverse.org/reference/wnba_videodetailsasset.md)
  function added.
- [`wnba_infographicfanduelplayer()`](https://wehoop.sportsdataverse.org/reference/wnba_infographicfanduelplayer.md)
  function added.

#### **Other Functions Added**

- [`ncaa_wbb_teams()`](https://wehoop.sportsdataverse.org/reference/ncaa_wbb_teams.md)
  function added.

#### **Proxy Capability Added and Other Notes**

- Add rlang dots option for passing
  [`httr::use_proxy()`](https://httr.r-lib.org/reference/use_proxy.html)
  option to `wnba_*()` functions
- Returns documentation added for all working WNBA Stats API endpoints
  and ESPN functions
- Tests added for all working WNBA Stats API endpoints and ESPN
  functions, over 750 tests when run locally

## **wehoop 1.8.0**

- Add proxy rlang dots option for passing httr::use_proxy() option to
  wnba_stats\_\*() functions
- Improved output for
  [`espn_wbb_team_box()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_team_box.md),
  [`espn_wbb_player_box()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_player_box.md),
  [`espn_wnba_team_box()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team_box.md),
  [`espn_wnba_player_box()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_player_box.md)

## **wehoop 1.7.0**

- [`espn_wbb_game_rosters()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_game_rosters.md)
  function added.
- [`espn_wnba_game_rosters()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_rosters.md)
  function added.
- [`wnba_teams()`](https://wehoop.sportsdataverse.org/reference/wnba_teams.md)
  function added. Useful for cross-walking between ESPN and WNBA Stats
  API

## **wehoop 1.6.0**

- Updates tidyr and dplyr statements to use quotations on columns
  instead of data masking per tidyselect deprecation notice.

## **wehoop 1.5.0**

CRAN release: 2022-06-17

### ~106 WNBA Stats API functions added

| name                                                                                                                                 | file                       |
|:-------------------------------------------------------------------------------------------------------------------------------------|:---------------------------|
| [`wnba_alltimeleadersgrids()`](https://wehoop.sportsdataverse.org/reference/wnba_alltimeleadersgrids.md)                             | R/wnba_stats_leaders.R     |
| [`wnba_assistleaders()`](https://wehoop.sportsdataverse.org/reference/wnba_assistleaders.md)                                         | R/wnba_stats_leaders.R     |
| [`wnba_assisttracker()`](https://wehoop.sportsdataverse.org/reference/wnba_assisttracker.md)                                         | R/wnba_stats_leaders.R     |
| [`wnba_boxscoreadvancedv2()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoreadvancedv2.md)                               | R/wnba_stats_boxscore.R    |
| [`wnba_boxscorefourfactorsv2()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscorefourfactorsv2.md)                         | R/wnba_stats_boxscore.R    |
| [`wnba_boxscoremiscv2()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoremiscv2.md)                                       | R/wnba_stats_boxscore.R    |
| [`wnba_boxscoreplayertrackv2()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoreplayertrackv2.md)                         | R/wnba_stats_boxscore.R    |
| [`wnba_boxscorescoringv2()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscorescoringv2.md)                                 | R/wnba_stats_boxscore.R    |
| [`wnba_boxscoresummaryv2()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoresummaryv2.md)                                 | R/wnba_stats_boxscore.R    |
| [`wnba_boxscoretraditionalv2()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoretraditionalv2.md)                         | R/wnba_stats_boxscore.R    |
| [`wnba_boxscoreusagev2()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoreusagev2.md)                                     | R/wnba_stats_boxscore.R    |
| [`wnba_commonallplayers()`](https://wehoop.sportsdataverse.org/reference/wnba_commonallplayers.md)                                   | R/wnba_stats_roster.R      |
| [`wnba_commonplayerinfo()`](https://wehoop.sportsdataverse.org/reference/wnba_commonplayerinfo.md)                                   | R/wnba_stats_roster.R      |
| [`wnba_commonplayoffseries()`](https://wehoop.sportsdataverse.org/reference/wnba_commonplayoffseries.md)                             | R/wnba_stats_roster.R      |
| [`wnba_commonteamroster()`](https://wehoop.sportsdataverse.org/reference/wnba_commonteamroster.md)                                   | R/wnba_stats_roster.R      |
| [`wnba_cumestatsplayer()`](https://wehoop.sportsdataverse.org/reference/wnba_cumestatsplayer.md)                                     | R/wnba_stats_cume.R        |
| [`wnba_cumestatsplayergames()`](https://wehoop.sportsdataverse.org/reference/wnba_cumestatsplayergames.md)                           | R/wnba_stats_cume.R        |
| [`wnba_cumestatsteam()`](https://wehoop.sportsdataverse.org/reference/wnba_cumestatsteam.md)                                         | R/wnba_stats_cume.R        |
| [`wnba_cumestatsteamgames()`](https://wehoop.sportsdataverse.org/reference/wnba_cumestatsteamgames.md)                               | R/wnba_stats_cume.R        |
| [`wnba_data_pbp()`](https://wehoop.sportsdataverse.org/reference/wnba_data_pbp.md)                                                   | R/wnba_data_pbp.R          |
| [`wnba_draftboard()`](https://wehoop.sportsdataverse.org/reference/wnba_draftboard.md)                                               | R/wnba_stats_draft.R       |
| [`wnba_draftcombinedrillresults()`](https://wehoop.sportsdataverse.org/reference/wnba_draftcombinedrillresults.md)                   | R/wnba_stats_draft.R       |
| [`wnba_draftcombinenonstationaryshooting()`](https://wehoop.sportsdataverse.org/reference/wnba_draftcombinenonstationaryshooting.md) | R/wnba_stats_draft.R       |
| [`wnba_draftcombineplayeranthro()`](https://wehoop.sportsdataverse.org/reference/wnba_draftcombineplayeranthro.md)                   | R/wnba_stats_draft.R       |
| [`wnba_draftcombinespotshooting()`](https://wehoop.sportsdataverse.org/reference/wnba_draftcombinespotshooting.md)                   | R/wnba_stats_draft.R       |
| [`wnba_draftcombinestats()`](https://wehoop.sportsdataverse.org/reference/wnba_draftcombinestats.md)                                 | R/wnba_stats_draft.R       |
| [`wnba_drafthistory()`](https://wehoop.sportsdataverse.org/reference/wnba_drafthistory.md)                                           | R/wnba_stats_draft.R       |
| [`wnba_fantasywidget()`](https://wehoop.sportsdataverse.org/reference/wnba_fantasywidget.md)                                         | R/wnba_stats_lineups.R     |
| [`wnba_franchisehistory()`](https://wehoop.sportsdataverse.org/reference/wnba_franchisehistory.md)                                   | R/wnba_stats_franchise.R   |
| [`wnba_franchiseleaders()`](https://wehoop.sportsdataverse.org/reference/wnba_franchiseleaders.md)                                   | R/wnba_stats_franchise.R   |
| [`wnba_franchiseplayers()`](https://wehoop.sportsdataverse.org/reference/wnba_franchiseplayers.md)                                   | R/wnba_stats_franchise.R   |
| [`wnba_gamerotation()`](https://wehoop.sportsdataverse.org/reference/wnba_gamerotation.md)                                           | R/wnba_stats_boxscore.R    |
| [`wnba_homepageleaders()`](https://wehoop.sportsdataverse.org/reference/wnba_homepageleaders.md)                                     | R/wnba_stats_leaders.R     |
| [`wnba_homepagev2()`](https://wehoop.sportsdataverse.org/reference/wnba_homepagev2.md)                                               | R/wnba_stats_leaders.R     |
| [`wnba_hustlestatsboxscore()`](https://wehoop.sportsdataverse.org/reference/wnba_hustlestatsboxscore.md)                             | R/wnba_stats_boxscore.R    |
| [`wnba_leaguedashlineups()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguedashlineups.md)                                 | R/wnba_stats_lineups.R     |
| [`wnba_leaguedashplayerbiostats()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguedashplayerbiostats.md)                   | R/wnba_stats_league_dash.R |
| [`wnba_leaguedashplayerclutch()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguedashplayerclutch.md)                       | R/wnba_stats_league_dash.R |
| [`wnba_leaguedashplayershotlocations()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguedashplayershotlocations.md)         | R/wnba_stats_league_dash.R |
| [`wnba_leaguedashplayerstats()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguedashplayerstats.md)                         | R/wnba_stats_league_dash.R |
| [`wnba_leaguedashteamclutch()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguedashteamclutch.md)                           | R/wnba_stats_league_dash.R |
| [`wnba_leaguedashteamshotlocations()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguedashteamshotlocations.md)             | R/wnba_stats_league_dash.R |
| [`wnba_leaguedashteamstats()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguedashteamstats.md)                             | R/wnba_stats_league_dash.R |
| [`wnba_leaguegamefinder()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguegamefinder.md)                                   | R/wnba_stats_league.R      |
| [`wnba_leaguegamelog()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguegamelog.md)                                         | R/wnba_stats_league.R      |
| [`wnba_leaguehustlestatsplayer()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguehustlestatsplayer.md)                     | R/wnba_stats_hustle.R      |
| [`wnba_leaguehustlestatsplayerleaders()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguehustlestatsplayerleaders.md)       | R/wnba_stats_hustle.R      |
| [`wnba_leaguehustlestatsteam()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguehustlestatsteam.md)                         | R/wnba_stats_hustle.R      |
| [`wnba_leaguehustlestatsteamleaders()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguehustlestatsteamleaders.md)           | R/wnba_stats_hustle.R      |
| [`wnba_leaguelineupviz()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguelineupviz.md)                                     | R/wnba_stats_lineups.R     |
| [`wnba_leagueplayerondetails()`](https://wehoop.sportsdataverse.org/reference/wnba_leagueplayerondetails.md)                         | R/wnba_stats_lineups.R     |
| [`wnba_leagueseasonmatchups()`](https://wehoop.sportsdataverse.org/reference/wnba_leagueseasonmatchups.md)                           | R/wnba_stats_lineups.R     |
| [`wnba_leaguestandingsv3()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguestandingsv3.md)                                 | R/wnba_stats_league.R      |
| [`wnba_pbp()`](https://wehoop.sportsdataverse.org/reference/wnba_pbp.md)                                                             | R/wnba_stats_pbp.R         |
| [`wnba_playerawards()`](https://wehoop.sportsdataverse.org/reference/wnba_playerawards.md)                                           | R/wnba_stats_player.R      |
| [`wnba_playercareerbycollege()`](https://wehoop.sportsdataverse.org/reference/wnba_playercareerbycollege.md)                         | R/wnba_stats_player.R      |
| [`wnba_playercareerbycollegerollup()`](https://wehoop.sportsdataverse.org/reference/wnba_playercareerbycollegerollup.md)             | R/wnba_stats_player.R      |
| [`wnba_playercareerstats()`](https://wehoop.sportsdataverse.org/reference/wnba_playercareerstats.md)                                 | R/wnba_stats_player.R      |
| [`wnba_playercompare()`](https://wehoop.sportsdataverse.org/reference/wnba_playercompare.md)                                         | R/wnba_stats_player.R      |
| [`wnba_playerdashboardbyclutch()`](https://wehoop.sportsdataverse.org/reference/wnba_playerdashboardbyclutch.md)                     | R/wnba_stats_player_dash.R |
| [`wnba_playerdashboardbygamesplits()`](https://wehoop.sportsdataverse.org/reference/wnba_playerdashboardbygamesplits.md)             | R/wnba_stats_player_dash.R |
| [`wnba_playerdashboardbygeneralsplits()`](https://wehoop.sportsdataverse.org/reference/wnba_playerdashboardbygeneralsplits.md)       | R/wnba_stats_player_dash.R |
| [`wnba_playerdashboardbylastngames()`](https://wehoop.sportsdataverse.org/reference/wnba_playerdashboardbylastngames.md)             | R/wnba_stats_player_dash.R |
| [`wnba_playerdashboardbyopponent()`](https://wehoop.sportsdataverse.org/reference/wnba_playerdashboardbyopponent.md)                 | R/wnba_stats_player_dash.R |
| [`wnba_playerdashboardbyshootingsplits()`](https://wehoop.sportsdataverse.org/reference/wnba_playerdashboardbyshootingsplits.md)     | R/wnba_stats_player_dash.R |
| [`wnba_playerdashboardbyteamperformance()`](https://wehoop.sportsdataverse.org/reference/wnba_playerdashboardbyteamperformance.md)   | R/wnba_stats_player_dash.R |
| [`wnba_playerdashboardbyyearoveryear()`](https://wehoop.sportsdataverse.org/reference/wnba_playerdashboardbyyearoveryear.md)         | R/wnba_stats_player_dash.R |
| [`wnba_playerestimatedmetrics()`](https://wehoop.sportsdataverse.org/reference/wnba_playerestimatedmetrics.md)                       | R/wnba_stats_player.R      |
| [`wnba_playerfantasyprofile()`](https://wehoop.sportsdataverse.org/reference/wnba_playerfantasyprofile.md)                           | R/wnba_stats_player.R      |
| [`wnba_playerfantasyprofilebargraph()`](https://wehoop.sportsdataverse.org/reference/wnba_playerfantasyprofilebargraph.md)           | R/wnba_stats_player.R      |
| [`wnba_playergamelog()`](https://wehoop.sportsdataverse.org/reference/wnba_playergamelog.md)                                         | R/wnba_stats_player.R      |
| [`wnba_playergamelogs()`](https://wehoop.sportsdataverse.org/reference/wnba_playergamelogs.md)                                       | R/wnba_stats_player.R      |
| [`wnba_playergamestreakfinder()`](https://wehoop.sportsdataverse.org/reference/wnba_playergamestreakfinder.md)                       | R/wnba_stats_player.R      |
| [`wnba_playerheadshot()`](https://wehoop.sportsdataverse.org/reference/wnba_playerheadshot.md)                                       | R/wnba_stats_player.R      |
| [`wnba_playerindex()`](https://wehoop.sportsdataverse.org/reference/wnba_playerindex.md)                                             | R/wnba_stats_player.R      |
| [`wnba_playernextngames()`](https://wehoop.sportsdataverse.org/reference/wnba_playernextngames.md)                                   | R/wnba_stats_player.R      |
| [`wnba_playerprofilev2()`](https://wehoop.sportsdataverse.org/reference/wnba_playerprofilev2.md)                                     | R/wnba_stats_player.R      |
| [`wnba_playervsplayer()`](https://wehoop.sportsdataverse.org/reference/wnba_playervsplayer.md)                                       | R/wnba_stats_player.R      |
| [`wnba_scoreboard()`](https://wehoop.sportsdataverse.org/reference/wnba_scoreboard.md)                                               | R/wnba_stats_scoreboard.R  |
| [`wnba_scoreboardv2()`](https://wehoop.sportsdataverse.org/reference/wnba_scoreboardv2.md)                                           | R/wnba_stats_scoreboard.R  |
| [`wnba_shotchartdetail()`](https://wehoop.sportsdataverse.org/reference/wnba_shotchartdetail.md)                                     | R/wnba_stats_shotchart.R   |
| [`wnba_shotchartleaguewide()`](https://wehoop.sportsdataverse.org/reference/wnba_shotchartleaguewide.md)                             | R/wnba_stats_shotchart.R   |
| [`wnba_teamdashboardbyclutch()`](https://wehoop.sportsdataverse.org/reference/wnba_teamdashboardbyclutch.md)                         | R/wnba_stats_team_dash.R   |
| [`wnba_teamdashboardbygamesplits()`](https://wehoop.sportsdataverse.org/reference/wnba_teamdashboardbygamesplits.md)                 | R/wnba_stats_team_dash.R   |
| [`wnba_teamdashboardbygeneralsplits()`](https://wehoop.sportsdataverse.org/reference/wnba_teamdashboardbygeneralsplits.md)           | R/wnba_stats_team_dash.R   |
| [`wnba_teamdashboardbylastngames()`](https://wehoop.sportsdataverse.org/reference/wnba_teamdashboardbylastngames.md)                 | R/wnba_stats_team_dash.R   |
| [`wnba_teamdashboardbyopponent()`](https://wehoop.sportsdataverse.org/reference/wnba_teamdashboardbyopponent.md)                     | R/wnba_stats_team_dash.R   |
| [`wnba_teamdashboardbyshootingsplits()`](https://wehoop.sportsdataverse.org/reference/wnba_teamdashboardbyshootingsplits.md)         | R/wnba_stats_team_dash.R   |
| [`wnba_teamdashboardbyteamperformance()`](https://wehoop.sportsdataverse.org/reference/wnba_teamdashboardbyteamperformance.md)       | R/wnba_stats_team_dash.R   |
| [`wnba_teamdashboardbyyearoveryear()`](https://wehoop.sportsdataverse.org/reference/wnba_teamdashboardbyyearoveryear.md)             | R/wnba_stats_team_dash.R   |
| [`wnba_teamdashlineups()`](https://wehoop.sportsdataverse.org/reference/wnba_teamdashlineups.md)                                     | R/wnba_stats_team_dash.R   |
| [`wnba_teamdetails()`](https://wehoop.sportsdataverse.org/reference/wnba_teamdetails.md)                                             | R/wnba_stats_team.R        |
| [`wnba_teamestimatedmetrics()`](https://wehoop.sportsdataverse.org/reference/wnba_teamestimatedmetrics.md)                           | R/wnba_stats_team.R        |
| [`wnba_teamgamelog()`](https://wehoop.sportsdataverse.org/reference/wnba_teamgamelog.md)                                             | R/wnba_stats_team.R        |
| [`wnba_teamgamelogs()`](https://wehoop.sportsdataverse.org/reference/wnba_teamgamelogs.md)                                           | R/wnba_stats_team.R        |
| [`wnba_teamgamestreakfinder()`](https://wehoop.sportsdataverse.org/reference/wnba_teamgamestreakfinder.md)                           | R/wnba_stats_team.R        |
| [`wnba_teamhistoricalleaders()`](https://wehoop.sportsdataverse.org/reference/wnba_teamhistoricalleaders.md)                         | R/wnba_stats_team.R        |
| [`wnba_teaminfocommon()`](https://wehoop.sportsdataverse.org/reference/wnba_teaminfocommon.md)                                       | R/wnba_stats_team.R        |
| [`wnba_teamplayerdashboard()`](https://wehoop.sportsdataverse.org/reference/wnba_teamplayerdashboard.md)                             | R/wnba_stats_team.R        |
| [`wnba_teamplayeronoffdetails()`](https://wehoop.sportsdataverse.org/reference/wnba_teamplayeronoffdetails.md)                       | R/wnba_stats_team.R        |
| [`wnba_teamplayeronoffsummary()`](https://wehoop.sportsdataverse.org/reference/wnba_teamplayeronoffsummary.md)                       | R/wnba_stats_team.R        |
| [`wnba_teamvsplayer()`](https://wehoop.sportsdataverse.org/reference/wnba_teamvsplayer.md)                                           | R/wnba_stats_team.R        |
| [`wnba_teamyearbyyearstats()`](https://wehoop.sportsdataverse.org/reference/wnba_teamyearbyyearstats.md)                             | R/wnba_stats_team.R        |
| [`wnba_videodetails()`](https://wehoop.sportsdataverse.org/reference/wnba_videodetails.md)                                           | R/wnba_stats_video.R       |
| [`wnba_videoevents()`](https://wehoop.sportsdataverse.org/reference/wnba_videoevents.md)                                             | R/wnba_stats_video.R       |
| [`wnba_videostatus()`](https://wehoop.sportsdataverse.org/reference/wnba_videostatus.md)                                             | R/wnba_stats_video.R       |

### Adds 4 ESPN WBB and WNBA functions

- [`wehoop::espn_wbb_player_stats()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_player_stats.md)
  function added.

- [`wehoop::espn_wbb_team_stats()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_team_stats.md)
  function added.

- [`wehoop::espn_wnba_player_stats()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_player_stats.md)
  function added.

- [`wehoop::espn_wnba_team_stats()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team_stats.md)
  function added.

- Removes `furrr` and `future` dependencies and replaces with
  `purrr (>= 0.3.0)`

## **wehoop 1.2.1**

CRAN release: 2021-11-09

- Minor release to stay ahead of `tidyr` release revdepchecks

## **wehoop 1.2.0**

CRAN release: 2021-11-03

- Add returns for all the functions
- Update a handful of field names from the scoreboard functions and to
  also include neutral_site and conference_competition columns for the
  women’s college basketball scoreboard function.

## **wehoop 1.1.1**

- Change functions from `furrr::future_map_dfr()` functions to
  [`data.table::rbindlist()`](https://rdrr.io/pkg/data.table/man/rbindlist.html)
  functions for loaders.

## **wehoop 1.1.0**

#### **Add schedule loaders**

- [`wehoop::load_wbb_schedule()`](https://wehoop.sportsdataverse.org/reference/load_wbb_schedule.html)
  function added
- [`wehoop::load_wnba_schedule()`](https://wehoop.sportsdataverse.org/reference/load_wnba_schedule.html)
  function added

## **wehoop 1.0.0**

#### **Add team box score loaders**

- [`wehoop::load_wbb_team_box()`](https://wehoop.sportsdataverse.org/reference/load_wbb_team_box.html)
  function added
- [`wehoop::load_wnba_team_box()`](https://wehoop.sportsdataverse.org/reference/load_wnba_team_box.html)
  function added

#### **Add player box score loaders**

- [`wehoop::load_wbb_player_box()`](https://wehoop.sportsdataverse.org/reference/load_wbb_player_box.html)
  function added
- [`wehoop::load_wnba_player_box()`](https://wehoop.sportsdataverse.org/reference/load_wnba_player_box.html)
  function added

#### **Standings functions**

- [`wehoop::espn_wnba_standings()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_standings.html)
- [`wehoop::espn_wbb_standings()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_standings.html)

#### **Getting Started vignette**

- [Getting started with wehoop
  data](https://wehoop.sportsdataverse.org/articles/getting-started-wehoop.html)

## **wehoop 0.9.2**

#### **Quick fix for update db functions**

#### **Dependency pruning**

This update is a non-user facing change to package dependencies to
shrink the list of dependencies.

## **wehoop 0.9.1**

#### **Clean names and team returns**

- All functions have now been given the
  [`janitor::clean_names()`](https://rdrr.io/cran/janitor/man/clean_names.html)
  treatment
- [`wehoop::espn_wbb_teams()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_teams.html)
  has updated the returns to be more identity information related only
- [`wehoop::espn_wnba_teams()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_teams.html)
  to be more identity information related only
- All tests were updated

## **wehoop 0.9.0**

#### **Loading capabilities added to the package**

- [`wehoop::load_wbb_pbp()`](https://wehoop.sportsdataverse.org/reference/load_wbb_pbp.html)
  and
  [`wehoop::update_wbb_db()`](https://wehoop.sportsdataverse.org/reference/update_wbb_db.html)
  functions added
- [`wehoop::load_wnba_pbp()`](https://wehoop.sportsdataverse.org/reference/load_wnba_pbp.html)
  and
  [`wehoop::update_wnba_db()`](https://wehoop.sportsdataverse.org/reference/update_wnba_db.html)
  functions added

## **wehoop 0.3.0**

#### **Dependencies**

- `R` version 3.5.0 or greater dependency added
- `purrr` version 0.3.0 or greater dependency added
- `rvest` version 1.0.0 or greater dependency added
- `progressr` version 0.6.0 or greater dependency added
- `usethis` version 1.6.0 or greater dependency added
- `xgboost` version 1.1.0 or greater dependency added
- `tidyr` version 1.0.0 or greater dependency added
- `stringr` version 1.3.0 or greater dependency added
- `tibble` version 3.0.0 or greater dependency added
- `furrr` dependency added
- `future` dependency added

#### **Test coverage**

- Added tests for all ESPN functions

##### **Function Naming Convention Change**

- Similarly, data and metrics sourced from ESPN will begin with `espn_`
  as opposed to `wbb_` or `wnba_`.
- Data sourced directly from the NCAA website will start the function
  with `ncaa_`

## **wehoop 0.2.0**

- Added support for ESPN’s play-by-play endpoints with the addition of
  the following functions:
- [`wehoop::espn_wnba_game_all()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_all.md) -
  a convenience wrapper function around the following three functions
  (returns the results as a list of three data frames)
- [`wehoop::espn_wnba_team_box()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team_box.md)
- [`wehoop::espn_wnba_player_box()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_player_box.md)
- [`wehoop::espn_wnba_pbp()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_pbp.md)
- [`wehoop::espn_wnba_teams()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_teams.md)
- [`wehoop::espn_wbb_scoreboard()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_scoreboard.md)

## **wehoop 0.1.0**

- Added support for ESPN’s play-by-play endpoints with the addition of
  the following functions:
- [`wehoop::espn_wbb_game_all()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_game_all.md) -
  a convenience wrapper function around the following three functions
  (returns the results as a list of three data frames)
- [`wehoop::espn_wbb_team_box()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_team_box.md)
- [`wehoop::espn_wbb_player_box()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_player_box.md)
- [`wehoop::espn_wbb_pbp()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_pbp.md)
- [`wehoop::espn_wbb_teams()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_teams.md)
- [`wehoop::espn_wbb_conferences()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_conferences.md)
- [`wehoop::espn_wbb_scoreboard()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_scoreboard.md)
- [`wehoop::ncaa_wbb_NET_rankings()`](https://wehoop.sportsdataverse.org/reference/ncaa_wbb_NET_rankings.md)
- [`wehoop::espn_wbb_rankings()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_rankings.md)
