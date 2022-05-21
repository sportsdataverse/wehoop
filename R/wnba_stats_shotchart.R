#' **Get WNBA Stats API Shot Chart Detail**
#' @name sc
NULL
#' @title
#' **Get WNBA Stats API Shot Chart Detail**
#' @rdname sc
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
#' @param group_id_2 group_id_2
#' @param group_mode group_mode
#' @param group_quantity group_quantity
#' @param last_n_games last_n_games
#' @param league_id league_id
#' @param location location
#' @param month month
#' @param on_off on_off
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
#' @return Return a named list of data frames: LeagueAverages, Shot_Chart_Detail
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows as_tibble
#' @import rvest
#' @export
wnba_shotchartdetail <- function(
  ahead_behind='',
  cfid='33',
  cfparams='2022',
  clutch_time='',
  conference='',
  context_filter='',
  context_measure='FGA',
  date_from='',
  date_to='',
  division='',
  end_period='10',
  end_range='24000',
  group_id='',
  game_event_id='',
  game_id='',
  game_segment='',
  group_id_2='',
  group_mode='',
  group_quantity='5',
  last_n_games='0',
  league_id='10',
  location='',
  month='0',
  on_off='',
  opponent_team_id='0',
  outcome='',
  po_round='0',
  period='0',
  player_id='202250',
  player_id1='',
  player_id2='',
  player_id3='',
  player_id4='',
  player_id5='',
  player_position='',
  point_diff='',
  position='',
  range_type='0',
  rookie_year='',
  season='2022',
  season_segment='',
  season_type='Regular Season',
  shot_clock_range='',
  start_period='1',
  start_range='0',
  starter_bench='',
  team_id='0',
  vs_conference='',
  vs_division='',
  vs_player_id1='',
  vs_player_id2='',
  vs_player_id3='',
  vs_player_id4='',
  vs_player_id5='',
  vs_team_id=''){
  
  
  season_type <- gsub(' ','+',season_type)
  version <- "shotchartdetail"
  endpoint <- wnba_endpoint(version)
  
  full_url <- paste0(endpoint,
    "?AheadBehind=", ahead_behind, 
    "&CFID=", cfid,
    "&CFPARAMS=", cfparams,
    "&ClutchTime=", clutch_time, 
    "&Conference=", conference, 
    "&ContextFilter=", context_filter, 
    "&ContextMeasure=", context_measure,
    "&DateFrom=", date_from, 
    "&DateTo=", date_to, 
    "&Division=", division, 
    "&EndPeriod=", end_period,
    "&EndRange=", end_range, 
    "&GROUP_ID=", group_id, 
    "&GameEventID=", game_event_id, 
    "&GameID=", game_id, 
    "&GameSegment=", game_segment, 
    "&GroupID=", group_id_2, 
    "&GroupMode=", group_mode, 
    "&GroupQuantity=", group_quantity,
    "&LastNGames=", last_n_games, 
    "&LeagueID=", league_id, 
    "&Location=", location, 
    "&Month=", month, 
    "&OnOff=", on_off, 
    "&OpponentTeamID=", opponent_team_id, 
    "&Outcome=", outcome, 
    "&PORound=", po_round, 
    "&Period=", period, 
    "&PlayerID=", player_id, 
    "&PlayerID1=", player_id1, 
    "&PlayerID2=", player_id2, 
    "&PlayerID3=", player_id3, 
    "&PlayerID4=", player_id4, 
    "&PlayerID5=", player_id5, 
    "&PlayerPosition=", player_position, 
    "&PointDiff=", point_diff, 
    "&Position=", position, 
    "&RangeType=", range_type, 
    "&RookieYear=", rookie_year, 
    "&Season=", season, 
    "&SeasonSegment=", season_segment, 
    "&SeasonType=", season_type, 
    "&ShotClockRange=", shot_clock_range, 
    "&StartPeriod=", start_period, 
    "&StartRange=", start_range, 
    "&StarterBench=", starter_bench, 
    "&TeamID=", team_id, 
    "&VsConference=", vs_conference, 
    "&VsDivision=", vs_division, 
    "&VsPlayerID1=", vs_player_id1, 
    "&VsPlayerID2=", vs_player_id2, 
    "&VsPlayerID3=", vs_player_id3, 
    "&VsPlayerID4=", vs_player_id4, 
    "&VsPlayerID5=", vs_player_id5, 
    "&VsTeamID=", vs_team_id 
  )
  
  tryCatch(
    expr = {
      headers <- c(
        `Host` = 'stats.wnba.com',
        `User-Agent` = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36',
        `Accept` = 'application/json, text/plain, */*',
        `Accept-Language` = 'en-US,en;q=0.5',
        `Accept-Encoding` = 'gzip, deflate, br',
        `x-nba-stats-origin` = 'stats',
        `x-nba-stats-token` = 'true',
        `Connection` = 'keep-alive',
        `Origin` = "http://stats.wnba.com",
        `Referer` = 'https://stats.wnba.com/events',
        `Pragma` = 'no-cache',
        `Cache-Control` = 'no-cache'
      )
      
      res <-
        httr::RETRY("GET", full_url,
                    httr::add_headers(.headers = headers))
      resp <- res$content %>%
        rawToChar() %>%
        jsonlite::fromJSON(simplifyVector = T)
      
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
      message(glue::glue("{Sys.time()}: Invalid arguments or no shot chart detail data for {player_id} available!"))
    },
    warning = function(w) {
    },
    finally = {
    }
  )
  return(df_list)
}


#' **Get WNBA Stats API Shot Chart League-Wide**
#' @name sc_lw
NULL
#' @title
#' **Get WNBA Stats API Shot Chart League-Wide**
#' @rdname sc_lw
#' @author Saiem Gilani
#' @param league_id League - default: '00'. Other options include '10': WWNBA, '20': G-League
#' @param season season
#' @return Return a named list of data frames: League_Wide
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows as_tibble
#' @import rvest
#' @export
wnba_shotchartleaguewide <- function(
  league_id='10',
  season='2022'){
  
  version <- "shotchartleaguewide"
  endpoint <- wnba_endpoint(version)
  
  full_url <- paste0(endpoint,
                     "?LeagueID=", league_id,
                     "&Season=", season)
  
  tryCatch(
    expr = {
      resp <- full_url %>%
        .wnba_headers()
      
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
      message(glue::glue("{Sys.time()}: Invalid arguments or no league-wide shot chart data for {season} available!"))
    },
    warning = function(w) {
    },
    finally = {
    }
  )
  return(df_list)
}
