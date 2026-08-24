#' **Get WNBA Stats API Boxscore Traditional V2**
#' @name wnba_boxscoretraditionalv2
NULL
#' @title
#' **Get WNBA Stats API Boxscore Traditional V2**
#' @rdname wnba_boxscoretraditionalv2
#' @author Saiem Gilani
#' @param game_id Game ID
#' @param start_period start_period
#' @param end_period end_period
#' @param start_range start_range
#' @param end_range end_range
#' @param range_type range_type
#' @param ... Additional arguments passed to an underlying function like httr.
#' @return A list of data frames: PlayerStats, TeamStarterBenchStats, TeamStats
#' 
#'    **PlayerStats** 
#'    
#'    
#'    |col_name          |types     |description                                                                  |
#'    |:-----------------|:---------|:----------------------------------------------------------------------------|
#'    |GAME_ID           |character |Unique game identifier.                                                      |
#'    |TEAM_ID           |character |Unique team identifier.                                                      |
#'    |TEAM_ABBREVIATION |character |Short team abbreviation (e.g. 'LAS').                                        |
#'    |TEAM_CITY         |character |Team city or region (e.g. 'Las Vegas').                                      |
#'    |PLAYER_ID         |character |Unique player identifier.                                                    |
#'    |PLAYER_NAME       |character |Player name.                                                                 |
#'    |NICKNAME          |character |Team or athlete nickname.                                                    |
#'    |START_POSITION    |character |                                                                             |
#'    |COMMENT           |character |Player status / inactive reason (e.g. 'DNP - Coach's Decision', 'Inactive'). |
#'    |MIN               |character |Minutes played.                                                              |
#'    |FGM               |character |Field goals made.                                                            |
#'    |FGA               |character |Field goal attempts.                                                         |
#'    |FG_PCT            |character |Field goal percentage (0-1).                                                 |
#'    |FG3M              |character |Three-point field goals made.                                                |
#'    |FG3A              |character |Three-point field goal attempts.                                             |
#'    |FG3_PCT           |character |Three-point field goal percentage (0-1).                                     |
#'    |FTM               |character |Free throws made.                                                            |
#'    |FTA               |character |Free throw attempts.                                                         |
#'    |FT_PCT            |character |Free throw percentage (0-1).                                                 |
#'    |OREB              |character |Offensive rebounds.                                                          |
#'    |DREB              |character |Defensive rebounds.                                                          |
#'    |REB               |character |Total rebounds.                                                              |
#'    |AST               |character |Assists.                                                                     |
#'    |STL               |character |Steals.                                                                      |
#'    |BLK               |character |Blocks.                                                                      |
#'    |TO                |character |                                                                             |
#'    |PF                |character |Personal fouls.                                                              |
#'    |PTS               |character |Points scored.                                                               |
#'    |PLUS_MINUS        |character |Plus/minus point differential while on court.                                |
#'    
#'    **TeamStats** 
#'    
#'    
#'    |col_name          |types     |description                                     |
#'    |:-----------------|:---------|:-----------------------------------------------|
#'    |GAME_ID           |character |Unique game identifier.                         |
#'    |TEAM_ID           |character |Unique team identifier.                         |
#'    |TEAM_NAME         |character |Full team display name (e.g. 'Las Vegas Aces'). |
#'    |TEAM_ABBREVIATION |character |Short team abbreviation (e.g. 'LAS').           |
#'    |TEAM_CITY         |character |Team city or region (e.g. 'Las Vegas').         |
#'    |MIN               |character |Minutes played.                                 |
#'    |FGM               |character |Field goals made.                               |
#'    |FGA               |character |Field goal attempts.                            |
#'    |FG_PCT            |character |Field goal percentage (0-1).                    |
#'    |FG3M              |character |Three-point field goals made.                   |
#'    |FG3A              |character |Three-point field goal attempts.                |
#'    |FG3_PCT           |character |Three-point field goal percentage (0-1).        |
#'    |FTM               |character |Free throws made.                               |
#'    |FTA               |character |Free throw attempts.                            |
#'    |FT_PCT            |character |Free throw percentage (0-1).                    |
#'    |OREB              |character |Offensive rebounds.                             |
#'    |DREB              |character |Defensive rebounds.                             |
#'    |REB               |character |Total rebounds.                                 |
#'    |AST               |character |Assists.                                        |
#'    |STL               |character |Steals.                                         |
#'    |BLK               |character |Blocks.                                         |
#'    |TO                |character |                                                |
#'    |PF                |character |Personal fouls.                                 |
#'    |PTS               |character |Points scored.                                  |
#'    |PLUS_MINUS        |character |Plus/minus point differential while on court.   |
#'    
#'    **TeamStarterBenchStats** 
#'    
#'    
#'    |col_name          |types     |description                                     |
#'    |:-----------------|:---------|:-----------------------------------------------|
#'    |GAME_ID           |character |Unique game identifier.                         |
#'    |TEAM_ID           |character |Unique team identifier.                         |
#'    |TEAM_NAME         |character |Full team display name (e.g. 'Las Vegas Aces'). |
#'    |TEAM_ABBREVIATION |character |Short team abbreviation (e.g. 'LAS').           |
#'    |TEAM_CITY         |character |Team city or region (e.g. 'Las Vegas').         |
#'    |STARTERS_BENCH    |character |                                                |
#'    |MIN               |character |Minutes played.                                 |
#'    |FGM               |character |Field goals made.                               |
#'    |FGA               |character |Field goal attempts.                            |
#'    |FG_PCT            |character |Field goal percentage (0-1).                    |
#'    |FG3M              |character |Three-point field goals made.                   |
#'    |FG3A              |character |Three-point field goal attempts.                |
#'    |FG3_PCT           |character |Three-point field goal percentage (0-1).        |
#'    |FTM               |character |Free throws made.                               |
#'    |FTA               |character |Free throw attempts.                            |
#'    |FT_PCT            |character |Free throw percentage (0-1).                    |
#'    |OREB              |character |Offensive rebounds.                             |
#'    |DREB              |character |Defensive rebounds.                             |
#'    |REB               |character |Total rebounds.                                 |
#'    |AST               |character |Assists.                                        |
#'    |STL               |character |Steals.                                         |
#'    |BLK               |character |Blocks.                                         |
#'    |TO                |character |                                                |
#'    |PF                |character |Personal fouls.                                 |
#'    |PTS               |character |Points scored.                                  |
#' 
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows as_tibble
#' @import rvest
#' @export
#' @family WNBA Boxscore Functions
#' @details 
#' ```r
#'   wnba_boxscoretraditionalv2(game_id = "1022200034")
#' ```
wnba_boxscoretraditionalv2 <- function(
    game_id,
    start_period = 0,
    end_period = 14,
    start_range = 0,
    end_range = 0,
    range_type = 0,
    ...){
  .args <- mget(setdiff(names(formals()), "..."))
  
  version <- "boxscoretraditionalv2"
  endpoint <- wnba_endpoint(version)
  full_url <- endpoint
  
  params <- list(
    EndPeriod = end_period,
    EndRange = end_range,
    GameID = pad_id(game_id),
    RangeType = range_type,
    StartPeriod = start_period,
    StartRange = start_range
  )
  
  df_list <- list()

  tryCatch(
    expr = {
      
      resp <- request_with_proxy(url = full_url, params = params, ...)
      
      df_list <- wnba_stats_map_result_sets(resp)
      
    },
    error = function(e) .report_api_error(
      e,
      hint = "Invalid arguments or no traditional boxscore v2 data for {game_id} available!",
      args = .args
    ),
    warning = function(w) .report_api_warning(w, args = .args),
    finally = {
    }
  )
  return(df_list)
}

