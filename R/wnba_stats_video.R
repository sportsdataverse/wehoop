#' **Get WNBA Stats API Video Details**
#' @name wnba_videodetailsasset
NULL
#' @title
#' **Get WNBA Stats API Video Details**
#' @rdname wnba_videodetailsasset
#' @author Saiem Gilani
#' @param ahead_behind ahead_behind
#' @param clutch_time clutch_time
#' @param context_filter context_filter
#' @param context_measure context_measure
#' @param date_from date_from
#' @param date_to date_to
#' @param end_period end_period
#' @param end_range end_range
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
#' @param point_diff point_diff
#' @param position position
#' @param range_type range_type
#' @param rookie_year rookie_year
#' @param season season
#' @param season_segment season_segment
#' @param season_type season_type
#' @param start_period start_period
#' @param start_range start_range
#' @param team_id team_id
#' @param vs_conference vs_conference
#' @param vs_division vs_division
#' @param ... Additional arguments passed to an underlying function like httr.
#' @return Return a list of tibbles: videoUrls, playlist
#'
#'    **videoUrls**
#'
#'
#'    |col_name |types     |
#'    |:--------|:---------|
#'    |uuid     |character |
#'    |sdur     |integer   |
#'    |surl     |character |
#'    |sth      |character |
#'    |mdur     |integer   |
#'    |murl     |character |
#'    |mth      |character |
#'    |ldur     |integer   |
#'    |lurl     |character |
#'    |lth      |character |
#'    |vtt      |character |
#'    |scc      |character |
#'    |srt      |character |
#'
#'    **playlist**
#'
#'
#'    |col_name |types     |
#'    |:--------|:---------|
#'    |gi       |character |
#'    |ei       |integer   |
#'    |y        |integer   |
#'    |m        |character |
#'    |d        |character |
#'    |gc       |character |
#'    |p        |integer   |
#'    |dsc      |character |
#'    |ha       |character |
#'    |hid      |integer   |
#'    |va       |character |
#'    |vid      |integer   |
#'    |hpb      |integer   |
#'    |hpa      |integer   |
#'    |vpb      |integer   |
#'    |vpa      |integer   |
#'    |pta      |integer   |
#'
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows as_tibble
#' @import rvest
#' @export
#' @family WNBA Video Functions
#' @details
#' ```r
#'   wnba_videodetailsasset(player_id = '1627668', team_id = '1611661328')
#' ```
wnba_videodetailsasset <- function(
    ahead_behind = '',
    clutch_time = '',
    context_filter = '',
    context_measure = 'FGA',
    date_from = '',
    date_to = '',
    end_period = '',
    end_range = '',
    game_id = '',
    game_segment = '',
    last_n_games = 0,
    league_id = '10',
    location = '',
    month = 0,
    opponent_team_id = 0,
    outcome = '',
    period = 0,
    player_id = '1627668',
    point_diff = '',
    position = '',
    range_type = '',
    rookie_year = '',
    season = most_recent_wnba_season(),
    season_segment = '',
    season_type = 'Regular Season',
    start_period = '',
    start_range = '',
    team_id = '1611661328',
    vs_conference = '',
    vs_division = '',
    ...){
  
  # Intentional
  # season_type <- gsub(' ', '+', season_type)
  version <- "videodetailsasset"
  endpoint <- wnba_endpoint(version)
  full_url <- endpoint
  
  params <- list(
    AheadBehind = ahead_behind,
    ClutchTime = clutch_time,
    ContextFilter = context_filter,
    ContextMeasure = context_measure,
    DateFrom = date_from,
    DateTo = date_to,
    EndPeriod = end_period,
    EndRange = end_range,
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
    PointDiff = point_diff,
    Position = position,
    RangeType = range_type,
    RookieYear = rookie_year,
    Season = season,
    SeasonSegment = season_segment,
    SeasonType = season_type,
    StartPeriod = start_period,
    StartRange = start_range,
    TeamID = team_id,
    VsConference = vs_conference,
    VsDivision = vs_division
  )
  tryCatch(
    expr = {
      
      resp <- request_with_proxy(url = full_url, params = params, ...)
      videoUrls <- resp$resultSets$Meta$videoUrls %>%
        data.frame() %>%
        dplyr::as_tibble()
      playlist <- resp$resultSets$playlist %>%
        data.frame() %>%
        dplyr::as_tibble()
      df_list <- c(list(videoUrls), list(playlist))
      names(df_list) <- c("videoUrls", "playlist")
      
    },
    error = function(e) {
      cli::cli_alert_danger("{Sys.time()}: Invalid arguments or no video detail assets data available!")
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


#' **Get WNBA Stats API Video Details**
#' @name wnba_videodetails
NULL
#' @title
#' **Get WNBA Stats API Video Details**
#' @rdname wnba_videodetails
#' @author Saiem Gilani
#' @param ahead_behind ahead_behind
#' @param clutch_time clutch_time
#' @param context_filter context_filter
#' @param context_measure context_measure
#' @param date_from date_from
#' @param date_to date_to
#' @param end_period end_period
#' @param end_range end_range
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
#' @param point_diff point_diff
#' @param position position
#' @param range_type range_type
#' @param rookie_year rookie_year
#' @param season season
#' @param season_segment season_segment
#' @param season_type season_type
#' @param start_period start_period
#' @param start_range start_range
#' @param team_id team_id
#' @param vs_conference vs_conference
#' @param vs_division vs_division
#' @param ... Additional arguments passed to an underlying function like httr.
#' @return Return a list of tibbles: videoUrls, playlist
#'
#'    **videoUrls**
#'
#'
#'    |col_name |types     |
#'    |:--------|:---------|
#'    |uuid     |character |
#'    |dur      |logical   |
#'    |stt      |logical   |
#'    |stp      |logical   |
#'    |sth      |logical   |
#'    |stw      |logical   |
#'    |mtt      |logical   |
#'    |mtp      |logical   |
#'    |mth      |logical   |
#'    |mtw      |logical   |
#'    |ltt      |logical   |
#'    |ltp      |logical   |
#'    |lth      |logical   |
#'    |ltw      |logical   |
#'
#'    **playlist**
#'
#'
#'    |col_name |types     |
#'    |:--------|:---------|
#'    |gi       |character |
#'    |ei       |integer   |
#'    |y        |integer   |
#'    |m        |character |
#'    |d        |character |
#'    |gc       |character |
#'    |p        |integer   |
#'    |dsc      |character |
#'    |ha       |character |
#'    |va       |character |
#'    |hpb      |integer   |
#'    |hpa      |integer   |
#'    |vpb      |integer   |
#'    |vpa      |integer   |
#'    |pta      |integer   |
#'
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows as_tibble
#' @import rvest
#' @export
#' @family WNBA Video Functions
#' @details
#' ```r
#'   wnba_videodetails(player_id = '1627668', team_id = '1611661328')
#' ```
wnba_videodetails <- function(
    ahead_behind = '',
    clutch_time = '',
    context_filter = '',
    context_measure = 'FGA',
    date_from = '',
    date_to = '',
    end_period = '',
    end_range = '',
    game_id = '',
    game_segment = '',
    last_n_games = 0,
    league_id = '10',
    location = '',
    month = 0,
    opponent_team_id = 0,
    outcome = '',
    period = 0,
    player_id = '1627668',
    point_diff = '',
    position = '',
    range_type = '',
    rookie_year = '',
    season = most_recent_wnba_season(),
    season_segment = '',
    season_type = 'Regular Season',
    start_period = '',
    start_range = '',
    team_id = '1611661328',
    vs_conference = '',
    vs_division = '',
    ...){
  
  # season_type <- gsub(' ', '+', season_type)
  version <- "videodetails"
  endpoint <- wnba_endpoint(version)
  full_url <- endpoint
  
  params <- list(
    AheadBehind = ahead_behind,
    ClutchTime = clutch_time,
    ContextFilter = context_filter,
    ContextMeasure = context_measure,
    DateFrom = date_from,
    DateTo = date_to,
    EndPeriod = end_period,
    EndRange = end_range,
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
    PointDiff = point_diff,
    Position = position,
    RangeType = range_type,
    RookieYear = rookie_year,
    Season = season,
    SeasonSegment = season_segment,
    SeasonType = season_type,
    StartPeriod = start_period,
    StartRange = start_range,
    TeamID = team_id,
    VsConference = vs_conference,
    VsDivision = vs_division
  )
  tryCatch(
    expr = {
      
      resp <- request_with_proxy(url = full_url, params = params, ...)
      videoUrls <- resp$resultSets$Meta$videoUrls %>%
        data.frame() %>%
        dplyr::as_tibble()
      playlist <- resp$resultSets$playlist %>%
        data.frame() %>%
        dplyr::as_tibble()
      df_list <- c(list(videoUrls), list(playlist))
      names(df_list) <- c("videoUrls", "playlist")
      
    },
    error = function(e) {
      cli::cli_alert_danger("{Sys.time()}: Invalid arguments or no video details data available!")
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


#' **Get WNBA Stats API Video Events**
#' @name wnba_videoevents
NULL
#' @title
#' **Get WNBA Stats API Video Events**
#' @rdname wnba_videoevents
#' @author Saiem Gilani
#' @param game_id game_id
#' @param game_event_id game_event_id
#' @param ... Additional arguments passed to an underlying function like httr.
#' @return Return a list of tibbles: videoUrls, playlist
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows as_tibble
#' @import rvest
#' @export
#' @family WNBA Video Functions
#' @details
#' ```r
#'   wnba_videoevents(game_id = '1022200075', game_event_id = '10')
#' ```
wnba_videoevents <- function(
    game_id = '1022200075',
    game_event_id = '10',
    ...){
  
  version <- "videoevents"
  endpoint <- wnba_endpoint(version)
  full_url <- endpoint
  
  params <- list(
    GameID = game_id,
    GameEventID = game_event_id
  )
  
  tryCatch(
    expr = {
      
      resp <- request_with_proxy(url = full_url, params = params, ...)
      
      videoUrls <- resp$resultSets$Meta$videoUrls %>%
        data.frame() %>%
        dplyr::as_tibble()
      playlist <- resp$resultSets$playlist %>%
        data.frame() %>%
        dplyr::as_tibble()
      
      df_list <- c(list(videoUrls), list(playlist))
      names(df_list) <- c("videoUrls", "playlist")
      
    },
    error = function(e) {
      cli::cli_alert_danger("{Sys.time()}: Invalid arguments or no video events data for {game_id} available!")
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


#' **Get WNBA Stats API Video Status**
#' @name wnba_videostatus
NULL
#' @title
#' **Get WNBA Stats API Video Status**
#' @rdname wnba_videostatus
#' @author Saiem Gilani
#' @param game_date game_date
#' @param league_id league_id
#' @param ... Additional arguments passed to an underlying function like httr.
#' @return Return a list of tibbles: VideoStatus
#'
#'    **VideoStatus**
#'
#'
#'    |col_name                  |types     |
#'    |:-------------------------|:---------|
#'    |GAME_ID                   |character |
#'    |GAME_DATE                 |character |
#'    |VISITOR_TEAM_ID           |character |
#'    |VISITOR_TEAM_CITY         |character |
#'    |VISITOR_TEAM_NAME         |character |
#'    |VISITOR_TEAM_ABBREVIATION |character |
#'    |HOME_TEAM_ID              |character |
#'    |HOME_TEAM_CITY            |character |
#'    |HOME_TEAM_NAME            |character |
#'    |HOME_TEAM_ABBREVIATION    |character |
#'    |GAME_STATUS               |character |
#'    |GAME_STATUS_TEXT          |character |
#'    |IS_AVAILABLE              |character |
#'    |PT_XYZ_AVAILABLE          |character |
#'
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows as_tibble
#' @import rvest
#' @export
#' @family WNBA Video Functions
#' @details
#' ```r
#'   wnba_videostatus(game_date = '2022-06-10', league_id = '10')
#' ```
wnba_videostatus <- function(
    game_date = '2022-06-10',
    league_id = '10',
    ...){
  
  version <- "videostatus"
  endpoint <- wnba_endpoint(version)
  full_url <- endpoint
  
  params <- list(
    GameDate = game_date,
    LeagueID = league_id
  )
  
  tryCatch(
    expr = {
      
      resp <- request_with_proxy(url = full_url, params = params, ...)
      
      df_list <- wnba_stats_map_result_sets(resp)
      
    },
    error = function(e) {
      cli::cli_alert_danger("{Sys.time()}: Invalid arguments or no video status data for {game_date} available!")
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
