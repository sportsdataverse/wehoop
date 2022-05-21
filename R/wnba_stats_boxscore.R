#' **Get WNBA Stats API Boxscore Traditional V2**
#' @name bs_tradv2
NULL
#' @title
#' **Get WNBA Stats API Boxscore Traditional V2**
#' @rdname bs_tradv2
#' @author Saiem Gilani
#' @param game_id Game ID
#' @param start_period start_period
#' @param end_period end_period
#' @param start_range start_range
#' @param end_range end_range
#' @param range_type range_type
#' @return A list of data frames: PlayerStats, TeamStarterBenchStats, TeamStats
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows as_tibble
#' @import rvest
#' @export
wnba_boxscoretraditionalv2 <- function(
  game_id,
  start_period=0,
  end_period=14,
  start_range=0,
  end_range=0,
  range_type=0){
  
  version <- "boxscoretraditionalv2"
  endpoint <- wnba_endpoint(version)
  
  full_url <- paste0(endpoint,
                     "?EndPeriod=", end_period,
                     "&EndRange=", end_range,
                     "&GameID=",pad_id(game_id),
                     "&RangeType=", range_type,
                     "&StartPeriod=",start_period,
                     "&StartRange=", start_range)
  tryCatch(
    expr={
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
#' @name bs_advv2
NULL
#' @title
#' **Get WNBA Stats API Boxscore Advanced V2**
#' @rdname bs_advv2
#' @author Saiem Gilani
#' @param game_id Game ID
#' @param start_period start_period
#' @param end_period end_period
#' @param start_range start_range
#' @param end_range end_range
#' @param range_type range_type
#' @return Returns a named list of data frames: PlayerStats, TeamStats
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows as_tibble
#' @import rvest
#' @export
wnba_boxscoreadvancedv2 <- function(
  game_id,
  start_period=0,
  end_period=14,
  start_range=0,
  end_range=0,
  range_type=0){
  
  version <- "boxscoreadvancedv2"
  endpoint <- wnba_endpoint(version)
  
  
  full_url <- paste0(endpoint,
                     "?EndPeriod=", end_period,
                     "&EndRange=", end_range,
                     "&GameID=",pad_id(game_id),
                     "&RangeType=", range_type,
                     "&StartPeriod=",start_period,
                     "&StartRange=", start_range)
  
  tryCatch(
    expr={
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
#' @name bs_ffv2
NULL
#' @title
#' **Get WNBA Stats API Boxscore Four Factors V2**
#' @rdname bs_ffv2
#' @author Saiem Gilani
#' @param game_id Game ID
#' @param start_period start_period
#' @param end_period end_period
#' @param start_range start_range
#' @param end_range end_range
#' @param range_type range_type
#' @return Returns a named list of data frames: sqlPlayersFourFactors, sqlTeamFourFactors
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows as_tibble
#' @import rvest
#' @export
wnba_boxscorefourfactorsv2 <- function(
  game_id,
  start_period=0,
  end_period=14,
  start_range=0,
  end_range=0,
  range_type=0){
  
  version <- "boxscorefourfactorsv2"
  endpoint <- wnba_endpoint(version)
  
  full_url <- paste0(endpoint,
                     "?EndPeriod=", end_period,
                     "&EndRange=", end_range,
                     "&GameID=",pad_id(game_id),
                     "&RangeType=", range_type,
                     "&StartPeriod=",start_period,
                     "&StartRange=", start_range)
  tryCatch(
    expr={
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
#' @name bs_miscv2
NULL
#' @title
#' **Get WNBA Stats API Boxscore Misc V2**
#' @rdname bs_miscv2
#' @author Saiem Gilani
#' @param game_id Game ID
#' @param start_period start_period
#' @param end_period end_period
#' @param start_range start_range
#' @param end_range end_range
#' @param range_type range_type
#' @return Returns a named list of data frames: sqlPlayersMisc, sqlTeamsMisc
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows as_tibble
#' @import rvest
#' @export
wnba_boxscoremiscv2 <- function(
  game_id,
  start_period=0,
  end_period=14,
  start_range=0,
  end_range=0,
  range_type=0){
  
  version <- "boxscoremiscv2"
  endpoint <- wnba_endpoint(version)
  
  full_url <- paste0(endpoint,
                     "?EndPeriod=", end_period,
                     "&EndRange=", end_range,
                     "&GameID=",pad_id(game_id),
                     "&RangeType=", range_type,
                     "&StartPeriod=",start_period,
                     "&StartRange=", start_range)
  tryCatch(
    expr={
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
#' @name bs_scoringv2
NULL
#' @title
#' **Get WNBA Stats API Boxscore Scoring V2**
#' @rdname bs_scoringv2
#' @author Saiem Gilani
#' @param game_id Game ID
#' @param start_period start_period
#' @param end_period end_period
#' @param start_range start_range
#' @param end_range end_range
#' @param range_type range_type
#' @return Returns a named list of data frames: sqlPlayersScoring, sqlTeamsScoring
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows as_tibble
#' @import rvest
#' @export
wnba_boxscorescoringv2 <- function(
  game_id,
  start_period=0,
  end_period=14,
  start_range=0,
  end_range=0,
  range_type=0){
  
  version <- "boxscorescoringv2"
  endpoint <- wnba_endpoint(version)
  
  full_url <- paste0(endpoint,
                     "?EndPeriod=", end_period,
                     "&EndRange=", end_range,
                     "&GameID=",pad_id(game_id),
                     "&RangeType=", range_type,
                     "&StartPeriod=",start_period,
                     "&StartRange=", start_range)
  tryCatch(
    expr={
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
#' @name bs_usagev2
NULL
#' @title
#' **Get WNBA Stats API Boxscore Usage V2**
#' @rdname bs_usagev2
#' @author Saiem Gilani
#' @param game_id Game ID
#' @param start_period start_period
#' @param end_period end_period
#' @param start_range start_range
#' @param end_range end_range
#' @param range_type range_type
#' @return Returns a named list of data frames: sqlPlayersUsage, sqlTeamsUsage
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows as_tibble
#' @import rvest
#' @export
wnba_boxscoreusagev2 <- function(
  game_id,
  start_period=0,
  end_period=14,
  start_range=0,
  end_range=0,
  range_type=0){
  
  version <- "boxscoreusagev2"
  endpoint <- wnba_endpoint(version)
  
  full_url <- paste0(endpoint,
                     "?EndPeriod=", end_period,
                     "&EndRange=", end_range,
                     "&GameID=",pad_id(game_id),
                     "&RangeType=", range_type,
                     "&StartPeriod=",start_period,
                     "&StartRange=", start_range)
  tryCatch(
    expr={
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
#' @name bs_summaryv2
NULL
#' @title
#' **Get WNBA Stats API Boxscore Summary V2**
#' @rdname bs_summaryv2
#' @author Saiem Gilani
#' @param game_id Game ID
#' @return Returns a named list of data frames: AvailableVideo, GameInfo, GameSummary, InactivePlayers, LastMeeting, LineScore, Officials, OtherStats, SeasonSeries
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows as_tibble
#' @import rvest
#' @export
wnba_boxscoresummaryv2 <- function(game_id){
  
  version <- "boxscoresummaryv2"
  endpoint <- wnba_endpoint(version)
  
  full_url <- paste0(endpoint,
                     "?GameID=",pad_id(game_id))
  tryCatch(
    expr={
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
#' @name bs_pt_v2
NULL
#' @title
#' **Get WNBA Stats API Boxscore Player Tracking V2**
#' @rdname bs_pt_v2
#' @author Saiem Gilani
#' @param game_id Game ID
#' @return Returns a named list of data frames: PlayerStats, TeamStats
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows as_tibble
#' @import rvest
#' @export
wnba_boxscoreplayertrackv2 <- function(game_id){
  
  version <- "boxscoreplayertrackv2"
  endpoint <- wnba_endpoint(version)
  
  full_url <- paste0(endpoint,
                     "?GameID=",pad_id(game_id))
  tryCatch(
    expr={
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
#' @name hustle_bs
NULL
#' @title
#' **Get WNBA Stats API Hustle Stats Boxscore**
#' @rdname hustle_bs
#' @author Saiem Gilani
#' @param game_id Game ID
#' @return Returns a named list of data frames: HustleStatsAvailable, PlayerStats, TeamStats
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows as_tibble
#' @import rvest
#' @export
wnba_hustlestatsboxscore <- function(game_id){
  
  version <- "hustlestatsboxscore"
  endpoint <- wnba_endpoint(version)
  
  full_url <- paste0(endpoint,
                     "?GameID=",pad_id(game_id))
  tryCatch(
    expr={
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
      message(glue::glue("{Sys.time()}: Invalid arguments or no hustle stats boxscore data for {game_id} available!"))
    },
    warning = function(w) {
    },
    finally = {
    }
  )
  return(df_list)
}
