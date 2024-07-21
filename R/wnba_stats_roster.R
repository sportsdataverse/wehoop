#' **Get WNBA Stats API All Players**
#' @name wnba_commonallplayers
NULL
#' @title
#' **Get WNBA Stats API All Players**
#' @rdname wnba_commonallplayers
#' @author Saiem Gilani
#' @param is_only_current_season is_only_current_season
#' @param league_id league_id
#' @param season season
#' @param ... Additional arguments passed to an underlying function like httr.
#' @return Return a named list of data frames: CommonAllPlayers
#'
#'    **CommonAllPlayers** 
#'    
#'    
#'    |col_name                 |types     |
#'    |:------------------------|:---------|
#'    |PERSON_ID                |character |
#'    |DISPLAY_LAST_COMMA_FIRST |character |
#'    |DISPLAY_FIRST_LAST       |character |
#'    |ROSTERSTATUS             |character |
#'    |FROM_YEAR                |character |
#'    |TO_YEAR                  |character |
#'    |PLAYERCODE               |character |
#'    |PLAYER_SLUG              |character |
#'    |TEAM_ID                  |character |
#'    |TEAM_CITY                |character |
#'    |TEAM_NAME                |character |
#'    |TEAM_ABBREVIATION        |character |
#'    |TEAM_CODE                |character |
#'    |TEAM_SLUG                |character |
#'    |IS_NBA_ASSIGNED          |character |
#'    |NBA_ASSIGNED_TEAM_ID     |character |
#'    |GAMES_PLAYED_FLAG        |character |
#'
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows as_tibble
#' @import rvest
#' @export
#' @family WNBA Roster Functions
#' @details
#' ```r
#'   wnba_commonallplayers(league_id = '10', season = most_recent_wnba_season() - 1)
#' ```
wnba_commonallplayers <- function(
    is_only_current_season = 0,
    league_id = '10',
    season = most_recent_wnba_season() - 1,
    ...){
  
  version <- "commonallplayers"
  endpoint <- wnba_endpoint(version)
  full_url <- endpoint
  
  params <- list(
    IsOnlyCurrentSeason = is_only_current_season,
    LeagueID = league_id,
    Season = season
  )
  
  tryCatch(
    expr = {
      
      resp <- request_with_proxy(url = full_url, params = params, ...)
      
      df_list <- wnba_stats_map_result_sets(resp)
      
    },
    error = function(e) {
      message(glue::glue("{Sys.time()}: Invalid arguments or common all players data for {season} available!"))
      message(glue::glue("Error:\n{e}"))
    },
    warning = function(w) {
      message(glue::glue("{Sys.time()}: Warning:\n{w}"))
    },
    finally = {
    }
  )
  return(df_list)
}

#' **Get WNBA Stats API Player Info**
#' @name wnba_commonplayerinfo
NULL
#' @title
#' **Get WNBA Stats API Player Info**
#' @rdname wnba_commonplayerinfo
#' @author Saiem Gilani
#' @param league_id league_id
#' @param player_id player_id
#' @param ... Additional arguments passed to an underlying function like httr.
#' @return Return a named list of data frames: CommonPlayerInfo, PlayerHeadlineStats,
#'  AvailableSeasons
#'
#'    **CommonPlayerInfo** 
#'    
#'    
#'    |col_name                         |types     |
#'    |:--------------------------------|:---------|
#'    |PERSON_ID                        |character |
#'    |FIRST_NAME                       |character |
#'    |LAST_NAME                        |character |
#'    |DISPLAY_FIRST_LAST               |character |
#'    |DISPLAY_LAST_COMMA_FIRST         |character |
#'    |DISPLAY_FI_LAST                  |character |
#'    |PLAYER_SLUG                      |character |
#'    |BIRTHDATE                        |character |
#'    |SCHOOL                           |character |
#'    |COUNTRY                          |character |
#'    |LAST_AFFILIATION                 |character |
#'    |HEIGHT                           |character |
#'    |WEIGHT                           |character |
#'    |SEASON_EXP                       |character |
#'    |JERSEY                           |character |
#'    |POSITION                         |character |
#'    |ROSTERSTATUS                     |character |
#'    |GAMES_PLAYED_CURRENT_SEASON_FLAG |character |
#'    |TEAM_ID                          |character |
#'    |TEAM_NAME                        |character |
#'    |TEAM_ABBREVIATION                |character |
#'    |TEAM_CODE                        |character |
#'    |TEAM_CITY                        |character |
#'    |PLAYERCODE                       |character |
#'    |FROM_YEAR                        |character |
#'    |TO_YEAR                          |character |
#'    |DLEAGUE_FLAG                     |character |
#'    |NBA_FLAG                         |character |
#'    |GAMES_PLAYED_FLAG                |character |
#'    |DRAFT_YEAR                       |character |
#'    |DRAFT_ROUND                      |character |
#'    |DRAFT_NUMBER                     |character |
#'    |GREATEST_75_FLAG                 |character |
#'    
#'    **PlayerHeadlineStats** 
#'    
#'    
#'    |col_name             |types     |
#'    |:--------------------|:---------|
#'    |PLAYER_ID            |character |
#'    |PLAYER_NAME          |character |
#'    |TimeFrame            |character |
#'    |PTS                  |character |
#'    |AST                  |character |
#'    |REB                  |character |
#'    |ALL_STAR_APPEARANCES |character |
#'    
#'    **AvailableSeasons** 
#'    
#'    
#'    |col_name  |types     |
#'    |:---------|:---------|
#'    |SEASON_ID |character |
#'
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows as_tibble
#' @import rvest
#' @export
#' @family WNBA Roster Functions
#' @details
#' ```r
#'  wnba_commonplayerinfo(league_id = '10', player_id = '1628932')
#' ```
wnba_commonplayerinfo <- function(
    league_id = '10',
    player_id = '1628932',
    ...){
  
  version <- "commonplayerinfo"
  endpoint <- wnba_endpoint(version)
  
  full_url <- endpoint
  
  params <- list(
    LeagueID = league_id,
    PlayerID = player_id
  )
  
  tryCatch(
    expr = {
      
      resp <- request_with_proxy(url = full_url, params = params, ...)
      
      df_list <- wnba_stats_map_result_sets(resp)
      
    },
    error = function(e) {
      message(glue::glue("{Sys.time()}: Invalid arguments or common player info data for {season} available!"))
      message(glue::glue("Error:\n{e}"))
    },
    warning = function(w) {
      message(glue::glue("{Sys.time()}: Warning:\n{w}"))
    },
    finally = {
    }
  )
  return(df_list)
}

