## Team Dashboard parameters are the same

#' **Get WNBA Stats API Team Dashboard by Clutch Splits**
#' @name wnba_teamdashboardbyclutch
NULL
#' @title
#' **Get WNBA Stats API Team Dashboard by Clutch Splits**
#' @rdname wnba_teamdashboardbyclutch
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
#' @param plus_minus plus_minus
#' @param rank rank
#' @param season season
#' @param season_segment season_segment
#' @param season_type season_type
#' @param shot_clock_range shot_clock_range
#' @param team_id team_id
#' @param vs_conference vs_conference
#' @param vs_division vs_division
#' @param ... Additional arguments passed to an underlying function like httr.
#' @return Return a named list of data frames: Last10Sec3Point2TeamDashboard,
#' Last10Sec3PointTeamDashboard, Last1Min5PointTeamDashboard, Last1MinPlusMinus5PointTeamDashboard,
#' Last30Sec3Point2TeamDashboard, Last30Sec3PointTeamDashboard, Last3Min5PointTeamDashboard,
#' Last3MinPlusMinus5PointTeamDashboard, Last5Min5PointTeamDashboard,
#' Last5MinPlusMinus5PointTeamDashboard, OverallTeamDashboard
#'
#'    **OverallTeamDashboard**
#'
#'
#'    Columns as documented in the shared [wnba_team_dashboard_schema] table.
#'
#'    **Last5Min5PointTeamDashboard**
#'
#'
#'    Columns as documented in the shared [wnba_team_dashboard_schema] table.
#'
#'    **Last3Min5PointTeamDashboard**
#'
#'
#'    Columns as documented in the shared [wnba_team_dashboard_schema] table.
#'
#'    **Last1Min5PointTeamDashboard**
#'
#'
#'    Columns as documented in the shared [wnba_team_dashboard_schema] table.
#'
#'    **Last30Sec3PointTeamDashboard**
#'
#'
#'    Columns as documented in the shared [wnba_team_dashboard_schema] table.
#'
#'    **Last10Sec3PointTeamDashboard**
#'
#'
#'    Columns as documented in the shared [wnba_team_dashboard_schema] table.
#'
#'    **Last5MinPlusMinus5PointTeamDashboard**
#'
#'
#'    Columns as documented in the shared [wnba_team_dashboard_schema] table.
#'
#'    **Last3MinPlusMinus5PointTeamDashboard**
#'
#'
#'    Columns as documented in the shared [wnba_team_dashboard_schema] table.
#'
#'    **Last1MinPlusMinus5PointTeamDashboard**
#'
#'
#'    Columns as documented in the shared [wnba_team_dashboard_schema] table.
#'
#'    **Last30Sec3Point2TeamDashboard**
#'
#'
#'    Columns as documented in the shared [wnba_team_dashboard_schema] table.
#'
#'    **Last10Sec3Point2TeamDashboard**
#'
#'
#'    Columns as documented in the shared [wnba_team_dashboard_schema] table.
#'
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows as_tibble
#' @import rvest
#' @export
#' @family WNBA Team Functions
#' @family WNBA Clutch Functions
#' @details
#' ```r
#'   wnba_teamdashboardbyclutch(team_id = '1611661328', season = most_recent_wnba_season())
#' ```
wnba_teamdashboardbyclutch <- function(
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
    pace_adjust = 'N',
    plus_minus = 'N',
    po_round = '',
    per_mode = 'Totals',
    period = 0,
    rank = 'N',
    season = most_recent_wnba_season(),
    season_segment = '',
    season_type = 'Regular Season',
    shot_clock_range = '',
    team_id = '1611661328',
    vs_conference = '',
    vs_division = '',
    ...){
  .args <- mget(setdiff(names(formals()), "..."))
  
  # Intentional
  # season_type <- gsub(' ', '+', season_type)
  version <- "teamdashboardbyclutch"
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
    PlusMinus = plus_minus,
    Rank = rank,
    Season = season,
    SeasonSegment = season_segment,
    SeasonType = season_type,
    ShotClockRange = shot_clock_range,
    TeamID = team_id,
    VsConference = vs_conference,
    VsDivision = vs_division
  )
  
  df_list <- list()

  tryCatch(
    expr = {
      
      resp <- request_with_proxy(url = full_url, params = params, ...)
      
      df_list <- wnba_stats_map_result_sets(resp)
      
    },
    error = function(e) .report_api_error(
      e,
      hint = "Invalid arguments or no team dashboard by clutch data for {team_id} available!",
      args = .args
    ),
    warning = function(w) .report_api_warning(w, args = .args),
    finally = {
    }
  )
  return(df_list)
}


#' **Get WNBA Stats API Team Dashboard by Game Splits**
#' @name wnba_teamdashboardbygamesplits
NULL
#' @title
#' **Get WNBA Stats API Team Dashboard by Game Splits**
#' @rdname wnba_teamdashboardbygamesplits
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
#' @param plus_minus plus_minus
#' @param rank rank
#' @param season season
#' @param season_segment season_segment
#' @param season_type season_type
#' @param shot_clock_range shot_clock_range
#' @param team_id team_id
#' @param vs_conference vs_conference
#' @param vs_division vs_division
#' @param ... Additional arguments passed to an underlying function like httr.
#' @return Return a named list of data frames: ByActualMarginTeamDashboard,
#' ByHalfTeamDashboard, ByPeriodTeamDashboard, ByScoreMarginTeamDashboard,
#' OverallTeamDashboard
#'
#'    **OverallTeamDashboard**
#'
#'
#'    Columns as documented in the shared [wnba_team_dashboard_schema] table.
#'
#'    **ByHalfTeamDashboard**
#'
#'
#'    Columns as documented in the shared [wnba_team_dashboard_schema] table.
#'
#'    **ByPeriodTeamDashboard**
#'
#'
#'    Columns as documented in the shared [wnba_team_dashboard_schema] table.
#'
#'    **ByScoreMarginTeamDashboard**
#'
#'
#'    Columns as documented in the shared [wnba_team_dashboard_schema] table.
#'
#'    **ByActualMarginTeamDashboard**
#'
#'
#'    Columns as documented in the shared [wnba_team_dashboard_schema] table.
#'
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows as_tibble
#' @import rvest
#' @export
#' @family WNBA Team Functions
#' @details
#' ```r
#'   wnba_teamdashboardbygamesplits(team_id = '1611661328', season = most_recent_wnba_season())
#' ```
wnba_teamdashboardbygamesplits <- function(
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
    pace_adjust = 'N',
    plus_minus = 'N',
    po_round = '',
    per_mode = 'Totals',
    period = 0,
    rank = 'N',
    season = most_recent_wnba_season(),
    season_segment = '',
    season_type = 'Regular Season',
    shot_clock_range = '',
    team_id = '1611661328',
    vs_conference = '',
    vs_division = '',
    ...){
  .args <- mget(setdiff(names(formals()), "..."))
  
  # Intentional
  # season_type <- gsub(' ', '+', season_type)
  version <- "teamdashboardbygamesplits"
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
    PlusMinus = plus_minus,
    Rank = rank,
    Season = season,
    SeasonSegment = season_segment,
    SeasonType = season_type,
    ShotClockRange = shot_clock_range,
    TeamID = team_id,
    VsConference = vs_conference,
    VsDivision = vs_division
  )
  
  df_list <- list()

  tryCatch(
    expr = {
      
      resp <- request_with_proxy(url = full_url, params = params, ...)
      
      df_list <- wnba_stats_map_result_sets(resp)
      
    },
    error = function(e) .report_api_error(
      e,
      hint = "Invalid arguments or no team dashboard by game splits data for {team_id} available!",
      args = .args
    ),
    warning = function(w) .report_api_warning(w, args = .args),
    finally = {
    }
  )
  return(df_list)
}



