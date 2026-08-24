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
#'    |col_name |types     |description |
#'    |:--------|:---------|:-----------|
#'    |uuid     |character |Uuid.       |
#'    |sdur     |integer   |Sdur.       |
#'    |surl     |character |Surl.       |
#'    |sth      |character |Sth.        |
#'    |mdur     |integer   |Mdur.       |
#'    |murl     |character |Murl.       |
#'    |mth      |character |Mth.        |
#'    |ldur     |integer   |Ldur.       |
#'    |lurl     |character |Lurl.       |
#'    |lth      |character |Lth.        |
#'    |vtt      |character |Vtt.        |
#'    |scc      |character |Scc.        |
#'    |srt      |character |Srt.        |
#'
#'    **playlist**
#'
#'
#'    |col_name |types     |description |
#'    |:--------|:---------|:-----------|
#'    |gi       |character |Gi.         |
#'    |ei       |integer   |Ei.         |
#'    |y        |integer   |Y.          |
#'    |m        |character |M.          |
#'    |d        |character |D.          |
#'    |gc       |character |Gc.         |
#'    |p        |integer   |P.          |
#'    |dsc      |character |Dsc.        |
#'    |ha       |character |Ha.         |
#'    |hid      |integer   |Hid.        |
#'    |va       |character |Va.         |
#'    |vid      |integer   |Vid.        |
#'    |hpb      |integer   |Hpb.        |
#'    |hpa      |integer   |Hpa.        |
#'    |vpb      |integer   |Vpb.        |
#'    |vpa      |integer   |Vpa.        |
#'    |pta      |integer   |Pta.        |
#'
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows as_tibble
#' @import rvest
#' @keywords internal
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

  .args <- .capture_args()

  lifecycle::deprecate_stop(
    when = "3.0.0",
    what = "wnba_videodetailsasset()",
    with = "wnba_videoevents()"
  )
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
#'    |col_name |types     |description |
#'    |:--------|:---------|:-----------|
#'    |uuid     |character |Uuid.       |
#'    |dur      |logical   |Dur.        |
#'    |stt      |logical   |Stt.        |
#'    |stp      |logical   |Stp.        |
#'    |sth      |logical   |Sth.        |
#'    |stw      |logical   |Stw.        |
#'    |mtt      |logical   |Mtt.        |
#'    |mtp      |logical   |Mtp.        |
#'    |mth      |logical   |Mth.        |
#'    |mtw      |logical   |Mtw.        |
#'    |ltt      |logical   |Ltt.        |
#'    |ltp      |logical   |Ltp.        |
#'    |lth      |logical   |Lth.        |
#'    |ltw      |logical   |Ltw.        |
#'
#'    **playlist**
#'
#'
#'    |col_name |types     |description |
#'    |:--------|:---------|:-----------|
#'    |gi       |character |Gi.         |
#'    |ei       |integer   |Ei.         |
#'    |y        |integer   |Y.          |
#'    |m        |character |M.          |
#'    |d        |character |D.          |
#'    |gc       |character |Gc.         |
#'    |p        |integer   |P.          |
#'    |dsc      |character |Dsc.        |
#'    |ha       |character |Ha.         |
#'    |va       |character |Va.         |
#'    |hpb      |integer   |Hpb.        |
#'    |hpa      |integer   |Hpa.        |
#'    |vpb      |integer   |Vpb.        |
#'    |vpa      |integer   |Vpa.        |
#'    |pta      |integer   |Pta.        |
#'
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows as_tibble
#' @import rvest
#' @keywords internal
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

  .args <- .capture_args()

  lifecycle::deprecate_stop(
    when = "3.0.0",
    what = "wnba_videodetails()",
    with = "wnba_videoevents()"
  )
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
#' (Possibly Defunct)
#' ```r
#'   wnba_videoevents(game_id = '1022200075', game_event_id = '10')
#' ```
wnba_videoevents <- function(
    game_id = '1022200075',
    game_event_id = '10',
    ...){
  .args <- mget(setdiff(names(formals()), "..."))

  lifecycle::deprecate_warn(
    when = "3.0.0",
    what = "wnba_videoevents()",
    details = "The videoevents endpoint returns HTTP 200 but zero rows for known games/events (2026-08-23 probe sweep, wehoop#75). The endpoint no longer serves WNBA data; no replacement exists. This is a soft warning -- the call still proceeds."
  )

  version <- "videoevents"
  endpoint <- wnba_endpoint(version)
  full_url <- endpoint
  
  params <- list(
    GameID = game_id,
    GameEventID = game_event_id
  )
  
  df_list <- list()

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
    error = function(e) .report_api_error(
      e,
      hint = "Invalid arguments or no video events data for {game_id} available!",
      args = .args
    ),
    warning = function(w) .report_api_warning(w, args = .args),
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
#'    |col_name                  |types     |description                                            |
#'    |:-------------------------|:---------|:------------------------------------------------------|
#'    |GAME_ID                   |character |Unique game identifier.                                |
#'    |GAME_DATE                 |character |Game date (YYYY-MM-DD).                                |
#'    |VISITOR_TEAM_ID           |character |Unique identifier for visitor team.                    |
#'    |VISITOR_TEAM_CITY         |character |                                                       |
#'    |VISITOR_TEAM_NAME         |character |                                                       |
#'    |VISITOR_TEAM_ABBREVIATION |character |                                                       |
#'    |HOME_TEAM_ID              |character |Unique identifier for the home team.                   |
#'    |HOME_TEAM_CITY            |character |Home team city / location.                             |
#'    |HOME_TEAM_NAME            |character |Home team name.                                        |
#'    |HOME_TEAM_ABBREVIATION    |character |                                                       |
#'    |GAME_STATUS               |character |Game status label.                                     |
#'    |GAME_STATUS_TEXT          |character |Game status display text (e.g. 'Final', '4:32 - 4th'). |
#'    |IS_AVAILABLE              |character |                                                       |
#'    |PT_XYZ_AVAILABLE          |character |                                                       |
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
  .args <- mget(setdiff(names(formals()), "..."))
  
  version <- "videostatus"
  endpoint <- wnba_endpoint(version)
  full_url <- endpoint
  
  params <- list(
    GameDate = game_date,
    LeagueID = league_id
  )
  
  df_list <- list()

  tryCatch(
    expr = {
      
      resp <- request_with_proxy(url = full_url, params = params, ...)
      
      df_list <- wnba_stats_map_result_sets(resp)
      
    },
    error = function(e) .report_api_error(
      e,
      hint = "Invalid arguments or no video status data for {game_date} available!",
      args = .args
    ),
    warning = function(w) .report_api_warning(w, args = .args),
    finally = {
    }
  )
  return(df_list)
}
