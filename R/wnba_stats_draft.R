
#' **Get WNBA Stats API Draft Board**
#' @name wnba_draftboard
NULL
#' @title
#' **Get WNBA Stats API Draft Board**
#' @rdname wnba_draftboard
#' @author Saiem Gilani
#' @param season season
#' @param ... Additional arguments passed to an underlying function like httr.
#' @return Returns a named list of data frames: teams,draft_info, picks
#' 
#'    **teams** 
#'    
#'    
#'    |col_name      |types     |
#'    |:-------------|:---------|
#'    |id            |integer   |
#'    |external-id   |character |
#'    |slug          |character |
#'    |name          |character |
#'    |city          |character |
#'    |state         |character |
#'    |url           |character |
#'    |primarycolor  |character |
#'    |seconarycolor |character |
#'    
#'    **draft_info** 
#'    
#'    
#'    |col_name              |types     |
#'    |:---------------------|:---------|
#'    |draft_status          |character |
#'    |draft_modified        |integer   |
#'    |draft_title           |character |
#'    |draft_show_players    |character |
#'    |draft_id              |integer   |
#'    |draft_url             |character |
#'    |draft_location        |character |
#'    |sponsor_logo          |character |
#'    |header_image          |character |
#'    |sponsor_link          |character |
#'    |draft_date            |character |
#'    |draft_time_hh         |character |
#'    |draft_time_mm         |character |
#'    |draft_time_am         |character |
#'    |draft_time_tz         |character |
#'    |draft_round_1_channel |character |
#'    |draft_round_2_channel |character |
#'    |draft_round_3_channel |character |
#'    |draft_interval        |character |
#'    
#'    **picks** 
#'    
#'    
#'    |col_name        |types     |
#'    |:---------------|:---------|
#'    |team            |character |
#'    |details         |character |
#'    |player_name     |character |
#'    |player_id       |integer   |
#'    |player_college  |character |
#'    |player_position |character |
#'    |player_ppg      |character |
#'    |player_rpg      |character |
#'    |player_apg      |character |
#'    |player_fg       |character |
#'    |player_headshot |character |
#'    |player_url      |character |
#'    |round           |integer   |
#' 
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows as_tibble
#' @import rvest
#' @export
#' @family WNBA Draft Functions
#' @details
#' ```r
#'   wnba_draftboard(season = most_recent_wnba_season() - 1)
#' ```
wnba_draftboard <- function(
    season = most_recent_wnba_season() - 1,
    ...){
  
  
  version <- "draftboard"
  endpoint <- "https://www.wnba.com/wp-json/api/v1/get_draft_board"
  full_url <- endpoint
  
  params <- list(
    season = season
  )
  tryCatch(
    expr = {
      res <- httr::RETRY("GET", full_url, query = params, ...)
      resp <-  res %>%
        httr::content(as = "text", encoding = "UTF-8") %>%
        jsonlite::fromJSON()
      
      teams <- data.table::rbindlist(resp$teams) 
      draft <- dplyr::bind_rows(resp$draft) 
      rounds <- resp$rounds
      rounds$draft_lineup <- NULL
      rounds_df <- purrr::map_df(1:length(rounds),function(x){
        rounds[[x]] %>% 
          tidyr::unnest("player", names_sep = "_") %>% 
          dplyr::mutate(round = x)
      })
      df_list <- c(list(teams),list(draft),list(rounds_df))
      names(df_list) <- c("teams","draft_info","picks")
      
    },
    error = function(e) {
      cli::cli_alert_danger("{Sys.time()}: Invalid arguments or no draft board data available for {season}!")
      cli::cli_alert_danger("Error:\n{e}")
    },
    warning = function(w) {
      cli::cli_alert_warning("{Sys.time()}: Warning:\n{w}")
    },
    finally = {
    }
  )
  return(df_list)
}


