## Player Dashboard parameters are the same

#' **Get WNBA Stats API Player Dashboard by Clutch Splits**
#' @name pbyclutch
NULL
#' @title
#' **Get WNBA Stats API Player Dashboard by Clutch Splits**
#' @rdname pbyclutch
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
#' @param po_round po_round
#' @param pace_adjust pace_adjust
#' @param per_mode per_mode
#' @param period period
#' @param player_id player_id
#' @param plus_minus plus_minus
#' @param rank rank
#' @param season season
#' @param season_segment season_segment
#' @param season_type season_type
#' @param shot_clock_range shot_clock_range
#' @param vs_conference vs_conference
#' @param vs_division vs_division
#' @param ... Additional arguments passed to an underlying function like httr.
#' @return Return a named list of data frames: Last10Sec3Point2PlayerDashboard, Last10Sec3PointPlayerDashboard, Last1Min5PointPlayerDashboard,
#' Last1MinPlusMinus5PointPlayerDashboard, Last30Sec3Point2PlayerDashboard, Last30Sec3PointPlayerDashboard, Last3Min5PointPlayerDashboard,
#' Last3MinPlusMinus5PointPlayerDashboard, Last5Min5PointPlayerDashboard, Last5MinPlusMinus5PointPlayerDashboard,
#' OverallPlayerDashboard
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows as_tibble
#' @import rvest
#' @export
wnba_playerdashboardbyclutch <- function(
    date_from = '',
    date_to = '',
    game_segment = '',
    last_n_games=0,
    league_id='10',
    location='',
    measure_type='Base',
    month=0,
    opponent_team_id=0,
    outcome='',
    po_round='',
    pace_adjust='N',
    per_mode='Totals',
    period=0,
    player_id='202250',
    plus_minus = 'N',
    rank = 'N',
    season='2022',
    season_segment='',
    season_type='Regular Season',
    shot_clock_range='',
    vs_conference='',
    vs_division='',
    ...){
  season_type <- gsub(' ','+',season_type)
  version <- "playerdashboardbyclutch"
  endpoint <- wnba_endpoint(version)
  
  full_url <- paste0(endpoint,
                     "?DateFrom=", date_from,
                     "&DateTo=", date_to,
                     "&GameSegment=", game_segment,
                     "&LastNGames=", last_n_games,
                     "&LeagueID=", league_id,
                     "&Location=", location,
                     "&MeasureType=", measure_type,
                     "&Month=", month,
                     "&OpponentTeamID=", opponent_team_id,
                     "&Outcome=", outcome,
                     "&PaceAdjust=", pace_adjust,
                     "&PORound=", po_round,
                     "&PerMode=", per_mode,
                     "&Period=", period,
                     "&PlayerID=",player_id,
                     "&PlusMinus=", plus_minus,
                     "&Rank=", rank,
                     "&Season=", season,
                     "&SeasonSegment=", season_segment,
                     "&SeasonType=", season_type,
                     "&ShotClockRange=",shot_clock_range,
                     "&VsConference=", vs_conference,
                     "&VsDivision=", vs_division)
  
  tryCatch(
    expr = {
      resp <- request_with_proxy(url = full_url, ...)
      
      
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
      message(glue::glue("{Sys.time()}: Invalid arguments or player dashboard by clutch splits data available for {player_id}!"))
    },
    warning = function(w) {
    },
    finally = {
    }
  )
  return(df_list)
}


