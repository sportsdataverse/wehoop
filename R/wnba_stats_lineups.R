#' **Get WNBA Stats API Fantasy Widget**
#' @name wnba_fantasywidget
NULL
#' @title
#' **Get WNBA Stats API Fantasy Widget**
#' @rdname wnba_fantasywidget
#' @author Saiem Gilani
#' @param active_players active_players
#' @param date_from date_from date_from
#' @param date_to date_to date_to
#' @param last_n_games last_n_games
#' @param league_id league_id
#' @param location location
#' @param month month
#' @param opponent_team_id opponent_team_id
#' @param po_round po_round
#' @param player_id player_id
#' @param position position
#' @param season season
#' @param season_segment season_segment
#' @param season_type season_type
#' @param team_id team_id
#' @param todays_opponent todays_opponent
#' @param todays_players todays_players
#' @param vs_conference vs_conference
#' @param vs_division vs_division
#' @param ... Additional arguments passed to an underlying function like httr.
#' @return Returns a named list of data frames: FantasyWidgetResult
#'
#'    **FantasyWidgetResult**
#'
#'
#'    \if{html}{\tabular{lll}{
#'       col_name \tab types \tab description \cr
#'       PLAYER_ID \tab character \tab Unique player identifier. \cr
#'       PLAYER_NAME \tab character \tab Player name. \cr
#'       PLAYER_POSITION \tab character \tab  \cr
#'       TEAM_ID \tab character \tab Unique team identifier. \cr
#'       TEAM_ABBREVIATION \tab character \tab Short team abbreviation (e.g. 'LAS'). \cr
#'       GP \tab character \tab Games played. \cr
#'       MIN \tab character \tab Minutes played. \cr
#'       FAN_DUEL_PTS \tab character \tab  \cr
#'       NBA_FANTASY_PTS \tab character \tab  \cr
#'       PTS \tab character \tab Points scored. \cr
#'       REB \tab character \tab Total rebounds. \cr
#'       AST \tab character \tab Assists. \cr
#'       BLK \tab character \tab Blocks. \cr
#'       STL \tab character \tab Steals. \cr
#'       TOV \tab character \tab Turnovers. \cr
#'       FG3M \tab character \tab Three-point field goals made. \cr
#'       FGA \tab character \tab Field goal attempts. \cr
#'       FG_PCT \tab character \tab Field goal percentage (0-1). \cr
#'       FTA \tab character \tab Free throw attempts. \cr
#'       FT_PCT \tab character \tab Free throw percentage (0-1). \cr
#'    }}
#'    \if{latex}{See the HTML help or pkgdown reference for the column table.}
#'
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows as_tibble
#' @import rvest
#' @export
#' @family WNBA Fantasy Functions
#' @details
#' ```r
#'  wnba_fantasywidget(league_id = '10', season = most_recent_wnba_season() - 1)
#' ```
wnba_fantasywidget <- function(
    active_players = 'N',
    date_from = '',
    date_to = '',
    last_n_games = 0,
    league_id = '10',
    location = '',
    month = '',
    opponent_team_id = '',
    po_round = '',
    player_id = '',
    position = '',
    season = most_recent_wnba_season() - 1,
    season_segment = '',
    season_type = 'Regular Season',
    team_id = '',
    todays_opponent = 0,
    todays_players = 'N',
    vs_conference = '',
    vs_division = '',
    ...){
  .args <- mget(setdiff(names(formals()), "..."))
  
  # Intentional
  # season_type <- gsub(' ', '+', season_type)
  version <- "fantasywidget"
  endpoint <- wnba_endpoint(version)
  full_url <- endpoint
  
  params <- list(
    ActivePlayers = active_players,
    DateFrom = date_from,
    DateTo = date_to,
    LastNGames = last_n_games,
    LeagueID = league_id,
    Location = location,
    Month = month,
    OpponentTeamID = opponent_team_id,
    PORound = po_round,
    PlayerID = player_id,
    Position = position,
    Season = season,
    SeasonSegment = season_segment,
    SeasonType = season_type,
    TeamID = team_id,
    TodaysOpponent = todays_opponent,
    TodaysPlayers = todays_players,
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
      hint = "Invalid arguments or no fantasy widget data for {season} available!",
      args = .args
    ),
    warning = function(w) .report_api_warning(w, args = .args),
    finally = {
    }
  )
  return(df_list)
}

