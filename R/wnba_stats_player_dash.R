## Player Dashboard parameters are the same

#' **Get WNBA Stats API Player Dashboard by Clutch Splits**
#' @name wnba_playerdashboardbyclutch
NULL
#' @title
#' **Get WNBA Stats API Player Dashboard by Clutch Splits**
#' @rdname wnba_playerdashboardbyclutch
#' @author Saiem Gilani
#' @param date_from date_from
#' @param date_to date_to
#' @param game_segment game_segment
#' @param last_n_games last_n_games
#' @param league_id league_id
#' @param location location
#' @param measure_type measure_type
#' @param month month
#' @param opponent_team_id opponent_team_id
#' @param outcome outcome
#' @param po_round po_round
#' @param pace_adjust pace_adjust
#' @param per_mode per_mode
#' @param period period
#' @param player_id player_id
#' @param plus_minus plus_minus
#' @param rank rank
#' @param season season
#' @param season_segment season_segment
#' @param season_type season_type
#' @param shot_clock_range shot_clock_range
#' @param vs_conference vs_conference
#' @param vs_division vs_division
#' @param ... Additional arguments passed to an underlying function like httr.
#' @return Return a named list of data frames: Last10Sec3Point2PlayerDashboard,
#' Last10Sec3PointPlayerDashboard, Last1Min5PointPlayerDashboard,
#' Last1MinPlusMinus5PointPlayerDashboard, Last30Sec3Point2PlayerDashboard,
#'  Last30Sec3PointPlayerDashboard, Last3Min5PointPlayerDashboard,
#' Last3MinPlusMinus5PointPlayerDashboard, Last5Min5PointPlayerDashboard,
#' Last5MinPlusMinus5PointPlayerDashboard,  OverallPlayerDashboard
#'
#'    **OverallPlayerDashboard**
#'
#'
#'    |col_name              |types     |
#'    |:---------------------|:---------|
#'    |GROUP_SET             |character |
#'    |GROUP_VALUE           |character |
#'    |GP                    |character |
#'    |W                     |character |
#'    |L                     |character |
#'    |W_PCT                 |character |
#'    |MIN                   |character |
#'    |FGM                   |character |
#'    |FGA                   |character |
#'    |FG_PCT                |character |
#'    |FG3M                  |character |
#'    |FG3A                  |character |
#'    |FG3_PCT               |character |
#'    |FTM                   |character |
#'    |FTA                   |character |
#'    |FT_PCT                |character |
#'    |OREB                  |character |
#'    |DREB                  |character |
#'    |REB                   |character |
#'    |AST                   |character |
#'    |TOV                   |character |
#'    |STL                   |character |
#'    |BLK                   |character |
#'    |BLKA                  |character |
#'    |PF                    |character |
#'    |PFD                   |character |
#'    |PTS                   |character |
#'    |PLUS_MINUS            |character |
#'    |NBA_FANTASY_PTS       |character |
#'    |DD2                   |character |
#'    |TD3                   |character |
#'    |WNBA_FANTASY_PTS      |character |
#'    |GP_RANK               |character |
#'    |W_RANK                |character |
#'    |L_RANK                |character |
#'    |W_PCT_RANK            |character |
#'    |MIN_RANK              |character |
#'    |FGM_RANK              |character |
#'    |FGA_RANK              |character |
#'    |FG_PCT_RANK           |character |
#'    |FG3M_RANK             |character |
#'    |FG3A_RANK             |character |
#'    |FG3_PCT_RANK          |character |
#'    |FTM_RANK              |character |
#'    |FTA_RANK              |character |
#'    |FT_PCT_RANK           |character |
#'    |OREB_RANK             |character |
#'    |DREB_RANK             |character |
#'    |REB_RANK              |character |
#'    |AST_RANK              |character |
#'    |TOV_RANK              |character |
#'    |STL_RANK              |character |
#'    |BLK_RANK              |character |
#'    |BLKA_RANK             |character |
#'    |PF_RANK               |character |
#'    |PFD_RANK              |character |
#'    |PTS_RANK              |character |
#'    |PLUS_MINUS_RANK       |character |
#'    |NBA_FANTASY_PTS_RANK  |character |
#'    |DD2_RANK              |character |
#'    |TD3_RANK              |character |
#'    |WNBA_FANTASY_PTS_RANK |character |
#'
#'    **Last5Min5PointPlayerDashboard**
#'
#'
#'    |col_name              |types     |
#'    |:---------------------|:---------|
#'    |GROUP_SET             |character |
#'    |GROUP_VALUE           |character |
#'    |GP                    |character |
#'    |W                     |character |
#'    |L                     |character |
#'    |W_PCT                 |character |
#'    |MIN                   |character |
#'    |FGM                   |character |
#'    |FGA                   |character |
#'    |FG_PCT                |character |
#'    |FG3M                  |character |
#'    |FG3A                  |character |
#'    |FG3_PCT               |character |
#'    |FTM                   |character |
#'    |FTA                   |character |
#'    |FT_PCT                |character |
#'    |OREB                  |character |
#'    |DREB                  |character |
#'    |REB                   |character |
#'    |AST                   |character |
#'    |TOV                   |character |
#'    |STL                   |character |
#'    |BLK                   |character |
#'    |BLKA                  |character |
#'    |PF                    |character |
#'    |PFD                   |character |
#'    |PTS                   |character |
#'    |PLUS_MINUS            |character |
#'    |NBA_FANTASY_PTS       |character |
#'    |DD2                   |character |
#'    |TD3                   |character |
#'    |WNBA_FANTASY_PTS      |character |
#'    |GP_RANK               |character |
#'    |W_RANK                |character |
#'    |L_RANK                |character |
#'    |W_PCT_RANK            |character |
#'    |MIN_RANK              |character |
#'    |FGM_RANK              |character |
#'    |FGA_RANK              |character |
#'    |FG_PCT_RANK           |character |
#'    |FG3M_RANK             |character |
#'    |FG3A_RANK             |character |
#'    |FG3_PCT_RANK          |character |
#'    |FTM_RANK              |character |
#'    |FTA_RANK              |character |
#'    |FT_PCT_RANK           |character |
#'    |OREB_RANK             |character |
#'    |DREB_RANK             |character |
#'    |REB_RANK              |character |
#'    |AST_RANK              |character |
#'    |TOV_RANK              |character |
#'    |STL_RANK              |character |
#'    |BLK_RANK              |character |
#'    |BLKA_RANK             |character |
#'    |PF_RANK               |character |
#'    |PFD_RANK              |character |
#'    |PTS_RANK              |character |
#'    |PLUS_MINUS_RANK       |character |
#'    |NBA_FANTASY_PTS_RANK  |character |
#'    |DD2_RANK              |character |
#'    |TD3_RANK              |character |
#'    |WNBA_FANTASY_PTS_RANK |character |
#'
#'    **Last3Min5PointPlayerDashboard**
#'
#'
#'    |col_name              |types     |
#'    |:---------------------|:---------|
#'    |GROUP_SET             |character |
#'    |GROUP_VALUE           |character |
#'    |GP                    |character |
#'    |W                     |character |
#'    |L                     |character |
#'    |W_PCT                 |character |
#'    |MIN                   |character |
#'    |FGM                   |character |
#'    |FGA                   |character |
#'    |FG_PCT                |character |
#'    |FG3M                  |character |
#'    |FG3A                  |character |
#'    |FG3_PCT               |character |
#'    |FTM                   |character |
#'    |FTA                   |character |
#'    |FT_PCT                |character |
#'    |OREB                  |character |
#'    |DREB                  |character |
#'    |REB                   |character |
#'    |AST                   |character |
#'    |TOV                   |character |
#'    |STL                   |character |
#'    |BLK                   |character |
#'    |BLKA                  |character |
#'    |PF                    |character |
#'    |PFD                   |character |
#'    |PTS                   |character |
#'    |PLUS_MINUS            |character |
#'    |NBA_FANTASY_PTS       |character |
#'    |DD2                   |character |
#'    |TD3                   |character |
#'    |WNBA_FANTASY_PTS      |character |
#'    |GP_RANK               |character |
#'    |W_RANK                |character |
#'    |L_RANK                |character |
#'    |W_PCT_RANK            |character |
#'    |MIN_RANK              |character |
#'    |FGM_RANK              |character |
#'    |FGA_RANK              |character |
#'    |FG_PCT_RANK           |character |
#'    |FG3M_RANK             |character |
#'    |FG3A_RANK             |character |
#'    |FG3_PCT_RANK          |character |
#'    |FTM_RANK              |character |
#'    |FTA_RANK              |character |
#'    |FT_PCT_RANK           |character |
#'    |OREB_RANK             |character |
#'    |DREB_RANK             |character |
#'    |REB_RANK              |character |
#'    |AST_RANK              |character |
#'    |TOV_RANK              |character |
#'    |STL_RANK              |character |
#'    |BLK_RANK              |character |
#'    |BLKA_RANK             |character |
#'    |PF_RANK               |character |
#'    |PFD_RANK              |character |
#'    |PTS_RANK              |character |
#'    |PLUS_MINUS_RANK       |character |
#'    |NBA_FANTASY_PTS_RANK  |character |
#'    |DD2_RANK              |character |
#'    |TD3_RANK              |character |
#'    |WNBA_FANTASY_PTS_RANK |character |
#'
#'    **Last1Min5PointPlayerDashboard**
#'
#'
#'    |col_name              |types     |
#'    |:---------------------|:---------|
#'    |GROUP_SET             |character |
#'    |GROUP_VALUE           |character |
#'    |GP                    |character |
#'    |W                     |character |
#'    |L                     |character |
#'    |W_PCT                 |character |
#'    |MIN                   |character |
#'    |FGM                   |character |
#'    |FGA                   |character |
#'    |FG_PCT                |character |
#'    |FG3M                  |character |
#'    |FG3A                  |character |
#'    |FG3_PCT               |character |
#'    |FTM                   |character |
#'    |FTA                   |character |
#'    |FT_PCT                |character |
#'    |OREB                  |character |
#'    |DREB                  |character |
#'    |REB                   |character |
#'    |AST                   |character |
#'    |TOV                   |character |
#'    |STL                   |character |
#'    |BLK                   |character |
#'    |BLKA                  |character |
#'    |PF                    |character |
#'    |PFD                   |character |
#'    |PTS                   |character |
#'    |PLUS_MINUS            |character |
#'    |NBA_FANTASY_PTS       |character |
#'    |DD2                   |character |
#'    |TD3                   |character |
#'    |WNBA_FANTASY_PTS      |character |
#'    |GP_RANK               |character |
#'    |W_RANK                |character |
#'    |L_RANK                |character |
#'    |W_PCT_RANK            |character |
#'    |MIN_RANK              |character |
#'    |FGM_RANK              |character |
#'    |FGA_RANK              |character |
#'    |FG_PCT_RANK           |character |
#'    |FG3M_RANK             |character |
#'    |FG3A_RANK             |character |
#'    |FG3_PCT_RANK          |character |
#'    |FTM_RANK              |character |
#'    |FTA_RANK              |character |
#'    |FT_PCT_RANK           |character |
#'    |OREB_RANK             |character |
#'    |DREB_RANK             |character |
#'    |REB_RANK              |character |
#'    |AST_RANK              |character |
#'    |TOV_RANK              |character |
#'    |STL_RANK              |character |
#'    |BLK_RANK              |character |
#'    |BLKA_RANK             |character |
#'    |PF_RANK               |character |
#'    |PFD_RANK              |character |
#'    |PTS_RANK              |character |
#'    |PLUS_MINUS_RANK       |character |
#'    |NBA_FANTASY_PTS_RANK  |character |
#'    |DD2_RANK              |character |
#'    |TD3_RANK              |character |
#'    |WNBA_FANTASY_PTS_RANK |character |
#'
#'    **Last30Sec3PointPlayerDashboard**
#'
#'
#'    |col_name              |types     |
#'    |:---------------------|:---------|
#'    |GROUP_SET             |character |
#'    |GROUP_VALUE           |character |
#'    |GP                    |character |
#'    |W                     |character |
#'    |L                     |character |
#'    |W_PCT                 |character |
#'    |MIN                   |character |
#'    |FGM                   |character |
#'    |FGA                   |character |
#'    |FG_PCT                |character |
#'    |FG3M                  |character |
#'    |FG3A                  |character |
#'    |FG3_PCT               |character |
#'    |FTM                   |character |
#'    |FTA                   |character |
#'    |FT_PCT                |character |
#'    |OREB                  |character |
#'    |DREB                  |character |
#'    |REB                   |character |
#'    |AST                   |character |
#'    |TOV                   |character |
#'    |STL                   |character |
#'    |BLK                   |character |
#'    |BLKA                  |character |
#'    |PF                    |character |
#'    |PFD                   |character |
#'    |PTS                   |character |
#'    |PLUS_MINUS            |character |
#'    |NBA_FANTASY_PTS       |character |
#'    |DD2                   |character |
#'    |TD3                   |character |
#'    |WNBA_FANTASY_PTS      |character |
#'    |GP_RANK               |character |
#'    |W_RANK                |character |
#'    |L_RANK                |character |
#'    |W_PCT_RANK            |character |
#'    |MIN_RANK              |character |
#'    |FGM_RANK              |character |
#'    |FGA_RANK              |character |
#'    |FG_PCT_RANK           |character |
#'    |FG3M_RANK             |character |
#'    |FG3A_RANK             |character |
#'    |FG3_PCT_RANK          |character |
#'    |FTM_RANK              |character |
#'    |FTA_RANK              |character |
#'    |FT_PCT_RANK           |character |
#'    |OREB_RANK             |character |
#'    |DREB_RANK             |character |
#'    |REB_RANK              |character |
#'    |AST_RANK              |character |
#'    |TOV_RANK              |character |
#'    |STL_RANK              |character |
#'    |BLK_RANK              |character |
#'    |BLKA_RANK             |character |
#'    |PF_RANK               |character |
#'    |PFD_RANK              |character |
#'    |PTS_RANK              |character |
#'    |PLUS_MINUS_RANK       |character |
#'    |NBA_FANTASY_PTS_RANK  |character |
#'    |DD2_RANK              |character |
#'    |TD3_RANK              |character |
#'    |WNBA_FANTASY_PTS_RANK |character |
#'
#'    **Last10Sec3PointPlayerDashboard**
#'
#'
#'    |col_name              |types     |
#'    |:---------------------|:---------|
#'    |GROUP_SET             |character |
#'    |GROUP_VALUE           |character |
#'    |GP                    |character |
#'    |W                     |character |
#'    |L                     |character |
#'    |W_PCT                 |character |
#'    |MIN                   |character |
#'    |FGM                   |character |
#'    |FGA                   |character |
#'    |FG_PCT                |character |
#'    |FG3M                  |character |
#'    |FG3A                  |character |
#'    |FG3_PCT               |character |
#'    |FTM                   |character |
#'    |FTA                   |character |
#'    |FT_PCT                |character |
#'    |OREB                  |character |
#'    |DREB                  |character |
#'    |REB                   |character |
#'    |AST                   |character |
#'    |TOV                   |character |
#'    |STL                   |character |
#'    |BLK                   |character |
#'    |BLKA                  |character |
#'    |PF                    |character |
#'    |PFD                   |character |
#'    |PTS                   |character |
#'    |PLUS_MINUS            |character |
#'    |NBA_FANTASY_PTS       |character |
#'    |DD2                   |character |
#'    |TD3                   |character |
#'    |WNBA_FANTASY_PTS      |character |
#'    |GP_RANK               |character |
#'    |W_RANK                |character |
#'    |L_RANK                |character |
#'    |W_PCT_RANK            |character |
#'    |MIN_RANK              |character |
#'    |FGM_RANK              |character |
#'    |FGA_RANK              |character |
#'    |FG_PCT_RANK           |character |
#'    |FG3M_RANK             |character |
#'    |FG3A_RANK             |character |
#'    |FG3_PCT_RANK          |character |
#'    |FTM_RANK              |character |
#'    |FTA_RANK              |character |
#'    |FT_PCT_RANK           |character |
#'    |OREB_RANK             |character |
#'    |DREB_RANK             |character |
#'    |REB_RANK              |character |
#'    |AST_RANK              |character |
#'    |TOV_RANK              |character |
#'    |STL_RANK              |character |
#'    |BLK_RANK              |character |
#'    |BLKA_RANK             |character |
#'    |PF_RANK               |character |
#'    |PFD_RANK              |character |
#'    |PTS_RANK              |character |
#'    |PLUS_MINUS_RANK       |character |
#'    |NBA_FANTASY_PTS_RANK  |character |
#'    |DD2_RANK              |character |
#'    |TD3_RANK              |character |
#'    |WNBA_FANTASY_PTS_RANK |character |
#'
#'    **Last5MinPlusMinus5PointPlayerDashboard**
#'
#'
#'    |col_name              |types     |
#'    |:---------------------|:---------|
#'    |GROUP_SET             |character |
#'    |GROUP_VALUE           |character |
#'    |GP                    |character |
#'    |W                     |character |
#'    |L                     |character |
#'    |W_PCT                 |character |
#'    |MIN                   |character |
#'    |FGM                   |character |
#'    |FGA                   |character |
#'    |FG_PCT                |character |
#'    |FG3M                  |character |
#'    |FG3A                  |character |
#'    |FG3_PCT               |character |
#'    |FTM                   |character |
#'    |FTA                   |character |
#'    |FT_PCT                |character |
#'    |OREB                  |character |
#'    |DREB                  |character |
#'    |REB                   |character |
#'    |AST                   |character |
#'    |TOV                   |character |
#'    |STL                   |character |
#'    |BLK                   |character |
#'    |BLKA                  |character |
#'    |PF                    |character |
#'    |PFD                   |character |
#'    |PTS                   |character |
#'    |PLUS_MINUS            |character |
#'    |NBA_FANTASY_PTS       |character |
#'    |DD2                   |character |
#'    |TD3                   |character |
#'    |WNBA_FANTASY_PTS      |character |
#'    |GP_RANK               |character |
#'    |W_RANK                |character |
#'    |L_RANK                |character |
#'    |W_PCT_RANK            |character |
#'    |MIN_RANK              |character |
#'    |FGM_RANK              |character |
#'    |FGA_RANK              |character |
#'    |FG_PCT_RANK           |character |
#'    |FG3M_RANK             |character |
#'    |FG3A_RANK             |character |
#'    |FG3_PCT_RANK          |character |
#'    |FTM_RANK              |character |
#'    |FTA_RANK              |character |
#'    |FT_PCT_RANK           |character |
#'    |OREB_RANK             |character |
#'    |DREB_RANK             |character |
#'    |REB_RANK              |character |
#'    |AST_RANK              |character |
#'    |TOV_RANK              |character |
#'    |STL_RANK              |character |
#'    |BLK_RANK              |character |
#'    |BLKA_RANK             |character |
#'    |PF_RANK               |character |
#'    |PFD_RANK              |character |
#'    |PTS_RANK              |character |
#'    |PLUS_MINUS_RANK       |character |
#'    |NBA_FANTASY_PTS_RANK  |character |
#'    |DD2_RANK              |character |
#'    |TD3_RANK              |character |
#'    |WNBA_FANTASY_PTS_RANK |character |
#'
#'    **Last3MinPlusMinus5PointPlayerDashboard**
#'
#'
#'    |col_name              |types     |
#'    |:---------------------|:---------|
#'    |GROUP_SET             |character |
#'    |GROUP_VALUE           |character |
#'    |GP                    |character |
#'    |W                     |character |
#'    |L                     |character |
#'    |W_PCT                 |character |
#'    |MIN                   |character |
#'    |FGM                   |character |
#'    |FGA                   |character |
#'    |FG_PCT                |character |
#'    |FG3M                  |character |
#'    |FG3A                  |character |
#'    |FG3_PCT               |character |
#'    |FTM                   |character |
#'    |FTA                   |character |
#'    |FT_PCT                |character |
#'    |OREB                  |character |
#'    |DREB                  |character |
#'    |REB                   |character |
#'    |AST                   |character |
#'    |TOV                   |character |
#'    |STL                   |character |
#'    |BLK                   |character |
#'    |BLKA                  |character |
#'    |PF                    |character |
#'    |PFD                   |character |
#'    |PTS                   |character |
#'    |PLUS_MINUS            |character |
#'    |NBA_FANTASY_PTS       |character |
#'    |DD2                   |character |
#'    |TD3                   |character |
#'    |WNBA_FANTASY_PTS      |character |
#'    |GP_RANK               |character |
#'    |W_RANK                |character |
#'    |L_RANK                |character |
#'    |W_PCT_RANK            |character |
#'    |MIN_RANK              |character |
#'    |FGM_RANK              |character |
#'    |FGA_RANK              |character |
#'    |FG_PCT_RANK           |character |
#'    |FG3M_RANK             |character |
#'    |FG3A_RANK             |character |
#'    |FG3_PCT_RANK          |character |
#'    |FTM_RANK              |character |
#'    |FTA_RANK              |character |
#'    |FT_PCT_RANK           |character |
#'    |OREB_RANK             |character |
#'    |DREB_RANK             |character |
#'    |REB_RANK              |character |
#'    |AST_RANK              |character |
#'    |TOV_RANK              |character |
#'    |STL_RANK              |character |
#'    |BLK_RANK              |character |
#'    |BLKA_RANK             |character |
#'    |PF_RANK               |character |
#'    |PFD_RANK              |character |
#'    |PTS_RANK              |character |
#'    |PLUS_MINUS_RANK       |character |
#'    |NBA_FANTASY_PTS_RANK  |character |
#'    |DD2_RANK              |character |
#'    |TD3_RANK              |character |
#'    |WNBA_FANTASY_PTS_RANK |character |
#'
#'    **Last1MinPlusMinus5PointPlayerDashboard**
#'
#'
#'    |col_name              |types     |
#'    |:---------------------|:---------|
#'    |GROUP_SET             |character |
#'    |GROUP_VALUE           |character |
#'    |GP                    |character |
#'    |W                     |character |
#'    |L                     |character |
#'    |W_PCT                 |character |
#'    |MIN                   |character |
#'    |FGM                   |character |
#'    |FGA                   |character |
#'    |FG_PCT                |character |
#'    |FG3M                  |character |
#'    |FG3A                  |character |
#'    |FG3_PCT               |character |
#'    |FTM                   |character |
#'    |FTA                   |character |
#'    |FT_PCT                |character |
#'    |OREB                  |character |
#'    |DREB                  |character |
#'    |REB                   |character |
#'    |AST                   |character |
#'    |TOV                   |character |
#'    |STL                   |character |
#'    |BLK                   |character |
#'    |BLKA                  |character |
#'    |PF                    |character |
#'    |PFD                   |character |
#'    |PTS                   |character |
#'    |PLUS_MINUS            |character |
#'    |NBA_FANTASY_PTS       |character |
#'    |DD2                   |character |
#'    |TD3                   |character |
#'    |WNBA_FANTASY_PTS      |character |
#'    |GP_RANK               |character |
#'    |W_RANK                |character |
#'    |L_RANK                |character |
#'    |W_PCT_RANK            |character |
#'    |MIN_RANK              |character |
#'    |FGM_RANK              |character |
#'    |FGA_RANK              |character |
#'    |FG_PCT_RANK           |character |
#'    |FG3M_RANK             |character |
#'    |FG3A_RANK             |character |
#'    |FG3_PCT_RANK          |character |
#'    |FTM_RANK              |character |
#'    |FTA_RANK              |character |
#'    |FT_PCT_RANK           |character |
#'    |OREB_RANK             |character |
#'    |DREB_RANK             |character |
#'    |REB_RANK              |character |
#'    |AST_RANK              |character |
#'    |TOV_RANK              |character |
#'    |STL_RANK              |character |
#'    |BLK_RANK              |character |
#'    |BLKA_RANK             |character |
#'    |PF_RANK               |character |
#'    |PFD_RANK              |character |
#'    |PTS_RANK              |character |
#'    |PLUS_MINUS_RANK       |character |
#'    |NBA_FANTASY_PTS_RANK  |character |
#'    |DD2_RANK              |character |
#'    |TD3_RANK              |character |
#'    |WNBA_FANTASY_PTS_RANK |character |
#'
#'    **Last30Sec3Point2PlayerDashboard**
#'
#'
#'    |col_name              |types     |
#'    |:---------------------|:---------|
#'    |GROUP_SET             |character |
#'    |GROUP_VALUE           |character |
#'    |GP                    |character |
#'    |W                     |character |
#'    |L                     |character |
#'    |W_PCT                 |character |
#'    |MIN                   |character |
#'    |FGM                   |character |
#'    |FGA                   |character |
#'    |FG_PCT                |character |
#'    |FG3M                  |character |
#'    |FG3A                  |character |
#'    |FG3_PCT               |character |
#'    |FTM                   |character |
#'    |FTA                   |character |
#'    |FT_PCT                |character |
#'    |OREB                  |character |
#'    |DREB                  |character |
#'    |REB                   |character |
#'    |AST                   |character |
#'    |TOV                   |character |
#'    |STL                   |character |
#'    |BLK                   |character |
#'    |BLKA                  |character |
#'    |PF                    |character |
#'    |PFD                   |character |
#'    |PTS                   |character |
#'    |PLUS_MINUS            |character |
#'    |NBA_FANTASY_PTS       |character |
#'    |DD2                   |character |
#'    |TD3                   |character |
#'    |WNBA_FANTASY_PTS      |character |
#'    |GP_RANK               |character |
#'    |W_RANK                |character |
#'    |L_RANK                |character |
#'    |W_PCT_RANK            |character |
#'    |MIN_RANK              |character |
#'    |FGM_RANK              |character |
#'    |FGA_RANK              |character |
#'    |FG_PCT_RANK           |character |
#'    |FG3M_RANK             |character |
#'    |FG3A_RANK             |character |
#'    |FG3_PCT_RANK          |character |
#'    |FTM_RANK              |character |
#'    |FTA_RANK              |character |
#'    |FT_PCT_RANK           |character |
#'    |OREB_RANK             |character |
#'    |DREB_RANK             |character |
#'    |REB_RANK              |character |
#'    |AST_RANK              |character |
#'    |TOV_RANK              |character |
#'    |STL_RANK              |character |
#'    |BLK_RANK              |character |
#'    |BLKA_RANK             |character |
#'    |PF_RANK               |character |
#'    |PFD_RANK              |character |
#'    |PTS_RANK              |character |
#'    |PLUS_MINUS_RANK       |character |
#'    |NBA_FANTASY_PTS_RANK  |character |
#'    |DD2_RANK              |character |
#'    |TD3_RANK              |character |
#'    |WNBA_FANTASY_PTS_RANK |character |
#'
#'    **Last10Sec3Point2PlayerDashboard**
#'
#'
#'    |col_name              |types     |
#'    |:---------------------|:---------|
#'    |GROUP_SET             |character |
#'    |GROUP_VALUE           |character |
#'    |GP                    |character |
#'    |W                     |character |
#'    |L                     |character |
#'    |W_PCT                 |character |
#'    |MIN                   |character |
#'    |FGM                   |character |
#'    |FGA                   |character |
#'    |FG_PCT                |character |
#'    |FG3M                  |character |
#'    |FG3A                  |character |
#'    |FG3_PCT               |character |
#'    |FTM                   |character |
#'    |FTA                   |character |
#'    |FT_PCT                |character |
#'    |OREB                  |character |
#'    |DREB                  |character |
#'    |REB                   |character |
#'    |AST                   |character |
#'    |TOV                   |character |
#'    |STL                   |character |
#'    |BLK                   |character |
#'    |BLKA                  |character |
#'    |PF                    |character |
#'    |PFD                   |character |
#'    |PTS                   |character |
#'    |PLUS_MINUS            |character |
#'    |NBA_FANTASY_PTS       |character |
#'    |DD2                   |character |
#'    |TD3                   |character |
#'    |WNBA_FANTASY_PTS      |character |
#'    |GP_RANK               |character |
#'    |W_RANK                |character |
#'    |L_RANK                |character |
#'    |W_PCT_RANK            |character |
#'    |MIN_RANK              |character |
#'    |FGM_RANK              |character |
#'    |FGA_RANK              |character |
#'    |FG_PCT_RANK           |character |
#'    |FG3M_RANK             |character |
#'    |FG3A_RANK             |character |
#'    |FG3_PCT_RANK          |character |
#'    |FTM_RANK              |character |
#'    |FTA_RANK              |character |
#'    |FT_PCT_RANK           |character |
#'    |OREB_RANK             |character |
#'    |DREB_RANK             |character |
#'    |REB_RANK              |character |
#'    |AST_RANK              |character |
#'    |TOV_RANK              |character |
#'    |STL_RANK              |character |
#'    |BLK_RANK              |character |
#'    |BLKA_RANK             |character |
#'    |PF_RANK               |character |
#'    |PFD_RANK              |character |
#'    |PTS_RANK              |character |
#'    |PLUS_MINUS_RANK       |character |
#'    |NBA_FANTASY_PTS_RANK  |character |
#'    |DD2_RANK              |character |
#'    |TD3_RANK              |character |
#'    |WNBA_FANTASY_PTS_RANK |character |
#'
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows as_tibble
#' @import rvest
#' @export
#' @family WNBA Player Functions
#' @family WNBA Clutch Functions
#' @details
#' ```r
#'  wnba_playerdashboardbyclutch(player_id = '1628932', season = most_recent_wnba_season() - 1)
#' ```
wnba_playerdashboardbyclutch <- function(
    date_from = '',
    date_to = '',
    game_segment = '',
    last_n_games = 0,
    league_id = '10',
    location = '',
    measure_type = 'Base',
    month = 0,
    opponent_team_id = 0,
    outcome = '',
    po_round = '',
    pace_adjust = 'N',
    per_mode = 'Totals',
    period = 0,
    player_id = '1628932',
    plus_minus = 'N',
    rank = 'N',
    season = most_recent_wnba_season() - 1,
    season_segment = '',
    season_type = 'Regular Season',
    shot_clock_range = '',
    vs_conference = '',
    vs_division = '',
    ...){
  
  # Intentional
  # season_type <- gsub(' ', '+', season_type)
  version <- "playerdashboardbyclutch"
  endpoint <- wnba_endpoint(version)
  full_url <- endpoint
  
  params <- list(
    DateFrom = date_from,
    DateTo = date_to,
    GameSegment = game_segment,
    LastNGames = last_n_games,
    LeagueID = league_id,
    Location = location,
    MeasureType = measure_type,
    Month = month,
    OpponentTeamID = opponent_team_id,
    Outcome = outcome,
    PaceAdjust = pace_adjust,
    PORound = po_round,
    PerMode = per_mode,
    Period = period,
    PlayerID = player_id,
    PlusMinus = plus_minus,
    Rank = rank,
    Season = season,
    SeasonSegment = season_segment,
    SeasonType = season_type,
    ShotClockRange = shot_clock_range,
    VsConference = vs_conference,
    VsDivision = vs_division
  )
  
  tryCatch(
    expr = {
      
      resp <- request_with_proxy(url = full_url, params = params, ...)
      
      df_list <- wnba_stats_map_result_sets(resp)
      
    },
    error = function(e) {
      cli::cli_alert_danger("{Sys.time()}: Invalid arguments or player dashboard by clutch splits data available for {player_id}!")
      cli::cli_alert_danger("Error:\n{e}")
    },
    warning = function(w) {
      cli::cli_alert_warning("{Sys.time()}: Warning:\n{w}")
    },
    finally = {
    }
  )
  return(df_list)
}