#' **Get WNBA Stats API Boxscore Advanced V2**
#' @name wnba_boxscoreadvancedv2
NULL
#' @title
#' **Get WNBA Stats API Boxscore Advanced V2**
#' @rdname wnba_boxscoreadvancedv2
#' @author Saiem Gilani
#' @param game_id Game ID
#' @param start_period start_period
#' @param end_period end_period
#' @param start_range start_range
#' @param end_range end_range
#' @param range_type range_type
#' @param ... Additional arguments passed to an underlying function like httr.
#' @return Returns a named list of data frames: PlayerStats, TeamStats
#' 
#'    **PlayerStats** 
#'    
#'    
#'    |col_name          |types     |description                                                                  |
#'    |:-----------------|:---------|:----------------------------------------------------------------------------|
#'    |GAME_ID           |character |Unique game identifier.                                                      |
#'    |TEAM_ID           |character |Unique team identifier.                                                      |
#'    |TEAM_ABBREVIATION |character |Short team abbreviation (e.g. 'LAS').                                        |
#'    |TEAM_CITY         |character |Team city or region (e.g. 'Las Vegas').                                      |
#'    |PLAYER_ID         |character |Unique player identifier.                                                    |
#'    |PLAYER_NAME       |character |Player name.                                                                 |
#'    |NICKNAME          |character |Team or athlete nickname.                                                    |
#'    |START_POSITION    |character |                                                                             |
#'    |COMMENT           |character |Player status / inactive reason (e.g. 'DNP - Coach's Decision', 'Inactive'). |
#'    |MIN               |character |Minutes played.                                                              |
#'    |E_OFF_RATING      |character |                                                                             |
#'    |OFF_RATING        |character |Offensive rating (points produced per 100 possessions).                      |
#'    |E_DEF_RATING      |character |                                                                             |
#'    |DEF_RATING        |character |Defensive rating (points allowed per 100 possessions).                       |
#'    |E_NET_RATING      |character |                                                                             |
#'    |NET_RATING        |character |Net rating (off rating - def rating).                                        |
#'    |AST_PCT           |character |Assist percentage (0-1).                                                     |
#'    |AST_TOV           |character |                                                                             |
#'    |AST_RATIO         |character |Assist ratio (assists per 100 possessions used).                             |
#'    |OREB_PCT          |character |Offensive rebound percentage (0-1).                                          |
#'    |DREB_PCT          |character |Defensive rebound percentage (0-1).                                          |
#'    |REB_PCT           |character |Total rebound percentage (0-1).                                              |
#'    |TM_TOV_PCT        |character |                                                                             |
#'    |EFG_PCT           |character |Effective field goal percentage (0-1).                                       |
#'    |TS_PCT            |character |True shooting percentage (0-1).                                              |
#'    |USG_PCT           |character |Usage percentage (0-1).                                                      |
#'    |E_USG_PCT         |character |                                                                             |
#'    |E_PACE            |character |                                                                             |
#'    |PACE              |character |Possessions per 48 minutes.                                                  |
#'    |PACE_PER40        |character |Pace per40.                                                                  |
#'    |POSS              |character |                                                                             |
#'    |PIE               |character |Player Impact Estimate (0-1).                                                |
#'    
#'    **TeamStats** 
#'    
#'    
#'    |col_name          |types     |description                                             |
#'    |:-----------------|:---------|:-------------------------------------------------------|
#'    |GAME_ID           |character |Unique game identifier.                                 |
#'    |TEAM_ID           |character |Unique team identifier.                                 |
#'    |TEAM_NAME         |character |Full team display name (e.g. 'Las Vegas Aces').         |
#'    |TEAM_ABBREVIATION |character |Short team abbreviation (e.g. 'LAS').                   |
#'    |TEAM_CITY         |character |Team city or region (e.g. 'Las Vegas').                 |
#'    |MIN               |character |Minutes played.                                         |
#'    |E_OFF_RATING      |character |                                                        |
#'    |OFF_RATING        |character |Offensive rating (points produced per 100 possessions). |
#'    |E_DEF_RATING      |character |                                                        |
#'    |DEF_RATING        |character |Defensive rating (points allowed per 100 possessions).  |
#'    |E_NET_RATING      |character |                                                        |
#'    |NET_RATING        |character |Net rating (off rating - def rating).                   |
#'    |AST_PCT           |character |Assist percentage (0-1).                                |
#'    |AST_TOV           |character |                                                        |
#'    |AST_RATIO         |character |Assist ratio (assists per 100 possessions used).        |
#'    |OREB_PCT          |character |Offensive rebound percentage (0-1).                     |
#'    |DREB_PCT          |character |Defensive rebound percentage (0-1).                     |
#'    |REB_PCT           |character |Total rebound percentage (0-1).                         |
#'    |E_TM_TOV_PCT      |character |                                                        |
#'    |TM_TOV_PCT        |character |                                                        |
#'    |EFG_PCT           |character |Effective field goal percentage (0-1).                  |
#'    |TS_PCT            |character |True shooting percentage (0-1).                         |
#'    |USG_PCT           |character |Usage percentage (0-1).                                 |
#'    |E_USG_PCT         |character |                                                        |
#'    |E_PACE            |character |                                                        |
#'    |PACE              |character |Possessions per 48 minutes.                             |
#'    |PACE_PER40        |character |Pace per40.                                             |
#'    |POSS              |character |                                                        |
#'    |PIE               |character |Player Impact Estimate (0-1).                           |
#' 
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows as_tibble
#' @import rvest
#' @export
#' @family WNBA Boxscore Functions
#' @details 
#' ```r
#'   wnba_boxscoreadvancedv2(game_id = "1022200034")
#' ```
wnba_boxscoreadvancedv2 <- function(
    game_id,
    start_period = 0,
    end_period = 14,
    start_range = 0,
    end_range = 0,
    range_type = 0,
    ...){
  .args <- mget(setdiff(names(formals()), "..."))
  
  version <- "boxscoreadvancedv2"
  endpoint <- wnba_endpoint(version)
  full_url <- endpoint
  
  params <- list(
    EndPeriod = end_period,
    EndRange = end_range,
    GameID = pad_id(game_id),
    RangeType = range_type,
    StartPeriod = start_period,
    StartRange = start_range
  )
  
  df_list <- list()

  tryCatch(
    expr = {
      
      resp <- request_with_proxy(url = full_url, params = params, ...)
      
      df_list <- wnba_stats_map_result_sets(resp)
      
    },
    error = function(e) .report_api_error(
      e,
      hint = "Invalid arguments or no advanced boxscore v2 data for {game_id} available!",
      args = .args
    ),
    warning = function(w) .report_api_warning(w, args = .args),
    finally = {
    }
  )
  return(df_list)
}


