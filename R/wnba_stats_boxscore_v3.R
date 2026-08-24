#' **Get WNBA Stats API Boxscore Traditional V3**
#' @name wnba_boxscoretraditionalv3
NULL
#' @title
#' **Get WNBA Stats API Boxscore Traditional V3**
#' @rdname wnba_boxscoretraditionalv3
#' @author Saiem Gilani
#' @param game_id Game ID
#' @param start_period start_period
#' @param end_period end_period
#' @param start_range start_range
#' @param end_range end_range
#' @param range_type range_type
#' @param ... Additional arguments passed to an underlying function like httr.
#' @return A list of data frames:
#' home_team_player_traditional, away_team_player_traditional, home_team_totals_traditional,
#' away_team_totals_traditional, home_team_starters_totals, away_team_starters_totals,
#' home_team_bench_totals, away_team_bench_totals
#'
#'    **home_team_player_traditional**
#'
#'
#'    \if{html}{\tabular{lll}{
#'       col_name \tab types \tab description \cr
#'       game_id \tab character \tab Unique game identifier. \cr
#'       away_team_id \tab integer \tab Unique identifier for the away team. \cr
#'       home_team_id \tab integer \tab Unique identifier for the home team. \cr
#'       team_id \tab integer \tab Unique team identifier. \cr
#'       team_name \tab character \tab Full team display name (e.g. 'Las Vegas Aces'). \cr
#'       team_city \tab character \tab Team city or region (e.g. 'Las Vegas'). \cr
#'       team_tricode \tab character \tab Three-letter team code (e.g. 'LAS' / 'NYL'). \cr
#'       team_slug \tab character \tab URL-safe team identifier (e.g. 'lasvegas-aces' / 'aces'). \cr
#'       person_id \tab integer \tab Unique player identifier (V3 endpoints). \cr
#'       first_name \tab character \tab Player's first name. \cr
#'       family_name \tab character \tab Player's family / last name. \cr
#'       name_i \tab character \tab Initialed name (e.g. 'A. Wilson'). \cr
#'       player_slug \tab character \tab URL-safe player identifier. \cr
#'       position \tab character \tab Listed roster position (G, F, C, etc.). \cr
#'       comment \tab character \tab Player status / inactive reason (e.g. 'DNP - Coach's Decision', 'Inactive'). \cr
#'       jersey_num \tab character \tab Jersey number worn by the player. \cr
#'       minutes \tab character \tab Minutes played, formatted MM:SS (V3 PT-duration parsed) or decimal minutes (V2). \cr
#'       field_goals_made \tab integer \tab Field goals made (2-pt + 3-pt). \cr
#'       field_goals_attempted \tab integer \tab Field goal attempts (2-pt + 3-pt). \cr
#'       field_goals_percentage \tab numeric \tab Field goal percentage (0-1 decimal). \cr
#'       three_pointers_made \tab integer \tab Three-point field goals made. \cr
#'       three_pointers_attempted \tab integer \tab Three-point field goal attempts. \cr
#'       three_pointers_percentage \tab numeric \tab Three-point field goal percentage (0-1 decimal). \cr
#'       free_throws_made \tab integer \tab Free throws made. \cr
#'       free_throws_attempted \tab integer \tab Free throw attempts. \cr
#'       free_throws_percentage \tab numeric \tab Free throw percentage (0-1 decimal). \cr
#'       rebounds_offensive \tab integer \tab Offensive rebounds. \cr
#'       rebounds_defensive \tab integer \tab Defensive rebounds. \cr
#'       rebounds_total \tab integer \tab Total rebounds. \cr
#'       assists \tab integer \tab Total assists. \cr
#'       steals \tab integer \tab Total steals. \cr
#'       blocks \tab integer \tab Total blocks. \cr
#'       turnovers \tab integer \tab Total turnovers. \cr
#'       fouls_personal \tab integer \tab Personal fouls. \cr
#'       points \tab integer \tab Points scored. \cr
#'       plus_minus_points \tab numeric \tab Plus/minus point differential while on court. \cr
#'    }}
#'    \if{latex}{See the HTML help or pkgdown reference for the column table.}
#'
#'    **away_team_player_traditional**
#'
#'
#'    Same columns as the **home_team_player_traditional** table above.
#'
#'    **home_team_totals_traditional**
#'
#'
#'    \if{html}{\tabular{lll}{
#'       col_name \tab types \tab description \cr
#'       game_id \tab character \tab Unique game identifier. \cr
#'       away_team_id \tab integer \tab Unique identifier for the away team. \cr
#'       home_team_id \tab integer \tab Unique identifier for the home team. \cr
#'       team_id \tab integer \tab Unique team identifier. \cr
#'       team_name \tab character \tab Full team display name (e.g. 'Las Vegas Aces'). \cr
#'       team_city \tab character \tab Team city or region (e.g. 'Las Vegas'). \cr
#'       team_tricode \tab character \tab Three-letter team code (e.g. 'LAS' / 'NYL'). \cr
#'       team_slug \tab character \tab URL-safe team identifier (e.g. 'lasvegas-aces' / 'aces'). \cr
#'       minutes \tab character \tab Minutes played, formatted MM:SS (V3 PT-duration parsed) or decimal minutes (V2). \cr
#'       field_goals_made \tab integer \tab Field goals made (2-pt + 3-pt). \cr
#'       field_goals_attempted \tab integer \tab Field goal attempts (2-pt + 3-pt). \cr
#'       field_goals_percentage \tab numeric \tab Field goal percentage (0-1 decimal). \cr
#'       three_pointers_made \tab integer \tab Three-point field goals made. \cr
#'       three_pointers_attempted \tab integer \tab Three-point field goal attempts. \cr
#'       three_pointers_percentage \tab numeric \tab Three-point field goal percentage (0-1 decimal). \cr
#'       free_throws_made \tab integer \tab Free throws made. \cr
#'       free_throws_attempted \tab integer \tab Free throw attempts. \cr
#'       free_throws_percentage \tab numeric \tab Free throw percentage (0-1 decimal). \cr
#'       rebounds_offensive \tab integer \tab Offensive rebounds. \cr
#'       rebounds_defensive \tab integer \tab Defensive rebounds. \cr
#'       rebounds_total \tab integer \tab Total rebounds. \cr
#'       assists \tab integer \tab Total assists. \cr
#'       steals \tab integer \tab Total steals. \cr
#'       blocks \tab integer \tab Total blocks. \cr
#'       turnovers \tab integer \tab Total turnovers. \cr
#'       fouls_personal \tab integer \tab Personal fouls. \cr
#'       points \tab integer \tab Points scored. \cr
#'       plus_minus_points \tab numeric \tab Plus/minus point differential while on court. \cr
#'    }}
#'    \if{latex}{See the HTML help or pkgdown reference for the column table.}
#'
#'    **away_team_totals_traditional**
#'
#'
#'    Same columns as the **home_team_totals_traditional** table above.
#'
#'    **home_team_starters_totals**
#'
#'
#'    \if{html}{\tabular{lll}{
#'       col_name \tab types \tab description \cr
#'       game_id \tab character \tab Unique game identifier. \cr
#'       away_team_id \tab integer \tab Unique identifier for the away team. \cr
#'       home_team_id \tab integer \tab Unique identifier for the home team. \cr
#'       team_id \tab integer \tab Unique team identifier. \cr
#'       team_name \tab character \tab Full team display name (e.g. 'Las Vegas Aces'). \cr
#'       team_city \tab character \tab Team city or region (e.g. 'Las Vegas'). \cr
#'       team_tricode \tab character \tab Three-letter team code (e.g. 'LAS' / 'NYL'). \cr
#'       team_slug \tab character \tab URL-safe team identifier (e.g. 'lasvegas-aces' / 'aces'). \cr
#'       minutes \tab character \tab Minutes played, formatted MM:SS (V3 PT-duration parsed) or decimal minutes (V2). \cr
#'       field_goals_made \tab integer \tab Field goals made (2-pt + 3-pt). \cr
#'       field_goals_attempted \tab integer \tab Field goal attempts (2-pt + 3-pt). \cr
#'       field_goals_percentage \tab numeric \tab Field goal percentage (0-1 decimal). \cr
#'       three_pointers_made \tab integer \tab Three-point field goals made. \cr
#'       three_pointers_attempted \tab integer \tab Three-point field goal attempts. \cr
#'       three_pointers_percentage \tab numeric \tab Three-point field goal percentage (0-1 decimal). \cr
#'       free_throws_made \tab integer \tab Free throws made. \cr
#'       free_throws_attempted \tab integer \tab Free throw attempts. \cr
#'       free_throws_percentage \tab numeric \tab Free throw percentage (0-1 decimal). \cr
#'       rebounds_offensive \tab integer \tab Offensive rebounds. \cr
#'       rebounds_defensive \tab integer \tab Defensive rebounds. \cr
#'       rebounds_total \tab integer \tab Total rebounds. \cr
#'       assists \tab integer \tab Total assists. \cr
#'       steals \tab integer \tab Total steals. \cr
#'       blocks \tab integer \tab Total blocks. \cr
#'       turnovers \tab integer \tab Total turnovers. \cr
#'       fouls_personal \tab integer \tab Personal fouls. \cr
#'       points \tab integer \tab Points scored. \cr
#'    }}
#'    \if{latex}{See the HTML help or pkgdown reference for the column table.}
#'
#'    **away_team_starters_totals**
#'
#'
#'    Same columns as the **home_team_starters_totals** table above.
#'
#'    **home_team_bench_totals**
#'
#'
#'    Same columns as the **home_team_starters_totals** table above.
#'
#'    **away_team_bench_totals**
#'
#'
#'    Same columns as the **home_team_starters_totals** table above.
#'
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows as_tibble
#' @import rvest
#' @export
#' @family WNBA Boxscore V3 Functions
#' @details
#' ```r
#'  wnba_boxscoretraditionalv3(game_id = "1022200034")
#' ```
wnba_boxscoretraditionalv3 <- function(
    game_id = "1022200034",
    start_period = 0,
    end_period = 14,
    start_range = 0,
    end_range = 0,
    range_type = 0,
    ...){
  .args <- mget(setdiff(names(formals()), "..."))
  
  version <- "boxscoretraditionalv3"
  endpoint <- wnba_endpoint(version)
  full_url <- endpoint
  
  params <- list(
    EndPeriod = end_period,
    EndRange = end_range,
    GameID = pad_id(game_id),
    RangeType = range_type,
    StartPeriod = start_period,
    StartRange = start_range
  )
  
  df_list <- list()

  tryCatch(
    expr = {
      
      resp <- request_with_proxy(url = full_url, params = params, ...)
      
      data <- resp %>%
        purrr::pluck("boxScoreTraditional") %>%
        dplyr::as_tibble()
      
      ids_df <- data %>%
        data.frame() %>%
        dplyr::select("gameId","awayTeamId","homeTeamId") %>%
        dplyr::distinct()
      
      home_team_data <- data %>%
        purrr::pluck("homeTeam")
      
      home_team_info <- data.frame(
        team_id = home_team_data %>% purrr::pluck("teamId"),
        team_name = home_team_data %>% purrr::pluck("teamName"),
        team_city = home_team_data %>% purrr::pluck("teamCity"),
        team_tricode = home_team_data %>% purrr::pluck("teamTricode"),
        team_slug = home_team_data %>% purrr::pluck("teamSlug")
      )
      
      home_team_totals <- home_team_data %>%
        purrr::pluck("statistics") %>%
        data.frame(stringsAsFactors = F)
      
      home_team_starters <- home_team_data %>%
        purrr::pluck("starters") %>%
        data.frame()
      
      home_team_bench <- home_team_data %>%
        purrr::pluck("bench") %>%
        data.frame()
      
      home_team_players <- home_team_data %>%
        purrr::pluck("players") %>%
        data.frame(stringsAsFactors = F) %>%
        tidyr::unnest("statistics")
      
      home_team_totals <- ids_df %>%
        dplyr::bind_cols(home_team_info) %>%
        dplyr::bind_cols(home_team_totals) %>%
        janitor::clean_names() %>%
        make_wehoop_data("WNBA Home Team Boxscore Information from WNBA.com", Sys.time())
      
      home_team_starters <- ids_df %>%
        dplyr::bind_cols(home_team_info) %>%
        dplyr::bind_cols(home_team_starters) %>%
        janitor::clean_names() %>%
        make_wehoop_data("WNBA Home Team Starters Boxscore Information from WNBA.com", Sys.time())
      
      home_team_bench <- ids_df %>%
        dplyr::bind_cols(home_team_info) %>%
        dplyr::bind_cols(home_team_bench) %>%
        janitor::clean_names() %>%
        make_wehoop_data("WNBA Home Team Bench Boxscore Information from WNBA.com", Sys.time())
      
      home_team_players <- ids_df %>%
        dplyr::bind_cols(home_team_info) %>%
        dplyr::bind_cols(home_team_players) %>%
        janitor::clean_names() %>%
        make_wehoop_data("WNBA Home Player Boxscore Information from WNBA.com", Sys.time())
      
      
      away_team_data <- data %>%
        purrr::pluck("awayTeam")
      
      away_team_info <- data.frame(
        team_id = away_team_data %>% purrr::pluck("teamId"),
        team_name = away_team_data %>% purrr::pluck("teamName"),
        team_city = away_team_data %>% purrr::pluck("teamCity"),
        team_tricode = away_team_data %>% purrr::pluck("teamTricode"),
        team_slug = away_team_data %>% purrr::pluck("teamSlug")
      )
      
      away_team_totals <- away_team_data %>%
        purrr::pluck("statistics") %>%
        data.frame(stringsAsFactors = F)
      
      away_team_starters <- away_team_data %>%
        purrr::pluck("starters") %>%
        data.frame()
      
      away_team_bench <- away_team_data %>%
        purrr::pluck("bench") %>%
        data.frame()
      
      away_team_players <- away_team_data %>%
        purrr::pluck("players") %>%
        data.frame(stringsAsFactors = F) %>%
        tidyr::unnest("statistics")
      
      away_team_totals <- ids_df %>%
        dplyr::bind_cols(away_team_info) %>%
        dplyr::bind_cols(away_team_totals) %>%
        janitor::clean_names() %>%
        make_wehoop_data("WNBA Away Team Boxscore Information from WNBA.com", Sys.time())
      
      away_team_starters <- ids_df %>%
        dplyr::bind_cols(away_team_info) %>%
        dplyr::bind_cols(away_team_starters) %>%
        janitor::clean_names() %>%
        make_wehoop_data("WNBA Away Team Starters Boxscore Information from WNBA.com", Sys.time())
      
      away_team_bench <- ids_df %>%
        dplyr::bind_cols(away_team_info) %>%
        dplyr::bind_cols(away_team_bench) %>%
        janitor::clean_names() %>%
        make_wehoop_data("WNBA Away Team Bench Boxscore Information from WNBA.com", Sys.time())
      
      away_team_players <- ids_df %>%
        dplyr::bind_cols(away_team_info) %>%
        dplyr::bind_cols(away_team_players) %>%
        janitor::clean_names() %>%
        make_wehoop_data("WNBA Away Player Boxscore Information from WNBA.com", Sys.time())
      
      df_list <- c(
        list(home_team_players),
        list(away_team_players),
        list(home_team_totals),
        list(away_team_totals),
        list(home_team_starters),
        list(away_team_starters),
        list(home_team_bench),
        list(away_team_bench)
      )
      names(df_list) <- c(
        "home_team_player_traditional",
        "away_team_player_traditional",
        "home_team_totals_traditional",
        "away_team_totals_traditional",
        "home_team_starters_totals",
        "away_team_starters_totals",
        "home_team_bench_totals",
        "away_team_bench_totals"
      )
      
    },
    error = function(e) .report_api_error(
      e,
      hint = "Invalid arguments or no traditional boxscore v3 data for {game_id} available!",
      args = .args
    ),
    warning = function(w) .report_api_warning(w, args = .args),
    finally = {
    }
  )
  return(df_list)
}