#' **Get WNBA Stats API Player Dashboard by Game Splits**
#' @name pbygamesplits
NULL
#' @title
#' **Get WNBA Stats API Player Dashboard by Game Splits**
#' @rdname pbygamesplits
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
#' @param po_round po_round
#' @param pace_adjust pace_adjust
#' @param per_mode per_mode
#' @param period period
#' @param player_id player_id
#' @param plus_minus plus_minus
#' @param rank rank
#' @param season season
#' @param season_segment season_segment
#' @param season_type season_type
#' @param shot_clock_range shot_clock_range
#' @param vs_conference vs_conference
#' @param vs_division vs_division
#' @param ... Additional arguments passed to an underlying function like httr.
#' @return Return a named list of data frames: ByActualMarginPlayerDashboard, ByHalfPlayerDashboard, ByPeriodPlayerDashboard, ByScoreMarginPlayerDashboard, OverallPlayerDashboard
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows as_tibble
#' @import rvest
#' @export
wnba_playerdashboardbygamesplits <- function(
    date_from = '',
    date_to = '',
    game_segment = '',
    last_n_games=0,
    league_id='10',
    location='',
    measure_type='Base',
    month=0,
    opponent_team_id=0,
    outcome='',
    po_round='',
    pace_adjust='N',
    per_mode='Totals',
    period=0,
    player_id='202250',
    plus_minus = 'N',
    rank = 'N',
    season='2022',
    season_segment='',
    season_type='Regular Season',
    shot_clock_range='',
    vs_conference='',
    vs_division='',
    ...){
  season_type <- gsub(' ','+',season_type)
  version <- "playerdashboardbygamesplits"
  endpoint <- wnba_endpoint(version)
  
  full_url <- paste0(endpoint,
                     "?DateFrom=", date_from,
                     "&DateTo=", date_to,
                     "&GameSegment=", game_segment,
                     "&LastNGames=", last_n_games,
                     "&LeagueID=", league_id,
                     "&Location=", location,
                     "&MeasureType=", measure_type,
                     "&Month=", month,
                     "&OpponentTeamID=", opponent_team_id,
                     "&Outcome=", outcome,
                     "&PaceAdjust=", pace_adjust,
                     "&PORound=", po_round,
                     "&PerMode=", per_mode,
                     "&Period=", period,
                     "&PlayerID=",player_id,
                     "&PlusMinus=", plus_minus,
                     "&Rank=", rank,
                     "&Season=", season,
                     "&SeasonSegment=", season_segment,
                     "&SeasonType=", season_type,
                     "&ShotClockRange=",shot_clock_range,
                     "&VsConference=", vs_conference,
                     "&VsDivision=", vs_division)
  
  tryCatch(
    expr = {
      resp <- request_with_proxy(url = full_url, ...)
      
      
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
      message(glue::glue("{Sys.time()}: Invalid arguments or player dashboard by game splits data available for {player_id}!"))
    },
    warning = function(w) {
    },
    finally = {
    }
  )
  return(df_list)
}



#' **Get WNBA Stats API Player Dashboard by General Splits**
#' @name pbygeneralsplits
NULL
#' @title
#' **Get WNBA Stats API Player Dashboard by General Splits**
#' @rdname pbygeneralsplits
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
#' @param po_round po_round
#' @param pace_adjust pace_adjust
#' @param per_mode per_mode
#' @param period period
#' @param player_id player_id
#' @param plus_minus plus_minus
#' @param rank rank
#' @param season season
#' @param season_segment season_segment
#' @param season_type season_type
#' @param shot_clock_range shot_clock_range
#' @param vs_conference vs_conference
#' @param vs_division vs_division
#' @param ... Additional arguments passed to an underlying function like httr.
#' @return Return a named list of data frames: DaysRestPlayerDashboard, LocationPlayerDashboard, MonthPlayerDashboard, OverallPlayerDashboard, PrePostAllStarPlayerDashboard,
#' StartingPosition, WinsLossesPlayerDashboard
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows as_tibble
#' @import rvest
#' @export
wnba_playerdashboardbygeneralsplits <- function(
    date_from = '',
    date_to = '',
    game_segment = '',
    last_n_games=0,
    league_id='10',
    location='',
    measure_type='Base',
    month=0,
    opponent_team_id=0,
    outcome='',
    po_round='',
    pace_adjust='N',
    per_mode='Totals',
    period=0,
    player_id='202250',
    plus_minus = 'N',
    rank = 'N',
    season='2022',
    season_segment='',
    season_type='Regular Season',
    shot_clock_range='',
    vs_conference='',
    vs_division='',
    ...){
  season_type <- gsub(' ','+',season_type)
  version <- "playerdashboardbygeneralsplits"
  endpoint <- wnba_endpoint(version)
  
  full_url <- paste0(endpoint,
                     "?DateFrom=", date_from,
                     "&DateTo=", date_to,
                     "&GameSegment=", game_segment,
                     "&LastNGames=", last_n_games,
                     "&LeagueID=", league_id,
                     "&Location=", location,
                     "&MeasureType=", measure_type,
                     "&Month=", month,
                     "&OpponentTeamID=", opponent_team_id,
                     "&Outcome=", outcome,
                     "&PaceAdjust=", pace_adjust,
                     "&PORound=", po_round,
                     "&PerMode=", per_mode,
                     "&Period=", period,
                     "&PlayerID=",player_id,
                     "&PlusMinus=", plus_minus,
                     "&Rank=", rank,
                     "&Season=", season,
                     "&SeasonSegment=", season_segment,
                     "&SeasonType=", season_type,
                     "&ShotClockRange=",shot_clock_range,
                     "&VsConference=", vs_conference,
                     "&VsDivision=", vs_division)
  
  tryCatch(
    expr = {
      resp <- request_with_proxy(url = full_url, ...)
      
      
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
      message(glue::glue("{Sys.time()}: Invalid arguments or no player dashboard by general splits data available for {player_id}!"))
    },
    warning = function(w) {
    },
    finally = {
    }
  )
  return(df_list)
}