#' **Get WNBA Stats API Boxscore Four Factors V2**
#' @name wnba_boxscorefourfactorsv2
NULL
#' @title
#' **Get WNBA Stats API Boxscore Four Factors V2**
#' @rdname wnba_boxscorefourfactorsv2
#' @author Saiem Gilani
#' @param game_id Game ID
#' @param start_period start_period
#' @param end_period end_period
#' @param start_range start_range
#' @param end_range end_range
#' @param range_type range_type
#' @param ... Additional arguments passed to an underlying function like httr.
#' @return Returns a named list of data frames: sqlPlayersFourFactors, sqlTeamFourFactors
#' 
#'    **sqlPlayersFourFactors** 
#'    
#'    
#'    |col_name          |types     |description                                                                  |
#'    |:-----------------|:---------|:----------------------------------------------------------------------------|
#'    |GAME_ID           |character |Unique game identifier.                                                      |
#'    |TEAM_ID           |character |Unique team identifier.                                                      |
#'    |TEAM_ABBREVIATION |character |Short team abbreviation (e.g. 'LAS').                                        |
#'    |TEAM_CITY         |character |Team city or region (e.g. 'Las Vegas').                                      |
#'    |PLAYER_ID         |character |Unique player identifier.                                                    |
#'    |PLAYER_NAME       |character |Player name.                                                                 |
#'    |NICKNAME          |character |Team or athlete nickname.                                                    |
#'    |START_POSITION    |character |                                                                             |
#'    |COMMENT           |character |Player status / inactive reason (e.g. 'DNP - Coach's Decision', 'Inactive'). |
#'    |MIN               |character |Minutes played.                                                              |
#'    |EFG_PCT           |character |Effective field goal percentage (0-1).                                       |
#'    |FTA_RATE          |character |Free throw attempt rate (FTA / FGA).                                         |
#'    |TM_TOV_PCT        |character |                                                                             |
#'    |OREB_PCT          |character |Offensive rebound percentage (0-1).                                          |
#'    |OPP_EFG_PCT       |character |                                                                             |
#'    |OPP_FTA_RATE      |character |                                                                             |
#'    |OPP_TOV_PCT       |character |                                                                             |
#'    |OPP_OREB_PCT      |character |                                                                             |
#'    
#'    **sqlTeamsFourFactors** 
#'    
#'    
#'    |col_name          |types     |description                                     |
#'    |:-----------------|:---------|:-----------------------------------------------|
#'    |GAME_ID           |character |Unique game identifier.                         |
#'    |TEAM_ID           |character |Unique team identifier.                         |
#'    |TEAM_NAME         |character |Full team display name (e.g. 'Las Vegas Aces'). |
#'    |TEAM_ABBREVIATION |character |Short team abbreviation (e.g. 'LAS').           |
#'    |TEAM_CITY         |character |Team city or region (e.g. 'Las Vegas').         |
#'    |MIN               |character |Minutes played.                                 |
#'    |EFG_PCT           |character |Effective field goal percentage (0-1).          |
#'    |FTA_RATE          |character |Free throw attempt rate (FTA / FGA).            |
#'    |TM_TOV_PCT        |character |                                                |
#'    |OREB_PCT          |character |Offensive rebound percentage (0-1).             |
#'    |OPP_EFG_PCT       |character |                                                |
#'    |OPP_FTA_RATE      |character |                                                |
#'    |OPP_TOV_PCT       |character |                                                |
#'    |OPP_OREB_PCT      |character |                                                |
#' 
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows as_tibble
#' @import rvest
#' @export
#' @family WNBA Boxscore Functions
#' @details 
#' ```r
#'   wnba_boxscorefourfactorsv2(game_id = "1022200034")
#' ```
wnba_boxscorefourfactorsv2 <- function(
    game_id,
    start_period = 0,
    end_period = 14,
    start_range = 0,
    end_range = 0,
    range_type = 0,
    ...){
  .args <- mget(setdiff(names(formals()), "..."))
  
  version <- "boxscorefourfactorsv2"
  endpoint <- wnba_endpoint(version)
  full_url <- endpoint
  
  params <- list(
    EndPeriod = end_period,
    EndRange = end_range,
    GameID = pad_id(game_id),
    RangeType = range_type,
    StartPeriod = start_period,
    StartRange = start_range
  )
  
  df_list <- list()

  tryCatch(
    expr = {
      
      resp <- request_with_proxy(url = full_url, params = params, ...)
      
      df_list <- wnba_stats_map_result_sets(resp)
      
    },
    error = function(e) .report_api_error(
      e,
      hint = "Invalid arguments or no four factors boxscore v2 data for {game_id} available!",
      args = .args
    ),
    warning = function(w) .report_api_warning(w, args = .args),
    finally = {
    }
  )
  return(df_list)
}