#' **Get WNBA Stats API Player Dashboard by Game Splits**
#' @name wnba_playerdashboardbygamesplits
NULL
#' @title
#' **Get WNBA Stats API Player Dashboard by Game Splits**
#' @rdname wnba_playerdashboardbygamesplits
#' @author Saiem Gilani
#' @param date_from date_from
#' @param date_to date_to
#' @param game_segment game_segment
#' @param last_n_games last_n_games
#' @param league_id league_id
#' @param location location
#' @param measure_type measure_type
#' @param month month
#' @param opponent_team_id opponent_team_id
#' @param outcome outcome
#' @param po_round po_round
#' @param pace_adjust pace_adjust
#' @param per_mode per_mode
#' @param period period
#' @param player_id player_id
#' @param plus_minus plus_minus
#' @param rank rank
#' @param season season
#' @param season_segment season_segment
#' @param season_type season_type
#' @param shot_clock_range shot_clock_range
#' @param vs_conference vs_conference
#' @param vs_division vs_division
#' @param ... Additional arguments passed to an underlying function like httr.
#' @return Return a named list of data frames: ByActualMarginPlayerDashboard,
#' ByHalfPlayerDashboard, ByPeriodPlayerDashboard, ByScoreMarginPlayerDashboard,
#' OverallPlayerDashboard
#'
#'    **OverallPlayerDashboard**
#'
#'
#'    |col_name              |types     |
#'    |:---------------------|:---------|
#'    |GROUP_SET             |character |
#'    |GROUP_VALUE           |character |
#'    |GP                    |character |
#'    |W                     |character |
#'    |L                     |character |
#'    |W_PCT                 |character |
#'    |MIN                   |character |
#'    |FGM                   |character |
#'    |FGA                   |character |
#'    |FG_PCT                |character |
#'    |FG3M                  |character |
#'    |FG3A                  |character |
#'    |FG3_PCT               |character |
#'    |FTM                   |character |
#'    |FTA                   |character |
#'    |FT_PCT                |character |
#'    |OREB                  |character |
#'    |DREB                  |character |
#'    |REB                   |character |
#'    |AST                   |character |
#'    |TOV                   |character |
#'    |STL                   |character |
#'    |BLK                   |character |
#'    |BLKA                  |character |
#'    |PF                    |character |
#'    |PFD                   |character |
#'    |PTS                   |character |
#'    |PLUS_MINUS            |character |
#'    |NBA_FANTASY_PTS       |character |
#'    |DD2                   |character |
#'    |TD3                   |character |
#'    |WNBA_FANTASY_PTS      |character |
#'    |GP_RANK               |character |
#'    |W_RANK                |character |
#'    |L_RANK                |character |
#'    |W_PCT_RANK            |character |
#'    |MIN_RANK              |character |
#'    |FGM_RANK              |character |
#'    |FGA_RANK              |character |
#'    |FG_PCT_RANK           |character |
#'    |FG3M_RANK             |character |
#'    |FG3A_RANK             |character |
#'    |FG3_PCT_RANK          |character |
#'    |FTM_RANK              |character |
#'    |FTA_RANK              |character |
#'    |FT_PCT_RANK           |character |
#'    |OREB_RANK             |character |
#'    |DREB_RANK             |character |
#'    |REB_RANK              |character |
#'    |AST_RANK              |character |
#'    |TOV_RANK              |character |
#'    |STL_RANK              |character |
#'    |BLK_RANK              |character |
#'    |BLKA_RANK             |character |
#'    |PF_RANK               |character |
#'    |PFD_RANK              |character |
#'    |PTS_RANK              |character |
#'    |PLUS_MINUS_RANK       |character |
#'    |NBA_FANTASY_PTS_RANK  |character |
#'    |DD2_RANK              |character |
#'    |TD3_RANK              |character |
#'    |WNBA_FANTASY_PTS_RANK |character |
#'
#'    **ByHalfPlayerDashboard**
#'
#'
#'    |col_name              |types     |
#'    |:---------------------|:---------|
#'    |GROUP_SET             |character |
#'    |GROUP_VALUE           |character |
#'    |GP                    |character |
#'    |W                     |character |
#'    |L                     |character |
#'    |W_PCT                 |character |
#'    |MIN                   |character |
#'    |FGM                   |character |
#'    |FGA                   |character |
#'    |FG_PCT                |character |
#'    |FG3M                  |character |
#'    |FG3A                  |character |
#'    |FG3_PCT               |character |
#'    |FTM                   |character |
#'    |FTA                   |character |
#'    |FT_PCT                |character |
#'    |OREB                  |character |
#'    |DREB                  |character |
#'    |REB                   |character |
#'    |AST                   |character |
#'    |TOV                   |character |
#'    |STL                   |character |
#'    |BLK                   |character |
#'    |BLKA                  |character |
#'    |PF                    |character |
#'    |PFD                   |character |
#'    |PTS                   |character |
#'    |PLUS_MINUS            |character |
#'    |NBA_FANTASY_PTS       |character |
#'    |DD2                   |character |
#'    |TD3                   |character |
#'    |WNBA_FANTASY_PTS      |character |
#'    |GP_RANK               |character |
#'    |W_RANK                |character |
#'    |L_RANK                |character |
#'    |W_PCT_RANK            |character |
#'    |MIN_RANK              |character |
#'    |FGM_RANK              |character |
#'    |FGA_RANK              |character |
#'    |FG_PCT_RANK           |character |
#'    |FG3M_RANK             |character |
#'    |FG3A_RANK             |character |
#'    |FG3_PCT_RANK          |character |
#'    |FTM_RANK              |character |
#'    |FTA_RANK              |character |
#'    |FT_PCT_RANK           |character |
#'    |OREB_RANK             |character |
#'    |DREB_RANK             |character |
#'    |REB_RANK              |character |
#'    |AST_RANK              |character |
#'    |TOV_RANK              |character |
#'    |STL_RANK              |character |
#'    |BLK_RANK              |character |
#'    |BLKA_RANK             |character |
#'    |PF_RANK               |character |
#'    |PFD_RANK              |character |
#'    |PTS_RANK              |character |
#'    |PLUS_MINUS_RANK       |character |
#'    |NBA_FANTASY_PTS_RANK  |character |
#'    |DD2_RANK              |character |
#'    |TD3_RANK              |character |
#'    |WNBA_FANTASY_PTS_RANK |character |
#'
#'    **ByPeriodPlayerDashboard**
#'
#'
#'    |col_name              |types     |
#'    |:---------------------|:---------|
#'    |GROUP_SET             |character |
#'    |GROUP_VALUE           |character |
#'    |GP                    |character |
#'    |W                     |character |
#'    |L                     |character |
#'    |W_PCT                 |character |
#'    |MIN                   |character |
#'    |FGM                   |character |
#'    |FGA                   |character |
#'    |FG_PCT                |character |
#'    |FG3M                  |character |
#'    |FG3A                  |character |
#'    |FG3_PCT               |character |
#'    |FTM                   |character |
#'    |FTA                   |character |
#'    |FT_PCT                |character |
#'    |OREB                  |character |
#'    |DREB                  |character |
#'    |REB                   |character |
#'    |AST                   |character |
#'    |TOV                   |character |
#'    |STL                   |character |
#'    |BLK                   |character |
#'    |BLKA                  |character |
#'    |PF                    |character |
#'    |PFD                   |character |
#'    |PTS                   |character |
#'    |PLUS_MINUS            |character |
#'    |NBA_FANTASY_PTS       |character |
#'    |DD2                   |character |
#'    |TD3                   |character |
#'    |WNBA_FANTASY_PTS      |character |
#'    |GP_RANK               |character |
#'    |W_RANK                |character |
#'    |L_RANK                |character |
#'    |W_PCT_RANK            |character |
#'    |MIN_RANK              |character |
#'    |FGM_RANK              |character |
#'    |FGA_RANK              |character |
#'    |FG_PCT_RANK           |character |
#'    |FG3M_RANK             |character |
#'    |FG3A_RANK             |character |
#'    |FG3_PCT_RANK          |character |
#'    |FTM_RANK              |character |
#'    |FTA_RANK              |character |
#'    |FT_PCT_RANK           |character |
#'    |OREB_RANK             |character |
#'    |DREB_RANK             |character |
#'    |REB_RANK              |character |
#'    |AST_RANK              |character |
#'    |TOV_RANK              |character |
#'    |STL_RANK              |character |
#'    |BLK_RANK              |character |
#'    |BLKA_RANK             |character |
#'    |PF_RANK               |character |
#'    |PFD_RANK              |character |
#'    |PTS_RANK              |character |
#'    |PLUS_MINUS_RANK       |character |
#'    |NBA_FANTASY_PTS_RANK  |character |
#'    |DD2_RANK              |character |
#'    |TD3_RANK              |character |
#'    |WNBA_FANTASY_PTS_RANK |character |
#'
#'    **ByScoreMarginPlayerDashboard**
#'
#'
#'    |col_name              |types     |
#'    |:---------------------|:---------|
#'    |GROUP_SET             |character |
#'    |GROUP_VALUE           |character |
#'    |GP                    |character |
#'    |W                     |character |
#'    |L                     |character |
#'    |W_PCT                 |character |
#'    |MIN                   |character |
#'    |FGM                   |character |
#'    |FGA                   |character |
#'    |FG_PCT                |character |
#'    |FG3M                  |character |
#'    |FG3A                  |character |
#'    |FG3_PCT               |character |
#'    |FTM                   |character |
#'    |FTA                   |character |
#'    |FT_PCT                |character |
#'    |OREB                  |character |
#'    |DREB                  |character |
#'    |REB                   |character |
#'    |AST                   |character |
#'    |TOV                   |character |
#'    |STL                   |character |
#'    |BLK                   |character |
#'    |BLKA                  |character |
#'    |PF                    |character |
#'    |PFD                   |character |
#'    |PTS                   |character |
#'    |PLUS_MINUS            |character |
#'    |NBA_FANTASY_PTS       |character |
#'    |DD2                   |character |
#'    |TD3                   |character |
#'    |WNBA_FANTASY_PTS      |character |
#'    |GP_RANK               |character |
#'    |W_RANK                |character |
#'    |L_RANK                |character |
#'    |W_PCT_RANK            |character |
#'    |MIN_RANK              |character |
#'    |FGM_RANK              |character |
#'    |FGA_RANK              |character |
#'    |FG_PCT_RANK           |character |
#'    |FG3M_RANK             |character |
#'    |FG3A_RANK             |character |
#'    |FG3_PCT_RANK          |character |
#'    |FTM_RANK              |character |
#'    |FTA_RANK              |character |
#'    |FT_PCT_RANK           |character |
#'    |OREB_RANK             |character |
#'    |DREB_RANK             |character |
#'    |REB_RANK              |character |
#'    |AST_RANK              |character |
#'    |TOV_RANK              |character |
#'    |STL_RANK              |character |
#'    |BLK_RANK              |character |
#'    |BLKA_RANK             |character |
#'    |PF_RANK               |character |
#'    |PFD_RANK              |character |
#'    |PTS_RANK              |character |
#'    |PLUS_MINUS_RANK       |character |
#'    |NBA_FANTASY_PTS_RANK  |character |
#'    |DD2_RANK              |character |
#'    |TD3_RANK              |character |
#'    |WNBA_FANTASY_PTS_RANK |character |
#'
#'    **ByActualMarginPlayerDashboard**
#'
#'
#'    |col_name              |types     |
#'    |:---------------------|:---------|
#'    |GROUP_SET             |character |
#'    |GROUP_VALUE           |character |
#'    |GP                    |character |
#'    |W                     |character |
#'    |L                     |character |
#'    |W_PCT                 |character |
#'    |MIN                   |character |
#'    |FGM                   |character |
#'    |FGA                   |character |
#'    |FG_PCT                |character |
#'    |FG3M                  |character |
#'    |FG3A                  |character |
#'    |FG3_PCT               |character |
#'    |FTM                   |character |
#'    |FTA                   |character |
#'    |FT_PCT                |character |
#'    |OREB                  |character |
#'    |DREB                  |character |
#'    |REB                   |character |
#'    |AST                   |character |
#'    |TOV                   |character |
#'    |STL                   |character |
#'    |BLK                   |character |
#'    |BLKA                  |character |
#'    |PF                    |character |
#'    |PFD                   |character |
#'    |PTS                   |character |
#'    |PLUS_MINUS            |character |
#'    |NBA_FANTASY_PTS       |character |
#'    |DD2                   |character |
#'    |TD3                   |character |
#'    |WNBA_FANTASY_PTS      |character |
#'    |GP_RANK               |character |
#'    |W_RANK                |character |
#'    |L_RANK                |character |
#'    |W_PCT_RANK            |character |
#'    |MIN_RANK              |character |
#'    |FGM_RANK              |character |
#'    |FGA_RANK              |character |
#'    |FG_PCT_RANK           |character |
#'    |FG3M_RANK             |character |
#'    |FG3A_RANK             |character |
#'    |FG3_PCT_RANK          |character |
#'    |FTM_RANK              |character |
#'    |FTA_RANK              |character |
#'    |FT_PCT_RANK           |character |
#'    |OREB_RANK             |character |
#'    |DREB_RANK             |character |
#'    |REB_RANK              |character |
#'    |AST_RANK              |character |
#'    |TOV_RANK              |character |
#'    |STL_RANK              |character |
#'    |BLK_RANK              |character |
#'    |BLKA_RANK             |character |
#'    |PF_RANK               |character |
#'    |PFD_RANK              |character |
#'    |PTS_RANK              |character |
#'    |PLUS_MINUS_RANK       |character |
#'    |NBA_FANTASY_PTS_RANK  |character |
#'    |DD2_RANK              |character |
#'    |TD3_RANK              |character |
#'    |WNBA_FANTASY_PTS_RANK |character |
#'
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows as_tibble
#' @import rvest
#' @export
#' @family WNBA Player Functions
#' @details
#' ```r
#'  wnba_playerdashboardbygamesplits(player_id = '1628932', season = most_recent_wnba_season() - 1)
#' ```
wnba_playerdashboardbygamesplits <- function(
    date_from = '',
    date_to = '',
    game_segment = '',
    last_n_games = 0,
    league_id = '10',
    location = '',
    measure_type = 'Base',
    month = 0,
    opponent_team_id = 0,
    outcome = '',
    po_round = '',
    pace_adjust = 'N',
    per_mode = 'Totals',
    period = 0,
    player_id = '1628932',
    plus_minus = 'N',
    rank = 'N',
    season = most_recent_wnba_season() - 1,
    season_segment = '',
    season_type = 'Regular Season',
    shot_clock_range = '',
    vs_conference = '',
    vs_division = '',
    ...){
  
  # Intentional
  # season_type <- gsub(' ', '+', season_type)
  version <- "playerdashboardbygamesplits"
  endpoint <- wnba_endpoint(version)
  full_url <- endpoint
  
  params <- list(
    DateFrom = date_from,
    DateTo = date_to,
    GameSegment = game_segment,
    LastNGames = last_n_games,
    LeagueID = league_id,
    Location = location,
    MeasureType = measure_type,
    Month = month,
    OpponentTeamID = opponent_team_id,
    Outcome = outcome,
    PaceAdjust = pace_adjust,
    PORound = po_round,
    PerMode = per_mode,
    Period = period,
    PlayerID = player_id,
    PlusMinus = plus_minus,
    Rank = rank,
    Season = season,
    SeasonSegment = season_segment,
    SeasonType = season_type,
    ShotClockRange = shot_clock_range,
    VsConference = vs_conference,
    VsDivision = vs_division
  )
  
  tryCatch(
    expr = {
      
      resp <- request_with_proxy(url = full_url, params = params, ...)
      
      df_list <- wnba_stats_map_result_sets(resp)
      
    },
    error = function(e) {
      cli::cli_alert_danger("{Sys.time()}: Invalid arguments or player dashboard by game splits data available for {player_id}!")
      cli::cli_alert_danger("Error:\n{e}")
    },
    warning = function(w) {
      cli::cli_alert_warning("{Sys.time()}: Warning:\n{w}")
    },
    finally = {
    }
  )
  return(df_list)
}