#' **Get WNBA Stats API Team Dashboard by General Splits**
#' @name wnba_teamdashboardbygeneralsplits
NULL
#' @title
#' **Get WNBA Stats API Team Dashboard by General Splits**
#' @rdname wnba_teamdashboardbygeneralsplits
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
#' @param plus_minus plus_minus
#' @param rank rank
#' @param season season
#' @param season_segment season_segment
#' @param season_type season_type
#' @param shot_clock_range shot_clock_range
#' @param team_id team_id
#' @param vs_conference vs_conference
#' @param vs_division vs_division
#' @param ... Additional arguments passed to an underlying function like httr.
#' @return Return a named list of data frames: DaysRestTeamDashboard,
#' LocationTeamDashboard, MonthTeamDashboard, OverallTeamDashboard,
#' PrePostAllStarTeamDashboard, WinsLossesTeamDashboard
#'
#'    **OverallTeamDashboard**
#'
#'
#'    |col_name        |types     |description                                   |
#'    |:---------------|:---------|:---------------------------------------------|
#'    |GROUP_SET       |character |                                              |
#'    |GROUP_VALUE     |character |                                              |
#'    |SEASON_YEAR     |character |Season year string ('YYYY-YY' format).        |
#'    |GP              |character |Games played.                                 |
#'    |W               |character |Wins.                                         |
#'    |L               |character |Losses.                                       |
#'    |W_PCT           |character |Wins percentage (0-1 decimal).                |
#'    |MIN             |character |Minutes played.                               |
#'    |FGM             |character |Field goals made.                             |
#'    |FGA             |character |Field goal attempts.                          |
#'    |FG_PCT          |character |Field goal percentage (0-1).                  |
#'    |FG3M            |character |Three-point field goals made.                 |
#'    |FG3A            |character |Three-point field goal attempts.              |
#'    |FG3_PCT         |character |Three-point field goal percentage (0-1).      |
#'    |FTM             |character |Free throws made.                             |
#'    |FTA             |character |Free throw attempts.                          |
#'    |FT_PCT          |character |Free throw percentage (0-1).                  |
#'    |OREB            |character |Offensive rebounds.                           |
#'    |DREB            |character |Defensive rebounds.                           |
#'    |REB             |character |Total rebounds.                               |
#'    |AST             |character |Assists.                                      |
#'    |TOV             |character |Turnovers.                                    |
#'    |STL             |character |Steals.                                       |
#'    |BLK             |character |Blocks.                                       |
#'    |BLKA            |character |                                              |
#'    |PF              |character |Personal fouls.                               |
#'    |PFD             |character |                                              |
#'    |PTS             |character |Points scored.                                |
#'    |PLUS_MINUS      |character |Plus/minus point differential while on court. |
#'    |GP_RANK         |character |                                              |
#'    |W_RANK          |character |                                              |
#'    |L_RANK          |character |                                              |
#'    |W_PCT_RANK      |character |                                              |
#'    |MIN_RANK        |character |                                              |
#'    |FGM_RANK        |character |                                              |
#'    |FGA_RANK        |character |                                              |
#'    |FG_PCT_RANK     |character |                                              |
#'    |FG3M_RANK       |character |                                              |
#'    |FG3A_RANK       |character |                                              |
#'    |FG3_PCT_RANK    |character |                                              |
#'    |FTM_RANK        |character |                                              |
#'    |FTA_RANK        |character |                                              |
#'    |FT_PCT_RANK     |character |                                              |
#'    |OREB_RANK       |character |                                              |
#'    |DREB_RANK       |character |                                              |
#'    |REB_RANK        |character |                                              |
#'    |AST_RANK        |character |                                              |
#'    |TOV_RANK        |character |                                              |
#'    |STL_RANK        |character |                                              |
#'    |BLK_RANK        |character |                                              |
#'    |BLKA_RANK       |character |                                              |
#'    |PF_RANK         |character |                                              |
#'    |PFD_RANK        |character |                                              |
#'    |PTS_RANK        |character |                                              |
#'    |PLUS_MINUS_RANK |character |                                              |
#'
#'    **LocationTeamDashboard**
#'
#'
#'    |col_name           |types     |description                                   |
#'    |:------------------|:---------|:---------------------------------------------|
#'    |GROUP_SET          |character |                                              |
#'    |GROUP_VALUE        |character |                                              |
#'    |TEAM_GAME_LOCATION |character |                                              |
#'    |GP                 |character |Games played.                                 |
#'    |W                  |character |Wins.                                         |
#'    |L                  |character |Losses.                                       |
#'    |W_PCT              |character |Wins percentage (0-1 decimal).                |
#'    |MIN                |character |Minutes played.                               |
#'    |FGM                |character |Field goals made.                             |
#'    |FGA                |character |Field goal attempts.                          |
#'    |FG_PCT             |character |Field goal percentage (0-1).                  |
#'    |FG3M               |character |Three-point field goals made.                 |
#'    |FG3A               |character |Three-point field goal attempts.              |
#'    |FG3_PCT            |character |Three-point field goal percentage (0-1).      |
#'    |FTM                |character |Free throws made.                             |
#'    |FTA                |character |Free throw attempts.                          |
#'    |FT_PCT             |character |Free throw percentage (0-1).                  |
#'    |OREB               |character |Offensive rebounds.                           |
#'    |DREB               |character |Defensive rebounds.                           |
#'    |REB                |character |Total rebounds.                               |
#'    |AST                |character |Assists.                                      |
#'    |TOV                |character |Turnovers.                                    |
#'    |STL                |character |Steals.                                       |
#'    |BLK                |character |Blocks.                                       |
#'    |BLKA               |character |                                              |
#'    |PF                 |character |Personal fouls.                               |
#'    |PFD                |character |                                              |
#'    |PTS                |character |Points scored.                                |
#'    |PLUS_MINUS         |character |Plus/minus point differential while on court. |
#'    |GP_RANK            |character |                                              |
#'    |W_RANK             |character |                                              |
#'    |L_RANK             |character |                                              |
#'    |W_PCT_RANK         |character |                                              |
#'    |MIN_RANK           |character |                                              |
#'    |FGM_RANK           |character |                                              |
#'    |FGA_RANK           |character |                                              |
#'    |FG_PCT_RANK        |character |                                              |
#'    |FG3M_RANK          |character |                                              |
#'    |FG3A_RANK          |character |                                              |
#'    |FG3_PCT_RANK       |character |                                              |
#'    |FTM_RANK           |character |                                              |
#'    |FTA_RANK           |character |                                              |
#'    |FT_PCT_RANK        |character |                                              |
#'    |OREB_RANK          |character |                                              |
#'    |DREB_RANK          |character |                                              |
#'    |REB_RANK           |character |                                              |
#'    |AST_RANK           |character |                                              |
#'    |TOV_RANK           |character |                                              |
#'    |STL_RANK           |character |                                              |
#'    |BLK_RANK           |character |                                              |
#'    |BLKA_RANK          |character |                                              |
#'    |PF_RANK            |character |                                              |
#'    |PFD_RANK           |character |                                              |
#'    |PTS_RANK           |character |                                              |
#'    |PLUS_MINUS_RANK    |character |                                              |
#'
#'    **WinsLossesTeamDashboard**
#'
#'
#'    |col_name        |types     |description                                   |
#'    |:---------------|:---------|:---------------------------------------------|
#'    |GROUP_SET       |character |                                              |
#'    |GROUP_VALUE     |character |                                              |
#'    |GAME_RESULT     |character |                                              |
#'    |GP              |character |Games played.                                 |
#'    |W               |character |Wins.                                         |
#'    |L               |character |Losses.                                       |
#'    |W_PCT           |character |Wins percentage (0-1 decimal).                |
#'    |MIN             |character |Minutes played.                               |
#'    |FGM             |character |Field goals made.                             |
#'    |FGA             |character |Field goal attempts.                          |
#'    |FG_PCT          |character |Field goal percentage (0-1).                  |
#'    |FG3M            |character |Three-point field goals made.                 |
#'    |FG3A            |character |Three-point field goal attempts.              |
#'    |FG3_PCT         |character |Three-point field goal percentage (0-1).      |
#'    |FTM             |character |Free throws made.                             |
#'    |FTA             |character |Free throw attempts.                          |
#'    |FT_PCT          |character |Free throw percentage (0-1).                  |
#'    |OREB            |character |Offensive rebounds.                           |
#'    |DREB            |character |Defensive rebounds.                           |
#'    |REB             |character |Total rebounds.                               |
#'    |AST             |character |Assists.                                      |
#'    |TOV             |character |Turnovers.                                    |
#'    |STL             |character |Steals.                                       |
#'    |BLK             |character |Blocks.                                       |
#'    |BLKA            |character |                                              |
#'    |PF              |character |Personal fouls.                               |
#'    |PFD             |character |                                              |
#'    |PTS             |character |Points scored.                                |
#'    |PLUS_MINUS      |character |Plus/minus point differential while on court. |
#'    |GP_RANK         |character |                                              |
#'    |W_RANK          |character |                                              |
#'    |L_RANK          |character |                                              |
#'    |W_PCT_RANK      |character |                                              |
#'    |MIN_RANK        |character |                                              |
#'    |FGM_RANK        |character |                                              |
#'    |FGA_RANK        |character |                                              |
#'    |FG_PCT_RANK     |character |                                              |
#'    |FG3M_RANK       |character |                                              |
#'    |FG3A_RANK       |character |                                              |
#'    |FG3_PCT_RANK    |character |                                              |
#'    |FTM_RANK        |character |                                              |
#'    |FTA_RANK        |character |                                              |
#'    |FT_PCT_RANK     |character |                                              |
#'    |OREB_RANK       |character |                                              |
#'    |DREB_RANK       |character |                                              |
#'    |REB_RANK        |character |                                              |
#'    |AST_RANK        |character |                                              |
#'    |TOV_RANK        |character |                                              |
#'    |STL_RANK        |character |                                              |
#'    |BLK_RANK        |character |                                              |
#'    |BLKA_RANK       |character |                                              |
#'    |PF_RANK         |character |                                              |
#'    |PFD_RANK        |character |                                              |
#'    |PTS_RANK        |character |                                              |
#'    |PLUS_MINUS_RANK |character |                                              |
#'
#'    **MonthTeamDashboard**
#'
#'
#'    |col_name          |types     |description                                   |
#'    |:-----------------|:---------|:---------------------------------------------|
#'    |GROUP_SET         |character |                                              |
#'    |GROUP_VALUE       |character |                                              |
#'    |SEASON_MONTH_NAME |character |                                              |
#'    |GP                |character |Games played.                                 |
#'    |W                 |character |Wins.                                         |
#'    |L                 |character |Losses.                                       |
#'    |W_PCT             |character |Wins percentage (0-1 decimal).                |
#'    |MIN               |character |Minutes played.                               |
#'    |FGM               |character |Field goals made.                             |
#'    |FGA               |character |Field goal attempts.                          |
#'    |FG_PCT            |character |Field goal percentage (0-1).                  |
#'    |FG3M              |character |Three-point field goals made.                 |
#'    |FG3A              |character |Three-point field goal attempts.              |
#'    |FG3_PCT           |character |Three-point field goal percentage (0-1).      |
#'    |FTM               |character |Free throws made.                             |
#'    |FTA               |character |Free throw attempts.                          |
#'    |FT_PCT            |character |Free throw percentage (0-1).                  |
#'    |OREB              |character |Offensive rebounds.                           |
#'    |DREB              |character |Defensive rebounds.                           |
#'    |REB               |character |Total rebounds.                               |
#'    |AST               |character |Assists.                                      |
#'    |TOV               |character |Turnovers.                                    |
#'    |STL               |character |Steals.                                       |
#'    |BLK               |character |Blocks.                                       |
#'    |BLKA              |character |                                              |
#'    |PF                |character |Personal fouls.                               |
#'    |PFD               |character |                                              |
#'    |PTS               |character |Points scored.                                |
#'    |PLUS_MINUS        |character |Plus/minus point differential while on court. |
#'    |GP_RANK           |character |                                              |
#'    |W_RANK            |character |                                              |
#'    |L_RANK            |character |                                              |
#'    |W_PCT_RANK        |character |                                              |
#'    |MIN_RANK          |character |                                              |
#'    |FGM_RANK          |character |                                              |
#'    |FGA_RANK          |character |                                              |
#'    |FG_PCT_RANK       |character |                                              |
#'    |FG3M_RANK         |character |                                              |
#'    |FG3A_RANK         |character |                                              |
#'    |FG3_PCT_RANK      |character |                                              |
#'    |FTM_RANK          |character |                                              |
#'    |FTA_RANK          |character |                                              |
#'    |FT_PCT_RANK       |character |                                              |
#'    |OREB_RANK         |character |                                              |
#'    |DREB_RANK         |character |                                              |
#'    |REB_RANK          |character |                                              |
#'    |AST_RANK          |character |                                              |
#'    |TOV_RANK          |character |                                              |
#'    |STL_RANK          |character |                                              |
#'    |BLK_RANK          |character |                                              |
#'    |BLKA_RANK         |character |                                              |
#'    |PF_RANK           |character |                                              |
#'    |PFD_RANK          |character |                                              |
#'    |PTS_RANK          |character |                                              |
#'    |PLUS_MINUS_RANK   |character |                                              |
#'
#'    **PrePostAllStarTeamDashboard**
#'
#'
#'    |col_name        |types     |description                                               |
#'    |:---------------|:---------|:---------------------------------------------------------|
#'    |GROUP_SET       |character |                                                          |
#'    |GROUP_VALUE     |character |                                                          |
#'    |SEASON_SEGMENT  |character |Season segment filter ('Pre All-Star' / 'Post All-Star'). |
#'    |GP              |character |Games played.                                             |
#'    |W               |character |Wins.                                                     |
#'    |L               |character |Losses.                                                   |
#'    |W_PCT           |character |Wins percentage (0-1 decimal).                            |
#'    |MIN             |character |Minutes played.                                           |
#'    |FGM             |character |Field goals made.                                         |
#'    |FGA             |character |Field goal attempts.                                      |
#'    |FG_PCT          |character |Field goal percentage (0-1).                              |
#'    |FG3M            |character |Three-point field goals made.                             |
#'    |FG3A            |character |Three-point field goal attempts.                          |
#'    |FG3_PCT         |character |Three-point field goal percentage (0-1).                  |
#'    |FTM             |character |Free throws made.                                         |
#'    |FTA             |character |Free throw attempts.                                      |
#'    |FT_PCT          |character |Free throw percentage (0-1).                              |
#'    |OREB            |character |Offensive rebounds.                                       |
#'    |DREB            |character |Defensive rebounds.                                       |
#'    |REB             |character |Total rebounds.                                           |
#'    |AST             |character |Assists.                                                  |
#'    |TOV             |character |Turnovers.                                                |
#'    |STL             |character |Steals.                                                   |
#'    |BLK             |character |Blocks.                                                   |
#'    |BLKA            |character |                                                          |
#'    |PF              |character |Personal fouls.                                           |
#'    |PFD             |character |                                                          |
#'    |PTS             |character |Points scored.                                            |
#'    |PLUS_MINUS      |character |Plus/minus point differential while on court.             |
#'    |GP_RANK         |character |                                                          |
#'    |W_RANK          |character |                                                          |
#'    |L_RANK          |character |                                                          |
#'    |W_PCT_RANK      |character |                                                          |
#'    |MIN_RANK        |character |                                                          |
#'    |FGM_RANK        |character |                                                          |
#'    |FGA_RANK        |character |                                                          |
#'    |FG_PCT_RANK     |character |                                                          |
#'    |FG3M_RANK       |character |                                                          |
#'    |FG3A_RANK       |character |                                                          |
#'    |FG3_PCT_RANK    |character |                                                          |
#'    |FTM_RANK        |character |                                                          |
#'    |FTA_RANK        |character |                                                          |
#'    |FT_PCT_RANK     |character |                                                          |
#'    |OREB_RANK       |character |                                                          |
#'    |DREB_RANK       |character |                                                          |
#'    |REB_RANK        |character |                                                          |
#'    |AST_RANK        |character |                                                          |
#'    |TOV_RANK        |character |                                                          |
#'    |STL_RANK        |character |                                                          |
#'    |BLK_RANK        |character |                                                          |
#'    |BLKA_RANK       |character |                                                          |
#'    |PF_RANK         |character |                                                          |
#'    |PFD_RANK        |character |                                                          |
#'    |PTS_RANK        |character |                                                          |
#'    |PLUS_MINUS_RANK |character |                                                          |
#'
#'    **DaysRestTeamDashboard**
#'
#'
#'    |col_name             |types     |description                                   |
#'    |:--------------------|:---------|:---------------------------------------------|
#'    |GROUP_SET            |character |                                              |
#'    |GROUP_VALUE          |character |                                              |
#'    |TEAM_DAYS_REST_RANGE |character |                                              |
#'    |GP                   |character |Games played.                                 |
#'    |W                    |character |Wins.                                         |
#'    |L                    |character |Losses.                                       |
#'    |W_PCT                |character |Wins percentage (0-1 decimal).                |
#'    |MIN                  |character |Minutes played.                               |
#'    |FGM                  |character |Field goals made.                             |
#'    |FGA                  |character |Field goal attempts.                          |
#'    |FG_PCT               |character |Field goal percentage (0-1).                  |
#'    |FG3M                 |character |Three-point field goals made.                 |
#'    |FG3A                 |character |Three-point field goal attempts.              |
#'    |FG3_PCT              |character |Three-point field goal percentage (0-1).      |
#'    |FTM                  |character |Free throws made.                             |
#'    |FTA                  |character |Free throw attempts.                          |
#'    |FT_PCT               |character |Free throw percentage (0-1).                  |
#'    |OREB                 |character |Offensive rebounds.                           |
#'    |DREB                 |character |Defensive rebounds.                           |
#'    |REB                  |character |Total rebounds.                               |
#'    |AST                  |character |Assists.                                      |
#'    |TOV                  |character |Turnovers.                                    |
#'    |STL                  |character |Steals.                                       |
#'    |BLK                  |character |Blocks.                                       |
#'    |BLKA                 |character |                                              |
#'    |PF                   |character |Personal fouls.                               |
#'    |PFD                  |character |                                              |
#'    |PTS                  |character |Points scored.                                |
#'    |PLUS_MINUS           |character |Plus/minus point differential while on court. |
#'    |GP_RANK              |character |                                              |
#'    |W_RANK               |character |                                              |
#'    |L_RANK               |character |                                              |
#'    |W_PCT_RANK           |character |                                              |
#'    |MIN_RANK             |character |                                              |
#'    |FGM_RANK             |character |                                              |
#'    |FGA_RANK             |character |                                              |
#'    |FG_PCT_RANK          |character |                                              |
#'    |FG3M_RANK            |character |                                              |
#'    |FG3A_RANK            |character |                                              |
#'    |FG3_PCT_RANK         |character |                                              |
#'    |FTM_RANK             |character |                                              |
#'    |FTA_RANK             |character |                                              |
#'    |FT_PCT_RANK          |character |                                              |
#'    |OREB_RANK            |character |                                              |
#'    |DREB_RANK            |character |                                              |
#'    |REB_RANK             |character |                                              |
#'    |AST_RANK             |character |                                              |
#'    |TOV_RANK             |character |                                              |
#'    |STL_RANK             |character |                                              |
#'    |BLK_RANK             |character |                                              |
#'    |BLKA_RANK            |character |                                              |
#'    |PF_RANK              |character |                                              |
#'    |PFD_RANK             |character |                                              |
#'    |PTS_RANK             |character |                                              |
#'    |PLUS_MINUS_RANK      |character |                                              |
#'
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows as_tibble
#' @import rvest
#' @export
#' @family WNBA Team Functions
#' @details
#' ```r
#'   wnba_teamdashboardbygeneralsplits(team_id = '1611661328', season = most_recent_wnba_season())
#' ```
wnba_teamdashboardbygeneralsplits <- function(
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
    pace_adjust = 'N',
    plus_minus = 'N',
    po_round = '',
    per_mode = 'Totals',
    period = 0,
    rank = 'N',
    season = most_recent_wnba_season(),
    season_segment = '',
    season_type = 'Regular Season',
    shot_clock_range = '',
    team_id = '1611661328',
    vs_conference = '',
    vs_division = '',
    ...){
  .args <- mget(setdiff(names(formals()), "..."))
  
  # Intentional
  # season_type <- gsub(' ', '+', season_type)
  version <- "teamdashboardbygeneralsplits"
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
    PlusMinus = plus_minus,
    Rank = rank,
    Season = season,
    SeasonSegment = season_segment,
    SeasonType = season_type,
    ShotClockRange = shot_clock_range,
    TeamID = team_id,
    VsConference = vs_conference,
    VsDivision = vs_division
  )
  
  df_list <- list()

  tryCatch(
    expr = {
      
      resp <- request_with_proxy(url = full_url, params = params, ...)
      
      df_list <- wnba_stats_map_result_sets(resp)
      
    },
    error = function(e) .report_api_error(
      e,
      hint = "Invalid arguments or no team dashboard by general splits data for {team_id} available!",
      args = .args
    ),
    warning = function(w) .report_api_warning(w, args = .args),
    finally = {
    }
  )
  return(df_list)
}



