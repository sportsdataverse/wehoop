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
#'    |col_name                  |types     |description                                                                      |
#'    |:-------------------------|:---------|:--------------------------------------------------------------------------------|
#'    |game_id                   |character |Unique game identifier.                                                          |
#'    |away_team_id              |integer   |Unique identifier for the away team.                                             |
#'    |home_team_id              |integer   |Unique identifier for the home team.                                             |
#'    |team_id                   |integer   |Unique team identifier.                                                          |
#'    |team_name                 |character |Full team display name (e.g. 'Las Vegas Aces').                                  |
#'    |team_city                 |character |Team city or region (e.g. 'Las Vegas').                                          |
#'    |team_tricode              |character |Three-letter team code (e.g. 'LAS' / 'NYL').                                     |
#'    |team_slug                 |character |URL-safe team identifier (e.g. 'lasvegas-aces' / 'aces').                        |
#'    |person_id                 |integer   |Unique player identifier (V3 endpoints).                                         |
#'    |first_name                |character |Player's first name.                                                             |
#'    |family_name               |character |Player's family / last name.                                                     |
#'    |name_i                    |character |Initialed name (e.g. 'A. Wilson').                                               |
#'    |player_slug               |character |URL-safe player identifier.                                                      |
#'    |position                  |character |Listed roster position (G, F, C, etc.).                                          |
#'    |comment                   |character |Player status / inactive reason (e.g. 'DNP - Coach's Decision', 'Inactive').     |
#'    |jersey_num                |character |Jersey number worn by the player.                                                |
#'    |minutes                   |character |Minutes played, formatted MM:SS (V3 PT-duration parsed) or decimal minutes (V2). |
#'    |field_goals_made          |integer   |Field goals made (2-pt + 3-pt).                                                  |
#'    |field_goals_attempted     |integer   |Field goal attempts (2-pt + 3-pt).                                               |
#'    |field_goals_percentage    |numeric   |Field goal percentage (0-1 decimal).                                             |
#'    |three_pointers_made       |integer   |Three-point field goals made.                                                    |
#'    |three_pointers_attempted  |integer   |Three-point field goal attempts.                                                 |
#'    |three_pointers_percentage |numeric   |Three-point field goal percentage (0-1 decimal).                                 |
#'    |free_throws_made          |integer   |Free throws made.                                                                |
#'    |free_throws_attempted     |integer   |Free throw attempts.                                                             |
#'    |free_throws_percentage    |numeric   |Free throw percentage (0-1 decimal).                                             |
#'    |rebounds_offensive        |integer   |Offensive rebounds.                                                              |
#'    |rebounds_defensive        |integer   |Defensive rebounds.                                                              |
#'    |rebounds_total            |integer   |Total rebounds.                                                                  |
#'    |assists                   |integer   |Total assists.                                                                   |
#'    |steals                    |integer   |Total steals.                                                                    |
#'    |blocks                    |integer   |Total blocks.                                                                    |
#'    |turnovers                 |integer   |Total turnovers.                                                                 |
#'    |fouls_personal            |integer   |Personal fouls.                                                                  |
#'    |points                    |integer   |Points scored.                                                                   |
#'    |plus_minus_points         |numeric   |Plus/minus point differential while on court.                                    |
#'
#'    **away_team_player_traditional**
#'
#'
#'    |col_name                  |types     |description                                                                      |
#'    |:-------------------------|:---------|:--------------------------------------------------------------------------------|
#'    |game_id                   |character |Unique game identifier.                                                          |
#'    |away_team_id              |integer   |Unique identifier for the away team.                                             |
#'    |home_team_id              |integer   |Unique identifier for the home team.                                             |
#'    |team_id                   |integer   |Unique team identifier.                                                          |
#'    |team_name                 |character |Full team display name (e.g. 'Las Vegas Aces').                                  |
#'    |team_city                 |character |Team city or region (e.g. 'Las Vegas').                                          |
#'    |team_tricode              |character |Three-letter team code (e.g. 'LAS' / 'NYL').                                     |
#'    |team_slug                 |character |URL-safe team identifier (e.g. 'lasvegas-aces' / 'aces').                        |
#'    |person_id                 |integer   |Unique player identifier (V3 endpoints).                                         |
#'    |first_name                |character |Player's first name.                                                             |
#'    |family_name               |character |Player's family / last name.                                                     |
#'    |name_i                    |character |Initialed name (e.g. 'A. Wilson').                                               |
#'    |player_slug               |character |URL-safe player identifier.                                                      |
#'    |position                  |character |Listed roster position (G, F, C, etc.).                                          |
#'    |comment                   |character |Player status / inactive reason (e.g. 'DNP - Coach's Decision', 'Inactive').     |
#'    |jersey_num                |character |Jersey number worn by the player.                                                |
#'    |minutes                   |character |Minutes played, formatted MM:SS (V3 PT-duration parsed) or decimal minutes (V2). |
#'    |field_goals_made          |integer   |Field goals made (2-pt + 3-pt).                                                  |
#'    |field_goals_attempted     |integer   |Field goal attempts (2-pt + 3-pt).                                               |
#'    |field_goals_percentage    |numeric   |Field goal percentage (0-1 decimal).                                             |
#'    |three_pointers_made       |integer   |Three-point field goals made.                                                    |
#'    |three_pointers_attempted  |integer   |Three-point field goal attempts.                                                 |
#'    |three_pointers_percentage |numeric   |Three-point field goal percentage (0-1 decimal).                                 |
#'    |free_throws_made          |integer   |Free throws made.                                                                |
#'    |free_throws_attempted     |integer   |Free throw attempts.                                                             |
#'    |free_throws_percentage    |numeric   |Free throw percentage (0-1 decimal).                                             |
#'    |rebounds_offensive        |integer   |Offensive rebounds.                                                              |
#'    |rebounds_defensive        |integer   |Defensive rebounds.                                                              |
#'    |rebounds_total            |integer   |Total rebounds.                                                                  |
#'    |assists                   |integer   |Total assists.                                                                   |
#'    |steals                    |integer   |Total steals.                                                                    |
#'    |blocks                    |integer   |Total blocks.                                                                    |
#'    |turnovers                 |integer   |Total turnovers.                                                                 |
#'    |fouls_personal            |integer   |Personal fouls.                                                                  |
#'    |points                    |integer   |Points scored.                                                                   |
#'    |plus_minus_points         |numeric   |Plus/minus point differential while on court.                                    |
#'
#'    **home_team_totals_traditional**
#'
#'
#'    |col_name                  |types     |description                                                                      |
#'    |:-------------------------|:---------|:--------------------------------------------------------------------------------|
#'    |game_id                   |character |Unique game identifier.                                                          |
#'    |away_team_id              |integer   |Unique identifier for the away team.                                             |
#'    |home_team_id              |integer   |Unique identifier for the home team.                                             |
#'    |team_id                   |integer   |Unique team identifier.                                                          |
#'    |team_name                 |character |Full team display name (e.g. 'Las Vegas Aces').                                  |
#'    |team_city                 |character |Team city or region (e.g. 'Las Vegas').                                          |
#'    |team_tricode              |character |Three-letter team code (e.g. 'LAS' / 'NYL').                                     |
#'    |team_slug                 |character |URL-safe team identifier (e.g. 'lasvegas-aces' / 'aces').                        |
#'    |minutes                   |character |Minutes played, formatted MM:SS (V3 PT-duration parsed) or decimal minutes (V2). |
#'    |field_goals_made          |integer   |Field goals made (2-pt + 3-pt).                                                  |
#'    |field_goals_attempted     |integer   |Field goal attempts (2-pt + 3-pt).                                               |
#'    |field_goals_percentage    |numeric   |Field goal percentage (0-1 decimal).                                             |
#'    |three_pointers_made       |integer   |Three-point field goals made.                                                    |
#'    |three_pointers_attempted  |integer   |Three-point field goal attempts.                                                 |
#'    |three_pointers_percentage |numeric   |Three-point field goal percentage (0-1 decimal).                                 |
#'    |free_throws_made          |integer   |Free throws made.                                                                |
#'    |free_throws_attempted     |integer   |Free throw attempts.                                                             |
#'    |free_throws_percentage    |numeric   |Free throw percentage (0-1 decimal).                                             |
#'    |rebounds_offensive        |integer   |Offensive rebounds.                                                              |
#'    |rebounds_defensive        |integer   |Defensive rebounds.                                                              |
#'    |rebounds_total            |integer   |Total rebounds.                                                                  |
#'    |assists                   |integer   |Total assists.                                                                   |
#'    |steals                    |integer   |Total steals.                                                                    |
#'    |blocks                    |integer   |Total blocks.                                                                    |
#'    |turnovers                 |integer   |Total turnovers.                                                                 |
#'    |fouls_personal            |integer   |Personal fouls.                                                                  |
#'    |points                    |integer   |Points scored.                                                                   |
#'    |plus_minus_points         |numeric   |Plus/minus point differential while on court.                                    |
#'
#'    **away_team_totals_traditional**
#'
#'
#'    |col_name                  |types     |description                                                                      |
#'    |:-------------------------|:---------|:--------------------------------------------------------------------------------|
#'    |game_id                   |character |Unique game identifier.                                                          |
#'    |away_team_id              |integer   |Unique identifier for the away team.                                             |
#'    |home_team_id              |integer   |Unique identifier for the home team.                                             |
#'    |team_id                   |integer   |Unique team identifier.                                                          |
#'    |team_name                 |character |Full team display name (e.g. 'Las Vegas Aces').                                  |
#'    |team_city                 |character |Team city or region (e.g. 'Las Vegas').                                          |
#'    |team_tricode              |character |Three-letter team code (e.g. 'LAS' / 'NYL').                                     |
#'    |team_slug                 |character |URL-safe team identifier (e.g. 'lasvegas-aces' / 'aces').                        |
#'    |minutes                   |character |Minutes played, formatted MM:SS (V3 PT-duration parsed) or decimal minutes (V2). |
#'    |field_goals_made          |integer   |Field goals made (2-pt + 3-pt).                                                  |
#'    |field_goals_attempted     |integer   |Field goal attempts (2-pt + 3-pt).                                               |
#'    |field_goals_percentage    |numeric   |Field goal percentage (0-1 decimal).                                             |
#'    |three_pointers_made       |integer   |Three-point field goals made.                                                    |
#'    |three_pointers_attempted  |integer   |Three-point field goal attempts.                                                 |
#'    |three_pointers_percentage |numeric   |Three-point field goal percentage (0-1 decimal).                                 |
#'    |free_throws_made          |integer   |Free throws made.                                                                |
#'    |free_throws_attempted     |integer   |Free throw attempts.                                                             |
#'    |free_throws_percentage    |numeric   |Free throw percentage (0-1 decimal).                                             |
#'    |rebounds_offensive        |integer   |Offensive rebounds.                                                              |
#'    |rebounds_defensive        |integer   |Defensive rebounds.                                                              |
#'    |rebounds_total            |integer   |Total rebounds.                                                                  |
#'    |assists                   |integer   |Total assists.                                                                   |
#'    |steals                    |integer   |Total steals.                                                                    |
#'    |blocks                    |integer   |Total blocks.                                                                    |
#'    |turnovers                 |integer   |Total turnovers.                                                                 |
#'    |fouls_personal            |integer   |Personal fouls.                                                                  |
#'    |points                    |integer   |Points scored.                                                                   |
#'    |plus_minus_points         |numeric   |Plus/minus point differential while on court.                                    |
#'
#'    **home_team_starters_totals**
#'
#'
#'    |col_name                  |types     |description                                                                      |
#'    |:-------------------------|:---------|:--------------------------------------------------------------------------------|
#'    |game_id                   |character |Unique game identifier.                                                          |
#'    |away_team_id              |integer   |Unique identifier for the away team.                                             |
#'    |home_team_id              |integer   |Unique identifier for the home team.                                             |
#'    |team_id                   |integer   |Unique team identifier.                                                          |
#'    |team_name                 |character |Full team display name (e.g. 'Las Vegas Aces').                                  |
#'    |team_city                 |character |Team city or region (e.g. 'Las Vegas').                                          |
#'    |team_tricode              |character |Three-letter team code (e.g. 'LAS' / 'NYL').                                     |
#'    |team_slug                 |character |URL-safe team identifier (e.g. 'lasvegas-aces' / 'aces').                        |
#'    |minutes                   |character |Minutes played, formatted MM:SS (V3 PT-duration parsed) or decimal minutes (V2). |
#'    |field_goals_made          |integer   |Field goals made (2-pt + 3-pt).                                                  |
#'    |field_goals_attempted     |integer   |Field goal attempts (2-pt + 3-pt).                                               |
#'    |field_goals_percentage    |numeric   |Field goal percentage (0-1 decimal).                                             |
#'    |three_pointers_made       |integer   |Three-point field goals made.                                                    |
#'    |three_pointers_attempted  |integer   |Three-point field goal attempts.                                                 |
#'    |three_pointers_percentage |numeric   |Three-point field goal percentage (0-1 decimal).                                 |
#'    |free_throws_made          |integer   |Free throws made.                                                                |
#'    |free_throws_attempted     |integer   |Free throw attempts.                                                             |
#'    |free_throws_percentage    |numeric   |Free throw percentage (0-1 decimal).                                             |
#'    |rebounds_offensive        |integer   |Offensive rebounds.                                                              |
#'    |rebounds_defensive        |integer   |Defensive rebounds.                                                              |
#'    |rebounds_total            |integer   |Total rebounds.                                                                  |
#'    |assists                   |integer   |Total assists.                                                                   |
#'    |steals                    |integer   |Total steals.                                                                    |
#'    |blocks                    |integer   |Total blocks.                                                                    |
#'    |turnovers                 |integer   |Total turnovers.                                                                 |
#'    |fouls_personal            |integer   |Personal fouls.                                                                  |
#'    |points                    |integer   |Points scored.                                                                   |
#'
#'    **away_team_starters_totals**
#'
#'
#'    |col_name                  |types     |description                                                                      |
#'    |:-------------------------|:---------|:--------------------------------------------------------------------------------|
#'    |game_id                   |character |Unique game identifier.                                                          |
#'    |away_team_id              |integer   |Unique identifier for the away team.                                             |
#'    |home_team_id              |integer   |Unique identifier for the home team.                                             |
#'    |team_id                   |integer   |Unique team identifier.                                                          |
#'    |team_name                 |character |Full team display name (e.g. 'Las Vegas Aces').                                  |
#'    |team_city                 |character |Team city or region (e.g. 'Las Vegas').                                          |
#'    |team_tricode              |character |Three-letter team code (e.g. 'LAS' / 'NYL').                                     |
#'    |team_slug                 |character |URL-safe team identifier (e.g. 'lasvegas-aces' / 'aces').                        |
#'    |minutes                   |character |Minutes played, formatted MM:SS (V3 PT-duration parsed) or decimal minutes (V2). |
#'    |field_goals_made          |integer   |Field goals made (2-pt + 3-pt).                                                  |
#'    |field_goals_attempted     |integer   |Field goal attempts (2-pt + 3-pt).                                               |
#'    |field_goals_percentage    |numeric   |Field goal percentage (0-1 decimal).                                             |
#'    |three_pointers_made       |integer   |Three-point field goals made.                                                    |
#'    |three_pointers_attempted  |integer   |Three-point field goal attempts.                                                 |
#'    |three_pointers_percentage |numeric   |Three-point field goal percentage (0-1 decimal).                                 |
#'    |free_throws_made          |integer   |Free throws made.                                                                |
#'    |free_throws_attempted     |integer   |Free throw attempts.                                                             |
#'    |free_throws_percentage    |numeric   |Free throw percentage (0-1 decimal).                                             |
#'    |rebounds_offensive        |integer   |Offensive rebounds.                                                              |
#'    |rebounds_defensive        |integer   |Defensive rebounds.                                                              |
#'    |rebounds_total            |integer   |Total rebounds.                                                                  |
#'    |assists                   |integer   |Total assists.                                                                   |
#'    |steals                    |integer   |Total steals.                                                                    |
#'    |blocks                    |integer   |Total blocks.                                                                    |
#'    |turnovers                 |integer   |Total turnovers.                                                                 |
#'    |fouls_personal            |integer   |Personal fouls.                                                                  |
#'    |points                    |integer   |Points scored.                                                                   |
#'
#'    **home_team_bench_totals**
#'
#'
#'    |col_name                  |types     |description                                                                      |
#'    |:-------------------------|:---------|:--------------------------------------------------------------------------------|
#'    |game_id                   |character |Unique game identifier.                                                          |
#'    |away_team_id              |integer   |Unique identifier for the away team.                                             |
#'    |home_team_id              |integer   |Unique identifier for the home team.                                             |
#'    |team_id                   |integer   |Unique team identifier.                                                          |
#'    |team_name                 |character |Full team display name (e.g. 'Las Vegas Aces').                                  |
#'    |team_city                 |character |Team city or region (e.g. 'Las Vegas').                                          |
#'    |team_tricode              |character |Three-letter team code (e.g. 'LAS' / 'NYL').                                     |
#'    |team_slug                 |character |URL-safe team identifier (e.g. 'lasvegas-aces' / 'aces').                        |
#'    |minutes                   |character |Minutes played, formatted MM:SS (V3 PT-duration parsed) or decimal minutes (V2). |
#'    |field_goals_made          |integer   |Field goals made (2-pt + 3-pt).                                                  |
#'    |field_goals_attempted     |integer   |Field goal attempts (2-pt + 3-pt).                                               |
#'    |field_goals_percentage    |numeric   |Field goal percentage (0-1 decimal).                                             |
#'    |three_pointers_made       |integer   |Three-point field goals made.                                                    |
#'    |three_pointers_attempted  |integer   |Three-point field goal attempts.                                                 |
#'    |three_pointers_percentage |numeric   |Three-point field goal percentage (0-1 decimal).                                 |
#'    |free_throws_made          |integer   |Free throws made.                                                                |
#'    |free_throws_attempted     |integer   |Free throw attempts.                                                             |
#'    |free_throws_percentage    |numeric   |Free throw percentage (0-1 decimal).                                             |
#'    |rebounds_offensive        |integer   |Offensive rebounds.                                                              |
#'    |rebounds_defensive        |integer   |Defensive rebounds.                                                              |
#'    |rebounds_total            |integer   |Total rebounds.                                                                  |
#'    |assists                   |integer   |Total assists.                                                                   |
#'    |steals                    |integer   |Total steals.                                                                    |
#'    |blocks                    |integer   |Total blocks.                                                                    |
#'    |turnovers                 |integer   |Total turnovers.                                                                 |
#'    |fouls_personal            |integer   |Personal fouls.                                                                  |
#'    |points                    |integer   |Points scored.                                                                   |
#'
#'    **away_team_bench_totals**
#'
#'
#'    |col_name                  |types     |description                                                                      |
#'    |:-------------------------|:---------|:--------------------------------------------------------------------------------|
#'    |game_id                   |character |Unique game identifier.                                                          |
#'    |away_team_id              |integer   |Unique identifier for the away team.                                             |
#'    |home_team_id              |integer   |Unique identifier for the home team.                                             |
#'    |team_id                   |integer   |Unique team identifier.                                                          |
#'    |team_name                 |character |Full team display name (e.g. 'Las Vegas Aces').                                  |
#'    |team_city                 |character |Team city or region (e.g. 'Las Vegas').                                          |
#'    |team_tricode              |character |Three-letter team code (e.g. 'LAS' / 'NYL').                                     |
#'    |team_slug                 |character |URL-safe team identifier (e.g. 'lasvegas-aces' / 'aces').                        |
#'    |minutes                   |character |Minutes played, formatted MM:SS (V3 PT-duration parsed) or decimal minutes (V2). |
#'    |field_goals_made          |integer   |Field goals made (2-pt + 3-pt).                                                  |
#'    |field_goals_attempted     |integer   |Field goal attempts (2-pt + 3-pt).                                               |
#'    |field_goals_percentage    |numeric   |Field goal percentage (0-1 decimal).                                             |
#'    |three_pointers_made       |integer   |Three-point field goals made.                                                    |
#'    |three_pointers_attempted  |integer   |Three-point field goal attempts.                                                 |
#'    |three_pointers_percentage |numeric   |Three-point field goal percentage (0-1 decimal).                                 |
#'    |free_throws_made          |integer   |Free throws made.                                                                |
#'    |free_throws_attempted     |integer   |Free throw attempts.                                                             |
#'    |free_throws_percentage    |numeric   |Free throw percentage (0-1 decimal).                                             |
#'    |rebounds_offensive        |integer   |Offensive rebounds.                                                              |
#'    |rebounds_defensive        |integer   |Defensive rebounds.                                                              |
#'    |rebounds_total            |integer   |Total rebounds.                                                                  |
#'    |assists                   |integer   |Total assists.                                                                   |
#'    |steals                    |integer   |Total steals.                                                                    |
#'    |blocks                    |integer   |Total blocks.                                                                    |
#'    |turnovers                 |integer   |Total turnovers.                                                                 |
#'    |fouls_personal            |integer   |Personal fouls.                                                                  |
#'    |points                    |integer   |Points scored.                                                                   |
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
#'    |col_name                        |types     |description                                                                      |
#'    |:-------------------------------|:---------|:--------------------------------------------------------------------------------|
#'    |game_id                         |character |Unique game identifier.                                                          |
#'    |away_team_id                    |integer   |Unique identifier for the away team.                                             |
#'    |home_team_id                    |integer   |Unique identifier for the home team.                                             |
#'    |team_id                         |integer   |Unique team identifier.                                                          |
#'    |team_name                       |character |Full team display name (e.g. 'Las Vegas Aces').                                  |
#'    |team_city                       |character |Team city or region (e.g. 'Las Vegas').                                          |
#'    |team_tricode                    |character |Three-letter team code (e.g. 'LAS' / 'NYL').                                     |
#'    |team_slug                       |character |URL-safe team identifier (e.g. 'lasvegas-aces' / 'aces').                        |
#'    |person_id                       |integer   |Unique player identifier (V3 endpoints).                                         |
#'    |first_name                      |character |Player's first name.                                                             |
#'    |family_name                     |character |Player's family / last name.                                                     |
#'    |name_i                          |character |Initialed name (e.g. 'A. Wilson').                                               |
#'    |player_slug                     |character |URL-safe player identifier.                                                      |
#'    |position                        |character |Listed roster position (G, F, C, etc.).                                          |
#'    |comment                         |character |Player status / inactive reason (e.g. 'DNP - Coach's Decision', 'Inactive').     |
#'    |jersey_num                      |character |Jersey number worn by the player.                                                |
#'    |minutes                         |character |Minutes played, formatted MM:SS (V3 PT-duration parsed) or decimal minutes (V2). |
#'    |estimated_offensive_rating      |numeric   |Estimated offensive rating (points per 100 possessions estimate).                |
#'    |offensive_rating                |numeric   |Offensive rating (points per 100 possessions).                                   |
#'    |estimated_defensive_rating      |numeric   |Estimated defensive rating (points allowed per 100 possessions estimate).        |
#'    |defensive_rating                |numeric   |Defensive rating (points allowed per 100 possessions).                           |
#'    |estimated_net_rating            |numeric   |Estimated net rating (off rating - def rating).                                  |
#'    |net_rating                      |numeric   |Net rating (off rating - def rating).                                            |
#'    |assist_percentage               |numeric   |Assist percentage (0-1).                                                         |
#'    |assist_to_turnover              |numeric   |Assist-to-turnover ratio.                                                        |
#'    |assist_ratio                    |numeric   |Assist ratio (assists per 100 possessions used).                                 |
#'    |offensive_rebound_percentage    |numeric   |Offensive rebound percentage (0-1).                                              |
#'    |defensive_rebound_percentage    |numeric   |Defensive rebound percentage (0-1).                                              |
#'    |rebound_percentage              |numeric   |Total rebound percentage (0-1).                                                  |
#'    |turnover_ratio                  |numeric   |Turnover ratio (turnovers per 100 possessions used).                             |
#'    |effective_field_goal_percentage |numeric   |Effective field goal percentage (0-1).                                           |
#'    |true_shooting_percentage        |numeric   |True shooting percentage (0-1).                                                  |
#'    |usage_percentage                |numeric   |Usage percentage (0-1).                                                          |
#'    |estimated_usage_percentage      |numeric   |Estimated usage percentage (0-1).                                                |
#'    |estimated_pace                  |numeric   |Estimated possessions per 48 minutes.                                            |
#'    |pace                            |numeric   |Possessions per 48 minutes.                                                      |
#'    |pace_per40                      |numeric   |Pace per40.                                                                      |
#'    |possessions                     |numeric   |Possessions used.                                                                |
#'    |pie                             |numeric   |Player Impact Estimate (0-1).                                                    |
#'
#'    **away_team_player_advanced**
#'
#'
#'    |col_name                        |types     |description                                                                      |
#'    |:-------------------------------|:---------|:--------------------------------------------------------------------------------|
#'    |game_id                         |character |Unique game identifier.                                                          |
#'    |away_team_id                    |integer   |Unique identifier for the away team.                                             |
#'    |home_team_id                    |integer   |Unique identifier for the home team.                                             |
#'    |team_id                         |integer   |Unique team identifier.                                                          |
#'    |team_name                       |character |Full team display name (e.g. 'Las Vegas Aces').                                  |
#'    |team_city                       |character |Team city or region (e.g. 'Las Vegas').                                          |
#'    |team_tricode                    |character |Three-letter team code (e.g. 'LAS' / 'NYL').                                     |
#'    |team_slug                       |character |URL-safe team identifier (e.g. 'lasvegas-aces' / 'aces').                        |
#'    |person_id                       |integer   |Unique player identifier (V3 endpoints).                                         |
#'    |first_name                      |character |Player's first name.                                                             |
#'    |family_name                     |character |Player's family / last name.                                                     |
#'    |name_i                          |character |Initialed name (e.g. 'A. Wilson').                                               |
#'    |player_slug                     |character |URL-safe player identifier.                                                      |
#'    |position                        |character |Listed roster position (G, F, C, etc.).                                          |
#'    |comment                         |character |Player status / inactive reason (e.g. 'DNP - Coach's Decision', 'Inactive').     |
#'    |jersey_num                      |character |Jersey number worn by the player.                                                |
#'    |minutes                         |character |Minutes played, formatted MM:SS (V3 PT-duration parsed) or decimal minutes (V2). |
#'    |estimated_offensive_rating      |numeric   |Estimated offensive rating (points per 100 possessions estimate).                |
#'    |offensive_rating                |numeric   |Offensive rating (points per 100 possessions).                                   |
#'    |estimated_defensive_rating      |numeric   |Estimated defensive rating (points allowed per 100 possessions estimate).        |
#'    |defensive_rating                |numeric   |Defensive rating (points allowed per 100 possessions).                           |
#'    |estimated_net_rating            |numeric   |Estimated net rating (off rating - def rating).                                  |
#'    |net_rating                      |numeric   |Net rating (off rating - def rating).                                            |
#'    |assist_percentage               |numeric   |Assist percentage (0-1).                                                         |
#'    |assist_to_turnover              |numeric   |Assist-to-turnover ratio.                                                        |
#'    |assist_ratio                    |numeric   |Assist ratio (assists per 100 possessions used).                                 |
#'    |offensive_rebound_percentage    |numeric   |Offensive rebound percentage (0-1).                                              |
#'    |defensive_rebound_percentage    |numeric   |Defensive rebound percentage (0-1).                                              |
#'    |rebound_percentage              |numeric   |Total rebound percentage (0-1).                                                  |
#'    |turnover_ratio                  |numeric   |Turnover ratio (turnovers per 100 possessions used).                             |
#'    |effective_field_goal_percentage |numeric   |Effective field goal percentage (0-1).                                           |
#'    |true_shooting_percentage        |numeric   |True shooting percentage (0-1).                                                  |
#'    |usage_percentage                |numeric   |Usage percentage (0-1).                                                          |
#'    |estimated_usage_percentage      |numeric   |Estimated usage percentage (0-1).                                                |
#'    |estimated_pace                  |numeric   |Estimated possessions per 48 minutes.                                            |
#'    |pace                            |numeric   |Possessions per 48 minutes.                                                      |
#'    |pace_per40                      |numeric   |Pace per40.                                                                      |
#'    |possessions                     |numeric   |Possessions used.                                                                |
#'    |pie                             |numeric   |Player Impact Estimate (0-1).                                                    |
#'
#'    **home_team_totals_advanced**
#'
#'
#'    |col_name                           |types     |description                                                                      |
#'    |:----------------------------------|:---------|:--------------------------------------------------------------------------------|
#'    |game_id                            |character |Unique game identifier.                                                          |
#'    |away_team_id                       |integer   |Unique identifier for the away team.                                             |
#'    |home_team_id                       |integer   |Unique identifier for the home team.                                             |
#'    |team_id                            |integer   |Unique team identifier.                                                          |
#'    |team_name                          |character |Full team display name (e.g. 'Las Vegas Aces').                                  |
#'    |team_city                          |character |Team city or region (e.g. 'Las Vegas').                                          |
#'    |team_tricode                       |character |Three-letter team code (e.g. 'LAS' / 'NYL').                                     |
#'    |team_slug                          |character |URL-safe team identifier (e.g. 'lasvegas-aces' / 'aces').                        |
#'    |minutes                            |character |Minutes played, formatted MM:SS (V3 PT-duration parsed) or decimal minutes (V2). |
#'    |estimated_offensive_rating         |numeric   |Estimated offensive rating (points per 100 possessions estimate).                |
#'    |offensive_rating                   |numeric   |Offensive rating (points per 100 possessions).                                   |
#'    |estimated_defensive_rating         |numeric   |Estimated defensive rating (points allowed per 100 possessions estimate).        |
#'    |defensive_rating                   |numeric   |Defensive rating (points allowed per 100 possessions).                           |
#'    |estimated_net_rating               |numeric   |Estimated net rating (off rating - def rating).                                  |
#'    |net_rating                         |numeric   |Net rating (off rating - def rating).                                            |
#'    |assist_percentage                  |numeric   |Assist percentage (0-1).                                                         |
#'    |assist_to_turnover                 |numeric   |Assist-to-turnover ratio.                                                        |
#'    |assist_ratio                       |numeric   |Assist ratio (assists per 100 possessions used).                                 |
#'    |offensive_rebound_percentage       |numeric   |Offensive rebound percentage (0-1).                                              |
#'    |defensive_rebound_percentage       |numeric   |Defensive rebound percentage (0-1).                                              |
#'    |rebound_percentage                 |numeric   |Total rebound percentage (0-1).                                                  |
#'    |estimated_team_turnover_percentage |numeric   |Estimated team turnover percentage (0-1).                                        |
#'    |turnover_ratio                     |numeric   |Turnover ratio (turnovers per 100 possessions used).                             |
#'    |effective_field_goal_percentage    |numeric   |Effective field goal percentage (0-1).                                           |
#'    |true_shooting_percentage           |numeric   |True shooting percentage (0-1).                                                  |
#'    |usage_percentage                   |numeric   |Usage percentage (0-1).                                                          |
#'    |estimated_usage_percentage         |numeric   |Estimated usage percentage (0-1).                                                |
#'    |estimated_pace                     |numeric   |Estimated possessions per 48 minutes.                                            |
#'    |pace                               |numeric   |Possessions per 48 minutes.                                                      |
#'    |pace_per40                         |numeric   |Pace per40.                                                                      |
#'    |possessions                        |numeric   |Possessions used.                                                                |
#'    |pie                                |numeric   |Player Impact Estimate (0-1).                                                    |
#'
#'    **away_team_totals_advanced**
#'
#'
#'    |col_name                           |types     |description                                                                      |
#'    |:----------------------------------|:---------|:--------------------------------------------------------------------------------|
#'    |game_id                            |character |Unique game identifier.                                                          |
#'    |away_team_id                       |integer   |Unique identifier for the away team.                                             |
#'    |home_team_id                       |integer   |Unique identifier for the home team.                                             |
#'    |team_id                            |integer   |Unique team identifier.                                                          |
#'    |team_name                          |character |Full team display name (e.g. 'Las Vegas Aces').                                  |
#'    |team_city                          |character |Team city or region (e.g. 'Las Vegas').                                          |
#'    |team_tricode                       |character |Three-letter team code (e.g. 'LAS' / 'NYL').                                     |
#'    |team_slug                          |character |URL-safe team identifier (e.g. 'lasvegas-aces' / 'aces').                        |
#'    |minutes                            |character |Minutes played, formatted MM:SS (V3 PT-duration parsed) or decimal minutes (V2). |
#'    |estimated_offensive_rating         |numeric   |Estimated offensive rating (points per 100 possessions estimate).                |
#'    |offensive_rating                   |numeric   |Offensive rating (points per 100 possessions).                                   |
#'    |estimated_defensive_rating         |numeric   |Estimated defensive rating (points allowed per 100 possessions estimate).        |
#'    |defensive_rating                   |numeric   |Defensive rating (points allowed per 100 possessions).                           |
#'    |estimated_net_rating               |numeric   |Estimated net rating (off rating - def rating).                                  |
#'    |net_rating                         |numeric   |Net rating (off rating - def rating).                                            |
#'    |assist_percentage                  |numeric   |Assist percentage (0-1).                                                         |
#'    |assist_to_turnover                 |numeric   |Assist-to-turnover ratio.                                                        |
#'    |assist_ratio                       |numeric   |Assist ratio (assists per 100 possessions used).                                 |
#'    |offensive_rebound_percentage       |numeric   |Offensive rebound percentage (0-1).                                              |
#'    |defensive_rebound_percentage       |numeric   |Defensive rebound percentage (0-1).                                              |
#'    |rebound_percentage                 |numeric   |Total rebound percentage (0-1).                                                  |
#'    |estimated_team_turnover_percentage |numeric   |Estimated team turnover percentage (0-1).                                        |
#'    |turnover_ratio                     |numeric   |Turnover ratio (turnovers per 100 possessions used).                             |
#'    |effective_field_goal_percentage    |numeric   |Effective field goal percentage (0-1).                                           |
#'    |true_shooting_percentage           |numeric   |True shooting percentage (0-1).                                                  |
#'    |usage_percentage                   |numeric   |Usage percentage (0-1).                                                          |
#'    |estimated_usage_percentage         |numeric   |Estimated usage percentage (0-1).                                                |
#'    |estimated_pace                     |numeric   |Estimated possessions per 48 minutes.                                            |
#'    |pace                               |numeric   |Possessions per 48 minutes.                                                      |
#'    |pace_per40                         |numeric   |Pace per40.                                                                      |
#'    |possessions                        |numeric   |Possessions used.                                                                |
#'    |pie                                |numeric   |Player Impact Estimate (0-1).                                                    |
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
#'    |col_name                 |types     |description                                                                      |
#'    |:------------------------|:---------|:--------------------------------------------------------------------------------|
#'    |game_id                  |character |Unique game identifier.                                                          |
#'    |away_team_id             |integer   |Unique identifier for the away team.                                             |
#'    |home_team_id             |integer   |Unique identifier for the home team.                                             |
#'    |team_id                  |integer   |Unique team identifier.                                                          |
#'    |team_name                |character |Full team display name (e.g. 'Las Vegas Aces').                                  |
#'    |team_city                |character |Team city or region (e.g. 'Las Vegas').                                          |
#'    |team_tricode             |character |Three-letter team code (e.g. 'LAS' / 'NYL').                                     |
#'    |team_slug                |character |URL-safe team identifier (e.g. 'lasvegas-aces' / 'aces').                        |
#'    |person_id                |integer   |Unique player identifier (V3 endpoints).                                         |
#'    |first_name               |character |Player's first name.                                                             |
#'    |family_name              |character |Player's family / last name.                                                     |
#'    |name_i                   |character |Initialed name (e.g. 'A. Wilson').                                               |
#'    |player_slug              |character |URL-safe player identifier.                                                      |
#'    |position                 |character |Listed roster position (G, F, C, etc.).                                          |
#'    |comment                  |character |Player status / inactive reason (e.g. 'DNP - Coach's Decision', 'Inactive').     |
#'    |jersey_num               |character |Jersey number worn by the player.                                                |
#'    |minutes                  |character |Minutes played, formatted MM:SS (V3 PT-duration parsed) or decimal minutes (V2). |
#'    |points_off_turnovers     |integer   |Points scored off opponent turnovers.                                            |
#'    |points_second_chance     |integer   |Second-chance points scored.                                                     |
#'    |points_fast_break        |integer   |Fast-break points scored.                                                        |
#'    |points_paint             |integer   |Points scored in the paint.                                                      |
#'    |opp_points_off_turnovers |integer   |Opponent points off turnovers.                                                   |
#'    |opp_points_second_chance |integer   |Opponent points second chance.                                                   |
#'    |opp_points_fast_break    |integer   |Opponent points fast break.                                                      |
#'    |opp_points_paint         |integer   |Opponent points paint.                                                           |
#'    |blocks                   |integer   |Total blocks.                                                                    |
#'    |blocks_against           |integer   |Shots blocked by opponents while attempting.                                     |
#'    |fouls_personal           |integer   |Personal fouls.                                                                  |
#'    |fouls_drawn              |integer   |Personal fouls drawn (by opponent's actions).                                    |
#'
#'    **away_team_player_misc**
#'
#'
#'    |col_name                 |types     |description                                                                      |
#'    |:------------------------|:---------|:--------------------------------------------------------------------------------|
#'    |game_id                  |character |Unique game identifier.                                                          |
#'    |away_team_id             |integer   |Unique identifier for the away team.                                             |
#'    |home_team_id             |integer   |Unique identifier for the home team.                                             |
#'    |team_id                  |integer   |Unique team identifier.                                                          |
#'    |team_name                |character |Full team display name (e.g. 'Las Vegas Aces').                                  |
#'    |team_city                |character |Team city or region (e.g. 'Las Vegas').                                          |
#'    |team_tricode             |character |Three-letter team code (e.g. 'LAS' / 'NYL').                                     |
#'    |team_slug                |character |URL-safe team identifier (e.g. 'lasvegas-aces' / 'aces').                        |
#'    |person_id                |integer   |Unique player identifier (V3 endpoints).                                         |
#'    |first_name               |character |Player's first name.                                                             |
#'    |family_name              |character |Player's family / last name.                                                     |
#'    |name_i                   |character |Initialed name (e.g. 'A. Wilson').                                               |
#'    |player_slug              |character |URL-safe player identifier.                                                      |
#'    |position                 |character |Listed roster position (G, F, C, etc.).                                          |
#'    |comment                  |character |Player status / inactive reason (e.g. 'DNP - Coach's Decision', 'Inactive').     |
#'    |jersey_num               |character |Jersey number worn by the player.                                                |
#'    |minutes                  |character |Minutes played, formatted MM:SS (V3 PT-duration parsed) or decimal minutes (V2). |
#'    |points_off_turnovers     |integer   |Points scored off opponent turnovers.                                            |
#'    |points_second_chance     |integer   |Second-chance points scored.                                                     |
#'    |points_fast_break        |integer   |Fast-break points scored.                                                        |
#'    |points_paint             |integer   |Points scored in the paint.                                                      |
#'    |opp_points_off_turnovers |integer   |Opponent points off turnovers.                                                   |
#'    |opp_points_second_chance |integer   |Opponent points second chance.                                                   |
#'    |opp_points_fast_break    |integer   |Opponent points fast break.                                                      |
#'    |opp_points_paint         |integer   |Opponent points paint.                                                           |
#'    |blocks                   |integer   |Total blocks.                                                                    |
#'    |blocks_against           |integer   |Shots blocked by opponents while attempting.                                     |
#'    |fouls_personal           |integer   |Personal fouls.                                                                  |
#'    |fouls_drawn              |integer   |Personal fouls drawn (by opponent's actions).                                    |
#'
#'    **home_team_totals_misc**
#'
#'
#'    |col_name                 |types     |description                                                                      |
#'    |:------------------------|:---------|:--------------------------------------------------------------------------------|
#'    |game_id                  |character |Unique game identifier.                                                          |
#'    |away_team_id             |integer   |Unique identifier for the away team.                                             |
#'    |home_team_id             |integer   |Unique identifier for the home team.                                             |
#'    |team_id                  |integer   |Unique team identifier.                                                          |
#'    |team_name                |character |Full team display name (e.g. 'Las Vegas Aces').                                  |
#'    |team_city                |character |Team city or region (e.g. 'Las Vegas').                                          |
#'    |team_tricode             |character |Three-letter team code (e.g. 'LAS' / 'NYL').                                     |
#'    |team_slug                |character |URL-safe team identifier (e.g. 'lasvegas-aces' / 'aces').                        |
#'    |minutes                  |character |Minutes played, formatted MM:SS (V3 PT-duration parsed) or decimal minutes (V2). |
#'    |points_off_turnovers     |integer   |Points scored off opponent turnovers.                                            |
#'    |points_second_chance     |integer   |Second-chance points scored.                                                     |
#'    |points_fast_break        |integer   |Fast-break points scored.                                                        |
#'    |points_paint             |integer   |Points scored in the paint.                                                      |
#'    |opp_points_off_turnovers |integer   |Opponent points off turnovers.                                                   |
#'    |opp_points_second_chance |integer   |Opponent points second chance.                                                   |
#'    |opp_points_fast_break    |integer   |Opponent points fast break.                                                      |
#'    |opp_points_paint         |integer   |Opponent points paint.                                                           |
#'    |blocks                   |integer   |Total blocks.                                                                    |
#'    |blocks_against           |integer   |Shots blocked by opponents while attempting.                                     |
#'    |fouls_personal           |integer   |Personal fouls.                                                                  |
#'    |fouls_drawn              |integer   |Personal fouls drawn (by opponent's actions).                                    |
#'
#'    **away_team_totals_misc**
#'
#'
#'    |col_name                 |types     |description                                                                      |
#'    |:------------------------|:---------|:--------------------------------------------------------------------------------|
#'    |game_id                  |character |Unique game identifier.                                                          |
#'    |away_team_id             |integer   |Unique identifier for the away team.                                             |
#'    |home_team_id             |integer   |Unique identifier for the home team.                                             |
#'    |team_id                  |integer   |Unique team identifier.                                                          |
#'    |team_name                |character |Full team display name (e.g. 'Las Vegas Aces').                                  |
#'    |team_city                |character |Team city or region (e.g. 'Las Vegas').                                          |
#'    |team_tricode             |character |Three-letter team code (e.g. 'LAS' / 'NYL').                                     |
#'    |team_slug                |character |URL-safe team identifier (e.g. 'lasvegas-aces' / 'aces').                        |
#'    |minutes                  |character |Minutes played, formatted MM:SS (V3 PT-duration parsed) or decimal minutes (V2). |
#'    |points_off_turnovers     |integer   |Points scored off opponent turnovers.                                            |
#'    |points_second_chance     |integer   |Second-chance points scored.                                                     |
#'    |points_fast_break        |integer   |Fast-break points scored.                                                        |
#'    |points_paint             |integer   |Points scored in the paint.                                                      |
#'    |opp_points_off_turnovers |integer   |Opponent points off turnovers.                                                   |
#'    |opp_points_second_chance |integer   |Opponent points second chance.                                                   |
#'    |opp_points_fast_break    |integer   |Opponent points fast break.                                                      |
#'    |opp_points_paint         |integer   |Opponent points paint.                                                           |
#'    |blocks                   |integer   |Total blocks.                                                                    |
#'    |blocks_against           |integer   |Shots blocked by opponents while attempting.                                     |
#'    |fouls_personal           |integer   |Personal fouls.                                                                  |
#'    |fouls_drawn              |integer   |Personal fouls drawn (by opponent's actions).                                    |
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
#'    |col_name                            |types     |description                                                                      |
#'    |:-----------------------------------|:---------|:--------------------------------------------------------------------------------|
#'    |game_id                             |character |Unique game identifier.                                                          |
#'    |away_team_id                        |integer   |Unique identifier for the away team.                                             |
#'    |home_team_id                        |integer   |Unique identifier for the home team.                                             |
#'    |team_id                             |integer   |Unique team identifier.                                                          |
#'    |team_name                           |character |Full team display name (e.g. 'Las Vegas Aces').                                  |
#'    |team_city                           |character |Team city or region (e.g. 'Las Vegas').                                          |
#'    |team_tricode                        |character |Three-letter team code (e.g. 'LAS' / 'NYL').                                     |
#'    |team_slug                           |character |URL-safe team identifier (e.g. 'lasvegas-aces' / 'aces').                        |
#'    |person_id                           |integer   |Unique player identifier (V3 endpoints).                                         |
#'    |first_name                          |character |Player's first name.                                                             |
#'    |family_name                         |character |Player's family / last name.                                                     |
#'    |name_i                              |character |Initialed name (e.g. 'A. Wilson').                                               |
#'    |player_slug                         |character |URL-safe player identifier.                                                      |
#'    |position                            |character |Listed roster position (G, F, C, etc.).                                          |
#'    |comment                             |character |Player status / inactive reason (e.g. 'DNP - Coach's Decision', 'Inactive').     |
#'    |jersey_num                          |character |Jersey number worn by the player.                                                |
#'    |minutes                             |character |Minutes played, formatted MM:SS (V3 PT-duration parsed) or decimal minutes (V2). |
#'    |percentage_field_goals_attempted2pt |numeric   |Percentage field goals attempted2pt.                                             |
#'    |percentage_field_goals_attempted3pt |numeric   |Percentage field goals attempted3pt.                                             |
#'    |percentage_points2pt                |numeric   |Percentage points2pt.                                                            |
#'    |percentage_points_midrange2pt       |numeric   |Percentage points midrange2pt.                                                   |
#'    |percentage_points3pt                |numeric   |Percentage points3pt.                                                            |
#'    |percentage_points_fast_break        |numeric   |Percentage points fast break.                                                    |
#'    |percentage_points_free_throw        |numeric   |Percentage points free throw.                                                    |
#'    |percentage_points_off_turnovers     |numeric   |Percentage points off turnovers.                                                 |
#'    |percentage_points_paint             |numeric   |Percentage points paint.                                                         |
#'    |percentage_assisted2pt              |numeric   |Percentage assisted2pt.                                                          |
#'    |percentage_unassisted2pt            |numeric   |Percentage unassisted2pt.                                                        |
#'    |percentage_assisted3pt              |numeric   |Percentage assisted3pt.                                                          |
#'    |percentage_unassisted3pt            |numeric   |Percentage unassisted3pt.                                                        |
#'    |percentage_assisted_fgm             |numeric   |Percentage assisted fgm.                                                         |
#'    |percentage_unassisted_fgm           |numeric   |Percentage unassisted fgm.                                                       |
#'
#'    **away_team_player_scoring**
#'
#'
#'    |col_name                            |types     |description                                                                      |
#'    |:-----------------------------------|:---------|:--------------------------------------------------------------------------------|
#'    |game_id                             |character |Unique game identifier.                                                          |
#'    |away_team_id                        |integer   |Unique identifier for the away team.                                             |
#'    |home_team_id                        |integer   |Unique identifier for the home team.                                             |
#'    |team_id                             |integer   |Unique team identifier.                                                          |
#'    |team_name                           |character |Full team display name (e.g. 'Las Vegas Aces').                                  |
#'    |team_city                           |character |Team city or region (e.g. 'Las Vegas').                                          |
#'    |team_tricode                        |character |Three-letter team code (e.g. 'LAS' / 'NYL').                                     |
#'    |team_slug                           |character |URL-safe team identifier (e.g. 'lasvegas-aces' / 'aces').                        |
#'    |person_id                           |integer   |Unique player identifier (V3 endpoints).                                         |
#'    |first_name                          |character |Player's first name.                                                             |
#'    |family_name                         |character |Player's family / last name.                                                     |
#'    |name_i                              |character |Initialed name (e.g. 'A. Wilson').                                               |
#'    |player_slug                         |character |URL-safe player identifier.                                                      |
#'    |position                            |character |Listed roster position (G, F, C, etc.).                                          |
#'    |comment                             |character |Player status / inactive reason (e.g. 'DNP - Coach's Decision', 'Inactive').     |
#'    |jersey_num                          |character |Jersey number worn by the player.                                                |
#'    |minutes                             |character |Minutes played, formatted MM:SS (V3 PT-duration parsed) or decimal minutes (V2). |
#'    |percentage_field_goals_attempted2pt |numeric   |Percentage field goals attempted2pt.                                             |
#'    |percentage_field_goals_attempted3pt |numeric   |Percentage field goals attempted3pt.                                             |
#'    |percentage_points2pt                |numeric   |Percentage points2pt.                                                            |
#'    |percentage_points_midrange2pt       |numeric   |Percentage points midrange2pt.                                                   |
#'    |percentage_points3pt                |numeric   |Percentage points3pt.                                                            |
#'    |percentage_points_fast_break        |numeric   |Percentage points fast break.                                                    |
#'    |percentage_points_free_throw        |numeric   |Percentage points free throw.                                                    |
#'    |percentage_points_off_turnovers     |numeric   |Percentage points off turnovers.                                                 |
#'    |percentage_points_paint             |numeric   |Percentage points paint.                                                         |
#'    |percentage_assisted2pt              |numeric   |Percentage assisted2pt.                                                          |
#'    |percentage_unassisted2pt            |numeric   |Percentage unassisted2pt.                                                        |
#'    |percentage_assisted3pt              |numeric   |Percentage assisted3pt.                                                          |
#'    |percentage_unassisted3pt            |numeric   |Percentage unassisted3pt.                                                        |
#'    |percentage_assisted_fgm             |numeric   |Percentage assisted fgm.                                                         |
#'    |percentage_unassisted_fgm           |numeric   |Percentage unassisted fgm.                                                       |
#'
#'    **home_team_totals_scoring**
#'
#'
#'    |col_name                            |types     |description                                                                      |
#'    |:-----------------------------------|:---------|:--------------------------------------------------------------------------------|
#'    |game_id                             |character |Unique game identifier.                                                          |
#'    |away_team_id                        |integer   |Unique identifier for the away team.                                             |
#'    |home_team_id                        |integer   |Unique identifier for the home team.                                             |
#'    |team_id                             |integer   |Unique team identifier.                                                          |
#'    |team_name                           |character |Full team display name (e.g. 'Las Vegas Aces').                                  |
#'    |team_city                           |character |Team city or region (e.g. 'Las Vegas').                                          |
#'    |team_tricode                        |character |Three-letter team code (e.g. 'LAS' / 'NYL').                                     |
#'    |team_slug                           |character |URL-safe team identifier (e.g. 'lasvegas-aces' / 'aces').                        |
#'    |minutes                             |character |Minutes played, formatted MM:SS (V3 PT-duration parsed) or decimal minutes (V2). |
#'    |percentage_field_goals_attempted2pt |numeric   |Percentage field goals attempted2pt.                                             |
#'    |percentage_field_goals_attempted3pt |numeric   |Percentage field goals attempted3pt.                                             |
#'    |percentage_points2pt                |numeric   |Percentage points2pt.                                                            |
#'    |percentage_points_midrange2pt       |numeric   |Percentage points midrange2pt.                                                   |
#'    |percentage_points3pt                |numeric   |Percentage points3pt.                                                            |
#'    |percentage_points_fast_break        |numeric   |Percentage points fast break.                                                    |
#'    |percentage_points_free_throw        |numeric   |Percentage points free throw.                                                    |
#'    |percentage_points_off_turnovers     |numeric   |Percentage points off turnovers.                                                 |
#'    |percentage_points_paint             |numeric   |Percentage points paint.                                                         |
#'    |percentage_assisted2pt              |numeric   |Percentage assisted2pt.                                                          |
#'    |percentage_unassisted2pt            |numeric   |Percentage unassisted2pt.                                                        |
#'    |percentage_assisted3pt              |numeric   |Percentage assisted3pt.                                                          |
#'    |percentage_unassisted3pt            |numeric   |Percentage unassisted3pt.                                                        |
#'    |percentage_assisted_fgm             |numeric   |Percentage assisted fgm.                                                         |
#'    |percentage_unassisted_fgm           |numeric   |Percentage unassisted fgm.                                                       |
#'
#'    **away_team_totals_scoring**
#'
#'
#'    |col_name                            |types     |description                                                                      |
#'    |:-----------------------------------|:---------|:--------------------------------------------------------------------------------|
#'    |game_id                             |character |Unique game identifier.                                                          |
#'    |away_team_id                        |integer   |Unique identifier for the away team.                                             |
#'    |home_team_id                        |integer   |Unique identifier for the home team.                                             |
#'    |team_id                             |integer   |Unique team identifier.                                                          |
#'    |team_name                           |character |Full team display name (e.g. 'Las Vegas Aces').                                  |
#'    |team_city                           |character |Team city or region (e.g. 'Las Vegas').                                          |
#'    |team_tricode                        |character |Three-letter team code (e.g. 'LAS' / 'NYL').                                     |
#'    |team_slug                           |character |URL-safe team identifier (e.g. 'lasvegas-aces' / 'aces').                        |
#'    |minutes                             |character |Minutes played, formatted MM:SS (V3 PT-duration parsed) or decimal minutes (V2). |
#'    |percentage_field_goals_attempted2pt |numeric   |Percentage field goals attempted2pt.                                             |
#'    |percentage_field_goals_attempted3pt |numeric   |Percentage field goals attempted3pt.                                             |
#'    |percentage_points2pt                |numeric   |Percentage points2pt.                                                            |
#'    |percentage_points_midrange2pt       |numeric   |Percentage points midrange2pt.                                                   |
#'    |percentage_points3pt                |numeric   |Percentage points3pt.                                                            |
#'    |percentage_points_fast_break        |numeric   |Percentage points fast break.                                                    |
#'    |percentage_points_free_throw        |numeric   |Percentage points free throw.                                                    |
#'    |percentage_points_off_turnovers     |numeric   |Percentage points off turnovers.                                                 |
#'    |percentage_points_paint             |numeric   |Percentage points paint.                                                         |
#'    |percentage_assisted2pt              |numeric   |Percentage assisted2pt.                                                          |
#'    |percentage_unassisted2pt            |numeric   |Percentage unassisted2pt.                                                        |
#'    |percentage_assisted3pt              |numeric   |Percentage assisted3pt.                                                          |
#'    |percentage_unassisted3pt            |numeric   |Percentage unassisted3pt.                                                        |
#'    |percentage_assisted_fgm             |numeric   |Percentage assisted fgm.                                                         |
#'    |percentage_unassisted_fgm           |numeric   |Percentage unassisted fgm.                                                       |
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
#'    |col_name                            |types     |description                                                                      |
#'    |:-----------------------------------|:---------|:--------------------------------------------------------------------------------|
#'    |game_id                             |character |Unique game identifier.                                                          |
#'    |away_team_id                        |integer   |Unique identifier for the away team.                                             |
#'    |home_team_id                        |integer   |Unique identifier for the home team.                                             |
#'    |team_id                             |integer   |Unique team identifier.                                                          |
#'    |team_name                           |character |Full team display name (e.g. 'Las Vegas Aces').                                  |
#'    |team_city                           |character |Team city or region (e.g. 'Las Vegas').                                          |
#'    |team_tricode                        |character |Three-letter team code (e.g. 'LAS' / 'NYL').                                     |
#'    |team_slug                           |character |URL-safe team identifier (e.g. 'lasvegas-aces' / 'aces').                        |
#'    |person_id                           |integer   |Unique player identifier (V3 endpoints).                                         |
#'    |first_name                          |character |Player's first name.                                                             |
#'    |family_name                         |character |Player's family / last name.                                                     |
#'    |name_i                              |character |Initialed name (e.g. 'A. Wilson').                                               |
#'    |player_slug                         |character |URL-safe player identifier.                                                      |
#'    |position                            |character |Listed roster position (G, F, C, etc.).                                          |
#'    |comment                             |character |Player status / inactive reason (e.g. 'DNP - Coach's Decision', 'Inactive').     |
#'    |jersey_num                          |character |Jersey number worn by the player.                                                |
#'    |minutes                             |character |Minutes played, formatted MM:SS (V3 PT-duration parsed) or decimal minutes (V2). |
#'    |effective_field_goal_percentage     |numeric   |Effective field goal percentage (0-1).                                           |
#'    |free_throw_attempt_rate             |numeric   |Free throw attempt rate (FTA / FGA).                                             |
#'    |team_turnover_percentage            |numeric   |Team turnover percentage (0-1).                                                  |
#'    |offensive_rebound_percentage        |numeric   |Offensive rebound percentage (0-1).                                              |
#'    |opp_effective_field_goal_percentage |numeric   |Opponent effective field goal percentage (0-1 decimal).                          |
#'    |opp_free_throw_attempt_rate         |numeric   |Opponent free throw attempt rate.                                                |
#'    |opp_team_turnover_percentage        |numeric   |Opponent team turnover percentage (0-1 decimal).                                 |
#'    |opp_offensive_rebound_percentage    |numeric   |Opponent offensive rebound percentage (0-1 decimal).                             |
#'
#'    **away_team_player_four_factors**
#'
#'
#'    |col_name                            |types     |description                                                                      |
#'    |:-----------------------------------|:---------|:--------------------------------------------------------------------------------|
#'    |game_id                             |character |Unique game identifier.                                                          |
#'    |away_team_id                        |integer   |Unique identifier for the away team.                                             |
#'    |home_team_id                        |integer   |Unique identifier for the home team.                                             |
#'    |team_id                             |integer   |Unique team identifier.                                                          |
#'    |team_name                           |character |Full team display name (e.g. 'Las Vegas Aces').                                  |
#'    |team_city                           |character |Team city or region (e.g. 'Las Vegas').                                          |
#'    |team_tricode                        |character |Three-letter team code (e.g. 'LAS' / 'NYL').                                     |
#'    |team_slug                           |character |URL-safe team identifier (e.g. 'lasvegas-aces' / 'aces').                        |
#'    |person_id                           |integer   |Unique player identifier (V3 endpoints).                                         |
#'    |first_name                          |character |Player's first name.                                                             |
#'    |family_name                         |character |Player's family / last name.                                                     |
#'    |name_i                              |character |Initialed name (e.g. 'A. Wilson').                                               |
#'    |player_slug                         |character |URL-safe player identifier.                                                      |
#'    |position                            |character |Listed roster position (G, F, C, etc.).                                          |
#'    |comment                             |character |Player status / inactive reason (e.g. 'DNP - Coach's Decision', 'Inactive').     |
#'    |jersey_num                          |character |Jersey number worn by the player.                                                |
#'    |minutes                             |character |Minutes played, formatted MM:SS (V3 PT-duration parsed) or decimal minutes (V2). |
#'    |effective_field_goal_percentage     |numeric   |Effective field goal percentage (0-1).                                           |
#'    |free_throw_attempt_rate             |numeric   |Free throw attempt rate (FTA / FGA).                                             |
#'    |team_turnover_percentage            |numeric   |Team turnover percentage (0-1).                                                  |
#'    |offensive_rebound_percentage        |numeric   |Offensive rebound percentage (0-1).                                              |
#'    |opp_effective_field_goal_percentage |numeric   |Opponent effective field goal percentage (0-1 decimal).                          |
#'    |opp_free_throw_attempt_rate         |numeric   |Opponent free throw attempt rate.                                                |
#'    |opp_team_turnover_percentage        |numeric   |Opponent team turnover percentage (0-1 decimal).                                 |
#'    |opp_offensive_rebound_percentage    |numeric   |Opponent offensive rebound percentage (0-1 decimal).                             |
#'
#'    **home_team_totals_four_factors**
#'
#'
#'    |col_name                            |types     |description                                                                      |
#'    |:-----------------------------------|:---------|:--------------------------------------------------------------------------------|
#'    |game_id                             |character |Unique game identifier.                                                          |
#'    |away_team_id                        |integer   |Unique identifier for the away team.                                             |
#'    |home_team_id                        |integer   |Unique identifier for the home team.                                             |
#'    |team_id                             |integer   |Unique team identifier.                                                          |
#'    |team_name                           |character |Full team display name (e.g. 'Las Vegas Aces').                                  |
#'    |team_city                           |character |Team city or region (e.g. 'Las Vegas').                                          |
#'    |team_tricode                        |character |Three-letter team code (e.g. 'LAS' / 'NYL').                                     |
#'    |team_slug                           |character |URL-safe team identifier (e.g. 'lasvegas-aces' / 'aces').                        |
#'    |minutes                             |character |Minutes played, formatted MM:SS (V3 PT-duration parsed) or decimal minutes (V2). |
#'    |effective_field_goal_percentage     |numeric   |Effective field goal percentage (0-1).                                           |
#'    |free_throw_attempt_rate             |numeric   |Free throw attempt rate (FTA / FGA).                                             |
#'    |team_turnover_percentage            |numeric   |Team turnover percentage (0-1).                                                  |
#'    |offensive_rebound_percentage        |numeric   |Offensive rebound percentage (0-1).                                              |
#'    |opp_effective_field_goal_percentage |numeric   |Opponent effective field goal percentage (0-1 decimal).                          |
#'    |opp_free_throw_attempt_rate         |numeric   |Opponent free throw attempt rate.                                                |
#'    |opp_team_turnover_percentage        |numeric   |Opponent team turnover percentage (0-1 decimal).                                 |
#'    |opp_offensive_rebound_percentage    |numeric   |Opponent offensive rebound percentage (0-1 decimal).                             |
#'
#'    **away_team_totals_four_factors**
#'
#'
#'    |col_name                            |types     |description                                                                      |
#'    |:-----------------------------------|:---------|:--------------------------------------------------------------------------------|
#'    |game_id                             |character |Unique game identifier.                                                          |
#'    |away_team_id                        |integer   |Unique identifier for the away team.                                             |
#'    |home_team_id                        |integer   |Unique identifier for the home team.                                             |
#'    |team_id                             |integer   |Unique team identifier.                                                          |
#'    |team_name                           |character |Full team display name (e.g. 'Las Vegas Aces').                                  |
#'    |team_city                           |character |Team city or region (e.g. 'Las Vegas').                                          |
#'    |team_tricode                        |character |Three-letter team code (e.g. 'LAS' / 'NYL').                                     |
#'    |team_slug                           |character |URL-safe team identifier (e.g. 'lasvegas-aces' / 'aces').                        |
#'    |minutes                             |character |Minutes played, formatted MM:SS (V3 PT-duration parsed) or decimal minutes (V2). |
#'    |effective_field_goal_percentage     |numeric   |Effective field goal percentage (0-1).                                           |
#'    |free_throw_attempt_rate             |numeric   |Free throw attempt rate (FTA / FGA).                                             |
#'    |team_turnover_percentage            |numeric   |Team turnover percentage (0-1).                                                  |
#'    |offensive_rebound_percentage        |numeric   |Offensive rebound percentage (0-1).                                              |
#'    |opp_effective_field_goal_percentage |numeric   |Opponent effective field goal percentage (0-1 decimal).                          |
#'    |opp_free_throw_attempt_rate         |numeric   |Opponent free throw attempt rate.                                                |
#'    |opp_team_turnover_percentage        |numeric   |Opponent team turnover percentage (0-1 decimal).                                 |
#'    |opp_offensive_rebound_percentage    |numeric   |Opponent offensive rebound percentage (0-1 decimal).                             |
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
#'    |col_name                              |types     |description                                                                      |
#'    |:-------------------------------------|:---------|:--------------------------------------------------------------------------------|
#'    |game_id                               |character |Unique game identifier.                                                          |
#'    |away_team_id                          |integer   |Unique identifier for the away team.                                             |
#'    |home_team_id                          |integer   |Unique identifier for the home team.                                             |
#'    |team_id                               |integer   |Unique team identifier.                                                          |
#'    |team_name                             |character |Full team display name (e.g. 'Las Vegas Aces').                                  |
#'    |team_city                             |character |Team city or region (e.g. 'Las Vegas').                                          |
#'    |team_tricode                          |character |Three-letter team code (e.g. 'LAS' / 'NYL').                                     |
#'    |team_slug                             |character |URL-safe team identifier (e.g. 'lasvegas-aces' / 'aces').                        |
#'    |person_id                             |integer   |Unique player identifier (V3 endpoints).                                         |
#'    |first_name                            |character |Player's first name.                                                             |
#'    |family_name                           |character |Player's family / last name.                                                     |
#'    |name_i                                |character |Initialed name (e.g. 'A. Wilson').                                               |
#'    |player_slug                           |character |URL-safe player identifier.                                                      |
#'    |position                              |character |Listed roster position (G, F, C, etc.).                                          |
#'    |comment                               |character |Player status / inactive reason (e.g. 'DNP - Coach's Decision', 'Inactive').     |
#'    |jersey_num                            |character |Jersey number worn by the player.                                                |
#'    |minutes                               |character |Minutes played, formatted MM:SS (V3 PT-duration parsed) or decimal minutes (V2). |
#'    |speed                                 |numeric   |Speed.                                                                           |
#'    |distance                              |numeric   |Distance value (in feet for shot data; otherwise context-dependent).             |
#'    |rebound_chances_offensive             |integer   |Rebound chances offensive.                                                       |
#'    |rebound_chances_defensive             |integer   |Rebound chances defensive.                                                       |
#'    |rebound_chances_total                 |integer   |Rebound chances total.                                                           |
#'    |touches                               |integer   |Touches.                                                                         |
#'    |secondary_assists                     |integer   |Secondary assists.                                                               |
#'    |free_throw_assists                    |integer   |Free throw assists (passes that led to a fouled shot attempt).                   |
#'    |passes                                |integer   |Passes.                                                                          |
#'    |assists                               |integer   |Total assists.                                                                   |
#'    |contested_field_goals_made            |integer   |Contested field goals made.                                                      |
#'    |contested_field_goals_attempted       |integer   |Contested field goal attempts.                                                   |
#'    |contested_field_goal_percentage       |numeric   |Contested field goal percentage (0-1).                                           |
#'    |uncontested_field_goals_made          |integer   |Number of uncontested field goals made.                                          |
#'    |uncontested_field_goals_attempted     |integer   |Number of uncontested field goals attempted.                                     |
#'    |uncontested_field_goals_percentage    |numeric   |Uncontested field goals percentage (0-1 decimal).                                |
#'    |field_goal_percentage                 |numeric   |Field Goal Percentage.                                                           |
#'    |defended_at_rim_field_goals_made      |integer   |Field goals made allowed when defending at the rim.                              |
#'    |defended_at_rim_field_goals_attempted |integer   |Field goal attempts allowed when defending at the rim.                           |
#'    |defended_at_rim_field_goal_percentage |numeric   |Field goal percentage allowed at the rim (0-1).                                  |
#'
#'    **away_team_player_player_track**
#'
#'
#'    |col_name                              |types     |description                                                                      |
#'    |:-------------------------------------|:---------|:--------------------------------------------------------------------------------|
#'    |game_id                               |character |Unique game identifier.                                                          |
#'    |away_team_id                          |integer   |Unique identifier for the away team.                                             |
#'    |home_team_id                          |integer   |Unique identifier for the home team.                                             |
#'    |team_id                               |integer   |Unique team identifier.                                                          |
#'    |team_name                             |character |Full team display name (e.g. 'Las Vegas Aces').                                  |
#'    |team_city                             |character |Team city or region (e.g. 'Las Vegas').                                          |
#'    |team_tricode                          |character |Three-letter team code (e.g. 'LAS' / 'NYL').                                     |
#'    |team_slug                             |character |URL-safe team identifier (e.g. 'lasvegas-aces' / 'aces').                        |
#'    |person_id                             |integer   |Unique player identifier (V3 endpoints).                                         |
#'    |first_name                            |character |Player's first name.                                                             |
#'    |family_name                           |character |Player's family / last name.                                                     |
#'    |name_i                                |character |Initialed name (e.g. 'A. Wilson').                                               |
#'    |player_slug                           |character |URL-safe player identifier.                                                      |
#'    |position                              |character |Listed roster position (G, F, C, etc.).                                          |
#'    |comment                               |character |Player status / inactive reason (e.g. 'DNP - Coach's Decision', 'Inactive').     |
#'    |jersey_num                            |character |Jersey number worn by the player.                                                |
#'    |minutes                               |character |Minutes played, formatted MM:SS (V3 PT-duration parsed) or decimal minutes (V2). |
#'    |speed                                 |numeric   |Speed.                                                                           |
#'    |distance                              |numeric   |Distance value (in feet for shot data; otherwise context-dependent).             |
#'    |rebound_chances_offensive             |integer   |Rebound chances offensive.                                                       |
#'    |rebound_chances_defensive             |integer   |Rebound chances defensive.                                                       |
#'    |rebound_chances_total                 |integer   |Rebound chances total.                                                           |
#'    |touches                               |integer   |Touches.                                                                         |
#'    |secondary_assists                     |integer   |Secondary assists.                                                               |
#'    |free_throw_assists                    |integer   |Free throw assists (passes that led to a fouled shot attempt).                   |
#'    |passes                                |integer   |Passes.                                                                          |
#'    |assists                               |integer   |Total assists.                                                                   |
#'    |contested_field_goals_made            |integer   |Contested field goals made.                                                      |
#'    |contested_field_goals_attempted       |integer   |Contested field goal attempts.                                                   |
#'    |contested_field_goal_percentage       |numeric   |Contested field goal percentage (0-1).                                           |
#'    |uncontested_field_goals_made          |integer   |Number of uncontested field goals made.                                          |
#'    |uncontested_field_goals_attempted     |integer   |Number of uncontested field goals attempted.                                     |
#'    |uncontested_field_goals_percentage    |numeric   |Uncontested field goals percentage (0-1 decimal).                                |
#'    |field_goal_percentage                 |numeric   |Field Goal Percentage.                                                           |
#'    |defended_at_rim_field_goals_made      |integer   |Field goals made allowed when defending at the rim.                              |
#'    |defended_at_rim_field_goals_attempted |integer   |Field goal attempts allowed when defending at the rim.                           |
#'    |defended_at_rim_field_goal_percentage |numeric   |Field goal percentage allowed at the rim (0-1).                                  |
#'
#'    **home_team_totals_player_track**
#'
#'
#'    |col_name                              |types     |description                                                                      |
#'    |:-------------------------------------|:---------|:--------------------------------------------------------------------------------|
#'    |game_id                               |character |Unique game identifier.                                                          |
#'    |away_team_id                          |integer   |Unique identifier for the away team.                                             |
#'    |home_team_id                          |integer   |Unique identifier for the home team.                                             |
#'    |team_id                               |integer   |Unique team identifier.                                                          |
#'    |team_name                             |character |Full team display name (e.g. 'Las Vegas Aces').                                  |
#'    |team_city                             |character |Team city or region (e.g. 'Las Vegas').                                          |
#'    |team_tricode                          |character |Three-letter team code (e.g. 'LAS' / 'NYL').                                     |
#'    |team_slug                             |character |URL-safe team identifier (e.g. 'lasvegas-aces' / 'aces').                        |
#'    |minutes                               |character |Minutes played, formatted MM:SS (V3 PT-duration parsed) or decimal minutes (V2). |
#'    |distance                              |numeric   |Distance value (in feet for shot data; otherwise context-dependent).             |
#'    |rebound_chances_offensive             |integer   |Rebound chances offensive.                                                       |
#'    |rebound_chances_defensive             |integer   |Rebound chances defensive.                                                       |
#'    |rebound_chances_total                 |integer   |Rebound chances total.                                                           |
#'    |touches                               |integer   |Touches.                                                                         |
#'    |secondary_assists                     |integer   |Secondary assists.                                                               |
#'    |free_throw_assists                    |integer   |Free throw assists (passes that led to a fouled shot attempt).                   |
#'    |passes                                |integer   |Passes.                                                                          |
#'    |assists                               |integer   |Total assists.                                                                   |
#'    |contested_field_goals_made            |integer   |Contested field goals made.                                                      |
#'    |contested_field_goals_attempted       |integer   |Contested field goal attempts.                                                   |
#'    |contested_field_goal_percentage       |numeric   |Contested field goal percentage (0-1).                                           |
#'    |uncontested_field_goals_made          |integer   |Number of uncontested field goals made.                                          |
#'    |uncontested_field_goals_attempted     |integer   |Number of uncontested field goals attempted.                                     |
#'    |uncontested_field_goals_percentage    |numeric   |Uncontested field goals percentage (0-1 decimal).                                |
#'    |field_goal_percentage                 |numeric   |Field Goal Percentage.                                                           |
#'    |defended_at_rim_field_goals_made      |integer   |Field goals made allowed when defending at the rim.                              |
#'    |defended_at_rim_field_goals_attempted |integer   |Field goal attempts allowed when defending at the rim.                           |
#'    |defended_at_rim_field_goal_percentage |numeric   |Field goal percentage allowed at the rim (0-1).                                  |
#'
#'    **away_team_totals_player_track**
#'
#'
#'    |col_name                              |types     |description                                                                      |
#'    |:-------------------------------------|:---------|:--------------------------------------------------------------------------------|
#'    |game_id                               |character |Unique game identifier.                                                          |
#'    |away_team_id                          |integer   |Unique identifier for the away team.                                             |
#'    |home_team_id                          |integer   |Unique identifier for the home team.                                             |
#'    |team_id                               |integer   |Unique team identifier.                                                          |
#'    |team_name                             |character |Full team display name (e.g. 'Las Vegas Aces').                                  |
#'    |team_city                             |character |Team city or region (e.g. 'Las Vegas').                                          |
#'    |team_tricode                          |character |Three-letter team code (e.g. 'LAS' / 'NYL').                                     |
#'    |team_slug                             |character |URL-safe team identifier (e.g. 'lasvegas-aces' / 'aces').                        |
#'    |minutes                               |character |Minutes played, formatted MM:SS (V3 PT-duration parsed) or decimal minutes (V2). |
#'    |distance                              |numeric   |Distance value (in feet for shot data; otherwise context-dependent).             |
#'    |rebound_chances_offensive             |integer   |Rebound chances offensive.                                                       |
#'    |rebound_chances_defensive             |integer   |Rebound chances defensive.                                                       |
#'    |rebound_chances_total                 |integer   |Rebound chances total.                                                           |
#'    |touches                               |integer   |Touches.                                                                         |
#'    |secondary_assists                     |integer   |Secondary assists.                                                               |
#'    |free_throw_assists                    |integer   |Free throw assists (passes that led to a fouled shot attempt).                   |
#'    |passes                                |integer   |Passes.                                                                          |
#'    |assists                               |integer   |Total assists.                                                                   |
#'    |contested_field_goals_made            |integer   |Contested field goals made.                                                      |
#'    |contested_field_goals_attempted       |integer   |Contested field goal attempts.                                                   |
#'    |contested_field_goal_percentage       |numeric   |Contested field goal percentage (0-1).                                           |
#'    |uncontested_field_goals_made          |integer   |Number of uncontested field goals made.                                          |
#'    |uncontested_field_goals_attempted     |integer   |Number of uncontested field goals attempted.                                     |
#'    |uncontested_field_goals_percentage    |numeric   |Uncontested field goals percentage (0-1 decimal).                                |
#'    |field_goal_percentage                 |numeric   |Field Goal Percentage.                                                           |
#'    |defended_at_rim_field_goals_made      |integer   |Field goals made allowed when defending at the rim.                              |
#'    |defended_at_rim_field_goals_attempted |integer   |Field goal attempts allowed when defending at the rim.                           |
#'    |defended_at_rim_field_goal_percentage |numeric   |Field goal percentage allowed at the rim (0-1).                                  |
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