#' @title
#' **Get WNBA Stats API Boxscore Advanced V3**
#' @rdname wnba_boxscoretraditionalv3
#' @author Saiem Gilani
#' @param game_id Game ID
#' @param start_period start_period
#' @param end_period end_period
#' @param start_range start_range
#' @param end_range end_range
#' @param range_type range_type
#' @param ... Additional arguments passed to an underlying function like httr.
#' @return A list of data frames: home_team_player_advanced, away_team_player_advanced,
#' home_team_totals_advanced, away_team_totals_advanced
#'
#'    **home_team_player_advanced**
#'
#'
#'    \if{html}{\tabular{lll}{
#'       col_name \tab types \tab description \cr
#'       game_id \tab character \tab Unique game identifier. \cr
#'       away_team_id \tab integer \tab Unique identifier for the away team. \cr
#'       home_team_id \tab integer \tab Unique identifier for the home team. \cr
#'       team_id \tab integer \tab Unique team identifier. \cr
#'       team_name \tab character \tab Full team display name (e.g. 'Las Vegas Aces'). \cr
#'       team_city \tab character \tab Team city or region (e.g. 'Las Vegas'). \cr
#'       team_tricode \tab character \tab Three-letter team code (e.g. 'LAS' / 'NYL'). \cr
#'       team_slug \tab character \tab URL-safe team identifier (e.g. 'lasvegas-aces' / 'aces'). \cr
#'       person_id \tab integer \tab Unique player identifier (V3 endpoints). \cr
#'       first_name \tab character \tab Player's first name. \cr
#'       family_name \tab character \tab Player's family / last name. \cr
#'       name_i \tab character \tab Initialed name (e.g. 'A. Wilson'). \cr
#'       player_slug \tab character \tab URL-safe player identifier. \cr
#'       position \tab character \tab Listed roster position (G, F, C, etc.). \cr
#'       comment \tab character \tab Player status / inactive reason (e.g. 'DNP - Coach's Decision', 'Inactive'). \cr
#'       jersey_num \tab character \tab Jersey number worn by the player. \cr
#'       minutes \tab character \tab Minutes played, formatted MM:SS (V3 PT-duration parsed) or decimal minutes (V2). \cr
#'       estimated_offensive_rating \tab numeric \tab Estimated offensive rating (points per 100 possessions estimate). \cr
#'       offensive_rating \tab numeric \tab Offensive rating (points per 100 possessions). \cr
#'       estimated_defensive_rating \tab numeric \tab Estimated defensive rating (points allowed per 100 possessions estimate). \cr
#'       defensive_rating \tab numeric \tab Defensive rating (points allowed per 100 possessions). \cr
#'       estimated_net_rating \tab numeric \tab Estimated net rating (off rating - def rating). \cr
#'       net_rating \tab numeric \tab Net rating (off rating - def rating). \cr
#'       assist_percentage \tab numeric \tab Assist percentage (0-1). \cr
#'       assist_to_turnover \tab numeric \tab Assist-to-turnover ratio. \cr
#'       assist_ratio \tab numeric \tab Assist ratio (assists per 100 possessions used). \cr
#'       offensive_rebound_percentage \tab numeric \tab Offensive rebound percentage (0-1). \cr
#'       defensive_rebound_percentage \tab numeric \tab Defensive rebound percentage (0-1). \cr
#'       rebound_percentage \tab numeric \tab Total rebound percentage (0-1). \cr
#'       turnover_ratio \tab numeric \tab Turnover ratio (turnovers per 100 possessions used). \cr
#'       effective_field_goal_percentage \tab numeric \tab Effective field goal percentage (0-1). \cr
#'       true_shooting_percentage \tab numeric \tab True shooting percentage (0-1). \cr
#'       usage_percentage \tab numeric \tab Usage percentage (0-1). \cr
#'       estimated_usage_percentage \tab numeric \tab Estimated usage percentage (0-1). \cr
#'       estimated_pace \tab numeric \tab Estimated possessions per 48 minutes. \cr
#'       pace \tab numeric \tab Possessions per 48 minutes. \cr
#'       pace_per40 \tab numeric \tab Pace per40. \cr
#'       possessions \tab numeric \tab Possessions used. \cr
#'       pie \tab numeric \tab Player Impact Estimate (0-1). \cr
#'    }}
#'    \if{latex}{See the HTML help or pkgdown reference for the column table.}
#'
#'    **away_team_player_advanced**
#'
#'
#'    Same columns as the **home_team_player_advanced** table above.
#'
#'    **home_team_totals_advanced**
#'
#'
#'    \if{html}{\tabular{lll}{
#'       col_name \tab types \tab description \cr
#'       game_id \tab character \tab Unique game identifier. \cr
#'       away_team_id \tab integer \tab Unique identifier for the away team. \cr
#'       home_team_id \tab integer \tab Unique identifier for the home team. \cr
#'       team_id \tab integer \tab Unique team identifier. \cr
#'       team_name \tab character \tab Full team display name (e.g. 'Las Vegas Aces'). \cr
#'       team_city \tab character \tab Team city or region (e.g. 'Las Vegas'). \cr
#'       team_tricode \tab character \tab Three-letter team code (e.g. 'LAS' / 'NYL'). \cr
#'       team_slug \tab character \tab URL-safe team identifier (e.g. 'lasvegas-aces' / 'aces'). \cr
#'       minutes \tab character \tab Minutes played, formatted MM:SS (V3 PT-duration parsed) or decimal minutes (V2). \cr
#'       estimated_offensive_rating \tab numeric \tab Estimated offensive rating (points per 100 possessions estimate). \cr
#'       offensive_rating \tab numeric \tab Offensive rating (points per 100 possessions). \cr
#'       estimated_defensive_rating \tab numeric \tab Estimated defensive rating (points allowed per 100 possessions estimate). \cr
#'       defensive_rating \tab numeric \tab Defensive rating (points allowed per 100 possessions). \cr
#'       estimated_net_rating \tab numeric \tab Estimated net rating (off rating - def rating). \cr
#'       net_rating \tab numeric \tab Net rating (off rating - def rating). \cr
#'       assist_percentage \tab numeric \tab Assist percentage (0-1). \cr
#'       assist_to_turnover \tab numeric \tab Assist-to-turnover ratio. \cr
#'       assist_ratio \tab numeric \tab Assist ratio (assists per 100 possessions used). \cr
#'       offensive_rebound_percentage \tab numeric \tab Offensive rebound percentage (0-1). \cr
#'       defensive_rebound_percentage \tab numeric \tab Defensive rebound percentage (0-1). \cr
#'       rebound_percentage \tab numeric \tab Total rebound percentage (0-1). \cr
#'       estimated_team_turnover_percentage \tab numeric \tab Estimated team turnover percentage (0-1). \cr
#'       turnover_ratio \tab numeric \tab Turnover ratio (turnovers per 100 possessions used). \cr
#'       effective_field_goal_percentage \tab numeric \tab Effective field goal percentage (0-1). \cr
#'       true_shooting_percentage \tab numeric \tab True shooting percentage (0-1). \cr
#'       usage_percentage \tab numeric \tab Usage percentage (0-1). \cr
#'       estimated_usage_percentage \tab numeric \tab Estimated usage percentage (0-1). \cr
#'       estimated_pace \tab numeric \tab Estimated possessions per 48 minutes. \cr
#'       pace \tab numeric \tab Possessions per 48 minutes. \cr
#'       pace_per40 \tab numeric \tab Pace per40. \cr
#'       possessions \tab numeric \tab Possessions used. \cr
#'       pie \tab numeric \tab Player Impact Estimate (0-1). \cr
#'    }}
#'    \if{latex}{See the HTML help or pkgdown reference for the column table.}
#'
#'    **away_team_totals_advanced**
#'
#'
#'    Same columns as the **home_team_totals_advanced** table above.
#'
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows as_tibble
#' @import rvest
#' @export
#' @family WNBA Boxscore V3 Functions
#' @details
#' ```r
#'  wnba_boxscoreadvancedv3(game_id = "1022200034")
#' ```
wnba_boxscoreadvancedv3 <- function(
    game_id = "1022200034",
    start_period = 0,
    end_period = 14,
    start_range = 0,
    end_range = 0,
    range_type = 0,
    ...){
  .args <- mget(setdiff(names(formals()), "..."))
  
  version <- "boxscoreadvancedv3"
  endpoint <- wnba_endpoint(version)
  full_url <- endpoint
  
  params <- list(
    EndPeriod = end_period,
    EndRange = end_range,
    GameID = pad_id(game_id),
    RangeType = range_type,
    StartPeriod = start_period,
    StartRange = start_range
  )
  
  df_list <- list()

  tryCatch(
    expr = {
      
      resp <- request_with_proxy(url = full_url, params = params, ...)
      
      data <- resp %>%
        purrr::pluck("boxScoreAdvanced") %>%
        dplyr::as_tibble()
      
      ids_df <- data %>%
        data.frame() %>%
        dplyr::select("gameId","awayTeamId","homeTeamId") %>%
        dplyr::distinct()
      
      home_team_data <- data %>%
        purrr::pluck("homeTeam")
      
      home_team_info <- data.frame(
        team_id = home_team_data %>% purrr::pluck("teamId"),
        team_name = home_team_data %>% purrr::pluck("teamName"),
        team_city = home_team_data %>% purrr::pluck("teamCity"),
        team_tricode = home_team_data %>% purrr::pluck("teamTricode"),
        team_slug = home_team_data %>% purrr::pluck("teamSlug")
      )
      
      home_team_totals <- home_team_data %>%
        purrr::pluck("statistics") %>%
        data.frame(stringsAsFactors = F)
      
      home_team_players <- home_team_data %>%
        purrr::pluck("players") %>%
        data.frame(stringsAsFactors = F) %>%
        tidyr::unnest("statistics")
      
      home_team_totals <- ids_df %>%
        dplyr::bind_cols(home_team_info) %>%
        dplyr::bind_cols(home_team_totals) %>%
        janitor::clean_names() %>%
        make_wehoop_data("WNBA Home Team Boxscore Information from WNBA.com", Sys.time())
      
      home_team_players <- ids_df %>%
        dplyr::bind_cols(home_team_info) %>%
        dplyr::bind_cols(home_team_players) %>%
        janitor::clean_names() %>%
        make_wehoop_data("WNBA Home Player Boxscore Information from WNBA.com", Sys.time())
      
      
      away_team_data <- data %>%
        purrr::pluck("awayTeam")
      
      away_team_info <- data.frame(
        team_id = away_team_data %>% purrr::pluck("teamId"),
        team_name = away_team_data %>% purrr::pluck("teamName"),
        team_city = away_team_data %>% purrr::pluck("teamCity"),
        team_tricode = away_team_data %>% purrr::pluck("teamTricode"),
        team_slug = away_team_data %>% purrr::pluck("teamSlug")
      )
      
      away_team_totals <- away_team_data %>%
        purrr::pluck("statistics") %>%
        data.frame(stringsAsFactors = F)
      
      away_team_players <- away_team_data %>%
        purrr::pluck("players") %>%
        data.frame(stringsAsFactors = F) %>%
        tidyr::unnest("statistics")
      
      away_team_totals <- ids_df %>%
        dplyr::bind_cols(away_team_info) %>%
        dplyr::bind_cols(away_team_totals) %>%
        janitor::clean_names() %>%
        make_wehoop_data("WNBA Away Team Boxscore Information from WNBA.com", Sys.time())
      
      away_team_players <- ids_df %>%
        dplyr::bind_cols(away_team_info) %>%
        dplyr::bind_cols(away_team_players) %>%
        janitor::clean_names() %>%
        make_wehoop_data("WNBA Away Player Boxscore Information from WNBA.com", Sys.time())
      
      df_list <- c(
        list(home_team_players),
        list(away_team_players),
        list(home_team_totals),
        list(away_team_totals)
      )
      names(df_list) <- c(
        "home_team_player_advanced",
        "away_team_player_advanced",
        "home_team_totals_advanced",
        "away_team_totals_advanced"
      )
      
    },
    error = function(e) .report_api_error(
      e,
      hint = "Invalid arguments or no advanced boxscore v3 data for {game_id} available!",
      args = .args
    ),
    warning = function(w) .report_api_warning(w, args = .args),
    finally = {
    }
  )
  return(df_list)
}


