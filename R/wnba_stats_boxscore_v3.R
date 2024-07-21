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
#'    |col_name                  |types     |
#'    |:-------------------------|:---------|
#'    |game_id                   |character |
#'    |away_team_id              |integer   |
#'    |home_team_id              |integer   |
#'    |team_id                   |integer   |
#'    |team_name                 |character |
#'    |team_city                 |character |
#'    |team_tricode              |character |
#'    |team_slug                 |character |
#'    |person_id                 |integer   |
#'    |first_name                |character |
#'    |family_name               |character |
#'    |name_i                    |character |
#'    |player_slug               |character |
#'    |position                  |character |
#'    |comment                   |character |
#'    |jersey_num                |character |
#'    |minutes                   |character |
#'    |field_goals_made          |integer   |
#'    |field_goals_attempted     |integer   |
#'    |field_goals_percentage    |numeric   |
#'    |three_pointers_made       |integer   |
#'    |three_pointers_attempted  |integer   |
#'    |three_pointers_percentage |numeric   |
#'    |free_throws_made          |integer   |
#'    |free_throws_attempted     |integer   |
#'    |free_throws_percentage    |numeric   |
#'    |rebounds_offensive        |integer   |
#'    |rebounds_defensive        |integer   |
#'    |rebounds_total            |integer   |
#'    |assists                   |integer   |
#'    |steals                    |integer   |
#'    |blocks                    |integer   |
#'    |turnovers                 |integer   |
#'    |fouls_personal            |integer   |
#'    |points                    |integer   |
#'    |plus_minus_points         |numeric   |
#'
#'    **away_team_player_traditional**
#'
#'
#'    |col_name                  |types     |
#'    |:-------------------------|:---------|
#'    |game_id                   |character |
#'    |away_team_id              |integer   |
#'    |home_team_id              |integer   |
#'    |team_id                   |integer   |
#'    |team_name                 |character |
#'    |team_city                 |character |
#'    |team_tricode              |character |
#'    |team_slug                 |character |
#'    |person_id                 |integer   |
#'    |first_name                |character |
#'    |family_name               |character |
#'    |name_i                    |character |
#'    |player_slug               |character |
#'    |position                  |character |
#'    |comment                   |character |
#'    |jersey_num                |character |
#'    |minutes                   |character |
#'    |field_goals_made          |integer   |
#'    |field_goals_attempted     |integer   |
#'    |field_goals_percentage    |numeric   |
#'    |three_pointers_made       |integer   |
#'    |three_pointers_attempted  |integer   |
#'    |three_pointers_percentage |numeric   |
#'    |free_throws_made          |integer   |
#'    |free_throws_attempted     |integer   |
#'    |free_throws_percentage    |numeric   |
#'    |rebounds_offensive        |integer   |
#'    |rebounds_defensive        |integer   |
#'    |rebounds_total            |integer   |
#'    |assists                   |integer   |
#'    |steals                    |integer   |
#'    |blocks                    |integer   |
#'    |turnovers                 |integer   |
#'    |fouls_personal            |integer   |
#'    |points                    |integer   |
#'    |plus_minus_points         |numeric   |
#'
#'    **home_team_totals_traditional**
#'
#'
#'    |col_name                  |types     |
#'    |:-------------------------|:---------|
#'    |game_id                   |character |
#'    |away_team_id              |integer   |
#'    |home_team_id              |integer   |
#'    |team_id                   |integer   |
#'    |team_name                 |character |
#'    |team_city                 |character |
#'    |team_tricode              |character |
#'    |team_slug                 |character |
#'    |minutes                   |character |
#'    |field_goals_made          |integer   |
#'    |field_goals_attempted     |integer   |
#'    |field_goals_percentage    |numeric   |
#'    |three_pointers_made       |integer   |
#'    |three_pointers_attempted  |integer   |
#'    |three_pointers_percentage |numeric   |
#'    |free_throws_made          |integer   |
#'    |free_throws_attempted     |integer   |
#'    |free_throws_percentage    |numeric   |
#'    |rebounds_offensive        |integer   |
#'    |rebounds_defensive        |integer   |
#'    |rebounds_total            |integer   |
#'    |assists                   |integer   |
#'    |steals                    |integer   |
#'    |blocks                    |integer   |
#'    |turnovers                 |integer   |
#'    |fouls_personal            |integer   |
#'    |points                    |integer   |
#'    |plus_minus_points         |numeric   |
#'
#'    **away_team_totals_traditional**
#'
#'
#'    |col_name                  |types     |
#'    |:-------------------------|:---------|
#'    |game_id                   |character |
#'    |away_team_id              |integer   |
#'    |home_team_id              |integer   |
#'    |team_id                   |integer   |
#'    |team_name                 |character |
#'    |team_city                 |character |
#'    |team_tricode              |character |
#'    |team_slug                 |character |
#'    |minutes                   |character |
#'    |field_goals_made          |integer   |
#'    |field_goals_attempted     |integer   |
#'    |field_goals_percentage    |numeric   |
#'    |three_pointers_made       |integer   |
#'    |three_pointers_attempted  |integer   |
#'    |three_pointers_percentage |numeric   |
#'    |free_throws_made          |integer   |
#'    |free_throws_attempted     |integer   |
#'    |free_throws_percentage    |numeric   |
#'    |rebounds_offensive        |integer   |
#'    |rebounds_defensive        |integer   |
#'    |rebounds_total            |integer   |
#'    |assists                   |integer   |
#'    |steals                    |integer   |
#'    |blocks                    |integer   |
#'    |turnovers                 |integer   |
#'    |fouls_personal            |integer   |
#'    |points                    |integer   |
#'    |plus_minus_points         |numeric   |
#'
#'    **home_team_starters_totals**
#'
#'
#'    |col_name                  |types     |
#'    |:-------------------------|:---------|
#'    |game_id                   |character |
#'    |away_team_id              |integer   |
#'    |home_team_id              |integer   |
#'    |team_id                   |integer   |
#'    |team_name                 |character |
#'    |team_city                 |character |
#'    |team_tricode              |character |
#'    |team_slug                 |character |
#'    |minutes                   |character |
#'    |field_goals_made          |integer   |
#'    |field_goals_attempted     |integer   |
#'    |field_goals_percentage    |numeric   |
#'    |three_pointers_made       |integer   |
#'    |three_pointers_attempted  |integer   |
#'    |three_pointers_percentage |numeric   |
#'    |free_throws_made          |integer   |
#'    |free_throws_attempted     |integer   |
#'    |free_throws_percentage    |numeric   |
#'    |rebounds_offensive        |integer   |
#'    |rebounds_defensive        |integer   |
#'    |rebounds_total            |integer   |
#'    |assists                   |integer   |
#'    |steals                    |integer   |
#'    |blocks                    |integer   |
#'    |turnovers                 |integer   |
#'    |fouls_personal            |integer   |
#'    |points                    |integer   |
#'
#'    **away_team_starters_totals**
#'
#'
#'    |col_name                  |types     |
#'    |:-------------------------|:---------|
#'    |game_id                   |character |
#'    |away_team_id              |integer   |
#'    |home_team_id              |integer   |
#'    |team_id                   |integer   |
#'    |team_name                 |character |
#'    |team_city                 |character |
#'    |team_tricode              |character |
#'    |team_slug                 |character |
#'    |minutes                   |character |
#'    |field_goals_made          |integer   |
#'    |field_goals_attempted     |integer   |
#'    |field_goals_percentage    |numeric   |
#'    |three_pointers_made       |integer   |
#'    |three_pointers_attempted  |integer   |
#'    |three_pointers_percentage |numeric   |
#'    |free_throws_made          |integer   |
#'    |free_throws_attempted     |integer   |
#'    |free_throws_percentage    |numeric   |
#'    |rebounds_offensive        |integer   |
#'    |rebounds_defensive        |integer   |
#'    |rebounds_total            |integer   |
#'    |assists                   |integer   |
#'    |steals                    |integer   |
#'    |blocks                    |integer   |
#'    |turnovers                 |integer   |
#'    |fouls_personal            |integer   |
#'    |points                    |integer   |
#'
#'    **home_team_bench_totals**
#'
#'
#'    |col_name                  |types     |
#'    |:-------------------------|:---------|
#'    |game_id                   |character |
#'    |away_team_id              |integer   |
#'    |home_team_id              |integer   |
#'    |team_id                   |integer   |
#'    |team_name                 |character |
#'    |team_city                 |character |
#'    |team_tricode              |character |
#'    |team_slug                 |character |
#'    |minutes                   |character |
#'    |field_goals_made          |integer   |
#'    |field_goals_attempted     |integer   |
#'    |field_goals_percentage    |numeric   |
#'    |three_pointers_made       |integer   |
#'    |three_pointers_attempted  |integer   |
#'    |three_pointers_percentage |numeric   |
#'    |free_throws_made          |integer   |
#'    |free_throws_attempted     |integer   |
#'    |free_throws_percentage    |numeric   |
#'    |rebounds_offensive        |integer   |
#'    |rebounds_defensive        |integer   |
#'    |rebounds_total            |integer   |
#'    |assists                   |integer   |
#'    |steals                    |integer   |
#'    |blocks                    |integer   |
#'    |turnovers                 |integer   |
#'    |fouls_personal            |integer   |
#'    |points                    |integer   |
#'
#'    **away_team_bench_totals**
#'
#'
#'    |col_name                  |types     |
#'    |:-------------------------|:---------|
#'    |game_id                   |character |
#'    |away_team_id              |integer   |
#'    |home_team_id              |integer   |
#'    |team_id                   |integer   |
#'    |team_name                 |character |
#'    |team_city                 |character |
#'    |team_tricode              |character |
#'    |team_slug                 |character |
#'    |minutes                   |character |
#'    |field_goals_made          |integer   |
#'    |field_goals_attempted     |integer   |
#'    |field_goals_percentage    |numeric   |
#'    |three_pointers_made       |integer   |
#'    |three_pointers_attempted  |integer   |
#'    |three_pointers_percentage |numeric   |
#'    |free_throws_made          |integer   |
#'    |free_throws_attempted     |integer   |
#'    |free_throws_percentage    |numeric   |
#'    |rebounds_offensive        |integer   |
#'    |rebounds_defensive        |integer   |
#'    |rebounds_total            |integer   |
#'    |assists                   |integer   |
#'    |steals                    |integer   |
#'    |blocks                    |integer   |
#'    |turnovers                 |integer   |
#'    |fouls_personal            |integer   |
#'    |points                    |integer   |
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
    error = function(e) {
      message(glue::glue("{Sys.time()}: Invalid arguments or no traditional boxscore v3 data for {game_id} available!"))
      message(glue::glue("Error:\n{e}"))
    },
    warning = function(w) {
      message(glue::glue("{Sys.time()}: Warning:\n{w}"))
    },
    finally = {
    }
  )
  return(df_list)
}