#' **Get WNBA Stats API Playoff Series**
#' @name wnba_commonplayoffseries
NULL
#' @title
#' **Get WNBA Stats API Playoff Series**
#' @rdname wnba_commonplayoffseries
#' @author Saiem Gilani
#' @param league_id league_id
#' @param season season
#' @param series_id series_id
#' @param ... Additional arguments passed to an underlying function like httr.
#' @return Return a named list of data frames: PlayoffSeries
#'
#'    **PlayoffSeries**
#'
#'
#'    |col_name        |types     |
#'    |:---------------|:---------|
#'    |GAME_ID         |character |
#'    |HOME_TEAM_ID    |character |
#'    |VISITOR_TEAM_ID |character |
#'    |SERIES_ID       |character |
#'    |GAME_NUM        |character |
#'
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows as_tibble
#' @import rvest
#' @export
#' @details
#' ```r
#'  wnba_commonplayoffseries(league_id = '10', season = most_recent_wnba_season() - 2)
#' ```
wnba_commonplayoffseries <- function(
    league_id = '10',
    season = most_recent_wnba_season() - 2,
    series_id = '',
    ...){
  
  version <- "commonplayoffseries"
  endpoint <- wnba_endpoint(version)
  full_url <- endpoint
  
  params <- list(
    LeagueID = league_id,
    Season = season,
    SeriesID = series_id
  )
  
  tryCatch(
    expr = {
      
      resp <- request_with_proxy(url = full_url, params = params, ...)
      
      df_list <- wnba_stats_map_result_sets(resp)
      
    },
    error = function(e) {
      message(glue::glue("{Sys.time()}: Invalid arguments or common playoff series data for {season} available!"))
      message(glue::glue("Error:\n{e}"))
    },
    warning = function(w) {
      message(glue::glue("{Sys.time()}: Warning:\n{w}"))
    },
    finally = {
    }
  )
  return(df_list)
}

#' **Get WNBA Stats API Team Roster**
#' @name wnba_commonteamroster
NULL
#' @title
#' **Get WNBA Stats API Team Roster**
#' @rdname wnba_commonteamroster
#' @author Saiem Gilani
#' @param league_id league_id
#' @param season season
#' @param team_id team_id
#' @param ... Additional arguments passed to an underlying function like httr.
#' @return Return a named list of data frames: Coaches, CommonTeamRoster
#'
#'    **CommonTeamRoster**
#'
#'
#'    |col_name     |types     |
#'    |:------------|:---------|
#'    |TeamID       |character |
#'    |SEASON       |character |
#'    |LeagueID     |character |
#'    |PLAYER       |character |
#'    |NICKNAME     |character |
#'    |PLAYER_SLUG  |character |
#'    |NUM          |character |
#'    |POSITION     |character |
#'    |HEIGHT       |character |
#'    |WEIGHT       |character |
#'    |BIRTH_DATE   |character |
#'    |AGE          |character |
#'    |EXP          |character |
#'    |SCHOOL       |character |
#'    |PLAYER_ID    |character |
#'    |HOW_ACQUIRED |character |
#'
#'    **Coaches**
#'
#'
#'    |col_name          |types     |
#'    |:-----------------|:---------|
#'    |TEAM_ID           |character |
#'    |SEASON            |character |
#'    |COACH_ID          |character |
#'    |FIRST_NAME        |character |
#'    |LAST_NAME         |character |
#'    |COACH_NAME        |character |
#'    |IS_ASSISTANT      |character |
#'    |COACH_TYPE        |character |
#'    |SORT_SEQUENCE     |character |
#'    |SUB_SORT_SEQUENCE |character |
#'
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows as_tibble
#' @import rvest
#' @export
#' @family WNBA Roster Functions
#' @details
#' ```r
#'   wnba_commonteamroster(season = most_recent_wnba_season() - 1, team_id = '1611661317')
#' ```
wnba_commonteamroster <- function(
    league_id = '10',
    season = most_recent_wnba_season() - 1,
    team_id = '1611661317',
    ...){
  
  version <- "commonteamroster"
  endpoint <- wnba_endpoint(version)
  full_url <- endpoint
  
  params <- list(
    LeagueID = league_id,
    Season = season,
    TeamID = team_id
  )
  
  tryCatch(
    expr = {
      
      resp <- request_with_proxy(url = full_url, params = params, ...)
      
      df_list <- wnba_stats_map_result_sets(resp)
      
    },
    error = function(e) {
      message(glue::glue("{Sys.time()}: Invalid arguments or common team roster data for {season} available!"))
      message(glue::glue("Error:\n{e}"))
    },
    warning = function(w) {
      message(glue::glue("{Sys.time()}: Warning:\n{w}"))
    },
    finally = {
    }
  )
  return(df_list)
}