#' **Get WNBA Stats API League Dashboard Lineups**
#' @name wnba_leaguedashlineups
NULL
#' @title
#' **Get WNBA Stats API League Dashboard Lineups**
#' @rdname wnba_leaguedashlineups
#' @author Saiem Gilani
#' @param conference conference
#' @param date_from date_from
#' @param date_to date_to
#' @param division division
#' @param game_segment game_segment
#' @param group_quantity group_quantity
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
#' @param plus_minus plus_minus
#' @param rank rank
#' @param season season
#' @param season_segment season_segment
#' @param season_type season_type
#' @param shot_clock_range shot_clock_range
#' @param team_id team_id
#' @param vs_conference vs_conference
#' @param vs_division vs_division
#' @param ... Additional arguments passed to an underlying function like httr.
#' @return Returns a named list of data frames: Lineups
#'
#'  **Lineups**
#'
#'
#'  \if{html}{\tabular{lll}{
#'     col_name \tab types \tab description \cr
#'     GROUP_SET \tab character \tab  \cr
#'     GROUP_ID \tab character \tab Group identifier (e.g. conference group_id). \cr
#'     GROUP_NAME \tab character \tab Group name. \cr
#'     TEAM_ID \tab character \tab Unique team identifier. \cr
#'     TEAM_ABBREVIATION \tab character \tab Short team abbreviation (e.g. 'LAS'). \cr
#'     GP \tab character \tab Games played. \cr
#'     W \tab character \tab Wins. \cr
#'     L \tab character \tab Losses. \cr
#'     W_PCT \tab character \tab Wins percentage (0-1 decimal). \cr
#'     MIN \tab character \tab Minutes played. \cr
#'     FGM \tab character \tab Field goals made. \cr
#'     FGA \tab character \tab Field goal attempts. \cr
#'     FG_PCT \tab character \tab Field goal percentage (0-1). \cr
#'     FG3M \tab character \tab Three-point field goals made. \cr
#'     FG3A \tab character \tab Three-point field goal attempts. \cr
#'     FG3_PCT \tab character \tab Three-point field goal percentage (0-1). \cr
#'     FTM \tab character \tab Free throws made. \cr
#'     FTA \tab character \tab Free throw attempts. \cr
#'     FT_PCT \tab character \tab Free throw percentage (0-1). \cr
#'     OREB \tab character \tab Offensive rebounds. \cr
#'     DREB \tab character \tab Defensive rebounds. \cr
#'     REB \tab character \tab Total rebounds. \cr
#'     AST \tab character \tab Assists. \cr
#'     TOV \tab character \tab Turnovers. \cr
#'     STL \tab character \tab Steals. \cr
#'     BLK \tab character \tab Blocks. \cr
#'     BLKA \tab character \tab  \cr
#'     PF \tab character \tab Personal fouls. \cr
#'     PFD \tab character \tab  \cr
#'     PTS \tab character \tab Points scored. \cr
#'     PLUS_MINUS \tab character \tab Plus/minus point differential while on court. \cr
#'     GP_RANK \tab character \tab  \cr
#'     W_RANK \tab character \tab  \cr
#'     L_RANK \tab character \tab  \cr
#'     W_PCT_RANK \tab character \tab  \cr
#'     MIN_RANK \tab character \tab  \cr
#'     FGM_RANK \tab character \tab  \cr
#'     FGA_RANK \tab character \tab  \cr
#'     FG_PCT_RANK \tab character \tab  \cr
#'     FG3M_RANK \tab character \tab  \cr
#'     FG3A_RANK \tab character \tab  \cr
#'     FG3_PCT_RANK \tab character \tab  \cr
#'     FTM_RANK \tab character \tab  \cr
#'     FTA_RANK \tab character \tab  \cr
#'     FT_PCT_RANK \tab character \tab  \cr
#'     OREB_RANK \tab character \tab  \cr
#'     DREB_RANK \tab character \tab  \cr
#'     REB_RANK \tab character \tab  \cr
#'     AST_RANK \tab character \tab  \cr
#'     TOV_RANK \tab character \tab  \cr
#'     STL_RANK \tab character \tab  \cr
#'     BLK_RANK \tab character \tab  \cr
#'     BLKA_RANK \tab character \tab  \cr
#'     PF_RANK \tab character \tab  \cr
#'     PFD_RANK \tab character \tab  \cr
#'     PTS_RANK \tab character \tab  \cr
#'     PLUS_MINUS_RANK \tab character \tab  \cr
#'  }}
#'  \if{latex}{See the HTML help or pkgdown reference for the column table.}
#'
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows as_tibble
#' @import rvest
#' @export
#' @family WNBA League Functions
#' @family WNBA Lineup Functions
#' @details
#' ```r
#'  wnba_leaguedashlineups(league_id = '10', season = most_recent_wnba_season() - 1)
#' ```
wnba_leaguedashlineups <- function(
    conference = '',
    date_from = '',
    date_to = '',
    division = '',
    game_segment = '',
    group_quantity = 5,
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
    team_id = '',
    vs_conference = '',
    vs_division = '',
    ...){
  .args <- mget(setdiff(names(formals()), "..."))
  
  # Intentional
  # season_type <- gsub(' ', '+', season_type)
  version <- "leaguedashlineups"
  endpoint <- wnba_endpoint(version)
  full_url <- endpoint
  
  params <- list(
    Conference = conference,
    DateFrom = date_from,
    DateTo = date_to,
    Division = division,
    GameSegment = game_segment,
    GroupQuantity = group_quantity,
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
      hint = "Invalid arguments or no league dashboard lineups data for {season} available!",
      args = .args
    ),
    warning = function(w) .report_api_warning(w, args = .args),
    finally = {
    }
  )
  return(df_list)
}

