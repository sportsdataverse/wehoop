

#' **Get WNBA Stats API League Dashboard Player Biographical Stats**
#' @name wnba_leaguedashplayerbiostats
NULL
#' @title
#' **Get WNBA Stats API League Dashboard Player Biographical Stats**
#' @rdname wnba_leaguedashplayerbiostats
#' @author Saiem Gilani
#' @param college college
#' @param conference conference
#' @param country country
#' @param date_from date_from
#' @param date_to date_to
#' @param division division
#' @param draft_pick draft_pick
#' @param draft_year draft_year
#' @param game_segment game_segment
#' @param game_scope game_scope
#' @param height height
#' @param last_n_games last_n_games
#' @param league_id league_id
#' @param location location
#' @param month month
#' @param opponent_team_id opponent_team_id
#' @param outcome outcome
#' @param po_round po_round
#' @param per_mode per_mode
#' @param period period
#' @param player_experience player_experience
#' @param player_position player_position
#' @param season season
#' @param season_segment season_segment
#' @param season_type season_type
#' @param shot_clock_range shot_clock_range
#' @param starter_bench starter_bench
#' @param team_id team_id
#' @param touch_time_range touch_time_range
#' @param vs_conference vs_conference
#' @param vs_division vs_division
#' @param weight weight
#' @param ... Additional arguments passed to an underlying function like httr.
#' @return Returns a named list of data frames: LeagueDashPlayerBioStats
#'
#'    **LeagueDashPlayerBioStats**
#'
#'
#'    \if{html}{\tabular{lll}{
#'       col_name \tab types \tab description \cr
#'       PLAYER_ID \tab character \tab Unique player identifier. \cr
#'       PLAYER_NAME \tab character \tab Player name. \cr
#'       TEAM_ID \tab character \tab Unique team identifier. \cr
#'       TEAM_ABBREVIATION \tab character \tab Short team abbreviation (e.g. 'LAS'). \cr
#'       AGE \tab character \tab Player age (in years). \cr
#'       PLAYER_HEIGHT \tab character \tab  \cr
#'       PLAYER_HEIGHT_INCHES \tab character \tab  \cr
#'       PLAYER_WEIGHT \tab character \tab  \cr
#'       COLLEGE \tab character \tab College or school attended. \cr
#'       COUNTRY \tab character \tab Country (full name or code). \cr
#'       DRAFT_YEAR \tab character \tab Draft year (4-digit). \cr
#'       DRAFT_ROUND \tab character \tab Round of the draft selection. \cr
#'       DRAFT_NUMBER \tab character \tab  \cr
#'       GP \tab character \tab Games played. \cr
#'       PTS \tab character \tab Points scored. \cr
#'       REB \tab character \tab Total rebounds. \cr
#'       AST \tab character \tab Assists. \cr
#'       NET_RATING \tab character \tab Net rating (off rating - def rating). \cr
#'       OREB_PCT \tab character \tab Offensive rebound percentage (0-1). \cr
#'       DREB_PCT \tab character \tab Defensive rebound percentage (0-1). \cr
#'       USG_PCT \tab character \tab Usage percentage (0-1). \cr
#'       TS_PCT \tab character \tab True shooting percentage (0-1). \cr
#'       AST_PCT \tab character \tab Assist percentage (0-1). \cr
#'    }}
#'    \if{latex}{See the HTML help or pkgdown reference for the column table.}
#' 
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows as_tibble
#' @import rvest
#' @export
#' @family WNBA League Functions
#' @family WNBA Player Functions
#' @details
#' ```r
#'   wnba_leaguedashplayerbiostats(league_id = '10', season = most_recent_wnba_season() - 1)
#' ```
wnba_leaguedashplayerbiostats <- function(
    college = '',
    conference = '',
    country = '',
    date_from = '',
    date_to = '',
    division = '',
    draft_pick = '',
    draft_year = '',
    game_segment = '',
    game_scope = '',
    height = '',
    last_n_games = 0,
    league_id = '10',
    location = '',
    month = 0,
    opponent_team_id = 0,
    outcome = '',
    po_round = '',
    per_mode = 'Totals',
    period = '',
    player_experience = '',
    player_position = '',
    season = most_recent_wnba_season() - 1,
    season_segment = '',
    season_type = 'Regular Season',
    shot_clock_range = '',
    starter_bench = '',
    team_id = '',
    touch_time_range = '',
    vs_conference = '',
    vs_division = '',
    weight = '',
    ...){
  .args <- mget(setdiff(names(formals()), "..."))
  
  # Intentional
  # season_type <- gsub(' ', '+', season_type)
  version <- "leaguedashplayerbiostats"
  endpoint <- wnba_endpoint(version)
  full_url <- endpoint
  
  params <- list(
    College = college,
    Conference = conference,
    Country = country,
    DateFrom = date_from,
    DateTo = date_to,
    Division = division,
    DraftPick = draft_pick,
    DraftYear = draft_year,
    GameScope = game_scope,
    GameSegment = game_segment,
    Height = height,
    LastNGames = last_n_games,
    LeagueID = league_id,
    Location = location,
    Month = month,
    OpponentTeamID = opponent_team_id,
    Outcome = outcome,
    PORound = po_round,
    PerMode = per_mode,
    Period = period,
    PlayerExperience = player_experience,
    PlayerPosition = player_position,
    Season = season,
    SeasonSegment = season_segment,
    SeasonType = season_type,
    ShotClockRange = shot_clock_range,
    StarterBench = starter_bench,
    TeamID = team_id,
    TouchTimeRange = touch_time_range,
    VsConference = vs_conference,
    VsDivision = vs_division,
    Weight = weight
  )
  
  df_list <- list()

  tryCatch(
    expr = {
      
      resp <- request_with_proxy(url = full_url, params = params, ...)
      
      df_list <- wnba_stats_map_result_sets(resp)
      
    },
    error = function(e) .report_api_error(
      e,
      hint = "Invalid arguments or no league dashboard player bio stats data for {season} available!",
      args = .args
    ),
    warning = function(w) .report_api_warning(w, args = .args),
    finally = {
    }
  )
  return(df_list)
}