#' **Get WNBA Stats API Player Dashboard by Last N Games**
#' @name pbylastngames
NULL
#' @title
#' **Get WNBA Stats API Player Dashboard by Last N Games**
#' @rdname pbylastngames
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
#' @param po_round po_round
#' @param pace_adjust pace_adjust
#' @param per_mode per_mode
#' @param period period
#' @param player_id player_id
#' @param plus_minus plus_minus
#' @param rank rank
#' @param season season
#' @param season_segment season_segment
#' @param season_type season_type
#' @param shot_clock_range shot_clock_range
#' @param vs_conference vs_conference
#' @param vs_division vs_division
#' @param ... Additional arguments passed to an underlying function like httr.
#' @return Return a named list of data frames: GameNumberPlayerDashboard, Last10PlayerDashboard, Last15PlayerDashboard, Last20PlayerDashboard,
#' Last5PlayerDashboard, OverallPlayerDashboard
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows as_tibble
#' @import rvest
#' @export
wnba_playerdashboardbylastngames <- function(
    date_from = '',
    date_to = '',
    game_segment = '',
    last_n_games=0,
    league_id='10',
    location='',
    measure_type='Base',
    month=0,
    opponent_team_id=0,
    outcome='',
    po_round='',
    pace_adjust='N',
    per_mode='Totals',
    period=0,
    player_id='202250',
    plus_minus = 'N',
    rank = 'N',
    season='2022',
    season_segment='',
    season_type='Regular Season',
    shot_clock_range='',
    vs_conference='',
    vs_division='',
    ...){
  season_type <- gsub(' ','+',season_type)
  version <- "playerdashboardbylastngames"
  endpoint <- wnba_endpoint(version)
  
  full_url <- paste0(endpoint,
                     "?DateFrom=", date_from,
                     "&DateTo=", date_to,
                     "&GameSegment=", game_segment,
                     "&LastNGames=", last_n_games,
                     "&LeagueID=", league_id,
                     "&Location=", location,
                     "&MeasureType=", measure_type,
                     "&Month=", month,
                     "&OpponentTeamID=", opponent_team_id,
                     "&Outcome=", outcome,
                     "&PaceAdjust=", pace_adjust,
                     "&PORound=", po_round,
                     "&PerMode=", per_mode,
                     "&Period=", period,
                     "&PlayerID=",player_id,
                     "&PlusMinus=", plus_minus,
                     "&Rank=", rank,
                     "&Season=", season,
                     "&SeasonSegment=", season_segment,
                     "&SeasonType=", season_type,
                     "&ShotClockRange=",shot_clock_range,
                     "&VsConference=", vs_conference,
                     "&VsDivision=", vs_division)
  tryCatch(
    expr = {
      resp <- request_with_proxy(url = full_url, ...)
      
      
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
      message(glue::glue("{Sys.time()}: Invalid arguments or no player dashboard by last n games data available for {player_id}!"))
    },
    warning = function(w) {
    },
    finally = {
    }
  )
  return(df_list)
}