#' **Get WNBA Stats API Boxscore Misc V2**
#' @name wnba_boxscoremiscv2
NULL
#' @title
#' **Get WNBA Stats API Boxscore Misc V2**
#' @rdname wnba_boxscoremiscv2
#' @author Saiem Gilani
#' @param game_id Game ID
#' @param start_period start_period
#' @param end_period end_period
#' @param start_range start_range
#' @param end_range end_range
#' @param range_type range_type
#' @param ... Additional arguments passed to an underlying function like httr.
#' @return Returns a named list of data frames: sqlPlayersMisc, sqlTeamsMisc
#' 
#'    **sqlPlayersMisc** 
#'    
#'    
#'    |col_name           |types     |description                                                                  |
#'    |:------------------|:---------|:----------------------------------------------------------------------------|
#'    |GAME_ID            |character |Unique game identifier.                                                      |
#'    |TEAM_ID            |character |Unique team identifier.                                                      |
#'    |TEAM_ABBREVIATION  |character |Short team abbreviation (e.g. 'LAS').                                        |
#'    |TEAM_CITY          |character |Team city or region (e.g. 'Las Vegas').                                      |
#'    |PLAYER_ID          |character |Unique player identifier.                                                    |
#'    |PLAYER_NAME        |character |Player name.                                                                 |
#'    |NICKNAME           |character |Team or athlete nickname.                                                    |
#'    |START_POSITION     |character |                                                                             |
#'    |COMMENT            |character |Player status / inactive reason (e.g. 'DNP - Coach's Decision', 'Inactive'). |
#'    |MIN                |character |Minutes played.                                                              |
#'    |PTS_OFF_TOV        |character |Points scored off opponent turnovers.                                        |
#'    |PTS_2ND_CHANCE     |character |                                                                             |
#'    |PTS_FB             |character |                                                                             |
#'    |PTS_PAINT          |character |Points scored in the paint.                                                  |
#'    |OPP_PTS_OFF_TOV    |character |                                                                             |
#'    |OPP_PTS_2ND_CHANCE |character |                                                                             |
#'    |OPP_PTS_FB         |character |                                                                             |
#'    |OPP_PTS_PAINT      |character |                                                                             |
#'    |BLK                |character |Blocks.                                                                      |
#'    |BLKA               |character |                                                                             |
#'    |PF                 |character |Personal fouls.                                                              |
#'    |PFD                |character |                                                                             |
#'    
#'    **sqlTeamsMisc** 
#'    
#'    
#'    |col_name           |types     |description                                     |
#'    |:------------------|:---------|:-----------------------------------------------|
#'    |GAME_ID            |character |Unique game identifier.                         |
#'    |TEAM_ID            |character |Unique team identifier.                         |
#'    |TEAM_NAME          |character |Full team display name (e.g. 'Las Vegas Aces'). |
#'    |TEAM_ABBREVIATION  |character |Short team abbreviation (e.g. 'LAS').           |
#'    |TEAM_CITY          |character |Team city or region (e.g. 'Las Vegas').         |
#'    |MIN                |character |Minutes played.                                 |
#'    |PTS_OFF_TOV        |character |Points scored off opponent turnovers.           |
#'    |PTS_2ND_CHANCE     |character |                                                |
#'    |PTS_FB             |character |                                                |
#'    |PTS_PAINT          |character |Points scored in the paint.                     |
#'    |OPP_PTS_OFF_TOV    |character |                                                |
#'    |OPP_PTS_2ND_CHANCE |character |                                                |
#'    |OPP_PTS_FB         |character |                                                |
#'    |OPP_PTS_PAINT      |character |                                                |
#'    |BLK                |character |Blocks.                                         |
#'    |BLKA               |character |                                                |
#'    |PF                 |character |Personal fouls.                                 |
#'    |PFD                |character |                                                |
#' 
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows as_tibble
#' @import rvest
#' @export
#' @family WNBA Boxscore Functions
#' @details 
#' ```r
#'   wnba_boxscoremiscv2(game_id = "1022200034")
#' ```
wnba_boxscoremiscv2 <- function(
    game_id,
    start_period = 0,
    end_period = 14,
    start_range = 0,
    end_range = 0,
    range_type = 0,
    ...){
  .args <- mget(setdiff(names(formals()), "..."))
  
  version <- "boxscoremiscv2"
  endpoint <- wnba_endpoint(version)
  full_url <- endpoint
  
  params <- list(
    EndPeriod = end_period,
    EndRange = end_range,
    GameID = pad_id(game_id),
    RangeType = range_type,
    StartPeriod = start_period,
    StartRange = start_range
  )
  
  df_list <- list()

  tryCatch(
    expr = {
      
      resp <- request_with_proxy(url = full_url, params = params, ...)
      
      df_list <- wnba_stats_map_result_sets(resp)
      
    },
    error = function(e) .report_api_error(
      e,
      hint = "Invalid arguments or no miscellaneous boxscore v2 data for {game_id} available!",
      args = .args
    ),
    warning = function(w) .report_api_warning(w, args = .args),
    finally = {
    }
  )
  return(df_list)
}