#' **Get WNBA Stats API Player Dashboard by General Splits**
#' @name wnba_playerdashboardbygeneralsplits
NULL
#' @title
#' **Get WNBA Stats API Player Dashboard by General Splits**
#' @rdname wnba_playerdashboardbygeneralsplits
#' @author Saiem Gilani
#' @param date_from date_from
#' @param date_to date_to
#' @param game_segment game_segment
#' @param last_n_games last_n_games
#' @param league_id league_id
#' @param location location
#' @param measure_type measure_type
#' @param month month
#' @param opponent_team_id opponent_team_id
#' @param outcome outcome
#' @param po_round po_round
#' @param pace_adjust pace_adjust
#' @param per_mode per_mode
#' @param period period
#' @param player_id player_id
#' @param plus_minus plus_minus
#' @param rank rank
#' @param season season
#' @param season_segment season_segment
#' @param season_type season_type
#' @param shot_clock_range shot_clock_range
#' @param vs_conference vs_conference
#' @param vs_division vs_division
#' @param ... Additional arguments passed to an underlying function like httr.
#' @return Return a named list of data frames: DaysRestPlayerDashboard, LocationPlayerDashboard,
#' MonthPlayerDashboard, OverallPlayerDashboard, PrePostAllStarPlayerDashboard,
#' StartingPosition, WinsLossesPlayerDashboard
#'
#'    **OverallPlayerDashboard**
#'
#'
#'    |col_name              |types     |
#'    |:---------------------|:---------|
#'    |GROUP_SET             |character |
#'    |GROUP_VALUE           |character |
#'    |GP                    |character |
#'    |W                     |character |
#'    |L                     |character |
#'    |W_PCT                 |character |
#'    |MIN                   |character |
#'    |FGM                   |character |
#'    |FGA                   |character |
#'    |FG_PCT                |character |
#'    |FG3M                  |character |
#'    |FG3A                  |character |
#'    |FG3_PCT               |character |
#'    |FTM                   |character |
#'    |FTA                   |character |
#'    |FT_PCT                |character |
#'    |OREB                  |character |
#'    |DREB                  |character |
#'    |REB                   |character |
#'    |AST                   |character |
#'    |TOV                   |character |
#'    |STL                   |character |
#'    |BLK                   |character |
#'    |BLKA                  |character |
#'    |PF                    |character |
#'    |PFD                   |character |
#'    |PTS                   |character |
#'    |PLUS_MINUS            |character |
#'    |NBA_FANTASY_PTS       |character |
#'    |DD2                   |character |
#'    |TD3                   |character |
#'    |WNBA_FANTASY_PTS      |character |
#'    |GP_RANK               |character |
#'    |W_RANK                |character |
#'    |L_RANK                |character |
#'    |W_PCT_RANK            |character |
#'    |MIN_RANK              |character |
#'    |FGM_RANK              |character |
#'    |FGA_RANK              |character |
#'    |FG_PCT_RANK           |character |
#'    |FG3M_RANK             |character |
#'    |FG3A_RANK             |character |
#'    |FG3_PCT_RANK          |character |
#'    |FTM_RANK              |character |
#'    |FTA_RANK              |character |
#'    |FT_PCT_RANK           |character |
#'    |OREB_RANK             |character |
#'    |DREB_RANK             |character |
#'    |REB_RANK              |character |
#'    |AST_RANK              |character |
#'    |TOV_RANK              |character |
#'    |STL_RANK              |character |
#'    |BLK_RANK              |character |
#'    |BLKA_RANK             |character |
#'    |PF_RANK               |character |
#'    |PFD_RANK              |character |
#'    |PTS_RANK              |character |
#'    |PLUS_MINUS_RANK       |character |
#'    |NBA_FANTASY_PTS_RANK  |character |
#'    |DD2_RANK              |character |
#'    |TD3_RANK              |character |
#'    |WNBA_FANTASY_PTS_RANK |character |
#'
#'    **LocationPlayerDashboard**
#'
#'
#'    |col_name              |types     |
#'    |:---------------------|:---------|
#'    |GROUP_SET             |character |
#'    |GROUP_VALUE           |character |
#'    |GP                    |character |
#'    |W                     |character |
#'    |L                     |character |
#'    |W_PCT                 |character |
#'    |MIN                   |character |
#'    |FGM                   |character |
#'    |FGA                   |character |
#'    |FG_PCT                |character |
#'    |FG3M                  |character |
#'    |FG3A                  |character |
#'    |FG3_PCT               |character |
#'    |FTM                   |character |
#'    |FTA                   |character |
#'    |FT_PCT                |character |
#'    |OREB                  |character |
#'    |DREB                  |character |
#'    |REB                   |character |
#'    |AST                   |character |
#'    |TOV                   |character |
#'    |STL                   |character |
#'    |BLK                   |character |
#'    |BLKA                  |character |
#'    |PF                    |character |
#'    |PFD                   |character |
#'    |PTS                   |character |
#'    |PLUS_MINUS            |character |
#'    |NBA_FANTASY_PTS       |character |
#'    |DD2                   |character |
#'    |TD3                   |character |
#'    |WNBA_FANTASY_PTS      |character |
#'    |GP_RANK               |character |
#'    |W_RANK                |character |
#'    |L_RANK                |character |
#'    |W_PCT_RANK            |character |
#'    |MIN_RANK              |character |
#'    |FGM_RANK              |character |
#'    |FGA_RANK              |character |
#'    |FG_PCT_RANK           |character |
#'    |FG3M_RANK             |character |
#'    |FG3A_RANK             |character |
#'    |FG3_PCT_RANK          |character |
#'    |FTM_RANK              |character |
#'    |FTA_RANK              |character |
#'    |FT_PCT_RANK           |character |
#'    |OREB_RANK             |character |
#'    |DREB_RANK             |character |
#'    |REB_RANK              |character |
#'    |AST_RANK              |character |
#'    |TOV_RANK              |character |
#'    |STL_RANK              |character |
#'    |BLK_RANK              |character |
#'    |BLKA_RANK             |character |
#'    |PF_RANK               |character |
#'    |PFD_RANK              |character |
#'    |PTS_RANK              |character |
#'    |PLUS_MINUS_RANK       |character |
#'    |NBA_FANTASY_PTS_RANK  |character |
#'    |DD2_RANK              |character |
#'    |TD3_RANK              |character |
#'    |WNBA_FANTASY_PTS_RANK |character |
#'
#'    **WinsLossesPlayerDashboard**
#'
#'
#'    |col_name              |types     |
#'    |:---------------------|:---------|
#'    |GROUP_SET             |character |
#'    |GROUP_VALUE           |character |
#'    |GP                    |character |
#'    |W                     |character |
#'    |L                     |character |
#'    |W_PCT                 |character |
#'    |MIN                   |character |
#'    |FGM                   |character |
#'    |FGA                   |character |
#'    |FG_PCT                |character |
#'    |FG3M                  |character |
#'    |FG3A                  |character |
#'    |FG3_PCT               |character |
#'    |FTM                   |character |
#'    |FTA                   |character |
#'    |FT_PCT                |character |
#'    |OREB                  |character |
#'    |DREB                  |character |
#'    |REB                   |character |
#'    |AST                   |character |
#'    |TOV                   |character |
#'    |STL                   |character |
#'    |BLK                   |character |
#'    |BLKA                  |character |
#'    |PF                    |character |
#'    |PFD                   |character |
#'    |PTS                   |character |
#'    |PLUS_MINUS            |character |
#'    |NBA_FANTASY_PTS       |character |
#'    |DD2                   |character |
#'    |TD3                   |character |
#'    |WNBA_FANTASY_PTS      |character |
#'    |GP_RANK               |character |
#'    |W_RANK                |character |
#'    |L_RANK                |character |
#'    |W_PCT_RANK            |character |
#'    |MIN_RANK              |character |
#'    |FGM_RANK              |character |
#'    |FGA_RANK              |character |
#'    |FG_PCT_RANK           |character |
#'    |FG3M_RANK             |character |
#'    |FG3A_RANK             |character |
#'    |FG3_PCT_RANK          |character |
#'    |FTM_RANK              |character |
#'    |FTA_RANK              |character |
#'    |FT_PCT_RANK           |character |
#'    |OREB_RANK             |character |
#'    |DREB_RANK             |character |
#'    |REB_RANK              |character |
#'    |AST_RANK              |character |
#'    |TOV_RANK              |character |
#'    |STL_RANK              |character |
#'    |BLK_RANK              |character |
#'    |BLKA_RANK             |character |
#'    |PF_RANK               |character |
#'    |PFD_RANK              |character |
#'    |PTS_RANK              |character |
#'    |PLUS_MINUS_RANK       |character |
#'    |NBA_FANTASY_PTS_RANK  |character |
#'    |DD2_RANK              |character |
#'    |TD3_RANK              |character |
#'    |WNBA_FANTASY_PTS_RANK |character |
#'
#'    **MonthPlayerDashboard**
#'
#'
#'    |col_name              |types     |
#'    |:---------------------|:---------|
#'    |GROUP_SET             |character |
#'    |GROUP_VALUE           |character |
#'    |GP                    |character |
#'    |W                     |character |
#'    |L                     |character |
#'    |W_PCT                 |character |
#'    |MIN                   |character |
#'    |FGM                   |character |
#'    |FGA                   |character |
#'    |FG_PCT                |character |
#'    |FG3M                  |character |
#'    |FG3A                  |character |
#'    |FG3_PCT               |character |
#'    |FTM                   |character |
#'    |FTA                   |character |
#'    |FT_PCT                |character |
#'    |OREB                  |character |
#'    |DREB                  |character |
#'    |REB                   |character |
#'    |AST                   |character |
#'    |TOV                   |character |
#'    |STL                   |character |
#'    |BLK                   |character |
#'    |BLKA                  |character |
#'    |PF                    |character |
#'    |PFD                   |character |
#'    |PTS                   |character |
#'    |PLUS_MINUS            |character |
#'    |NBA_FANTASY_PTS       |character |
#'    |DD2                   |character |
#'    |TD3                   |character |
#'    |WNBA_FANTASY_PTS      |character |
#'    |GP_RANK               |character |
#'    |W_RANK                |character |
#'    |L_RANK                |character |
#'    |W_PCT_RANK            |character |
#'    |MIN_RANK              |character |
#'    |FGM_RANK              |character |
#'    |FGA_RANK              |character |
#'    |FG_PCT_RANK           |character |
#'    |FG3M_RANK             |character |
#'    |FG3A_RANK             |character |
#'    |FG3_PCT_RANK          |character |
#'    |FTM_RANK              |character |
#'    |FTA_RANK              |character |
#'    |FT_PCT_RANK           |character |
#'    |OREB_RANK             |character |
#'    |DREB_RANK             |character |
#'    |REB_RANK              |character |
#'    |AST_RANK              |character |
#'    |TOV_RANK              |character |
#'    |STL_RANK              |character |
#'    |BLK_RANK              |character |
#'    |BLKA_RANK             |character |
#'    |PF_RANK               |character |
#'    |PFD_RANK              |character |
#'    |PTS_RANK              |character |
#'    |PLUS_MINUS_RANK       |character |
#'    |NBA_FANTASY_PTS_RANK  |character |
#'    |DD2_RANK              |character |
#'    |TD3_RANK              |character |
#'    |WNBA_FANTASY_PTS_RANK |character |
#'
#'    **PrePostAllStarPlayerDashboard**
#'
#'
#'    |col_name              |types     |
#'    |:---------------------|:---------|
#'    |GROUP_SET             |character |
#'    |GROUP_VALUE           |character |
#'    |GP                    |character |
#'    |W                     |character |
#'    |L                     |character |
#'    |W_PCT                 |character |
#'    |MIN                   |character |
#'    |FGM                   |character |
#'    |FGA                   |character |
#'    |FG_PCT                |character |
#'    |FG3M                  |character |
#'    |FG3A                  |character |
#'    |FG3_PCT               |character |
#'    |FTM                   |character |
#'    |FTA                   |character |
#'    |FT_PCT                |character |
#'    |OREB                  |character |
#'    |DREB                  |character |
#'    |REB                   |character |
#'    |AST                   |character |
#'    |TOV                   |character |
#'    |STL                   |character |
#'    |BLK                   |character |
#'    |BLKA                  |character |
#'    |PF                    |character |
#'    |PFD                   |character |
#'    |PTS                   |character |
#'    |PLUS_MINUS            |character |
#'    |NBA_FANTASY_PTS       |character |
#'    |DD2                   |character |
#'    |TD3                   |character |
#'    |WNBA_FANTASY_PTS      |character |
#'    |GP_RANK               |character |
#'    |W_RANK                |character |
#'    |L_RANK                |character |
#'    |W_PCT_RANK            |character |
#'    |MIN_RANK              |character |
#'    |FGM_RANK              |character |
#'    |FGA_RANK              |character |
#'    |FG_PCT_RANK           |character |
#'    |FG3M_RANK             |character |
#'    |FG3A_RANK             |character |
#'    |FG3_PCT_RANK          |character |
#'    |FTM_RANK              |character |
#'    |FTA_RANK              |character |
#'    |FT_PCT_RANK           |character |
#'    |OREB_RANK             |character |
#'    |DREB_RANK             |character |
#'    |REB_RANK              |character |
#'    |AST_RANK              |character |
#'    |TOV_RANK              |character |
#'    |STL_RANK              |character |
#'    |BLK_RANK              |character |
#'    |BLKA_RANK             |character |
#'    |PF_RANK               |character |
#'    |PFD_RANK              |character |
#'    |PTS_RANK              |character |
#'    |PLUS_MINUS_RANK       |character |
#'    |NBA_FANTASY_PTS_RANK  |character |
#'    |DD2_RANK              |character |
#'    |TD3_RANK              |character |
#'    |WNBA_FANTASY_PTS_RANK |character |
#'
#'    **StartingPosition**
#'
#'
#'    |col_name              |types     |
#'    |:---------------------|:---------|
#'    |GROUP_SET             |character |
#'    |GROUP_VALUE           |character |
#'    |GP                    |character |
#'    |W                     |character |
#'    |L                     |character |
#'    |W_PCT                 |character |
#'    |MIN                   |character |
#'    |FGM                   |character |
#'    |FGA                   |character |
#'    |FG_PCT                |character |
#'    |FG3M                  |character |
#'    |FG3A                  |character |
#'    |FG3_PCT               |character |
#'    |FTM                   |character |
#'    |FTA                   |character |
#'    |FT_PCT                |character |
#'    |OREB                  |character |
#'    |DREB                  |character |
#'    |REB                   |character |
#'    |AST                   |character |
#'    |TOV                   |character |
#'    |STL                   |character |
#'    |BLK                   |character |
#'    |BLKA                  |character |
#'    |PF                    |character |
#'    |PFD                   |character |
#'    |PTS                   |character |
#'    |PLUS_MINUS            |character |
#'    |NBA_FANTASY_PTS       |character |
#'    |DD2                   |character |
#'    |TD3                   |character |
#'    |WNBA_FANTASY_PTS      |character |
#'    |GP_RANK               |character |
#'    |W_RANK                |character |
#'    |L_RANK                |character |
#'    |W_PCT_RANK            |character |
#'    |MIN_RANK              |character |
#'    |FGM_RANK              |character |
#'    |FGA_RANK              |character |
#'    |FG_PCT_RANK           |character |
#'    |FG3M_RANK             |character |
#'    |FG3A_RANK             |character |
#'    |FG3_PCT_RANK          |character |
#'    |FTM_RANK              |character |
#'    |FTA_RANK              |character |
#'    |FT_PCT_RANK           |character |
#'    |OREB_RANK             |character |
#'    |DREB_RANK             |character |
#'    |REB_RANK              |character |
#'    |AST_RANK              |character |
#'    |TOV_RANK              |character |
#'    |STL_RANK              |character |
#'    |BLK_RANK              |character |
#'    |BLKA_RANK             |character |
#'    |PF_RANK               |character |
#'    |PFD_RANK              |character |
#'    |PTS_RANK              |character |
#'    |PLUS_MINUS_RANK       |character |
#'    |NBA_FANTASY_PTS_RANK  |character |
#'    |DD2_RANK              |character |
#'    |TD3_RANK              |character |
#'    |WNBA_FANTASY_PTS_RANK |character |
#'
#'    **DaysRestPlayerDashboard**
#'
#'
#'    |col_name              |types     |
#'    |:---------------------|:---------|
#'    |GROUP_SET             |character |
#'    |GROUP_VALUE           |character |
#'    |GP                    |character |
#'    |W                     |character |
#'    |L                     |character |
#'    |W_PCT                 |character |
#'    |MIN                   |character |
#'    |FGM                   |character |
#'    |FGA                   |character |
#'    |FG_PCT                |character |
#'    |FG3M                  |character |
#'    |FG3A                  |character |
#'    |FG3_PCT               |character |
#'    |FTM                   |character |
#'    |FTA                   |character |
#'    |FT_PCT                |character |
#'    |OREB                  |character |
#'    |DREB                  |character |
#'    |REB                   |character |
#'    |AST                   |character |
#'    |TOV                   |character |
#'    |STL                   |character |
#'    |BLK                   |character |
#'    |BLKA                  |character |
#'    |PF                    |character |
#'    |PFD                   |character |
#'    |PTS                   |character |
#'    |PLUS_MINUS            |character |
#'    |NBA_FANTASY_PTS       |character |
#'    |DD2                   |character |
#'    |TD3                   |character |
#'    |WNBA_FANTASY_PTS      |character |
#'    |GP_RANK               |character |
#'    |W_RANK                |character |
#'    |L_RANK                |character |
#'    |W_PCT_RANK            |character |
#'    |MIN_RANK              |character |
#'    |FGM_RANK              |character |
#'    |FGA_RANK              |character |
#'    |FG_PCT_RANK           |character |
#'    |FG3M_RANK             |character |
#'    |FG3A_RANK             |character |
#'    |FG3_PCT_RANK          |character |
#'    |FTM_RANK              |character |
#'    |FTA_RANK              |character |
#'    |FT_PCT_RANK           |character |
#'    |OREB_RANK             |character |
#'    |DREB_RANK             |character |
#'    |REB_RANK              |character |
#'    |AST_RANK              |character |
#'    |TOV_RANK              |character |
#'    |STL_RANK              |character |
#'    |BLK_RANK              |character |
#'    |BLKA_RANK             |character |
#'    |PF_RANK               |character |
#'    |PFD_RANK              |character |
#'    |PTS_RANK              |character |
#'    |PLUS_MINUS_RANK       |character |
#'    |NBA_FANTASY_PTS_RANK  |character |
#'    |DD2_RANK              |character |
#'    |TD3_RANK              |character |
#'    |WNBA_FANTASY_PTS_RANK |character |
#'
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows as_tibble
#' @import rvest
#' @export
#' @family WNBA Player Functions
#' @details
#' ```r
#'  wnba_playerdashboardbygeneralsplits(player_id = '1628932', season = most_recent_wnba_season() - 1)
#' ```
wnba_playerdashboardbygeneralsplits <- function(
    date_from = '',
    date_to = '',
    game_segment = '',
    last_n_games = 0,
    league_id = '10',
    location = '',
    measure_type = 'Base',
    month = 0,
    opponent_team_id = 0,
    outcome = '',
    po_round = '',
    pace_adjust = 'N',
    per_mode = 'Totals',
    period = 0,
    player_id = '1628932',
    plus_minus = 'N',
    rank = 'N',
    season = most_recent_wnba_season() - 1,
    season_segment = '',
    season_type = 'Regular Season',
    shot_clock_range = '',
    vs_conference = '',
    vs_division = '',
    ...){
  
  # Intentional
  # season_type <- gsub(' ', '+', season_type)
  version <- "playerdashboardbygeneralsplits"
  endpoint <- wnba_endpoint(version)
  full_url <- endpoint
  
  params <- list(
    DateFrom = date_from,
    DateTo = date_to,
    GameSegment = game_segment,
    LastNGames = last_n_games,
    LeagueID = league_id,
    Location = location,
    MeasureType = measure_type,
    Month = month,
    OpponentTeamID = opponent_team_id,
    Outcome = outcome,
    PaceAdjust = pace_adjust,
    PORound = po_round,
    PerMode = per_mode,
    Period = period,
    PlayerID = player_id,
    PlusMinus = plus_minus,
    Rank = rank,
    Season = season,
    SeasonSegment = season_segment,
    SeasonType = season_type,
    ShotClockRange = shot_clock_range,
    VsConference = vs_conference,
    VsDivision = vs_division
  )
  
  tryCatch(
    expr = {
      
      resp <- request_with_proxy(url = full_url, params = params, ...)
      
      df_list <- wnba_stats_map_result_sets(resp)
      
    },
    error = function(e) {
      cli::cli_alert_danger("{Sys.time()}: Invalid arguments or no player dashboard by general splits data available for {player_id}!")
      cli::cli_alert_danger("Error:\n{e}")
    },
    warning = function(w) {
      cli::cli_alert_warning("{Sys.time()}: Warning:\n{w}")
    },
    finally = {
    }
  )
  return(df_list)
}



