
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
#'    |col_name     |types     |description                                           |
#'    |:------------|:---------|:-----------------------------------------------------|
#'    |draft_id     |integer   |Unique identifier for draft.                          |
#'    |title        |character |Title or label for the record.                        |
#'    |season       |integer   |Season identifier (4-digit year or 'YYYY-YY' string). |
#'    |status       |character |Status label.                                         |
#'    |on_the_clock |character |On the clock.                                         |
#'    |draft_date   |character |Date in YYYY-MM-DD format.                            |
#'    |modified     |character |Modified.                                             |
#'
#'    **picks**
#'
#'    |col_name         |types     |description                                     |
#'    |:----------------|:---------|:-----------------------------------------------|
#'    |round            |integer   |Tournament / playoff round.                     |
#'    |pick             |integer   |Pick.                                           |
#'    |team_id          |integer   |Unique team identifier.                         |
#'    |team_external_id |integer   |Unique identifier for team external.            |
#'    |team_name        |character |Full team display name (e.g. 'Las Vegas Aces'). |
#'    |prospect_id      |integer   |Unique identifier for prospect.                 |
#'    |first_name       |character |Player's first name.                            |
#'    |last_name        |character |Player's last name.                             |
#'    |position         |character |Listed roster position (G, F, C, etc.).         |
#'    |country          |character |Country (full name or code).                    |
#'    |college          |character |College or school attended.                     |
#'    |ppg              |character |Points per game.                                |
#'    |rpg              |character |Rebounds per game.                              |
#'    |apg              |character |Assists per game.                               |
#'    |spg              |character |Steals per game.                                |
#'    |bpg              |character |Blocks per game.                                |
#'    |fg_pct           |character |Field goal percentage (0-1).                    |
#'    |description      |character |Long-form description text.                     |
#'    |headshot_url     |character |URL for headshot.                               |
#'
#' @importFrom jsonlite fromJSON
#' @importFrom dplyr as_tibble
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
  .args <- mget(setdiff(names(formals()), "..."))

  endpoint <- sprintf(
    "https://content-api-prod.nba.com/public/1/leagues/wnba/draft/%s/board",
    season
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
      res <- .retry_request(endpoint, headers = headers)

      resp <- res %>%
        .resp_text() %>%
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
    error = function(e) .report_api_error(
      e,
      hint = "Invalid arguments or no draft board data available for {season}!",
      args = .args
    ),
    warning = function(w) .report_api_warning(w, args = .args),
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
#'    |col_name                     |types     |description                                           |
#'    |:----------------------------|:---------|:-----------------------------------------------------|
#'    |SEASON                       |character |Season identifier (4-digit year or 'YYYY-YY' string). |
#'    |PLAYER_ID                    |character |Unique player identifier.                             |
#'    |FIRST_NAME                   |character |Player's first name.                                  |
#'    |LAST_NAME                    |character |Player's last name.                                   |
#'    |PLAYER_NAME                  |character |Player name.                                          |
#'    |POSITION                     |character |Listed roster position (G, F, C, etc.).               |
#'    |HEIGHT_WO_SHOES              |character |                                                      |
#'    |HEIGHT_WO_SHOES_FT_IN        |character |                                                      |
#'    |HEIGHT_W_SHOES               |character |                                                      |
#'    |HEIGHT_W_SHOES_FT_IN         |character |                                                      |
#'    |WEIGHT                       |character |Player weight in pounds.                              |
#'    |WINGSPAN                     |character |                                                      |
#'    |WINGSPAN_FT_IN               |character |                                                      |
#'    |STANDING_REACH               |character |                                                      |
#'    |STANDING_REACH_FT_IN         |character |                                                      |
#'    |BODY_FAT_PCT                 |character |                                                      |
#'    |HAND_LENGTH                  |character |                                                      |
#'    |HAND_WIDTH                   |character |                                                      |
#'    |STANDING_VERTICAL_LEAP       |character |                                                      |
#'    |MAX_VERTICAL_LEAP            |character |                                                      |
#'    |LANE_AGILITY_TIME            |character |                                                      |
#'    |MODIFIED_LANE_AGILITY_TIME   |character |                                                      |
#'    |THREE_QUARTER_SPRINT         |character |                                                      |
#'    |BENCH_PRESS                  |character |                                                      |
#'    |SPOT_FIFTEEN_CORNER_LEFT     |character |                                                      |
#'    |SPOT_FIFTEEN_BREAK_LEFT      |character |                                                      |
#'    |SPOT_FIFTEEN_TOP_KEY         |character |                                                      |
#'    |SPOT_FIFTEEN_BREAK_RIGHT     |character |                                                      |
#'    |SPOT_FIFTEEN_CORNER_RIGHT    |character |                                                      |
#'    |SPOT_COLLEGE_CORNER_LEFT     |character |                                                      |
#'    |SPOT_COLLEGE_BREAK_LEFT      |character |                                                      |
#'    |SPOT_COLLEGE_TOP_KEY         |character |                                                      |
#'    |SPOT_COLLEGE_BREAK_RIGHT     |character |                                                      |
#'    |SPOT_COLLEGE_CORNER_RIGHT    |character |                                                      |
#'    |SPOT_NBA_CORNER_LEFT         |character |                                                      |
#'    |SPOT_NBA_BREAK_LEFT          |character |                                                      |
#'    |SPOT_NBA_TOP_KEY             |character |                                                      |
#'    |SPOT_NBA_BREAK_RIGHT         |character |                                                      |
#'    |SPOT_NBA_CORNER_RIGHT        |character |                                                      |
#'    |OFF_DRIB_FIFTEEN_BREAK_LEFT  |character |                                                      |
#'    |OFF_DRIB_FIFTEEN_TOP_KEY     |character |                                                      |
#'    |OFF_DRIB_FIFTEEN_BREAK_RIGHT |character |                                                      |
#'    |OFF_DRIB_COLLEGE_BREAK_LEFT  |character |                                                      |
#'    |OFF_DRIB_COLLEGE_TOP_KEY     |character |                                                      |
#'    |OFF_DRIB_COLLEGE_BREAK_RIGHT |character |                                                      |
#'    |ON_MOVE_FIFTEEN              |character |                                                      |
#'    |ON_MOVE_COLLEGE              |character |                                                      |
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
  .args <- mget(setdiff(names(formals()), "..."))
  
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
    error = function(e) .report_api_error(
      e,
      hint = "Invalid arguments or no draft combine stats data available for {season_year}!",
      args = .args
    ),
    warning = function(w) .report_api_warning(w, args = .args),
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
  .args <- mget(setdiff(names(formals()), "..."))
  
  
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
    error = function(e) .report_api_error(
      e,
      hint = "Invalid arguments or no draft combine drill results data available for {season_year}!",
      args = .args
    ),
    warning = function(w) .report_api_warning(w, args = .args),
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
  .args <- mget(setdiff(names(formals()), "..."))
  
  
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
    error = function(e) .report_api_error(
      e,
      hint = "Invalid arguments or no draft combine stationary shooting data available for {season_year}!",
      args = .args
    ),
    warning = function(w) .report_api_warning(w, args = .args),
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
  .args <- mget(setdiff(names(formals()), "..."))
  
  
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
    error = function(e) .report_api_error(
      e,
      hint = "Invalid arguments or no draft combine player anthropological data available for {season_year}!",
      args = .args
    ),
    warning = function(w) .report_api_warning(w, args = .args),
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
  .args <- mget(setdiff(names(formals()), "..."))
  
  
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
    error = function(e) .report_api_error(
      e,
      hint = "Invalid arguments or no draft combine spot shooting data available for {season_year}!",
      args = .args
    ),
    warning = function(w) .report_api_warning(w, args = .args),
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
#'    |col_name            |types     |description                                           |
#'    |:-------------------|:---------|:-----------------------------------------------------|
#'    |PERSON_ID           |character |Unique player identifier (V3 endpoints).              |
#'    |PLAYER_NAME         |character |Player name.                                          |
#'    |SEASON              |character |Season identifier (4-digit year or 'YYYY-YY' string). |
#'    |ROUND_NUMBER        |character |Numeric round.                                        |
#'    |ROUND_PICK          |character |Round pick.                                           |
#'    |OVERALL_PICK        |character |Overall pick.                                         |
#'    |DRAFT_TYPE          |character |                                                      |
#'    |TEAM_ID             |character |Unique team identifier.                               |
#'    |TEAM_CITY           |character |Team city or region (e.g. 'Las Vegas').               |
#'    |TEAM_NAME           |character |Full team display name (e.g. 'Las Vegas Aces').       |
#'    |TEAM_ABBREVIATION   |character |Short team abbreviation (e.g. 'LAS').                 |
#'    |ORGANIZATION        |character |Organization.                                         |
#'    |ORGANIZATION_TYPE   |character |Organization type.                                    |
#'    |PLAYER_PROFILE_FLAG |character |Player profile flag.                                  |
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
  .args <- mget(setdiff(names(formals()), "..."))
  
  
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
    error = function(e) .report_api_error(
      e,
      hint = "Invalid arguments or no draft history data available for {season}!",
      args = .args
    ),
    warning = function(w) .report_api_warning(w, args = .args),
    finally = {
    }
  )
  return(df_list)
}