#' **Get WNBA Stats API Boxscore Scoring V2**
#' @name wnba_boxscorescoringv2
NULL
#' @title
#' **Get WNBA Stats API Boxscore Scoring V2**
#' @rdname wnba_boxscorescoringv2
#' @author Saiem Gilani
#' @param game_id Game ID
#' @param start_period start_period
#' @param end_period end_period
#' @param start_range start_range
#' @param end_range end_range
#' @param range_type range_type
#' @param ... Additional arguments passed to an underlying function like httr.
#' @return Returns a named list of data frames: sqlPlayersScoring, sqlTeamsScoring
#' 
#'    **sqlPlayersScoring** 
#'    
#'    
#'    |col_name          |types     |description                                                                  |
#'    |:-----------------|:---------|:----------------------------------------------------------------------------|
#'    |GAME_ID           |character |Unique game identifier.                                                      |
#'    |TEAM_ID           |character |Unique team identifier.                                                      |
#'    |TEAM_ABBREVIATION |character |Short team abbreviation (e.g. 'LAS').                                        |
#'    |TEAM_CITY         |character |Team city or region (e.g. 'Las Vegas').                                      |
#'    |PLAYER_ID         |character |Unique player identifier.                                                    |
#'    |PLAYER_NAME       |character |Player name.                                                                 |
#'    |NICKNAME          |character |Team or athlete nickname.                                                    |
#'    |START_POSITION    |character |                                                                             |
#'    |COMMENT           |character |Player status / inactive reason (e.g. 'DNP - Coach's Decision', 'Inactive'). |
#'    |MIN               |character |Minutes played.                                                              |
#'    |PCT_FGA_2PT       |character |                                                                             |
#'    |PCT_FGA_3PT       |character |                                                                             |
#'    |PCT_PTS_2PT       |character |                                                                             |
#'    |PCT_PTS_2PT_MR    |character |                                                                             |
#'    |PCT_PTS_3PT       |character |                                                                             |
#'    |PCT_PTS_FB        |character |                                                                             |
#'    |PCT_PTS_FT        |character |                                                                             |
#'    |PCT_PTS_OFF_TOV   |character |                                                                             |
#'    |PCT_PTS_PAINT     |character |                                                                             |
#'    |PCT_AST_2PM       |character |                                                                             |
#'    |PCT_UAST_2PM      |character |                                                                             |
#'    |PCT_AST_3PM       |character |                                                                             |
#'    |PCT_UAST_3PM      |character |                                                                             |
#'    |PCT_AST_FGM       |character |                                                                             |
#'    |PCT_UAST_FGM      |character |                                                                             |
#'    
#'    **sqlTeamsScoring** 
#'    
#'    
#'    |col_name          |types     |description                                     |
#'    |:-----------------|:---------|:-----------------------------------------------|
#'    |GAME_ID           |character |Unique game identifier.                         |
#'    |TEAM_ID           |character |Unique team identifier.                         |
#'    |TEAM_NAME         |character |Full team display name (e.g. 'Las Vegas Aces'). |
#'    |TEAM_ABBREVIATION |character |Short team abbreviation (e.g. 'LAS').           |
#'    |TEAM_CITY         |character |Team city or region (e.g. 'Las Vegas').         |
#'    |MIN               |character |Minutes played.                                 |
#'    |PCT_FGA_2PT       |character |                                                |
#'    |PCT_FGA_3PT       |character |                                                |
#'    |PCT_PTS_2PT       |character |                                                |
#'    |PCT_PTS_2PT_MR    |character |                                                |
#'    |PCT_PTS_3PT       |character |                                                |
#'    |PCT_PTS_FB        |character |                                                |
#'    |PCT_PTS_FT        |character |                                                |
#'    |PCT_PTS_OFF_TOV   |character |                                                |
#'    |PCT_PTS_PAINT     |character |                                                |
#'    |PCT_AST_2PM       |character |                                                |
#'    |PCT_UAST_2PM      |character |                                                |
#'    |PCT_AST_3PM       |character |                                                |
#'    |PCT_UAST_3PM      |character |                                                |
#'    |PCT_AST_FGM       |character |                                                |
#'    |PCT_UAST_FGM      |character |                                                |
#' 
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows as_tibble
#' @import rvest
#' @export
#' @family WNBA Boxscore Functions
#' @details 
#' ```r
#'   wnba_boxscorescoringv2(game_id = "1022200034")
#' ```
wnba_boxscorescoringv2 <- function(
    game_id,
    start_period = 0,
    end_period = 14,
    start_range = 0,
    end_range = 0,
    range_type = 0,
    ...){
  .args <- mget(setdiff(names(formals()), "..."))
  
  version <- "boxscorescoringv2"
  endpoint <- wnba_endpoint(version)
  full_url <- endpoint
  
  params <- list(
    EndPeriod = end_period,
    EndRange = end_range,
    GameID = pad_id(game_id),
    RangeType = range_type,
    StartPeriod = start_period,
    StartRange = start_range
  )
  
  df_list <- list()

  tryCatch(
    expr = {
      
      resp <- request_with_proxy(url = full_url, params = params, ...)
      
      df_list <- wnba_stats_map_result_sets(resp)
      
    },
    error = function(e) .report_api_error(
      e,
      hint = "Invalid arguments or no scoring boxscore v2 data for {game_id} available!",
      args = .args
    ),
    warning = function(w) .report_api_warning(w, args = .args),
    finally = {
    }
  )
  return(df_list)
}

#' **Get WNBA Stats API Boxscore Usage V2**
#' @name wnba_boxscoreusagev2
NULL
#' @title
#' **Get WNBA Stats API Boxscore Usage V2**
#' @rdname wnba_boxscoreusagev2
#' @author Saiem Gilani
#' @param game_id Game ID
#' @param start_period start_period
#' @param end_period end_period
#' @param start_range start_range
#' @param end_range end_range
#' @param range_type range_type
#' @param ... Additional arguments passed to an underlying function like httr.
#' @return Returns a named list of data frames: sqlPlayersUsage, sqlTeamsUsage
#' 
#'    **sqlPlayersUsage** 
#'    
#'    
#'    |col_name          |types     |description                                                                  |
#'    |:-----------------|:---------|:----------------------------------------------------------------------------|
#'    |GAME_ID           |character |Unique game identifier.                                                      |
#'    |TEAM_ID           |character |Unique team identifier.                                                      |
#'    |TEAM_ABBREVIATION |character |Short team abbreviation (e.g. 'LAS').                                        |
#'    |TEAM_CITY         |character |Team city or region (e.g. 'Las Vegas').                                      |
#'    |PLAYER_ID         |character |Unique player identifier.                                                    |
#'    |PLAYER_NAME       |character |Player name.                                                                 |
#'    |NICKNAME          |character |Team or athlete nickname.                                                    |
#'    |START_POSITION    |character |                                                                             |
#'    |COMMENT           |character |Player status / inactive reason (e.g. 'DNP - Coach's Decision', 'Inactive'). |
#'    |MIN               |character |Minutes played.                                                              |
#'    |USG_PCT           |character |Usage percentage (0-1).                                                      |
#'    |PCT_FGM           |character |                                                                             |
#'    |PCT_FGA           |character |                                                                             |
#'    |PCT_FG3M          |character |                                                                             |
#'    |PCT_FG3A          |character |                                                                             |
#'    |PCT_FTM           |character |                                                                             |
#'    |PCT_FTA           |character |                                                                             |
#'    |PCT_OREB          |character |                                                                             |
#'    |PCT_DREB          |character |                                                                             |
#'    |PCT_REB           |character |                                                                             |
#'    |PCT_AST           |character |                                                                             |
#'    |PCT_TOV           |character |                                                                             |
#'    |PCT_STL           |character |                                                                             |
#'    |PCT_BLK           |character |                                                                             |
#'    |PCT_BLKA          |character |                                                                             |
#'    |PCT_PF            |character |                                                                             |
#'    |PCT_PFD           |character |                                                                             |
#'    |PCT_PTS           |character |                                                                             |
#'    
#'    **sqlTeamsUsage** 
#'    
#'    
#'    |col_name          |types     |description                                     |
#'    |:-----------------|:---------|:-----------------------------------------------|
#'    |GAME_ID           |character |Unique game identifier.                         |
#'    |TEAM_ID           |character |Unique team identifier.                         |
#'    |TEAM_NAME         |character |Full team display name (e.g. 'Las Vegas Aces'). |
#'    |TEAM_ABBREVIATION |character |Short team abbreviation (e.g. 'LAS').           |
#'    |TEAM_CITY         |character |Team city or region (e.g. 'Las Vegas').         |
#'    |MIN               |character |Minutes played.                                 |
#'    |USG_PCT           |character |Usage percentage (0-1).                         |
#'    |PCT_FGM           |character |                                                |
#'    |PCT_FGA           |character |                                                |
#'    |PCT_FG3M          |character |                                                |
#'    |PCT_FG3A          |character |                                                |
#'    |PCT_FTM           |character |                                                |
#'    |PCT_FTA           |character |                                                |
#'    |PCT_OREB          |character |                                                |
#'    |PCT_DREB          |character |                                                |
#'    |PCT_REB           |character |                                                |
#'    |PCT_AST           |character |                                                |
#'    |PCT_TOV           |character |                                                |
#'    |PCT_STL           |character |                                                |
#'    |PCT_BLK           |character |                                                |
#'    |PCT_BLKA          |character |                                                |
#'    |PCT_PF            |character |                                                |
#'    |PCT_PFD           |character |                                                |
#'    |PCT_PTS           |character |                                                |
#' 
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows as_tibble
#' @import rvest
#' @export
#' @family WNBA Boxscore Functions
#' @details 
#' ```r
#'   wnba_boxscoreusagev2(game_id = "1022200034")
#' ```
wnba_boxscoreusagev2 <- function(
    game_id,
    start_period = 0,
    end_period = 14,
    start_range = 0,
    end_range = 0,
    range_type = 0,
    ...){
  .args <- mget(setdiff(names(formals()), "..."))
  
  version <- "boxscoreusagev2"
  endpoint <- wnba_endpoint(version)
  full_url <- endpoint
  
  params <- list(
    EndPeriod = end_period,
    EndRange = end_range,
    GameID = pad_id(game_id),
    RangeType = range_type,
    StartPeriod = start_period,
    StartRange = start_range
  )
  
  df_list <- list()

  tryCatch(
    expr = {
      
      resp <- request_with_proxy(url = full_url, params = params, ...)
      
      df_list <- wnba_stats_map_result_sets(resp)
      
    },
    error = function(e) .report_api_error(
      e,
      hint = "Invalid arguments or no usage boxscore v2 data for {game_id} available!",
      args = .args
    ),
    warning = function(w) .report_api_warning(w, args = .args),
    finally = {
    }
  )
  return(df_list)
}


