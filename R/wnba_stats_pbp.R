
#' **Get WNBA Stats API play-by-play**
#' @name pbp
NULL
#' @title
#' **Get WNBA Stats API play-by-play**
#' @rdname pbp
#' @author Saiem Gilani
#' @param game_id Game ID
#' @param version Play-by-play version ("v2" available from 2016-17 onwards)
#' @return Returns a named list of data frames: PlayByPlay
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows as_tibble
#' @import rvest
#' @export
wnba_pbp <- function(game_id, version = "v2"){
  
  if(version=="v2"){
    endpoint <- wnba_endpoint('playbyplayv2')
  } else {
    endpoint <- wnba_endpoint('playbyplay')
  }
  
  full_url <- paste0(endpoint,
                     "?EndPeriod=0&",
                     "GameID=",pad_id(game_id),
                     "&StartPeriod=0")
  
  tryCatch(
    expr = {
      resp <- full_url %>%
        .wnba_headers()
      
      data <-
        resp$resultSets$rowSet[[1]] %>%
        data.frame(stringsAsFactors = F) %>%
        as_tibble()
      
      json_names <-
        resp$resultSets$headers[[1]]
      colnames(data) <- json_names
    },
    error = function(e) {
      message(glue::glue("{Sys.time()}: Invalid arguments or no play-by-play data for {game_id} available!"))
    },
    warning = function(w) {
    },
    finally = {
    }
  )
  return(data)
}