#' **Get WNBA Stats API Boxscore Advanced V3**
#' @name wnba_boxscoreadvancedv3
NULL
#' @title
#' **Get WNBA Stats API Boxscore Advanced V3**
#' @rdname wnba_boxscoreadvancedv3
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
#'    |col_name                        |types     |
#'    |:-------------------------------|:---------|
#'    |game_id                         |character |
#'    |away_team_id                    |integer   |
#'    |home_team_id                    |integer   |
#'    |team_id                         |integer   |
#'    |team_name                       |character |
#'    |team_city                       |character |
#'    |team_tricode                    |character |
#'    |team_slug                       |character |
#'    |person_id                       |integer   |
#'    |first_name                      |character |
#'    |family_name                     |character |
#'    |name_i                          |character |
#'    |player_slug                     |character |
#'    |position                        |character |
#'    |comment                         |character |
#'    |jersey_num                      |character |
#'    |minutes                         |character |
#'    |estimated_offensive_rating      |numeric   |
#'    |offensive_rating                |numeric   |
#'    |estimated_defensive_rating      |numeric   |
#'    |defensive_rating                |numeric   |
#'    |estimated_net_rating            |numeric   |
#'    |net_rating                      |numeric   |
#'    |assist_percentage               |numeric   |
#'    |assist_to_turnover              |numeric   |
#'    |assist_ratio                    |numeric   |
#'    |offensive_rebound_percentage    |numeric   |
#'    |defensive_rebound_percentage    |numeric   |
#'    |rebound_percentage              |numeric   |
#'    |turnover_ratio                  |numeric   |
#'    |effective_field_goal_percentage |numeric   |
#'    |true_shooting_percentage        |numeric   |
#'    |usage_percentage                |numeric   |
#'    |estimated_usage_percentage      |numeric   |
#'    |estimated_pace                  |numeric   |
#'    |pace                            |numeric   |
#'    |pace_per40                      |numeric   |
#'    |possessions                     |numeric   |
#'    |pie                             |numeric   |
#'
#'    **away_team_player_advanced**
#'
#'
#'    |col_name                        |types     |
#'    |:-------------------------------|:---------|
#'    |game_id                         |character |
#'    |away_team_id                    |integer   |
#'    |home_team_id                    |integer   |
#'    |team_id                         |integer   |
#'    |team_name                       |character |
#'    |team_city                       |character |
#'    |team_tricode                    |character |
#'    |team_slug                       |character |
#'    |person_id                       |integer   |
#'    |first_name                      |character |
#'    |family_name                     |character |
#'    |name_i                          |character |
#'    |player_slug                     |character |
#'    |position                        |character |
#'    |comment                         |character |
#'    |jersey_num                      |character |
#'    |minutes                         |character |
#'    |estimated_offensive_rating      |numeric   |
#'    |offensive_rating                |numeric   |
#'    |estimated_defensive_rating      |numeric   |
#'    |defensive_rating                |numeric   |
#'    |estimated_net_rating            |numeric   |
#'    |net_rating                      |numeric   |
#'    |assist_percentage               |numeric   |
#'    |assist_to_turnover              |numeric   |
#'    |assist_ratio                    |numeric   |
#'    |offensive_rebound_percentage    |numeric   |
#'    |defensive_rebound_percentage    |numeric   |
#'    |rebound_percentage              |numeric   |
#'    |turnover_ratio                  |numeric   |
#'    |effective_field_goal_percentage |numeric   |
#'    |true_shooting_percentage        |numeric   |
#'    |usage_percentage                |numeric   |
#'    |estimated_usage_percentage      |numeric   |
#'    |estimated_pace                  |numeric   |
#'    |pace                            |numeric   |
#'    |pace_per40                      |numeric   |
#'    |possessions                     |numeric   |
#'    |pie                             |numeric   |
#'
#'    **home_team_totals_advanced**
#'
#'
#'    |col_name                           |types     |
#'    |:----------------------------------|:---------|
#'    |game_id                            |character |
#'    |away_team_id                       |integer   |
#'    |home_team_id                       |integer   |
#'    |team_id                            |integer   |
#'    |team_name                          |character |
#'    |team_city                          |character |
#'    |team_tricode                       |character |
#'    |team_slug                          |character |
#'    |minutes                            |character |
#'    |estimated_offensive_rating         |numeric   |
#'    |offensive_rating                   |numeric   |
#'    |estimated_defensive_rating         |numeric   |
#'    |defensive_rating                   |numeric   |
#'    |estimated_net_rating               |numeric   |
#'    |net_rating                         |numeric   |
#'    |assist_percentage                  |numeric   |
#'    |assist_to_turnover                 |numeric   |
#'    |assist_ratio                       |numeric   |
#'    |offensive_rebound_percentage       |numeric   |
#'    |defensive_rebound_percentage       |numeric   |
#'    |rebound_percentage                 |numeric   |
#'    |estimated_team_turnover_percentage |numeric   |
#'    |turnover_ratio                     |numeric   |
#'    |effective_field_goal_percentage    |numeric   |
#'    |true_shooting_percentage           |numeric   |
#'    |usage_percentage                   |numeric   |
#'    |estimated_usage_percentage         |numeric   |
#'    |estimated_pace                     |numeric   |
#'    |pace                               |numeric   |
#'    |pace_per40                         |numeric   |
#'    |possessions                        |numeric   |
#'    |pie                                |numeric   |
#'
#'    **away_team_totals_advanced**
#'
#'
#'    |col_name                           |types     |
#'    |:----------------------------------|:---------|
#'    |game_id                            |character |
#'    |away_team_id                       |integer   |
#'    |home_team_id                       |integer   |
#'    |team_id                            |integer   |
#'    |team_name                          |character |
#'    |team_city                          |character |
#'    |team_tricode                       |character |
#'    |team_slug                          |character |
#'    |minutes                            |character |
#'    |estimated_offensive_rating         |numeric   |
#'    |offensive_rating                   |numeric   |
#'    |estimated_defensive_rating         |numeric   |
#'    |defensive_rating                   |numeric   |
#'    |estimated_net_rating               |numeric   |
#'    |net_rating                         |numeric   |
#'    |assist_percentage                  |numeric   |
#'    |assist_to_turnover                 |numeric   |
#'    |assist_ratio                       |numeric   |
#'    |offensive_rebound_percentage       |numeric   |
#'    |defensive_rebound_percentage       |numeric   |
#'    |rebound_percentage                 |numeric   |
#'    |estimated_team_turnover_percentage |numeric   |
#'    |turnover_ratio                     |numeric   |
#'    |effective_field_goal_percentage    |numeric   |
#'    |true_shooting_percentage           |numeric   |
#'    |usage_percentage                   |numeric   |
#'    |estimated_usage_percentage         |numeric   |
#'    |estimated_pace                     |numeric   |
#'    |pace                               |numeric   |
#'    |pace_per40                         |numeric   |
#'    |possessions                        |numeric   |
#'    |pie                                |numeric   |
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
    error = function(e) {
      message(glue::glue("{Sys.time()}: Invalid arguments or no advanced boxscore v3 data for {game_id} available!"))
      message(glue::glue("Error:\n{e}"))
    },
    warning = function(w) {
      message(glue::glue("{Sys.time()}: Warning:\n{w}"))
    },
    finally = {
    }
  )
  return(df_list)
}