#' **Get WNBA Stats API League Dashboard by Player Clutch Splits**
#' @name wnba_leaguedashplayerclutch
NULL
#' @title
#' **Get WNBA Stats API League Dashboard by Player Clutch Splits**
#' @rdname wnba_leaguedashplayerclutch
#' @author Saiem Gilani
#' @param ahead_behind ahead_behind
#' @param clutch_time clutch_time
#' @param college college
#' @param conference conference
#' @param country country
#' @param date_from date_from
#' @param date_to date_to
#' @param division division
#' @param draft_pick draft_pick
#' @param draft_year draft_year
#' @param game_scope game_scope
#' @param game_segment game_segment
#' @param height height
#' @param last_n_games last_n_games
#' @param league_id league_id
#' @param location location
#' @param measure_type measure_type
#' @param month month
#' @param opponent_team_id opponent_team_id
#' @param outcome outcome
#' @param pace_adjust pace_adjust
#' @param plus_minus plus_minus
#' @param point_diff point_diff
#' @param po_round po_round
#' @param per_mode per_mode
#' @param period period
#' @param player_experience player_experience
#' @param player_position player_position
#' @param rank rank
#' @param season season
#' @param season_segment season_segment
#' @param season_type season_type
#' @param shot_clock_range shot_clock_range
#' @param starter_bench starter_bench
#' @param team_id team_id
#' @param touch_time_range touch_time_range
#' @param vs_conference vs_conference
#' @param vs_division vs_division
#' @param weight weight
#' @param ... Additional arguments passed to an underlying function like httr.
#' @return Returns a named list of data frames: LeagueDashPlayerClutch
#'
#'    **LeagueDashPlayerClutch**
#'
#'
#'    \if{html}{\tabular{lll}{
#'       col_name \tab types \tab description \cr
#'       GROUP_SET \tab character \tab  \cr
#'       PLAYER_ID \tab character \tab Unique player identifier. \cr
#'       PLAYER_NAME \tab character \tab Player name. \cr
#'       NICKNAME \tab character \tab Team or athlete nickname. \cr
#'       TEAM_ID \tab character \tab Unique team identifier. \cr
#'       TEAM_ABBREVIATION \tab character \tab Short team abbreviation (e.g. 'LAS'). \cr
#'       AGE \tab character \tab Player age (in years). \cr
#'       GP \tab character \tab Games played. \cr
#'       W \tab character \tab Wins. \cr
#'       L \tab character \tab Losses. \cr
#'       W_PCT \tab character \tab Wins percentage (0-1 decimal). \cr
#'       MIN \tab character \tab Minutes played. \cr
#'       FGM \tab character \tab Field goals made. \cr
#'       FGA \tab character \tab Field goal attempts. \cr
#'       FG_PCT \tab character \tab Field goal percentage (0-1). \cr
#'       FG3M \tab character \tab Three-point field goals made. \cr
#'       FG3A \tab character \tab Three-point field goal attempts. \cr
#'       FG3_PCT \tab character \tab Three-point field goal percentage (0-1). \cr
#'       FTM \tab character \tab Free throws made. \cr
#'       FTA \tab character \tab Free throw attempts. \cr
#'       FT_PCT \tab character \tab Free throw percentage (0-1). \cr
#'       OREB \tab character \tab Offensive rebounds. \cr
#'       DREB \tab character \tab Defensive rebounds. \cr
#'       REB \tab character \tab Total rebounds. \cr
#'       AST \tab character \tab Assists. \cr
#'       TOV \tab character \tab Turnovers. \cr
#'       STL \tab character \tab Steals. \cr
#'       BLK \tab character \tab Blocks. \cr
#'       BLKA \tab character \tab  \cr
#'       PF \tab character \tab Personal fouls. \cr
#'       PFD \tab character \tab  \cr
#'       PTS \tab character \tab Points scored. \cr
#'       PLUS_MINUS \tab character \tab Plus/minus point differential while on court. \cr
#'       NBA_FANTASY_PTS \tab character \tab  \cr
#'       DD2 \tab character \tab  \cr
#'       TD3 \tab character \tab  \cr
#'       WNBA_FANTASY_PTS \tab character \tab  \cr
#'       GP_RANK \tab character \tab  \cr
#'       W_RANK \tab character \tab  \cr
#'       L_RANK \tab character \tab  \cr
#'       W_PCT_RANK \tab character \tab  \cr
#'       MIN_RANK \tab character \tab  \cr
#'       FGM_RANK \tab character \tab  \cr
#'       FGA_RANK \tab character \tab  \cr
#'       FG_PCT_RANK \tab character \tab  \cr
#'       FG3M_RANK \tab character \tab  \cr
#'       FG3A_RANK \tab character \tab  \cr
#'       FG3_PCT_RANK \tab character \tab  \cr
#'       FTM_RANK \tab character \tab  \cr
#'       FTA_RANK \tab character \tab  \cr
#'       FT_PCT_RANK \tab character \tab  \cr
#'       OREB_RANK \tab character \tab  \cr
#'       DREB_RANK \tab character \tab  \cr
#'       REB_RANK \tab character \tab  \cr
#'       AST_RANK \tab character \tab  \cr
#'       TOV_RANK \tab character \tab  \cr
#'       STL_RANK \tab character \tab  \cr
#'       BLK_RANK \tab character \tab  \cr
#'       BLKA_RANK \tab character \tab  \cr
#'       PF_RANK \tab character \tab  \cr
#'       PFD_RANK \tab character \tab  \cr
#'       PTS_RANK \tab character \tab  \cr
#'       PLUS_MINUS_RANK \tab character \tab  \cr
#'       NBA_FANTASY_PTS_RANK \tab character \tab  \cr
#'       DD2_RANK \tab character \tab  \cr
#'       TD3_RANK \tab character \tab  \cr
#'       WNBA_FANTASY_PTS_RANK \tab character \tab  \cr
#'    }}
#'    \if{latex}{See the HTML help or pkgdown reference for the column table.}
#'    
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows as_tibble
#' @import rvest
#' @export
#' @family WNBA League Functions
#' @family WNBA Player Functions
#' @details
#' ```r
#'  wnba_leaguedashplayerclutch(league_id = '10', season = most_recent_wnba_season() - 1)
#' ```
wnba_leaguedashplayerclutch <- function(
    ahead_behind = 'Ahead or Behind',
    clutch_time = 'Last 5 Minutes',
    college = '',
    conference = '',
    country = '',
    date_from = '',
    date_to = '',
    division = '',
    draft_pick = '',
    draft_year = '',
    game_scope = '',
    game_segment = '',
    height = '',
    last_n_games = 0,
    league_id = '10',
    location = '',
    measure_type = 'Base',
    month = 0,
    opponent_team_id = 0,
    outcome = '',
    pace_adjust = 'N',
    plus_minus = 'N',
    point_diff = 5,
    po_round = '',
    per_mode = 'Totals',
    period = 0,
    player_experience = '',
    player_position = '',
    rank = 'N',
    season = most_recent_wnba_season() - 1,
    season_segment = '',
    season_type = 'Regular Season',
    shot_clock_range = '',
    starter_bench = '',
    team_id = '',
    touch_time_range = '',
    vs_conference = '',
    vs_division = '',
    weight = '',
    ...){
  .args <- mget(setdiff(names(formals()), "..."))
  
  # ahead_behind <- gsub(' ', '+', ahead_behind)
  # clutch_time <- gsub(' ', '+', clutch_time)
  # Intentional
  # season_type <- gsub(' ', '+', season_type)
  version <- "leaguedashplayerclutch"
  endpoint <- wnba_endpoint(version)
  full_url <- endpoint
  
  params <- list(
    AheadBehind = ahead_behind,
    ClutchTime = clutch_time,
    College = college,
    Conference = conference,
    Country = country,
    DateFrom = date_from,
    DateTo = date_to,
    Division = division,
    DraftPick = draft_pick,
    DraftYear = draft_year,
    GameScope = game_scope,
    GameSegment = game_segment,
    Height = height,
    LastNGames = last_n_games,
    LeagueID = league_id,
    Location = location,
    MeasureType = measure_type,
    Month = month,
    OpponentTeamID = opponent_team_id,
    Outcome = outcome,
    PaceAdjust = pace_adjust,
    PORound = po_round,
    PerMode = per_mode,
    Period = period,
    PlayerExperience = player_experience,
    PlayerPosition = player_position,
    PlusMinus = plus_minus,
    PointDiff = point_diff,
    Rank = rank,
    Season = season,
    SeasonSegment = season_segment,
    SeasonType = season_type,
    ShotClockRange = shot_clock_range,
    StarterBench = starter_bench,
    TeamID = team_id,
    TouchTimeRange = touch_time_range,
    VsConference = vs_conference,
    VsDivision = vs_division,
    Weight = weight
  )
  
  df_list <- list()

  tryCatch(
    expr = {
      
      resp <- request_with_proxy(url = full_url, params = params, ...)
      
      df_list <- wnba_stats_map_result_sets(resp)
      
    },
    error = function(e) .report_api_error(
      e,
      hint = "Invalid arguments or no league dashboard player clutch stats data for {season} available!",
      args = .args
    ),
    warning = function(w) .report_api_warning(w, args = .args),
    finally = {
    }
  )
  return(df_list)
}