#' @title
#' **Get WNBA Stats API Boxscore Misc V3**
#' @rdname wnba_boxscoretraditionalv3
#' @author Saiem Gilani
#' @param game_id Game ID
#' @param start_period start_period
#' @param end_period end_period
#' @param start_range start_range
#' @param end_range end_range
#' @param range_type range_type
#' @param ... Additional arguments passed to an underlying function like httr.
#' @return A list of data frames:  home_team_player_misc, away_team_player_misc,
#' home_team_totals_misc, away_team_totals_misc
#'
#'    **home_team_player_misc**
#'
#'
#'    \if{html}{\tabular{lll}{
#'       col_name \tab types \tab description \cr
#'       game_id \tab character \tab Unique game identifier. \cr
#'       away_team_id \tab integer \tab Unique identifier for the away team. \cr
#'       home_team_id \tab integer \tab Unique identifier for the home team. \cr
#'       team_id \tab integer \tab Unique team identifier. \cr
#'       team_name \tab character \tab Full team display name (e.g. 'Las Vegas Aces'). \cr
#'       team_city \tab character \tab Team city or region (e.g. 'Las Vegas'). \cr
#'       team_tricode \tab character \tab Three-letter team code (e.g. 'LAS' / 'NYL'). \cr
#'       team_slug \tab character \tab URL-safe team identifier (e.g. 'lasvegas-aces' / 'aces'). \cr
#'       person_id \tab integer \tab Unique player identifier (V3 endpoints). \cr
#'       first_name \tab character \tab Player's first name. \cr
#'       family_name \tab character \tab Player's family / last name. \cr
#'       name_i \tab character \tab Initialed name (e.g. 'A. Wilson'). \cr
#'       player_slug \tab character \tab URL-safe player identifier. \cr
#'       position \tab character \tab Listed roster position (G, F, C, etc.). \cr
#'       comment \tab character \tab Player status / inactive reason (e.g. 'DNP - Coach's Decision', 'Inactive'). \cr
#'       jersey_num \tab character \tab Jersey number worn by the player. \cr
#'       minutes \tab character \tab Minutes played, formatted MM:SS (V3 PT-duration parsed) or decimal minutes (V2). \cr
#'       points_off_turnovers \tab integer \tab Points scored off opponent turnovers. \cr
#'       points_second_chance \tab integer \tab Second-chance points scored. \cr
#'       points_fast_break \tab integer \tab Fast-break points scored. \cr
#'       points_paint \tab integer \tab Points scored in the paint. \cr
#'       opp_points_off_turnovers \tab integer \tab Opponent points off turnovers. \cr
#'       opp_points_second_chance \tab integer \tab Opponent points second chance. \cr
#'       opp_points_fast_break \tab integer \tab Opponent points fast break. \cr
#'       opp_points_paint \tab integer \tab Opponent points paint. \cr
#'       blocks \tab integer \tab Total blocks. \cr
#'       blocks_against \tab integer \tab Shots blocked by opponents while attempting. \cr
#'       fouls_personal \tab integer \tab Personal fouls. \cr
#'       fouls_drawn \tab integer \tab Personal fouls drawn (by opponent's actions). \cr
#'    }}
#'    \if{latex}{See the HTML help or pkgdown reference for the column table.}
#'
#'    **away_team_player_misc**
#'
#'
#'    Same columns as the **home_team_player_misc** table above.
#'
#'    **home_team_totals_misc**
#'
#'
#'    \if{html}{\tabular{lll}{
#'       col_name \tab types \tab description \cr
#'       game_id \tab character \tab Unique game identifier. \cr
#'       away_team_id \tab integer \tab Unique identifier for the away team. \cr
#'       home_team_id \tab integer \tab Unique identifier for the home team. \cr
#'       team_id \tab integer \tab Unique team identifier. \cr
#'       team_name \tab character \tab Full team display name (e.g. 'Las Vegas Aces'). \cr
#'       team_city \tab character \tab Team city or region (e.g. 'Las Vegas'). \cr
#'       team_tricode \tab character \tab Three-letter team code (e.g. 'LAS' / 'NYL'). \cr
#'       team_slug \tab character \tab URL-safe team identifier (e.g. 'lasvegas-aces' / 'aces'). \cr
#'       minutes \tab character \tab Minutes played, formatted MM:SS (V3 PT-duration parsed) or decimal minutes (V2). \cr
#'       points_off_turnovers \tab integer \tab Points scored off opponent turnovers. \cr
#'       points_second_chance \tab integer \tab Second-chance points scored. \cr
#'       points_fast_break \tab integer \tab Fast-break points scored. \cr
#'       points_paint \tab integer \tab Points scored in the paint. \cr
#'       opp_points_off_turnovers \tab integer \tab Opponent points off turnovers. \cr
#'       opp_points_second_chance \tab integer \tab Opponent points second chance. \cr
#'       opp_points_fast_break \tab integer \tab Opponent points fast break. \cr
#'       opp_points_paint \tab integer \tab Opponent points paint. \cr
#'       blocks \tab integer \tab Total blocks. \cr
#'       blocks_against \tab integer \tab Shots blocked by opponents while attempting. \cr
#'       fouls_personal \tab integer \tab Personal fouls. \cr
#'       fouls_drawn \tab integer \tab Personal fouls drawn (by opponent's actions). \cr
#'    }}
#'    \if{latex}{See the HTML help or pkgdown reference for the column table.}
#'
#'    **away_team_totals_misc**
#'
#'
#'    Same columns as the **home_team_totals_misc** table above.
#'
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows as_tibble
#' @import rvest
#' @export
#' @family WNBA Boxscore V3 Functions
#' @details
#' ```r
#'  wnba_boxscoremiscv3(game_id = "1022200034")
#' ```
wnba_boxscoremiscv3 <- function(
    game_id = "1022200034",
    start_period = 0,
    end_period = 14,
    start_range = 0,
    end_range = 0,
    range_type = 0,
    ...){
  .args <- mget(setdiff(names(formals()), "..."))
  
  version <- "boxscoremiscv3"
  endpoint <- wnba_endpoint(version)
  full_url <- endpoint
  
  params <- list(
    EndPeriod = end_period,
    EndRange = end_range,
    GameID = pad_id(game_id),
    RangeType = range_type,
    StartPeriod = start_period,
    StartRange = start_range
  )
  
  df_list <- list()

  tryCatch(
    expr = {
      
      resp <- request_with_proxy(url = full_url, params = params, ...)
      
      data <- resp %>%
        purrr::pluck("boxScoreMisc") %>%
        dplyr::as_tibble()
      
      ids_df <- data %>%
        data.frame() %>%
        dplyr::select("gameId","awayTeamId","homeTeamId") %>%
        dplyr::distinct()
      
      home_team_data <- data %>%
        purrr::pluck("homeTeam")
      
      home_team_info <- data.frame(
        team_id = home_team_data %>% purrr::pluck("teamId"),
        team_name = home_team_data %>% purrr::pluck("teamName"),
        team_city = home_team_data %>% purrr::pluck("teamCity"),
        team_tricode = home_team_data %>% purrr::pluck("teamTricode"),
        team_slug = home_team_data %>% purrr::pluck("teamSlug")
      )
      
      home_team_totals <- home_team_data %>%
        purrr::pluck("statistics") %>%
        data.frame(stringsAsFactors = F)
      
      home_team_players <- home_team_data %>%
        purrr::pluck("players") %>%
        data.frame(stringsAsFactors = F) %>%
        tidyr::unnest("statistics")
      
      home_team_totals <- ids_df %>%
        dplyr::bind_cols(home_team_info) %>%
        dplyr::bind_cols(home_team_totals) %>%
        janitor::clean_names() %>%
        make_wehoop_data("WNBA Home Team Boxscore Information from WNBA.com", Sys.time())
      
      home_team_players <- ids_df %>%
        dplyr::bind_cols(home_team_info) %>%
        dplyr::bind_cols(home_team_players) %>%
        janitor::clean_names() %>%
        make_wehoop_data("WNBA Home Player Boxscore Information from WNBA.com", Sys.time())
      
      
      away_team_data <- data %>%
        purrr::pluck("awayTeam")
      
      away_team_info <- data.frame(
        team_id = away_team_data %>% purrr::pluck("teamId"),
        team_name = away_team_data %>% purrr::pluck("teamName"),
        team_city = away_team_data %>% purrr::pluck("teamCity"),
        team_tricode = away_team_data %>% purrr::pluck("teamTricode"),
        team_slug = away_team_data %>% purrr::pluck("teamSlug")
      )
      
      away_team_totals <- away_team_data %>%
        purrr::pluck("statistics") %>%
        data.frame(stringsAsFactors = F)
      
      away_team_players <- away_team_data %>%
        purrr::pluck("players") %>%
        data.frame(stringsAsFactors = F) %>%
        tidyr::unnest("statistics")
      
      away_team_totals <- ids_df %>%
        dplyr::bind_cols(away_team_info) %>%
        dplyr::bind_cols(away_team_totals) %>%
        janitor::clean_names() %>%
        make_wehoop_data("WNBA Away Team Boxscore Information from WNBA.com", Sys.time())
      
      away_team_players <- ids_df %>%
        dplyr::bind_cols(away_team_info) %>%
        dplyr::bind_cols(away_team_players) %>%
        janitor::clean_names() %>%
        make_wehoop_data("WNBA Away Player Boxscore Information from WNBA.com", Sys.time())
      
      df_list <- c(
        list(home_team_players),
        list(away_team_players),
        list(home_team_totals),
        list(away_team_totals)
      )
      names(df_list) <- c(
        "home_team_player_misc",
        "away_team_player_misc",
        "home_team_totals_misc",
        "away_team_totals_misc"
      )
      
    },
    error = function(e) .report_api_error(
      e,
      hint = "Invalid arguments or no misc boxscore v3 data for {game_id} available!",
      args = .args
    ),
    warning = function(w) .report_api_warning(w, args = .args),
    finally = {
    }
  )
  return(df_list)
}


#' @title
#' **Get WNBA Stats API Boxscore Scoring V3**
#' @rdname wnba_boxscoretraditionalv3
#' @author Saiem Gilani
#' @param game_id Game ID
#' @param start_period start_period
#' @param end_period end_period
#' @param start_range start_range
#' @param end_range end_range
#' @param range_type range_type
#' @param ... Additional arguments passed to an underlying function like httr.
#' @return A list of data frames: home_team_player_scoring, away_team_player_scoring,
#' home_team_totals_scoring, away_team_totals_scoring
#'
#'    **home_team_player_scoring**
#'
#'
#'    \if{html}{\tabular{lll}{
#'       col_name \tab types \tab description \cr
#'       game_id \tab character \tab Unique game identifier. \cr
#'       away_team_id \tab integer \tab Unique identifier for the away team. \cr
#'       home_team_id \tab integer \tab Unique identifier for the home team. \cr
#'       team_id \tab integer \tab Unique team identifier. \cr
#'       team_name \tab character \tab Full team display name (e.g. 'Las Vegas Aces'). \cr
#'       team_city \tab character \tab Team city or region (e.g. 'Las Vegas'). \cr
#'       team_tricode \tab character \tab Three-letter team code (e.g. 'LAS' / 'NYL'). \cr
#'       team_slug \tab character \tab URL-safe team identifier (e.g. 'lasvegas-aces' / 'aces'). \cr
#'       person_id \tab integer \tab Unique player identifier (V3 endpoints). \cr
#'       first_name \tab character \tab Player's first name. \cr
#'       family_name \tab character \tab Player's family / last name. \cr
#'       name_i \tab character \tab Initialed name (e.g. 'A. Wilson'). \cr
#'       player_slug \tab character \tab URL-safe player identifier. \cr
#'       position \tab character \tab Listed roster position (G, F, C, etc.). \cr
#'       comment \tab character \tab Player status / inactive reason (e.g. 'DNP - Coach's Decision', 'Inactive'). \cr
#'       jersey_num \tab character \tab Jersey number worn by the player. \cr
#'       minutes \tab character \tab Minutes played, formatted MM:SS (V3 PT-duration parsed) or decimal minutes (V2). \cr
#'       percentage_field_goals_attempted2pt \tab numeric \tab Percentage field goals attempted2pt. \cr
#'       percentage_field_goals_attempted3pt \tab numeric \tab Percentage field goals attempted3pt. \cr
#'       percentage_points2pt \tab numeric \tab Percentage points2pt. \cr
#'       percentage_points_midrange2pt \tab numeric \tab Percentage points midrange2pt. \cr
#'       percentage_points3pt \tab numeric \tab Percentage points3pt. \cr
#'       percentage_points_fast_break \tab numeric \tab Percentage points fast break. \cr
#'       percentage_points_free_throw \tab numeric \tab Percentage points free throw. \cr
#'       percentage_points_off_turnovers \tab numeric \tab Percentage points off turnovers. \cr
#'       percentage_points_paint \tab numeric \tab Percentage points paint. \cr
#'       percentage_assisted2pt \tab numeric \tab Percentage assisted2pt. \cr
#'       percentage_unassisted2pt \tab numeric \tab Percentage unassisted2pt. \cr
#'       percentage_assisted3pt \tab numeric \tab Percentage assisted3pt. \cr
#'       percentage_unassisted3pt \tab numeric \tab Percentage unassisted3pt. \cr
#'       percentage_assisted_fgm \tab numeric \tab Percentage assisted fgm. \cr
#'       percentage_unassisted_fgm \tab numeric \tab Percentage unassisted fgm. \cr
#'    }}
#'    \if{latex}{See the HTML help or pkgdown reference for the column table.}
#'
#'    **away_team_player_scoring**
#'
#'
#'    Same columns as the **home_team_player_scoring** table above.
#'
#'    **home_team_totals_scoring**
#'
#'
#'    \if{html}{\tabular{lll}{
#'       col_name \tab types \tab description \cr
#'       game_id \tab character \tab Unique game identifier. \cr
#'       away_team_id \tab integer \tab Unique identifier for the away team. \cr
#'       home_team_id \tab integer \tab Unique identifier for the home team. \cr
#'       team_id \tab integer \tab Unique team identifier. \cr
#'       team_name \tab character \tab Full team display name (e.g. 'Las Vegas Aces'). \cr
#'       team_city \tab character \tab Team city or region (e.g. 'Las Vegas'). \cr
#'       team_tricode \tab character \tab Three-letter team code (e.g. 'LAS' / 'NYL'). \cr
#'       team_slug \tab character \tab URL-safe team identifier (e.g. 'lasvegas-aces' / 'aces'). \cr
#'       minutes \tab character \tab Minutes played, formatted MM:SS (V3 PT-duration parsed) or decimal minutes (V2). \cr
#'       percentage_field_goals_attempted2pt \tab numeric \tab Percentage field goals attempted2pt. \cr
#'       percentage_field_goals_attempted3pt \tab numeric \tab Percentage field goals attempted3pt. \cr
#'       percentage_points2pt \tab numeric \tab Percentage points2pt. \cr
#'       percentage_points_midrange2pt \tab numeric \tab Percentage points midrange2pt. \cr
#'       percentage_points3pt \tab numeric \tab Percentage points3pt. \cr
#'       percentage_points_fast_break \tab numeric \tab Percentage points fast break. \cr
#'       percentage_points_free_throw \tab numeric \tab Percentage points free throw. \cr
#'       percentage_points_off_turnovers \tab numeric \tab Percentage points off turnovers. \cr
#'       percentage_points_paint \tab numeric \tab Percentage points paint. \cr
#'       percentage_assisted2pt \tab numeric \tab Percentage assisted2pt. \cr
#'       percentage_unassisted2pt \tab numeric \tab Percentage unassisted2pt. \cr
#'       percentage_assisted3pt \tab numeric \tab Percentage assisted3pt. \cr
#'       percentage_unassisted3pt \tab numeric \tab Percentage unassisted3pt. \cr
#'       percentage_assisted_fgm \tab numeric \tab Percentage assisted fgm. \cr
#'       percentage_unassisted_fgm \tab numeric \tab Percentage unassisted fgm. \cr
#'    }}
#'    \if{latex}{See the HTML help or pkgdown reference for the column table.}
#'
#'    **away_team_totals_scoring**
#'
#'
#'    Same columns as the **home_team_totals_scoring** table above.
#'
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows as_tibble
#' @import rvest
#' @export
#' @family WNBA Boxscore V3 Functions
#' @details
#' ```r
#'  wnba_boxscorescoringv3(game_id = "1022200034")
#' ```
wnba_boxscorescoringv3 <- function(
    game_id = "1022200034",
    start_period = 0,
    end_period = 14,
    start_range = 0,
    end_range = 0,
    range_type = 0,
    ...){
  .args <- mget(setdiff(names(formals()), "..."))
  
  version <- "boxscorescoringv3"
  endpoint <- wnba_endpoint(version)
  full_url <- endpoint
  
  params <- list(
    EndPeriod = end_period,
    EndRange = end_range,
    GameID = pad_id(game_id),
    RangeType = range_type,
    StartPeriod = start_period,
    StartRange = start_range
  )
  
  df_list <- list()

  tryCatch(
    expr = {
      
      resp <- request_with_proxy(url = full_url, params = params, ...)
      
      data <- resp %>%
        purrr::pluck("boxScoreScoring") %>%
        dplyr::as_tibble()
      
      ids_df <- data %>%
        data.frame() %>%
        dplyr::select("gameId","awayTeamId","homeTeamId") %>%
        dplyr::distinct()
      
      home_team_data <- data %>%
        purrr::pluck("homeTeam")
      
      home_team_info <- data.frame(
        team_id = home_team_data %>% purrr::pluck("teamId"),
        team_name = home_team_data %>% purrr::pluck("teamName"),
        team_city = home_team_data %>% purrr::pluck("teamCity"),
        team_tricode = home_team_data %>% purrr::pluck("teamTricode"),
        team_slug = home_team_data %>% purrr::pluck("teamSlug")
      )
      
      home_team_totals <- home_team_data %>%
        purrr::pluck("statistics") %>%
        data.frame(stringsAsFactors = F)
      
      home_team_players <- home_team_data %>%
        purrr::pluck("players") %>%
        data.frame(stringsAsFactors = F) %>%
        tidyr::unnest("statistics")
      
      home_team_totals <- ids_df %>%
        dplyr::bind_cols(home_team_info) %>%
        dplyr::bind_cols(home_team_totals) %>%
        janitor::clean_names() %>%
        make_wehoop_data("WNBA Home Team Boxscore Information from WNBA.com", Sys.time())
      
      home_team_players <- ids_df %>%
        dplyr::bind_cols(home_team_info) %>%
        dplyr::bind_cols(home_team_players) %>%
        janitor::clean_names() %>%
        make_wehoop_data("WNBA Home Player Boxscore Information from WNBA.com", Sys.time())
      
      
      away_team_data <- data %>%
        purrr::pluck("awayTeam")
      
      away_team_info <- data.frame(
        team_id = away_team_data %>% purrr::pluck("teamId"),
        team_name = away_team_data %>% purrr::pluck("teamName"),
        team_city = away_team_data %>% purrr::pluck("teamCity"),
        team_tricode = away_team_data %>% purrr::pluck("teamTricode"),
        team_slug = away_team_data %>% purrr::pluck("teamSlug")
      )
      
      away_team_totals <- away_team_data %>%
        purrr::pluck("statistics") %>%
        data.frame(stringsAsFactors = F)
      
      away_team_players <- away_team_data %>%
        purrr::pluck("players") %>%
        data.frame(stringsAsFactors = F) %>%
        tidyr::unnest("statistics")
      
      away_team_totals <- ids_df %>%
        dplyr::bind_cols(away_team_info) %>%
        dplyr::bind_cols(away_team_totals) %>%
        janitor::clean_names() %>%
        make_wehoop_data("WNBA Away Team Boxscore Information from WNBA.com", Sys.time())
      
      away_team_players <- ids_df %>%
        dplyr::bind_cols(away_team_info) %>%
        dplyr::bind_cols(away_team_players) %>%
        janitor::clean_names() %>%
        make_wehoop_data("WNBA Away Player Boxscore Information from WNBA.com", Sys.time())
      
      df_list <- c(
        list(home_team_players),
        list(away_team_players),
        list(home_team_totals),
        list(away_team_totals)
      )
      names(df_list) <- c(
        "home_team_player_scoring",
        "away_team_player_scoring",
        "home_team_totals_scoring",
        "away_team_totals_scoring"
      )
      
    },
    error = function(e) .report_api_error(
      e,
      hint = "Invalid arguments or no scoring boxscore v3 data for {game_id} available!",
      args = .args
    ),
    warning = function(w) .report_api_warning(w, args = .args),
    finally = {
    }
  )
  return(df_list)
}