#' **Get WNBA Stats API Boxscore Misc V3**
#' @name wnba_boxscoremiscv3
NULL
#' @title
#' **Get WNBA Stats API Boxscore Misc V3**
#' @rdname wnba_boxscoremiscv3
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
#'    |col_name                 |types     |
#'    |:------------------------|:---------|
#'    |game_id                  |character |
#'    |away_team_id             |integer   |
#'    |home_team_id             |integer   |
#'    |team_id                  |integer   |
#'    |team_name                |character |
#'    |team_city                |character |
#'    |team_tricode             |character |
#'    |team_slug                |character |
#'    |person_id                |integer   |
#'    |first_name               |character |
#'    |family_name              |character |
#'    |name_i                   |character |
#'    |player_slug              |character |
#'    |position                 |character |
#'    |comment                  |character |
#'    |jersey_num               |character |
#'    |minutes                  |character |
#'    |points_off_turnovers     |integer   |
#'    |points_second_chance     |integer   |
#'    |points_fast_break        |integer   |
#'    |points_paint             |integer   |
#'    |opp_points_off_turnovers |integer   |
#'    |opp_points_second_chance |integer   |
#'    |opp_points_fast_break    |integer   |
#'    |opp_points_paint         |integer   |
#'    |blocks                   |integer   |
#'    |blocks_against           |integer   |
#'    |fouls_personal           |integer   |
#'    |fouls_drawn              |integer   |
#'
#'    **away_team_player_misc**
#'
#'
#'    |col_name                 |types     |
#'    |:------------------------|:---------|
#'    |game_id                  |character |
#'    |away_team_id             |integer   |
#'    |home_team_id             |integer   |
#'    |team_id                  |integer   |
#'    |team_name                |character |
#'    |team_city                |character |
#'    |team_tricode             |character |
#'    |team_slug                |character |
#'    |person_id                |integer   |
#'    |first_name               |character |
#'    |family_name              |character |
#'    |name_i                   |character |
#'    |player_slug              |character |
#'    |position                 |character |
#'    |comment                  |character |
#'    |jersey_num               |character |
#'    |minutes                  |character |
#'    |points_off_turnovers     |integer   |
#'    |points_second_chance     |integer   |
#'    |points_fast_break        |integer   |
#'    |points_paint             |integer   |
#'    |opp_points_off_turnovers |integer   |
#'    |opp_points_second_chance |integer   |
#'    |opp_points_fast_break    |integer   |
#'    |opp_points_paint         |integer   |
#'    |blocks                   |integer   |
#'    |blocks_against           |integer   |
#'    |fouls_personal           |integer   |
#'    |fouls_drawn              |integer   |
#'
#'    **home_team_totals_misc**
#'
#'
#'    |col_name                 |types     |
#'    |:------------------------|:---------|
#'    |game_id                  |character |
#'    |away_team_id             |integer   |
#'    |home_team_id             |integer   |
#'    |team_id                  |integer   |
#'    |team_name                |character |
#'    |team_city                |character |
#'    |team_tricode             |character |
#'    |team_slug                |character |
#'    |minutes                  |character |
#'    |points_off_turnovers     |integer   |
#'    |points_second_chance     |integer   |
#'    |points_fast_break        |integer   |
#'    |points_paint             |integer   |
#'    |opp_points_off_turnovers |integer   |
#'    |opp_points_second_chance |integer   |
#'    |opp_points_fast_break    |integer   |
#'    |opp_points_paint         |integer   |
#'    |blocks                   |integer   |
#'    |blocks_against           |integer   |
#'    |fouls_personal           |integer   |
#'    |fouls_drawn              |integer   |
#'
#'    **away_team_totals_misc**
#'
#'
#'    |col_name                 |types     |
#'    |:------------------------|:---------|
#'    |game_id                  |character |
#'    |away_team_id             |integer   |
#'    |home_team_id             |integer   |
#'    |team_id                  |integer   |
#'    |team_name                |character |
#'    |team_city                |character |
#'    |team_tricode             |character |
#'    |team_slug                |character |
#'    |minutes                  |character |
#'    |points_off_turnovers     |integer   |
#'    |points_second_chance     |integer   |
#'    |points_fast_break        |integer   |
#'    |points_paint             |integer   |
#'    |opp_points_off_turnovers |integer   |
#'    |opp_points_second_chance |integer   |
#'    |opp_points_fast_break    |integer   |
#'    |opp_points_paint         |integer   |
#'    |blocks                   |integer   |
#'    |blocks_against           |integer   |
#'    |fouls_personal           |integer   |
#'    |fouls_drawn              |integer   |
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
    error = function(e) {
      message(glue::glue("{Sys.time()}: Invalid arguments or no misc boxscore v3 data for {game_id} available!"))
      message(glue::glue("Error:\n{e}"))
    },
    warning = function(w) {
      message(glue::glue("{Sys.time()}: Warning:\n{w}"))
    },
    finally = {
    }
  )
  return(df_list)
}


