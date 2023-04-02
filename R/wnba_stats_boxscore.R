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
#'    |col_name          |types     |
#'    |:-----------------|:---------|
#'    |GAME_ID           |character |
#'    |TEAM_ID           |character |
#'    |TEAM_ABBREVIATION |character |
#'    |TEAM_CITY         |character |
#'    |PLAYER_ID         |character |
#'    |PLAYER_NAME       |character |
#'    |NICKNAME          |character |
#'    |START_POSITION    |character |
#'    |COMMENT           |character |
#'    |MIN               |character |
#'    |FGM               |character |
#'    |FGA               |character |
#'    |FG_PCT            |character |
#'    |FG3M              |character |
#'    |FG3A              |character |
#'    |FG3_PCT           |character |
#'    |FTM               |character |
#'    |FTA               |character |
#'    |FT_PCT            |character |
#'    |OREB              |character |
#'    |DREB              |character |
#'    |REB               |character |
#'    |AST               |character |
#'    |STL               |character |
#'    |BLK               |character |
#'    |TO                |character |
#'    |PF                |character |
#'    |PTS               |character |
#'    |PLUS_MINUS        |character |
#'    
#'    **TeamStats** 
#'    
#'    
#'    |col_name          |types     |
#'    |:-----------------|:---------|
#'    |GAME_ID           |character |
#'    |TEAM_ID           |character |
#'    |TEAM_NAME         |character |
#'    |TEAM_ABBREVIATION |character |
#'    |TEAM_CITY         |character |
#'    |MIN               |character |
#'    |FGM               |character |
#'    |FGA               |character |
#'    |FG_PCT            |character |
#'    |FG3M              |character |
#'    |FG3A              |character |
#'    |FG3_PCT           |character |
#'    |FTM               |character |
#'    |FTA               |character |
#'    |FT_PCT            |character |
#'    |OREB              |character |
#'    |DREB              |character |
#'    |REB               |character |
#'    |AST               |character |
#'    |STL               |character |
#'    |BLK               |character |
#'    |TO                |character |
#'    |PF                |character |
#'    |PTS               |character |
#'    |PLUS_MINUS        |character |
#'    
#'    **TeamStarterBenchStats** 
#'    
#'    
#'    |col_name          |types     |
#'    |:-----------------|:---------|
#'    |GAME_ID           |character |
#'    |TEAM_ID           |character |
#'    |TEAM_NAME         |character |
#'    |TEAM_ABBREVIATION |character |
#'    |TEAM_CITY         |character |
#'    |STARTERS_BENCH    |character |
#'    |MIN               |character |
#'    |FGM               |character |
#'    |FGA               |character |
#'    |FG_PCT            |character |
#'    |FG3M              |character |
#'    |FG3A              |character |
#'    |FG3_PCT           |character |
#'    |FTM               |character |
#'    |FTA               |character |
#'    |FT_PCT            |character |
#'    |OREB              |character |
#'    |DREB              |character |
#'    |REB               |character |
#'    |AST               |character |
#'    |STL               |character |
#'    |BLK               |character |
#'    |TO                |character |
#'    |PF                |character |
#'    |PTS               |character |
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
  
  tryCatch(
    expr = {
      
      resp <- request_with_proxy(url = full_url, params = params, ...)
      
      df_list <- wnba_stats_map_result_sets(resp)
      
    },
    error = function(e) {
      message(glue::glue("{Sys.time()}: Invalid arguments or no traditional boxscore v2 data for {game_id} available!"))
    },
    warning = function(w) {
    },
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
#'    |col_name          |types     |
#'    |:-----------------|:---------|
#'    |GAME_ID           |character |
#'    |TEAM_ID           |character |
#'    |TEAM_ABBREVIATION |character |
#'    |TEAM_CITY         |character |
#'    |PLAYER_ID         |character |
#'    |PLAYER_NAME       |character |
#'    |NICKNAME          |character |
#'    |START_POSITION    |character |
#'    |COMMENT           |character |
#'    |MIN               |character |
#'    |E_OFF_RATING      |character |
#'    |OFF_RATING        |character |
#'    |E_DEF_RATING      |character |
#'    |DEF_RATING        |character |
#'    |E_NET_RATING      |character |
#'    |NET_RATING        |character |
#'    |AST_PCT           |character |
#'    |AST_TOV           |character |
#'    |AST_RATIO         |character |
#'    |OREB_PCT          |character |
#'    |DREB_PCT          |character |
#'    |REB_PCT           |character |
#'    |TM_TOV_PCT        |character |
#'    |EFG_PCT           |character |
#'    |TS_PCT            |character |
#'    |USG_PCT           |character |
#'    |E_USG_PCT         |character |
#'    |E_PACE            |character |
#'    |PACE              |character |
#'    |PACE_PER40        |character |
#'    |POSS              |character |
#'    |PIE               |character |
#'    
#'    **TeamStats** 
#'    
#'    
#'    |col_name          |types     |
#'    |:-----------------|:---------|
#'    |GAME_ID           |character |
#'    |TEAM_ID           |character |
#'    |TEAM_NAME         |character |
#'    |TEAM_ABBREVIATION |character |
#'    |TEAM_CITY         |character |
#'    |MIN               |character |
#'    |E_OFF_RATING      |character |
#'    |OFF_RATING        |character |
#'    |E_DEF_RATING      |character |
#'    |DEF_RATING        |character |
#'    |E_NET_RATING      |character |
#'    |NET_RATING        |character |
#'    |AST_PCT           |character |
#'    |AST_TOV           |character |
#'    |AST_RATIO         |character |
#'    |OREB_PCT          |character |
#'    |DREB_PCT          |character |
#'    |REB_PCT           |character |
#'    |E_TM_TOV_PCT      |character |
#'    |TM_TOV_PCT        |character |
#'    |EFG_PCT           |character |
#'    |TS_PCT            |character |
#'    |USG_PCT           |character |
#'    |E_USG_PCT         |character |
#'    |E_PACE            |character |
#'    |PACE              |character |
#'    |PACE_PER40        |character |
#'    |POSS              |character |
#'    |PIE               |character |
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
  
  tryCatch(
    expr = {
      
      resp <- request_with_proxy(url = full_url, params = params, ...)
      
      df_list <- wnba_stats_map_result_sets(resp)
      
    },
    error = function(e) {
      message(glue::glue("{Sys.time()}: Invalid arguments or no advanced boxscore v2 data for {game_id} available!"))
    },
    warning = function(w) {
    },
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
#'    |col_name          |types     |
#'    |:-----------------|:---------|
#'    |GAME_ID           |character |
#'    |TEAM_ID           |character |
#'    |TEAM_ABBREVIATION |character |
#'    |TEAM_CITY         |character |
#'    |PLAYER_ID         |character |
#'    |PLAYER_NAME       |character |
#'    |NICKNAME          |character |
#'    |START_POSITION    |character |
#'    |COMMENT           |character |
#'    |MIN               |character |
#'    |EFG_PCT           |character |
#'    |FTA_RATE          |character |
#'    |TM_TOV_PCT        |character |
#'    |OREB_PCT          |character |
#'    |OPP_EFG_PCT       |character |
#'    |OPP_FTA_RATE      |character |
#'    |OPP_TOV_PCT       |character |
#'    |OPP_OREB_PCT      |character |
#'    
#'    **sqlTeamsFourFactors** 
#'    
#'    
#'    |col_name          |types     |
#'    |:-----------------|:---------|
#'    |GAME_ID           |character |
#'    |TEAM_ID           |character |
#'    |TEAM_NAME         |character |
#'    |TEAM_ABBREVIATION |character |
#'    |TEAM_CITY         |character |
#'    |MIN               |character |
#'    |EFG_PCT           |character |
#'    |FTA_RATE          |character |
#'    |TM_TOV_PCT        |character |
#'    |OREB_PCT          |character |
#'    |OPP_EFG_PCT       |character |
#'    |OPP_FTA_RATE      |character |
#'    |OPP_TOV_PCT       |character |
#'    |OPP_OREB_PCT      |character |
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
  
  tryCatch(
    expr = {
      
      resp <- request_with_proxy(url = full_url, params = params, ...)
      
      df_list <- wnba_stats_map_result_sets(resp)
      
    },
    error = function(e) {
      message(glue::glue("{Sys.time()}: Invalid arguments or no four factors boxscore v2 data for {game_id} available!"))
    },
    warning = function(w) {
    },
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
#'    |col_name           |types     |
#'    |:------------------|:---------|
#'    |GAME_ID            |character |
#'    |TEAM_ID            |character |
#'    |TEAM_ABBREVIATION  |character |
#'    |TEAM_CITY          |character |
#'    |PLAYER_ID          |character |
#'    |PLAYER_NAME        |character |
#'    |NICKNAME           |character |
#'    |START_POSITION     |character |
#'    |COMMENT            |character |
#'    |MIN                |character |
#'    |PTS_OFF_TOV        |character |
#'    |PTS_2ND_CHANCE     |character |
#'    |PTS_FB             |character |
#'    |PTS_PAINT          |character |
#'    |OPP_PTS_OFF_TOV    |character |
#'    |OPP_PTS_2ND_CHANCE |character |
#'    |OPP_PTS_FB         |character |
#'    |OPP_PTS_PAINT      |character |
#'    |BLK                |character |
#'    |BLKA               |character |
#'    |PF                 |character |
#'    |PFD                |character |
#'    
#'    **sqlTeamsMisc** 
#'    
#'    
#'    |col_name           |types     |
#'    |:------------------|:---------|
#'    |GAME_ID            |character |
#'    |TEAM_ID            |character |
#'    |TEAM_NAME          |character |
#'    |TEAM_ABBREVIATION  |character |
#'    |TEAM_CITY          |character |
#'    |MIN                |character |
#'    |PTS_OFF_TOV        |character |
#'    |PTS_2ND_CHANCE     |character |
#'    |PTS_FB             |character |
#'    |PTS_PAINT          |character |
#'    |OPP_PTS_OFF_TOV    |character |
#'    |OPP_PTS_2ND_CHANCE |character |
#'    |OPP_PTS_FB         |character |
#'    |OPP_PTS_PAINT      |character |
#'    |BLK                |character |
#'    |BLKA               |character |
#'    |PF                 |character |
#'    |PFD                |character |
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
  
  tryCatch(
    expr = {
      
      resp <- request_with_proxy(url = full_url, params = params, ...)
      
      df_list <- wnba_stats_map_result_sets(resp)
      
    },
    error = function(e) {
      message(glue::glue("{Sys.time()}: Invalid arguments or no miscellaneous boxscore v2 data for {game_id} available!"))
    },
    warning = function(w) {
    },
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
#'    |col_name          |types     |
#'    |:-----------------|:---------|
#'    |GAME_ID           |character |
#'    |TEAM_ID           |character |
#'    |TEAM_ABBREVIATION |character |
#'    |TEAM_CITY         |character |
#'    |PLAYER_ID         |character |
#'    |PLAYER_NAME       |character |
#'    |NICKNAME          |character |
#'    |START_POSITION    |character |
#'    |COMMENT           |character |
#'    |MIN               |character |
#'    |PCT_FGA_2PT       |character |
#'    |PCT_FGA_3PT       |character |
#'    |PCT_PTS_2PT       |character |
#'    |PCT_PTS_2PT_MR    |character |
#'    |PCT_PTS_3PT       |character |
#'    |PCT_PTS_FB        |character |
#'    |PCT_PTS_FT        |character |
#'    |PCT_PTS_OFF_TOV   |character |
#'    |PCT_PTS_PAINT     |character |
#'    |PCT_AST_2PM       |character |
#'    |PCT_UAST_2PM      |character |
#'    |PCT_AST_3PM       |character |
#'    |PCT_UAST_3PM      |character |
#'    |PCT_AST_FGM       |character |
#'    |PCT_UAST_FGM      |character |
#'    
#'    **sqlTeamsScoring** 
#'    
#'    
#'    |col_name          |types     |
#'    |:-----------------|:---------|
#'    |GAME_ID           |character |
#'    |TEAM_ID           |character |
#'    |TEAM_NAME         |character |
#'    |TEAM_ABBREVIATION |character |
#'    |TEAM_CITY         |character |
#'    |MIN               |character |
#'    |PCT_FGA_2PT       |character |
#'    |PCT_FGA_3PT       |character |
#'    |PCT_PTS_2PT       |character |
#'    |PCT_PTS_2PT_MR    |character |
#'    |PCT_PTS_3PT       |character |
#'    |PCT_PTS_FB        |character |
#'    |PCT_PTS_FT        |character |
#'    |PCT_PTS_OFF_TOV   |character |
#'    |PCT_PTS_PAINT     |character |
#'    |PCT_AST_2PM       |character |
#'    |PCT_UAST_2PM      |character |
#'    |PCT_AST_3PM       |character |
#'    |PCT_UAST_3PM      |character |
#'    |PCT_AST_FGM       |character |
#'    |PCT_UAST_FGM      |character |
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
  
  tryCatch(
    expr = {
      
      resp <- request_with_proxy(url = full_url, params = params, ...)
      
      df_list <- wnba_stats_map_result_sets(resp)
      
    },
    error = function(e) {
      message(glue::glue("{Sys.time()}: Invalid arguments or no scoring boxscore v2 data for {game_id} available!"))
    },
    warning = function(w) {
    },
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
#'    |col_name          |types     |
#'    |:-----------------|:---------|
#'    |GAME_ID           |character |
#'    |TEAM_ID           |character |
#'    |TEAM_ABBREVIATION |character |
#'    |TEAM_CITY         |character |
#'    |PLAYER_ID         |character |
#'    |PLAYER_NAME       |character |
#'    |NICKNAME          |character |
#'    |START_POSITION    |character |
#'    |COMMENT           |character |
#'    |MIN               |character |
#'    |USG_PCT           |character |
#'    |PCT_FGM           |character |
#'    |PCT_FGA           |character |
#'    |PCT_FG3M          |character |
#'    |PCT_FG3A          |character |
#'    |PCT_FTM           |character |
#'    |PCT_FTA           |character |
#'    |PCT_OREB          |character |
#'    |PCT_DREB          |character |
#'    |PCT_REB           |character |
#'    |PCT_AST           |character |
#'    |PCT_TOV           |character |
#'    |PCT_STL           |character |
#'    |PCT_BLK           |character |
#'    |PCT_BLKA          |character |
#'    |PCT_PF            |character |
#'    |PCT_PFD           |character |
#'    |PCT_PTS           |character |
#'    
#'    **sqlTeamsUsage** 
#'    
#'    
#'    |col_name          |types     |
#'    |:-----------------|:---------|
#'    |GAME_ID           |character |
#'    |TEAM_ID           |character |
#'    |TEAM_NAME         |character |
#'    |TEAM_ABBREVIATION |character |
#'    |TEAM_CITY         |character |
#'    |MIN               |character |
#'    |USG_PCT           |character |
#'    |PCT_FGM           |character |
#'    |PCT_FGA           |character |
#'    |PCT_FG3M          |character |
#'    |PCT_FG3A          |character |
#'    |PCT_FTM           |character |
#'    |PCT_FTA           |character |
#'    |PCT_OREB          |character |
#'    |PCT_DREB          |character |
#'    |PCT_REB           |character |
#'    |PCT_AST           |character |
#'    |PCT_TOV           |character |
#'    |PCT_STL           |character |
#'    |PCT_BLK           |character |
#'    |PCT_BLKA          |character |
#'    |PCT_PF            |character |
#'    |PCT_PFD           |character |
#'    |PCT_PTS           |character |
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
  
  tryCatch(
    expr = {
      
      resp <- request_with_proxy(url = full_url, params = params, ...)
      
      df_list <- wnba_stats_map_result_sets(resp)
      
    },
    error = function(e) {
      message(glue::glue("{Sys.time()}: Invalid arguments or no usage boxscore v2 data for {game_id} available!"))
    },
    warning = function(w) {
    },
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
#'    |col_name                         |types     |
#'    |:--------------------------------|:---------|
#'    |GAME_DATE_EST                    |character |
#'    |GAME_SEQUENCE                    |character |
#'    |GAME_ID                          |character |
#'    |GAME_STATUS_ID                   |character |
#'    |GAME_STATUS_TEXT                 |character |
#'    |GAMECODE                         |character |
#'    |HOME_TEAM_ID                     |character |
#'    |VISITOR_TEAM_ID                  |character |
#'    |SEASON                           |character |
#'    |LIVE_PERIOD                      |character |
#'    |LIVE_PC_TIME                     |character |
#'    |NATL_TV_BROADCASTER_ABBREVIATION |character |
#'    |LIVE_PERIOD_TIME_BCAST           |character |
#'    |WH_STATUS                        |character |
#'    
#'    **OtherStats** 
#'    
#'    
#'    |col_name          |types     |
#'    |:-----------------|:---------|
#'    |LEAGUE_ID         |character |
#'    |TEAM_ID           |character |
#'    |TEAM_ABBREVIATION |character |
#'    |TEAM_CITY         |character |
#'    |PTS_PAINT         |character |
#'    |PTS_2ND_CHANCE    |character |
#'    |PTS_FB            |character |
#'    |LARGEST_LEAD      |character |
#'    |LEAD_CHANGES      |character |
#'    |TIMES_TIED        |character |
#'    |TEAM_TURNOVERS    |character |
#'    |TOTAL_TURNOVERS   |character |
#'    |TEAM_REBOUNDS     |character |
#'    |PTS_OFF_TO        |character |
#'    
#'    **Officials** 
#'    
#'    
#'    |col_name    |types     |
#'    |:-----------|:---------|
#'    |OFFICIAL_ID |character |
#'    |FIRST_NAME  |character |
#'    |LAST_NAME   |character |
#'    |JERSEY_NUM  |character |
#'    
#'    **InactivePlayers** 
#'    
#'    
#'    |col_name          |types     |
#'    |:-----------------|:---------|
#'    |PLAYER_ID         |character |
#'    |FIRST_NAME        |character |
#'    |LAST_NAME         |character |
#'    |JERSEY_NUM        |character |
#'    |TEAM_ID           |character |
#'    |TEAM_CITY         |character |
#'    |TEAM_NAME         |character |
#'    |TEAM_ABBREVIATION |character |
#'    
#'    **GameInfo** 
#'    
#'    
#'    |col_name   |types     |
#'    |:----------|:---------|
#'    |GAME_DATE  |character |
#'    |ATTENDANCE |character |
#'    |GAME_TIME  |character |
#'    
#'    **LineScore** 
#'    
#'    
#'    |col_name          |types     |
#'    |:-----------------|:---------|
#'    |GAME_DATE_EST     |character |
#'    |GAME_SEQUENCE     |character |
#'    |GAME_ID           |character |
#'    |TEAM_ID           |character |
#'    |TEAM_ABBREVIATION |character |
#'    |TEAM_CITY_NAME    |character |
#'    |TEAM_NICKNAME     |character |
#'    |TEAM_WINS_LOSSES  |character |
#'    |PTS_QTR1          |character |
#'    |PTS_QTR2          |character |
#'    |PTS_QTR3          |character |
#'    |PTS_QTR4          |character |
#'    |PTS_OT1           |character |
#'    |PTS_OT2           |character |
#'    |PTS_OT3           |character |
#'    |PTS_OT4           |character |
#'    |PTS_OT5           |character |
#'    |PTS_OT6           |character |
#'    |PTS_OT7           |character |
#'    |PTS_OT8           |character |
#'    |PTS_OT9           |character |
#'    |PTS_OT10          |character |
#'    |PTS               |character |
#'    
#'    **LastMeeting** 
#'    
#'    
#'    |col_name                         |types     |
#'    |:--------------------------------|:---------|
#'    |GAME_ID                          |character |
#'    |LAST_GAME_ID                     |character |
#'    |LAST_GAME_DATE_EST               |character |
#'    |LAST_GAME_HOME_TEAM_ID           |character |
#'    |LAST_GAME_HOME_TEAM_CITY         |character |
#'    |LAST_GAME_HOME_TEAM_NAME         |character |
#'    |LAST_GAME_HOME_TEAM_ABBREVIATION |character |
#'    |LAST_GAME_HOME_TEAM_POINTS       |character |
#'    |LAST_GAME_VISITOR_TEAM_ID        |character |
#'    |LAST_GAME_VISITOR_TEAM_CITY      |character |
#'    |LAST_GAME_VISITOR_TEAM_NAME      |character |
#'    |LAST_GAME_VISITOR_TEAM_CITY1     |character |
#'    |LAST_GAME_VISITOR_TEAM_POINTS    |character |
#'    
#'    **SeasonSeries** 
#'    
#'    
#'    |col_name         |types     |
#'    |:----------------|:---------|
#'    |GAME_ID          |character |
#'    |HOME_TEAM_ID     |character |
#'    |VISITOR_TEAM_ID  |character |
#'    |GAME_DATE_EST    |character |
#'    |HOME_TEAM_WINS   |character |
#'    |HOME_TEAM_LOSSES |character |
#'    |SERIES_LEADER    |character |
#'    
#'    **AvailableVideo** 
#'    
#'    
#'    |col_name             |types     |
#'    |:--------------------|:---------|
#'    |GAME_ID              |character |
#'    |VIDEO_AVAILABLE_FLAG |character |
#'    |PT_AVAILABLE         |character |
#'    |PT_XYZ_AVAILABLE     |character |
#'    |WH_STATUS            |character |
#'    |HUSTLE_STATUS        |character |
#'    |HISTORICAL_STATUS    |character |
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
  
  version <- "boxscoresummaryv2"
  endpoint <- wnba_endpoint(version)
  full_url <- endpoint
  
  params <- list(
    GameID = pad_id(game_id)
  )
  
  tryCatch(
    expr = {
      
      resp <- request_with_proxy(url = full_url, params = params, ...)
      
      df_list <- wnba_stats_map_result_sets(resp)
      
    },
    error = function(e) {
      message(glue::glue("{Sys.time()}: Invalid arguments or no summary boxscore v2 data for {game_id} available!"))
    },
    warning = function(w) {
    },
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
#'    |col_name          |types     |
#'    |:-----------------|:---------|
#'    |GAME_ID           |character |
#'    |TEAM_ID           |character |
#'    |TEAM_ABBREVIATION |character |
#'    |TEAM_CITY         |character |
#'    |PLAYER_ID         |character |
#'    |PLAYER_NAME       |character |
#'    |START_POSITION    |character |
#'    |COMMENT           |character |
#'    |MIN               |character |
#'    |SPD               |character |
#'    |DIST              |character |
#'    |ORBC              |character |
#'    |DRBC              |character |
#'    |RBC               |character |
#'    |TCHS              |character |
#'    |SAST              |character |
#'    |FTAST             |character |
#'    |PASS              |character |
#'    |AST               |character |
#'    |CFGM              |character |
#'    |CFGA              |character |
#'    |CFG_PCT           |character |
#'    |UFGM              |character |
#'    |UFGA              |character |
#'    |UFG_PCT           |character |
#'    |FG_PCT            |character |
#'    |DFGM              |character |
#'    |DFGA              |character |
#'    |DFG_PCT           |character |
#'    
#'    **TeamStats** 
#'    
#'    
#'    |col_name          |types     |
#'    |:-----------------|:---------|
#'    |GAME_ID           |character |
#'    |TEAM_ID           |character |
#'    |TEAM_NAME         |character |
#'    |TEAM_ABBREVIATION |character |
#'    |TEAM_CITY         |character |
#'    |MIN               |character |
#'    |DIST              |character |
#'    |ORBC              |character |
#'    |DRBC              |character |
#'    |RBC               |character |
#'    |TCHS              |character |
#'    |SAST              |character |
#'    |FTAST             |character |
#'    |PASS              |character |
#'    |AST               |character |
#'    |CFGM              |character |
#'    |CFGA              |character |
#'    |CFG_PCT           |character |
#'    |UFGM              |character |
#'    |UFGA              |character |
#'    |UFG_PCT           |character |
#'    |FG_PCT            |character |
#'    |DFGM              |character |
#'    |DFGA              |character |
#'    |DFG_PCT           |character |
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
  
  version <- "boxscoreplayertrackv2"
  endpoint <- wnba_endpoint(version)
  full_url <- endpoint
  
  params <- list(
    GameID = pad_id(game_id)
  )
  
  tryCatch(
    expr = {
      
      resp <- request_with_proxy(url = full_url, params = params, ...)
      
      df_list <- wnba_stats_map_result_sets(resp)
      
    },
    error = function(e) {
      message(glue::glue("{Sys.time()}: Invalid arguments or no  player tracking boxscore v2 data for {game_id} available!"))
    },
    warning = function(w) {
    },
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
#'    |col_name      |types     |
#'    |:-------------|:---------|
#'    |GAME_ID       |character |
#'    |HUSTLE_STATUS |character |
#'    
#'    **PlayerStats** 
#'    
#'    
#'    |col_name                  |types     |
#'    |:-------------------------|:---------|
#'    |GAME_ID                   |character |
#'    |TEAM_ID                   |character |
#'    |TEAM_ABBREVIATION         |character |
#'    |TEAM_CITY                 |character |
#'    |PLAYER_ID                 |character |
#'    |PLAYER_NAME               |character |
#'    |START_POSITION            |character |
#'    |COMMENT                   |character |
#'    |MINUTES                   |character |
#'    |PTS                       |character |
#'    |CONTESTED_SHOTS           |character |
#'    |CONTESTED_SHOTS_2PT       |character |
#'    |CONTESTED_SHOTS_3PT       |character |
#'    |DEFLECTIONS               |character |
#'    |CHARGES_DRAWN             |character |
#'    |SCREEN_ASSISTS            |character |
#'    |SCREEN_AST_PTS            |character |
#'    |OFF_LOOSE_BALLS_RECOVERED |character |
#'    |DEF_LOOSE_BALLS_RECOVERED |character |
#'    |LOOSE_BALLS_RECOVERED     |character |
#'    |OFF_BOXOUTS               |character |
#'    |DEF_BOXOUTS               |character |
#'    |BOX_OUT_PLAYER_TEAM_REBS  |character |
#'    |BOX_OUT_PLAYER_REBS       |character |
#'    |BOX_OUTS                  |character |
#'    
#'    **TeamStats** 
#'    
#'    
#'    |col_name                  |types     |
#'    |:-------------------------|:---------|
#'    |GAME_ID                   |character |
#'    |TEAM_ID                   |character |
#'    |TEAM_NAME                 |character |
#'    |TEAM_ABBREVIATION         |character |
#'    |TEAM_CITY                 |character |
#'    |MINUTES                   |character |
#'    |PTS                       |character |
#'    |CONTESTED_SHOTS           |character |
#'    |CONTESTED_SHOTS_2PT       |character |
#'    |CONTESTED_SHOTS_3PT       |character |
#'    |DEFLECTIONS               |character |
#'    |CHARGES_DRAWN             |character |
#'    |SCREEN_ASSISTS            |character |
#'    |SCREEN_AST_PTS            |character |
#'    |OFF_LOOSE_BALLS_RECOVERED |character |
#'    |DEF_LOOSE_BALLS_RECOVERED |character |
#'    |LOOSE_BALLS_RECOVERED     |character |
#'    |OFF_BOXOUTS               |character |
#'    |DEF_BOXOUTS               |character |
#'    |BOX_OUT_PLAYER_TEAM_REBS  |character |
#'    |BOX_OUT_PLAYER_REBS       |character |
#'    |BOX_OUTS                  |character |
#' 
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows as_tibble
#' @import rvest
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
  
  version <- "hustlestatsboxscore"
  endpoint <- wnba_endpoint(version)
  full_url <- endpoint
  
  params <- list(
    GameID = pad_id(game_id)
  )
  
  tryCatch(
    expr = {
      
      resp <- request_with_proxy(url = full_url, params = params, ...)
      
      df_list <- wnba_stats_map_result_sets(resp)
      
    },
    error = function(e) {
      message(glue::glue("{Sys.time()}: Invalid arguments or no hustle stats boxscore data for {game_id} available!"))
    },
    warning = function(w) {
    },
    finally = {
    }
  )
  return(df_list)
}


#' **Get WNBA Stats API Game Rotation**
#' @name wnba_gamerotation
NULL
#' @title
#' **Get WNBA Stats API Game Rotation**
#' @rdname wnba_gamerotation
#' @author Saiem Gilani
#' @param game_id Game ID
#' @param league_id League ID 
#' @param rotation_stat Rotation stat to provide details on: PLAYER_PTS, PT_DIFF, USG_PCT
#' @param ... Additional arguments passed to an underlying function like httr.
#' @return Returns a named list of data frames: AwayTeam, HomeTeam
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows as_tibble
#' @import rvest
#' @export
#' @family WNBA Boxscore Functions
#' @family WNBA Lineup Functions
#' @details 
#' ```r
#'   wnba_gamerotation(game_id = "1022200034")
#' ```
wnba_gamerotation <- function(
    game_id,
    league_id = '10', 
    rotation_stat = 'PLAYER_PTS',
    ...){
  
  version <- "gamerotation"
  endpoint <- wnba_endpoint(version)
  full_url <- endpoint
  
  params <- list(
    GameID = pad_id(game_id),
    LeagueID = league_id,
    RotationStat = rotation_stat
  )
  
  tryCatch(
    expr = {
      
      resp <- request_with_proxy(url = full_url, params = params, ...)
      
      df_list <- purrr::map(1:length(resp$resultSets$name), function(x){
        data <- resp$resultSets$rowSet[[x]] %>%
          data.frame(stringsAsFactors = F) %>%
          as_tibble()
        
        json_names <- resp$resultSets$headers[[x]]
        colnames(data) <- json_names
        return(data)
      })
      names(df_list) <- resp$resultSets$name
    },
    error = function(e) {
      message(glue::glue("{Sys.time()}: Invalid arguments or no game rotation data for {game_id} available!"))
    },
    warning = function(w) {
    },
    finally = {
    }
  )
  return(df_list)
}