#' **Get WNBA Stats API League Dashboard Player Stats**
#' @name wnba_leaguedashplayerstats
NULL
#' @title
#' **Get WNBA Stats API League Dashboard Player Stats**
#' @rdname wnba_leaguedashplayerstats
#' @author Saiem Gilani
#' @param college college
#' @param conference conference
#' @param country country
#' @param date_from date_from
#' @param date_to date_to
#' @param division division
#' @param draft_pick draft_pick
#' @param draft_year draft_year
#' @param game_scope game_scope
#' @param game_segment game_segment
#' @param height height
#' @param last_n_games last_n_games
#' @param league_id league_id
#' @param location location
#' @param measure_type measure_type
#' @param month month
#' @param opponent_team_id opponent_team_id
#' @param outcome outcome
#' @param pace_adjust pace_adjust
#' @param po_round po_round
#' @param per_mode per_mode
#' @param period period
#' @param player_experience player_experience
#' @param player_position player_position
#' @param plus_minus plus_minus
#' @param rank rank
#' @param season season
#' @param season_segment season_segment
#' @param season_type season_type
#' @param shot_clock_range shot_clock_range
#' @param starter_bench starter_bench
#' @param team_id team_id
#' @param two_way two_way
#' @param vs_conference vs_conference
#' @param vs_division vs_division
#' @param weight weight
#' @param ... Additional arguments passed to an underlying function like httr.
#' @return Returns a named list of data frames: LeagueDashPlayerStats
#'
#'    **LeagueDashPlayerStats**
#'
#'
#'    \if{html}{\tabular{lll}{
#'       col_name \tab types \tab description \cr
#'       PLAYER_ID \tab character \tab Unique player identifier. \cr
#'       PLAYER_NAME \tab character \tab Player name. \cr
#'       NICKNAME \tab character \tab Team or athlete nickname. \cr
#'       TEAM_ID \tab character \tab Unique team identifier. \cr
#'       TEAM_ABBREVIATION \tab character \tab Short team abbreviation (e.g. 'LAS'). \cr
#'       AGE \tab character \tab Player age (in years). \cr
#'       GP \tab character \tab Games played. \cr
#'       W \tab character \tab Wins. \cr
#'       L \tab character \tab Losses. \cr
#'       W_PCT \tab character \tab Wins percentage (0-1 decimal). \cr
#'       MIN \tab character \tab Minutes played. \cr
#'       FGM \tab character \tab Field goals made. \cr
#'       FGA \tab character \tab Field goal attempts. \cr
#'       FG_PCT \tab character \tab Field goal percentage (0-1). \cr
#'       FG3M \tab character \tab Three-point field goals made. \cr
#'       FG3A \tab character \tab Three-point field goal attempts. \cr
#'       FG3_PCT \tab character \tab Three-point field goal percentage (0-1). \cr
#'       FTM \tab character \tab Free throws made. \cr
#'       FTA \tab character \tab Free throw attempts. \cr
#'       FT_PCT \tab character \tab Free throw percentage (0-1). \cr
#'       OREB \tab character \tab Offensive rebounds. \cr
#'       DREB \tab character \tab Defensive rebounds. \cr
#'       REB \tab character \tab Total rebounds. \cr
#'       AST \tab character \tab Assists. \cr
#'       TOV \tab character \tab Turnovers. \cr
#'       STL \tab character \tab Steals. \cr
#'       BLK \tab character \tab Blocks. \cr
#'       BLKA \tab character \tab  \cr
#'       PF \tab character \tab Personal fouls. \cr
#'       PFD \tab character \tab  \cr
#'       PTS \tab character \tab Points scored. \cr
#'       PLUS_MINUS \tab character \tab Plus/minus point differential while on court. \cr
#'       NBA_FANTASY_PTS \tab character \tab  \cr
#'       DD2 \tab character \tab  \cr
#'       TD3 \tab character \tab  \cr
#'       WNBA_FANTASY_PTS \tab character \tab  \cr
#'       GP_RANK \tab character \tab  \cr
#'       W_RANK \tab character \tab  \cr
#'       L_RANK \tab character \tab  \cr
#'       W_PCT_RANK \tab character \tab  \cr
#'       MIN_RANK \tab character \tab  \cr
#'       FGM_RANK \tab character \tab  \cr
#'       FGA_RANK \tab character \tab  \cr
#'       FG_PCT_RANK \tab character \tab  \cr
#'       FG3M_RANK \tab character \tab  \cr
#'       FG3A_RANK \tab character \tab  \cr
#'       FG3_PCT_RANK \tab character \tab  \cr
#'       FTM_RANK \tab character \tab  \cr
#'       FTA_RANK \tab character \tab  \cr
#'       FT_PCT_RANK \tab character \tab  \cr
#'       OREB_RANK \tab character \tab  \cr
#'       DREB_RANK \tab character \tab  \cr
#'       REB_RANK \tab character \tab  \cr
#'       AST_RANK \tab character \tab  \cr
#'       TOV_RANK \tab character \tab  \cr
#'       STL_RANK \tab character \tab  \cr
#'       BLK_RANK \tab character \tab  \cr
#'       BLKA_RANK \tab character \tab  \cr
#'       PF_RANK \tab character \tab  \cr
#'       PFD_RANK \tab character \tab  \cr
#'       PTS_RANK \tab character \tab  \cr
#'       PLUS_MINUS_RANK \tab character \tab  \cr
#'       NBA_FANTASY_PTS_RANK \tab character \tab  \cr
#'       DD2_RANK \tab character \tab  \cr
#'       TD3_RANK \tab character \tab  \cr
#'       WNBA_FANTASY_PTS_RANK \tab character \tab  \cr
#'    }}
#'    \if{latex}{See the HTML help or pkgdown reference for the column table.}
#'
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows as_tibble
#' @import rvest
#' @export
#' @family WNBA League Functions
#' @family WNBA Player Functions
#' @details
#' ```r
#'  wnba_leaguedashplayerstats(league_id = '10', season = most_recent_wnba_season() - 1)
#' ```
wnba_leaguedashplayerstats <- function(
    college = '',
    conference = '',
    country = '',
    date_from = '',
    date_to = '',
    division = '',
    draft_pick = '',
    draft_year = '',
    game_scope = '',
    game_segment = '',
    height = '',
    last_n_games = 0,
    league_id = '10',
    location = '',
    measure_type = 'Base',
    month = 0,
    opponent_team_id = 0,
    outcome = '',
    pace_adjust = 'N',
    po_round = '',
    per_mode = 'Totals',
    period = 0,
    player_experience = '',
    player_position = '',
    plus_minus = 'N',
    rank = 'N',
    season = most_recent_wnba_season() - 1,
    season_segment = '',
    season_type = 'Regular Season',
    shot_clock_range = '',
    starter_bench = '',
    team_id = '',
    two_way = '',
    vs_conference = '',
    vs_division = '',
    weight = '',
    ...){
  .args <- mget(setdiff(names(formals()), "..."))
  
  # Intentional
  # season_type <- gsub(' ', '+', season_type)
  version <- "leaguedashplayerstats"
  endpoint <- wnba_endpoint(version)
  full_url <- endpoint
  
  params <- list(
    College = college,
    Conference = conference,
    Country = country,
    DateFrom = date_from,
    DateTo = date_to,
    Division = division,
    DraftPick = draft_pick,
    DraftYear = draft_year,
    GameScope = game_scope,
    GameSegment = game_segment,
    Height = height,
    LastNGames = last_n_games,
    LeagueID = league_id,
    Location = location,
    MeasureType = measure_type,
    Month = month,
    OpponentTeamID = opponent_team_id,
    Outcome = outcome,
    PORound = po_round,
    PaceAdjust = pace_adjust,
    PerMode = per_mode,
    Period = period,
    PlayerExperience = player_experience,
    PlayerPosition = player_position,
    PlusMinus = plus_minus,
    Rank = rank,
    Season = season,
    SeasonSegment = season_segment,
    SeasonType = season_type,
    ShotClockRange = shot_clock_range,
    StarterBench = starter_bench,
    TeamID = team_id,
    TwoWay = two_way,
    VsConference = vs_conference,
    VsDivision = vs_division,
    Weight = weight
  )
  
  df_list <- list()

  tryCatch(
    expr = {
      
      resp <- request_with_proxy(url = full_url, params = params, ...)
      
      df_list <- wnba_stats_map_result_sets(resp)
      
    },
    error = function(e) .report_api_error(
      e,
      hint = "Invalid arguments or no league dashboard player stats data for {season} available!",
      args = .args
    ),
    warning = function(w) .report_api_warning(w, args = .args),
    finally = {
    }
  )
  return(df_list)
}