#' **Get WNBA Stats API Draft Combine Stats**
#' @name wnba_draftcombinestats
NULL
#' @title
#' **Get WNBA Stats API Draft Combine Stats**
#' @rdname wnba_draftcombinestats
#' @author Saiem Gilani
#' @param league_id league_id
#' @param season_year season_year
#' @param ... Additional arguments passed to an underlying function like httr.
#' @return Returns a named list of data frames: DraftCombineStats
#' 
#'    **DraftCombineStats** 
#'    
#'    
#'    |col_name                     |types     |
#'    |:----------------------------|:---------|
#'    |SEASON                       |character |
#'    |PLAYER_ID                    |character |
#'    |FIRST_NAME                   |character |
#'    |LAST_NAME                    |character |
#'    |PLAYER_NAME                  |character |
#'    |POSITION                     |character |
#'    |HEIGHT_WO_SHOES              |character |
#'    |HEIGHT_WO_SHOES_FT_IN        |character |
#'    |HEIGHT_W_SHOES               |character |
#'    |HEIGHT_W_SHOES_FT_IN         |character |
#'    |WEIGHT                       |character |
#'    |WINGSPAN                     |character |
#'    |WINGSPAN_FT_IN               |character |
#'    |STANDING_REACH               |character |
#'    |STANDING_REACH_FT_IN         |character |
#'    |BODY_FAT_PCT                 |character |
#'    |HAND_LENGTH                  |character |
#'    |HAND_WIDTH                   |character |
#'    |STANDING_VERTICAL_LEAP       |character |
#'    |MAX_VERTICAL_LEAP            |character |
#'    |LANE_AGILITY_TIME            |character |
#'    |MODIFIED_LANE_AGILITY_TIME   |character |
#'    |THREE_QUARTER_SPRINT         |character |
#'    |BENCH_PRESS                  |character |
#'    |SPOT_FIFTEEN_CORNER_LEFT     |character |
#'    |SPOT_FIFTEEN_BREAK_LEFT      |character |
#'    |SPOT_FIFTEEN_TOP_KEY         |character |
#'    |SPOT_FIFTEEN_BREAK_RIGHT     |character |
#'    |SPOT_FIFTEEN_CORNER_RIGHT    |character |
#'    |SPOT_COLLEGE_CORNER_LEFT     |character |
#'    |SPOT_COLLEGE_BREAK_LEFT      |character |
#'    |SPOT_COLLEGE_TOP_KEY         |character |
#'    |SPOT_COLLEGE_BREAK_RIGHT     |character |
#'    |SPOT_COLLEGE_CORNER_RIGHT    |character |
#'    |SPOT_NBA_CORNER_LEFT         |character |
#'    |SPOT_NBA_BREAK_LEFT          |character |
#'    |SPOT_NBA_TOP_KEY             |character |
#'    |SPOT_NBA_BREAK_RIGHT         |character |
#'    |SPOT_NBA_CORNER_RIGHT        |character |
#'    |OFF_DRIB_FIFTEEN_BREAK_LEFT  |character |
#'    |OFF_DRIB_FIFTEEN_TOP_KEY     |character |
#'    |OFF_DRIB_FIFTEEN_BREAK_RIGHT |character |
#'    |OFF_DRIB_COLLEGE_BREAK_LEFT  |character |
#'    |OFF_DRIB_COLLEGE_TOP_KEY     |character |
#'    |OFF_DRIB_COLLEGE_BREAK_RIGHT |character |
#'    |ON_MOVE_FIFTEEN              |character |
#'    |ON_MOVE_COLLEGE              |character |
#' 
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows as_tibble
#' @import rvest
#' @export
#' @family WNBA Draft Functions
#' @details
#' ```r
#'   wnba_draftcombinestats(season_year = most_recent_wnba_season() - 1)
#' ```
wnba_draftcombinestats <- function(
    league_id = '10',
    season_year = most_recent_wnba_season() - 1,
    ...){
  
  version <- "draftcombinestats"
  endpoint <- wnba_endpoint(version)
  full_url <- endpoint
  
  params <- list(
    LeagueID = league_id,
    SeasonYear = season_year
  )
  
  tryCatch(
    expr = {
      
      resp <- request_with_proxy(url = full_url, params = params, ...)
      
      df_list <- wnba_stats_map_result_sets(resp)
      
    },
    error = function(e) {
      cli::cli_alert_danger("{Sys.time()}: Invalid arguments or no draft combine stats data available for {season_year}!")
      cli::cli_alert_danger("Error:\n{e}")
    },
    warning = function(w) {
      cli::cli_alert_warning("{Sys.time()}: Warning:\n{w}")
    },
    finally = {
    }
  )
  return(df_list)
}