#' **Get WNBA Stats API Team Dashboard by Last N Games**
#' @name wnba_teamdashboardbylastngames
NULL
#' @title
#' **Get WNBA Stats API Team Dashboard by Last N Games**
#' @rdname wnba_teamdashboardbylastngames
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
#' @param plus_minus plus_minus
#' @param rank rank
#' @param season season
#' @param season_segment season_segment
#' @param season_type season_type
#' @param shot_clock_range shot_clock_range
#' @param team_id team_id
#' @param vs_conference vs_conference
#' @param vs_division vs_division
#' @param ... Additional arguments passed to an underlying function like httr.
#' @return Return a named list of data frames: GameNumberTeamDashboard,
#' Last10TeamDashboard, Last15TeamDashboard, Last20TeamDashboard,
#' Last5TeamDashboard, OverallTeamDashboard
#'
#'    **OverallTeamDashboard**
#'
#'
#'    Columns as documented in the shared [wnba_team_dashboard_schema] table.
#'
#'    **Last5TeamDashboard**
#'
#'
#'    Columns as documented in the shared [wnba_team_dashboard_schema] table.
#'
#'    **Last10TeamDashboard**
#'
#'
#'    Columns as documented in the shared [wnba_team_dashboard_schema] table.
#'
#'    **Last15TeamDashboard**
#'
#'
#'    Columns as documented in the shared [wnba_team_dashboard_schema] table.
#'
#'    **Last20TeamDashboard**
#'
#'
#'    Columns as documented in the shared [wnba_team_dashboard_schema] table.
#'
#'    **GameNumberTeamDashboard**
#'
#'
#'    Columns as documented in the shared [wnba_team_dashboard_schema] table.
#'
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows as_tibble
#' @import rvest
#' @export
#' @family WNBA Team Functions
#' @details
#' ```r
#'   wnba_teamdashboardbylastngames(team_id = '1611661328', season = most_recent_wnba_season())
#' ```
wnba_teamdashboardbylastngames <- function(
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
    pace_adjust = 'N',
    plus_minus = 'N',
    po_round = '',
    per_mode = 'Totals',
    period = 0,
    rank = 'N',
    season = most_recent_wnba_season(),
    season_segment = '',
    season_type = 'Regular Season',
    shot_clock_range = '',
    team_id = '1611661328',
    vs_conference = '',
    vs_division = '',
    ...){
  .args <- mget(setdiff(names(formals()), "..."))
  
  # Intentional
  # season_type <- gsub(' ', '+', season_type)
  version <- "teamdashboardbylastngames"
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
    PlusMinus = plus_minus,
    Rank = rank,
    Season = season,
    SeasonSegment = season_segment,
    SeasonType = season_type,
    ShotClockRange = shot_clock_range,
    TeamID = team_id,
    VsConference = vs_conference,
    VsDivision = vs_division
  )
  
  df_list <- list()

  tryCatch(
    expr = {
      
      resp <- request_with_proxy(url = full_url, params = params, ...)
      
      df_list <- wnba_stats_map_result_sets(resp)
      
    },
    error = function(e) .report_api_error(
      e,
      hint = "Invalid arguments or no teamdashboard by last n games data for {team_id} available!",
      args = .args
    ),
    warning = function(w) .report_api_warning(w, args = .args),
    finally = {
    }
  )
  return(df_list)
}