#' **Get WNBA Stats API League Dashboard Player Shot Locations**
#' @name wnba_leaguedashplayershotlocations
NULL
#' @title
#' **Get WNBA Stats API League Dashboard Player Shot Locations**
#' @rdname wnba_leaguedashplayershotlocations
#' @author Saiem Gilani
#' @param college college
#' @param conference conference
#' @param country country
#' @param date_from date_from
#' @param date_to date_to
#' @param distance_range distance_range
#' @param division division
#' @param draft_pick draft_pick
#' @param draft_year draft_year
#' @param dribble_range dribble_range
#' @param game_scope game_scope
#' @param game_segment game_segment
#' @param height height
#' @param last_n_games last_n_games
#' @param league_id league_id
#' @param location location
#' @param measure_type measure_type
#' @param month month
#' @param opponent_team_id opponent_team_id
#' @param outcome outcome
#' @param po_round po_round
#' @param pace_adjust pace_adjust
#' @param per_mode per_mode
#' @param period period
#' @param player_experience player_experience
#' @param player_position player_position
#' @param plus_minus plus_minus
#' @param rank rank
#' @param season season
#' @param season_segment season_segment
#' @param season_type season_type
#' @param shot_clock_range shot_clock_range
#' @param starter_bench starter_bench
#' @param team_id team_id
#' @param vs_conference vs_conference
#' @param vs_division vs_division
#' @param weight weight
#' @param ... Additional arguments passed to an underlying function like httr.
#' @return Returns a named list of data frames: ShotLocations
#'
#'    **ShotLocations**
#'
#'
#'    \if{html}{\tabular{lll}{
#'       col_name \tab types \tab description \cr
#'       PLAYER_ID \tab character \tab Unique player identifier. \cr
#'       PLAYER_NAME \tab character \tab Player name. \cr
#'       TEAM_ID \tab character \tab Unique team identifier. \cr
#'       TEAM_ABBREVIATION \tab character \tab Short team abbreviation (e.g. 'LAS'). \cr
#'       AGE \tab character \tab Player age (in years). \cr
#'       NICKNAME \tab character \tab Team or athlete nickname. \cr
#'       Restricted_Area_FGM \tab character \tab  \cr
#'       Restricted_Area_FGA \tab character \tab  \cr
#'       Restricted_Area_FG_PCT \tab character \tab  \cr
#'       In_The_Paint_Non_RA_FGM \tab character \tab  \cr
#'       In_The_Paint_Non_RA_FGA \tab character \tab  \cr
#'       In_The_Paint_Non_RA_FG_PCT \tab character \tab  \cr
#'       Mid_Range_FGM \tab character \tab  \cr
#'       Mid_Range_FGA \tab character \tab  \cr
#'       Mid_Range_FG_PCT \tab character \tab  \cr
#'       Left_Corner_3_FGM \tab character \tab  \cr
#'       Left_Corner_3_FGA \tab character \tab  \cr
#'       Left_Corner_3_FG_PCT \tab character \tab  \cr
#'       Right_Corner_3_FGM \tab character \tab  \cr
#'       Right_Corner_3_FGA \tab character \tab  \cr
#'       Right_Corner_3_FG_PCT \tab character \tab  \cr
#'       Above_the_Break_3_FGM \tab character \tab  \cr
#'       Above_the_Break_3_FGA \tab character \tab  \cr
#'       Above_the_Break_3_FG_PCT \tab character \tab  \cr
#'       Backcourt_FGM \tab character \tab  \cr
#'       Backcourt_FGA \tab character \tab  \cr
#'       Backcourt_FG_PCT \tab character \tab  \cr
#'       Corner_3_FGM \tab character \tab  \cr
#'       Corner_3_FGA \tab character \tab  \cr
#'       Corner_3_FG_PCT \tab character \tab  \cr
#'    }}
#'    \if{latex}{See the HTML help or pkgdown reference for the column table.}
#'
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows as_tibble
#' @import rvest
#' @export
#' @family WNBA League Functions
#' @family WNBA Player Functions
#' @family WNBA Shooting Functions
#' @details
#' ```r
#'   wnba_leaguedashplayershotlocations(league_id = '10', season = most_recent_wnba_season() - 1)
#' ```
wnba_leaguedashplayershotlocations <- function(
    college = '',
    conference = '',
    country = '',
    date_from = '',
    date_to = '',
    distance_range = 'By Zone',
    division = '',
    draft_pick = '',
    draft_year = '',
    dribble_range = '',
    game_scope = '',
    game_segment = '',
    height = '',
    last_n_games = 0,
    league_id = '10',
    location = '',
    measure_type = 'Base',
    month = 0,
    opponent_team_id = 0,
    outcome = '',
    po_round = '',
    pace_adjust = 'N',
    per_mode = 'Totals',
    period = 0,
    player_experience = '',
    player_position = '',
    plus_minus = 'N',
    rank = 'N',
    season = most_recent_wnba_season() - 1,
    season_segment = '',
    season_type = 'Regular Season',
    shot_clock_range = '',
    starter_bench = '',
    team_id = '',
    vs_conference = '',
    vs_division = '',
    weight = '',
    ...){
  .args <- mget(setdiff(names(formals()), "..."))
  
  # distance_range <- gsub(' ', '+', distance_range)
  # Intentional
  # season_type <- gsub(' ', '+', season_type)
  version <- "leaguedashplayershotlocations"
  endpoint <- wnba_endpoint(version)
  full_url <- endpoint
  
  params <- list(
    College = college,
    Conference = conference,
    Country = country,
    DateFrom = date_from,
    DateTo = date_to,
    Division = division,
    DistanceRange = distance_range,
    DraftPick = draft_pick,
    DraftYear = draft_year,
    DribbleRange = dribble_range,
    GameScope = game_scope,
    GameSegment = game_segment,
    Height = height,
    LastNGames = last_n_games,
    LeagueID = league_id,
    Location = location,
    MeasureType = measure_type,
    Month = month,
    OpponentTeamID = opponent_team_id,
    Outcome = outcome,
    PORound = po_round,
    PaceAdjust = pace_adjust,
    PerMode = per_mode,
    Period = period,
    PlayerExperience = player_experience,
    PlayerPosition = player_position,
    PlusMinus = plus_minus,
    Rank = rank,
    Season = season,
    SeasonSegment = season_segment,
    SeasonType = season_type,
    ShotClockRange = shot_clock_range,
    StarterBench = starter_bench,
    TeamID = team_id,
    VsConference = vs_conference,
    VsDivision = vs_division,
    Weight = weight
  )
  
  df_list <- list()

  tryCatch(
    expr = {
      
      resp <- request_with_proxy(url = full_url, params = params, ...)
      
      df_list <- purrr::map(1:length(resp$resultSets$name), function(x){
        data <- resp$resultSets$rowSet %>%
          data.frame(stringsAsFactors = F) %>%
          dplyr::as_tibble()
        columnsToSkip <- resp$resultSets$headers$columnsToSkip[[1]]
        columnSpan <- resp$resultSets$headers$columnSpan[[1]]
        json_names1 <- resp$resultSets$headers$columnNames[[1]]
        json_names_rep <- rep(json_names1, times = 1, each = columnSpan)
        json_names2 <- resp$resultSets$headers$columnNames[[2]]
        json_names <- c(json_names2[1:columnsToSkip], paste(json_names_rep, json_names2[(columnsToSkip + 1):30]))
        colnames(data) <- gsub('\\(|\\)|','', gsub(' |-','_',json_names))
        return(data)
      })
      names(df_list) <- resp$resultSets$name
    },
    error = function(e) .report_api_error(
      e,
      hint = "Invalid arguments or no league dashboard player shot locations data for {season} available!",
      args = .args
    ),
    warning = function(w) .report_api_warning(w, args = .args),
    finally = {
    }
  )
  return(df_list)
}