#' **Get WNBA Stats API Boxscore Scoring V3**
#' @name wnba_boxscorescoringv3
NULL
#' @title
#' **Get WNBA Stats API Boxscore Scoring V3**
#' @rdname wnba_boxscorescoringv3
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
#'    |col_name                            |types     |
#'    |:-----------------------------------|:---------|
#'    |game_id                             |character |
#'    |away_team_id                        |integer   |
#'    |home_team_id                        |integer   |
#'    |team_id                             |integer   |
#'    |team_name                           |character |
#'    |team_city                           |character |
#'    |team_tricode                        |character |
#'    |team_slug                           |character |
#'    |person_id                           |integer   |
#'    |first_name                          |character |
#'    |family_name                         |character |
#'    |name_i                              |character |
#'    |player_slug                         |character |
#'    |position                            |character |
#'    |comment                             |character |
#'    |jersey_num                          |character |
#'    |minutes                             |character |
#'    |percentage_field_goals_attempted2pt |numeric   |
#'    |percentage_field_goals_attempted3pt |numeric   |
#'    |percentage_points2pt                |numeric   |
#'    |percentage_points_midrange2pt       |numeric   |
#'    |percentage_points3pt                |numeric   |
#'    |percentage_points_fast_break        |numeric   |
#'    |percentage_points_free_throw        |numeric   |
#'    |percentage_points_off_turnovers     |numeric   |
#'    |percentage_points_paint             |numeric   |
#'    |percentage_assisted2pt              |numeric   |
#'    |percentage_unassisted2pt            |numeric   |
#'    |percentage_assisted3pt              |numeric   |
#'    |percentage_unassisted3pt            |numeric   |
#'    |percentage_assisted_fgm             |numeric   |
#'    |percentage_unassisted_fgm           |numeric   |
#'
#'    **away_team_player_scoring**
#'
#'
#'    |col_name                            |types     |
#'    |:-----------------------------------|:---------|
#'    |game_id                             |character |
#'    |away_team_id                        |integer   |
#'    |home_team_id                        |integer   |
#'    |team_id                             |integer   |
#'    |team_name                           |character |
#'    |team_city                           |character |
#'    |team_tricode                        |character |
#'    |team_slug                           |character |
#'    |person_id                           |integer   |
#'    |first_name                          |character |
#'    |family_name                         |character |
#'    |name_i                              |character |
#'    |player_slug                         |character |
#'    |position                            |character |
#'    |comment                             |character |
#'    |jersey_num                          |character |
#'    |minutes                             |character |
#'    |percentage_field_goals_attempted2pt |numeric   |
#'    |percentage_field_goals_attempted3pt |numeric   |
#'    |percentage_points2pt                |numeric   |
#'    |percentage_points_midrange2pt       |numeric   |
#'    |percentage_points3pt                |numeric   |
#'    |percentage_points_fast_break        |numeric   |
#'    |percentage_points_free_throw        |numeric   |
#'    |percentage_points_off_turnovers     |numeric   |
#'    |percentage_points_paint             |numeric   |
#'    |percentage_assisted2pt              |numeric   |
#'    |percentage_unassisted2pt            |numeric   |
#'    |percentage_assisted3pt              |numeric   |
#'    |percentage_unassisted3pt            |numeric   |
#'    |percentage_assisted_fgm             |numeric   |
#'    |percentage_unassisted_fgm           |numeric   |
#'
#'    **home_team_totals_scoring**
#'
#'
#'    |col_name                            |types     |
#'    |:-----------------------------------|:---------|
#'    |game_id                             |character |
#'    |away_team_id                        |integer   |
#'    |home_team_id                        |integer   |
#'    |team_id                             |integer   |
#'    |team_name                           |character |
#'    |team_city                           |character |
#'    |team_tricode                        |character |
#'    |team_slug                           |character |
#'    |minutes                             |character |
#'    |percentage_field_goals_attempted2pt |numeric   |
#'    |percentage_field_goals_attempted3pt |numeric   |
#'    |percentage_points2pt                |numeric   |
#'    |percentage_points_midrange2pt       |numeric   |
#'    |percentage_points3pt                |numeric   |
#'    |percentage_points_fast_break        |numeric   |
#'    |percentage_points_free_throw        |numeric   |
#'    |percentage_points_off_turnovers     |numeric   |
#'    |percentage_points_paint             |numeric   |
#'    |percentage_assisted2pt              |numeric   |
#'    |percentage_unassisted2pt            |numeric   |
#'    |percentage_assisted3pt              |numeric   |
#'    |percentage_unassisted3pt            |numeric   |
#'    |percentage_assisted_fgm             |numeric   |
#'    |percentage_unassisted_fgm           |numeric   |
#'
#'    **away_team_totals_scoring**
#'
#'
#'    |col_name                            |types     |
#'    |:-----------------------------------|:---------|
#'    |game_id                             |character |
#'    |away_team_id                        |integer   |
#'    |home_team_id                        |integer   |
#'    |team_id                             |integer   |
#'    |team_name                           |character |
#'    |team_city                           |character |
#'    |team_tricode                        |character |
#'    |team_slug                           |character |
#'    |minutes                             |character |
#'    |percentage_field_goals_attempted2pt |numeric   |
#'    |percentage_field_goals_attempted3pt |numeric   |
#'    |percentage_points2pt                |numeric   |
#'    |percentage_points_midrange2pt       |numeric   |
#'    |percentage_points3pt                |numeric   |
#'    |percentage_points_fast_break        |numeric   |
#'    |percentage_points_free_throw        |numeric   |
#'    |percentage_points_off_turnovers     |numeric   |
#'    |percentage_points_paint             |numeric   |
#'    |percentage_assisted2pt              |numeric   |
#'    |percentage_unassisted2pt            |numeric   |
#'    |percentage_assisted3pt              |numeric   |
#'    |percentage_unassisted3pt            |numeric   |
#'    |percentage_assisted_fgm             |numeric   |
#'    |percentage_unassisted_fgm           |numeric   |
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
    error = function(e) {
      message(glue::glue("{Sys.time()}: Invalid arguments or no scoring boxscore v3 data for {game_id} available!"))
      message(glue::glue("Error:\n{e}"))
    },
    warning = function(w) {
      message(glue::glue("{Sys.time()}: Warning:\n{w}"))
    },
    finally = {
    }
  )
  return(df_list)
}