#' **Get WNBA Stats API Team Dashboard by Opponent**
#' @name wnba_teamdashboardbyopponent
NULL
#' @title
#' **Get WNBA Stats API Team Dashboard by Opponent**
#' @rdname wnba_teamdashboardbyopponent
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
#' @param plus_minus plus_minus
#' @param rank rank
#' @param season season
#' @param season_segment season_segment
#' @param season_type season_type
#' @param shot_clock_range shot_clock_range
#' @param team_id team_id
#' @param vs_conference vs_conference
#' @param vs_division vs_division
#' @param ... Additional arguments passed to an underlying function like httr.
#' @return Return a named list of data frames: ConferenceTeamDashboard,
#' DivisionTeamDashboard, OpponentTeamDashboard, OverallTeamDashboard
#'
#'    **OverallTeamDashboard**
#'
#'
#'    Columns as documented in the shared [wnba_team_dashboard_schema] table.
#'
#'    **ConferenceTeamDashboard**
#'
#'
#'    Columns as documented in the shared [wnba_team_dashboard_schema] table.
#'
#'    **DivisionTeamDashboard**
#'
#'
#'    Columns as documented in the shared [wnba_team_dashboard_schema] table.
#'
#'    **OpponentTeamDashboard**
#'
#'
#'    Columns as documented in the shared [wnba_team_dashboard_schema] table.
#'
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows as_tibble
#' @import rvest
#' @export
#' @family WNBA Team Functions
#' @details
#' ```r
#'   wnba_teamdashboardbyopponent(team_id = '1611661328', season = most_recent_wnba_season())
#' ```
wnba_teamdashboardbyopponent <- function(
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
    pace_adjust = 'N',
    plus_minus = 'N',
    po_round = '',
    per_mode = 'Totals',
    period = 0,
    rank = 'N',
    season = most_recent_wnba_season(),
    season_segment = '',
    season_type = 'Regular Season',
    shot_clock_range = '',
    team_id = '1611661328',
    vs_conference = '',
    vs_division = '',
    ...){
  .args <- mget(setdiff(names(formals()), "..."))
  
  # Intentional
  # season_type <- gsub(' ', '+', season_type)
  version <- "teamdashboardbyopponent"
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
    PlusMinus = plus_minus,
    Rank = rank,
    Season = season,
    SeasonSegment = season_segment,
    SeasonType = season_type,
    ShotClockRange = shot_clock_range,
    TeamID = team_id,
    VsConference = vs_conference,
    VsDivision = vs_division
  )
  
  df_list <- list()

  tryCatch(
    expr = {
      
      resp <- request_with_proxy(url = full_url, params = params, ...)
      
      df_list <- wnba_stats_map_result_sets(resp)
      
    },
    error = function(e) .report_api_error(
      e,
      hint = "Invalid arguments or no team dashboard by opponent data for {team_id} available!",
      args = .args
    ),
    warning = function(w) .report_api_warning(w, args = .args),
    finally = {
    }
  )
  return(df_list)
}