#' **Get WNBA Stats API Player Dashboard by Opponent**
#' @name pbyopponent
NULL
#' @title
#' **Get WNBA Stats API Player Dashboard by Opponent**
#' @rdname pbyopponent
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
#' @param po_round po_round
#' @param pace_adjust pace_adjust
#' @param per_mode per_mode
#' @param period period
#' @param player_id player_id
#' @param plus_minus plus_minus
#' @param rank rank
#' @param season season
#' @param season_segment season_segment
#' @param season_type season_type
#' @param shot_clock_range shot_clock_range
#' @param vs_conference vs_conference
#' @param vs_division vs_division
#' @param ... Additional arguments passed to an underlying function like httr.
#' @return Return a named list of data frames: ConferencePlayerDashboard, DivisionPlayerDashboard, OpponentPlayerDashboard, OverallPlayerDashboard
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows as_tibble
#' @import rvest
#' @export
wnba_playerdashboardbyopponent <- function(
    date_from = '',
    date_to = '',
    game_segment = '',
    last_n_games=0,
    league_id='10',
    location='',
    measure_type='Base',
    month=0,
    opponent_team_id=0,
    outcome='',
    po_round='',
    pace_adjust='N',
    per_mode='Totals',
    period=0,
    player_id='202250',
    plus_minus = 'N',
    rank = 'N',
    season='2022',
    season_segment='',
    season_type='Regular Season',
    shot_clock_range='',
    vs_conference='',
    vs_division='',
    ...){
  season_type <- gsub(' ','+',season_type)
  version <- "playerdashboardbyopponent"
  endpoint <- wnba_endpoint(version)
  
  full_url <- paste0(endpoint,
                     "?DateFrom=", date_from,
                     "&DateTo=", date_to,
                     "&GameSegment=", game_segment,
                     "&LastNGames=", last_n_games,
                     "&LeagueID=", league_id,
                     "&Location=", location,
                     "&MeasureType=", measure_type,
                     "&Month=", month,
                     "&OpponentTeamID=", opponent_team_id,
                     "&Outcome=", outcome,
                     "&PaceAdjust=", pace_adjust,
                     "&PORound=", po_round,
                     "&PerMode=", per_mode,
                     "&Period=", period,
                     "&PlayerID=",player_id,
                     "&PlusMinus=", plus_minus,
                     "&Rank=", rank,
                     "&Season=", season,
                     "&SeasonSegment=", season_segment,
                     "&SeasonType=", season_type,
                     "&ShotClockRange=",shot_clock_range,
                     "&VsConference=", vs_conference,
                     "&VsDivision=", vs_division)
  tryCatch(
    expr = {
      resp <- request_with_proxy(url = full_url, ...)
      
      
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
      message(glue::glue("{Sys.time()}: Invalid arguments or no player dashboard by opponent data available for {player_id}!"))
    },
    warning = function(w) {
    },
    finally = {
    }
  )
  return(df_list)
}


