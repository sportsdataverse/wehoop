#' **Get WNBA Stats API Cumulative Player Stats**
#' @name wnba_cumestatsplayer
NULL
#' @title
#' **Get WNBA Stats API Cumulative Player Stats**
#' @rdname wnba_cumestatsplayer
#' @author Saiem Gilani
#' @param game_ids game_ids
#' @param league_id league_id
#' @param player_id player_id
#' @param season season
#' @param season_type season_type
#' @param team_id team_id
#' @param ... Additional arguments passed to an underlying function like httr.
#' @return Return a named list of data frames: GameByGameStats, TotalPlayerStats
#'
#'    **GameByGameStats**
#'
#'
#'    |col_name       |types     |
#'    |:--------------|:---------|
#'    |DATE_EST       |character |
#'    |VISITOR_TEAM   |character |
#'    |HOME_TEAM      |character |
#'    |GP             |character |
#'    |GS             |character |
#'    |ACTUAL_MINUTES |character |
#'    |ACTUAL_SECONDS |character |
#'    |FG             |character |
#'    |FGA            |character |
#'    |FG_PCT         |character |
#'    |FG3            |character |
#'    |FG3A           |character |
#'    |FG3_PCT        |character |
#'    |FT             |character |
#'    |FTA            |character |
#'    |FT_PCT         |character |
#'    |OFF_REB        |character |
#'    |DEF_REB        |character |
#'    |TOT_REB        |character |
#'    |AVG_TOT_REB    |character |
#'    |AST            |character |
#'    |PF             |character |
#'    |DQ             |character |
#'    |STL            |character |
#'    |TURNOVERS      |character |
#'    |BLK            |character |
#'    |PTS            |character |
#'    |AVG_PTS        |character |
#'
#'    **TotalPlayerStats**
#'
#'
#'    |col_name           |types     |
#'    |:------------------|:---------|
#'    |DISPLAY_FI_LAST    |character |
#'    |PERSON_ID          |character |
#'    |JERSEY_NUM         |character |
#'    |GP                 |character |
#'    |GS                 |character |
#'    |ACTUAL_MINUTES     |character |
#'    |ACTUAL_SECONDS     |character |
#'    |FG                 |character |
#'    |FGA                |character |
#'    |FG_PCT             |character |
#'    |FG3                |character |
#'    |FG3A               |character |
#'    |FG3_PCT            |character |
#'    |FT                 |character |
#'    |FTA                |character |
#'    |FT_PCT             |character |
#'    |OFF_REB            |character |
#'    |DEF_REB            |character |
#'    |TOT_REB            |character |
#'    |AST                |character |
#'    |PF                 |character |
#'    |DQ                 |character |
#'    |STL                |character |
#'    |TURNOVERS          |character |
#'    |BLK                |character |
#'    |PTS                |character |
#'    |MAX_ACTUAL_MINUTES |character |
#'    |MAX_ACTUAL_SECONDS |character |
#'    |MAX_REB            |character |
#'    |MAX_AST            |character |
#'    |MAX_STL            |character |
#'    |MAX_TURNOVERS      |character |
#'    |MAX_BLK            |character |
#'    |MAX_PTS            |character |
#'    |AVG_ACTUAL_MINUTES |character |
#'    |AVG_ACTUAL_SECONDS |character |
#'    |AVG_TOT_REB        |character |
#'    |AVG_AST            |character |
#'    |AVG_STL            |character |
#'    |AVG_TURNOVERS      |character |
#'    |AVG_BLK            |character |
#'    |AVG_PTS            |character |
#'    |PER_MIN_TOT_REB    |character |
#'    |PER_MIN_AST        |character |
#'    |PER_MIN_STL        |character |
#'    |PER_MIN_TURNOVERS  |character |
#'    |PER_MIN_BLK        |character |
#'    |PER_MIN_PTS        |character |
#'    
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows as_tibble
#' @import rvest
#' @export
#' @family WNBA Cume Functions
#' @details
#' ```r
#'   wnba_cumestatsplayer(game_ids = "1022200018", player_id = "204319", season = "2021-22")
#' ```

wnba_cumestatsplayer <- function(
  game_ids = '1022200018',
  league_id = '10',
  player_id = '204319',
  season = '2021-22',
  season_type = 'Regular Season',
  team_id = '',
  ...){
  
  #intentional
  # season_type <- gsub(' ','+',season_type)
  version <- "cumestatsplayer"
  endpoint <- wnba_endpoint(version)
  full_url <- endpoint
  
  params <- list(
    GameIDs = game_ids,
    LeagueID = league_id,
    PlayerID = player_id,
    Season = season,
    SeasonType = season_type,
    TeamID = team_id
  )
  
  tryCatch(
    expr = {
      
      resp <- request_with_proxy(url = full_url, params = params, ...)
      
      df_list <- wnba_stats_map_result_sets(resp)
      
    },
    error = function(e) {
      message(glue::glue("{Sys.time()}: Invalid arguments or no cumulative player stats data available for {player_id}!"))
    },
    warning = function(w) {
    },
    finally = {
    }
  )
  return(df_list)
}