#' **Get WNBA Stats API Draft Combine Drill Results**
#' @name wnba_draftcombinedrillresults
NULL
#' @title
#' **Get WNBA Stats API Draft Combine Drill Results**
#' @rdname wnba_draftcombinedrillresults
#' @author Saiem Gilani
#' @param league_id league_id
#' @param season_year season_year
#' @param ... Additional arguments passed to an underlying function like httr.
#' @return Returns a named list of data frames: Results
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows as_tibble
#' @import rvest
#' @export
#' @family WNBA Draft Functions
#' @details
#' (Possibly Defunct)
#' ```r
#'   wnba_draftcombinedrillresults(season_year = most_recent_wnba_season() - 2)
#' ```
wnba_draftcombinedrillresults <- function(
    league_id = '10',
    season_year = most_recent_wnba_season() - 1,
    ...){
  
  
  version <- "draftcombinedrillresults"
  endpoint <- wnba_endpoint(version)
  full_url <- endpoint
  
  params <- list(
    LeagueID = league_id,
    SeasonYear = season_year
  )
  
  tryCatch(
    expr = {
      
     resp <- request_with_proxy(url = full_url, params = params, ...)
      
      df_list <- wnba_stats_map_result_sets(resp)
      
    },
    error = function(e) {
      cli::cli_alert_danger("{Sys.time()}: Invalid arguments or no draft combine drill results data available for {season_year}!")
      cli::cli_alert_danger("Error:\n{e}")
    },
    warning = function(w) {
      cli::cli_alert_warning("{Sys.time()}: Warning:\n{w}")
    },
    finally = {
    }
  )
  return(df_list)
}


#' **Get WNBA Stats API Draft Combine Non-Stationary Shooting**
#' @name wnba_draftcombinenonstationaryshooting
NULL
#' @title
#' **Get WNBA Stats API Draft Combine Non-Stationary Shooting**
#' @rdname wnba_draftcombinenonstationaryshooting
#' @author Saiem Gilani
#' @param league_id league_id
#' @param season_year season_year
#' @param ... Additional arguments passed to an underlying function like httr.
#' @return Returns a named list of data frames: Results
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows as_tibble
#' @import rvest
#' @export
#' @family WNBA Draft Functions
#' @details
#' (Possibly Defunct)
#' ```r
#'   wnba_draftcombinenonstationaryshooting(season_year = most_recent_wnba_season() - 2)
#' ```
wnba_draftcombinenonstationaryshooting <- function(
    league_id = '10',
    season_year = most_recent_wnba_season() - 1,
    ...){
  
  
  version <- "draftcombinenonstationaryshooting"
  endpoint <- wnba_endpoint(version)
  full_url <- endpoint
  
  params <- list(
    LeagueID = league_id,
    SeasonYear = season_year
  )
  
  tryCatch(
    expr = {
      
      resp <- request_with_proxy(url = full_url, params = params, ...)
      
      df_list <- wnba_stats_map_result_sets(resp)
      
    },
    error = function(e) {
      cli::cli_alert_danger("{Sys.time()}: Invalid arguments or no draft combine stationary shooting data available for {season_year}!")
      cli::cli_alert_danger("Error:\n{e}")
    },
    warning = function(w) {
      cli::cli_alert_warning("{Sys.time()}: Warning:\n{w}")
    },
    finally = {
    }
  )
  return(df_list)
}


#' **Get WNBA Stats API Draft Combine Player Anthropological Measurements**
#' @name wnba_draftcombineplayeranthro
NULL
#' @title
#' **Get WNBA Stats API Draft Combine Player Anthropological Measurements**
#' @rdname wnba_draftcombineplayeranthro
#' @author Saiem Gilani
#' @param league_id league_id
#' @param season_year season_year
#' @param ... Additional arguments passed to an underlying function like httr.
#' @return Returns a named list of data frames: Results
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows as_tibble
#' @import rvest
#' @export
#' @family WNBA Draft Functions
#' @details
#' (Possibly Defunct)
#' ```r
#'   wnba_draftcombineplayeranthro(season_year = most_recent_wnba_season() - 2)
#' ```
wnba_draftcombineplayeranthro <- function(
    league_id = '10',
    season_year = most_recent_wnba_season() - 1,
    ...){
  
  
  version <- "draftcombineplayeranthro"
  endpoint <- wnba_endpoint(version)
  full_url <- endpoint
  
  params <- list(
    LeagueID = league_id,
    SeasonYear = season_year
  )
  
  tryCatch(
    expr = {
      
      resp <- request_with_proxy(url = full_url, params = params, ...)
      
      df_list <- wnba_stats_map_result_sets(resp)
      
    },
    error = function(e) {
      cli::cli_alert_danger("{Sys.time()}: Invalid arguments or no draft combine player anthropological data available for {season_year}!")
      cli::cli_alert_danger("Error:\n{e}")
    },
    warning = function(w) {
      cli::cli_alert_warning("{Sys.time()}: Warning:\n{w}")
    },
    finally = {
    }
  )
  return(df_list)
}