#' **Get WNBA Stats API Boxscore Four Factors V3**
#' @name wnba_boxscorefourfactorsv3
NULL
#' @title
#' **Get WNBA Stats API Boxscore Four Factors V3**
#' @rdname wnba_boxscorefourfactorsv3
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
#'    |col_name                            |types     |
#'    |:-----------------------------------|:---------|
#'    |game_id                             |character |
#'    |away_team_id                        |integer   |
#'    |home_team_id                        |integer   |
#'    |team_id                             |integer   |
#'    |team_name                           |character |
#'    |team_city                           |character |
#'    |team_tricode                        |character |
#'    |team_slug                           |character |
#'    |person_id                           |integer   |
#'    |first_name                          |character |
#'    |family_name                         |character |
#'    |name_i                              |character |
#'    |player_slug                         |character |
#'    |position                            |character |
#'    |comment                             |character |
#'    |jersey_num                          |character |
#'    |minutes                             |character |
#'    |effective_field_goal_percentage     |numeric   |
#'    |free_throw_attempt_rate             |numeric   |
#'    |team_turnover_percentage            |numeric   |
#'    |offensive_rebound_percentage        |numeric   |
#'    |opp_effective_field_goal_percentage |numeric   |
#'    |opp_free_throw_attempt_rate         |numeric   |
#'    |opp_team_turnover_percentage        |numeric   |
#'    |opp_offensive_rebound_percentage    |numeric   |
#'
#'    **away_team_player_four_factors**
#'
#'
#'    |col_name                            |types     |
#'    |:-----------------------------------|:---------|
#'    |game_id                             |character |
#'    |away_team_id                        |integer   |
#'    |home_team_id                        |integer   |
#'    |team_id                             |integer   |
#'    |team_name                           |character |
#'    |team_city                           |character |
#'    |team_tricode                        |character |
#'    |team_slug                           |character |
#'    |person_id                           |integer   |
#'    |first_name                          |character |
#'    |family_name                         |character |
#'    |name_i                              |character |
#'    |player_slug                         |character |
#'    |position                            |character |
#'    |comment                             |character |
#'    |jersey_num                          |character |
#'    |minutes                             |character |
#'    |effective_field_goal_percentage     |numeric   |
#'    |free_throw_attempt_rate             |numeric   |
#'    |team_turnover_percentage            |numeric   |
#'    |offensive_rebound_percentage        |numeric   |
#'    |opp_effective_field_goal_percentage |numeric   |
#'    |opp_free_throw_attempt_rate         |numeric   |
#'    |opp_team_turnover_percentage        |numeric   |
#'    |opp_offensive_rebound_percentage    |numeric   |
#'
#'    **home_team_totals_four_factors**
#'
#'
#'    |col_name                            |types     |
#'    |:-----------------------------------|:---------|
#'    |game_id                             |character |
#'    |away_team_id                        |integer   |
#'    |home_team_id                        |integer   |
#'    |team_id                             |integer   |
#'    |team_name                           |character |
#'    |team_city                           |character |
#'    |team_tricode                        |character |
#'    |team_slug                           |character |
#'    |minutes                             |character |
#'    |effective_field_goal_percentage     |numeric   |
#'    |free_throw_attempt_rate             |numeric   |
#'    |team_turnover_percentage            |numeric   |
#'    |offensive_rebound_percentage        |numeric   |
#'    |opp_effective_field_goal_percentage |numeric   |
#'    |opp_free_throw_attempt_rate         |numeric   |
#'    |opp_team_turnover_percentage        |numeric   |
#'    |opp_offensive_rebound_percentage    |numeric   |
#'
#'    **away_team_totals_four_factors**
#'
#'
#'    |col_name                            |types     |
#'    |:-----------------------------------|:---------|
#'    |game_id                             |character |
#'    |away_team_id                        |integer   |
#'    |home_team_id                        |integer   |
#'    |team_id                             |integer   |
#'    |team_name                           |character |
#'    |team_city                           |character |
#'    |team_tricode                        |character |
#'    |team_slug                           |character |
#'    |minutes                             |character |
#'    |effective_field_goal_percentage     |numeric   |
#'    |free_throw_attempt_rate             |numeric   |
#'    |team_turnover_percentage            |numeric   |
#'    |offensive_rebound_percentage        |numeric   |
#'    |opp_effective_field_goal_percentage |numeric   |
#'    |opp_free_throw_attempt_rate         |numeric   |
#'    |opp_team_turnover_percentage        |numeric   |
#'    |opp_offensive_rebound_percentage    |numeric   |
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
    error = function(e) {
      message(glue::glue("{Sys.time()}: Invalid arguments or no four factors boxscore v3 data for {game_id} available!"))
      message(glue::glue("Error:\n{e}"))
    },
    warning = function(w) {
      message(glue::glue("{Sys.time()}: Warning:\n{w}"))
    },
    finally = {
    }
  )
  return(df_list)
}