#' **Get WNBA Stats API Team Dashboard by Shooting Splits**
#' @name wnba_teamdashboardbyshootingsplits
NULL
#' @title
#' **Get WNBA Stats API Team Dashboard by Shooting Splits**
#' @rdname wnba_teamdashboardbyshootingsplits
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
#' @param plus_minus plus_minus
#' @param rank rank
#' @param season season
#' @param season_segment season_segment
#' @param season_type season_type
#' @param shot_clock_range shot_clock_range
#' @param team_id team_id
#' @param vs_conference vs_conference
#' @param vs_division vs_division
#' @param ... Additional arguments passed to an underlying function like httr.
#' @return Return a named list of data frames: AssistedBy,
#' AssitedShotTeamDashboard, OverallTeamDashboard, Shot5FTTeamDashboard,
#' Shot8FTTeamDashboard, ShotAreaTeamDashboard, ShotTypeTeamDashboard
#'
#'    **OverallTeamDashboard**
#'
#'
#'    Columns as documented in the shared [wnba_shooting_splits_schema] table.
#'
#'    **Shot5FTTeamDashboard**
#'
#'
#'    Columns as documented in the shared [wnba_shooting_splits_schema] table.
#'
#'    **Shot8FTTeamDashboard**
#'
#'
#'    Columns as documented in the shared [wnba_shooting_splits_schema] table.
#'
#'    **ShotAreaTeamDashboard**
#'
#'
#'    Columns as documented in the shared [wnba_shooting_splits_schema] table.
#'
#'    **AssitedShotTeamDashboard**
#'
#'
#'    Columns as documented in the shared [wnba_shooting_splits_schema] table.
#'
#'    **ShotTypeTeamDashboard**
#'
#'
#'    Columns as documented in the shared [wnba_shooting_splits_schema] table.
#'
#'    **AssistedBy**
#'
#'
#'    Columns as documented in the shared [wnba_shooting_splits_assisted_by_schema] table.
#'
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows as_tibble
#' @import rvest
#' @export
#' @family WNBA Team Functions
#' @family WNBA Shooting Functions
#' @details
#' [Team Dashboard by Shooting Splits](https://www.nba.com/stats/team/1610612749/shooting)
#' ```r
#'   wnba_teamdashboardbyshootingsplits(team_id = '1611661328', season = most_recent_wnba_season())
#' ```
wnba_teamdashboardbyshootingsplits <- function(
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
    pace_adjust = 'N',
    plus_minus = 'N',
    po_round = '',
    per_mode = 'Totals',
    period = 0,
    rank = 'N',
    season = most_recent_wnba_season(),
    season_segment = '',
    season_type = 'Regular Season',
    shot_clock_range = '',
    team_id = '1611661328',
    vs_conference = '',
    vs_division = '',
    ...){
  .args <- mget(setdiff(names(formals()), "..."))
  
  # Intentional
  # season_type <- gsub(' ', '+', season_type)
  version <- "teamdashboardbyshootingsplits"
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
    PlusMinus = plus_minus,
    Rank = rank,
    Season = season,
    SeasonSegment = season_segment,
    SeasonType = season_type,
    ShotClockRange = shot_clock_range,
    TeamID = team_id,
    VsConference = vs_conference,
    VsDivision = vs_division
  )
  
  df_list <- list()

  tryCatch(
    expr = {
      
      resp <- request_with_proxy(url = full_url, params = params, ...)
      
      df_list <- wnba_stats_map_result_sets(resp)
      
    },
    error = function(e) .report_api_error(
      e,
      hint = "Invalid arguments or no team dashboard by shooting splits data for {team_id} available!",
      args = .args
    ),
    warning = function(w) .report_api_warning(w, args = .args),
    finally = {
    }
  )
  return(df_list)
}


