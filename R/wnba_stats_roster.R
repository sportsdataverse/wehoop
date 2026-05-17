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
#'    |col_name                 |types     |description                                               |
#'    |:------------------------|:---------|:---------------------------------------------------------|
#'    |PERSON_ID                |character |Unique player identifier (V3 endpoints).                  |
#'    |DISPLAY_LAST_COMMA_FIRST |character |                                                          |
#'    |DISPLAY_FIRST_LAST       |character |                                                          |
#'    |ROSTERSTATUS             |character |                                                          |
#'    |FROM_YEAR                |character |                                                          |
#'    |TO_YEAR                  |character |                                                          |
#'    |PLAYERCODE               |character |                                                          |
#'    |PLAYER_SLUG              |character |URL-safe player identifier.                               |
#'    |TEAM_ID                  |character |Unique team identifier.                                   |
#'    |TEAM_CITY                |character |Team city or region (e.g. 'Las Vegas').                   |
#'    |TEAM_NAME                |character |Full team display name (e.g. 'Las Vegas Aces').           |
#'    |TEAM_ABBREVIATION        |character |Short team abbreviation (e.g. 'LAS').                     |
#'    |TEAM_CODE                |character |                                                          |
#'    |TEAM_SLUG                |character |URL-safe team identifier (e.g. 'lasvegas-aces' / 'aces'). |
#'    |IS_NBA_ASSIGNED          |character |                                                          |
#'    |NBA_ASSIGNED_TEAM_ID     |character |                                                          |
#'    |GAMES_PLAYED_FLAG        |character |                                                          |
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
  .args <- mget(setdiff(names(formals()), "..."))
  
  version <- "commonallplayers"
  endpoint <- wnba_endpoint(version)
  full_url <- endpoint
  
  params <- list(
    IsOnlyCurrentSeason = is_only_current_season,
    LeagueID = league_id,
    Season = season
  )
  
  df_list <- list()

  tryCatch(
    expr = {
      
      resp <- request_with_proxy(url = full_url, params = params, ...)
      
      df_list <- wnba_stats_map_result_sets(resp)
      
    },
    error = function(e) .report_api_error(
      e,
      hint = "Invalid arguments or common all players data for {season} available!",
      args = .args
    ),
    warning = function(w) .report_api_warning(w, args = .args),
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
#'    |col_name                         |types     |description                                               |
#'    |:--------------------------------|:---------|:---------------------------------------------------------|
#'    |PERSON_ID                        |character |Unique player identifier (V3 endpoints).                  |
#'    |FIRST_NAME                       |character |Player's first name.                                      |
#'    |LAST_NAME                        |character |Player's last name.                                       |
#'    |DISPLAY_FIRST_LAST               |character |                                                          |
#'    |DISPLAY_LAST_COMMA_FIRST         |character |                                                          |
#'    |DISPLAY_FI_LAST                  |character |                                                          |
#'    |PLAYER_SLUG                      |character |URL-safe player identifier.                               |
#'    |BIRTHDATE                        |character |                                                          |
#'    |SCHOOL                           |character |Player's school / college (when distinct from 'college'). |
#'    |COUNTRY                          |character |Country (full name or code).                              |
#'    |LAST_AFFILIATION                 |character |                                                          |
#'    |HEIGHT                           |character |Player height (string e.g. '6-2' or inches).              |
#'    |WEIGHT                           |character |Player weight in pounds.                                  |
#'    |SEASON_EXP                       |character |                                                          |
#'    |JERSEY                           |character |Jersey number worn by the player.                         |
#'    |POSITION                         |character |Listed roster position (G, F, C, etc.).                   |
#'    |ROSTERSTATUS                     |character |                                                          |
#'    |GAMES_PLAYED_CURRENT_SEASON_FLAG |character |                                                          |
#'    |TEAM_ID                          |character |Unique team identifier.                                   |
#'    |TEAM_NAME                        |character |Full team display name (e.g. 'Las Vegas Aces').           |
#'    |TEAM_ABBREVIATION                |character |Short team abbreviation (e.g. 'LAS').                     |
#'    |TEAM_CODE                        |character |                                                          |
#'    |TEAM_CITY                        |character |Team city or region (e.g. 'Las Vegas').                   |
#'    |PLAYERCODE                       |character |                                                          |
#'    |FROM_YEAR                        |character |                                                          |
#'    |TO_YEAR                          |character |                                                          |
#'    |DLEAGUE_FLAG                     |character |                                                          |
#'    |NBA_FLAG                         |character |                                                          |
#'    |GAMES_PLAYED_FLAG                |character |                                                          |
#'    |DRAFT_YEAR                       |character |Draft year (4-digit).                                     |
#'    |DRAFT_ROUND                      |character |Round of the draft selection.                             |
#'    |DRAFT_NUMBER                     |character |                                                          |
#'    |GREATEST_75_FLAG                 |character |                                                          |
#'    
#'    **PlayerHeadlineStats** 
#'    
#'    
#'    |col_name             |types     |description               |
#'    |:--------------------|:---------|:-------------------------|
#'    |PLAYER_ID            |character |Unique player identifier. |
#'    |PLAYER_NAME          |character |Player name.              |
#'    |TimeFrame            |character |                          |
#'    |PTS                  |character |Points scored.            |
#'    |AST                  |character |Assists.                  |
#'    |REB                  |character |Total rebounds.           |
#'    |ALL_STAR_APPEARANCES |character |                          |
#'    
#'    **AvailableSeasons** 
#'    
#'    
#'    |col_name  |types     |description               |
#'    |:---------|:---------|:-------------------------|
#'    |SEASON_ID |character |Unique season identifier. |
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
  .args <- mget(setdiff(names(formals()), "..."))
  
  version <- "commonplayerinfo"
  endpoint <- wnba_endpoint(version)
  
  full_url <- endpoint
  
  params <- list(
    LeagueID = league_id,
    PlayerID = player_id
  )
  
  df_list <- list()

  tryCatch(
    expr = {
      
      resp <- request_with_proxy(url = full_url, params = params, ...)
      
      df_list <- wnba_stats_map_result_sets(resp)
      
    },
    error = function(e) .report_api_error(
      e,
      hint = "Invalid arguments or common player info data for {season} available!",
      args = .args
    ),
    warning = function(w) .report_api_warning(w, args = .args),
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
#'    |col_name        |types     |description                          |
#'    |:---------------|:---------|:------------------------------------|
#'    |GAME_ID         |character |Unique game identifier.              |
#'    |HOME_TEAM_ID    |character |Unique identifier for the home team. |
#'    |VISITOR_TEAM_ID |character |Unique identifier for visitor team.  |
#'    |SERIES_ID       |character |                                     |
#'    |GAME_NUM        |character |                                     |
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
  .args <- mget(setdiff(names(formals()), "..."))
  
  version <- "commonplayoffseries"
  endpoint <- wnba_endpoint(version)
  full_url <- endpoint
  
  params <- list(
    LeagueID = league_id,
    Season = season,
    SeriesID = series_id
  )
  
  df_list <- list()

  tryCatch(
    expr = {
      
      resp <- request_with_proxy(url = full_url, params = params, ...)
      
      df_list <- wnba_stats_map_result_sets(resp)
      
    },
    error = function(e) .report_api_error(
      e,
      hint = "Invalid arguments or common playoff series data for {season} available!",
      args = .args
    ),
    warning = function(w) .report_api_warning(w, args = .args),
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
#'    |col_name     |types     |description                                               |
#'    |:------------|:---------|:---------------------------------------------------------|
#'    |TeamID       |character |                                                          |
#'    |SEASON       |character |Season identifier (4-digit year or 'YYYY-YY' string).     |
#'    |LeagueID     |character |                                                          |
#'    |PLAYER       |character |                                                          |
#'    |NICKNAME     |character |Team or athlete nickname.                                 |
#'    |PLAYER_SLUG  |character |URL-safe player identifier.                               |
#'    |NUM          |character |                                                          |
#'    |POSITION     |character |Listed roster position (G, F, C, etc.).                   |
#'    |HEIGHT       |character |Player height (string e.g. '6-2' or inches).              |
#'    |WEIGHT       |character |Player weight in pounds.                                  |
#'    |BIRTH_DATE   |character |Date of birth (YYYY-MM-DD).                               |
#'    |AGE          |character |Player age (in years).                                    |
#'    |EXP          |character |                                                          |
#'    |SCHOOL       |character |Player's school / college (when distinct from 'college'). |
#'    |PLAYER_ID    |character |Unique player identifier.                                 |
#'    |HOW_ACQUIRED |character |                                                          |
#'
#'    **Coaches**
#'
#'
#'    |col_name          |types     |description                                           |
#'    |:-----------------|:---------|:-----------------------------------------------------|
#'    |TEAM_ID           |character |Unique team identifier.                               |
#'    |SEASON            |character |Season identifier (4-digit year or 'YYYY-YY' string). |
#'    |COACH_ID          |character |Unique identifier for coach.                          |
#'    |FIRST_NAME        |character |Player's first name.                                  |
#'    |LAST_NAME         |character |Player's last name.                                   |
#'    |COACH_NAME        |character |                                                      |
#'    |IS_ASSISTANT      |character |                                                      |
#'    |COACH_TYPE        |character |                                                      |
#'    |SORT_SEQUENCE     |character |                                                      |
#'    |SUB_SORT_SEQUENCE |character |                                                      |
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
  .args <- mget(setdiff(names(formals()), "..."))
  
  version <- "commonteamroster"
  endpoint <- wnba_endpoint(version)
  full_url <- endpoint
  
  params <- list(
    LeagueID = league_id,
    Season = season,
    TeamID = team_id
  )
  
  df_list <- list()

  tryCatch(
    expr = {
      
      resp <- request_with_proxy(url = full_url, params = params, ...)
      
      df_list <- wnba_stats_map_result_sets(resp)
      
    },
    error = function(e) .report_api_error(
      e,
      hint = "Invalid arguments or common team roster data for {season} available!",
      args = .args
    ),
    warning = function(w) .report_api_warning(w, args = .args),
    finally = {
    }
  )
  return(df_list)
}
