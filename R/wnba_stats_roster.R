#' **Get WNBA Stats API All Players**
#' @name allplayers
NULL
#' @title
#' **Get WNBA Stats API All Players**
#' @rdname allplayers
#' @author Saiem Gilani
#' @param is_only_current_season is_only_current_season
#' @param league_id league_id
#' @param season season
#' @return Return a named list of data frames: CommonAllPlayers
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows as_tibble
#' @import rvest
#' @export
wnba_commonallplayers <- function(
  is_only_current_season=0,
  league_id='10',
  season='2022'){
  
  version <- "commonallplayers"
  endpoint <- wnba_endpoint(version)
  
  full_url <- paste0(endpoint,
                     "?IsOnlyCurrentSeason=",is_only_current_season,
                     "&LeagueID=",league_id,
                     "&Season=", season)
  tryCatch(
    expr = {
      resp <- full_url %>%
        .wnba_headers()
      
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
      message(glue::glue("{Sys.time()}: Invalid arguments or common all players data for {season} available!"))
    },
    warning = function(w) {
    },
    finally = {
    }
  )
  return(df_list)
}
#' **Get WNBA Stats API Player Info**
#' @name commonplayerinfo
NULL
#' @title
#' **Get WNBA Stats API Player Info**
#' @rdname commonplayerinfo
#' @author Saiem Gilani
#' @param league_id league_id
#' @param player_id player_id
#' @return Return a named list of data frames: AvailableSeasons
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows as_tibble
#' @import rvest
#' @export
wnba_commonplayerinfo <- function(
  league_id='10',
  player_id='202250'){
  
  version <- "commonplayerinfo"
  endpoint <- wnba_endpoint(version)
  
  full_url <- paste0(endpoint,
                     "?LeagueID=",league_id,
                     "&PlayerID=", player_id)
  tryCatch(
    expr = {
      resp <- full_url %>%
        .wnba_headers()
      
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
      message(glue::glue("{Sys.time()}: Invalid arguments or common player info data for {season} available!"))
    },
    warning = function(w) {
    },
    finally = {
    }
  )
  return(df_list)
}

#' **Get WNBA Stats API Playoff Series**
#' @name commonplayoffseries
NULL
#' @title
#' **Get WNBA Stats API Playoff Series**
#' @rdname commonplayoffseries
#' @author Saiem Gilani
#' @param league_id league_id
#' @param season season
#' @param series_id series_id
#' @return Return a named list of data frames: PlayoffSeries
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows as_tibble
#' @import rvest
#' @export
wnba_commonplayoffseries <- function(
  league_id='10',
  season = '2021',
  series_id=''){
  
  version <- "commonplayoffseries"
  endpoint <- wnba_endpoint(version)
  
  full_url <- paste0(endpoint,
                     "?LeagueID=",league_id,
                     "&Season=", season,
                     "&SeriesID=", series_id)
  tryCatch(
    expr = {
      resp <- full_url %>%
        .wnba_headers()
      
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
      message(glue::glue("{Sys.time()}: Invalid arguments or common playoff series data for {season} available!"))
    },
    warning = function(w) {
    },
    finally = {
    }
  )
  return(df_list)
}


#' **Get WNBA Stats API Team Roster**
#' @name commonteamroster
NULL
#' @title
#' **Get WNBA Stats API Team Roster**
#' @rdname commonteamroster
#' @author Saiem Gilani
#' @param league_id league_id
#' @param season season
#' @param team_id team_id
#' @return Return a named list of data frames: Coaches, CommonTeamRoster
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows as_tibble
#' @import rvest
#' @export
wnba_commonteamroster <- function(
  league_id='10',
  season = '2022',
  team_id='1611661323'){
  
  version <- "commonteamroster"
  endpoint <- wnba_endpoint(version)
  
  full_url <- paste0(endpoint,
                     "?LeagueID=",league_id,
                     "&Season=", season,
                     "&TeamID=", team_id)
  tryCatch(
    expr = {
      resp <- full_url %>%
        .wnba_headers()
      
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
      message(glue::glue("{Sys.time()}: Invalid arguments or common team roster data for {season} available!"))
    },
    warning = function(w) {
    },
    finally = {
    }
  )
  return(df_list)
}