#' **Get WNBA Stats API Player Dashboard by Shooting Splits**
#' @name pbyshootingsplits
NULL
#' @title
#' **Get WNBA Stats API Player Dashboard by Shooting Splits**
#' @rdname pbyshootingsplits
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
#' @param po_round po_round
#' @param pace_adjust pace_adjust
#' @param per_mode per_mode
#' @param period period
#' @param player_id player_id
#' @param plus_minus plus_minus
#' @param rank rank
#' @param season season
#' @param season_segment season_segment
#' @param season_type season_type
#' @param shot_clock_range shot_clock_range
#' @param vs_conference vs_conference
#' @param vs_division vs_division
#' @param ... Additional arguments passed to an underlying function like httr.
#' @return Return a named list of data frames: AssistedBy, AssitedShotPlayerDashboard, OverallPlayerDashboard,
#' Shot5FTPlayerDashboard, Shot8FTPlayerDashboard, ShotAreaPlayerDashboard, ShotTypePlayerDashboard, ShotTypeSummaryPlayerDashboard
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows as_tibble
#' @import rvest
#' @export
wnba_playerdashboardbyshootingsplits <- function(
    date_from = '',
    date_to = '',
    game_segment = '',
    last_n_games=0,
    league_id='10',
    location='',
    measure_type='Base',
    month=0,
    opponent_team_id=0,
    outcome='',
    po_round='',
    pace_adjust='N',
    per_mode='Totals',
    period=0,
    player_id='202250',
    plus_minus = 'N',
    rank = 'N',
    season='2022',
    season_segment='',
    season_type='Regular Season',
    shot_clock_range='',
    vs_conference='',
    vs_division='',
    ...){
  season_type <- gsub(' ','+',season_type)
  version <- "playerdashboardbyshootingsplits"
  endpoint <- wnba_endpoint(version)
  
  full_url <- paste0(endpoint,
                     "?DateFrom=", date_from,
                     "&DateTo=", date_to,
                     "&GameSegment=", game_segment,
                     "&LastNGames=", last_n_games,
                     "&LeagueID=", league_id,
                     "&Location=", location,
                     "&MeasureType=", measure_type,
                     "&Month=", month,
                     "&OpponentTeamID=", opponent_team_id,
                     "&Outcome=", outcome,
                     "&PaceAdjust=", pace_adjust,
                     "&PORound=", po_round,
                     "&PerMode=", per_mode,
                     "&Period=", period,
                     "&PlayerID=",player_id,
                     "&PlusMinus=", plus_minus,
                     "&Rank=", rank,
                     "&Season=", season,
                     "&SeasonSegment=", season_segment,
                     "&SeasonType=", season_type,
                     "&ShotClockRange=",shot_clock_range,
                     "&VsConference=", vs_conference,
                     "&VsDivision=", vs_division)
  tryCatch(
    expr = {
      resp <- request_with_proxy(url = full_url, ...)
      
      
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
      message(glue::glue("{Sys.time()}: Invalid arguments or no player dashboard by shooting splits data available for {player_id}!"))
    },
    warning = function(w) {
    },
    finally = {
    }
  )
  return(df_list)
}


#' **Get WNBA Stats API Player Dashboard by Team Performance**
#' @name pbyteamperformance
NULL
#' @title
#' **Get WNBA Stats API Player Dashboard by Team Performance**
#' @rdname pbyteamperformance
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
#' @param po_round po_round
#' @param pace_adjust pace_adjust
#' @param per_mode per_mode
#' @param period period
#' @param player_id player_id
#' @param plus_minus plus_minus
#' @param rank rank
#' @param season season
#' @param season_segment season_segment
#' @param season_type season_type
#' @param shot_clock_range shot_clock_range
#' @param vs_conference vs_conference
#' @param vs_division vs_division
#' @param ... Additional arguments passed to an underlying function like httr.
#' @return Return a named list of data frames: OverallPlayerDashboard, PointsScoredPlayerDashboard, PontsAgainstPlayerDashboard,
#' ScoreDifferentialPlayerDashboard
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows as_tibble
#' @import rvest
#' @export
wnba_playerdashboardbyteamperformance <- function(
    date_from = '',
    date_to = '',
    game_segment = '',
    last_n_games=0,
    league_id='10',
    location='',
    measure_type='Base',
    month=0,
    opponent_team_id=0,
    outcome='',
    po_round='',
    pace_adjust='N',
    per_mode='Totals',
    period=0,
    player_id='202250',
    plus_minus = 'N',
    rank = 'N',
    season='2022',
    season_segment='',
    season_type='Regular Season',
    shot_clock_range='',
    vs_conference='',
    vs_division='',
    ...){
  season_type <- gsub(' ','+',season_type)
  version <- "playerdashboardbyteamperformance"
  endpoint <- wnba_endpoint(version)
  
  full_url <- paste0(endpoint,
                     "?DateFrom=", date_from,
                     "&DateTo=", date_to,
                     "&GameSegment=", game_segment,
                     "&LastNGames=", last_n_games,
                     "&LeagueID=", league_id,
                     "&Location=", location,
                     "&MeasureType=", measure_type,
                     "&Month=", month,
                     "&OpponentTeamID=", opponent_team_id,
                     "&Outcome=", outcome,
                     "&PaceAdjust=", pace_adjust,
                     "&PORound=", po_round,
                     "&PerMode=", per_mode,
                     "&Period=", period,
                     "&PlayerID=",player_id,
                     "&PlusMinus=", plus_minus,
                     "&Rank=", rank,
                     "&Season=", season,
                     "&SeasonSegment=", season_segment,
                     "&SeasonType=", season_type,
                     "&ShotClockRange=",shot_clock_range,
                     "&VsConference=", vs_conference,
                     "&VsDivision=", vs_division)
  tryCatch(
    expr = {
      resp <- request_with_proxy(url = full_url, ...)
      
      
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
      message(glue::glue("{Sys.time()}: Invalid arguments or no player dashboard by team performance data available for {player_id}!"))
    },
    warning = function(w) {
    },
    finally = {
    }
  )
  return(df_list)
}