#' **Get WNBA Stats API Cumulative Player Game Stats**
#' @name wnba_cumestatsplayergames
NULL
#' @title
#' **Get WNBA Stats API Cumulative Player Game Stats**
#' @rdname wnba_cumestatsplayergames
#' @author Saiem Gilani
#' @param league_id league_id
#' @param location location
#' @param outcome outcome
#' @param player_id player_id
#' @param season season
#' @param season_type season_type
#' @param vs_conference vs_conference
#' @param vs_division vs_division
#' @param vs_team_id vs_team_id
#' @param ... Additional arguments passed to an underlying function like httr.
#' @return Returns a named list of data frames: CumeStatsPlayerGames
#' 
#'    **CumeStatsPlayerGames** 
#'    
#'    
#'    |col_name |types     |
#'    |:--------|:---------|
#'    |MATCHUP  |character |
#'    |GAME_ID  |character |
#' 
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows as_tibble
#' @import rvest
#' @export
#' @family WNBA Cume Functions
#' @details
#' ```r
#'   wnba_cumestatsplayergames(player_id = "204319", season = "2021-22")
#' ```
wnba_cumestatsplayergames <- function(
  league_id = '10',
  location = '',
  outcome = '',
  player_id = '204319',
  season = '2021-22',
  season_type = 'Regular Season',
  vs_conference = '',
  vs_division = '',
  vs_team_id = '',
  ...){
  
  #intentional
  # season_type <- gsub(' ','+',season_type)
  version <- "cumestatsplayergames"
  endpoint <- wnba_endpoint(version)
  full_url <- endpoint
  
  params <- list(
    LeagueID = league_id,
    Location = location,
    Outcome = outcome,
    PlayerID = player_id,
    Season = season,
    SeasonType = season_type,
    VsConference = vs_conference,
    VsDivision = vs_division,
    VsTeamID = vs_team_id
  )
  
  tryCatch(
    expr = {
      
      resp <- request_with_proxy(url = full_url, params = params, ...)
      
      df_list <- wnba_stats_map_result_sets(resp)
      
    },
    error = function(e) {
      message(glue::glue("{Sys.time()}: Invalid arguments or no cumulative player game stats data available for {player_id}!"))
    },
    warning = function(w) {
    },
    finally = {
    }
  )
  return(df_list)
}