#' @title
#' **Get WNBA Stats API Boxscore Four Factors V3**
#' @rdname wnba_boxscoretraditionalv3
#' @author Saiem Gilani
#' @param game_id Game ID
#' @param start_period start_period
#' @param end_period end_period
#' @param start_range start_range
#' @param end_range end_range
#' @param range_type range_type
#' @param ... Additional arguments passed to an underlying function like httr.
#' @return A list of data frames:  home_team_player_four_factors,
#' away_team_player_four_factors, home_team_totals_four_factors,
#' away_team_totals_four_factors
#'
#'    **home_team_player_four_factors**
#'
#'
#'    \if{html}{\tabular{lll}{
#'       col_name \tab types \tab description \cr
#'       game_id \tab character \tab Unique game identifier. \cr
#'       away_team_id \tab integer \tab Unique identifier for the away team. \cr
#'       home_team_id \tab integer \tab Unique identifier for the home team. \cr
#'       team_id \tab integer \tab Unique team identifier. \cr
#'       team_name \tab character \tab Full team display name (e.g. 'Las Vegas Aces'). \cr
#'       team_city \tab character \tab Team city or region (e.g. 'Las Vegas'). \cr
#'       team_tricode \tab character \tab Three-letter team code (e.g. 'LAS' / 'NYL'). \cr
#'       team_slug \tab character \tab URL-safe team identifier (e.g. 'lasvegas-aces' / 'aces'). \cr
#'       person_id \tab integer \tab Unique player identifier (V3 endpoints). \cr
#'       first_name \tab character \tab Player's first name. \cr
#'       family_name \tab character \tab Player's family / last name. \cr
#'       name_i \tab character \tab Initialed name (e.g. 'A. Wilson'). \cr
#'       player_slug \tab character \tab URL-safe player identifier. \cr
#'       position \tab character \tab Listed roster position (G, F, C, etc.). \cr
#'       comment \tab character \tab Player status / inactive reason (e.g. 'DNP - Coach's Decision', 'Inactive'). \cr
#'       jersey_num \tab character \tab Jersey number worn by the player. \cr
#'       minutes \tab character \tab Minutes played, formatted MM:SS (V3 PT-duration parsed) or decimal minutes (V2). \cr
#'       effective_field_goal_percentage \tab numeric \tab Effective field goal percentage (0-1). \cr
#'       free_throw_attempt_rate \tab numeric \tab Free throw attempt rate (FTA / FGA). \cr
#'       team_turnover_percentage \tab numeric \tab Team turnover percentage (0-1). \cr
#'       offensive_rebound_percentage \tab numeric \tab Offensive rebound percentage (0-1). \cr
#'       opp_effective_field_goal_percentage \tab numeric \tab Opponent effective field goal percentage (0-1 decimal). \cr
#'       opp_free_throw_attempt_rate \tab numeric \tab Opponent free throw attempt rate. \cr
#'       opp_team_turnover_percentage \tab numeric \tab Opponent team turnover percentage (0-1 decimal). \cr
#'       opp_offensive_rebound_percentage \tab numeric \tab Opponent offensive rebound percentage (0-1 decimal). \cr
#'    }}
#'    \if{latex}{See the HTML help or pkgdown reference for the column table.}
#'
#'    **away_team_player_four_factors**
#'
#'
#'    Same columns as the **home_team_player_four_factors** table above.
#'
#'    **home_team_totals_four_factors**
#'
#'
#'    \if{html}{\tabular{lll}{
#'       col_name \tab types \tab description \cr
#'       game_id \tab character \tab Unique game identifier. \cr
#'       away_team_id \tab integer \tab Unique identifier for the away team. \cr
#'       home_team_id \tab integer \tab Unique identifier for the home team. \cr
#'       team_id \tab integer \tab Unique team identifier. \cr
#'       team_name \tab character \tab Full team display name (e.g. 'Las Vegas Aces'). \cr
#'       team_city \tab character \tab Team city or region (e.g. 'Las Vegas'). \cr
#'       team_tricode \tab character \tab Three-letter team code (e.g. 'LAS' / 'NYL'). \cr
#'       team_slug \tab character \tab URL-safe team identifier (e.g. 'lasvegas-aces' / 'aces'). \cr
#'       minutes \tab character \tab Minutes played, formatted MM:SS (V3 PT-duration parsed) or decimal minutes (V2). \cr
#'       effective_field_goal_percentage \tab numeric \tab Effective field goal percentage (0-1). \cr
#'       free_throw_attempt_rate \tab numeric \tab Free throw attempt rate (FTA / FGA). \cr
#'       team_turnover_percentage \tab numeric \tab Team turnover percentage (0-1). \cr
#'       offensive_rebound_percentage \tab numeric \tab Offensive rebound percentage (0-1). \cr
#'       opp_effective_field_goal_percentage \tab numeric \tab Opponent effective field goal percentage (0-1 decimal). \cr
#'       opp_free_throw_attempt_rate \tab numeric \tab Opponent free throw attempt rate. \cr
#'       opp_team_turnover_percentage \tab numeric \tab Opponent team turnover percentage (0-1 decimal). \cr
#'       opp_offensive_rebound_percentage \tab numeric \tab Opponent offensive rebound percentage (0-1 decimal). \cr
#'    }}
#'    \if{latex}{See the HTML help or pkgdown reference for the column table.}
#'
#'    **away_team_totals_four_factors**
#'
#'
#'    Same columns as the **home_team_totals_four_factors** table above.
#'
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows as_tibble
#' @import rvest
#' @export
#' @family WNBA Boxscore V3 Functions
#' @details
#' ```r
#'  wnba_boxscorefourfactorsv3(game_id = "1022200034")
#' ```
wnba_boxscorefourfactorsv3 <- function(
    game_id = "1022200034",
    start_period = 0,
    end_period = 14,
    start_range = 0,
    end_range = 0,
    range_type = 0,
    ...){
  .args <- mget(setdiff(names(formals()), "..."))
  
  version <- "boxscorefourfactorsv3"
  endpoint <- wnba_endpoint(version)
  full_url <- endpoint
  
  params <- list(
    EndPeriod = end_period,
    EndRange = end_range,
    GameID = pad_id(game_id),
    RangeType = range_type,
    StartPeriod = start_period,
    StartRange = start_range
  )
  
  df_list <- list()

  tryCatch(
    expr = {
      
      resp <- request_with_proxy(url = full_url, params = params, ...)
      
      data <- resp %>%
        purrr::pluck("boxScoreFourFactors") %>%
        dplyr::as_tibble()
      
      ids_df <- data %>%
        data.frame() %>%
        dplyr::select("gameId","awayTeamId","homeTeamId") %>%
        dplyr::distinct()
      
      home_team_data <- data %>%
        purrr::pluck("homeTeam")
      
      home_team_info <- data.frame(
        team_id = home_team_data %>% purrr::pluck("teamId"),
        team_name = home_team_data %>% purrr::pluck("teamName"),
        team_city = home_team_data %>% purrr::pluck("teamCity"),
        team_tricode = home_team_data %>% purrr::pluck("teamTricode"),
        team_slug = home_team_data %>% purrr::pluck("teamSlug")
      )
      
      home_team_totals <- home_team_data %>%
        purrr::pluck("statistics") %>%
        data.frame(stringsAsFactors = F)
      
      home_team_players <- home_team_data %>%
        purrr::pluck("players") %>%
        data.frame(stringsAsFactors = F) %>%
        tidyr::unnest("statistics")
      
      home_team_totals <- ids_df %>%
        dplyr::bind_cols(home_team_info) %>%
        dplyr::bind_cols(home_team_totals) %>%
        janitor::clean_names() %>%
        make_wehoop_data("WNBA Home Team Boxscore Information from WNBA.com", Sys.time())
      
      home_team_players <- ids_df %>%
        dplyr::bind_cols(home_team_info) %>%
        dplyr::bind_cols(home_team_players) %>%
        janitor::clean_names() %>%
        make_wehoop_data("WNBA Home Player Boxscore Information from WNBA.com", Sys.time())
      
      
      away_team_data <- data %>%
        purrr::pluck("awayTeam")
      
      away_team_info <- data.frame(
        team_id = away_team_data %>% purrr::pluck("teamId"),
        team_name = away_team_data %>% purrr::pluck("teamName"),
        team_city = away_team_data %>% purrr::pluck("teamCity"),
        team_tricode = away_team_data %>% purrr::pluck("teamTricode"),
        team_slug = away_team_data %>% purrr::pluck("teamSlug")
      )
      
      away_team_totals <- away_team_data %>%
        purrr::pluck("statistics") %>%
        data.frame(stringsAsFactors = F)
      
      away_team_players <- away_team_data %>%
        purrr::pluck("players") %>%
        data.frame(stringsAsFactors = F) %>%
        tidyr::unnest("statistics")
      
      away_team_totals <- ids_df %>%
        dplyr::bind_cols(away_team_info) %>%
        dplyr::bind_cols(away_team_totals) %>%
        janitor::clean_names() %>%
        make_wehoop_data("WNBA Away Team Boxscore Information from WNBA.com", Sys.time())
      
      away_team_players <- ids_df %>%
        dplyr::bind_cols(away_team_info) %>%
        dplyr::bind_cols(away_team_players) %>%
        janitor::clean_names() %>%
        make_wehoop_data("WNBA Away Player Boxscore Information from WNBA.com", Sys.time())
      
      df_list <- c(
        list(home_team_players),
        list(away_team_players),
        list(home_team_totals),
        list(away_team_totals)
      )
      names(df_list) <- c(
        "home_team_player_four_factors",
        "away_team_player_four_factors",
        "home_team_totals_four_factors",
        "away_team_totals_four_factors"
      )
      
    },
    error = function(e) .report_api_error(
      e,
      hint = "Invalid arguments or no four factors boxscore v3 data for {game_id} available!",
      args = .args
    ),
    warning = function(w) .report_api_warning(w, args = .args),
    finally = {
    }
  )
  return(df_list)
}


