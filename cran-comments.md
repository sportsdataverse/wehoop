## Release summary

This is a minor release that:  
* Updates tidyr and dplyr statements to use quotations on columns instead of data masking per tidyselect deprecation notice.
* Corrects urls in documentation
* ```espn_wbb_game_rosters()``` function added.
* ```espn_wnba_game_rosters()``` function added.
* ```ncaa_wbb_teams()``` function added.
* ```wnba_teams()``` function added. 
* ```wnba_shotchartlineupdetail()``` function added.
* ```wnba_franchiseleaderswrank()``` function added. 
* ```wnba_leaderstiles()``` function added. 
* ```wnba_leagueleaders()``` function added. 
* ```wnba_infographicfanduelplayer()``` function added.
* ```wnba_live_pbp()``` function added.
* ```wnba_live_boxscore()``` function added.
* ```wnba_todays_scoreboard()``` function added.
* ```wnba_scoreboardv3()``` function added.
* ```wnba_boxscoretraditionalv3()``` function added.
* ```wnba_boxscoreadvancedv3()``` function added.
* ```wnba_boxscoremiscv3()``` function added.
* ```wnba_boxscorescoringv3()``` function added.
* ```wnba_boxscoreusagev3()``` function added.
* ```wnba_boxscorefourfactorsv3()``` function added.
* ```wnba_boxscoreplayertrackv3()``` function added.
* ```wnba_boxscorehustlev2()``` function added.

* Add proxy rlang dots option for passing httr::use_proxy() option to wnba_stats_*() functions

## R CMD check results

0 errors | 0 warnings | 0 notes

## revdepcheck results

We checked 0 reverse dependencies, comparing R CMD check results across CRAN and dev versions of this package.

 * We saw 0 new problems
 * We failed to check 0 packages
