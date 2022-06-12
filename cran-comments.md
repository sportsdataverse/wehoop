## Release summary

This is a minor release that:  
* Adds 106 functions covering the [WNBA Stats API](https://www.wnba.com) as follows

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


* Adds 4 ESPN WBB and WNBA functions
  - ```espn_wbb_player_stats()``` function added.
  - ```espn_wbb_team_stats()``` function added.
  - ```espn_wnba_player_stats()``` function added.
  - ```espn_wnba_team_stats()``` function added.

* Removes dependencies: `furrr` and `future`, replaces with `purrr (>= 0.3.0)`

## R CMD check results

0 errors | 0 warnings | 0 notes

## revdepcheck results

We checked 0 reverse dependencies, comparing R CMD check results across CRAN and dev versions of this package.

 * We saw 0 new problems
 * We failed to check 0 packages