#' **Get WNBA Stats API League Dashboard by Team Clutch Splits**
#' @name wnba_leaguedashteamclutch
NULL
#' @title
#' **Get WNBA Stats API League Dashboard by Team Clutch Splits**
#' @rdname wnba_leaguedashteamclutch
#' @author Saiem Gilani
#' @param ahead_behind ahead_behind
#' @param clutch_time clutch_time
#' @param conference conference
#' @param date_from date_from
#' @param date_to date_to
#' @param division division
#' @param game_scope game_scope
#' @param game_segment game_segment
#' @param last_n_games last_n_games
#' @param league_id league_id
#' @param location location
#' @param measure_type measure_type
#' @param month month
#' @param opponent_team_id opponent_team_id
#' @param outcome outcome
#' @param pace_adjust pace_adjust
#' @param plus_minus plus_minus
#' @param point_diff point_diff
#' @param po_round po_round
#' @param per_mode per_mode
#' @param period period
#' @param player_experience player_experience
#' @param player_position player_position
#' @param rank rank
#' @param season season
#' @param season_segment season_segment
#' @param season_type season_type
#' @param shot_clock_range shot_clock_range
#' @param starter_bench starter_bench
#' @param team_id team_id
#' @param vs_conference vs_conference
#' @param vs_division vs_division
#' @param ... Additional arguments passed to an underlying function like httr.
#' @return Returns a named list of data frames: LeagueDashTeamClutch
#'
#'    **LeagueDashTeamClutch**
#'
#'
#'    Columns as documented in the shared [wnba_leaguedashteamclutch_league_dash_team_clutch_schema] table.
#'
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows as_tibble
#' @import rvest
#' @export
#' @family WNBA League Functions
#' @family WNBA Clutch Functions
#' @details
#' ```r
#'  wnba_leaguedashteamclutch(league_id = '10', season = most_recent_wnba_season() - 1)
#' ```
wnba_leaguedashteamclutch <- function(
    ahead_behind = 'Ahead or Behind',
    clutch_time = 'Last 5 Minutes',
    conference = '',
    date_from = '',
    date_to = '',
    division = '',
    game_scope = '',
    game_segment = '',
    last_n_games = 0,
    league_id = '10',
    location = '',
    measure_type = 'Base',
    month = 0,
    opponent_team_id = 0,
    outcome = '',
    pace_adjust='N',
    plus_minus = 'N',
    point_diff = 5,
    po_round = '',
    per_mode = 'Totals',
    period = 0,
    player_experience = '',
    player_position = '',
    rank = 'N',
    season = most_recent_wnba_season() - 1,
    season_segment = '',
    season_type = 'Regular Season',
    shot_clock_range = '',
    starter_bench = '',
    team_id = '',
    vs_conference = '',
    vs_division = '',
    ...){
  .args <- mget(setdiff(names(formals()), "..."))
  
  # ahead_behind <- gsub(' ', '+', ahead_behind)
  # clutch_time <- gsub(' ', '+', clutch_time)
  # Intentional
  # season_type <- gsub(' ', '+', season_type)
  version <- "leaguedashteamclutch"
  endpoint <- wnba_endpoint(version)
  full_url <- endpoint
  
  params <- list(
    AheadBehind = ahead_behind,
    ClutchTime = clutch_time,
    Conference = conference,
    DateFrom = date_from,
    DateTo = date_to,
    Division = division,
    GameScope = game_scope,
    GameSegment = game_segment,
    LastNGames = last_n_games,
    LeagueID = league_id,
    Location = location,
    MeasureType = measure_type,
    Month = month,
    OpponentTeamID = opponent_team_id,
    Outcome = outcome,
    PaceAdjust = pace_adjust,
    PORound = po_round,
    PerMode = per_mode,
    Period = period,
    PlayerExperience = player_experience,
    PlayerPosition = player_position,
    PlusMinus = plus_minus,
    PointDiff = point_diff,
    Rank = rank,
    Season = season,
    SeasonSegment = season_segment,
    SeasonType = season_type,
    ShotClockRange = shot_clock_range,
    StarterBench = starter_bench,
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
      hint = "Invalid arguments or no league dashboard team clutch data for {season} available!",
      args = .args
    ),
    warning = function(w) .report_api_warning(w, args = .args),
    finally = {
    }
  )
  return(df_list)
}