#' **Get WNBA Stats API Player Dashboard by Last N Games**
#' @name wnba_playerdashboardbylastngames
NULL
#' @title
#' **Get WNBA Stats API Player Dashboard by Last N Games**
#' @rdname wnba_playerdashboardbylastngames
#' @author Saiem Gilani
#' @param date_from date_from
#' @param date_to date_to
#' @param game_segment game_segment
#' @param last_n_games last_n_games
#' @param league_id league_id
#' @param location location
#' @param measure_type measure_type
#' @param month month
#' @param opponent_team_id opponent_team_id
#' @param outcome outcome
#' @param po_round po_round
#' @param pace_adjust pace_adjust
#' @param per_mode per_mode
#' @param period period
#' @param player_id player_id
#' @param plus_minus plus_minus
#' @param rank rank
#' @param season season
#' @param season_segment season_segment
#' @param season_type season_type
#' @param shot_clock_range shot_clock_range
#' @param vs_conference vs_conference
#' @param vs_division vs_division
#' @param ... Additional arguments passed to an underlying function like httr.
#' @return Return a named list of data frames: GameNumberPlayerDashboard, Last10PlayerDashboard,
#'  Last15PlayerDashboard, Last20PlayerDashboard,
#' Last5PlayerDashboard, OverallPlayerDashboard
#'
#'    **OverallPlayerDashboard**
#'
#'
#'    |col_name              |types     |
#'    |:---------------------|:---------|
#'    |GROUP_SET             |character |
#'    |GROUP_VALUE           |character |
#'    |GP                    |character |
#'    |W                     |character |
#'    |L                     |character |
#'    |W_PCT                 |character |
#'    |MIN                   |character |
#'    |FGM                   |character |
#'    |FGA                   |character |
#'    |FG_PCT                |character |
#'    |FG3M                  |character |
#'    |FG3A                  |character |
#'    |FG3_PCT               |character |
#'    |FTM                   |character |
#'    |FTA                   |character |
#'    |FT_PCT                |character |
#'    |OREB                  |character |
#'    |DREB                  |character |
#'    |REB                   |character |
#'    |AST                   |character |
#'    |TOV                   |character |
#'    |STL                   |character |
#'    |BLK                   |character |
#'    |BLKA                  |character |
#'    |PF                    |character |
#'    |PFD                   |character |
#'    |PTS                   |character |
#'    |PLUS_MINUS            |character |
#'    |NBA_FANTASY_PTS       |character |
#'    |DD2                   |character |
#'    |TD3                   |character |
#'    |WNBA_FANTASY_PTS      |character |
#'    |GP_RANK               |character |
#'    |W_RANK                |character |
#'    |L_RANK                |character |
#'    |W_PCT_RANK            |character |
#'    |MIN_RANK              |character |
#'    |FGM_RANK              |character |
#'    |FGA_RANK              |character |
#'    |FG_PCT_RANK           |character |
#'    |FG3M_RANK             |character |
#'    |FG3A_RANK             |character |
#'    |FG3_PCT_RANK          |character |
#'    |FTM_RANK              |character |
#'    |FTA_RANK              |character |
#'    |FT_PCT_RANK           |character |
#'    |OREB_RANK             |character |
#'    |DREB_RANK             |character |
#'    |REB_RANK              |character |
#'    |AST_RANK              |character |
#'    |TOV_RANK              |character |
#'    |STL_RANK              |character |
#'    |BLK_RANK              |character |
#'    |BLKA_RANK             |character |
#'    |PF_RANK               |character |
#'    |PFD_RANK              |character |
#'    |PTS_RANK              |character |
#'    |PLUS_MINUS_RANK       |character |
#'    |NBA_FANTASY_PTS_RANK  |character |
#'    |DD2_RANK              |character |
#'    |TD3_RANK              |character |
#'    |WNBA_FANTASY_PTS_RANK |character |
#'
#'    **Last5PlayerDashboard**
#'
#'
#'    |col_name              |types     |
#'    |:---------------------|:---------|
#'    |GROUP_SET             |character |
#'    |GROUP_VALUE           |character |
#'    |GP                    |character |
#'    |W                     |character |
#'    |L                     |character |
#'    |W_PCT                 |character |
#'    |MIN                   |character |
#'    |FGM                   |character |
#'    |FGA                   |character |
#'    |FG_PCT                |character |
#'    |FG3M                  |character |
#'    |FG3A                  |character |
#'    |FG3_PCT               |character |
#'    |FTM                   |character |
#'    |FTA                   |character |
#'    |FT_PCT                |character |
#'    |OREB                  |character |
#'    |DREB                  |character |
#'    |REB                   |character |
#'    |AST                   |character |
#'    |TOV                   |character |
#'    |STL                   |character |
#'    |BLK                   |character |
#'    |BLKA                  |character |
#'    |PF                    |character |
#'    |PFD                   |character |
#'    |PTS                   |character |
#'    |PLUS_MINUS            |character |
#'    |NBA_FANTASY_PTS       |character |
#'    |DD2                   |character |
#'    |TD3                   |character |
#'    |WNBA_FANTASY_PTS      |character |
#'    |GP_RANK               |character |
#'    |W_RANK                |character |
#'    |L_RANK                |character |
#'    |W_PCT_RANK            |character |
#'    |MIN_RANK              |character |
#'    |FGM_RANK              |character |
#'    |FGA_RANK              |character |
#'    |FG_PCT_RANK           |character |
#'    |FG3M_RANK             |character |
#'    |FG3A_RANK             |character |
#'    |FG3_PCT_RANK          |character |
#'    |FTM_RANK              |character |
#'    |FTA_RANK              |character |
#'    |FT_PCT_RANK           |character |
#'    |OREB_RANK             |character |
#'    |DREB_RANK             |character |
#'    |REB_RANK              |character |
#'    |AST_RANK              |character |
#'    |TOV_RANK              |character |
#'    |STL_RANK              |character |
#'    |BLK_RANK              |character |
#'    |BLKA_RANK             |character |
#'    |PF_RANK               |character |
#'    |PFD_RANK              |character |
#'    |PTS_RANK              |character |
#'    |PLUS_MINUS_RANK       |character |
#'    |NBA_FANTASY_PTS_RANK  |character |
#'    |DD2_RANK              |character |
#'    |TD3_RANK              |character |
#'    |WNBA_FANTASY_PTS_RANK |character |
#'
#'    **Last10PlayerDashboard**
#'
#'
#'    |col_name              |types     |
#'    |:---------------------|:---------|
#'    |GROUP_SET             |character |
#'    |GROUP_VALUE           |character |
#'    |GP                    |character |
#'    |W                     |character |
#'    |L                     |character |
#'    |W_PCT                 |character |
#'    |MIN                   |character |
#'    |FGM                   |character |
#'    |FGA                   |character |
#'    |FG_PCT                |character |
#'    |FG3M                  |character |
#'    |FG3A                  |character |
#'    |FG3_PCT               |character |
#'    |FTM                   |character |
#'    |FTA                   |character |
#'    |FT_PCT                |character |
#'    |OREB                  |character |
#'    |DREB                  |character |
#'    |REB                   |character |
#'    |AST                   |character |
#'    |TOV                   |character |
#'    |STL                   |character |
#'    |BLK                   |character |
#'    |BLKA                  |character |
#'    |PF                    |character |
#'    |PFD                   |character |
#'    |PTS                   |character |
#'    |PLUS_MINUS            |character |
#'    |NBA_FANTASY_PTS       |character |
#'    |DD2                   |character |
#'    |TD3                   |character |
#'    |WNBA_FANTASY_PTS      |character |
#'    |GP_RANK               |character |
#'    |W_RANK                |character |
#'    |L_RANK                |character |
#'    |W_PCT_RANK            |character |
#'    |MIN_RANK              |character |
#'    |FGM_RANK              |character |
#'    |FGA_RANK              |character |
#'    |FG_PCT_RANK           |character |
#'    |FG3M_RANK             |character |
#'    |FG3A_RANK             |character |
#'    |FG3_PCT_RANK          |character |
#'    |FTM_RANK              |character |
#'    |FTA_RANK              |character |
#'    |FT_PCT_RANK           |character |
#'    |OREB_RANK             |character |
#'    |DREB_RANK             |character |
#'    |REB_RANK              |character |
#'    |AST_RANK              |character |
#'    |TOV_RANK              |character |
#'    |STL_RANK              |character |
#'    |BLK_RANK              |character |
#'    |BLKA_RANK             |character |
#'    |PF_RANK               |character |
#'    |PFD_RANK              |character |
#'    |PTS_RANK              |character |
#'    |PLUS_MINUS_RANK       |character |
#'    |NBA_FANTASY_PTS_RANK  |character |
#'    |DD2_RANK              |character |
#'    |TD3_RANK              |character |
#'    |WNBA_FANTASY_PTS_RANK |character |
#'
#'    **Last15PlayerDashboard**
#'
#'
#'    |col_name              |types     |
#'    |:---------------------|:---------|
#'    |GROUP_SET             |character |
#'    |GROUP_VALUE           |character |
#'    |GP                    |character |
#'    |W                     |character |
#'    |L                     |character |
#'    |W_PCT                 |character |
#'    |MIN                   |character |
#'    |FGM                   |character |
#'    |FGA                   |character |
#'    |FG_PCT                |character |
#'    |FG3M                  |character |
#'    |FG3A                  |character |
#'    |FG3_PCT               |character |
#'    |FTM                   |character |
#'    |FTA                   |character |
#'    |FT_PCT                |character |
#'    |OREB                  |character |
#'    |DREB                  |character |
#'    |REB                   |character |
#'    |AST                   |character |
#'    |TOV                   |character |
#'    |STL                   |character |
#'    |BLK                   |character |
#'    |BLKA                  |character |
#'    |PF                    |character |
#'    |PFD                   |character |
#'    |PTS                   |character |
#'    |PLUS_MINUS            |character |
#'    |NBA_FANTASY_PTS       |character |
#'    |DD2                   |character |
#'    |TD3                   |character |
#'    |WNBA_FANTASY_PTS      |character |
#'    |GP_RANK               |character |
#'    |W_RANK                |character |
#'    |L_RANK                |character |
#'    |W_PCT_RANK            |character |
#'    |MIN_RANK              |character |
#'    |FGM_RANK              |character |
#'    |FGA_RANK              |character |
#'    |FG_PCT_RANK           |character |
#'    |FG3M_RANK             |character |
#'    |FG3A_RANK             |character |
#'    |FG3_PCT_RANK          |character |
#'    |FTM_RANK              |character |
#'    |FTA_RANK              |character |
#'    |FT_PCT_RANK           |character |
#'    |OREB_RANK             |character |
#'    |DREB_RANK             |character |
#'    |REB_RANK              |character |
#'    |AST_RANK              |character |
#'    |TOV_RANK              |character |
#'    |STL_RANK              |character |
#'    |BLK_RANK              |character |
#'    |BLKA_RANK             |character |
#'    |PF_RANK               |character |
#'    |PFD_RANK              |character |
#'    |PTS_RANK              |character |
#'    |PLUS_MINUS_RANK       |character |
#'    |NBA_FANTASY_PTS_RANK  |character |
#'    |DD2_RANK              |character |
#'    |TD3_RANK              |character |
#'    |WNBA_FANTASY_PTS_RANK |character |
#'
#'    **Last20PlayerDashboard**
#'
#'
#'    |col_name              |types     |
#'    |:---------------------|:---------|
#'    |GROUP_SET             |character |
#'    |GROUP_VALUE           |character |
#'    |GP                    |character |
#'    |W                     |character |
#'    |L                     |character |
#'    |W_PCT                 |character |
#'    |MIN                   |character |
#'    |FGM                   |character |
#'    |FGA                   |character |
#'    |FG_PCT                |character |
#'    |FG3M                  |character |
#'    |FG3A                  |character |
#'    |FG3_PCT               |character |
#'    |FTM                   |character |
#'    |FTA                   |character |
#'    |FT_PCT                |character |
#'    |OREB                  |character |
#'    |DREB                  |character |
#'    |REB                   |character |
#'    |AST                   |character |
#'    |TOV                   |character |
#'    |STL                   |character |
#'    |BLK                   |character |
#'    |BLKA                  |character |
#'    |PF                    |character |
#'    |PFD                   |character |
#'    |PTS                   |character |
#'    |PLUS_MINUS            |character |
#'    |NBA_FANTASY_PTS       |character |
#'    |DD2                   |character |
#'    |TD3                   |character |
#'    |WNBA_FANTASY_PTS      |character |
#'    |GP_RANK               |character |
#'    |W_RANK                |character |
#'    |L_RANK                |character |
#'    |W_PCT_RANK            |character |
#'    |MIN_RANK              |character |
#'    |FGM_RANK              |character |
#'    |FGA_RANK              |character |
#'    |FG_PCT_RANK           |character |
#'    |FG3M_RANK             |character |
#'    |FG3A_RANK             |character |
#'    |FG3_PCT_RANK          |character |
#'    |FTM_RANK              |character |
#'    |FTA_RANK              |character |
#'    |FT_PCT_RANK           |character |
#'    |OREB_RANK             |character |
#'    |DREB_RANK             |character |
#'    |REB_RANK              |character |
#'    |AST_RANK              |character |
#'    |TOV_RANK              |character |
#'    |STL_RANK              |character |
#'    |BLK_RANK              |character |
#'    |BLKA_RANK             |character |
#'    |PF_RANK               |character |
#'    |PFD_RANK              |character |
#'    |PTS_RANK              |character |
#'    |PLUS_MINUS_RANK       |character |
#'    |NBA_FANTASY_PTS_RANK  |character |
#'    |DD2_RANK              |character |
#'    |TD3_RANK              |character |
#'    |WNBA_FANTASY_PTS_RANK |character |
#'
#'    **GameNumberPlayerDashboard**
#'
#'
#'    |col_name              |types     |
#'    |:---------------------|:---------|
#'    |GROUP_SET             |character |
#'    |GROUP_VALUE           |character |
#'    |GP                    |character |
#'    |W                     |character |
#'    |L                     |character |
#'    |W_PCT                 |character |
#'    |MIN                   |character |
#'    |FGM                   |character |
#'    |FGA                   |character |
#'    |FG_PCT                |character |
#'    |FG3M                  |character |
#'    |FG3A                  |character |
#'    |FG3_PCT               |character |
#'    |FTM                   |character |
#'    |FTA                   |character |
#'    |FT_PCT                |character |
#'    |OREB                  |character |
#'    |DREB                  |character |
#'    |REB                   |character |
#'    |AST                   |character |
#'    |TOV                   |character |
#'    |STL                   |character |
#'    |BLK                   |character |
#'    |BLKA                  |character |
#'    |PF                    |character |
#'    |PFD                   |character |
#'    |PTS                   |character |
#'    |PLUS_MINUS            |character |
#'    |NBA_FANTASY_PTS       |character |
#'    |DD2                   |character |
#'    |TD3                   |character |
#'    |WNBA_FANTASY_PTS      |character |
#'    |GP_RANK               |character |
#'    |W_RANK                |character |
#'    |L_RANK                |character |
#'    |W_PCT_RANK            |character |
#'    |MIN_RANK              |character |
#'    |FGM_RANK              |character |
#'    |FGA_RANK              |character |
#'    |FG_PCT_RANK           |character |
#'    |FG3M_RANK             |character |
#'    |FG3A_RANK             |character |
#'    |FG3_PCT_RANK          |character |
#'    |FTM_RANK              |character |
#'    |FTA_RANK              |character |
#'    |FT_PCT_RANK           |character |
#'    |OREB_RANK             |character |
#'    |DREB_RANK             |character |
#'    |REB_RANK              |character |
#'    |AST_RANK              |character |
#'    |TOV_RANK              |character |
#'    |STL_RANK              |character |
#'    |BLK_RANK              |character |
#'    |BLKA_RANK             |character |
#'    |PF_RANK               |character |
#'    |PFD_RANK              |character |
#'    |PTS_RANK              |character |
#'    |PLUS_MINUS_RANK       |character |
#'    |NBA_FANTASY_PTS_RANK  |character |
#'    |DD2_RANK              |character |
#'    |TD3_RANK              |character |
#'    |WNBA_FANTASY_PTS_RANK |character |
#'
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows as_tibble
#' @import rvest
#' @export
#' @family WNBA Player Functions
#' @details
#' ```r
#'  wnba_playerdashboardbylastngames(player_id = '1628932', season = most_recent_wnba_season() - 1)
#' ```
wnba_playerdashboardbylastngames <- function(
    date_from = '',
    date_to = '',
    game_segment = '',
    last_n_games = 0,
    league_id = '10',
    location = '',
    measure_type = 'Base',
    month = 0,
    opponent_team_id = 0,
    outcome = '',
    po_round = '',
    pace_adjust = 'N',
    per_mode = 'Totals',
    period = 0,
    player_id = '1628932',
    plus_minus = 'N',
    rank = 'N',
    season = most_recent_wnba_season() - 1,
    season_segment = '',
    season_type = 'Regular Season',
    shot_clock_range = '',
    vs_conference = '',
    vs_division = '',
    ...){
  
  # Intentional
  # season_type <- gsub(' ', '+', season_type)
  version <- "playerdashboardbylastngames"
  endpoint <- wnba_endpoint(version)
  full_url <- endpoint
  
  params <- list(
    DateFrom = date_from,
    DateTo = date_to,
    GameSegment = game_segment,
    LastNGames = last_n_games,
    LeagueID = league_id,
    Location = location,
    MeasureType = measure_type,
    Month = month,
    OpponentTeamID = opponent_team_id,
    Outcome = outcome,
    PaceAdjust = pace_adjust,
    PORound = po_round,
    PerMode = per_mode,
    Period = period,
    PlayerID = player_id,
    PlusMinus = plus_minus,
    Rank = rank,
    Season = season,
    SeasonSegment = season_segment,
    SeasonType = season_type,
    ShotClockRange = shot_clock_range,
    VsConference = vs_conference,
    VsDivision = vs_division
  )
  
  tryCatch(
    expr = {
      
      resp <- request_with_proxy(url = full_url, params = params, ...)
      
      df_list <- wnba_stats_map_result_sets(resp)
      
    },
    error = function(e) {
      cli::cli_alert_danger("{Sys.time()}: Invalid arguments or no player dashboard by last n games data available for {player_id}!")
      cli::cli_alert_danger("Error:\n{e}")
    },
    warning = function(w) {
      cli::cli_alert_warning("{Sys.time()}: Warning:\n{w}")
    },
    finally = {
    }
  )
  return(df_list)
}