#' **Get WNBA Stats API Boxscore Summary V2**
#' @name wnba_boxscoresummaryv2
NULL
#' @title
#' **Get WNBA Stats API Boxscore Summary V2**
#' @rdname wnba_boxscoresummaryv2
#' @author Saiem Gilani
#' @param game_id Game ID
#' @param ... Additional arguments passed to an underlying function like httr.
#' @return Returns a named list of data frames: AvailableVideo, GameInfo, GameSummary, 
#'  InactivePlayers, LastMeeting, LineScore, Officials, OtherStats, SeasonSeries
#' 
#'    **GameSummary** 
#'    
#'    
#'    Columns as documented in the shared [wnba_boxscoresummaryv2_game_summary_schema] table.
#'    
#'    **OtherStats** 
#'    
#'    
#'    |col_name          |types     |description                                                           |
#'    |:-----------------|:---------|:---------------------------------------------------------------------|
#'    |LEAGUE_ID         |character |League identifier ('10' = WNBA).                                      |
#'    |TEAM_ID           |character |Unique team identifier.                                               |
#'    |TEAM_ABBREVIATION |character |Short team abbreviation (e.g. 'LAS').                                 |
#'    |TEAM_CITY         |character |Team city or region (e.g. 'Las Vegas').                               |
#'    |PTS_PAINT         |character |Points scored in the paint.                                           |
#'    |PTS_2ND_CHANCE    |character |                                                                      |
#'    |PTS_FB            |character |                                                                      |
#'    |LARGEST_LEAD      |character |Largest lead during the game.                                         |
#'    |LEAD_CHANGES      |character |Lead changes.                                                         |
#'    |TIMES_TIED        |character |Times tied.                                                           |
#'    |TEAM_TURNOVERS    |character |Team turnovers (turnovers credited to the team rather than a player). |
#'    |TOTAL_TURNOVERS   |character |Total turnovers (player + team).                                      |
#'    |TEAM_REBOUNDS     |character |Team rebounds (rebounds credited to the team rather than a player).   |
#'    |PTS_OFF_TO        |character |                                                                      |
#'    
#'    **Officials** 
#'    
#'    
#'    |col_name    |types     |description                           |
#'    |:-----------|:---------|:-------------------------------------|
#'    |OFFICIAL_ID |character |Unique official / referee identifier. |
#'    |FIRST_NAME  |character |Player's first name.                  |
#'    |LAST_NAME   |character |Player's last name.                   |
#'    |JERSEY_NUM  |character |Jersey number worn by the player.     |
#'    
#'    **InactivePlayers** 
#'    
#'    
#'    |col_name          |types     |description                                     |
#'    |:-----------------|:---------|:-----------------------------------------------|
#'    |PLAYER_ID         |character |Unique player identifier.                       |
#'    |FIRST_NAME        |character |Player's first name.                            |
#'    |LAST_NAME         |character |Player's last name.                             |
#'    |JERSEY_NUM        |character |Jersey number worn by the player.               |
#'    |TEAM_ID           |character |Unique team identifier.                         |
#'    |TEAM_CITY         |character |Team city or region (e.g. 'Las Vegas').         |
#'    |TEAM_NAME         |character |Full team display name (e.g. 'Las Vegas Aces'). |
#'    |TEAM_ABBREVIATION |character |Short team abbreviation (e.g. 'LAS').           |
#'    
#'    **GameInfo** 
#'    
#'    
#'    |col_name   |types     |description             |
#'    |:----------|:---------|:-----------------------|
#'    |GAME_DATE  |character |Game date (YYYY-MM-DD). |
#'    |ATTENDANCE |character |Reported attendance.    |
#'    |GAME_TIME  |character |Game start time.        |
#'    
#'    **LineScore** 
#'    
#'    
#'    |col_name          |types     |description                           |
#'    |:-----------------|:---------|:-------------------------------------|
#'    |GAME_DATE_EST     |character |Game date est.                        |
#'    |GAME_SEQUENCE     |character |Game sequence.                        |
#'    |GAME_ID           |character |Unique game identifier.               |
#'    |TEAM_ID           |character |Unique team identifier.               |
#'    |TEAM_ABBREVIATION |character |Short team abbreviation (e.g. 'LAS'). |
#'    |TEAM_CITY_NAME    |character |Team city name.                       |
#'    |TEAM_NICKNAME     |character |Team nickname.                        |
#'    |TEAM_WINS_LOSSES  |character |Team wins losses.                     |
#'    |PTS_QTR1          |character |Pts qtr1.                             |
#'    |PTS_QTR2          |character |Pts qtr2.                             |
#'    |PTS_QTR3          |character |Pts qtr3.                             |
#'    |PTS_QTR4          |character |Pts qtr4.                             |
#'    |PTS_OT1           |character |Pts ot1.                              |
#'    |PTS_OT2           |character |                                      |
#'    |PTS_OT3           |character |                                      |
#'    |PTS_OT4           |character |                                      |
#'    |PTS_OT5           |character |                                      |
#'    |PTS_OT6           |character |                                      |
#'    |PTS_OT7           |character |                                      |
#'    |PTS_OT8           |character |                                      |
#'    |PTS_OT9           |character |                                      |
#'    |PTS_OT10          |character |                                      |
#'    |PTS               |character |Points scored.                        |
#'    
#'    **LastMeeting** 
#'    
#'    
#'    Columns as documented in the shared [wnba_boxscoresummaryv2_last_meeting_schema] table.
#'    
#'    **SeasonSeries** 
#'    
#'    
#'    Columns as documented in the shared [wnba_boxscoresummaryv2_season_series_schema] table.
#'    
#'    **AvailableVideo** 
#'    
#'    
#'    |col_name             |types     |description             |
#'    |:--------------------|:---------|:-----------------------|
#'    |GAME_ID              |character |Unique game identifier. |
#'    |VIDEO_AVAILABLE_FLAG |character |Video available flag.   |
#'    |PT_AVAILABLE         |character |                        |
#'    |PT_XYZ_AVAILABLE     |character |                        |
#'    |WH_STATUS            |character |Wh status.              |
#'    |HUSTLE_STATUS        |character |                        |
#'    |HISTORICAL_STATUS    |character |                        |
#' 
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows as_tibble
#' @import rvest
#' @export
#' @family WNBA Boxscore Functions
#' @details 
#' ```r
#'   wnba_boxscoresummaryv2(game_id = "1022200034")
#' ```
wnba_boxscoresummaryv2 <- function(
    game_id,
    ...){
  .args <- mget(setdiff(names(formals()), "..."))
  
  version <- "boxscoresummaryv2"
  endpoint <- wnba_endpoint(version)
  full_url <- endpoint
  
  params <- list(
    GameID = pad_id(game_id)
  )
  
  df_list <- list()

  tryCatch(
    expr = {
      
      resp <- request_with_proxy(url = full_url, params = params, ...)
      
      df_list <- wnba_stats_map_result_sets(resp)
      
    },
    error = function(e) .report_api_error(
      e,
      hint = "Invalid arguments or no summary boxscore v2 data for {game_id} available!",
      args = .args
    ),
    warning = function(w) .report_api_warning(w, args = .args),
    finally = {
    }
  )
  return(df_list)
}