#' **Get WNBA Stats API Cumulative Team Stats**
#' @name wnba_cumestatsteam
NULL
#' @title
#' **Get WNBA Stats API Cumulative Team Stats**
#' @rdname wnba_cumestatsteam
#' @author Saiem Gilani
#' @param game_ids game_ids
#' @param league_id league_id
#' @param season season
#' @param season_type season_type
#' @param team_id team_id
#' @param ... Additional arguments passed to an underlying function like httr.
#' @return Returns a named list of data frames: GameByGameStats, TotalTeamStats
#' 
#'    **GameByGameStats** 
#'    
#'    
#'    |col_name           |types     |
#'    |:------------------|:---------|
#'    |JERSEY_NUM         |character |
#'    |PLAYER             |character |
#'    |PERSON_ID          |character |
#'    |TEAM_ID            |character |
#'    |GP                 |character |
#'    |GS                 |character |
#'    |ACTUAL_MINUTES     |character |
#'    |ACTUAL_SECONDS     |character |
#'    |FG                 |character |
#'    |FGA                |character |
#'    |FG_PCT             |character |
#'    |FG3                |character |
#'    |FG3A               |character |
#'    |FG3_PCT            |character |
#'    |FT                 |character |
#'    |FTA                |character |
#'    |FT_PCT             |character |
#'    |OFF_REB            |character |
#'    |DEF_REB            |character |
#'    |TOT_REB            |character |
#'    |AST                |character |
#'    |PF                 |character |
#'    |DQ                 |character |
#'    |STL                |character |
#'    |TURNOVERS          |character |
#'    |BLK                |character |
#'    |PTS                |character |
#'    |MAX_ACTUAL_MINUTES |character |
#'    |MAX_ACTUAL_SECONDS |character |
#'    |MAX_REB            |character |
#'    |MAX_AST            |character |
#'    |MAX_STL            |character |
#'    |MAX_TURNOVERS      |character |
#'    |MAX_BLKP           |character |
#'    |MAX_PTS            |character |
#'    |AVG_ACTUAL_MINUTES |character |
#'    |AVG_ACTUAL_SECONDS |character |
#'    |AVG_REB            |character |
#'    |AVG_AST            |character |
#'    |AVG_STL            |character |
#'    |AVG_TURNOVERS      |character |
#'    |AVG_BLKP           |character |
#'    |AVG_PTS            |character |
#'    |PER_MIN_REB        |character |
#'    |PER_MIN_AST        |character |
#'    |PER_MIN_STL        |character |
#'    |PER_MIN_TURNOVERS  |character |
#'    |PER_MIN_BLK        |character |
#'    |PER_MIN_PTS        |character |
#'    
#'    **TotalTeamStats** 
#'    
#'    
#'    |col_name        |types     |
#'    |:---------------|:---------|
#'    |CITY            |character |
#'    |NICKNAME        |character |
#'    |TEAM_ID         |character |
#'    |W               |character |
#'    |L               |character |
#'    |W_HOME          |character |
#'    |L_HOME          |character |
#'    |W_ROAD          |character |
#'    |L_ROAD          |character |
#'    |TEAM_TURNOVERS  |character |
#'    |TEAM_REBOUNDS   |character |
#'    |GP              |character |
#'    |GS              |character |
#'    |ACTUAL_MINUTES  |character |
#'    |ACTUAL_SECONDS  |character |
#'    |FG              |character |
#'    |FGA             |character |
#'    |FG_PCT          |character |
#'    |FG3             |character |
#'    |FG3A            |character |
#'    |FG3_PCT         |character |
#'    |FT              |character |
#'    |FTA             |character |
#'    |FT_PCT          |character |
#'    |OFF_REB         |character |
#'    |DEF_REB         |character |
#'    |TOT_REB         |character |
#'    |AST             |character |
#'    |PF              |character |
#'    |STL             |character |
#'    |TOTAL_TURNOVERS |character |
#'    |BLK             |character |
#'    |PTS             |character |
#'    |AVG_REB         |character |
#'    |AVG_PTS         |character |
#'    |DQ              |character |
#' 
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows as_tibble
#' @import rvest
#' @export
#' @family WNBA Cume Functions
#' @details 
#' ```r
#'   wnba_cumestatsteam(game_ids = "1022200018", season = "2021-22", team_id = "1611661317")
#' ```
wnba_cumestatsteam <- function(
  game_ids = '1022200018',
  league_id = '10',
  season = '2021-22',
  season_type = 'Regular Season',
  team_id = '1611661317',
  ...){
  
  #intentional
  # season_type <- gsub(' ','+',season_type)
  version <- "cumestatsteam"
  endpoint <- wnba_endpoint(version)
  
  full_url <- paste0(endpoint,
                     "?GameIDs=",game_ids,
                     "&LeagueID=",league_id,
                     "&Season=",season,
                     "&SeasonType=",season_type,
                     "&TeamID=",team_id)
  tryCatch(
    expr = {
      resp <- request_with_proxy(url = full_url, ...)
      
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
      message(glue::glue("{Sys.time()}: Invalid arguments or no cumulative team stats data available for {team_id}!"))
    },
    warning = function(w) {
    },
    finally = {
    }
  )
  return(df_list)
}
#' **Get WNBA Stats API Cumulative Team Game Stats**
#' @name wnba_cumestatsteamgames
NULL
#' @title
#' **Get WNBA Stats API Cumulative Team Game Stats**
#' @rdname wnba_cumestatsteamgames
#' @author Saiem Gilani
#' @param league_id league_id
#' @param location location
#' @param outcome outcome
#' @param season season
#' @param season_id season_id
#' @param season_type season_type
#' @param team_id team_id
#' @param vs_conference vs_conference
#' @param vs_division vs_division
#' @param vs_team_id vs_team_id
#' @param ... Additional arguments passed to an underlying function like httr.
#' @return Returns a named list of data frames: CumeStatsTeamGames
#' 
#'    **CumeStatsTeamGames** 
#'    
#'    
#'    |col_name |types     |
#'    |:--------|:---------|
#'    |MATCHUP  |character |
#'    |GAME_ID  |character |
#'    
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows as_tibble
#' @import rvest
#' @export
#' @family WNBA Cume Functions
#' @details
#' ```r
#'   wnba_cumestatsteamgames(team_id = 1611661317, season = "2021-22")
#' ``
wnba_cumestatsteamgames <- function(
  league_id = '10',
  location = '',
  outcome = '',
  season = '2021-22',
  season_id = '',
  season_type = 'Regular Season',
  team_id = 1611661317,
  vs_conference = '',
  vs_division = '',
  vs_team_id = '',
  ...){
  
  #intentional
  # season_type <- gsub(' ','+',season_type)
  version <- "cumestatsteamgames"
  endpoint <- wnba_endpoint(version)
  
  full_url <- paste0(endpoint,
                     "?LeagueID=", league_id,
                     "&Location=", location,
                     "&Outcome=", outcome,
                     "&Season=", season,
                     "&SeasonID=", season_id,
                     "&SeasonType=", season_type,
                     "&TeamID=", team_id,
                     "&VsConference=", vs_conference,
                     "&VsDivision=", vs_division,
                     "&VsTeamID=", vs_team_id)
  tryCatch(
    expr = {
      resp <- request_with_proxy(url = full_url, ...)
      
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
      message(glue::glue("{Sys.time()}: Invalid arguments or no cumulative team game stats data available for {team_id}!"))
    },
    warning = function(w) {
    },
    finally = {
    }
  )
  return(df_list)
}