#' **Get WNBA Stats API Player Dashboard by Opponent**
#' @name wnba_playerdashboardbyopponent
NULL
#' @title
#' **Get WNBA Stats API Player Dashboard by Opponent**
#' @rdname wnba_playerdashboardbyopponent
#' @author Saiem Gilani
#' @param date_from date_from
#' @param date_to date_to
#' @param game_segment game_segment
#' @param last_n_games last_n_games
#' @param league_id league_id
#' @param location location
#' @param measure_type measure_type
#' @param month month
#' @param opponent_team_id opponent_team_id
#' @param outcome outcome
#' @param po_round po_round
#' @param pace_adjust pace_adjust
#' @param per_mode per_mode
#' @param period period
#' @param player_id player_id
#' @param plus_minus plus_minus
#' @param rank rank
#' @param season season
#' @param season_segment season_segment
#' @param season_type season_type
#' @param shot_clock_range shot_clock_range
#' @param vs_conference vs_conference
#' @param vs_division vs_division
#' @param ... Additional arguments passed to an underlying function like httr.
#' @return Return a named list of data frames: ConferencePlayerDashboard,
#' DivisionPlayerDashboard, OpponentPlayerDashboard, OverallPlayerDashboard
#'
#'    **OverallPlayerDashboard**
#'
#'
#'    |col_name              |types     |
#'    |:---------------------|:---------|
#'    |GROUP_SET             |character |
#'    |GROUP_VALUE           |character |
#'    |GP                    |character |
#'    |W                     |character |
#'    |L                     |character |
#'    |W_PCT                 |character |
#'    |MIN                   |character |
#'    |FGM                   |character |
#'    |FGA                   |character |
#'    |FG_PCT                |character |
#'    |FG3M                  |character |
#'    |FG3A                  |character |
#'    |FG3_PCT               |character |
#'    |FTM                   |character |
#'    |FTA                   |character |
#'    |FT_PCT                |character |
#'    |OREB                  |character |
#'    |DREB                  |character |
#'    |REB                   |character |
#'    |AST                   |character |
#'    |TOV                   |character |
#'    |STL                   |character |
#'    |BLK                   |character |
#'    |BLKA                  |character |
#'    |PF                    |character |
#'    |PFD                   |character |
#'    |PTS                   |character |
#'    |PLUS_MINUS            |character |
#'    |NBA_FANTASY_PTS       |character |
#'    |DD2                   |character |
#'    |TD3                   |character |
#'    |WNBA_FANTASY_PTS      |character |
#'    |GP_RANK               |character |
#'    |W_RANK                |character |
#'    |L_RANK                |character |
#'    |W_PCT_RANK            |character |
#'    |MIN_RANK              |character |
#'    |FGM_RANK              |character |
#'    |FGA_RANK              |character |
#'    |FG_PCT_RANK           |character |
#'    |FG3M_RANK             |character |
#'    |FG3A_RANK             |character |
#'    |FG3_PCT_RANK          |character |
#'    |FTM_RANK              |character |
#'    |FTA_RANK              |character |
#'    |FT_PCT_RANK           |character |
#'    |OREB_RANK             |character |
#'    |DREB_RANK             |character |
#'    |REB_RANK              |character |
#'    |AST_RANK              |character |
#'    |TOV_RANK              |character |
#'    |STL_RANK              |character |
#'    |BLK_RANK              |character |
#'    |BLKA_RANK             |character |
#'    |PF_RANK               |character |
#'    |PFD_RANK              |character |
#'    |PTS_RANK              |character |
#'    |PLUS_MINUS_RANK       |character |
#'    |NBA_FANTASY_PTS_RANK  |character |
#'    |DD2_RANK              |character |
#'    |TD3_RANK              |character |
#'    |WNBA_FANTASY_PTS_RANK |character |
#'
#'    **ConferencePlayerDashboard**
#'
#'
#'    |col_name              |types     |
#'    |:---------------------|:---------|
#'    |GROUP_SET             |character |
#'    |GROUP_VALUE           |character |
#'    |GP                    |character |
#'    |W                     |character |
#'    |L                     |character |
#'    |W_PCT                 |character |
#'    |MIN                   |character |
#'    |FGM                   |character |
#'    |FGA                   |character |
#'    |FG_PCT                |character |
#'    |FG3M                  |character |
#'    |FG3A                  |character |
#'    |FG3_PCT               |character |
#'    |FTM                   |character |
#'    |FTA                   |character |
#'    |FT_PCT                |character |
#'    |OREB                  |character |
#'    |DREB                  |character |
#'    |REB                   |character |
#'    |AST                   |character |
#'    |TOV                   |character |
#'    |STL                   |character |
#'    |BLK                   |character |
#'    |BLKA                  |character |
#'    |PF                    |character |
#'    |PFD                   |character |
#'    |PTS                   |character |
#'    |PLUS_MINUS            |character |
#'    |NBA_FANTASY_PTS       |character |
#'    |DD2                   |character |
#'    |TD3                   |character |
#'    |WNBA_FANTASY_PTS      |character |
#'    |GP_RANK               |character |
#'    |W_RANK                |character |
#'    |L_RANK                |character |
#'    |W_PCT_RANK            |character |
#'    |MIN_RANK              |character |
#'    |FGM_RANK              |character |
#'    |FGA_RANK              |character |
#'    |FG_PCT_RANK           |character |
#'    |FG3M_RANK             |character |
#'    |FG3A_RANK             |character |
#'    |FG3_PCT_RANK          |character |
#'    |FTM_RANK              |character |
#'    |FTA_RANK              |character |
#'    |FT_PCT_RANK           |character |
#'    |OREB_RANK             |character |
#'    |DREB_RANK             |character |
#'    |REB_RANK              |character |
#'    |AST_RANK              |character |
#'    |TOV_RANK              |character |
#'    |STL_RANK              |character |
#'    |BLK_RANK              |character |
#'    |BLKA_RANK             |character |
#'    |PF_RANK               |character |
#'    |PFD_RANK              |character |
#'    |PTS_RANK              |character |
#'    |PLUS_MINUS_RANK       |character |
#'    |WBA_FANTASY_PTS_RANK  |character |
#'    |DD2_RANK              |character |
#'    |TD3_RANK              |character |
#'    |WNBA_FANTASY_PTS_RANK |character |
#'
#'    **DivisionPlayerDashboard**
#'
#'
#'    |col_name              |types     |
#'    |:---------------------|:---------|
#'    |GROUP_SET             |character |
#'    |GROUP_VALUE           |character |
#'    |GP                    |character |
#'    |W                     |character |
#'    |L                     |character |
#'    |W_PCT                 |character |
#'    |MIN                   |character |
#'    |FGM                   |character |
#'    |FGA                   |character |
#'    |FG_PCT                |character |
#'    |FG3M                  |character |
#'    |FG3A                  |character |
#'    |FG3_PCT               |character |
#'    |FTM                   |character |
#'    |FTA                   |character |
#'    |FT_PCT                |character |
#'    |OREB                  |character |
#'    |DREB                  |character |
#'    |REB                   |character |
#'    |AST                   |character |
#'    |TOV                   |character |
#'    |STL                   |character |
#'    |BLK                   |character |
#'    |BLKA                  |character |
#'    |PF                    |character |
#'    |PFD                   |character |
#'    |PTS                   |character |
#'    |PLUS_MINUS            |character |
#'    |NBA_FANTASY_PTS       |character |
#'    |DD2                   |character |
#'    |TD3                   |character |
#'    |WNBA_FANTASY_PTS      |character |
#'    |GP_RANK               |character |
#'    |W_RANK                |character |
#'    |L_RANK                |character |
#'    |W_PCT_RANK            |character |
#'    |MIN_RANK              |character |
#'    |FGM_RANK              |character |
#'    |FGA_RANK              |character |
#'    |FG_PCT_RANK           |character |
#'    |FG3M_RANK             |character |
#'    |FG3A_RANK             |character |
#'    |FG3_PCT_RANK          |character |
#'    |FTM_RANK              |character |
#'    |FTA_RANK              |character |
#'    |FT_PCT_RANK           |character |
#'    |OREB_RANK             |character |
#'    |DREB_RANK             |character |
#'    |REB_RANK              |character |
#'    |AST_RANK              |character |
#'    |TOV_RANK              |character |
#'    |STL_RANK              |character |
#'    |BLK_RANK              |character |
#'    |BLKA_RANK             |character |
#'    |PF_RANK               |character |
#'    |PFD_RANK              |character |
#'    |PTS_RANK              |character |
#'    |PLUS_MINUS_RANK       |character |
#'    |NBA_FANTASY_PTS_RANK  |character |
#'    |DD2_RANK              |character |
#'    |TD3_RANK              |character |
#'    |WNBA_FANTASY_PTS_RANK |character |
#'
#'    **OpponentPlayerDashboard**
#'
#'
#'    |col_name              |types     |
#'    |:---------------------|:---------|
#'    |GROUP_SET             |character |
#'    |GROUP_VALUE           |character |
#'    |GP                    |character |
#'    |W                     |character |
#'    |L                     |character |
#'    |W_PCT                 |character |
#'    |MIN                   |character |
#'    |FGM                   |character |
#'    |FGA                   |character |
#'    |FG_PCT                |character |
#'    |FG3M                  |character |
#'    |FG3A                  |character |
#'    |FG3_PCT               |character |
#'    |FTM                   |character |
#'    |FTA                   |character |
#'    |FT_PCT                |character |
#'    |OREB                  |character |
#'    |DREB                  |character |
#'    |REB                   |character |
#'    |AST                   |character |
#'    |TOV                   |character |
#'    |STL                   |character |
#'    |BLK                   |character |
#'    |BLKA                  |character |
#'    |PF                    |character |
#'    |PFD                   |character |
#'    |PTS                   |character |
#'    |PLUS_MINUS            |character |
#'    |NBA_FANTASY_PTS       |character |
#'    |DD2                   |character |
#'    |TD3                   |character |
#'    |WNBA_FANTASY_PTS      |character |
#'    |GP_RANK               |character |
#'    |W_RANK                |character |
#'    |L_RANK                |character |
#'    |W_PCT_RANK            |character |
#'    |MIN_RANK              |character |
#'    |FGM_RANK              |character |
#'    |FGA_RANK              |character |
#'    |FG_PCT_RANK           |character |
#'    |FG3M_RANK             |character |
#'    |FG3A_RANK             |character |
#'    |FG3_PCT_RANK          |character |
#'    |FTM_RANK              |character |
#'    |FTA_RANK              |character |
#'    |FT_PCT_RANK           |character |
#'    |OREB_RANK             |character |
#'    |DREB_RANK             |character |
#'    |REB_RANK              |character |
#'    |AST_RANK              |character |
#'    |TOV_RANK              |character |
#'    |STL_RANK              |character |
#'    |BLK_RANK              |character |
#'    |BLKA_RANK             |character |
#'    |PF_RANK               |character |
#'    |PFD_RANK              |character |
#'    |PTS_RANK              |character |
#'    |PLUS_MINUS_RANK       |character |
#'    |NBA_FANTASY_PTS_RANK  |character |
#'    |DD2_RANK              |character |
#'    |TD3_RANK              |character |
#'    |WNBA_FANTASY_PTS_RANK |character |
#'
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows as_tibble
#' @import rvest
#' @export
#' @family WNBA Player Functions
#' @details
#' ```r
#'  wnba_playerdashboardbyopponent(player_id = '1628932', season = most_recent_wnba_season() - 1)
#' ```
wnba_playerdashboardbyopponent <- function(
    date_from = '',
    date_to = '',
    game_segment = '',
    last_n_games = 0,
    league_id = '10',
    location = '',
    measure_type = 'Base',
    month = 0,
    opponent_team_id = 0,
    outcome = '',
    po_round = '',
    pace_adjust = 'N',
    per_mode = 'Totals',
    period = 0,
    player_id = '1628932',
    plus_minus = 'N',
    rank = 'N',
    season = most_recent_wnba_season() - 1,
    season_segment = '',
    season_type = 'Regular Season',
    shot_clock_range = '',
    vs_conference = '',
    vs_division = '',
    ...){
  
  # Intentional
  # season_type <- gsub(' ', '+', season_type)
  version <- "playerdashboardbyopponent"
  endpoint <- wnba_endpoint(version)
  full_url <- endpoint
  
  params <- list(
    DateFrom = date_from,
    DateTo = date_to,
    GameSegment = game_segment,
    LastNGames = last_n_games,
    LeagueID = league_id,
    Location = location,
    MeasureType = measure_type,
    Month = month,
    OpponentTeamID = opponent_team_id,
    Outcome = outcome,
    PaceAdjust = pace_adjust,
    PORound = po_round,
    PerMode = per_mode,
    Period = period,
    PlayerID = player_id,
    PlusMinus = plus_minus,
    Rank = rank,
    Season = season,
    SeasonSegment = season_segment,
    SeasonType = season_type,
    ShotClockRange = shot_clock_range,
    VsConference = vs_conference,
    VsDivision = vs_division
  )
  
  tryCatch(
    expr = {
      
      resp <- request_with_proxy(url = full_url, params = params, ...)
      
      df_list <- wnba_stats_map_result_sets(resp)
      
    },
    error = function(e) {
      cli::cli_alert_danger("{Sys.time()}: Invalid arguments or no player dashboard by opponent data available for {player_id}!")
      cli::cli_alert_danger("Error:\n{e}")
    },
    warning = function(w) {
      cli::cli_alert_warning("{Sys.time()}: Warning:\n{w}")
    },
    finally = {
    }
  )
  return(df_list)
}


