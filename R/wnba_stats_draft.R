
#' **Get WNBA Stats API Draft Board**
#' @name dboard
NULL
#' @title
#' **Get WNBA Stats API Draft Board**
#' @rdname dboard
#' @author Saiem Gilani
#' @param season season
#' @return Returns a named list of data frames: teams,draft_info, picks
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows as_tibble
#' @import rvest
#' @export
wnba_draftboard <- function(season = '2022'){
  
  
  version <- "draftboard"
  endpoint <- "https://www.wnba.com/wp-json/api/v1/get_draft_board"
  
  full_url <- paste0(endpoint,
                     "?season=", season)
  
  tryCatch(
    expr = {
      res <- httr::RETRY("GET", full_url)
      resp <-  res %>%
        httr::content(as = "text", encoding = "UTF-8") %>%
        jsonlite::fromJSON()
      
      teams <- data.table::rbindlist(resp$teams) 
      draft <- dplyr::bind_rows(resp$draft) 
      rounds <- resp$rounds
      rounds$draft_lineup <- NULL
      rounds_df <- purrr::map_df(1:length(rounds),function(x){
        rounds[[x]] %>% 
          tidyr::unnest(.data$player, names_sep="_") %>% 
          dplyr::mutate(round=x)
      })
      df_list <- c(list(teams),list(draft),list(rounds_df))
      names(df_list) <- c("teams","draft_info","picks")
      
    },
    error = function(e) {
      message(glue::glue("{Sys.time()}: Invalid arguments or no draft board data available for {season}!"))
    },
    warning = function(w) {
    },
    finally = {
    }
  )
  return(df_list)
}


#' **Get WNBA Stats API Draft Combine Stats**
#' @name dcombine_stats
NULL
#' @title
#' **Get WNBA Stats API Draft Combine Stats**
#' @rdname dcombine_stats
#' @author Saiem Gilani
#' @param league_id league_id
#' @param season_year season_year
#' @return Returns a named list of data frames: DraftCombineStats
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows as_tibble
#' @import rvest
#' @export
wnba_draftcombinestats <- function(league_id='10',
                                  season_year = '2020'){
  
  
  version <- "draftcombinestats"
  endpoint <- wnba_endpoint(version)
  
  full_url <- paste0(endpoint,
                     "?LeagueID=",league_id,
                     "&SeasonYear=",season_year)
  
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
      message(glue::glue("{Sys.time()}: Invalid arguments or no draft combine stats data available for {season_year}!"))
    },
    warning = function(w) {
    },
    finally = {
    }
  )
  return(df_list)
}


#' **Get WNBA Stats API Draft Combine Drill Results**
#' @name dcombine_drill
NULL
#' @title
#' **Get WNBA Stats API Draft Combine Drill Results**
#' @rdname dcombine_drill
#' @author Saiem Gilani
#' @param league_id league_id
#' @param season_year season_year
#' @return Returns a named list of data frames: Results
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows as_tibble
#' @import rvest
#' @export
wnba_draftcombinedrillresults <- function(league_id='10',
                                         season_year = '2020'){
  
  
  version <- "draftcombinedrillresults"
  endpoint <- wnba_endpoint(version)
  
  full_url <- paste0(endpoint,
                     "?LeagueID=",league_id,
                     "&SeasonYear=",season_year)
  
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
      message(glue::glue("{Sys.time()}: Invalid arguments or no draft combine drill results data available for {season_year}!"))
    },
    warning = function(w) {
    },
    finally = {
    }
  )
  return(df_list)
}