#' **Get WNBA Stats API Draft Combine - Spot Shooting**
#' @name wnba_draftcombinespotshooting
NULL
#' @title
#' **Get WNBA Stats API Draft Combine - Spot Shooting**
#' @rdname wnba_draftcombinespotshooting
#' @author Saiem Gilani
#' @param league_id league_id
#' @param season_year season_year
#' @param ... Additional arguments passed to an underlying function like httr.
#' @return Returns a named list of data frames: Results
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows as_tibble
#' @import rvest
#' @export
#' @family WNBA Draft Functions
#' @details
#' (Possibly Defunct)
#' ```r
#'   wnba_draftcombinespotshooting(season_year = most_recent_wnba_season() - 2)
#' ```
wnba_draftcombinespotshooting <- function(
    league_id = '10',
    season_year = most_recent_wnba_season() - 1,
    ...){
  
  
  version <- "draftcombinespotshooting"
  endpoint <- wnba_endpoint(version)
  full_url <- endpoint
  
  params <- list(
    LeagueID = league_id,
    SeasonYear = season_year
  )
  
  tryCatch(
    expr = {
      
      resp <- request_with_proxy(url = full_url, params = params, ...)
      
      df_list <- wnba_stats_map_result_sets(resp)
      
    },
    error = function(e) {
      cli::cli_alert_danger("{Sys.time()}: Invalid arguments or no draft combine spot shooting data available for {season_year}!")
      cli::cli_alert_danger("Error:\n{e}")
    },
    warning = function(w) {
      cli::cli_alert_warning("{Sys.time()}: Warning:\n{w}")
    },
    finally = {
    }
  )
  return(df_list)
}

#' @title
#' **Get WNBA Stats API Draft History**
#' @rdname wnba_drafthistory
#' @author Saiem Gilani
#' @param league_id league_id
#' @param college college
#' @param overall_pick overall_pick
#' @param round_pick round_pick
#' @param round_num round_num
#' @param season season
#' @param team_id team_id
#' @param top_x top_x
#' @param ... Additional arguments passed to an underlying function like httr.
#' @return Returns a named list of data frames: DraftHistory
#' 
#'    **DraftHistory** 
#'    
#'    
#'    |col_name            |types     |
#'    |:-------------------|:---------|
#'    |PERSON_ID           |character |
#'    |PLAYER_NAME         |character |
#'    |SEASON              |character |
#'    |ROUND_NUMBER        |character |
#'    |ROUND_PICK          |character |
#'    |OVERALL_PICK        |character |
#'    |DRAFT_TYPE          |character |
#'    |TEAM_ID             |character |
#'    |TEAM_CITY           |character |
#'    |TEAM_NAME           |character |
#'    |TEAM_ABBREVIATION   |character |
#'    |ORGANIZATION        |character |
#'    |ORGANIZATION_TYPE   |character |
#'    |PLAYER_PROFILE_FLAG |character |
#' 
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows as_tibble
#' @import rvest
#' @export
#' @family WNBA Draft Functions
#' @details
#' ```r
#'  wnba_drafthistory(season = most_recent_wnba_season() - 1)
#' ```
wnba_drafthistory <- function(
    league_id = '10',
    college = '',
    overall_pick = '',
    round_pick = '',
    round_num = '',
    season = most_recent_wnba_season() - 1,
    team_id = '',
    top_x = '',
    ...){
  
  
  version <- "drafthistory"
  endpoint <- wnba_endpoint(version)
  full_url <- endpoint
  
  params <- list(
    College = college,
    LeagueID = league_id,
    OverallPick = overall_pick,
    RoundNum = round_num,
    RoundPick = round_pick,
    Season = season,
    TeamID = team_id,
    TopX = top_x
  )
  
  tryCatch(
    expr = {
      
      resp <- request_with_proxy(url = full_url, params = params, ...)
      
      df_list <- wnba_stats_map_result_sets(resp)
      
    },
    error = function(e) {
      cli::cli_alert_danger("{Sys.time()}: Invalid arguments or no draft history data available for {season}!")
      cli::cli_alert_danger("Error:\n{e}")
    },
    warning = function(w) {
      cli::cli_alert_warning("{Sys.time()}: Warning:\n{w}")
    },
    finally = {
    }
  )
  return(df_list)
}