#' **Get WNBA Stats API League Lineup Visual Data**
#' @name wnba_leaguelineupviz
NULL
#' @title
#' **Get WNBA Stats API League Lineup Visual Data**
#' @rdname wnba_leaguelineupviz
#' @author Saiem Gilani
#' @param conference conference
#' @param date_from date_from
#' @param date_to date_to
#' @param division division
#' @param game_segment game_segment
#' @param group_quantity group_quantity
#' @param last_n_games last_n_games
#' @param league_id league_id
#' @param location location
#' @param measure_type measure_type
#' @param minutes_min minutes_min
#' @param month month
#' @param opponent_team_id opponent_team_id
#' @param outcome outcome
#' @param po_round po_round
#' @param pace_adjust pace_adjust
#' @param per_mode per_mode
#' @param period period
#' @param plus_minus plus_minus
#' @param rank rank
#' @param season season
#' @param season_segment season_segment
#' @param season_type season_type
#' @param shot_clock_range shot_clock_range
#' @param team_id team_id
#' @param vs_conference vs_conference
#' @param vs_division vs_division
#' @param ... Additional arguments passed to an underlying function like httr.
#' @return Returns a named list of data frames: LeagueLineupViz
#'
#'    **LeagueLineupViz**
#'
#'
#'    \if{html}{\tabular{lll}{
#'       col_name \tab types \tab description \cr
#'       GROUP_ID \tab character \tab Group identifier (e.g. conference group_id). \cr
#'       GROUP_NAME \tab character \tab Group name. \cr
#'       TEAM_ID \tab character \tab Unique team identifier. \cr
#'       TEAM_ABBREVIATION \tab character \tab Short team abbreviation (e.g. 'LAS'). \cr
#'       MIN \tab character \tab Minutes played. \cr
#'       OFF_RATING \tab character \tab Offensive rating (points produced per 100 possessions). \cr
#'       DEF_RATING \tab character \tab Defensive rating (points allowed per 100 possessions). \cr
#'       NET_RATING \tab character \tab Net rating (off rating - def rating). \cr
#'       PACE \tab character \tab Possessions per 48 minutes. \cr
#'       TS_PCT \tab character \tab True shooting percentage (0-1). \cr
#'       FTA_RATE \tab character \tab Free throw attempt rate (FTA / FGA). \cr
#'       TM_AST_PCT \tab character \tab  \cr
#'       PCT_FGA_2PT \tab character \tab  \cr
#'       PCT_FGA_3PT \tab character \tab  \cr
#'       PCT_PTS_2PT_MR \tab character \tab  \cr
#'       PCT_PTS_FB \tab character \tab  \cr
#'       PCT_PTS_FT \tab character \tab  \cr
#'       PCT_PTS_PAINT \tab character \tab  \cr
#'       PCT_AST_FGM \tab character \tab  \cr
#'       PCT_UAST_FGM \tab character \tab  \cr
#'       OPP_FG3_PCT \tab character \tab  \cr
#'       OPP_EFG_PCT \tab character \tab  \cr
#'       OPP_FTA_RATE \tab character \tab  \cr
#'       OPP_TOV_PCT \tab character \tab  \cr
#'    }}
#'    \if{latex}{See the HTML help or pkgdown reference for the column table.}
#'
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows as_tibble
#' @import rvest
#' @export
#' @family WNBA League Functions
#' @family WNBA Lineup Functions
#' @details
#' ```r
#'   wnba_leaguelineupviz(league_id = '10', season = most_recent_wnba_season() - 1)
#' ```
wnba_leaguelineupviz <- function(
    conference = '',
    date_from = '',
    date_to = '',
    division = '',
    game_segment = '',
    group_quantity = 5,
    last_n_games = 0,
    league_id = '10',
    location = '',
    measure_type = 'Base',
    minutes_min = 10,
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
    team_id = '',
    vs_conference = '',
    vs_division = '',
    ...){
  .args <- mget(setdiff(names(formals()), "..."))

  # Restored in 3.0.0 after the upstream endpoint resumed publishing populated
  # LeagueLineupViz data. Verified 2026-05-16: 4,169 lineup combinations x
  # 25 columns returned for the 2025-26 WNBA season with full
  # OFF_RATING / DEF_RATING / NET_RATING / PACE / TS_PCT / EFG_PCT columns.

  # Intentional
  # season_type <- gsub(' ', '+', season_type)
  version <- "leaguelineupviz"
  endpoint <- wnba_endpoint(version)
  full_url <- endpoint
  
  params <- list(
    Conference = conference,
    DateFrom = date_from,
    DateTo = date_to,
    Division = division,
    GameSegment = game_segment,
    GroupQuantity = group_quantity,
    LastNGames = last_n_games,
    LeagueID = league_id,
    Location = location,
    MeasureType = measure_type,
    MinutesMin = minutes_min,
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
      hint = "Invalid arguments or no league lineup viz data for {season} available!",
      args = .args
    ),
    warning = function(w) .report_api_warning(w, args = .args),
    finally = {
    }
  )
  return(df_list)
}