#' **Get WNBA Stats API Player Dashboard Year over Year**
#' @name pbyyearoveryear
NULL
#' @title
#' **Get WNBA Stats API Player Dashboard Year over Year**
#' @rdname pbyyearoveryear
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
#' @param po_round po_round
#' @param pace_adjust pace_adjust
#' @param per_mode per_mode
#' @param period period
#' @param player_id player_id
#' @param plus_minus plus_minus
#' @param rank rank
#' @param season season
#' @param season_segment season_segment
#' @param season_type season_type
#' @param shot_clock_range shot_clock_range
#' @param vs_conference vs_conference
#' @param vs_division vs_division
#' @param ... Additional arguments passed to an underlying function like httr.
#' @return Return a named list of data frames: ByYearPlayerDashboard, OverallPlayerDashboard
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows as_tibble
#' @import rvest
#' @export
wnba_playerdashboardbyyearoveryear <- function(
    date_from = '',
    date_to = '',
    game_segment = '',
    last_n_games=0,
    league_id='10',
    location='',
    measure_type='Base',
    month=0,
    opponent_team_id=0,
    outcome='',
    po_round='',
    pace_adjust='N',
    per_mode='Totals',
    period=0,
    player_id='202250',
    plus_minus = 'N',
    rank = 'N',
    season='2022',
    season_segment='',
    season_type='Regular Season',
    shot_clock_range='',
    vs_conference='',
    vs_division='',
    ...){
  season_type <- gsub(' ','+',season_type)
  version <- "playerdashboardbyyearoveryear"
  endpoint <- wnba_endpoint(version)
  
  full_url <- paste0(endpoint,
                     "?DateFrom=", date_from,
                     "&DateTo=", date_to,
                     "&GameSegment=", game_segment,
                     "&LastNGames=", last_n_games,
                     "&LeagueID=", league_id,
                     "&Location=", location,
                     "&MeasureType=", measure_type,
                     "&Month=", month,
                     "&OpponentTeamID=", opponent_team_id,
                     "&Outcome=", outcome,
                     "&PaceAdjust=", pace_adjust,
                     "&PORound=", po_round,
                     "&PerMode=", per_mode,
                     "&Period=", period,
                     "&PlayerID=",player_id,
                     "&PlusMinus=", plus_minus,
                     "&Rank=", rank,
                     "&Season=", season,
                     "&SeasonSegment=", season_segment,
                     "&SeasonType=", season_type,
                     "&ShotClockRange=",shot_clock_range,
                     "&VsConference=", vs_conference,
                     "&VsDivision=", vs_division)
  
  tryCatch(
    expr = {
      resp <- request_with_proxy(url = full_url, ...)
      
      
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
      message(glue::glue("{Sys.time()}: Invalid arguments or no player dashboard year-over-year data available for {player_id}!"))
    },
    warning = function(w) {
    },
    finally = {
    }
  )
  return(df_list)
}