#' **Get WNBA Stats API Boxscore Player Tracking V3**
#' @name wnba_boxscoreplayertrackv3
NULL
#' @title
#' **Get WNBA Stats API Boxscore Player Tracking V3**
#' @rdname wnba_boxscoreplayertrackv3
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
#'    |col_name                              |types     |
#'    |:-------------------------------------|:---------|
#'    |game_id                               |character |
#'    |away_team_id                          |integer   |
#'    |home_team_id                          |integer   |
#'    |team_id                               |integer   |
#'    |team_name                             |character |
#'    |team_city                             |character |
#'    |team_tricode                          |character |
#'    |team_slug                             |character |
#'    |person_id                             |integer   |
#'    |first_name                            |character |
#'    |family_name                           |character |
#'    |name_i                                |character |
#'    |player_slug                           |character |
#'    |position                              |character |
#'    |comment                               |character |
#'    |jersey_num                            |character |
#'    |minutes                               |character |
#'    |speed                                 |numeric   |
#'    |distance                              |numeric   |
#'    |rebound_chances_offensive             |integer   |
#'    |rebound_chances_defensive             |integer   |
#'    |rebound_chances_total                 |integer   |
#'    |touches                               |integer   |
#'    |secondary_assists                     |integer   |
#'    |free_throw_assists                    |integer   |
#'    |passes                                |integer   |
#'    |assists                               |integer   |
#'    |contested_field_goals_made            |integer   |
#'    |contested_field_goals_attempted       |integer   |
#'    |contested_field_goal_percentage       |numeric   |
#'    |uncontested_field_goals_made          |integer   |
#'    |uncontested_field_goals_attempted     |integer   |
#'    |uncontested_field_goals_percentage    |numeric   |
#'    |field_goal_percentage                 |numeric   |
#'    |defended_at_rim_field_goals_made      |integer   |
#'    |defended_at_rim_field_goals_attempted |integer   |
#'    |defended_at_rim_field_goal_percentage |numeric   |
#'
#'    **away_team_player_player_track**
#'
#'
#'    |col_name                              |types     |
#'    |:-------------------------------------|:---------|
#'    |game_id                               |character |
#'    |away_team_id                          |integer   |
#'    |home_team_id                          |integer   |
#'    |team_id                               |integer   |
#'    |team_name                             |character |
#'    |team_city                             |character |
#'    |team_tricode                          |character |
#'    |team_slug                             |character |
#'    |person_id                             |integer   |
#'    |first_name                            |character |
#'    |family_name                           |character |
#'    |name_i                                |character |
#'    |player_slug                           |character |
#'    |position                              |character |
#'    |comment                               |character |
#'    |jersey_num                            |character |
#'    |minutes                               |character |
#'    |speed                                 |numeric   |
#'    |distance                              |numeric   |
#'    |rebound_chances_offensive             |integer   |
#'    |rebound_chances_defensive             |integer   |
#'    |rebound_chances_total                 |integer   |
#'    |touches                               |integer   |
#'    |secondary_assists                     |integer   |
#'    |free_throw_assists                    |integer   |
#'    |passes                                |integer   |
#'    |assists                               |integer   |
#'    |contested_field_goals_made            |integer   |
#'    |contested_field_goals_attempted       |integer   |
#'    |contested_field_goal_percentage       |numeric   |
#'    |uncontested_field_goals_made          |integer   |
#'    |uncontested_field_goals_attempted     |integer   |
#'    |uncontested_field_goals_percentage    |numeric   |
#'    |field_goal_percentage                 |numeric   |
#'    |defended_at_rim_field_goals_made      |integer   |
#'    |defended_at_rim_field_goals_attempted |integer   |
#'    |defended_at_rim_field_goal_percentage |numeric   |
#'
#'    **home_team_totals_player_track**
#'
#'
#'    |col_name                              |types     |
#'    |:-------------------------------------|:---------|
#'    |game_id                               |character |
#'    |away_team_id                          |integer   |
#'    |home_team_id                          |integer   |
#'    |team_id                               |integer   |
#'    |team_name                             |character |
#'    |team_city                             |character |
#'    |team_tricode                          |character |
#'    |team_slug                             |character |
#'    |minutes                               |character |
#'    |distance                              |numeric   |
#'    |rebound_chances_offensive             |integer   |
#'    |rebound_chances_defensive             |integer   |
#'    |rebound_chances_total                 |integer   |
#'    |touches                               |integer   |
#'    |secondary_assists                     |integer   |
#'    |free_throw_assists                    |integer   |
#'    |passes                                |integer   |
#'    |assists                               |integer   |
#'    |contested_field_goals_made            |integer   |
#'    |contested_field_goals_attempted       |integer   |
#'    |contested_field_goal_percentage       |numeric   |
#'    |uncontested_field_goals_made          |integer   |
#'    |uncontested_field_goals_attempted     |integer   |
#'    |uncontested_field_goals_percentage    |numeric   |
#'    |field_goal_percentage                 |numeric   |
#'    |defended_at_rim_field_goals_made      |integer   |
#'    |defended_at_rim_field_goals_attempted |integer   |
#'    |defended_at_rim_field_goal_percentage |numeric   |
#'
#'    **away_team_totals_player_track**
#'
#'
#'    |col_name                              |types     |
#'    |:-------------------------------------|:---------|
#'    |game_id                               |character |
#'    |away_team_id                          |integer   |
#'    |home_team_id                          |integer   |
#'    |team_id                               |integer   |
#'    |team_name                             |character |
#'    |team_city                             |character |
#'    |team_tricode                          |character |
#'    |team_slug                             |character |
#'    |minutes                               |character |
#'    |distance                              |numeric   |
#'    |rebound_chances_offensive             |integer   |
#'    |rebound_chances_defensive             |integer   |
#'    |rebound_chances_total                 |integer   |
#'    |touches                               |integer   |
#'    |secondary_assists                     |integer   |
#'    |free_throw_assists                    |integer   |
#'    |passes                                |integer   |
#'    |assists                               |integer   |
#'    |contested_field_goals_made            |integer   |
#'    |contested_field_goals_attempted       |integer   |
#'    |contested_field_goal_percentage       |numeric   |
#'    |uncontested_field_goals_made          |integer   |
#'    |uncontested_field_goals_attempted     |integer   |
#'    |uncontested_field_goals_percentage    |numeric   |
#'    |field_goal_percentage                 |numeric   |
#'    |defended_at_rim_field_goals_made      |integer   |
#'    |defended_at_rim_field_goals_attempted |integer   |
#'    |defended_at_rim_field_goal_percentage |numeric   |
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
    error = function(e) {
      message(glue::glue("{Sys.time()}: Invalid arguments or no player tracking boxscore v3 data for {game_id} available!"))
      message(glue::glue("Error:\n{e}"))
    },
    warning = function(w) {
      message(glue::glue("{Sys.time()}: Warning:\n{w}"))
    },
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
#'    |col_name                        |types     |
#'    |:-------------------------------|:---------|
#'    |game_id                         |character |
#'    |away_team_id                    |integer   |
#'    |home_team_id                    |integer   |
#'    |team_id                         |integer   |
#'    |team_name                       |character |
#'    |team_city                       |character |
#'    |team_tricode                    |character |
#'    |team_slug                       |character |
#'    |person_id                       |integer   |
#'    |first_name                      |character |
#'    |family_name                     |character |
#'    |name_i                          |character |
#'    |player_slug                     |character |
#'    |position                        |character |
#'    |comment                         |character |
#'    |jersey_num                      |character |
#'    |minutes                         |character |
#'    |points                          |integer   |
#'    |contested_shots                 |integer   |
#'    |contested_shots2pt              |integer   |
#'    |contested_shots3pt              |integer   |
#'    |deflections                     |integer   |
#'    |charges_drawn                   |integer   |
#'    |screen_assists                  |integer   |
#'    |screen_assist_points            |integer   |
#'    |loose_balls_recovered_offensive |integer   |
#'    |loose_balls_recovered_defensive |integer   |
#'    |loose_balls_recovered_total     |integer   |
#'    |offensive_box_outs              |integer   |
#'    |defensive_box_outs              |integer   |
#'    |box_out_player_team_rebounds    |integer   |
#'    |box_out_player_rebounds         |integer   |
#'    |box_outs                        |integer   |
#'
#'    **away_team_player_hustle**
#'
#'
#'    |col_name                        |types     |
#'    |:-------------------------------|:---------|
#'    |game_id                         |character |
#'    |away_team_id                    |integer   |
#'    |home_team_id                    |integer   |
#'    |team_id                         |integer   |
#'    |team_name                       |character |
#'    |team_city                       |character |
#'    |team_tricode                    |character |
#'    |team_slug                       |character |
#'    |person_id                       |integer   |
#'    |first_name                      |character |
#'    |family_name                     |character |
#'    |name_i                          |character |
#'    |player_slug                     |character |
#'    |position                        |character |
#'    |comment                         |character |
#'    |jersey_num                      |character |
#'    |minutes                         |character |
#'    |points                          |integer   |
#'    |contested_shots                 |integer   |
#'    |contested_shots2pt              |integer   |
#'    |contested_shots3pt              |integer   |
#'    |deflections                     |integer   |
#'    |charges_drawn                   |integer   |
#'    |screen_assists                  |integer   |
#'    |screen_assist_points            |integer   |
#'    |loose_balls_recovered_offensive |integer   |
#'    |loose_balls_recovered_defensive |integer   |
#'    |loose_balls_recovered_total     |integer   |
#'    |offensive_box_outs              |integer   |
#'    |defensive_box_outs              |integer   |
#'    |box_out_player_team_rebounds    |integer   |
#'    |box_out_player_rebounds         |integer   |
#'    |box_outs                        |integer   |
#'
#'    **home_team_totals_hustle**
#'
#'
#'    |col_name                        |types     |
#'    |:-------------------------------|:---------|
#'    |game_id                         |character |
#'    |away_team_id                    |integer   |
#'    |home_team_id                    |integer   |
#'    |team_id                         |integer   |
#'    |team_name                       |character |
#'    |team_city                       |character |
#'    |team_tricode                    |character |
#'    |team_slug                       |character |
#'    |minutes                         |character |
#'    |points                          |integer   |
#'    |contested_shots                 |integer   |
#'    |contested_shots2pt              |integer   |
#'    |contested_shots3pt              |integer   |
#'    |deflections                     |integer   |
#'    |charges_drawn                   |integer   |
#'    |screen_assists                  |integer   |
#'    |screen_assist_points            |integer   |
#'    |loose_balls_recovered_offensive |integer   |
#'    |loose_balls_recovered_defensive |integer   |
#'    |loose_balls_recovered_total     |integer   |
#'    |offensive_box_outs              |integer   |
#'    |defensive_box_outs              |integer   |
#'    |box_out_player_team_rebounds    |integer   |
#'    |box_out_player_rebounds         |integer   |
#'    |box_outs                        |integer   |
#'
#'    **away_team_totals_hustle**
#'
#'
#'    |col_name                        |types     |
#'    |:-------------------------------|:---------|
#'    |game_id                         |character |
#'    |away_team_id                    |integer   |
#'    |home_team_id                    |integer   |
#'    |team_id                         |integer   |
#'    |team_name                       |character |
#'    |team_city                       |character |
#'    |team_tricode                    |character |
#'    |team_slug                       |character |
#'    |minutes                         |character |
#'    |points                          |integer   |
#'    |contested_shots                 |integer   |
#'    |contested_shots2pt              |integer   |
#'    |contested_shots3pt              |integer   |
#'    |deflections                     |integer   |
#'    |charges_drawn                   |integer   |
#'    |screen_assists                  |integer   |
#'    |screen_assist_points            |integer   |
#'    |loose_balls_recovered_offensive |integer   |
#'    |loose_balls_recovered_defensive |integer   |
#'    |loose_balls_recovered_total     |integer   |
#'    |offensive_box_outs              |integer   |
#'    |defensive_box_outs              |integer   |
#'    |box_out_player_team_rebounds    |integer   |
#'    |box_out_player_rebounds         |integer   |
#'    |box_outs                        |integer   |
#'
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows as_tibble
#' @import rvest
#' @export
#' @family WNBA Boxscore V3 Functions
#' @details
#' ```r
#'   wnba_boxscorehustlev2(game_id = "1022200034")
#' ```
wnba_boxscorehustlev2 <- function(
    game_id = "1022200034",
    ...){
  
  version <- "boxscorehustlev2"
  endpoint <- wnba_endpoint(version)
  full_url <- endpoint
  
  params <- list(
    GameID = pad_id(game_id)
  )
  tryCatch(
    expr = {
      
      resp <- request_with_proxy(url = full_url, params = params, ...)
      
      box_score_hustle <- resp %>%
        purrr::pluck("boxScoreHustle")
      
      ids_df <- data.frame(
        gameId = box_score_hustle %>% purrr::pluck("gameId"),
        awayTeamId = box_score_hustle %>% purrr::pluck("awayTeamId"),
        homeTeamId = box_score_hustle %>% purrr::pluck("homeTeamId")
      )
      
      ids_df <- ids_df %>% 
        dplyr::distinct()
      
      home_team_hustle <- box_score_hustle %>%
        purrr::pluck("homeTeam")
      
      home_team_info <- data.frame(
        team_id = home_team_hustle %>% purrr::pluck("teamId"),
        team_name = home_team_hustle %>% purrr::pluck("teamName"),
        team_city = home_team_hustle %>% purrr::pluck("teamCity"),
        team_tricode = home_team_hustle %>% purrr::pluck("teamTricode"),
        team_slug = home_team_hustle %>% purrr::pluck("teamSlug")
      )
      
      home_team_totals <- home_team_hustle %>%
        purrr::pluck("statistics") %>%
        data.frame(stringsAsFactors = F)
      
      home_team_players <- home_team_hustle %>%
        purrr::pluck("players") %>%
        data.frame(stringsAsFactors = F) %>%
        tidyr::unnest("statistics")
      
      home_team_totals <- ids_df %>%
        dplyr::bind_cols(home_team_info) %>%
        dplyr::bind_cols(home_team_totals) %>%
        janitor::clean_names() %>%
        make_wehoop_data("WNBA Home Team Hustle Boxscore Information from WNBA.com", Sys.time())
      
      home_team_players <- ids_df %>%
        dplyr::bind_cols(home_team_info) %>%
        dplyr::bind_cols(home_team_players) %>%
        janitor::clean_names() %>%
        make_wehoop_data("WNBA Home Player Hustle Boxscore Information from WNBA.com", Sys.time())
      
      away_team_hustle <- box_score_hustle %>%
        purrr::pluck("awayTeam")
      
      away_team_info <- data.frame(
        team_id = away_team_hustle %>% purrr::pluck("teamId"),
        team_name = away_team_hustle %>% purrr::pluck("teamName"),
        team_city = away_team_hustle %>% purrr::pluck("teamCity"),
        team_tricode = away_team_hustle %>% purrr::pluck("teamTricode"),
        team_slug = away_team_hustle %>% purrr::pluck("teamSlug")
      )
      
      away_team_totals <- away_team_hustle %>%
        purrr::pluck("statistics") %>%
        data.frame(stringsAsFactors = F)
      
      away_team_players <- away_team_hustle %>%
        purrr::pluck("players") %>%
        data.frame(stringsAsFactors = F) %>%
        tidyr::unnest("statistics")
      
      away_team_totals <- ids_df %>%
        dplyr::bind_cols(away_team_info) %>%
        dplyr::bind_cols(away_team_totals) %>%
        janitor::clean_names() %>%
        make_wehoop_data("WNBA Away Team Hustle Boxscore Information from WNBA.com", Sys.time())
      
      away_team_players <- ids_df %>%
        dplyr::bind_cols(away_team_info) %>%
        dplyr::bind_cols(away_team_players) %>%
        janitor::clean_names() %>%
        make_wehoop_data("WNBA Away Player Hustle Boxscore Information from WNBA.com", Sys.time())
      
      df_list <- c(
        list(home_team_players),
        list(away_team_players),
        list(home_team_totals),
        list(away_team_totals)
      )
      names(df_list) <- c(
        "home_team_player_hustle",
        "away_team_player_hustle",
        "home_team_totals_hustle",
        "away_team_totals_hustle"
      )
      
      
    },
    error = function(e) {
      message(glue::glue("{Sys.time()}: Invalid arguments or no hustle stats boxscore v2 data for {game_id} available!"))
      message(glue::glue("Error:\n{e}"))
    },
    warning = function(w) {
      message(glue::glue("{Sys.time()}: Warning:\n{w}"))
    },
    finally = {
    }
  )
  return(df_list)
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
#'    |col_name      |types     |
#'    |:-------------|:---------|
#'    |GAME_ID       |character |
#'    |TEAM_ID       |character |
#'    |TEAM_CITY     |character |
#'    |TEAM_NAME     |character |
#'    |PERSON_ID     |character |
#'    |PLAYER_FIRST  |character |
#'    |PLAYER_LAST   |character |
#'    |IN_TIME_REAL  |character |
#'    |OUT_TIME_REAL |character |
#'    |PLAYER_PTS    |character |
#'    |PT_DIFF       |character |
#'    |USG_PCT       |character |
#'    
#'    **HomeTeam** 
#'    
#'    
#'    |col_name      |types     |
#'    |:-------------|:---------|
#'    |GAME_ID       |character |
#'    |TEAM_ID       |character |
#'    |TEAM_CITY     |character |
#'    |TEAM_NAME     |character |
#'    |PERSON_ID     |character |
#'    |PLAYER_FIRST  |character |
#'    |PLAYER_LAST   |character |
#'    |IN_TIME_REAL  |character |
#'    |OUT_TIME_REAL |character |
#'    |PLAYER_PTS    |character |
#'    |PT_DIFF       |character |
#'    |USG_PCT       |character |
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
  
  version <- "gamerotation"
  endpoint <- wnba_endpoint(version)
  full_url <- endpoint
  
  params <- list(
    GameID = pad_id(game_id),
    LeagueID = league_id,
    RotationStat = rotation_stat
  )
  
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
    error = function(e) {
      message(glue::glue("{Sys.time()}: Invalid arguments or no game rotation data for {game_id} available!"))
      message(glue::glue("Error:\n{e}"))
    },
    warning = function(w) {
      message(glue::glue("{Sys.time()}: Warning:\n{w}"))
    },
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
#        message(glue::glue("{Sys.time()}: Invalid arguments or no defensive boxscore v2 data for {game_id} available!"))
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
#          return(message(glue::glue("{Sys.time()}: No matchups boxscore v3 data for {game_id} available!")))
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
#        message(glue::glue("{Sys.time()}: Invalid arguments or no matchups boxscore v3 data for {game_id} available!"))
#      },
#      warning = function(w) {
#      },
#      finally = {
#      }
#    )
#    return(df_list)
#  }