#' **Get WNBA Stats API Draft Combine Non-Stationary Shooting**
#' @name dcombine_nsshooting
NULL
#' @title
#' **Get WNBA Stats API Draft Combine Non-Stationary Shooting**
#' @rdname dcombine_nsshooting
#' @author Saiem Gilani
#' @param league_id league_id
#' @param season_year season_year
#' @return Returns a named list of data frames: Results
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows as_tibble
#' @import rvest
#' @export
wnba_draftcombinenonstationaryshooting <- function(league_id='10',
                                                  season_year = '2020'){
  
  
  version <- "draftcombinenonstationaryshooting"
  endpoint <- wnba_endpoint(version)
  
  full_url <- paste0(endpoint,
                     "?LeagueID=",league_id,
                     "&SeasonYear=",season_year)
  
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
      message(glue::glue("{Sys.time()}: Invalid arguments or no draft combine stationary shooting data available for {season_year}!"))
    },
    warning = function(w) {
    },
    finally = {
    }
  )
  return(df_list)
}


#' **Get WNBA Stats API Draft Combine Player Anthropological Measurements**
#' @name dcombine_anthro
NULL
#' @title
#' **Get WNBA Stats API Draft Combine Player Anthropological Measurements**
#' @rdname dcombine_anthro
#' @author Saiem Gilani
#' @param league_id league_id
#' @param season_year season_year
#' @return Returns a named list of data frames: Results
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows as_tibble
#' @import rvest
#' @export
wnba_draftcombineplayeranthro <- function(league_id='10',
                                         season_year = '2020'){
  
  
  version <- "draftcombineplayeranthro"
  endpoint <- wnba_endpoint(version)
  
  full_url <- paste0(endpoint,
                     "?LeagueID=",league_id,
                     "&SeasonYear=",season_year)
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
      message(glue::glue("{Sys.time()}: Invalid arguments or no draft combine player anthropological data available for {season_year}!"))
    },
    warning = function(w) {
    },
    finally = {
    }
  )
  return(df_list)
}

#' **Get WNBA Stats API Draft Combine - Spot Shooting**
#' @name dcombine_sshooting
NULL
#' @title
#' **Get WNBA Stats API Draft Combine - Spot Shooting**
#' @rdname dcombine_sshooting
#' @author Saiem Gilani
#' @param league_id league_id
#' @param season_year season_year
#' @return Returns a named list of data frames: Results
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows as_tibble
#' @import rvest
#' @export
wnba_draftcombinespotshooting <- function(league_id='10',
                                         season_year = '2020'){
  
  
  version <- "draftcombinespotshooting"
  endpoint <- wnba_endpoint(version)
  
  full_url <- paste0(endpoint,
                     "?LeagueID=",league_id,
                     "&SeasonYear=",season_year)
  
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
      message(glue::glue("{Sys.time()}: Invalid arguments or no draft combine spot shooting data available for {season_year}!"))
    },
    warning = function(w) {
    },
    finally = {
    }
  )
  return(df_list)
}

#' @title
#' **Get WNBA Stats API Draft History**
#' @rdname dhistory
#' @author Saiem Gilani
#' @param league_id league_id
#' @param college college
#' @param overall_pick overall_pick
#' @param round_pick round_pick
#' @param round_num round_num
#' @param season season
#' @param team_id team_id
#' @param top_x top_x
#' @return Returns a named list of data frames: DraftHistory
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows as_tibble
#' @import rvest
#' @export
wnba_drafthistory <- function(league_id='10',
                             college = '',
                             overall_pick = '',
                             round_pick = '',
                             round_num = '',
                             season = '2019',
                             team_id = '',
                             top_x = ''){
  
  
  version <- "drafthistory"
  endpoint <- wnba_endpoint(version)
  
  full_url <- paste0(endpoint,
                     "?College=", college,
                     "&LeagueID=",league_id,
                     "&OverallPick=", overall_pick,
                     "&RoundNum=", round_num,
                     "&RoundPick=", round_pick,
                     "&Season=", season,
                     "&TeamID=", team_id,
                     "&TopX=", top_x)
  
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
      message(glue::glue("{Sys.time()}: Invalid arguments or no draft history data available for {season}!"))
    },
    warning = function(w) {
    },
    finally = {
    }
  )
  return(df_list)
}