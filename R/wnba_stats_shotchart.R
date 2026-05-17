#' **Get WNBA Stats API Shot Chart Detail**
#' @name wnba_shotchartdetail
NULL
#' @title
#' **Get WNBA Stats API Shot Chart Detail**
#' @rdname wnba_shotchartdetail
#' @author Saiem Gilani
#' @param context_measure context_measure
#' @param date_from date_from
#' @param date_to date_to
#' @param game_id game_id
#' @param game_segment game_segment
#' @param last_n_games last_n_games
#' @param league_id league_id
#' @param location location
#' @param month month
#' @param opponent_team_id opponent_team_id
#' @param outcome outcome
#' @param period period
#' @param player_id player_id
#' @param player_position player_position
#' @param rookie_year rookie_year
#' @param season season
#' @param season_segment season_segment
#' @param season_type season_type
#' @param team_id team_id
#' @param vs_conference vs_conference
#' @param vs_division vs_division
#' @param ... Additional arguments passed to an underlying function like httr.
#' @return Return a named list of data frames: LeagueAverages, Shot_Chart_Detail
#'
#'    **Shot_Chart_Detail**
#'
#'
#'    |col_name            |types     |description                                                           |
#'    |:-------------------|:---------|:---------------------------------------------------------------------|
#'    |GRID_TYPE           |character |                                                                      |
#'    |GAME_ID             |character |Unique game identifier.                                               |
#'    |GAME_EVENT_ID       |character |Unique identifier for game event.                                     |
#'    |PLAYER_ID           |character |Unique player identifier.                                             |
#'    |PLAYER_NAME         |character |Player name.                                                          |
#'    |TEAM_ID             |character |Unique team identifier.                                               |
#'    |TEAM_NAME           |character |Full team display name (e.g. 'Las Vegas Aces').                       |
#'    |PERIOD              |character |Period of the game (1-4 quarters; 5+ for OT).                         |
#'    |MINUTES_REMAINING   |character |Minutes remaining.                                                    |
#'    |SECONDS_REMAINING   |character |Seconds remaining in the period.                                      |
#'    |EVENT_TYPE          |character |Event / play type code (V2 PBP).                                      |
#'    |ACTION_TYPE         |character |Action type label (e.g. 'Made Shot', 'Substitution').                 |
#'    |SHOT_TYPE           |character |Shot type label (e.g. 'Jump Shot', 'Layup').                          |
#'    |SHOT_ZONE_BASIC     |character |Shot zone (e.g. 'Restricted Area', 'Mid-Range', 'Above the Break 3'). |
#'    |SHOT_ZONE_AREA      |character |Shot zone area ('Left Side', 'Right Side', 'Center').                 |
#'    |SHOT_ZONE_RANGE     |character |Shot zone range ('Less Than 8 ft.', '8-16 ft.', '16-24 ft.', etc.).   |
#'    |SHOT_DISTANCE       |character |Shot distance from the basket, in feet.                               |
#'    |LOC_X               |character |X coordinate on the court (units of inches; 0 = basket center).       |
#'    |LOC_Y               |character |Y coordinate on the court (units of inches; baseline at 0).           |
#'    |SHOT_ATTEMPTED_FLAG |character |1 if a shot was attempted on this event.                              |
#'    |SHOT_MADE_FLAG      |character |1 if the shot was made; 0 if missed.                                  |
#'    |GAME_DATE           |character |Game date (YYYY-MM-DD).                                               |
#'    |HTM                 |character |                                                                      |
#'    |VTM                 |character |                                                                      |
#'
#'    **LeagueAverages**
#'
#'
#'    |col_name        |types     |description                                                           |
#'    |:---------------|:---------|:---------------------------------------------------------------------|
#'    |GRID_TYPE       |character |                                                                      |
#'    |SHOT_ZONE_BASIC |character |Shot zone (e.g. 'Restricted Area', 'Mid-Range', 'Above the Break 3'). |
#'    |SHOT_ZONE_AREA  |character |Shot zone area ('Left Side', 'Right Side', 'Center').                 |
#'    |SHOT_ZONE_RANGE |character |Shot zone range ('Less Than 8 ft.', '8-16 ft.', '16-24 ft.', etc.).   |
#'    |FGA             |character |Field goal attempts.                                                  |
#'    |FGM             |character |Field goals made.                                                     |
#'    |FG_PCT          |character |Field goal percentage (0-1).                                          |
#'
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows as_tibble
#' @import rvest
#' @export
#' @family WNBA Shooting Functions
#' @details
#' ```r
#'  wnba_shotchartdetail(league_id = '10', player_id = '1628932', season = most_recent_wnba_season() - 1)
#' ```
wnba_shotchartdetail <- function(
    context_measure = 'FGA',
    date_from = '',
    date_to = '',
    game_id = '',
    game_segment = '',
    last_n_games = 0,
    league_id = '10',
    location = '',
    month = 0,
    opponent_team_id = 0,
    outcome = '',
    period = 0,
    player_id = '1628932',
    player_position = '',
    rookie_year = '',
    season = most_recent_wnba_season() - 1,
    season_segment = '',
    season_type = 'Regular Season',
    team_id = 0,
    vs_conference = '',
    vs_division = '',
    ...){
  .args <- mget(setdiff(names(formals()), "..."))
  
  # Intentional
  # season_type <- gsub(' ', '+', season_type)
  version <- "shotchartdetail"
  endpoint <- wnba_endpoint(version)
  full_url <- endpoint
  
  params <- list(
    ContextMeasure = context_measure,
    DateFrom = date_from,
    DateTo = date_to,
    GameID = game_id,
    GameSegment = game_segment,
    LastNGames = last_n_games,
    LeagueID = league_id,
    Location = location,
    Month = month,
    OpponentTeamID = opponent_team_id,
    Outcome = outcome,
    Period = period,
    PlayerID = player_id,
    PlayerPosition = player_position,
    RookieYear = rookie_year,
    Season = season,
    SeasonSegment = season_segment,
    SeasonType = season_type,
    TeamID = team_id,
    VsConference = vs_conference,
    VsDivision = vs_division
  )
  
  df_list <- list()

  tryCatch(
    expr = {
      
      resp <- request_with_proxy(url = full_url, params = params, ...)
      
      df_list <- wnba_stats_map_result_sets(resp)
      
    },
    error = function(e) .report_api_error(
      e,
      hint = "Invalid arguments or no shot chart detail data for {player_id} available!",
      args = .args
    ),
    warning = function(w) .report_api_warning(w, args = .args),
    finally = {
    }
  )
  return(df_list)
}