#' **Get WNBA Stats API Player Dashboard by Shooting Splits**
#' @name wnba_playerdashboardbyshootingsplits
NULL
#' @title
#' **Get WNBA Stats API Player Dashboard by Shooting Splits**
#' @rdname wnba_playerdashboardbyshootingsplits
#' @author Saiem Gilani
#' @param date_from date_from
#' @param date_to date_to
#' @param game_segment game_segment
#' @param last_n_games last_n_games
#' @param league_id league_id
#' @param location location
#' @param measure_type measure_type
#' @param month month
#' @param opponent_team_id opponent_team_id
#' @param outcome outcome
#' @param po_round po_round
#' @param pace_adjust pace_adjust
#' @param per_mode per_mode
#' @param period period
#' @param player_id player_id
#' @param plus_minus plus_minus
#' @param rank rank
#' @param season season
#' @param season_segment season_segment
#' @param season_type season_type
#' @param shot_clock_range shot_clock_range
#' @param vs_conference vs_conference
#' @param vs_division vs_division
#' @param ... Additional arguments passed to an underlying function like httr.
#' @return Return a named list of data frames: AssistedBy, AssitedShotPlayerDashboard,
#'  OverallPlayerDashboard, Shot5FTPlayerDashboard, Shot8FTPlayerDashboard,
#'  ShotAreaPlayerDashboard, ShotTypePlayerDashboard, ShotTypeSummaryPlayerDashboard
#'
#'    **OverallPlayerDashboard**
#'
#'
#'    |col_name          |types     |
#'    |:-----------------|:---------|
#'    |GROUP_SET         |character |
#'    |GROUP_VALUE       |character |
#'    |FGM               |character |
#'    |FGA               |character |
#'    |FG_PCT            |character |
#'    |FG3M              |character |
#'    |FG3A              |character |
#'    |FG3_PCT           |character |
#'    |EFG_PCT           |character |
#'    |BLKA              |character |
#'    |PCT_AST_2PM       |character |
#'    |PCT_UAST_2PM      |character |
#'    |PCT_AST_3PM       |character |
#'    |PCT_UAST_3PM      |character |
#'    |PCT_AST_FGM       |character |
#'    |PCT_UAST_FGM      |character |
#'    |FGM_RANK          |character |
#'    |FGA_RANK          |character |
#'    |FG_PCT_RANK       |character |
#'    |FG3M_RANK         |character |
#'    |FG3A_RANK         |character |
#'    |FG3_PCT_RANK      |character |
#'    |EFG_PCT_RANK      |character |
#'    |BLKA_RANK         |character |
#'    |PCT_AST_2PM_RANK  |character |
#'    |PCT_UAST_2PM_RANK |character |
#'    |PCT_AST_3PM_RANK  |character |
#'    |PCT_UAST_3PM_RANK |character |
#'    |PCT_AST_FGM_RANK  |character |
#'    |PCT_UAST_FGM_RANK |character |
#'
#'    **Shot5FTPlayerDashboard**
#'
#'
#'    |col_name          |types     |
#'    |:-----------------|:---------|
#'    |GROUP_SET         |character |
#'    |GROUP_VALUE       |character |
#'    |FGM               |character |
#'    |FGA               |character |
#'    |FG_PCT            |character |
#'    |FG3M              |character |
#'    |FG3A              |character |
#'    |FG3_PCT           |character |
#'    |EFG_PCT           |character |
#'    |BLKA              |character |
#'    |PCT_AST_2PM       |character |
#'    |PCT_UAST_2PM      |character |
#'    |PCT_AST_3PM       |character |
#'    |PCT_UAST_3PM      |character |
#'    |PCT_AST_FGM       |character |
#'    |PCT_UAST_FGM      |character |
#'    |FGM_RANK          |character |
#'    |FGA_RANK          |character |
#'    |FG_PCT_RANK       |character |
#'    |FG3M_RANK         |character |
#'    |FG3A_RANK         |character |
#'    |FG3_PCT_RANK      |character |
#'    |EFG_PCT_RANK      |character |
#'    |BLKA_RANK         |character |
#'    |PCT_AST_2PM_RANK  |character |
#'    |PCT_UAST_2PM_RANK |character |
#'    |PCT_AST_3PM_RANK  |character |
#'    |PCT_UAST_3PM_RANK |character |
#'    |PCT_AST_FGM_RANK  |character |
#'    |PCT_UAST_FGM_RANK |character |
#'
#'    **Shot8FTPlayerDashboard**
#'
#'
#'    |col_name          |types     |
#'    |:-----------------|:---------|
#'    |GROUP_SET         |character |
#'    |GROUP_VALUE       |character |
#'    |FGM               |character |
#'    |FGA               |character |
#'    |FG_PCT            |character |
#'    |FG3M              |character |
#'    |FG3A              |character |
#'    |FG3_PCT           |character |
#'    |EFG_PCT           |character |
#'    |BLKA              |character |
#'    |PCT_AST_2PM       |character |
#'    |PCT_UAST_2PM      |character |
#'    |PCT_AST_3PM       |character |
#'    |PCT_UAST_3PM      |character |
#'    |PCT_AST_FGM       |character |
#'    |PCT_UAST_FGM      |character |
#'    |FGM_RANK          |character |
#'    |FGA_RANK          |character |
#'    |FG_PCT_RANK       |character |
#'    |FG3M_RANK         |character |
#'    |FG3A_RANK         |character |
#'    |FG3_PCT_RANK      |character |
#'    |EFG_PCT_RANK      |character |
#'    |BLKA_RANK         |character |
#'    |PCT_AST_2PM_RANK  |character |
#'    |PCT_UAST_2PM_RANK |character |
#'    |PCT_AST_3PM_RANK  |character |
#'    |PCT_UAST_3PM_RANK |character |
#'    |PCT_AST_FGM_RANK  |character |
#'    |PCT_UAST_FGM_RANK |character |
#'
#'    **ShotAreaPlayerDashboard**
#'
#'
#'    |col_name          |types     |
#'    |:-----------------|:---------|
#'    |GROUP_SET         |character |
#'    |GROUP_VALUE       |character |
#'    |FGM               |character |
#'    |FGA               |character |
#'    |FG_PCT            |character |
#'    |FG3M              |character |
#'    |FG3A              |character |
#'    |FG3_PCT           |character |
#'    |EFG_PCT           |character |
#'    |BLKA              |character |
#'    |PCT_AST_2PM       |character |
#'    |PCT_UAST_2PM      |character |
#'    |PCT_AST_3PM       |character |
#'    |PCT_UAST_3PM      |character |
#'    |PCT_AST_FGM       |character |
#'    |PCT_UAST_FGM      |character |
#'    |FGM_RANK          |character |
#'    |FGA_RANK          |character |
#'    |FG_PCT_RANK       |character |
#'    |FG3M_RANK         |character |
#'    |FG3A_RANK         |character |
#'    |FG3_PCT_RANK      |character |
#'    |EFG_PCT_RANK      |character |
#'    |BLKA_RANK         |character |
#'    |PCT_AST_2PM_RANK  |character |
#'    |PCT_UAST_2PM_RANK |character |
#'    |PCT_AST_3PM_RANK  |character |
#'    |PCT_UAST_3PM_RANK |character |
#'    |PCT_AST_FGM_RANK  |character |
#'    |PCT_UAST_FGM_RANK |character |
#'
#'    **AssitedShotPlayerDashboard**
#'
#'
#'    |col_name          |types     |
#'    |:-----------------|:---------|
#'    |GROUP_SET         |character |
#'    |GROUP_VALUE       |character |
#'    |FGM               |character |
#'    |FGA               |character |
#'    |FG_PCT            |character |
#'    |FG3M              |character |
#'    |FG3A              |character |
#'    |FG3_PCT           |character |
#'    |EFG_PCT           |character |
#'    |BLKA              |character |
#'    |PCT_AST_2PM       |character |
#'    |PCT_UAST_2PM      |character |
#'    |PCT_AST_3PM       |character |
#'    |PCT_UAST_3PM      |character |
#'    |PCT_AST_FGM       |character |
#'    |PCT_UAST_FGM      |character |
#'    |FGM_RANK          |character |
#'    |FGA_RANK          |character |
#'    |FG_PCT_RANK       |character |
#'    |FG3M_RANK         |character |
#'    |FG3A_RANK         |character |
#'    |FG3_PCT_RANK      |character |
#'    |EFG_PCT_RANK      |character |
#'    |BLKA_RANK         |character |
#'    |PCT_AST_2PM_RANK  |character |
#'    |PCT_UAST_2PM_RANK |character |
#'    |PCT_AST_3PM_RANK  |character |
#'    |PCT_UAST_3PM_RANK |character |
#'    |PCT_AST_FGM_RANK  |character |
#'    |PCT_UAST_FGM_RANK |character |
#'
#'    **ShotTypeSummaryPlayerDashboard**
#'
#'
#'    |col_name     |types     |
#'    |:------------|:---------|
#'    |GROUP_SET    |character |
#'    |GROUP_VALUE  |character |
#'    |FGM          |character |
#'    |FGA          |character |
#'    |FG_PCT       |character |
#'    |FG3M         |character |
#'    |FG3A         |character |
#'    |FG3_PCT      |character |
#'    |EFG_PCT      |character |
#'    |BLKA         |character |
#'    |PCT_AST_2PM  |character |
#'    |PCT_UAST_2PM |character |
#'    |PCT_AST_3PM  |character |
#'    |PCT_UAST_3PM |character |
#'    |PCT_AST_FGM  |character |
#'    |PCT_UAST_FGM |character |
#'
#'    **ShotTypePlayerDashboard**
#'
#'
#'    |col_name          |types     |
#'    |:-----------------|:---------|
#'    |GROUP_SET         |character |
#'    |GROUP_VALUE       |character |
#'    |FGM               |character |
#'    |FGA               |character |
#'    |FG_PCT            |character |
#'    |FG3M              |character |
#'    |FG3A              |character |
#'    |FG3_PCT           |character |
#'    |EFG_PCT           |character |
#'    |BLKA              |character |
#'    |PCT_AST_2PM       |character |
#'    |PCT_UAST_2PM      |character |
#'    |PCT_AST_3PM       |character |
#'    |PCT_UAST_3PM      |character |
#'    |PCT_AST_FGM       |character |
#'    |PCT_UAST_FGM      |character |
#'    |FGM_RANK          |character |
#'    |FGA_RANK          |character |
#'    |FG_PCT_RANK       |character |
#'    |FG3M_RANK         |character |
#'    |FG3A_RANK         |character |
#'    |FG3_PCT_RANK      |character |
#'    |EFG_PCT_RANK      |character |
#'    |BLKA_RANK         |character |
#'    |PCT_AST_2PM_RANK  |character |
#'    |PCT_UAST_2PM_RANK |character |
#'    |PCT_AST_3PM_RANK  |character |
#'    |PCT_UAST_3PM_RANK |character |
#'    |PCT_AST_FGM_RANK  |character |
#'    |PCT_UAST_FGM_RANK |character |
#'
#'    **AssistedBy**
#'
#'
#'    |col_name          |types     |
#'    |:-----------------|:---------|
#'    |GROUP_SET         |character |
#'    |PLAYER_ID         |character |
#'    |PLAYER_NAME       |character |
#'    |FGM               |character |
#'    |FGA               |character |
#'    |FG_PCT            |character |
#'    |FG3M              |character |
#'    |FG3A              |character |
#'    |FG3_PCT           |character |
#'    |EFG_PCT           |character |
#'    |BLKA              |character |
#'    |PCT_AST_2PM       |character |
#'    |PCT_UAST_2PM      |character |
#'    |PCT_AST_3PM       |character |
#'    |PCT_UAST_3PM      |character |
#'    |PCT_AST_FGM       |character |
#'    |PCT_UAST_FGM      |character |
#'    |FGM_RANK          |character |
#'    |FGA_RANK          |character |
#'    |FG_PCT_RANK       |character |
#'    |FG3M_RANK         |character |
#'    |FG3A_RANK         |character |
#'    |FG3_PCT_RANK      |character |
#'    |EFG_PCT_RANK      |character |
#'    |BLKA_RANK         |character |
#'    |PCT_AST_2PM_RANK  |character |
#'    |PCT_UAST_2PM_RANK |character |
#'    |PCT_AST_3PM_RANK  |character |
#'    |PCT_UAST_3PM_RANK |character |
#'    |PCT_AST_FGM_RANK  |character |
#'    |PCT_UAST_FGM_RANK |character |
#'
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows as_tibble
#' @import rvest
#' @export
#' @family WNBA Player Functions
#' @family WNBA Shooting Functions
#' @details
#' ```r
#'  wnba_playerdashboardbyshootingsplits(player_id = '1628932', season = most_recent_wnba_season() - 1)
#' ```
wnba_playerdashboardbyshootingsplits <- function(
    date_from = '',
    date_to = '',
    game_segment = '',
    last_n_games = 0,
    league_id = '10',
    location = '',
    measure_type = 'Base',
    month = 0,
    opponent_team_id = 0,
    outcome = '',
    po_round = '',
    pace_adjust = 'N',
    per_mode = 'Totals',
    period = 0,
    player_id = '1628932',
    plus_minus = 'N',
    rank = 'N',
    season = most_recent_wnba_season() - 1,
    season_segment = '',
    season_type = 'Regular Season',
    shot_clock_range = '',
    vs_conference = '',
    vs_division = '',
    ...){
  
  # Intentional
  # season_type <- gsub(' ', '+', season_type)
  version <- "playerdashboardbyshootingsplits"
  endpoint <- wnba_endpoint(version)
  full_url <- endpoint
  
  params <- list(
    DateFrom = date_from,
    DateTo = date_to,
    GameSegment = game_segment,
    LastNGames = last_n_games,
    LeagueID = league_id,
    Location = location,
    MeasureType = measure_type,
    Month = month,
    OpponentTeamID = opponent_team_id,
    Outcome = outcome,
    PaceAdjust = pace_adjust,
    PORound = po_round,
    PerMode = per_mode,
    Period = period,
    PlayerID = player_id,
    PlusMinus = plus_minus,
    Rank = rank,
    Season = season,
    SeasonSegment = season_segment,
    SeasonType = season_type,
    ShotClockRange = shot_clock_range,
    VsConference = vs_conference,
    VsDivision = vs_division
  )
  
  tryCatch(
    expr = {
      
      resp <- request_with_proxy(url = full_url, params = params, ...)
      
      df_list <- wnba_stats_map_result_sets(resp)
      
    },
    error = function(e) {
      cli::cli_alert_danger("{Sys.time()}: Invalid arguments or no player dashboard by shooting splits data available for {player_id}!")
      cli::cli_alert_danger("Error:\n{e}")
    },
    warning = function(w) {
      cli::cli_alert_warning("{Sys.time()}: Warning:\n{w}")
    },
    finally = {
    }
  )
  return(df_list)
}