#' @title
#' **Get WNBA Stats API Boxscore Player Tracking V3**
#' @rdname wnba_boxscoretraditionalv3
#' @author Saiem Gilani
#' @param game_id Game ID
#' @param start_period start_period
#' @param end_period end_period
#' @param start_range start_range
#' @param end_range end_range
#' @param range_type range_type
#' @param ... Additional arguments passed to an underlying function like httr.
#' @return A list of data frames: home_team_player_player_track, away_team_player_player_track,
#' home_team_totals_player_track, away_team_totals_player_track
#'
#'    **home_team_player_player_track**
#'
#'
#'    \if{html}{\tabular{lll}{
#'       col_name \tab types \tab description \cr
#'       game_id \tab character \tab Unique game identifier. \cr
#'       away_team_id \tab integer \tab Unique identifier for the away team. \cr
#'       home_team_id \tab integer \tab Unique identifier for the home team. \cr
#'       team_id \tab integer \tab Unique team identifier. \cr
#'       team_name \tab character \tab Full team display name (e.g. 'Las Vegas Aces'). \cr
#'       team_city \tab character \tab Team city or region (e.g. 'Las Vegas'). \cr
#'       team_tricode \tab character \tab Three-letter team code (e.g. 'LAS' / 'NYL'). \cr
#'       team_slug \tab character \tab URL-safe team identifier (e.g. 'lasvegas-aces' / 'aces'). \cr
#'       person_id \tab integer \tab Unique player identifier (V3 endpoints). \cr
#'       first_name \tab character \tab Player's first name. \cr
#'       family_name \tab character \tab Player's family / last name. \cr
#'       name_i \tab character \tab Initialed name (e.g. 'A. Wilson'). \cr
#'       player_slug \tab character \tab URL-safe player identifier. \cr
#'       position \tab character \tab Listed roster position (G, F, C, etc.). \cr
#'       comment \tab character \tab Player status / inactive reason (e.g. 'DNP - Coach's Decision', 'Inactive'). \cr
#'       jersey_num \tab character \tab Jersey number worn by the player. \cr
#'       minutes \tab character \tab Minutes played, formatted MM:SS (V3 PT-duration parsed) or decimal minutes (V2). \cr
#'       speed \tab numeric \tab Speed. \cr
#'       distance \tab numeric \tab Distance value (in feet for shot data; otherwise context-dependent). \cr
#'       rebound_chances_offensive \tab integer \tab Rebound chances offensive. \cr
#'       rebound_chances_defensive \tab integer \tab Rebound chances defensive. \cr
#'       rebound_chances_total \tab integer \tab Rebound chances total. \cr
#'       touches \tab integer \tab Touches. \cr
#'       secondary_assists \tab integer \tab Secondary assists. \cr
#'       free_throw_assists \tab integer \tab Free throw assists (passes that led to a fouled shot attempt). \cr
#'       passes \tab integer \tab Passes. \cr
#'       assists \tab integer \tab Total assists. \cr
#'       contested_field_goals_made \tab integer \tab Contested field goals made. \cr
#'       contested_field_goals_attempted \tab integer \tab Contested field goal attempts. \cr
#'       contested_field_goal_percentage \tab numeric \tab Contested field goal percentage (0-1). \cr
#'       uncontested_field_goals_made \tab integer \tab Number of uncontested field goals made. \cr
#'       uncontested_field_goals_attempted \tab integer \tab Number of uncontested field goals attempted. \cr
#'       uncontested_field_goals_percentage \tab numeric \tab Uncontested field goals percentage (0-1 decimal). \cr
#'       field_goal_percentage \tab numeric \tab Field Goal Percentage. \cr
#'       defended_at_rim_field_goals_made \tab integer \tab Field goals made allowed when defending at the rim. \cr
#'       defended_at_rim_field_goals_attempted \tab integer \tab Field goal attempts allowed when defending at the rim. \cr
#'       defended_at_rim_field_goal_percentage \tab numeric \tab Field goal percentage allowed at the rim (0-1). \cr
#'    }}
#'    \if{latex}{See the HTML help or pkgdown reference for the column table.}
#'
#'    **away_team_player_player_track**
#'
#'
#'    Same columns as the **home_team_player_player_track** table above.
#'
#'    **home_team_totals_player_track**
#'
#'
#'    \if{html}{\tabular{lll}{
#'       col_name \tab types \tab description \cr
#'       game_id \tab character \tab Unique game identifier. \cr
#'       away_team_id \tab integer \tab Unique identifier for the away team. \cr
#'       home_team_id \tab integer \tab Unique identifier for the home team. \cr
#'       team_id \tab integer \tab Unique team identifier. \cr
#'       team_name \tab character \tab Full team display name (e.g. 'Las Vegas Aces'). \cr
#'       team_city \tab character \tab Team city or region (e.g. 'Las Vegas'). \cr
#'       team_tricode \tab character \tab Three-letter team code (e.g. 'LAS' / 'NYL'). \cr
#'       team_slug \tab character \tab URL-safe team identifier (e.g. 'lasvegas-aces' / 'aces'). \cr
#'       minutes \tab character \tab Minutes played, formatted MM:SS (V3 PT-duration parsed) or decimal minutes (V2). \cr
#'       distance \tab numeric \tab Distance value (in feet for shot data; otherwise context-dependent). \cr
#'       rebound_chances_offensive \tab integer \tab Rebound chances offensive. \cr
#'       rebound_chances_defensive \tab integer \tab Rebound chances defensive. \cr
#'       rebound_chances_total \tab integer \tab Rebound chances total. \cr
#'       touches \tab integer \tab Touches. \cr
#'       secondary_assists \tab integer \tab Secondary assists. \cr
#'       free_throw_assists \tab integer \tab Free throw assists (passes that led to a fouled shot attempt). \cr
#'       passes \tab integer \tab Passes. \cr
#'       assists \tab integer \tab Total assists. \cr
#'       contested_field_goals_made \tab integer \tab Contested field goals made. \cr
#'       contested_field_goals_attempted \tab integer \tab Contested field goal attempts. \cr
#'       contested_field_goal_percentage \tab numeric \tab Contested field goal percentage (0-1). \cr
#'       uncontested_field_goals_made \tab integer \tab Number of uncontested field goals made. \cr
#'       uncontested_field_goals_attempted \tab integer \tab Number of uncontested field goals attempted. \cr
#'       uncontested_field_goals_percentage \tab numeric \tab Uncontested field goals percentage (0-1 decimal). \cr
#'       field_goal_percentage \tab numeric \tab Field Goal Percentage. \cr
#'       defended_at_rim_field_goals_made \tab integer \tab Field goals made allowed when defending at the rim. \cr
#'       defended_at_rim_field_goals_attempted \tab integer \tab Field goal attempts allowed when defending at the rim. \cr
#'       defended_at_rim_field_goal_percentage \tab numeric \tab Field goal percentage allowed at the rim (0-1). \cr
#'    }}
#'    \if{latex}{See the HTML help or pkgdown reference for the column table.}
#'
#'    **away_team_totals_player_track**
#'
#'
#'    Same columns as the **home_team_totals_player_track** table above.
#'
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows as_tibble
#' @import rvest
#' @export
#' @family WNBA Boxscore V3 Functions
#' @details
#' ```r
#'  wnba_boxscoreplayertrackv3(game_id = "1022200034")
#' ```
wnba_boxscoreplayertrackv3 <- function(
    game_id = "1022200034",
    start_period = 0,
    end_period = 14,
    start_range = 0,
    end_range = 0,
    range_type = 0,
    ...){
  .args <- mget(setdiff(names(formals()), "..."))
  
  version <- "boxscoreplayertrackv3"
  endpoint <- wnba_endpoint(version)
  full_url <- endpoint
  
  params <- list(
    EndPeriod = end_period,
    EndRange = end_range,
    GameID = pad_id(game_id),
    RangeType = range_type,
    StartPeriod = start_period,
    StartRange = start_range
  )
  
  df_list <- list()

  tryCatch(
    expr = {
      
      resp <- request_with_proxy(url = full_url, params = params, ...)
      
      data <- resp %>%
        purrr::pluck("boxScorePlayerTrack") %>%
        dplyr::as_tibble()
      
      ids_df <- data %>%
        data.frame() %>%
        dplyr::select("gameId","awayTeamId","homeTeamId") %>%
        dplyr::distinct()
      
      home_team_data <- data %>%
        purrr::pluck("homeTeam")
      
      home_team_info <- data.frame(
        team_id = home_team_data %>% purrr::pluck("teamId"),
        team_name = home_team_data %>% purrr::pluck("teamName"),
        team_city = home_team_data %>% purrr::pluck("teamCity"),
        team_tricode = home_team_data %>% purrr::pluck("teamTricode"),
        team_slug = home_team_data %>% purrr::pluck("teamSlug")
      )
      
      home_team_totals <- home_team_data %>%
        purrr::pluck("statistics") %>%
        data.frame(stringsAsFactors = F)
      
      home_team_players <- home_team_data %>%
        purrr::pluck("players") %>%
        data.frame(stringsAsFactors = F) %>%
        tidyr::unnest("statistics")
      
      home_team_totals <- ids_df %>%
        dplyr::bind_cols(home_team_info) %>%
        dplyr::bind_cols(home_team_totals) %>%
        janitor::clean_names() %>%
        make_wehoop_data("WNBA Home Team Boxscore Information from WNBA.com", Sys.time())
      
      home_team_players <- ids_df %>%
        dplyr::bind_cols(home_team_info) %>%
        dplyr::bind_cols(home_team_players) %>%
        janitor::clean_names() %>%
        make_wehoop_data("WNBA Home Player Boxscore Information from WNBA.com", Sys.time())
      
      
      away_team_data <- data %>%
        purrr::pluck("awayTeam")
      
      away_team_info <- data.frame(
        team_id = away_team_data %>% purrr::pluck("teamId"),
        team_name = away_team_data %>% purrr::pluck("teamName"),
        team_city = away_team_data %>% purrr::pluck("teamCity"),
        team_tricode = away_team_data %>% purrr::pluck("teamTricode"),
        team_slug = away_team_data %>% purrr::pluck("teamSlug")
      )
      
      away_team_totals <- away_team_data %>%
        purrr::pluck("statistics") %>%
        data.frame(stringsAsFactors = F)
      
      away_team_players <- away_team_data %>%
        purrr::pluck("players") %>%
        data.frame(stringsAsFactors = F) %>%
        tidyr::unnest("statistics")
      
      away_team_totals <- ids_df %>%
        dplyr::bind_cols(away_team_info) %>%
        dplyr::bind_cols(away_team_totals) %>%
        janitor::clean_names() %>%
        make_wehoop_data("WNBA Away Team Boxscore Information from WNBA.com", Sys.time())
      
      away_team_players <- ids_df %>%
        dplyr::bind_cols(away_team_info) %>%
        dplyr::bind_cols(away_team_players) %>%
        janitor::clean_names() %>%
        make_wehoop_data("WNBA Away Player Boxscore Information from WNBA.com", Sys.time())
      
      df_list <- c(
        list(home_team_players),
        list(away_team_players),
        list(home_team_totals),
        list(away_team_totals)
      )
      names(df_list) <- c(
        "home_team_player_player_track",
        "away_team_player_player_track",
        "home_team_totals_player_track",
        "away_team_totals_player_track"
      )
      
    },
    error = function(e) .report_api_error(
      e,
      hint = "Invalid arguments or no player tracking boxscore v3 data for {game_id} available!",
      args = .args
    ),
    warning = function(w) .report_api_warning(w, args = .args),
    finally = {
    }
  )
  return(df_list)
}