#' **Get WNBA Stats API Shot Chart League-Wide**
#' @name wnba_shotchartleaguewide
NULL
#' @title
#' **Get WNBA Stats API Shot Chart League-Wide**
#' @rdname wnba_shotchartleaguewide
#' @author Saiem Gilani
#' @param league_id League - default: '10'. Other options include '00': NBA, '20': G-League
#' @param season season
#' @param ... Additional arguments passed to an underlying function like httr.
#' @return Return a named list of data frames: League_Wide
#'
#'    **League_Wide**
#'
#'
#'    |col_name        |types     |description                                                           |
#'    |:---------------|:---------|:---------------------------------------------------------------------|
#'    |GRID_TYPE       |character |                                                                      |
#'    |SHOT_ZONE_BASIC |character |Shot zone (e.g. 'Restricted Area', 'Mid-Range', 'Above the Break 3'). |
#'    |SHOT_ZONE_AREA  |character |Shot zone area ('Left Side', 'Right Side', 'Center').                 |
#'    |SHOT_ZONE_RANGE |character |Shot zone range ('Less Than 8 ft.', '8-16 ft.', '16-24 ft.', etc.).   |
#'    |FGA             |character |Field goal attempts.                                                  |
#'    |FGM             |character |Field goals made.                                                     |
#'    |FG_PCT          |character |Field goal percentage (0-1).                                          |
#'
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows as_tibble
#' @import rvest
#' @export
#' @family WNBA Shooting Functions
#' @family WNBA League Functions
#' @details
#' ```r
#'  wnba_shotchartleaguewide(league_id = '10', season = most_recent_wnba_season() - 1)
#' ```
wnba_shotchartleaguewide <- function(
    league_id = '10',
    season = most_recent_wnba_season() - 1,
    ...){
  .args <- mget(setdiff(names(formals()), "..."))
  
  version <- "shotchartleaguewide"
  endpoint <- wnba_endpoint(version)
  full_url <- endpoint
  
  params <- list(
    LeagueID = league_id,
    Season = season
  )
  
  df_list <- list()

  tryCatch(
    expr = {
      
      resp <- request_with_proxy(url = full_url, params = params, ...)
      
      df_list <- wnba_stats_map_result_sets(resp)
      
    },
    error = function(e) .report_api_error(
      e,
      hint = "Invalid arguments or no league-wide shot chart data for {season} available!",
      args = .args
    ),
    warning = function(w) .report_api_warning(w, args = .args),
    finally = {
    }
  )
  return(df_list)
}