#' **Get WNBA Stats API Team Dashboard by Team Performance**
#' @name wnba_teamdashboardbyteamperformance
NULL
#' @title
#' **Get WNBA Stats API Team Dashboard by Team Performance**
#' @rdname wnba_teamdashboardbyteamperformance
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
#' @param plus_minus plus_minus
#' @param rank rank
#' @param season season
#' @param season_segment season_segment
#' @param season_type season_type
#' @param shot_clock_range shot_clock_range
#' @param team_id team_id
#' @param vs_conference vs_conference
#' @param vs_division vs_division
#' @param ... Additional arguments passed to an underlying function like httr.
#' @return Return a named list of data frames: OverallTeamDashboard,
#' PointsScoredTeamDashboard, PontsAgainstTeamDashboard, ScoreDifferentialTeamDashboard
#'
#'    **OverallTeamDashboard**
#'
#'
#'    Columns as documented in the shared [wnba_team_dashboard_schema] table.
#'
#'    **ScoreDifferentialTeamDashboard**
#'
#'
#'    |col_name          |types     |description                                   |
#'    |:-----------------|:---------|:---------------------------------------------|
#'    |GROUP_SET         |character |                                              |
#'    |GROUP_VALUE_ORDER |character |                                              |
#'    |GROUP_VALUE       |character |                                              |
#'    |GROUP_VALUE_2     |character |                                              |
#'    |GP                |character |Games played.                                 |
#'    |W                 |character |Wins.                                         |
#'    |L                 |character |Losses.                                       |
#'    |W_PCT             |character |Wins percentage (0-1 decimal).                |
#'    |MIN               |character |Minutes played.                               |
#'    |FGM               |character |Field goals made.                             |
#'    |FGA               |character |Field goal attempts.                          |
#'    |FG_PCT            |character |Field goal percentage (0-1).                  |
#'    |FG3M              |character |Three-point field goals made.                 |
#'    |FG3A              |character |Three-point field goal attempts.              |
#'    |FG3_PCT           |character |Three-point field goal percentage (0-1).      |
#'    |FTM               |character |Free throws made.                             |
#'    |FTA               |character |Free throw attempts.                          |
#'    |FT_PCT            |character |Free throw percentage (0-1).                  |
#'    |OREB              |character |Offensive rebounds.                           |
#'    |DREB              |character |Defensive rebounds.                           |
#'    |REB               |character |Total rebounds.                               |
#'    |AST               |character |Assists.                                      |
#'    |TOV               |character |Turnovers.                                    |
#'    |STL               |character |Steals.                                       |
#'    |BLK               |character |Blocks.                                       |
#'    |BLKA              |character |                                              |
#'    |PF                |character |Personal fouls.                               |
#'    |PFD               |character |                                              |
#'    |PTS               |character |Points scored.                                |
#'    |PLUS_MINUS        |character |Plus/minus point differential while on court. |
#'    |GP_RANK           |character |                                              |
#'    |W_RANK            |character |                                              |
#'    |L_RANK            |character |                                              |
#'    |W_PCT_RANK        |character |                                              |
#'    |MIN_RANK          |character |                                              |
#'    |FGM_RANK          |character |                                              |
#'    |FGA_RANK          |character |                                              |
#'    |FG_PCT_RANK       |character |                                              |
#'    |FG3M_RANK         |character |                                              |
#'    |FG3A_RANK         |character |                                              |
#'    |FG3_PCT_RANK      |character |                                              |
#'    |FTM_RANK          |character |                                              |
#'    |FTA_RANK          |character |                                              |
#'    |FT_PCT_RANK       |character |                                              |
#'    |OREB_RANK         |character |                                              |
#'    |DREB_RANK         |character |                                              |
#'    |REB_RANK          |character |                                              |
#'    |AST_RANK          |character |                                              |
#'    |TOV_RANK          |character |                                              |
#'    |STL_RANK          |character |                                              |
#'    |BLK_RANK          |character |                                              |
#'    |BLKA_RANK         |character |                                              |
#'    |PF_RANK           |character |                                              |
#'    |PFD_RANK          |character |                                              |
#'    |PTS_RANK          |character |                                              |
#'    |PLUS_MINUS_RANK   |character |                                              |
#'
#'    **PointsScoredTeamDashboard**
#'
#'
#'    Same columns as the **ScoreDifferentialTeamDashboard** table above.
#'
#'    **PontsAgainstTeamDashboard**
#'
#'
#'    Same columns as the **ScoreDifferentialTeamDashboard** table above.
#'
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows as_tibble
#' @import rvest
#' @export
#' @family WNBA Team Functions
#' @details
#' ```r
#'   wnba_teamdashboardbyteamperformance(team_id = '1611661328', season = most_recent_wnba_season())
#' ```
wnba_teamdashboardbyteamperformance <- function(
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
    pace_adjust = 'N',
    plus_minus = 'N',
    po_round = '',
    per_mode = 'Totals',
    period = 0,
    rank = 'N',
    season = most_recent_wnba_season(),
    season_segment = '',
    season_type = 'Regular Season',
    shot_clock_range = '',
    team_id = '1611661328',
    vs_conference = '',
    vs_division = '',
    ...){
  .args <- mget(setdiff(names(formals()), "..."))
  
  # Intentional
  # season_type <- gsub(' ', '+', season_type)
  version <- "teamdashboardbyteamperformance"
  endpoint <- wnba_endpoint(version)
  full_url <- endpoint
  
  params <- list(
    DateFrom =  date_from,
    DateTo =  date_to,
    GameSegment =  game_segment,
    LastNGames =  last_n_games,
    LeagueID =  league_id,
    Location =  location,
    MeasureType =  measure_type,
    Month =  month,
    OpponentTeamID =  opponent_team_id,
    Outcome =  outcome,
    PaceAdjust =  pace_adjust,
    PORound =  po_round,
    PerMode =  per_mode,
    Period =  period,
    PlusMinus =  plus_minus,
    Rank =  rank,
    Season =  season,
    SeasonSegment =  season_segment,
    SeasonType =  season_type,
    ShotClockRange =  shot_clock_range,
    TeamID =  team_id,
    VsConference =  vs_conference,
    VsDivision =  vs_division
  )
  
  df_list <- list()

  tryCatch(
    expr = {
      
      resp <- request_with_proxy(url = full_url, params = params, ...)
      
      df_list <- wnba_stats_map_result_sets(resp)
      
    },
    error = function(e) .report_api_error(
      e,
      hint = "Invalid arguments or no team dashboard by team performance data for {team_id} available!",
      args = .args
    ),
    warning = function(w) .report_api_warning(w, args = .args),
    finally = {
    }
  )
  return(df_list)
}