#' **Get WNBA Stats API League Player On/Off Details**
#' @name wnba_leagueplayerondetails
NULL
#' @title
#' **Get WNBA Stats API League Player On/Off Details**
#' @rdname wnba_leagueplayerondetails
#' @author Saiem Gilani
#' @param date_from date_from
#' @param date_to date_to
#' @param game_segment game_segment
#' @param last_n_games last_n_games
#' @param league_id league_id
#' @param location location
#' @param measure_type measure_type
#' @param month month
#' @param opponent_team_id opponent_team_id
#' @param outcome outcome
#' @param pace_adjust pace_adjust
#' @param per_mode per_mode
#' @param period period
#' @param plus_minus plus_minus
#' @param rank rank
#' @param season season
#' @param season_segment season_segment
#' @param season_type season_type
#' @param team_id team_id
#' @param vs_conference vs_conference
#' @param vs_division vs_division
#' @param ... Additional arguments passed to an underlying function like httr.
#' @return Returns a named list of data frames: PlayersOnCourtLeaguePlayerDetails
#'
#'    **PlayersOnCourtLeaguePlayerDetails**
#'
#'
#'    Columns as documented in the shared [wnba_on_off_schema] table.
#'
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows as_tibble
#' @import rvest
#' @export
#' @family WNBA League Functions
#' @family WNBA Player Functions
#' @details
#' ```r
#'  wnba_leagueplayerondetails(team_id = '1611661313', season = most_recent_wnba_season() - 1)
#' ```
wnba_leagueplayerondetails <- function(
    date_from = '',
    date_to = '',
    game_segment = '',
    last_n_games = 0,
    league_id = '10',
    location = '',
    measure_type = 'Base',
    month = 0,
    opponent_team_id = 0,
    outcome = '',
    pace_adjust = 'N',
    per_mode = 'Totals',
    period = 0,
    plus_minus = 'N',
    rank = 'N',
    season = most_recent_wnba_season() - 1,
    season_segment = '',
    season_type = 'Regular Season',
    team_id = '1611661313',
    vs_conference = '',
    vs_division = '',
    ...){
  .args <- mget(setdiff(names(formals()), "..."))
  
  # Intentional
  # season_type <- gsub(' ', '+', season_type)
  version <- "leagueplayerondetails"
  endpoint <- wnba_endpoint(version)
  full_url <- endpoint
  
  params <- list(
    DateFrom = date_from,
    DateTo = date_to,
    GameSegment = game_segment,
    LastNGames = last_n_games,
    LeagueID = league_id,
    Location = location,
    MeasureType = measure_type,
    Month = month,
    OpponentTeamID = opponent_team_id,
    Outcome = outcome,
    PaceAdjust = pace_adjust,
    PerMode = per_mode,
    Period = period,
    PlusMinus = plus_minus,
    Rank = rank,
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
      hint = "Invalid arguments or no league player on/off details data for {season} available!",
      args = .args
    ),
    warning = function(w) .report_api_warning(w, args = .args),
    finally = {
    }
  )
  return(df_list)
}