#' **Get WNBA Stats API Player Dashboard by Team Performance**
#' @name wnba_playerdashboardbyteamperformance
NULL
#' @title
#' **Get WNBA Stats API Player Dashboard by Team Performance**
#' @rdname wnba_playerdashboardbyteamperformance
#' @author Saiem Gilani
#' @param date_from date_from
#' @param date_to date_to
#' @param game_segment game_segment
#' @param last_n_games last_n_games
#' @param league_id league_id
#' @param location location
#' @param measure_type measure_type
#' @param month month
#' @param opponent_team_id opponent_team_id
#' @param outcome outcome
#' @param po_round po_round
#' @param pace_adjust pace_adjust
#' @param per_mode per_mode
#' @param period period
#' @param player_id player_id
#' @param plus_minus plus_minus
#' @param rank rank
#' @param season season
#' @param season_segment season_segment
#' @param season_type season_type
#' @param shot_clock_range shot_clock_range
#' @param vs_conference vs_conference
#' @param vs_division vs_division
#' @param ... Additional arguments passed to an underlying function like httr.
#' @return Return a named list of data frames: OverallPlayerDashboard,
#' PointsScoredPlayerDashboard, PointsAgainstPlayerDashboard,
#' ScoreDifferentialPlayerDashboard
#'
#'    **OverallPlayerDashboard**
#'
#'
#'    |col_name              |types     |
#'    |:---------------------|:---------|
#'    |GROUP_SET             |character |
#'    |GROUP_VALUE           |character |
#'    |GP                    |character |
#'    |W                     |character |
#'    |L                     |character |
#'    |W_PCT                 |character |
#'    |MIN                   |character |
#'    |FGM                   |character |
#'    |FGA                   |character |
#'    |FG_PCT                |character |
#'    |FG3M                  |character |
#'    |FG3A                  |character |
#'    |FG3_PCT               |character |
#'    |FTM                   |character |
#'    |FTA                   |character |
#'    |FT_PCT                |character |
#'    |OREB                  |character |
#'    |DREB                  |character |
#'    |REB                   |character |
#'    |AST                   |character |
#'    |TOV                   |character |
#'    |STL                   |character |
#'    |BLK                   |character |
#'    |BLKA                  |character |
#'    |PF                    |character |
#'    |PFD                   |character |
#'    |PTS                   |character |
#'    |PLUS_MINUS            |character |
#'    |NBA_FANTASY_PTS       |character |
#'    |DD2                   |character |
#'    |TD3                   |character |
#'    |WNBA_FANTASY_PTS      |character |
#'    |GP_RANK               |character |
#'    |W_RANK                |character |
#'    |L_RANK                |character |
#'    |W_PCT_RANK            |character |
#'    |MIN_RANK              |character |
#'    |FGM_RANK              |character |
#'    |FGA_RANK              |character |
#'    |FG_PCT_RANK           |character |
#'    |FG3M_RANK             |character |
#'    |FG3A_RANK             |character |
#'    |FG3_PCT_RANK          |character |
#'    |FTM_RANK              |character |
#'    |FTA_RANK              |character |
#'    |FT_PCT_RANK           |character |
#'    |OREB_RANK             |character |
#'    |DREB_RANK             |character |
#'    |REB_RANK              |character |
#'    |AST_RANK              |character |
#'    |TOV_RANK              |character |
#'    |STL_RANK              |character |
#'    |BLK_RANK              |character |
#'    |BLKA_RANK             |character |
#'    |PF_RANK               |character |
#'    |PFD_RANK              |character |
#'    |PTS_RANK              |character |
#'    |PLUS_MINUS_RANK       |character |
#'    |NBA_FANTASY_PTS_RANK  |character |
#'    |DD2_RANK              |character |
#'    |TD3_RANK              |character |
#'    |WNBA_FANTASY_PTS_RANK |character |
#'
#'    **ScoreDifferentialPlayerDashboard**
#'
#'
#'    |col_name              |types     |
#'    |:---------------------|:---------|
#'    |GROUP_SET             |character |
#'    |GROUP_VALUE_ORDER     |character |
#'    |GROUP_VALUE           |character |
#'    |GROUP_VALUE_2         |character |
#'    |GP                    |character |
#'    |W                     |character |
#'    |L                     |character |
#'    |W_PCT                 |character |
#'    |MIN                   |character |
#'    |FGM                   |character |
#'    |FGA                   |character |
#'    |FG_PCT                |character |
#'    |FG3M                  |character |
#'    |FG3A                  |character |
#'    |FG3_PCT               |character |
#'    |FTM                   |character |
#'    |FTA                   |character |
#'    |FT_PCT                |character |
#'    |OREB                  |character |
#'    |DREB                  |character |
#'    |REB                   |character |
#'    |AST                   |character |
#'    |TOV                   |character |
#'    |STL                   |character |
#'    |BLK                   |character |
#'    |BLKA                  |character |
#'    |PF                    |character |
#'    |PFD                   |character |
#'    |PTS                   |character |
#'    |PLUS_MINUS            |character |
#'    |NBA_FANTASY_PTS       |character |
#'    |DD2                   |character |
#'    |TD3                   |character |
#'    |WNBA_FANTASY_PTS      |character |
#'    |GP_RANK               |character |
#'    |W_RANK                |character |
#'    |L_RANK                |character |
#'    |W_PCT_RANK            |character |
#'    |MIN_RANK              |character |
#'    |FGM_RANK              |character |
#'    |FGA_RANK              |character |
#'    |FG_PCT_RANK           |character |
#'    |FG3M_RANK             |character |
#'    |FG3A_RANK             |character |
#'    |FG3_PCT_RANK          |character |
#'    |FTM_RANK              |character |
#'    |FTA_RANK              |character |
#'    |FT_PCT_RANK           |character |
#'    |OREB_RANK             |character |
#'    |DREB_RANK             |character |
#'    |REB_RANK              |character |
#'    |AST_RANK              |character |
#'    |TOV_RANK              |character |
#'    |STL_RANK              |character |
#'    |BLK_RANK              |character |
#'    |BLKA_RANK             |character |
#'    |PF_RANK               |character |
#'    |PFD_RANK              |character |
#'    |PTS_RANK              |character |
#'    |PLUS_MINUS_RANK       |character |
#'    |NBA_FANTASY_PTS_RANK  |character |
#'    |DD2_RANK              |character |
#'    |TD3_RANK              |character |
#'    |WNBA_FANTASY_PTS_RANK |character |
#'
#'    **PointsScoredPlayerDashboard**
#'
#'
#'    |col_name              |types     |
#'    |:---------------------|:---------|
#'    |GROUP_SET             |character |
#'    |GROUP_VALUE_ORDER     |character |
#'    |GROUP_VALUE           |character |
#'    |GROUP_VALUE_2         |character |
#'    |GP                    |character |
#'    |W                     |character |
#'    |L                     |character |
#'    |W_PCT                 |character |
#'    |MIN                   |character |
#'    |FGM                   |character |
#'    |FGA                   |character |
#'    |FG_PCT                |character |
#'    |FG3M                  |character |
#'    |FG3A                  |character |
#'    |FG3_PCT               |character |
#'    |FTM                   |character |
#'    |FTA                   |character |
#'    |FT_PCT                |character |
#'    |OREB                  |character |
#'    |DREB                  |character |
#'    |REB                   |character |
#'    |AST                   |character |
#'    |TOV                   |character |
#'    |STL                   |character |
#'    |BLK                   |character |
#'    |BLKA                  |character |
#'    |PF                    |character |
#'    |PFD                   |character |
#'    |PTS                   |character |
#'    |PLUS_MINUS            |character |
#'    |NBA_FANTASY_PTS       |character |
#'    |DD2                   |character |
#'    |TD3                   |character |
#'    |WNBA_FANTASY_PTS      |character |
#'    |GP_RANK               |character |
#'    |W_RANK                |character |
#'    |L_RANK                |character |
#'    |W_PCT_RANK            |character |
#'    |MIN_RANK              |character |
#'    |FGM_RANK              |character |
#'    |FGA_RANK              |character |
#'    |FG_PCT_RANK           |character |
#'    |FG3M_RANK             |character |
#'    |FG3A_RANK             |character |
#'    |FG3_PCT_RANK          |character |
#'    |FTM_RANK              |character |
#'    |FTA_RANK              |character |
#'    |FT_PCT_RANK           |character |
#'    |OREB_RANK             |character |
#'    |DREB_RANK             |character |
#'    |REB_RANK              |character |
#'    |AST_RANK              |character |
#'    |TOV_RANK              |character |
#'    |STL_RANK              |character |
#'    |BLK_RANK              |character |
#'    |BLKA_RANK             |character |
#'    |PF_RANK               |character |
#'    |PFD_RANK              |character |
#'    |PTS_RANK              |character |
#'    |PLUS_MINUS_RANK       |character |
#'    |NBA_FANTASY_PTS_RANK  |character |
#'    |DD2_RANK              |character |
#'    |TD3_RANK              |character |
#'    |WNBA_FANTASY_PTS_RANK |character |
#'
#'    **PontsAgainstPlayerDashboard**
#'
#'
#'    |col_name              |types     |
#'    |:---------------------|:---------|
#'    |GROUP_SET             |character |
#'    |GROUP_VALUE_ORDER     |character |
#'    |GROUP_VALUE           |character |
#'    |GROUP_VALUE_2         |character |
#'    |GP                    |character |
#'    |W                     |character |
#'    |L                     |character |
#'    |W_PCT                 |character |
#'    |MIN                   |character |
#'    |FGM                   |character |
#'    |FGA                   |character |
#'    |FG_PCT                |character |
#'    |FG3M                  |character |
#'    |FG3A                  |character |
#'    |FG3_PCT               |character |
#'    |FTM                   |character |
#'    |FTA                   |character |
#'    |FT_PCT                |character |
#'    |OREB                  |character |
#'    |DREB                  |character |
#'    |REB                   |character |
#'    |AST                   |character |
#'    |TOV                   |character |
#'    |STL                   |character |
#'    |BLK                   |character |
#'    |BLKA                  |character |
#'    |PF                    |character |
#'    |PFD                   |character |
#'    |PTS                   |character |
#'    |PLUS_MINUS            |character |
#'    |NBA_FANTASY_PTS       |character |
#'    |DD2                   |character |
#'    |TD3                   |character |
#'    |WNBA_FANTASY_PTS      |character |
#'    |GP_RANK               |character |
#'    |W_RANK                |character |
#'    |L_RANK                |character |
#'    |W_PCT_RANK            |character |
#'    |MIN_RANK              |character |
#'    |FGM_RANK              |character |
#'    |FGA_RANK              |character |
#'    |FG_PCT_RANK           |character |
#'    |FG3M_RANK             |character |
#'    |FG3A_RANK             |character |
#'    |FG3_PCT_RANK          |character |
#'    |FTM_RANK              |character |
#'    |FTA_RANK              |character |
#'    |FT_PCT_RANK           |character |
#'    |OREB_RANK             |character |
#'    |DREB_RANK             |character |
#'    |REB_RANK              |character |
#'    |AST_RANK              |character |
#'    |TOV_RANK              |character |
#'    |STL_RANK              |character |
#'    |BLK_RANK              |character |
#'    |BLKA_RANK             |character |
#'    |PF_RANK               |character |
#'    |PFD_RANK              |character |
#'    |PTS_RANK              |character |
#'    |PLUS_MINUS_RANK       |character |
#'    |NBA_FANTASY_PTS_RANK  |character |
#'    |DD2_RANK              |character |
#'    |TD3_RANK              |character |
#'    |WNBA_FANTASY_PTS_RANK |character |
#'
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows as_tibble
#' @import rvest
#' @export
#' @family WNBA Player Functions
#' @details
#' ```r
#'  wnba_playerdashboardbyteamperformance(player_id = '1628932', season = most_recent_wnba_season() - 1)
#' ```
wnba_playerdashboardbyteamperformance <- function(
    date_from = '',
    date_to = '',
    game_segment = '',
    last_n_games = 0,
    league_id = '10',
    location = '',
    measure_type = 'Base',
    month = 0,
    opponent_team_id = 0,
    outcome = '',
    po_round = '',
    pace_adjust = 'N',
    per_mode = 'Totals',
    period = 0,
    player_id = '1628932',
    plus_minus = 'N',
    rank = 'N',
    season = most_recent_wnba_season() - 1,
    season_segment = '',
    season_type = 'Regular Season',
    shot_clock_range = '',
    vs_conference = '',
    vs_division = '',
    ...){
  
  # Intentional
  # season_type <- gsub(' ', '+', season_type)
  version <- "playerdashboardbyteamperformance"
  endpoint <- wnba_endpoint(version)
  full_url <- endpoint
  
  params <- list(
    DateFrom = date_from,
    DateTo = date_to,
    GameSegment = game_segment,
    LastNGames = last_n_games,
    LeagueID = league_id,
    Location = location,
    MeasureType = measure_type,
    Month = month,
    OpponentTeamID = opponent_team_id,
    Outcome = outcome,
    PaceAdjust = pace_adjust,
    PORound = po_round,
    PerMode = per_mode,
    Period = period,
    PlayerID = player_id,
    PlusMinus = plus_minus,
    Rank = rank,
    Season = season,
    SeasonSegment = season_segment,
    SeasonType = season_type,
    ShotClockRange = shot_clock_range,
    VsConference = vs_conference,
    VsDivision = vs_division
  )
  
  tryCatch(
    expr = {
      
      resp <- request_with_proxy(url = full_url, params = params, ...)
      
      df_list <- wnba_stats_map_result_sets(resp)
      
    },
    error = function(e) {
      cli::cli_alert_danger("{Sys.time()}: Invalid arguments or no player dashboard by team performance data available for {player_id}!")
      cli::cli_alert_danger("Error:\n{e}")
    },
    warning = function(w) {
      cli::cli_alert_warning("{Sys.time()}: Warning:\n{w}")
    },
    finally = {
    }
  )
  return(df_list)
}