#' @title
#' **Get WNBA Stats API Boxscore Usage V3**
#' @rdname wnba_boxscoretraditionalv3
#' @author Saiem Gilani
#' @param game_id Game ID - 10-digit zero-padded ID (e.g., '1022200034')
#' @param start_period start_period
#' @param end_period end_period
#' @param start_range start_range
#' @param end_range end_range
#' @param range_type range_type
#' @param ... Additional arguments passed to an underlying function like httr.
#' @return Returns a named list of data frames: home_team_player_usage, away_team_player_usage,
#' home_team_totals_usage, away_team_totals_usage
#'
#'    **home_team_player_usage**
#'
#'
#'    \if{html}{\tabular{lll}{
#'       col_name \tab types \tab description \cr
#'       game_id \tab character \tab Unique game identifier. \cr
#'       away_team_id \tab integer \tab Unique identifier for the away team. \cr
#'       home_team_id \tab integer \tab Unique identifier for the home team. \cr
#'       team_id \tab integer \tab Unique team identifier. \cr
#'       team_name \tab character \tab Full team display name (e.g. 'Las Vegas Aces'). \cr
#'       team_city \tab character \tab Team city or region (e.g. 'Las Vegas'). \cr
#'       team_tricode \tab character \tab Three-letter team code (e.g. 'LAS' / 'NYL'). \cr
#'       team_slug \tab character \tab URL-safe team identifier (e.g. 'lasvegas-aces' / 'aces'). \cr
#'       person_id \tab integer \tab Unique player identifier (V3 endpoints). \cr
#'       first_name \tab character \tab Player's first name. \cr
#'       family_name \tab character \tab Player's family / last name. \cr
#'       name_i \tab character \tab Initialed name (e.g. 'A. Wilson'). \cr
#'       player_slug \tab character \tab URL-safe player identifier. \cr
#'       position \tab character \tab Listed roster position (G, F, C, etc.). \cr
#'       comment \tab character \tab Player status / inactive reason (e.g. 'DNP - Coach's Decision', 'Inactive'). \cr
#'       jersey_num \tab character \tab Jersey number worn by the player. \cr
#'       minutes \tab character \tab Minutes played, formatted MM:SS (V3 PT-duration parsed) or decimal minutes (V2). \cr
#'       usage_percentage \tab numeric \tab Usage percentage (0-1). \cr
#'       percentage_field_goals_made \tab numeric \tab Number of percentage field goals made. \cr
#'       percentage_field_goals_attempted \tab numeric \tab Number of percentage field goals attempted. \cr
#'       percentage_three_pointers_made \tab numeric \tab Number of percentage three pointers made. \cr
#'       percentage_three_pointers_attempted \tab numeric \tab Number of percentage three pointers attempted. \cr
#'       percentage_free_throws_made \tab numeric \tab Number of percentage free throws made. \cr
#'       percentage_free_throws_attempted \tab numeric \tab Number of percentage free throws attempted. \cr
#'       percentage_rebounds_offensive \tab numeric \tab Percentage rebounds offensive. \cr
#'       percentage_rebounds_defensive \tab numeric \tab Percentage rebounds defensive. \cr
#'       percentage_rebounds_total \tab numeric \tab Percentage rebounds total. \cr
#'       percentage_assists \tab numeric \tab Percentage assists. \cr
#'       percentage_turnovers \tab numeric \tab Percentage turnovers. \cr
#'       percentage_steals \tab numeric \tab Percentage steals. \cr
#'       percentage_blocks \tab numeric \tab Percentage blocks. \cr
#'       percentage_blocks_allowed \tab numeric \tab Percentage blocks allowed. \cr
#'       percentage_personal_fouls \tab numeric \tab Percentage personal fouls. \cr
#'       percentage_personal_fouls_drawn \tab numeric \tab Percentage personal fouls drawn. \cr
#'       percentage_points \tab numeric \tab Percentage points. \cr
#'    }}
#'    \if{latex}{See the HTML help or pkgdown reference for the column table.}
#'
#'    **away_team_player_usage**
#'
#'
#'    Same columns as the **home_team_player_usage** table above.
#'
#'    **home_team_totals_usage**
#'
#'
#'    \if{html}{\tabular{lll}{
#'       col_name \tab types \tab description \cr
#'       game_id \tab character \tab Unique game identifier. \cr
#'       away_team_id \tab integer \tab Unique identifier for the away team. \cr
#'       home_team_id \tab integer \tab Unique identifier for the home team. \cr
#'       team_id \tab integer \tab Unique team identifier. \cr
#'       team_name \tab character \tab Full team display name (e.g. 'Las Vegas Aces'). \cr
#'       team_city \tab character \tab Team city or region (e.g. 'Las Vegas'). \cr
#'       team_tricode \tab character \tab Three-letter team code (e.g. 'LAS' / 'NYL'). \cr
#'       team_slug \tab character \tab URL-safe team identifier (e.g. 'lasvegas-aces' / 'aces'). \cr
#'       minutes \tab character \tab Minutes played, formatted MM:SS (V3 PT-duration parsed) or decimal minutes (V2). \cr
#'       usage_percentage \tab numeric \tab Usage percentage (0-1). \cr
#'       percentage_field_goals_made \tab numeric \tab Number of percentage field goals made. \cr
#'       percentage_field_goals_attempted \tab numeric \tab Number of percentage field goals attempted. \cr
#'       percentage_three_pointers_made \tab numeric \tab Number of percentage three pointers made. \cr
#'       percentage_three_pointers_attempted \tab numeric \tab Number of percentage three pointers attempted. \cr
#'       percentage_free_throws_made \tab numeric \tab Number of percentage free throws made. \cr
#'       percentage_free_throws_attempted \tab numeric \tab Number of percentage free throws attempted. \cr
#'       percentage_rebounds_offensive \tab numeric \tab Percentage rebounds offensive. \cr
#'       percentage_rebounds_defensive \tab numeric \tab Percentage rebounds defensive. \cr
#'       percentage_rebounds_total \tab numeric \tab Percentage rebounds total. \cr
#'       percentage_assists \tab numeric \tab Percentage assists. \cr
#'       percentage_turnovers \tab numeric \tab Percentage turnovers. \cr
#'       percentage_steals \tab numeric \tab Percentage steals. \cr
#'       percentage_blocks \tab numeric \tab Percentage blocks. \cr
#'       percentage_blocks_allowed \tab numeric \tab Percentage blocks allowed. \cr
#'       percentage_personal_fouls \tab numeric \tab Percentage personal fouls. \cr
#'       percentage_personal_fouls_drawn \tab numeric \tab Percentage personal fouls drawn. \cr
#'       percentage_points \tab numeric \tab Percentage points. \cr
#'    }}
#'    \if{latex}{See the HTML help or pkgdown reference for the column table.}
#'
#'    **away_team_totals_usage**
#'
#'
#'    Same columns as the **home_team_totals_usage** table above.
#'
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows as_tibble
#' @import rvest
#' @export
#' @family WNBA Boxscore V3 Functions
#' @details
#' ```r
#'  wnba_boxscoreusagev3(game_id = "1022200034")
#' ```
wnba_boxscoreusagev3 <- function(
    game_id = "1022200034",
    start_period = 0,
    end_period = 14,
    start_range = 0,
    end_range = 0,
    range_type = 0,
    ...) {
  .args <- mget(setdiff(names(formals()), "..."))

  version <- "boxscoreusagev3"
  endpoint <- wnba_endpoint(version)
  full_url <- endpoint

  params <- list(
    EndPeriod = end_period,
    EndRange = end_range,
    GameID = pad_id(game_id),
    RangeType = range_type,
    StartPeriod = start_period,
    StartRange = start_range
  )

  df_list <- list()

  tryCatch(
    expr = {
      resp <- request_with_proxy(url = full_url, params = params, ...)

      data <- resp %>%
        purrr::pluck("boxScoreUsage") %>%
        dplyr::as_tibble()

      ids_df <- data %>%
        data.frame() %>%
        dplyr::select("gameId", "awayTeamId", "homeTeamId") %>%
        dplyr::distinct()

      home_team_data <- data %>%
        purrr::pluck("homeTeam")

      home_team_info <- data.frame(
        team_id = home_team_data %>% purrr::pluck("teamId"),
        team_name = home_team_data %>% purrr::pluck("teamName"),
        team_city = home_team_data %>% purrr::pluck("teamCity"),
        team_tricode = home_team_data %>% purrr::pluck("teamTricode"),
        team_slug = home_team_data %>% purrr::pluck("teamSlug")
      )

      home_team_totals <- home_team_data %>%
        purrr::pluck("statistics") %>%
        data.frame(stringsAsFactors = F)

      home_team_players <- home_team_data %>%
        purrr::pluck("players") %>%
        data.frame(stringsAsFactors = F) %>%
        tidyr::unnest("statistics")

      home_team_totals <- ids_df %>%
        dplyr::bind_cols(home_team_info) %>%
        dplyr::bind_cols(home_team_totals) %>%
        janitor::clean_names() %>%
        make_wehoop_data("WNBA Home Team Usage Boxscore Information from WNBA.com", Sys.time())

      home_team_players <- ids_df %>%
        dplyr::bind_cols(home_team_info) %>%
        dplyr::bind_cols(home_team_players) %>%
        janitor::clean_names() %>%
        make_wehoop_data("WNBA Home Player Usage Boxscore Information from WNBA.com", Sys.time())


      away_team_data <- data %>%
        purrr::pluck("awayTeam")

      away_team_info <- data.frame(
        team_id = away_team_data %>% purrr::pluck("teamId"),
        team_name = away_team_data %>% purrr::pluck("teamName"),
        team_city = away_team_data %>% purrr::pluck("teamCity"),
        team_tricode = away_team_data %>% purrr::pluck("teamTricode"),
        team_slug = away_team_data %>% purrr::pluck("teamSlug")
      )

      away_team_totals <- away_team_data %>%
        purrr::pluck("statistics") %>%
        data.frame(stringsAsFactors = F)

      away_team_players <- away_team_data %>%
        purrr::pluck("players") %>%
        data.frame(stringsAsFactors = F) %>%
        tidyr::unnest("statistics")

      away_team_totals <- ids_df %>%
        dplyr::bind_cols(away_team_info) %>%
        dplyr::bind_cols(away_team_totals) %>%
        janitor::clean_names() %>%
        make_wehoop_data("WNBA Away Team Usage Boxscore Information from WNBA.com", Sys.time())

      away_team_players <- ids_df %>%
        dplyr::bind_cols(away_team_info) %>%
        dplyr::bind_cols(away_team_players) %>%
        janitor::clean_names() %>%
        make_wehoop_data("WNBA Away Player Usage Boxscore Information from WNBA.com", Sys.time())

      df_list <- c(
        list(home_team_players),
        list(away_team_players),
        list(home_team_totals),
        list(away_team_totals)
      )
      names(df_list) <- c(
        "home_team_player_usage",
        "away_team_player_usage",
        "home_team_totals_usage",
        "away_team_totals_usage"
      )
    },
    error = function(e) .report_api_error(
      e,
      hint = "Invalid arguments or no usage boxscore v3 data for {game_id} available!",
      args = .args
    ),
    warning = function(w) .report_api_warning(w, args = .args),
    finally = {
    }
  )
  return(df_list)
}


#' **Get WNBA Stats API Boxscore Summary V3**
#' @name wnba_boxscoresummaryv3
NULL
#' @title
#' **Get WNBA Stats API Boxscore Summary V3**
#' @rdname wnba_boxscoresummaryv3
#' @author Saiem Gilani
#' @param game_id Game ID - 10-digit zero-padded ID (e.g., '1022200034')
#' @param ... Additional arguments passed to an underlying function like httr.
#' @return Returns a named list of data frames: game_summary, game_info, arena_info,
#' officials, line_score, inactive_players, last_five_meetings, other_stats, available_video
#'
#'    **game_summary**
#'
#'
#'    \if{html}{\tabular{lll}{
#'       col_name \tab types \tab description \cr
#'       game_date \tab character \tab Game date (YYYY-MM-DD). \cr
#'       game_sequence \tab integer \tab Game sequence. \cr
#'       game_id \tab character \tab Unique game identifier. \cr
#'       game_status_id \tab integer \tab Numeric game status identifier. \cr
#'       game_status_text \tab character \tab Game status display text (e.g. 'Final', '4:32 - 4th'). \cr
#'       gamecode \tab character \tab Gamecode. \cr
#'       home_team_id \tab integer \tab Unique identifier for the home team. \cr
#'       visitor_team_id \tab integer \tab Unique identifier for visitor team. \cr
#'       season \tab character \tab Season identifier (4-digit year or 'YYYY-YY' string). \cr
#'       live_period \tab integer \tab Live period. \cr
#'       live_pc_time \tab character \tab Time / clock value. \cr
#'       natl_tv_broadcaster_abbreviation \tab character \tab Natl tv broadcaster abbreviation. \cr
#'       home_tv_broadcaster_abbreviation \tab character \tab Home team's tv broadcaster abbreviation. \cr
#'       away_tv_broadcaster_abbreviation \tab character \tab Away team's tv broadcaster abbreviation. \cr
#'       live_period_time_bcast \tab character \tab Live period time bcast. \cr
#'       arena_name \tab character \tab Arena name. \cr
#'       wh_status \tab integer \tab Wh status. \cr
#'    }}
#'    \if{latex}{See the HTML help or pkgdown reference for the column table.}
#'
#'    **line_score**
#'
#'
#'    \if{html}{\tabular{lll}{
#'       col_name \tab types \tab description \cr
#'       game_date_est \tab character \tab Game date est. \cr
#'       game_sequence \tab integer \tab Game sequence. \cr
#'       game_id \tab character \tab Unique game identifier. \cr
#'       team_id \tab integer \tab Unique team identifier. \cr
#'       team_abbreviation \tab character \tab Short team abbreviation (e.g. 'LAS'). \cr
#'       team_city_name \tab character \tab Team city name. \cr
#'       team_name \tab character \tab Full team display name (e.g. 'Las Vegas Aces'). \cr
#'       team_wins_losses \tab character \tab Team wins losses. \cr
#'       pts_qtr1 \tab integer \tab Pts qtr1. \cr
#'       pts_qtr2 \tab integer \tab Pts qtr2. \cr
#'       pts_qtr3 \tab integer \tab Pts qtr3. \cr
#'       pts_qtr4 \tab integer \tab Pts qtr4. \cr
#'       pts_ot1 \tab integer \tab Pts ot1. \cr
#'       pts \tab integer \tab Points scored. \cr
#'    }}
#'    \if{latex}{See the HTML help or pkgdown reference for the column table.}
#'
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows as_tibble
#' @import rvest
#' @export
#' @family WNBA Boxscore V3 Functions
#' @details
#' ```r
#'  wnba_boxscoresummaryv3(game_id = "1022200034")
#' ```
wnba_boxscoresummaryv3 <- function(
    game_id = "1022200034",
    ...) {
  .args <- mget(setdiff(names(formals()), "..."))

  lifecycle::deprecate_warn(
    when = "3.0.0",
    what = "wnba_boxscoresummaryv3()",
    with = "wnba_boxscoresummaryv2()",
    details = "The V3 boxscore-summary endpoint still returns the full named-list shape but the core tables (`game_summary`, `line_score`, `inactive_players`, `other_stats`, `available_video`, `game_info`, `arena_info`) come back zero-row in 2025; only `officials` and `last_five_meetings` populate. The V2 endpoint still returns full data. This is a soft warning -- the call still proceeds -- and is slated to escalate to `lifecycle::deprecate_stop()` if the upstream V3 endpoint isn't restored."
  )

  version <- "boxscoresummaryv3"
  endpoint <- wnba_endpoint(version)
  full_url <- endpoint

  params <- list(
    GameID = pad_id(game_id)
  )

  df_list <- list()

  tryCatch(
    expr = {
      resp <- request_with_proxy(url = full_url, params = params, ...)

      summary_data <- resp %>%
        purrr::pluck("boxScoreSummary")

      game_summary <- summary_data %>%
        purrr::pluck("gameSummary") %>%
        data.frame(stringsAsFactors = F) %>%
        dplyr::as_tibble() %>%
        janitor::clean_names() %>%
        make_wehoop_data("WNBA Game Summary from WNBA.com", Sys.time())

      game_info <- tryCatch(
        summary_data %>%
          purrr::pluck("gameInfo") %>%
          data.frame(stringsAsFactors = F) %>%
          dplyr::as_tibble() %>%
          janitor::clean_names() %>%
          make_wehoop_data("WNBA Game Info from WNBA.com", Sys.time()),
        error = function(e) data.frame()
      )

      arena_info <- tryCatch(
        summary_data %>%
          purrr::pluck("arenaInfo") %>%
          data.frame(stringsAsFactors = F) %>%
          dplyr::as_tibble() %>%
          janitor::clean_names() %>%
          make_wehoop_data("WNBA Arena Info from WNBA.com", Sys.time()),
        error = function(e) data.frame()
      )

      officials <- tryCatch(
        summary_data %>%
          purrr::pluck("officials") %>%
          data.frame(stringsAsFactors = F) %>%
          dplyr::as_tibble() %>%
          janitor::clean_names() %>%
          make_wehoop_data("WNBA Officials from WNBA.com", Sys.time()),
        error = function(e) data.frame()
      )

      line_score <- tryCatch(
        summary_data %>%
          purrr::pluck("lineScore") %>%
          data.frame(stringsAsFactors = F) %>%
          dplyr::as_tibble() %>%
          janitor::clean_names() %>%
          make_wehoop_data("WNBA Line Score from WNBA.com", Sys.time()),
        error = function(e) data.frame()
      )

      inactive_players <- tryCatch(
        summary_data %>%
          purrr::pluck("inactivePlayers") %>%
          data.frame(stringsAsFactors = F) %>%
          dplyr::as_tibble() %>%
          janitor::clean_names() %>%
          make_wehoop_data("WNBA Inactive Players from WNBA.com", Sys.time()),
        error = function(e) data.frame()
      )

      last_five_meetings <- tryCatch(
        summary_data %>%
          purrr::pluck("lastFiveMeetings") %>%
          data.frame(stringsAsFactors = F) %>%
          dplyr::as_tibble() %>%
          janitor::clean_names() %>%
          make_wehoop_data("WNBA Last Five Meetings from WNBA.com", Sys.time()),
        error = function(e) data.frame()
      )

      other_stats <- tryCatch(
        summary_data %>%
          purrr::pluck("otherStats") %>%
          data.frame(stringsAsFactors = F) %>%
          dplyr::as_tibble() %>%
          janitor::clean_names() %>%
          make_wehoop_data("WNBA Other Stats from WNBA.com", Sys.time()),
        error = function(e) data.frame()
      )

      available_video <- tryCatch(
        summary_data %>%
          purrr::pluck("availableVideo") %>%
          data.frame(stringsAsFactors = F) %>%
          dplyr::as_tibble() %>%
          janitor::clean_names() %>%
          make_wehoop_data("WNBA Available Video from WNBA.com", Sys.time()),
        error = function(e) data.frame()
      )

      df_list <- list(
        game_summary = game_summary,
        game_info = game_info,
        arena_info = arena_info,
        officials = officials,
        line_score = line_score,
        inactive_players = inactive_players,
        last_five_meetings = last_five_meetings,
        other_stats = other_stats,
        available_video = available_video
      )
    },
    error = function(e) .report_api_error(
      e,
      hint = "Invalid arguments or no boxscore summary v3 data for {game_id} available!",
      args = .args
    ),
    warning = function(w) .report_api_warning(w, args = .args),
    finally = {
    }
  )
  return(df_list)
}


