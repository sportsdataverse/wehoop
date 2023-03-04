## Release summary

This is a minor release that:  
* Updates tidyr and dplyr statements to use quotations on columns instead of data masking per tidyselect deprecation notice.
* Corrects urls in documentation
* ```espn_wbb_game_rosters()``` function added.
* ```espn_wnba_game_rosters()``` function added.
* ```wnba_teams()``` function added. 
* Add proxy rlang dots option for passing httr::use_proxy() option to wnba_stats_*() functions

## R CMD check results

0 errors | 0 warnings | 0 notes

## revdepcheck results

We checked 0 reverse dependencies, comparing R CMD check results across CRAN and dev versions of this package.

 * We saw 0 new problems
 * We failed to check 0 packages
