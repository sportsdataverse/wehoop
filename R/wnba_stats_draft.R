
#' **Get WNBA Stats API Draft Board**
#' @name wnba_draftboard
NULL
#' @title
#' **Get WNBA Stats API Draft Board**
#' @rdname wnba_draftboard
#' @author Saiem Gilani
#' @param season Draft year as numeric or character (e.g. `2026`).
#' @param ... Additional arguments passed to an underlying function like httr.
#' @return Returns a named list of tibbles: `board`, `picks`.
#'
#'    **board**
#'
#'    |col_name      |types     |
#'    |:-------------|:---------|
#'    |draft_id      |integer   |
#'    |title         |character |
#'    |season        |integer   |
#'    |status        |character |
#'    |on_the_clock  |character |
#'    |draft_date    |character |
#'    |modified      |character |
#'
#'    **picks**
#'
#'    |col_name         |types     |
#'    |:----------------|:---------|
#'    |round            |integer   |
#'    |pick             |integer   |
#'    |team_id          |integer   |
#'    |team_external_id |integer   |
#'    |team_name        |character |
#'    |prospect_id      |integer   |
#'    |first_name       |character |
#'    |last_name        |character |
#'    |position         |character |
#'    |country          |character |
#'    |college          |character |
#'    |ppg              |character |
#'    |rpg              |character |
#'    |apg              |character |
#'    |spg              |character |
#'    |bpg              |character |
#'    |fg_pct           |character |
#'    |description      |character |
#'    |headshot_url     |character |
#'
#' @importFrom jsonlite fromJSON
#' @importFrom dplyr as_tibble
#' @importFrom glue glue
#' @importFrom purrr map_dfr
#' @importFrom rlang %||%
#' @export
#' @family WNBA Draft Functions
#' @details
#' ```r
#'   wnba_draftboard(season = most_recent_wnba_season())
#' ```
wnba_draftboard <- function(
    season = most_recent_wnba_season(),
    ...){

  endpoint <- glue::glue(
    "https://content-api-prod.nba.com/public/1/leagues/wnba/draft/{season}/board"
  )

  headers <- c(
    "accept" = "*/*",
    "accept-language" = "en-US,en;q=0.9",
    "origin" = "https://www.wnba.com",
    "referer" = "https://www.wnba.com/",
    "user-agent" = paste(
      "Mozilla/5.0 (Windows NT 10.0; Win64; x64)",
      "AppleWebKit/537.36 (KHTML, like Gecko)",
      "Chrome/146.0.0.0 Safari/537.36"
    )
  )

  df_list <- list()

  tryCatch(
    expr = {
      res <- httr::RETRY(
        "GET", endpoint,
        httr::add_headers(.headers = headers),
        ...
      )

      resp <- res %>%
        httr::content(as = "text", encoding = "UTF-8") %>%
        jsonlite::fromJSON(simplifyDataFrame = FALSE)

      board <- resp$results$board

      board_df <- data.frame(
        draft_id = as.integer(board$id %||% NA_integer_),
        title = as.character(board$title %||% NA_character_),
        season = as.integer(season),
        status = as.character(board$draftInformation$status %||% NA_character_),
        on_the_clock = as.character(board$draftInformation$onTheClock %||% NA_character_),
        draft_date = as.character(board$draftInformation$date %||% NA_character_),
        modified = as.character(board$modified %||% NA_character_),
        stringsAsFactors = FALSE
      ) %>%
        dplyr::as_tibble() %>%
        make_wehoop_data(
          "WNBA Draft Board information from content-api-prod.nba.com",
          Sys.time()
        )

      picks_df <- purrr::map_dfr(board$draftRounds, function(rnd) {
        purrr::map_dfr(rnd$picks, function(p) {
          career <- p$career %||% list()
          data.frame(
            round = as.integer(rnd$round %||% NA_integer_),
            pick = as.integer(p$pick %||% NA_integer_),
            team_id = as.integer(p$teamId %||% NA_integer_),
            team_external_id = as.integer(p$teamExternalId %||% NA_integer_),
            team_name = as.character(p$teamName %||% NA_character_),
            prospect_id = as.integer(p$prospectId %||% NA_integer_),
            first_name = as.character(p$firstName %||% NA_character_),
            last_name = as.character(p$lastName %||% NA_character_),
            position = as.character(p$position %||% NA_character_),
            country = as.character(p$country %||% NA_character_),
            college = as.character(p$college %||% NA_character_),
            ppg = as.character(career$ppg %||% NA_character_),
            rpg = as.character(career$rpg %||% NA_character_),
            apg = as.character(career$apg %||% NA_character_),
            spg = as.character(career$spg %||% NA_character_),
            bpg = as.character(career$bpg %||% NA_character_),
            fg_pct = as.character(career[["fg%"]] %||% NA_character_),
            description = as.character(career$description %||% NA_character_),
            headshot_url = as.character(p$headshot$url %||% NA_character_),
            stringsAsFactors = FALSE
          )
        })
      }) %>%
        dplyr::as_tibble() %>%
        make_wehoop_data(
          "WNBA Draft Board picks from content-api-prod.nba.com",
          Sys.time()
        )

      df_list <- list(
        board = board_df,
        picks = picks_df
      )
    },
    error = function(e) {
      cli::cli_alert_danger("{Sys.time()}: Invalid arguments or no draft board data available for {season}!")
      cli::cli_alert_danger("Error:\n{e}")
    },
    warning = function(w) {
      cli::cli_alert_warning("{Sys.time()}: Warning:\n{w}")
    },
    finally = {}
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
  
  df_list <- list()

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
  
  df_list <- list()

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
  
  df_list <- list()

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
  
  df_list <- list()

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
  
  df_list <- list()

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
  
  df_list <- list()

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