#' **Get WNBA Stats API Boxscore Hustle V2**
#' @name wnba_boxscorehustlev2
NULL
#' @title
#' **Get WNBA Stats API Boxscore Hustle V2**
#' @rdname wnba_boxscorehustlev2
#' @author Saiem Gilani
#' @param game_id Game ID
#' @param ... Additional arguments passed to an underlying function like httr.
#' @return Returns a named list of data frames: home_team_player_hustle, away_team_player_hustle,
#'  home_team_hustle_totals, away_team_hustle_totals
#'
#'    **home_team_player_hustle**
#'
#'
#'    \if{html}{\tabular{lll}{
#'       col_name \tab types \tab description \cr
#'       game_id \tab character \tab Unique game identifier. \cr
#'       away_team_id \tab integer \tab Unique identifier for the away team. \cr
#'       home_team_id \tab integer \tab Unique identifier for the home team. \cr
#'       team_id \tab integer \tab Unique team identifier. \cr
#'       team_name \tab character \tab Full team display name (e.g. 'Las Vegas Aces'). \cr
#'       team_city \tab character \tab Team city or region (e.g. 'Las Vegas'). \cr
#'       team_tricode \tab character \tab Three-letter team code (e.g. 'LAS' / 'NYL'). \cr
#'       team_slug \tab character \tab URL-safe team identifier (e.g. 'lasvegas-aces' / 'aces'). \cr
#'       person_id \tab integer \tab Unique player identifier (V3 endpoints). \cr
#'       first_name \tab character \tab Player's first name. \cr
#'       family_name \tab character \tab Player's family / last name. \cr
#'       name_i \tab character \tab Initialed name (e.g. 'A. Wilson'). \cr
#'       player_slug \tab character \tab URL-safe player identifier. \cr
#'       position \tab character \tab Listed roster position (G, F, C, etc.). \cr
#'       comment \tab character \tab Player status / inactive reason (e.g. 'DNP - Coach's Decision', 'Inactive'). \cr
#'       jersey_num \tab character \tab Jersey number worn by the player. \cr
#'       minutes \tab character \tab Minutes played, formatted MM:SS (V3 PT-duration parsed) or decimal minutes (V2). \cr
#'       points \tab integer \tab Points scored. \cr
#'       contested_shots \tab integer \tab Defensively contested shots. \cr
#'       contested_shots2pt \tab integer \tab Contested shots2pt. \cr
#'       contested_shots3pt \tab integer \tab Contested shots3pt. \cr
#'       deflections \tab integer \tab Defensive deflections. \cr
#'       charges_drawn \tab integer \tab Charges drawn. \cr
#'       screen_assists \tab integer \tab Screen assists (resulting in a basket). \cr
#'       screen_assist_points \tab integer \tab Points generated from screen assists. \cr
#'       loose_balls_recovered_offensive \tab integer \tab Loose balls recovered on offense. \cr
#'       loose_balls_recovered_defensive \tab integer \tab Loose balls recovered on defense. \cr
#'       loose_balls_recovered_total \tab integer \tab Loose balls recovered total. \cr
#'       offensive_box_outs \tab integer \tab Offensive box outs. \cr
#'       defensive_box_outs \tab integer \tab Defensive box outs. \cr
#'       box_out_player_team_rebounds \tab integer \tab Box-outs that led to either a player or team rebound. \cr
#'       box_out_player_rebounds \tab integer \tab Box-outs that led to a player rebound. \cr
#'       box_outs \tab integer \tab Box-outs executed. \cr
#'    }}
#'    \if{latex}{See the HTML help or pkgdown reference for the column table.}
#'
#'    **away_team_player_hustle**
#'
#'
#'    Same columns as the **home_team_player_hustle** table above.
#'
#'    **home_team_totals_hustle**
#'
#'
#'    \if{html}{\tabular{lll}{
#'       col_name \tab types \tab description \cr
#'       game_id \tab character \tab Unique game identifier. \cr
#'       away_team_id \tab integer \tab Unique identifier for the away team. \cr
#'       home_team_id \tab integer \tab Unique identifier for the home team. \cr
#'       team_id \tab integer \tab Unique team identifier. \cr
#'       team_name \tab character \tab Full team display name (e.g. 'Las Vegas Aces'). \cr
#'       team_city \tab character \tab Team city or region (e.g. 'Las Vegas'). \cr
#'       team_tricode \tab character \tab Three-letter team code (e.g. 'LAS' / 'NYL'). \cr
#'       team_slug \tab character \tab URL-safe team identifier (e.g. 'lasvegas-aces' / 'aces'). \cr
#'       minutes \tab character \tab Minutes played, formatted MM:SS (V3 PT-duration parsed) or decimal minutes (V2). \cr
#'       points \tab integer \tab Points scored. \cr
#'       contested_shots \tab integer \tab Defensively contested shots. \cr
#'       contested_shots2pt \tab integer \tab Contested shots2pt. \cr
#'       contested_shots3pt \tab integer \tab Contested shots3pt. \cr
#'       deflections \tab integer \tab Defensive deflections. \cr
#'       charges_drawn \tab integer \tab Charges drawn. \cr
#'       screen_assists \tab integer \tab Screen assists (resulting in a basket). \cr
#'       screen_assist_points \tab integer \tab Points generated from screen assists. \cr
#'       loose_balls_recovered_offensive \tab integer \tab Loose balls recovered on offense. \cr
#'       loose_balls_recovered_defensive \tab integer \tab Loose balls recovered on defense. \cr
#'       loose_balls_recovered_total \tab integer \tab Loose balls recovered total. \cr
#'       offensive_box_outs \tab integer \tab Offensive box outs. \cr
#'       defensive_box_outs \tab integer \tab Defensive box outs. \cr
#'       box_out_player_team_rebounds \tab integer \tab Box-outs that led to either a player or team rebound. \cr
#'       box_out_player_rebounds \tab integer \tab Box-outs that led to a player rebound. \cr
#'       box_outs \tab integer \tab Box-outs executed. \cr
#'    }}
#'    \if{latex}{See the HTML help or pkgdown reference for the column table.}
#'
#'    **away_team_totals_hustle**
#'
#'
#'    Same columns as the **home_team_totals_hustle** table above.
#'
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows as_tibble
#' @import rvest
#' @keywords internal
#' @export
#' @family WNBA Boxscore V3 Functions
#' @details
#' ```r
#'   wnba_boxscorehustlev2(game_id = "1022200034")
#' ```
wnba_boxscorehustlev2 <- function(
    game_id = "1022200034",
    ...){

  .args <- .capture_args()

  lifecycle::deprecate_stop(
    when = "3.0.0",
    what = "wnba_boxscorehustlev2()",
    details = "The `boxscorehustlev2` endpoint no longer returns data."
  )
}