#' **Get WNBA Stats API Shot Chart for Lineups**
#' @name wnba_shotchartlineupdetail
NULL
#' @title
#' **Get WNBA Stats API Shot Chart for Lineups**
#' @rdname wnba_shotchartlineupdetail
#' @author Saiem Gilani
#' @param ahead_behind ahead_behind
#' @param cfid cfid
#' @param cfparams cfparams
#' @param clutch_time clutch_time
#' @param conference conference
#' @param context_filter context_filter
#' @param context_measure context_measure
#' @param date_from date_from
#' @param date_to date_to
#' @param division division
#' @param end_period end_period
#' @param end_range end_range
#' @param group_id group_id
#' @param game_event_id game_event_id
#' @param game_id game_id
#' @param game_segment game_segment
#' @param group_mode group_mode
#' @param group_quantity group_quantity
#' @param last_n_games last_n_games
#' @param league_id league_id
#' @param location location
#' @param month month
#' @param on_off on_off
#' @param opp_player_id opp_player_id
#' @param opponent_team_id opponent_team_id
#' @param outcome outcome
#' @param po_round po_round
#' @param period period
#' @param player_id player_id
#' @param player_id1 player_id1
#' @param player_id2 player_id2
#' @param player_id3 player_id3
#' @param player_id4 player_id4
#' @param player_id5 player_id5
#' @param player_position player_position
#' @param point_diff point_diff
#' @param position position
#' @param range_type range_type
#' @param rookie_year rookie_year
#' @param season season
#' @param season_segment season_segment
#' @param season_type season_type
#' @param shot_clock_range shot_clock_range
#' @param start_period start_period
#' @param start_range start_range
#' @param starter_bench starter_bench
#' @param team_id team_id
#' @param vs_conference vs_conference
#' @param vs_division vs_division
#' @param vs_player_id1 vs_player_id1
#' @param vs_player_id2 vs_player_id2
#' @param vs_player_id3 vs_player_id3
#' @param vs_player_id4 vs_player_id4
#' @param vs_player_id5 vs_player_id5
#' @param vs_team_id vs_team_id
#' @param ... Additional arguments passed to an underlying function like httr.
#' @return Return a named list of data frames: ShotChartLineupDetail, ShotChartLineupLeagueAverage
#'
#'    **ShotChartLineupDetail**
#'
#'
#'    |col_name            |types     |description                                                           |
#'    |:-------------------|:---------|:---------------------------------------------------------------------|
#'    |GRID_TYPE           |character |                                                                      |
#'    |GAME_ID             |character |Unique game identifier.                                               |
#'    |GAME_EVENT_ID       |character |Unique identifier for game event.                                     |
#'    |GROUP_ID            |character |Group identifier (e.g. conference group_id).                          |
#'    |GROUP_NAME          |character |Group name.                                                           |
#'    |PLAYER_ID           |character |Unique player identifier.                                             |
#'    |PLAYER_NAME         |character |Player name.                                                          |
#'    |TEAM_ID             |character |Unique team identifier.                                               |
#'    |TEAM_NAME           |character |Full team display name (e.g. 'Las Vegas Aces').                       |
#'    |PERIOD              |character |Period of the game (1-4 quarters; 5+ for OT).                         |
#'    |MINUTES_REMAINING   |character |Minutes remaining.                                                    |
#'    |SECONDS_REMAINING   |character |Seconds remaining in the period.                                      |
#'    |EVENT_TYPE          |character |Event / play type code (V2 PBP).                                      |
#'    |ACTION_TYPE         |character |Action type label (e.g. 'Made Shot', 'Substitution').                 |
#'    |SHOT_TYPE           |character |Shot type label (e.g. 'Jump Shot', 'Layup').                          |
#'    |SHOT_ZONE_BASIC     |character |Shot zone (e.g. 'Restricted Area', 'Mid-Range', 'Above the Break 3'). |
#'    |SHOT_ZONE_AREA      |character |Shot zone area ('Left Side', 'Right Side', 'Center').                 |
#'    |SHOT_ZONE_RANGE     |character |Shot zone range ('Less Than 8 ft.', '8-16 ft.', '16-24 ft.', etc.).   |
#'    |SHOT_DISTANCE       |character |Shot distance from the basket, in feet.                               |
#'    |LOC_X               |character |X coordinate on the court (units of inches; 0 = basket center).       |
#'    |LOC_Y               |character |Y coordinate on the court (units of inches; baseline at 0).           |
#'    |SHOT_ATTEMPTED_FLAG |character |1 if a shot was attempted on this event.                              |
#'    |SHOT_MADE_FLAG      |character |1 if the shot was made; 0 if missed.                                  |
#'    |GAME_DATE           |character |Game date (YYYY-MM-DD).                                               |
#'    |HTM                 |character |                                                                      |
#'    |VTM                 |character |                                                                      |
#'
#'    **ShotChartLineupLeagueAverage**
#'
#'
#'    |col_name        |types     |description                                                           |
#'    |:---------------|:---------|:---------------------------------------------------------------------|
#'    |GRID_TYPE       |character |                                                                      |
#'    |SHOT_ZONE_BASIC |character |Shot zone (e.g. 'Restricted Area', 'Mid-Range', 'Above the Break 3'). |
#'    |SHOT_ZONE_AREA  |character |Shot zone area ('Left Side', 'Right Side', 'Center').                 |
#'    |SHOT_ZONE_RANGE |character |Shot zone range ('Less Than 8 ft.', '8-16 ft.', '16-24 ft.', etc.).   |
#'    |FGA             |character |Field goal attempts.                                                  |
#'    |FGM             |character |Field goals made.                                                     |
#'    |FG_PCT          |character |Field goal percentage (0-1).                                          |
#'
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows as_tibble
#' @import rvest
#' @export
#' @family WNBA Shooting Functions
#' @family WNBA Lineup Functions
#' @details
#' ```r
#'  wnba_shotchartlineupdetail(group_id = '-1628899-1629481-1630096-1631019-1642784-', opponent_team_id = '1611661324', season = most_recent_wnba_season())
#' ```
wnba_shotchartlineupdetail <- function(
    ahead_behind = '',
    cfid = '',
    cfparams = '',
    clutch_time = '',
    conference = '',
    context_filter = '',
    context_measure = 'FGA',
    date_from = '',
    date_to = '',
    division = '',
    end_period = '10',
    end_range = '28800',
    group_id = '-1628899-1629481-1630096-1631019-1642784-',
    game_event_id = '',
    game_id = '',
    game_segment = '',
    group_mode = '',
    group_quantity = '5',
    last_n_games = '0',
    league_id = '10',
    location = '',
    month = '0',
    on_off = '',
    opp_player_id = '',
    opponent_team_id = '0',
    outcome = '',
    po_round = '0',
    period = '0',
    player_id = '0',
    player_id1 = '',
    player_id2 = '',
    player_id3 = '',
    player_id4 = '',
    player_id5 = '',
    player_position = '',
    point_diff = '',
    position = '',
    range_type = '0',
    rookie_year = '',
    season = most_recent_wnba_season(),
    season_segment = '',
    season_type = 'Regular Season',
    shot_clock_range = '',
    start_period = '1',
    start_range = '0',
    starter_bench = '',
    team_id = '1611661321',
    vs_conference = '',
    vs_division = '',
    vs_player_id1 = '',
    vs_player_id2 = '',
    vs_player_id3 = '',
    vs_player_id4 = '',
    vs_player_id5 = '',
    vs_team_id = '',
    ...){
  .args <- mget(setdiff(names(formals()), "..."))
  
  # Intentional
  # season_type <- gsub(' ', '+', season_type)
  version <- "shotchartlineupdetail"
  endpoint <- wnba_endpoint(version)
  full_url <- endpoint
  group_id2 <- group_id
  params <- list(
    AheadBehind = ahead_behind,
    CFID = cfid,
    CFPARAMS = cfparams,
    ClutchTime = clutch_time,
    Conference = conference,
    ContextFilter = context_filter,
    ContextMeasure = context_measure,
    DateFrom = date_from,
    DateTo = date_to,
    Division = division,
    EndPeriod = end_period,
    EndRange = end_range,
    GROUP_ID = group_id,
    GameEventID = game_event_id,
    GameID = game_id,
    GameSegment = game_segment,
    GroupID = group_id2,
    GroupMode = group_mode,
    GroupQuantity = group_quantity,
    LastNGames = last_n_games,
    LeagueID = league_id,
    Location = location,
    Month = month,
    OnOff = on_off,
    OppPlayerID = opp_player_id,
    OpponentTeamID = opponent_team_id,
    Outcome = outcome,
    PORound = po_round,
    Period = period,
    PlayerID = player_id,
    PlayerID1 = player_id1,
    PlayerID2 = player_id2,
    PlayerID3 = player_id3,
    PlayerID4 = player_id4,
    PlayerID5 = player_id5,
    PlayerPosition = player_position,
    PointDiff = point_diff,
    Position = position,
    RangeType = range_type,
    RookieYear = rookie_year,
    Season = season,
    SeasonSegment = season_segment,
    SeasonType = season_type,
    ShotClockRange = shot_clock_range,
    StartPeriod = start_period,
    StartRange = start_range,
    StarterBench = starter_bench,
    TeamID = team_id,
    VsConference = vs_conference,
    VsDivision = vs_division,
    VsPlayerID1 = vs_player_id1,
    VsPlayerID2 = vs_player_id2,
    VsPlayerID3 = vs_player_id3,
    VsPlayerID4 = vs_player_id4,
    VsPlayerID5 = vs_player_id5,
    VsTeamID = vs_team_id
  )
  
  df_list <- list()

  tryCatch(
    expr = {
      
      resp <- request_with_proxy(url = full_url, params = params, ...)
      
      df_list <- wnba_stats_map_result_sets(resp)
      
    },
    error = function(e) .report_api_error(
      e,
      hint = "Invalid arguments or no shot chart lineup data available for {season}! (group_id: {group_id})",
      args = .args
    ),
    warning = function(w) .report_api_warning(w, args = .args),
    finally = {
    }
  )
  return(df_list)
}