#' **Get WNBA Stats API Boxscore Player Tracking V2**
#' @name wnba_boxscoreplayertrackv2
NULL
#' @title
#' **Get WNBA Stats API Boxscore Player Tracking V2**
#' @rdname wnba_boxscoreplayertrackv2
#' @author Saiem Gilani
#' @param game_id Game ID
#' @param ... Additional arguments passed to an underlying function like httr.
#' @return Returns a named list of data frames: PlayerStats, TeamStats
#' 
#'    **PlayerStats** 
#'    
#'    
#'    |col_name          |types     |description                                                                  |
#'    |:-----------------|:---------|:----------------------------------------------------------------------------|
#'    |GAME_ID           |character |Unique game identifier.                                                      |
#'    |TEAM_ID           |character |Unique team identifier.                                                      |
#'    |TEAM_ABBREVIATION |character |Short team abbreviation (e.g. 'LAS').                                        |
#'    |TEAM_CITY         |character |Team city or region (e.g. 'Las Vegas').                                      |
#'    |PLAYER_ID         |character |Unique player identifier.                                                    |
#'    |PLAYER_NAME       |character |Player name.                                                                 |
#'    |START_POSITION    |character |                                                                             |
#'    |COMMENT           |character |Player status / inactive reason (e.g. 'DNP - Coach's Decision', 'Inactive'). |
#'    |MIN               |character |Minutes played.                                                              |
#'    |SPD               |character |                                                                             |
#'    |DIST              |character |                                                                             |
#'    |ORBC              |character |                                                                             |
#'    |DRBC              |character |                                                                             |
#'    |RBC               |character |                                                                             |
#'    |TCHS              |character |                                                                             |
#'    |SAST              |character |                                                                             |
#'    |FTAST             |character |                                                                             |
#'    |PASS              |character |                                                                             |
#'    |AST               |character |Assists.                                                                     |
#'    |CFGM              |character |                                                                             |
#'    |CFGA              |character |                                                                             |
#'    |CFG_PCT           |character |                                                                             |
#'    |UFGM              |character |                                                                             |
#'    |UFGA              |character |                                                                             |
#'    |UFG_PCT           |character |                                                                             |
#'    |FG_PCT            |character |Field goal percentage (0-1).                                                 |
#'    |DFGM              |character |                                                                             |
#'    |DFGA              |character |                                                                             |
#'    |DFG_PCT           |character |                                                                             |
#'    
#'    **TeamStats** 
#'    
#'    
#'    |col_name          |types     |description                                     |
#'    |:-----------------|:---------|:-----------------------------------------------|
#'    |GAME_ID           |character |Unique game identifier.                         |
#'    |TEAM_ID           |character |Unique team identifier.                         |
#'    |TEAM_NAME         |character |Full team display name (e.g. 'Las Vegas Aces'). |
#'    |TEAM_ABBREVIATION |character |Short team abbreviation (e.g. 'LAS').           |
#'    |TEAM_CITY         |character |Team city or region (e.g. 'Las Vegas').         |
#'    |MIN               |character |Minutes played.                                 |
#'    |DIST              |character |                                                |
#'    |ORBC              |character |                                                |
#'    |DRBC              |character |                                                |
#'    |RBC               |character |                                                |
#'    |TCHS              |character |                                                |
#'    |SAST              |character |                                                |
#'    |FTAST             |character |                                                |
#'    |PASS              |character |                                                |
#'    |AST               |character |Assists.                                        |
#'    |CFGM              |character |                                                |
#'    |CFGA              |character |                                                |
#'    |CFG_PCT           |character |                                                |
#'    |UFGM              |character |                                                |
#'    |UFGA              |character |                                                |
#'    |UFG_PCT           |character |                                                |
#'    |FG_PCT            |character |Field goal percentage (0-1).                    |
#'    |DFGM              |character |                                                |
#'    |DFGA              |character |                                                |
#'    |DFG_PCT           |character |                                                |
#' 
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows as_tibble
#' @import rvest
#' @export
#' @family WNBA Boxscore Functions
#' @family WNBA Player Tracking Functions
#' @details 
#' ```r
#'   wnba_boxscoreplayertrackv2(game_id = "1022200034")
#' ```
wnba_boxscoreplayertrackv2 <- function(
  game_id,
  ...){
  .args <- mget(setdiff(names(formals()), "..."))

  lifecycle::deprecate_stop(
    when = "3.0.0",
    what = "wnba_boxscoreplayertrackv2()",
    with = "wnba_boxscoreplayertrackv3()"
  )

  version <- "boxscoreplayertrackv2"
  endpoint <- wnba_endpoint(version)
  full_url <- endpoint
  
  params <- list(
    GameID = pad_id(game_id)
  )
  
  df_list <- list()

  tryCatch(
    expr = {
      
      resp <- request_with_proxy(url = full_url, params = params, ...)
      
      df_list <- wnba_stats_map_result_sets(resp)
      
    },
    error = function(e) .report_api_error(
      e,
      hint = "Invalid arguments or no  player tracking boxscore v2 data for {game_id} available!",
      args = .args
    ),
    warning = function(w) .report_api_warning(w, args = .args),
    finally = {
    }
  )
  return(df_list)
}