#' **Get WNBA Stats API League Dashboard Team Stats**
#' @name wnba_leaguedashteamstats
NULL
#' @title
#' **Get WNBA Stats API League Dashboard Team Stats**
#' @rdname wnba_leaguedashteamstats
#' @author Saiem Gilani
#' @param conference conference
#' @param date_from date_from
#' @param date_to date_to
#' @param division division
#' @param game_scope game_scope
#' @param game_segment game_segment
#' @param last_n_games last_n_games
#' @param league_id league_id
#' @param location location
#' @param measure_type measure_type
#' @param month month
#' @param opponent_team_id opponent_team_id
#' @param outcome outcome
#' @param pace_adjust pace_adjust
#' @param po_round po_round
#' @param per_mode per_mode
#' @param period period
#' @param plus_minus plus_minus
#' @param rank rank
#' @param season season
#' @param season_segment season_segment
#' @param season_type season_type
#' @param shot_clock_range shot_clock_range
#' @param starter_bench starter_bench
#' @param team_id team_id
#' @param two_way two_way
#' @param vs_conference vs_conference
#' @param vs_division vs_division
#' @param ... Additional arguments passed to an underlying function like httr.
#' @return Returns a named list of data frames: LeagueDashTeamStats
#'
#'    **LeagueDashTeamStats**
#'
#'
#'    Columns as documented in the shared [wnba_leaguedashteamclutch_league_dash_team_clutch_schema] table.
#'
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows as_tibble
#' @import rvest
#' @export
#' @family WNBA League Functions
#' @family WNBA Team Functions
#' @details
#' ```r
#'  wnba_leaguedashteamstats(league_id = '10', season = most_recent_wnba_season() - 1)
#' ```
wnba_leaguedashteamstats <- function(
    conference = '',
    date_from = '',
    date_to = '',
    division = '',
    game_scope = '',
    game_segment = '',
    last_n_games = 0,
    league_id = '10',
    location = '',
    measure_type = 'Base',
    month = 0,
    opponent_team_id = 0,
    outcome = '',
    po_round = '',
    pace_adjust = 'N',
    per_mode = 'Totals',
    period = 0,
    plus_minus = 'N',
    rank = 'N',
    season = most_recent_wnba_season() - 1,
    season_segment = '',
    season_type = 'Regular Season',
    shot_clock_range = '',
    starter_bench = '',
    team_id = '',
    two_way = '',
    vs_conference = '',
    vs_division = '',
    ...){
  .args <- mget(setdiff(names(formals()), "..."))
  
  # Intentional
  # season_type <- gsub(' ', '+', season_type)
  version <- "leaguedashteamstats"
  endpoint <- wnba_endpoint(version)
  full_url <- endpoint
  
  params <- list(
    Conference = conference,
    DateFrom = date_from,
    DateTo = date_to,
    Division = division,
    GameScope = game_scope,
    GameSegment = game_segment,
    LastNGames = last_n_games,
    LeagueID = league_id,
    Location = location,
    MeasureType = measure_type,
    Month = month,
    OpponentTeamID = opponent_team_id,
    Outcome = outcome,
    PORound = po_round,
    PaceAdjust = pace_adjust,
    PerMode = per_mode,
    Period = period,
    PlusMinus = plus_minus,
    Rank = rank,
    Season = season,
    SeasonSegment = season_segment,
    SeasonType = season_type,
    ShotClockRange = shot_clock_range,
    StarterBench = starter_bench,
    TeamID = team_id,
    TwoWay = two_way,
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
      hint = "Invalid arguments or no league dashboard team stats data for {season} available!",
      args = .args
    ),
    warning = function(w) .report_api_warning(w, args = .args),
    finally = {
    }
  )
  return(df_list)
}