#' **Get WNBA Stats API Game Rotation**
#' @name wnba_gamerotation
NULL
#' @title
#' **Get WNBA Stats API Game Rotation**
#' @rdname wnba_gamerotation
#' @author Saiem Gilani
#' @param game_id Game ID
#' @param league_id League ID 
#' @param rotation_stat Rotation stat to provide details on: PLAYER_PTS, PT_DIFF, USG_PCT
#' @param ... Additional arguments passed to an underlying function like httr.
#' @return Returns a named list of data frames: AwayTeam, HomeTeam
#' 
#'    **AwayTeam** 
#'    
#'    
#'    \if{html}{\tabular{lll}{
#'       col_name \tab types \tab description \cr
#'       GAME_ID \tab character \tab Unique game identifier. \cr
#'       TEAM_ID \tab character \tab Unique team identifier. \cr
#'       TEAM_CITY \tab character \tab Team city or region (e.g. 'Las Vegas'). \cr
#'       TEAM_NAME \tab character \tab Full team display name (e.g. 'Las Vegas Aces'). \cr
#'       PERSON_ID \tab character \tab Unique player identifier (V3 endpoints). \cr
#'       PLAYER_FIRST \tab character \tab  \cr
#'       PLAYER_LAST \tab character \tab  \cr
#'       IN_TIME_REAL \tab character \tab  \cr
#'       OUT_TIME_REAL \tab character \tab  \cr
#'       PLAYER_PTS \tab character \tab  \cr
#'       PT_DIFF \tab character \tab  \cr
#'       USG_PCT \tab character \tab Usage percentage (0-1). \cr
#'    }}
#'    \if{latex}{See the HTML help or pkgdown reference for the column table.}
#'    
#'    **HomeTeam** 
#'    
#'    
#'    Same columns as the **AwayTeam** table above.
#' 
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows as_tibble
#' @import rvest
#' @export
#' @family WNBA Boxscore Functions
#' @family WNBA Lineup Functions
#' @details 
#' ```r
#'   wnba_gamerotation(game_id = "1022200034")
#' ```
wnba_gamerotation <- function(
    game_id,
    league_id = '10', 
    rotation_stat = 'PLAYER_PTS',
    ...){
  .args <- mget(setdiff(names(formals()), "..."))
  
  version <- "gamerotation"
  endpoint <- wnba_endpoint(version)
  full_url <- endpoint
  
  params <- list(
    GameID = pad_id(game_id),
    LeagueID = league_id,
    RotationStat = rotation_stat
  )
  
  df_list <- list()

  tryCatch(
    expr = {
      
      resp <- request_with_proxy(url = full_url, params = params, ...)
      
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
    error = function(e) .report_api_error(
      e,
      hint = "Invalid arguments or no game rotation data for {game_id} available!",
      args = .args
    ),
    warning = function(w) .report_api_warning(w, args = .args),
    finally = {
    }
  )
  return(df_list)
}


## wnba_boxscoredefensivev2

#  #' **Get WNBA Stats API Boxscore Defensive V2**
#  #' @name wnba_boxscoredefensivev2
#  NULL
#  #' @title
#  #' **Get WNBA Stats API Boxscore Defensive V2**
#  #' @rdname wnba_boxscoredefensivev2
#  #' @author Saiem Gilani
#  #' @param game_id Game ID
#  #' @param start_period start_period
#  #' @param end_period end_period
#  #' @param start_range start_range
#  #' @param end_range end_range
#  #' @param range_type range_type
#  #' @param ... Additional arguments passed to an underlying function like httr.
#  #' @return A list of data frames: home_team_player_defensive, away_team_player_defensive,
#  #'  home_team_totals_defensive, away_team_totals_defensive
#  #'
#  #'    **home_team_player_defensive**
#  #'
#  #'
#  #'    |col_name                         |types     |
#  #'    |:--------------------------------|:---------|
#  #'    |game_id                          |character |
#  #'    |away_team_id                     |integer   |
#  #'    |home_team_id                     |integer   |
#  #'    |team_id                          |integer   |
#  #'    |team_name                        |character |
#  #'    |team_city                        |character |
#  #'    |team_tricode                     |character |
#  #'    |team_slug                        |character |
#  #'    |person_id                        |integer   |
#  #'    |first_name                       |character |
#  #'    |family_name                      |character |
#  #'    |name_i                           |character |
#  #'    |player_slug                      |character |
#  #'    |position                         |character |
#  #'    |comment                          |character |
#  #'    |jersey_num                       |character |
#  #'    |matchup_minutes                  |character |
#  #'    |partial_possessions              |numeric   |
#  #'    |switches_on                      |integer   |
#  #'    |player_points                    |integer   |
#  #'    |defensive_rebounds               |integer   |
#  #'    |matchup_assists                  |integer   |
#  #'    |matchup_turnovers                |integer   |
#  #'    |steals                           |integer   |
#  #'    |blocks                           |integer   |
#  #'    |matchup_field_goals_made         |integer   |
#  #'    |matchup_field_goals_attempted    |integer   |
#  #'    |matchup_field_goal_percentage    |numeric   |
#  #'    |matchup_three_pointers_made      |integer   |
#  #'    |matchup_three_pointers_attempted |integer   |
#  #'    |matchup_three_pointer_percentage |numeric   |
#  #'
#  #'    **away_team_player_defensive**
#  #'
#  #'
#  #'    |col_name                         |types     |
#  #'    |:--------------------------------|:---------|
#  #'    |game_id                          |character |
#  #'    |away_team_id                     |integer   |
#  #'    |home_team_id                     |integer   |
#  #'    |team_id                          |integer   |
#  #'    |team_name                        |character |
#  #'    |team_city                        |character |
#  #'    |team_tricode                     |character |
#  #'    |team_slug                        |character |
#  #'    |person_id                        |integer   |
#  #'    |first_name                       |character |
#  #'    |family_name                      |character |
#  #'    |name_i                           |character |
#  #'    |player_slug                      |character |
#  #'    |position                         |character |
#  #'    |comment                          |character |
#  #'    |jersey_num                       |character |
#  #'    |matchup_minutes                  |character |
#  #'    |partial_possessions              |numeric   |
#  #'    |switches_on                      |integer   |
#  #'    |player_points                    |integer   |
#  #'    |defensive_rebounds               |integer   |
#  #'    |matchup_assists                  |integer   |
#  #'    |matchup_turnovers                |integer   |
#  #'    |steals                           |integer   |
#  #'    |blocks                           |integer   |
#  #'    |matchup_field_goals_made         |integer   |
#  #'    |matchup_field_goals_attempted    |integer   |
#  #'    |matchup_field_goal_percentage    |numeric   |
#  #'    |matchup_three_pointers_made      |integer   |
#  #'    |matchup_three_pointers_attempted |integer   |
#  #'    |matchup_three_pointer_percentage |numeric   |
#  #'
#  #'    **home_team_totals_defensive**
#  #'
#  #'
#  #'    |col_name     |types     |
#  #'    |:------------|:---------|
#  #'    |game_id      |character |
#  #'    |away_team_id |integer   |
#  #'    |home_team_id |integer   |
#  #'    |team_id      |integer   |
#  #'    |team_name    |character |
#  #'    |team_city    |character |
#  #'    |team_tricode |character |
#  #'    |team_slug    |character |
#  #'
#  #'    **away_team_totals_defensive**
#  #'
#  #'
#  #'    |col_name     |types     |
#  #'    |:------------|:---------|
#  #'    |game_id      |character |
#  #'    |away_team_id |integer   |
#  #'    |home_team_id |integer   |
#  #'    |team_id      |integer   |
#  #'    |team_name    |character |
#  #'    |team_city    |character |
#  #'    |team_tricode |character |
#  #'    |team_slug    |character |
#  #'
#  #' @importFrom jsonlite fromJSON toJSON
#  #' @importFrom dplyr filter select rename bind_cols bind_rows as_tibble
#  #' @import rvest
#  #' @export
#  #' @family WNBA Boxscore V3 Functions
#  #' @details
#  #' ```r
#  #'  wnba_boxscoredefensivev2(game_id = "1022200034")
#  #' ```
#  wnba_boxscoredefensivev2 <- function(
#      game_id = "1022200034",
#      start_period = 0,
#      end_period = 14,
#      start_range = 0,
#      end_range = 0,
#      range_type = 0,
#      ...){
#    
#    version <- "boxscoredefensivev2"
#    endpoint <- wnba_endpoint(version)
#    full_url <- endpoint
#    
#    params <- list(
#      EndPeriod = end_period,
#      EndRange = end_range,
#      GameID = pad_id(game_id),
#      RangeType = range_type,
#      StartPeriod = start_period,
#      StartRange = start_range
#    )
#    
#    tryCatch(
#      expr = {
#        
#        resp <- request_with_proxy(url = full_url, params = params)
#        
#        data <- resp %>%
#          purrr::pluck("boxScoreDefensive") %>%
#          dplyr::as_tibble()
#        
#        ids_df <- data %>%
#          data.frame() %>%
#          dplyr::select("gameId","awayTeamId","homeTeamId") %>%
#          dplyr::distinct()
#        
#        home_team_data <- data %>%
#          purrr::pluck("homeTeam")
#        
#        home_team_info <- data.frame(
#          team_id = home_team_data %>% purrr::pluck("teamId"),
#          team_name = home_team_data %>% purrr::pluck("teamName"),
#          team_city = home_team_data %>% purrr::pluck("teamCity"),
#          team_tricode = home_team_data %>% purrr::pluck("teamTricode"),
#          team_slug = home_team_data %>% purrr::pluck("teamSlug")
#        )
#        
#        home_team_totals <- home_team_data %>%
#          purrr::pluck("statistics") %>%
#          data.frame(stringsAsFactors = F)
#        
#        home_team_players <- home_team_data %>%
#          purrr::pluck("players") %>%
#          data.frame(stringsAsFactors = F) %>%
#          tidyr::unnest("statistics")
#        
#        home_team_totals <- ids_df %>%
#          dplyr::bind_cols(home_team_info) %>%
#          dplyr::bind_cols(home_team_totals) %>%
#          janitor::clean_names() %>%
#          make_wehoop_data("WNBA Home Team Boxscore Information from WNBA.com", Sys.time())
#        
#        home_team_players <- ids_df %>%
#          dplyr::bind_cols(home_team_info) %>%
#          dplyr::bind_cols(home_team_players) %>%
#          janitor::clean_names() %>%
#          make_wehoop_data("WNBA Home Player Boxscore Information from WNBA.com", Sys.time())
#        
#        
#        away_team_data <- data %>%
#          purrr::pluck("awayTeam")
#        
#        away_team_info <- data.frame(
#          team_id = away_team_data %>% purrr::pluck("teamId"),
#          team_name = away_team_data %>% purrr::pluck("teamName"),
#          team_city = away_team_data %>% purrr::pluck("teamCity"),
#          team_tricode = away_team_data %>% purrr::pluck("teamTricode"),
#          team_slug = away_team_data %>% purrr::pluck("teamSlug")
#        )
#        
#        away_team_totals <- away_team_data %>%
#          purrr::pluck("statistics") %>%
#          data.frame(stringsAsFactors = F)
#        
#        away_team_players <- away_team_data %>%
#          purrr::pluck("players") %>%
#          data.frame(stringsAsFactors = F) %>%
#          tidyr::unnest("statistics")
#        
#        away_team_totals <- ids_df %>%
#          dplyr::bind_cols(away_team_info) %>%
#          dplyr::bind_cols(away_team_totals) %>%
#          janitor::clean_names() %>%
#          make_wehoop_data("WNBA Away Team Boxscore Information from WNBA.com", Sys.time())
#        
#        away_team_players <- ids_df %>%
#          dplyr::bind_cols(away_team_info) %>%
#          dplyr::bind_cols(away_team_players) %>%
#          janitor::clean_names() %>%
#          make_wehoop_data("WNBA Away Player Boxscore Information from WNBA.com", Sys.time())
#        
#        df_list <- c(
#          list(home_team_players),
#          list(away_team_players),
#          list(home_team_totals),
#          list(away_team_totals)
#        )
#        names(df_list) <- c(
#          "home_team_player_defensive",
#          "away_team_player_defensive",
#          "home_team_totals_defensive",
#          "away_team_totals_defensive"
#        )
#        
#      },
#      error = function(e) {
#        cli::cli_alert_danger("{Sys.time()}: Invalid arguments or no defensive boxscore v2 data for {game_id} available!")
#      },
#      warning = function(w) {
#      },
#      finally = {
#      }
#    )
#    return(df_list)
#  }


## wnba_boxscorematchupsv3


#  #' **Get WNBA Stats API Boxscore Matchups V3**
#  #' @name wnba_boxscorematchupsv3
#    NULL
#  #' @title
#  #' **Get WNBA Stats API Boxscore Matchups V3**
#  #' @rdname wnba_boxscorematchupsv3
#  #' @author Saiem Gilani
#  #' @param game_id Game ID
#  #' @param start_period start_period
#  #' @param end_period end_period
#  #' @param start_range start_range
#  #' @param end_range end_range
#  #' @param range_type range_type
#  #' @param ... Additional arguments passed to an underlying function like httr.
#  #' @return A list of data frames: home_team_player_matchups, away_team_player_matchups
#  #'
#  #'    **home_team_player_matchups**
#  #'
#  #'
#  #'    |col_name                          |types     |
#  #'    |:---------------------------------|:---------|
#  #'    |game_id                           |character |
#  #'    |away_team_id                      |integer   |
#  #'    |home_team_id                      |integer   |
#  #'    |team_id                           |integer   |
#  #'    |team_name                         |character |
#  #'    |team_city                         |character |
#  #'    |team_tricode                      |character |
#  #'    |team_slug                         |character |
#  #'    |person_id                         |integer   |
#  #'    |first_name                        |character |
#  #'    |family_name                       |character |
#  #'    |name_i                            |character |
#  #'    |player_slug                       |character |
#  #'    |position                          |character |
#  #'    |comment                           |character |
#  #'    |jersey_num                        |character |
#  #'    |matchups_person_id                |integer   |
#  #'    |matchups_first_name               |character |
#  #'    |matchups_family_name              |character |
#  #'    |matchups_name_i                   |character |
#  #'    |matchups_player_slug              |character |
#  #'    |matchups_jersey_num               |character |
#  #'    |matchup_minutes                   |character |
#  #'    |matchup_minutes_sort              |numeric   |
#  #'    |partial_possessions               |numeric   |
#  #'    |percentage_defender_total_time    |numeric   |
#  #'    |percentage_offensive_total_time   |numeric   |
#  #'    |percentage_total_time_both_on     |numeric   |
#  #'    |switches_on                       |integer   |
#  #'    |player_points                     |integer   |
#  #'    |team_points                       |integer   |
#  #'    |matchup_assists                   |integer   |
#  #'    |matchup_potential_assists         |integer   |
#  #'    |matchup_turnovers                 |integer   |
#  #'    |matchup_blocks                    |integer   |
#  #'    |matchup_field_goals_made          |integer   |
#  #'    |matchup_field_goals_attempted     |integer   |
#  #'    |matchup_field_goals_percentage    |numeric   |
#  #'    |matchup_three_pointers_made       |integer   |
#  #'    |matchup_three_pointers_attempted  |integer   |
#  #'    |matchup_three_pointers_percentage |numeric   |
#  #'    |help_blocks                       |integer   |
#  #'    |help_field_goals_made             |integer   |
#  #'    |help_field_goals_attempted        |integer   |
#  #'    |help_field_goals_percentage       |numeric   |
#  #'    |matchup_free_throws_made          |integer   |
#  #'    |matchup_free_throws_attempted     |integer   |
#  #'    |shooting_fouls                    |integer   |
#  #'
#  #'    **away_team_player_matchups**
#  #'
#  #'
#  #'    |col_name                          |types     |
#  #'    |:---------------------------------|:---------|
#  #'    |game_id                           |character |
#  #'    |away_team_id                      |integer   |
#  #'    |home_team_id                      |integer   |
#  #'    |team_id                           |integer   |
#  #'    |team_name                         |character |
#  #'    |team_city                         |character |
#  #'    |team_tricode                      |character |
#  #'    |team_slug                         |character |
#  #'    |person_id                         |integer   |
#  #'    |first_name                        |character |
#  #'    |family_name                       |character |
#  #'    |name_i                            |character |
#  #'    |player_slug                       |character |
#  #'    |position                          |character |
#  #'    |comment                           |character |
#  #'    |jersey_num                        |character |
#  #'    |matchups_person_id                |integer   |
#  #'    |matchups_first_name               |character |
#  #'    |matchups_family_name              |character |
#  #'    |matchups_name_i                   |character |
#  #'    |matchups_player_slug              |character |
#  #'    |matchups_jersey_num               |character |
#  #'    |matchup_minutes                   |character |
#  #'    |matchup_minutes_sort              |numeric   |
#  #'    |partial_possessions               |numeric   |
#  #'    |percentage_defender_total_time    |numeric   |
#  #'    |percentage_offensive_total_time   |numeric   |
#  #'    |percentage_total_time_both_on     |numeric   |
#  #'    |switches_on                       |integer   |
#  #'    |player_points                     |integer   |
#  #'    |team_points                       |integer   |
#  #'    |matchup_assists                   |integer   |
#  #'    |matchup_potential_assists         |integer   |
#  #'    |matchup_turnovers                 |integer   |
#  #'    |matchup_blocks                    |integer   |
#  #'    |matchup_field_goals_made          |integer   |
#  #'    |matchup_field_goals_attempted     |integer   |
#  #'    |matchup_field_goals_percentage    |numeric   |
#  #'    |matchup_three_pointers_made       |integer   |
#  #'    |matchup_three_pointers_attempted  |integer   |
#  #'    |matchup_three_pointers_percentage |numeric   |
#  #'    |help_blocks                       |integer   |
#  #'    |help_field_goals_made             |integer   |
#  #'    |help_field_goals_attempted        |integer   |
#  #'    |help_field_goals_percentage       |numeric   |
#  #'    |matchup_free_throws_made          |integer   |
#  #'    |matchup_free_throws_attempted     |integer   |
#  #'    |shooting_fouls                    |integer   |
#  #'
#  #' @importFrom jsonlite fromJSON toJSON
#  #' @importFrom dplyr filter select rename bind_cols bind_rows as_tibble
#  #' @import rvest
#  #' @export
#  #' @family WNBA Boxscore V3 Functions
#  #' @details
#  #' (No Matchups Data for WNBA yet, so defunct)
#  #' ```r
#  #'  wnba_boxscorematchupsv3(game_id = "1022200034")
#  #' ```
#  wnba_boxscorematchupsv3 <- function(
    #      game_id = "1022200034",
#      start_period = 0,
#      end_period = 14,
#      start_range = 0,
#      end_range = 0,
#      range_type = 0,
#      ...){
#    
#    version <- "boxscorematchupsv3"
#    endpoint <- wnba_endpoint(version)
#    full_url <- endpoint
#    
#    params <- list(
#      EndPeriod = end_period,
#      EndRange = end_range,
#      GameID = pad_id(game_id),
#      RangeType = range_type,
#      StartPeriod = start_period,
#      StartRange = start_range
#    )
#    
#    tryCatch(
#      expr = {
#        
#        resp <- request_with_proxy(url = full_url, params = params)
#        
#        data <- resp %>%
#          purrr::pluck("boxScoreMatchups") %>%
#          dplyr::as_tibble()
#        
#        ids_df <- data %>%
#          data.frame() %>%
#          dplyr::select("gameId","awayTeamId","homeTeamId") %>%
#          dplyr::distinct()
#        
#        home_team_data <- data %>%
#          purrr::pluck("homeTeam")
#        if (is.null(home_team_data$teamCity)) {
#          return(cli::cli_alert_danger("{Sys.time()}: No matchups boxscore v3 data for {game_id} available!"))
#        }
#        home_team_info <- data.frame(
#          team_id = home_team_data %>% purrr::pluck("teamId"),
#          team_name = home_team_data %>% purrr::pluck("teamName"),
#          team_city = home_team_data %>% purrr::pluck("teamCity"),
#          team_tricode = home_team_data %>% purrr::pluck("teamTricode"),
#          team_slug = home_team_data %>% purrr::pluck("teamSlug")
#        )
#        
#        home_team_players <- home_team_data %>%
#          purrr::pluck("players") %>%
#          data.frame(stringsAsFactors = F) %>%
#          tidyr::unnest("matchups", names_sep = "_") %>%
#          tidyr::unnest("matchups_statistics")
#        
#        home_team_players <- ids_df %>%
#          dplyr::bind_cols(home_team_info) %>%
#          dplyr::bind_cols(home_team_players) %>%
#          janitor::clean_names() %>%
#          make_wehoop_data("WNBA Home Player Boxscore Information from WNBA.com", Sys.time())
#        
#        
#        away_team_data <- data %>%
#          purrr::pluck("awayTeam")
#        
#        away_team_info <- data.frame(
#          team_id = away_team_data %>% purrr::pluck("teamId"),
#          team_name = away_team_data %>% purrr::pluck("teamName"),
#          team_city = away_team_data %>% purrr::pluck("teamCity"),
#          team_tricode = away_team_data %>% purrr::pluck("teamTricode"),
#          team_slug = away_team_data %>% purrr::pluck("teamSlug")
#        )
#        
#        away_team_players <- away_team_data %>%
#          purrr::pluck("players") %>%
#          data.frame(stringsAsFactors = F) %>%
#          tidyr::unnest("matchups", names_sep = "_") %>%
#          tidyr::unnest("matchups_statistics")
#        
#        away_team_players <- ids_df %>%
#          dplyr::bind_cols(away_team_info) %>%
#          dplyr::bind_cols(away_team_players) %>%
#          janitor::clean_names() %>%
#          make_wehoop_data("WNBA Away Player Boxscore Information from WNBA.com", Sys.time())
#        
#        df_list <- c(
#          list(home_team_players),
#          list(away_team_players)
#        )
#        names(df_list) <- c(
#          "home_team_player_matchups",
#          "away_team_player_matchups"
#        )
#        
#      },
#      error = function(e) {
#        cli::cli_alert_danger("{Sys.time()}: Invalid arguments or no matchups boxscore v3 data for {game_id} available!")
#      },
#      warning = function(w) {
#      },
#      finally = {
#      }
#    )
#    return(df_list)
#  }