#' **Get WNBA Stats API Team Dashboard Year over Year**
#' @name wnba_teamdashboardbyyearoveryear
NULL
#' @title
#' **Get WNBA Stats API Team Dashboard Year over Year**
#' @rdname wnba_teamdashboardbyyearoveryear
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
#' @param plus_minus plus_minus
#' @param rank rank
#' @param season season
#' @param season_segment season_segment
#' @param season_type season_type
#' @param shot_clock_range shot_clock_range
#' @param team_id team_id
#' @param vs_conference vs_conference
#' @param vs_division vs_division
#' @param ... Additional arguments passed to an underlying function like httr.
#' @return Return a named list of data frames: ByYearTeamDashboard, OverallTeamDashboard
#'
#'    **OverallTeamDashboard**
#'
#'
#'    Columns as documented in the shared [wnba_team_dashboard_schema] table.
#'
#'    **ByYearTeamDashboard**
#'
#'
#'    Columns as documented in the shared [wnba_team_dashboard_schema] table.
#'
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows as_tibble
#' @import rvest
#' @export
#' @family WNBA Team Functions
#' @details
#' ```r
#'   wnba_teamdashboardbyyearoveryear(team_id = '1611661328', season = most_recent_wnba_season())
#' ```
wnba_teamdashboardbyyearoveryear <- function(
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
    pace_adjust = 'N',
    plus_minus = 'N',
    po_round = '',
    per_mode = 'Totals',
    period = 0,
    rank = 'N',
    season = most_recent_wnba_season(),
    season_segment = '',
    season_type = 'Regular Season',
    shot_clock_range = '',
    team_id = '1611661328',
    vs_conference = '',
    vs_division = '',
    ...){
  .args <- mget(setdiff(names(formals()), "..."))
  
  # Intentional
  # season_type <- gsub(' ', '+', season_type)
  version <- "teamdashboardbyyearoveryear"
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
    PlusMinus = plus_minus,
    Rank = rank,
    Season = season,
    SeasonSegment = season_segment,
    SeasonType = season_type,
    ShotClockRange = shot_clock_range,
    TeamID = team_id,
    VsConference = vs_conference,
    VsDivision = vs_division
  )
  
  df_list <- list()

  tryCatch(
    expr = {
      
      resp <- request_with_proxy(url = full_url, params = params, ...)
      
      df_list <- wnba_stats_map_result_sets(resp)
      
    },
    error = function(e) .report_api_error(
      e,
      hint = "Invalid arguments or no team dashboard by year-over-year data for {team_id} available!",
      args = .args
    ),
    warning = function(w) .report_api_warning(w, args = .args),
    finally = {
    }
  )
  return(df_list)
}