#' **Get WNBA Stats API League Season Matchups**
#' @name wnba_leagueseasonmatchups
NULL
#' @title
#' **Get WNBA Stats API League Season Matchups**
#' @rdname wnba_leagueseasonmatchups
#' @author Saiem Gilani
#' @param def_player_id def_player_id
#' @param def_team_id def_team_id
#' @param league_id league_id
#' @param off_player_id off_player_id
#' @param off_team_id off_team_id
#' @param per_mode per_mode
#' @param season season
#' @param season_type season_type
#' @param ... Additional arguments passed to an underlying function like httr.
#' @return Returns a named list of data frames: SeasonMatchups
#'
#'    **SeasonMatchups**
#'
#'
#'    \if{html}{\tabular{lll}{
#'       col_name \tab types \tab description \cr
#'       SEASON_ID \tab character \tab Unique season identifier. \cr
#'       OFF_PLAYER_ID \tab character \tab  \cr
#'       OFF_PLAYER_NAME \tab character \tab  \cr
#'       DEF_PLAYER_ID \tab character \tab  \cr
#'       DEF_PLAYER_NAME \tab character \tab  \cr
#'       GP \tab character \tab Games played. \cr
#'       MATCHUP_MIN \tab character \tab  \cr
#'       PARTIAL_POSS \tab character \tab  \cr
#'       PLAYER_PTS \tab character \tab  \cr
#'       TEAM_PTS \tab character \tab  \cr
#'       MATCHUP_AST \tab character \tab  \cr
#'       MATCHUP_TOV \tab character \tab  \cr
#'       MATCHUP_BLK \tab character \tab  \cr
#'       MATCHUP_FGM \tab character \tab  \cr
#'       MATCHUP_FGA \tab character \tab  \cr
#'       MATCHUP_FG_PCT \tab character \tab  \cr
#'       MATCHUP_FG3M \tab character \tab  \cr
#'       MATCHUP_FG3A \tab character \tab  \cr
#'       MATCHUP_FG3_PCT \tab character \tab  \cr
#'       HELP_BLK \tab character \tab  \cr
#'       HELP_FGM \tab character \tab  \cr
#'       HELP_FGA \tab character \tab  \cr
#'       HELP_FG_PERC \tab character \tab  \cr
#'       MATCHUP_FTM \tab character \tab  \cr
#'       MATCHUP_FTA \tab character \tab  \cr
#'       SFL \tab character \tab  \cr
#'       MATCHUP_TIME_SEC \tab character \tab  \cr
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
#' (No Matchups Data for WNBA yet, so defunct)
#' ```r
#'  wnba_leagueseasonmatchups(league_id = '10', season = most_recent_wnba_season() - 1)
#' ```
wnba_leagueseasonmatchups <- function(
    def_player_id = '',
    def_team_id = '',
    league_id = '10',
    off_player_id = '',
    off_team_id = '',
    per_mode = 'Totals',
    season = most_recent_wnba_season() - 1,
    season_type = 'Regular Season',
    ...){
  .args <- mget(setdiff(names(formals()), "..."))
  
  # Intentional
  # season_type <- gsub(' ', '+', season_type)
  version <- "leagueseasonmatchups"
  endpoint <- wnba_endpoint(version)
  full_url <- endpoint
  
  params <- list(
    DefPlayerID = def_player_id,
    DefTeamID = def_team_id,
    LeagueID = league_id,
    OffPlayerID = off_player_id,
    OffTeamID = off_team_id,
    PerMode = per_mode,
    Season = season,
    SeasonType = season_type
  )
  
  df_list <- list()

  tryCatch(
    expr = {
      
      resp <- request_with_proxy(url = full_url, params = params, ...)
      
      df_list <- wnba_stats_map_result_sets(resp)
      
    },
    error = function(e) .report_api_error(
      e,
      hint = "Invalid arguments or no league season matchups data for {season} available!",
      args = .args
    ),
    warning = function(w) .report_api_warning(w, args = .args),
    finally = {
    }
  )
  return(df_list)
}