#' **Get WNBA Stats API League Dashboard Team Shot Locations**
#' @name wnba_leaguedashteamshotlocations
NULL
#' @title
#' **Get WNBA Stats API League Dashboard Team Shot Locations**
#' @rdname wnba_leaguedashteamshotlocations
#' @author Saiem Gilani
#' @param conference conference
#' @param date_from date_from
#' @param date_to date_to
#' @param distance_range distance_range
#' @param division division
#' @param game_scope game_scope
#' @param game_segment game_segment
#' @param last_n_games last_n_games
#' @param league_id league_id
#' @param location location
#' @param measure_type measure_type
#' @param month month
#' @param opponent_team_id opponent_team_id
#' @param outcome outcome
#' @param po_round po_round
#' @param pace_adjust pace_adjust
#' @param per_mode per_mode
#' @param period period
#' @param player_experience player_experience
#' @param player_position player_position
#' @param plus_minus plus_minus
#' @param rank rank
#' @param season season
#' @param season_segment season_segment
#' @param season_type season_type
#' @param shot_clock_range shot_clock_range
#' @param starter_bench starter_bench
#' @param team_id team_id
#' @param vs_conference vs_conference
#' @param vs_division vs_division
#' @param ... Additional arguments passed to an underlying function like httr.
#' @return Returns a named list of data frames: ShotLocations
#'
#'    **ShotLocations**
#'
#'
#'    \if{html}{\tabular{lll}{
#'       col_name \tab types \tab description \cr
#'       TEAM_ID \tab character \tab Unique team identifier. \cr
#'       TEAM_NAME \tab character \tab Full team display name (e.g. 'Las Vegas Aces'). \cr
#'       Restricted_Area_FGM \tab character \tab  \cr
#'       Restricted_Area_FGA \tab character \tab  \cr
#'       Restricted_Area_FG_PCT \tab character \tab  \cr
#'       In_The_Paint_Non_RA_FGM \tab character \tab  \cr
#'       In_The_Paint_Non_RA_FGA \tab character \tab  \cr
#'       In_The_Paint_Non_RA_FG_PCT \tab character \tab  \cr
#'       Mid_Range_FGM \tab character \tab  \cr
#'       Mid_Range_FGA \tab character \tab  \cr
#'       Mid_Range_FG_PCT \tab character \tab  \cr
#'       Left_Corner_3_FGM \tab character \tab  \cr
#'       Left_Corner_3_FGA \tab character \tab  \cr
#'       Left_Corner_3_FG_PCT \tab character \tab  \cr
#'       Right_Corner_3_FGM \tab character \tab  \cr
#'       Right_Corner_3_FGA \tab character \tab  \cr
#'       Right_Corner_3_FG_PCT \tab character \tab  \cr
#'       Above_the_Break_3_FGM \tab character \tab  \cr
#'       Above_the_Break_3_FGA \tab character \tab  \cr
#'       Above_the_Break_3_FG_PCT \tab character \tab  \cr
#'       Backcourt_FGM \tab character \tab  \cr
#'       Backcourt_FGA \tab character \tab  \cr
#'       Backcourt_FG_PCT \tab character \tab  \cr
#'       Corner_3_FGM \tab character \tab  \cr
#'       Corner_3_FGA \tab character \tab  \cr
#'       Corner_3_FG_PCT \tab character \tab  \cr
#'    }}
#'    \if{latex}{See the HTML help or pkgdown reference for the column table.}
#'
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows as_tibble
#' @import rvest
#' @export
#' @family WNBA League Functions
#' @family WNBA Shooting Functions
#' @details
#' ```r
#'  wnba_leaguedashteamshotlocations(league_id = '10', season = most_recent_wnba_season() - 1)
#' ```
wnba_leaguedashteamshotlocations <- function(
    conference = '',
    date_from = '',
    date_to = '',
    distance_range = 'By Zone',
    division = '',
    game_scope = '',
    game_segment = '',
    last_n_games = 0,
    league_id = '10',
    location = '',
    measure_type = 'Base',
    month = 0,
    opponent_team_id = 0,
    outcome = '',
    po_round = '',
    pace_adjust = 'N',
    per_mode = 'Totals',
    period = 0,
    player_experience = '',
    player_position = '',
    plus_minus = 'N',
    rank = 'N',
    season = most_recent_wnba_season() - 1,
    season_segment = '',
    season_type = 'Regular Season',
    shot_clock_range = '',
    starter_bench = '',
    team_id = '',
    vs_conference = '',
    vs_division = '',
    ...){
  .args <- mget(setdiff(names(formals()), "..."))
  
  # distance_range <- gsub(' ', '+', distance_range)
  # Intentional
  # season_type <- gsub(' ', '+', season_type)
  version <- "leaguedashteamshotlocations"
  endpoint <- wnba_endpoint(version)
  full_url <- endpoint
  
  params <- list(
    Conference = conference,
    DateFrom = date_from,
    DateTo = date_to,
    Division = division,
    DistanceRange = distance_range,
    GameScope = game_scope,
    GameSegment = game_segment,
    LastNGames = last_n_games,
    LeagueID = league_id,
    Location = location,
    MeasureType = measure_type,
    Month = month,
    OpponentTeamID = opponent_team_id,
    Outcome = outcome,
    PORound = po_round,
    PaceAdjust = pace_adjust,
    PerMode = per_mode,
    Period = period,
    PlayerExperience = player_experience,
    PlayerPosition = player_position,
    PlusMinus = plus_minus,
    Rank = rank,
    Season = season,
    SeasonSegment = season_segment,
    SeasonType = season_type,
    ShotClockRange = shot_clock_range,
    StarterBench = starter_bench,
    TeamID = team_id,
    VsConference = vs_conference,
    VsDivision = vs_division
  )
  
  df_list <- list()

  tryCatch(
    expr = {
      
      resp <- request_with_proxy(url = full_url, params = params, ...)
      
      df_list <- purrr::map(1:length(resp$resultSets$name), function(x){
        data <- resp$resultSets$rowSet %>%
          data.frame(stringsAsFactors = F) %>%
          dplyr::as_tibble()
        columnsToSkip <- resp$resultSets$headers$columnsToSkip[[1]]
        columnSpan <- resp$resultSets$headers$columnSpan[[1]]
        json_names1 <- resp$resultSets$headers$columnNames[[1]]
        json_names_rep <- rep(json_names1,times = 1, each = columnSpan)
        json_names2 <- resp$resultSets$headers$columnNames[[2]]
        json_names <- c(json_names2[1:columnsToSkip], paste(json_names_rep, json_names2[(columnsToSkip + 1):30]))
        colnames(data) <- gsub('\\(|\\)|','', gsub(' |-','_',json_names))
        return(data)
      })
      names(df_list) <- resp$resultSets$name
    },
    error = function(e) .report_api_error(
      e,
      hint = "Invalid arguments or no league dashboard team shot location data for {season} available!",
      args = .args
    ),
    warning = function(w) .report_api_warning(w, args = .args),
    finally = {
    }
  )
  return(df_list)
}