#' **Get WNBA Stats API Player Dashboard Year over Year**
#' @name wnba_playerdashboardbyyearoveryear
NULL
#' @title
#' **Get WNBA Stats API Player Dashboard Year over Year**
#' @rdname wnba_playerdashboardbyyearoveryear
#' @author Saiem Gilani
#' @param date_from date_from
#' @param date_to date_to
#' @param game_segment game_segment
#' @param last_n_games last_n_games
#' @param league_id league_id
#' @param location location
#' @param measure_type measure_type
#' @param month month
#' @param opponent_team_id opponent_team_id
#' @param outcome outcome
#' @param po_round po_round
#' @param pace_adjust pace_adjust
#' @param per_mode per_mode
#' @param period period
#' @param player_id player_id
#' @param plus_minus plus_minus
#' @param rank rank
#' @param season season
#' @param season_segment season_segment
#' @param season_type season_type
#' @param shot_clock_range shot_clock_range
#' @param vs_conference vs_conference
#' @param vs_division vs_division
#' @param ... Additional arguments passed to an underlying function like httr.
#' @return Return a named list of data frames: ByYearPlayerDashboard, OverallPlayerDashboard
#'
#'    **OverallPlayerDashboard**
#'
#'
#'    |col_name              |types     |
#'    |:---------------------|:---------|
#'    |GROUP_SET             |character |
#'    |GROUP_VALUE           |character |
#'    |TEAM_ID               |character |
#'    |TEAM_ABBREVIATION     |character |
#'    |MAX_GAME_DATE         |character |
#'    |GP                    |character |
#'    |W                     |character |
#'    |L                     |character |
#'    |W_PCT                 |character |
#'    |MIN                   |character |
#'    |FGM                   |character |
#'    |FGA                   |character |
#'    |FG_PCT                |character |
#'    |FG3M                  |character |
#'    |FG3A                  |character |
#'    |FG3_PCT               |character |
#'    |FTM                   |character |
#'    |FTA                   |character |
#'    |FT_PCT                |character |
#'    |OREB                  |character |
#'    |DREB                  |character |
#'    |REB                   |character |
#'    |AST                   |character |
#'    |TOV                   |character |
#'    |STL                   |character |
#'    |BLK                   |character |
#'    |BLKA                  |character |
#'    |PF                    |character |
#'    |PFD                   |character |
#'    |PTS                   |character |
#'    |PLUS_MINUS            |character |
#'    |NBA_FANTASY_PTS       |character |
#'    |DD2                   |character |
#'    |TD3                   |character |
#'    |WNBA_FANTASY_PTS      |character |
#'    |GP_RANK               |character |
#'    |W_RANK                |character |
#'    |L_RANK                |character |
#'    |W_PCT_RANK            |character |
#'    |MIN_RANK              |character |
#'    |FGM_RANK              |character |
#'    |FGA_RANK              |character |
#'    |FG_PCT_RANK           |character |
#'    |FG3M_RANK             |character |
#'    |FG3A_RANK             |character |
#'    |FG3_PCT_RANK          |character |
#'    |FTM_RANK              |character |
#'    |FTA_RANK              |character |
#'    |FT_PCT_RANK           |character |
#'    |OREB_RANK             |character |
#'    |DREB_RANK             |character |
#'    |REB_RANK              |character |
#'    |AST_RANK              |character |
#'    |TOV_RANK              |character |
#'    |STL_RANK              |character |
#'    |BLK_RANK              |character |
#'    |BLKA_RANK             |character |
#'    |PF_RANK               |character |
#'    |PFD_RANK              |character |
#'    |PTS_RANK              |character |
#'    |PLUS_MINUS_RANK       |character |
#'    |NBA_FANTASY_PTS_RANK  |character |
#'    |DD2_RANK              |character |
#'    |TD3_RANK              |character |
#'    |WNBA_FANTASY_PTS_RANK |character |
#'
#'    **ByYearPlayerDashboard**
#'
#'
#'    |col_name              |types     |
#'    |:---------------------|:---------|
#'    |GROUP_SET             |character |
#'    |GROUP_VALUE           |character |
#'    |TEAM_ID               |character |
#'    |TEAM_ABBREVIATION     |character |
#'    |MAX_GAME_DATE         |character |
#'    |GP                    |character |
#'    |W                     |character |
#'    |L                     |character |
#'    |W_PCT                 |character |
#'    |MIN                   |character |
#'    |FGM                   |character |
#'    |FGA                   |character |
#'    |FG_PCT                |character |
#'    |FG3M                  |character |
#'    |FG3A                  |character |
#'    |FG3_PCT               |character |
#'    |FTM                   |character |
#'    |FTA                   |character |
#'    |FT_PCT                |character |
#'    |OREB                  |character |
#'    |DREB                  |character |
#'    |REB                   |character |
#'    |AST                   |character |
#'    |TOV                   |character |
#'    |STL                   |character |
#'    |BLK                   |character |
#'    |BLKA                  |character |
#'    |PF                    |character |
#'    |PFD                   |character |
#'    |PTS                   |character |
#'    |PLUS_MINUS            |character |
#'    |NBA_FANTASY_PTS       |character |
#'    |DD2                   |character |
#'    |TD3                   |character |
#'    |WNBA_FANTASY_PTS      |character |
#'    |GP_RANK               |character |
#'    |W_RANK                |character |
#'    |L_RANK                |character |
#'    |W_PCT_RANK            |character |
#'    |MIN_RANK              |character |
#'    |FGM_RANK              |character |
#'    |FGA_RANK              |character |
#'    |FG_PCT_RANK           |character |
#'    |FG3M_RANK             |character |
#'    |FG3A_RANK             |character |
#'    |FG3_PCT_RANK          |character |
#'    |FTM_RANK              |character |
#'    |FTA_RANK              |character |
#'    |FT_PCT_RANK           |character |
#'    |OREB_RANK             |character |
#'    |DREB_RANK             |character |
#'    |REB_RANK              |character |
#'    |AST_RANK              |character |
#'    |TOV_RANK              |character |
#'    |STL_RANK              |character |
#'    |BLK_RANK              |character |
#'    |BLKA_RANK             |character |
#'    |PF_RANK               |character |
#'    |PFD_RANK              |character |
#'    |PTS_RANK              |character |
#'    |PLUS_MINUS_RANK       |character |
#'    |NBA_FANTASY_PTS_RANK  |character |
#'    |DD2_RANK              |character |
#'    |TD3_RANK              |character |
#'    |WNBA_FANTASY_PTS_RANK |character |
#'
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows as_tibble
#' @import rvest
#' @export
#' @family WNBA Player Functions
#' @details
#' ```r
#'  wnba_playerdashboardbyyearoveryear(player_id = '1628932', season = most_recent_wnba_season() - 1)
#' ```
wnba_playerdashboardbyyearoveryear <- function(
    date_from = '',
    date_to = '',
    game_segment = '',
    last_n_games = 0,
    league_id = '10',
    location = '',
    measure_type = 'Base',
    month = 0,
    opponent_team_id = 0,
    outcome = '',
    po_round = '',
    pace_adjust = 'N',
    per_mode = 'Totals',
    period = 0,
    player_id = '1628932',
    plus_minus = 'N',
    rank = 'N',
    season = most_recent_wnba_season() - 1,
    season_segment = '',
    season_type = 'Regular Season',
    shot_clock_range = '',
    vs_conference = '',
    vs_division = '',
    ...){
  
  # Intentional
  # season_type <- gsub(' ', '+', season_type)
  version <- "playerdashboardbyyearoveryear"
  endpoint <- wnba_endpoint(version)
  full_url <- endpoint
  
  params <- list(
    DateFrom = date_from,
    DateTo = date_to,
    GameSegment = game_segment,
    LastNGames = last_n_games,
    LeagueID = league_id,
    Location = location,
    MeasureType = measure_type,
    Month = month,
    OpponentTeamID = opponent_team_id,
    Outcome = outcome,
    PaceAdjust = pace_adjust,
    PORound = po_round,
    PerMode = per_mode,
    Period = period,
    PlayerID = player_id,
    PlusMinus = plus_minus,
    Rank = rank,
    Season = season,
    SeasonSegment = season_segment,
    SeasonType = season_type,
    ShotClockRange = shot_clock_range,
    VsConference = vs_conference,
    VsDivision = vs_division
  )
  
  tryCatch(
    expr = {
      
      resp <- request_with_proxy(url = full_url, params = params, ...)
      
      df_list <- wnba_stats_map_result_sets(resp)
      
    },
    error = function(e) {
      cli::cli_alert_danger("{Sys.time()}: Invalid arguments or no player dashboard year-over-year data available for {player_id}!")
      cli::cli_alert_danger("Error:\n{e}")
    },
    warning = function(w) {
      cli::cli_alert_warning("{Sys.time()}: Warning:\n{w}")
    },
    finally = {
    }
  )
  return(df_list)
}