#' **Get WNBA Stats API Team Dashboard - Lineups**
#' @name wnba_teamdashlineups
NULL
#' @title
#' **Get WNBA Stats API Team Dashboard - Lineups**
#' @rdname wnba_teamdashlineups
#' @author Saiem Gilani
#' @param date_from date_from
#' @param date_to date_to
#' @param game_id game_id
#' @param game_segment game_segment
#' @param group_quantity group_quantity
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
#' @param plus_minus plus_minus
#' @param rank rank
#' @param season season
#' @param season_segment season_segment
#' @param season_type season_type
#' @param shot_clock_range shot_clock_range
#' @param team_id team_id
#' @param vs_conference vs_conference
#' @param vs_division vs_division
#' @param ... Additional arguments passed to an underlying function like httr.
#' @return Return a named list of data frames: Lineups, Overall
#'
#'    **Overall**
#'
#'
#'    Columns as documented in the shared [wnba_team_summary_overall_schema] table.
#'
#'    **Lineups**
#'
#'
#'    |col_name        |types     |description                                   |
#'    |:---------------|:---------|:---------------------------------------------|
#'    |GROUP_SET       |character |                                              |
#'    |GROUP_ID        |character |Group identifier (e.g. conference group_id).  |
#'    |GROUP_NAME      |character |Group name.                                   |
#'    |GP              |character |Games played.                                 |
#'    |W               |character |Wins.                                         |
#'    |L               |character |Losses.                                       |
#'    |W_PCT           |character |Wins percentage (0-1 decimal).                |
#'    |MIN             |character |Minutes played.                               |
#'    |FGM             |character |Field goals made.                             |
#'    |FGA             |character |Field goal attempts.                          |
#'    |FG_PCT          |character |Field goal percentage (0-1).                  |
#'    |FG3M            |character |Three-point field goals made.                 |
#'    |FG3A            |character |Three-point field goal attempts.              |
#'    |FG3_PCT         |character |Three-point field goal percentage (0-1).      |
#'    |FTM             |character |Free throws made.                             |
#'    |FTA             |character |Free throw attempts.                          |
#'    |FT_PCT          |character |Free throw percentage (0-1).                  |
#'    |OREB            |character |Offensive rebounds.                           |
#'    |DREB            |character |Defensive rebounds.                           |
#'    |REB             |character |Total rebounds.                               |
#'    |AST             |character |Assists.                                      |
#'    |TOV             |character |Turnovers.                                    |
#'    |STL             |character |Steals.                                       |
#'    |BLK             |character |Blocks.                                       |
#'    |BLKA            |character |                                              |
#'    |PF              |character |Personal fouls.                               |
#'    |PFD             |character |                                              |
#'    |PTS             |character |Points scored.                                |
#'    |PLUS_MINUS      |character |Plus/minus point differential while on court. |
#'    |GP_RANK         |character |                                              |
#'    |W_RANK          |character |                                              |
#'    |L_RANK          |character |                                              |
#'    |W_PCT_RANK      |character |                                              |
#'    |MIN_RANK        |character |                                              |
#'    |FGM_RANK        |character |                                              |
#'    |FGA_RANK        |character |                                              |
#'    |FG_PCT_RANK     |character |                                              |
#'    |FG3M_RANK       |character |                                              |
#'    |FG3A_RANK       |character |                                              |
#'    |FG3_PCT_RANK    |character |                                              |
#'    |FTM_RANK        |character |                                              |
#'    |FTA_RANK        |character |                                              |
#'    |FT_PCT_RANK     |character |                                              |
#'    |OREB_RANK       |character |                                              |
#'    |DREB_RANK       |character |                                              |
#'    |REB_RANK        |character |                                              |
#'    |AST_RANK        |character |                                              |
#'    |TOV_RANK        |character |                                              |
#'    |STL_RANK        |character |                                              |
#'    |BLK_RANK        |character |                                              |
#'    |BLKA_RANK       |character |                                              |
#'    |PF_RANK         |character |                                              |
#'    |PFD_RANK        |character |                                              |
#'    |PTS_RANK        |character |                                              |
#'    |PLUS_MINUS_RANK |character |                                              |
#'
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows as_tibble
#' @import rvest
#' @export
#' @family WNBA Team Functions
#' @family WNBA Lineup Functions
#' @details
#' ```r
#'   wnba_teamdashlineups(team_id = '1611661328', season = most_recent_wnba_season())
#' ```
wnba_teamdashlineups <- function(
    date_from = '',
    date_to = '',
    game_id = '',
    game_segment = '',
    group_quantity = 5,
    last_n_games = 0,
    league_id = '10',
    location = '',
    measure_type = 'Base',
    month = 0,
    opponent_team_id = 0,
    outcome = '',
    pace_adjust = 'N',
    plus_minus = 'N',
    po_round = '',
    per_mode = 'Totals',
    period = 0,
    rank = 'N',
    season = most_recent_wnba_season(),
    season_segment = '',
    season_type = 'Regular Season',
    shot_clock_range = '',
    team_id = '1611661328',
    vs_conference = '',
    vs_division = '',
    ...){
  .args <- mget(setdiff(names(formals()), "..."))
  
  # Intentional
  # season_type <- gsub(' ', '+', season_type)
  version <- "teamdashlineups"
  endpoint <- wnba_endpoint(version)
  full_url <- endpoint
  
  params <- list(
    DateFrom = date_from,
    DateTo = date_to,
    GameID = game_id,
    GameSegment = game_segment,
    GroupQuantity = group_quantity,
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
    PlusMinus = plus_minus,
    Rank = rank,
    Season = season,
    SeasonSegment = season_segment,
    SeasonType = season_type,
    ShotClockRange = shot_clock_range,
    TeamID = team_id,
    VsConference = vs_conference,
    VsDivision = vs_division
  )
  
  df_list <- list()

  tryCatch(
    expr = {
      
      resp <- request_with_proxy(url = full_url, params = params, ...)
      
      df_list <- wnba_stats_map_result_sets(resp)
      
    },
    error = function(e) .report_api_error(
      e,
      hint = "Invalid arguments or no team dashboard by lineups data for {team_id} available!",
      args = .args
    ),
    warning = function(w) .report_api_warning(w, args = .args),
    finally = {
    }
  )
  return(df_list)
}