#' **Get WNBA Stats API Boxscore Usage V3**
#' @name wnba_boxscoreusagev3
NULL
#' @title
#' **Get WNBA Stats API Boxscore Usage V3**
#' @rdname wnba_boxscoreusagev3
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
#'    |col_name                            |types     |description                                                                      |
#'    |:-----------------------------------|:---------|:--------------------------------------------------------------------------------|
#'    |game_id                             |character |Unique game identifier.                                                          |
#'    |away_team_id                        |integer   |Unique identifier for the away team.                                             |
#'    |home_team_id                        |integer   |Unique identifier for the home team.                                             |
#'    |team_id                             |integer   |Unique team identifier.                                                          |
#'    |team_name                           |character |Full team display name (e.g. 'Las Vegas Aces').                                  |
#'    |team_city                           |character |Team city or region (e.g. 'Las Vegas').                                          |
#'    |team_tricode                        |character |Three-letter team code (e.g. 'LAS' / 'NYL').                                     |
#'    |team_slug                           |character |URL-safe team identifier (e.g. 'lasvegas-aces' / 'aces').                        |
#'    |person_id                           |integer   |Unique player identifier (V3 endpoints).                                         |
#'    |first_name                          |character |Player's first name.                                                             |
#'    |family_name                         |character |Player's family / last name.                                                     |
#'    |name_i                              |character |Initialed name (e.g. 'A. Wilson').                                               |
#'    |player_slug                         |character |URL-safe player identifier.                                                      |
#'    |position                            |character |Listed roster position (G, F, C, etc.).                                          |
#'    |comment                             |character |Player status / inactive reason (e.g. 'DNP - Coach's Decision', 'Inactive').     |
#'    |jersey_num                          |character |Jersey number worn by the player.                                                |
#'    |minutes                             |character |Minutes played, formatted MM:SS (V3 PT-duration parsed) or decimal minutes (V2). |
#'    |usage_percentage                    |numeric   |Usage percentage (0-1).                                                          |
#'    |percentage_field_goals_made         |numeric   |Number of percentage field goals made.                                           |
#'    |percentage_field_goals_attempted    |numeric   |Number of percentage field goals attempted.                                      |
#'    |percentage_three_pointers_made      |numeric   |Number of percentage three pointers made.                                        |
#'    |percentage_three_pointers_attempted |numeric   |Number of percentage three pointers attempted.                                   |
#'    |percentage_free_throws_made         |numeric   |Number of percentage free throws made.                                           |
#'    |percentage_free_throws_attempted    |numeric   |Number of percentage free throws attempted.                                      |
#'    |percentage_rebounds_offensive       |numeric   |Percentage rebounds offensive.                                                   |
#'    |percentage_rebounds_defensive       |numeric   |Percentage rebounds defensive.                                                   |
#'    |percentage_rebounds_total           |numeric   |Percentage rebounds total.                                                       |
#'    |percentage_assists                  |numeric   |Percentage assists.                                                              |
#'    |percentage_turnovers                |numeric   |Percentage turnovers.                                                            |
#'    |percentage_steals                   |numeric   |Percentage steals.                                                               |
#'    |percentage_blocks                   |numeric   |Percentage blocks.                                                               |
#'    |percentage_blocks_allowed           |numeric   |Percentage blocks allowed.                                                       |
#'    |percentage_personal_fouls           |numeric   |Percentage personal fouls.                                                       |
#'    |percentage_personal_fouls_drawn     |numeric   |Percentage personal fouls drawn.                                                 |
#'    |percentage_points                   |numeric   |Percentage points.                                                               |
#'
#'    **away_team_player_usage**
#'
#'
#'    |col_name                            |types     |description                                                                      |
#'    |:-----------------------------------|:---------|:--------------------------------------------------------------------------------|
#'    |game_id                             |character |Unique game identifier.                                                          |
#'    |away_team_id                        |integer   |Unique identifier for the away team.                                             |
#'    |home_team_id                        |integer   |Unique identifier for the home team.                                             |
#'    |team_id                             |integer   |Unique team identifier.                                                          |
#'    |team_name                           |character |Full team display name (e.g. 'Las Vegas Aces').                                  |
#'    |team_city                           |character |Team city or region (e.g. 'Las Vegas').                                          |
#'    |team_tricode                        |character |Three-letter team code (e.g. 'LAS' / 'NYL').                                     |
#'    |team_slug                           |character |URL-safe team identifier (e.g. 'lasvegas-aces' / 'aces').                        |
#'    |person_id                           |integer   |Unique player identifier (V3 endpoints).                                         |
#'    |first_name                          |character |Player's first name.                                                             |
#'    |family_name                         |character |Player's family / last name.                                                     |
#'    |name_i                              |character |Initialed name (e.g. 'A. Wilson').                                               |
#'    |player_slug                         |character |URL-safe player identifier.                                                      |
#'    |position                            |character |Listed roster position (G, F, C, etc.).                                          |
#'    |comment                             |character |Player status / inactive reason (e.g. 'DNP - Coach's Decision', 'Inactive').     |
#'    |jersey_num                          |character |Jersey number worn by the player.                                                |
#'    |minutes                             |character |Minutes played, formatted MM:SS (V3 PT-duration parsed) or decimal minutes (V2). |
#'    |usage_percentage                    |numeric   |Usage percentage (0-1).                                                          |
#'    |percentage_field_goals_made         |numeric   |Number of percentage field goals made.                                           |
#'    |percentage_field_goals_attempted    |numeric   |Number of percentage field goals attempted.                                      |
#'    |percentage_three_pointers_made      |numeric   |Number of percentage three pointers made.                                        |
#'    |percentage_three_pointers_attempted |numeric   |Number of percentage three pointers attempted.                                   |
#'    |percentage_free_throws_made         |numeric   |Number of percentage free throws made.                                           |
#'    |percentage_free_throws_attempted    |numeric   |Number of percentage free throws attempted.                                      |
#'    |percentage_rebounds_offensive       |numeric   |Percentage rebounds offensive.                                                   |
#'    |percentage_rebounds_defensive       |numeric   |Percentage rebounds defensive.                                                   |
#'    |percentage_rebounds_total           |numeric   |Percentage rebounds total.                                                       |
#'    |percentage_assists                  |numeric   |Percentage assists.                                                              |
#'    |percentage_turnovers                |numeric   |Percentage turnovers.                                                            |
#'    |percentage_steals                   |numeric   |Percentage steals.                                                               |
#'    |percentage_blocks                   |numeric   |Percentage blocks.                                                               |
#'    |percentage_blocks_allowed           |numeric   |Percentage blocks allowed.                                                       |
#'    |percentage_personal_fouls           |numeric   |Percentage personal fouls.                                                       |
#'    |percentage_personal_fouls_drawn     |numeric   |Percentage personal fouls drawn.                                                 |
#'    |percentage_points                   |numeric   |Percentage points.                                                               |
#'
#'    **home_team_totals_usage**
#'
#'
#'    |col_name                            |types     |description                                                                      |
#'    |:-----------------------------------|:---------|:--------------------------------------------------------------------------------|
#'    |game_id                             |character |Unique game identifier.                                                          |
#'    |away_team_id                        |integer   |Unique identifier for the away team.                                             |
#'    |home_team_id                        |integer   |Unique identifier for the home team.                                             |
#'    |team_id                             |integer   |Unique team identifier.                                                          |
#'    |team_name                           |character |Full team display name (e.g. 'Las Vegas Aces').                                  |
#'    |team_city                           |character |Team city or region (e.g. 'Las Vegas').                                          |
#'    |team_tricode                        |character |Three-letter team code (e.g. 'LAS' / 'NYL').                                     |
#'    |team_slug                           |character |URL-safe team identifier (e.g. 'lasvegas-aces' / 'aces').                        |
#'    |minutes                             |character |Minutes played, formatted MM:SS (V3 PT-duration parsed) or decimal minutes (V2). |
#'    |usage_percentage                    |numeric   |Usage percentage (0-1).                                                          |
#'    |percentage_field_goals_made         |numeric   |Number of percentage field goals made.                                           |
#'    |percentage_field_goals_attempted    |numeric   |Number of percentage field goals attempted.                                      |
#'    |percentage_three_pointers_made      |numeric   |Number of percentage three pointers made.                                        |
#'    |percentage_three_pointers_attempted |numeric   |Number of percentage three pointers attempted.                                   |
#'    |percentage_free_throws_made         |numeric   |Number of percentage free throws made.                                           |
#'    |percentage_free_throws_attempted    |numeric   |Number of percentage free throws attempted.                                      |
#'    |percentage_rebounds_offensive       |numeric   |Percentage rebounds offensive.                                                   |
#'    |percentage_rebounds_defensive       |numeric   |Percentage rebounds defensive.                                                   |
#'    |percentage_rebounds_total           |numeric   |Percentage rebounds total.                                                       |
#'    |percentage_assists                  |numeric   |Percentage assists.                                                              |
#'    |percentage_turnovers                |numeric   |Percentage turnovers.                                                            |
#'    |percentage_steals                   |numeric   |Percentage steals.                                                               |
#'    |percentage_blocks                   |numeric   |Percentage blocks.                                                               |
#'    |percentage_blocks_allowed           |numeric   |Percentage blocks allowed.                                                       |
#'    |percentage_personal_fouls           |numeric   |Percentage personal fouls.                                                       |
#'    |percentage_personal_fouls_drawn     |numeric   |Percentage personal fouls drawn.                                                 |
#'    |percentage_points                   |numeric   |Percentage points.                                                               |
#'
#'    **away_team_totals_usage**
#'
#'
#'    |col_name                            |types     |description                                                                      |
#'    |:-----------------------------------|:---------|:--------------------------------------------------------------------------------|
#'    |game_id                             |character |Unique game identifier.                                                          |
#'    |away_team_id                        |integer   |Unique identifier for the away team.                                             |
#'    |home_team_id                        |integer   |Unique identifier for the home team.                                             |
#'    |team_id                             |integer   |Unique team identifier.                                                          |
#'    |team_name                           |character |Full team display name (e.g. 'Las Vegas Aces').                                  |
#'    |team_city                           |character |Team city or region (e.g. 'Las Vegas').                                          |
#'    |team_tricode                        |character |Three-letter team code (e.g. 'LAS' / 'NYL').                                     |
#'    |team_slug                           |character |URL-safe team identifier (e.g. 'lasvegas-aces' / 'aces').                        |
#'    |minutes                             |character |Minutes played, formatted MM:SS (V3 PT-duration parsed) or decimal minutes (V2). |
#'    |usage_percentage                    |numeric   |Usage percentage (0-1).                                                          |
#'    |percentage_field_goals_made         |numeric   |Number of percentage field goals made.                                           |
#'    |percentage_field_goals_attempted    |numeric   |Number of percentage field goals attempted.                                      |
#'    |percentage_three_pointers_made      |numeric   |Number of percentage three pointers made.                                        |
#'    |percentage_three_pointers_attempted |numeric   |Number of percentage three pointers attempted.                                   |
#'    |percentage_free_throws_made         |numeric   |Number of percentage free throws made.                                           |
#'    |percentage_free_throws_attempted    |numeric   |Number of percentage free throws attempted.                                      |
#'    |percentage_rebounds_offensive       |numeric   |Percentage rebounds offensive.                                                   |
#'    |percentage_rebounds_defensive       |numeric   |Percentage rebounds defensive.                                                   |
#'    |percentage_rebounds_total           |numeric   |Percentage rebounds total.                                                       |
#'    |percentage_assists                  |numeric   |Percentage assists.                                                              |
#'    |percentage_turnovers                |numeric   |Percentage turnovers.                                                            |
#'    |percentage_steals                   |numeric   |Percentage steals.                                                               |
#'    |percentage_blocks                   |numeric   |Percentage blocks.                                                               |
#'    |percentage_blocks_allowed           |numeric   |Percentage blocks allowed.                                                       |
#'    |percentage_personal_fouls           |numeric   |Percentage personal fouls.                                                       |
#'    |percentage_personal_fouls_drawn     |numeric   |Percentage personal fouls drawn.                                                 |
#'    |percentage_points                   |numeric   |Percentage points.                                                               |
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
#'    |col_name                         |types     |description                                            |
#'    |:--------------------------------|:---------|:------------------------------------------------------|
#'    |game_date                        |character |Game date (YYYY-MM-DD).                                |
#'    |game_sequence                    |integer   |Game sequence.                                         |
#'    |game_id                          |character |Unique game identifier.                                |
#'    |game_status_id                   |integer   |Numeric game status identifier.                        |
#'    |game_status_text                 |character |Game status display text (e.g. 'Final', '4:32 - 4th'). |
#'    |gamecode                         |character |Gamecode.                                              |
#'    |home_team_id                     |integer   |Unique identifier for the home team.                   |
#'    |visitor_team_id                  |integer   |Unique identifier for visitor team.                    |
#'    |season                           |character |Season identifier (4-digit year or 'YYYY-YY' string).  |
#'    |live_period                      |integer   |Live period.                                           |
#'    |live_pc_time                     |character |Time / clock value.                                    |
#'    |natl_tv_broadcaster_abbreviation |character |Natl tv broadcaster abbreviation.                      |
#'    |home_tv_broadcaster_abbreviation |character |Home team's tv broadcaster abbreviation.               |
#'    |away_tv_broadcaster_abbreviation |character |Away team's tv broadcaster abbreviation.               |
#'    |live_period_time_bcast           |character |Live period time bcast.                                |
#'    |arena_name                       |character |Arena name.                                            |
#'    |wh_status                        |integer   |Wh status.                                             |
#'
#'    **line_score**
#'
#'
#'    |col_name          |types     |description                                     |
#'    |:-----------------|:---------|:-----------------------------------------------|
#'    |game_date_est     |character |Game date est.                                  |
#'    |game_sequence     |integer   |Game sequence.                                  |
#'    |game_id           |character |Unique game identifier.                         |
#'    |team_id           |integer   |Unique team identifier.                         |
#'    |team_abbreviation |character |Short team abbreviation (e.g. 'LAS').           |
#'    |team_city_name    |character |Team city name.                                 |
#'    |team_name         |character |Full team display name (e.g. 'Las Vegas Aces'). |
#'    |team_wins_losses  |character |Team wins losses.                               |
#'    |pts_qtr1          |integer   |Pts qtr1.                                       |
#'    |pts_qtr2          |integer   |Pts qtr2.                                       |
#'    |pts_qtr3          |integer   |Pts qtr3.                                       |
#'    |pts_qtr4          |integer   |Pts qtr4.                                       |
#'    |pts_ot1           |integer   |Pts ot1.                                        |
#'    |pts               |integer   |Points scored.                                  |
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
#'    |col_name                        |types     |description                                                                      |
#'    |:-------------------------------|:---------|:--------------------------------------------------------------------------------|
#'    |game_id                         |character |Unique game identifier.                                                          |
#'    |away_team_id                    |integer   |Unique identifier for the away team.                                             |
#'    |home_team_id                    |integer   |Unique identifier for the home team.                                             |
#'    |team_id                         |integer   |Unique team identifier.                                                          |
#'    |team_name                       |character |Full team display name (e.g. 'Las Vegas Aces').                                  |
#'    |team_city                       |character |Team city or region (e.g. 'Las Vegas').                                          |
#'    |team_tricode                    |character |Three-letter team code (e.g. 'LAS' / 'NYL').                                     |
#'    |team_slug                       |character |URL-safe team identifier (e.g. 'lasvegas-aces' / 'aces').                        |
#'    |person_id                       |integer   |Unique player identifier (V3 endpoints).                                         |
#'    |first_name                      |character |Player's first name.                                                             |
#'    |family_name                     |character |Player's family / last name.                                                     |
#'    |name_i                          |character |Initialed name (e.g. 'A. Wilson').                                               |
#'    |player_slug                     |character |URL-safe player identifier.                                                      |
#'    |position                        |character |Listed roster position (G, F, C, etc.).                                          |
#'    |comment                         |character |Player status / inactive reason (e.g. 'DNP - Coach's Decision', 'Inactive').     |
#'    |jersey_num                      |character |Jersey number worn by the player.                                                |
#'    |minutes                         |character |Minutes played, formatted MM:SS (V3 PT-duration parsed) or decimal minutes (V2). |
#'    |points                          |integer   |Points scored.                                                                   |
#'    |contested_shots                 |integer   |Defensively contested shots.                                                     |
#'    |contested_shots2pt              |integer   |Contested shots2pt.                                                              |
#'    |contested_shots3pt              |integer   |Contested shots3pt.                                                              |
#'    |deflections                     |integer   |Defensive deflections.                                                           |
#'    |charges_drawn                   |integer   |Charges drawn.                                                                   |
#'    |screen_assists                  |integer   |Screen assists (resulting in a basket).                                          |
#'    |screen_assist_points            |integer   |Points generated from screen assists.                                            |
#'    |loose_balls_recovered_offensive |integer   |Loose balls recovered on offense.                                                |
#'    |loose_balls_recovered_defensive |integer   |Loose balls recovered on defense.                                                |
#'    |loose_balls_recovered_total     |integer   |Loose balls recovered total.                                                     |
#'    |offensive_box_outs              |integer   |Offensive box outs.                                                              |
#'    |defensive_box_outs              |integer   |Defensive box outs.                                                              |
#'    |box_out_player_team_rebounds    |integer   |Box-outs that led to either a player or team rebound.                            |
#'    |box_out_player_rebounds         |integer   |Box-outs that led to a player rebound.                                           |
#'    |box_outs                        |integer   |Box-outs executed.                                                               |
#'
#'    **away_team_player_hustle**
#'
#'
#'    |col_name                        |types     |description                                                                      |
#'    |:-------------------------------|:---------|:--------------------------------------------------------------------------------|
#'    |game_id                         |character |Unique game identifier.                                                          |
#'    |away_team_id                    |integer   |Unique identifier for the away team.                                             |
#'    |home_team_id                    |integer   |Unique identifier for the home team.                                             |
#'    |team_id                         |integer   |Unique team identifier.                                                          |
#'    |team_name                       |character |Full team display name (e.g. 'Las Vegas Aces').                                  |
#'    |team_city                       |character |Team city or region (e.g. 'Las Vegas').                                          |
#'    |team_tricode                    |character |Three-letter team code (e.g. 'LAS' / 'NYL').                                     |
#'    |team_slug                       |character |URL-safe team identifier (e.g. 'lasvegas-aces' / 'aces').                        |
#'    |person_id                       |integer   |Unique player identifier (V3 endpoints).                                         |
#'    |first_name                      |character |Player's first name.                                                             |
#'    |family_name                     |character |Player's family / last name.                                                     |
#'    |name_i                          |character |Initialed name (e.g. 'A. Wilson').                                               |
#'    |player_slug                     |character |URL-safe player identifier.                                                      |
#'    |position                        |character |Listed roster position (G, F, C, etc.).                                          |
#'    |comment                         |character |Player status / inactive reason (e.g. 'DNP - Coach's Decision', 'Inactive').     |
#'    |jersey_num                      |character |Jersey number worn by the player.                                                |
#'    |minutes                         |character |Minutes played, formatted MM:SS (V3 PT-duration parsed) or decimal minutes (V2). |
#'    |points                          |integer   |Points scored.                                                                   |
#'    |contested_shots                 |integer   |Defensively contested shots.                                                     |
#'    |contested_shots2pt              |integer   |Contested shots2pt.                                                              |
#'    |contested_shots3pt              |integer   |Contested shots3pt.                                                              |
#'    |deflections                     |integer   |Defensive deflections.                                                           |
#'    |charges_drawn                   |integer   |Charges drawn.                                                                   |
#'    |screen_assists                  |integer   |Screen assists (resulting in a basket).                                          |
#'    |screen_assist_points            |integer   |Points generated from screen assists.                                            |
#'    |loose_balls_recovered_offensive |integer   |Loose balls recovered on offense.                                                |
#'    |loose_balls_recovered_defensive |integer   |Loose balls recovered on defense.                                                |
#'    |loose_balls_recovered_total     |integer   |Loose balls recovered total.                                                     |
#'    |offensive_box_outs              |integer   |Offensive box outs.                                                              |
#'    |defensive_box_outs              |integer   |Defensive box outs.                                                              |
#'    |box_out_player_team_rebounds    |integer   |Box-outs that led to either a player or team rebound.                            |
#'    |box_out_player_rebounds         |integer   |Box-outs that led to a player rebound.                                           |
#'    |box_outs                        |integer   |Box-outs executed.                                                               |
#'
#'    **home_team_totals_hustle**
#'
#'
#'    |col_name                        |types     |description                                                                      |
#'    |:-------------------------------|:---------|:--------------------------------------------------------------------------------|
#'    |game_id                         |character |Unique game identifier.                                                          |
#'    |away_team_id                    |integer   |Unique identifier for the away team.                                             |
#'    |home_team_id                    |integer   |Unique identifier for the home team.                                             |
#'    |team_id                         |integer   |Unique team identifier.                                                          |
#'    |team_name                       |character |Full team display name (e.g. 'Las Vegas Aces').                                  |
#'    |team_city                       |character |Team city or region (e.g. 'Las Vegas').                                          |
#'    |team_tricode                    |character |Three-letter team code (e.g. 'LAS' / 'NYL').                                     |
#'    |team_slug                       |character |URL-safe team identifier (e.g. 'lasvegas-aces' / 'aces').                        |
#'    |minutes                         |character |Minutes played, formatted MM:SS (V3 PT-duration parsed) or decimal minutes (V2). |
#'    |points                          |integer   |Points scored.                                                                   |
#'    |contested_shots                 |integer   |Defensively contested shots.                                                     |
#'    |contested_shots2pt              |integer   |Contested shots2pt.                                                              |
#'    |contested_shots3pt              |integer   |Contested shots3pt.                                                              |
#'    |deflections                     |integer   |Defensive deflections.                                                           |
#'    |charges_drawn                   |integer   |Charges drawn.                                                                   |
#'    |screen_assists                  |integer   |Screen assists (resulting in a basket).                                          |
#'    |screen_assist_points            |integer   |Points generated from screen assists.                                            |
#'    |loose_balls_recovered_offensive |integer   |Loose balls recovered on offense.                                                |
#'    |loose_balls_recovered_defensive |integer   |Loose balls recovered on defense.                                                |
#'    |loose_balls_recovered_total     |integer   |Loose balls recovered total.                                                     |
#'    |offensive_box_outs              |integer   |Offensive box outs.                                                              |
#'    |defensive_box_outs              |integer   |Defensive box outs.                                                              |
#'    |box_out_player_team_rebounds    |integer   |Box-outs that led to either a player or team rebound.                            |
#'    |box_out_player_rebounds         |integer   |Box-outs that led to a player rebound.                                           |
#'    |box_outs                        |integer   |Box-outs executed.                                                               |
#'
#'    **away_team_totals_hustle**
#'
#'
#'    |col_name                        |types     |description                                                                      |
#'    |:-------------------------------|:---------|:--------------------------------------------------------------------------------|
#'    |game_id                         |character |Unique game identifier.                                                          |
#'    |away_team_id                    |integer   |Unique identifier for the away team.                                             |
#'    |home_team_id                    |integer   |Unique identifier for the home team.                                             |
#'    |team_id                         |integer   |Unique team identifier.                                                          |
#'    |team_name                       |character |Full team display name (e.g. 'Las Vegas Aces').                                  |
#'    |team_city                       |character |Team city or region (e.g. 'Las Vegas').                                          |
#'    |team_tricode                    |character |Three-letter team code (e.g. 'LAS' / 'NYL').                                     |
#'    |team_slug                       |character |URL-safe team identifier (e.g. 'lasvegas-aces' / 'aces').                        |
#'    |minutes                         |character |Minutes played, formatted MM:SS (V3 PT-duration parsed) or decimal minutes (V2). |
#'    |points                          |integer   |Points scored.                                                                   |
#'    |contested_shots                 |integer   |Defensively contested shots.                                                     |
#'    |contested_shots2pt              |integer   |Contested shots2pt.                                                              |
#'    |contested_shots3pt              |integer   |Contested shots3pt.                                                              |
#'    |deflections                     |integer   |Defensive deflections.                                                           |
#'    |charges_drawn                   |integer   |Charges drawn.                                                                   |
#'    |screen_assists                  |integer   |Screen assists (resulting in a basket).                                          |
#'    |screen_assist_points            |integer   |Points generated from screen assists.                                            |
#'    |loose_balls_recovered_offensive |integer   |Loose balls recovered on offense.                                                |
#'    |loose_balls_recovered_defensive |integer   |Loose balls recovered on defense.                                                |
#'    |loose_balls_recovered_total     |integer   |Loose balls recovered total.                                                     |
#'    |offensive_box_outs              |integer   |Offensive box outs.                                                              |
#'    |defensive_box_outs              |integer   |Defensive box outs.                                                              |
#'    |box_out_player_team_rebounds    |integer   |Box-outs that led to either a player or team rebound.                            |
#'    |box_out_player_rebounds         |integer   |Box-outs that led to a player rebound.                                           |
#'    |box_outs                        |integer   |Box-outs executed.                                                               |
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
#'    |col_name      |types     |description                                     |
#'    |:-------------|:---------|:-----------------------------------------------|
#'    |GAME_ID       |character |Unique game identifier.                         |
#'    |TEAM_ID       |character |Unique team identifier.                         |
#'    |TEAM_CITY     |character |Team city or region (e.g. 'Las Vegas').         |
#'    |TEAM_NAME     |character |Full team display name (e.g. 'Las Vegas Aces'). |
#'    |PERSON_ID     |character |Unique player identifier (V3 endpoints).        |
#'    |PLAYER_FIRST  |character |                                                |
#'    |PLAYER_LAST   |character |                                                |
#'    |IN_TIME_REAL  |character |                                                |
#'    |OUT_TIME_REAL |character |                                                |
#'    |PLAYER_PTS    |character |                                                |
#'    |PT_DIFF       |character |                                                |
#'    |USG_PCT       |character |Usage percentage (0-1).                         |
#'    
#'    **HomeTeam** 
#'    
#'    
#'    |col_name      |types     |description                                     |
#'    |:-------------|:---------|:-----------------------------------------------|
#'    |GAME_ID       |character |Unique game identifier.                         |
#'    |TEAM_ID       |character |Unique team identifier.                         |
#'    |TEAM_CITY     |character |Team city or region (e.g. 'Las Vegas').         |
#'    |TEAM_NAME     |character |Full team display name (e.g. 'Las Vegas Aces'). |
#'    |PERSON_ID     |character |Unique player identifier (V3 endpoints).        |
#'    |PLAYER_FIRST  |character |                                                |
#'    |PLAYER_LAST   |character |                                                |
#'    |IN_TIME_REAL  |character |                                                |
#'    |OUT_TIME_REAL |character |                                                |
#'    |PLAYER_PTS    |character |                                                |
#'    |PT_DIFF       |character |                                                |
#'    |USG_PCT       |character |Usage percentage (0-1).                         |
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