#' **Get WNBA Stats API Hustle Stats Boxscore**
#' @name wnba_hustlestatsboxscore
NULL
#' @title
#' **Get WNBA Stats API Hustle Stats Boxscore**
#' @rdname wnba_hustlestatsboxscore
#' @author Saiem Gilani
#' @param game_id Game ID
#' @param ... Additional arguments passed to an underlying function like httr.
#' @return Returns a named list of data frames: HustleStatsAvailable, PlayerStats, TeamStats
#' 
#'    **HustleStatsAvailable** 
#'    
#'    
#'    |col_name      |types     |description             |
#'    |:-------------|:---------|:-----------------------|
#'    |GAME_ID       |character |Unique game identifier. |
#'    |HUSTLE_STATUS |character |                        |
#'    
#'    **PlayerStats** 
#'    
#'    
#'    |col_name                  |types     |description                                                                      |
#'    |:-------------------------|:---------|:--------------------------------------------------------------------------------|
#'    |GAME_ID                   |character |Unique game identifier.                                                          |
#'    |TEAM_ID                   |character |Unique team identifier.                                                          |
#'    |TEAM_ABBREVIATION         |character |Short team abbreviation (e.g. 'LAS').                                            |
#'    |TEAM_CITY                 |character |Team city or region (e.g. 'Las Vegas').                                          |
#'    |PLAYER_ID                 |character |Unique player identifier.                                                        |
#'    |PLAYER_NAME               |character |Player name.                                                                     |
#'    |START_POSITION            |character |                                                                                 |
#'    |COMMENT                   |character |Player status / inactive reason (e.g. 'DNP - Coach's Decision', 'Inactive').     |
#'    |MINUTES                   |character |Minutes played, formatted MM:SS (V3 PT-duration parsed) or decimal minutes (V2). |
#'    |PTS                       |character |Points scored.                                                                   |
#'    |CONTESTED_SHOTS           |character |Defensively contested shots.                                                     |
#'    |CONTESTED_SHOTS_2PT       |character |Contested two-point shots.                                                       |
#'    |CONTESTED_SHOTS_3PT       |character |Contested three-point shots.                                                     |
#'    |DEFLECTIONS               |character |Defensive deflections.                                                           |
#'    |CHARGES_DRAWN             |character |Charges drawn.                                                                   |
#'    |SCREEN_ASSISTS            |character |Screen assists (resulting in a basket).                                          |
#'    |SCREEN_AST_PTS            |character |                                                                                 |
#'    |OFF_LOOSE_BALLS_RECOVERED |character |                                                                                 |
#'    |DEF_LOOSE_BALLS_RECOVERED |character |                                                                                 |
#'    |LOOSE_BALLS_RECOVERED     |character |Loose balls recovered.                                                           |
#'    |OFF_BOXOUTS               |character |                                                                                 |
#'    |DEF_BOXOUTS               |character |                                                                                 |
#'    |BOX_OUT_PLAYER_TEAM_REBS  |character |                                                                                 |
#'    |BOX_OUT_PLAYER_REBS       |character |                                                                                 |
#'    |BOX_OUTS                  |character |Box-outs executed.                                                               |
#'    
#'    **TeamStats** 
#'    
#'    
#'    |col_name                  |types     |description                                                                      |
#'    |:-------------------------|:---------|:--------------------------------------------------------------------------------|
#'    |GAME_ID                   |character |Unique game identifier.                                                          |
#'    |TEAM_ID                   |character |Unique team identifier.                                                          |
#'    |TEAM_NAME                 |character |Full team display name (e.g. 'Las Vegas Aces').                                  |
#'    |TEAM_ABBREVIATION         |character |Short team abbreviation (e.g. 'LAS').                                            |
#'    |TEAM_CITY                 |character |Team city or region (e.g. 'Las Vegas').                                          |
#'    |MINUTES                   |character |Minutes played, formatted MM:SS (V3 PT-duration parsed) or decimal minutes (V2). |
#'    |PTS                       |character |Points scored.                                                                   |
#'    |CONTESTED_SHOTS           |character |Defensively contested shots.                                                     |
#'    |CONTESTED_SHOTS_2PT       |character |Contested two-point shots.                                                       |
#'    |CONTESTED_SHOTS_3PT       |character |Contested three-point shots.                                                     |
#'    |DEFLECTIONS               |character |Defensive deflections.                                                           |
#'    |CHARGES_DRAWN             |character |Charges drawn.                                                                   |
#'    |SCREEN_ASSISTS            |character |Screen assists (resulting in a basket).                                          |
#'    |SCREEN_AST_PTS            |character |                                                                                 |
#'    |OFF_LOOSE_BALLS_RECOVERED |character |                                                                                 |
#'    |DEF_LOOSE_BALLS_RECOVERED |character |                                                                                 |
#'    |LOOSE_BALLS_RECOVERED     |character |Loose balls recovered.                                                           |
#'    |OFF_BOXOUTS               |character |                                                                                 |
#'    |DEF_BOXOUTS               |character |                                                                                 |
#'    |BOX_OUT_PLAYER_TEAM_REBS  |character |                                                                                 |
#'    |BOX_OUT_PLAYER_REBS       |character |                                                                                 |
#'    |BOX_OUTS                  |character |Box-outs executed.                                                               |
#' 
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows as_tibble
#' @import rvest
#' @keywords internal
#' @export
#' @family WNBA Boxscore Functions
#' @family WNBA Hustle Functions
#' @details
#' ```r
#'   wnba_hustlestatsboxscore(game_id = "1022200034")
#' ```
wnba_hustlestatsboxscore <- function(
    game_id,
    ...){

  .args <- .capture_args()

  lifecycle::deprecate_stop(
    when = "3.0.0",
    what = "wnba_hustlestatsboxscore()",
    details = "The `hustlestatsboxscore` endpoint no longer returns data."
  )
}

