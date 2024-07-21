#' **Get WNBA Stats API All-time Leaders Grid**
#' @name wnba_alltimeleadersgrids
NULL
#' @title
#' **Get WNBA Stats API All-time Leaders Grid**
#' @rdname wnba_alltimeleadersgrids
#' @author Saiem Gilani
#' @param season_type Season Type - Regular Season, Playoffs, All-Star
#' @param per_mode Per Mode - PerGame, Totals
#' @param league_id League - default: '00'. Other options include '10': WWNBA, '20': G-League
#' @param top_x Top X
#' @param ... Additional arguments passed to an underlying function like httr.
#' @return Returns a named list of data frames: ASTLeaders, BLKLeaders, DREBLeaders,
#'   FG3ALeaders, FG3MLeaders, FG3_PCTLeaders, FGALeaders, FGMLeaders,
#'   FG_PCTLeaders, FTALeaders, FTMLeaders, FT_PCTLeaders, GPLeaders, 
#'   OREBLeaders, PFLeaders, PTSLeaders, REBLeaders, STLLeaders, TOVLeaders
#'   
#'    **GPLeaders** 
#'    
#'    
#'    |col_name       |types     |
#'    |:--------------|:---------|
#'    |PLAYER_ID      |character |
#'    |PLAYER_NAME    |character |
#'    |GP             |character |
#'    |GP_RANK        |character |
#'    |IS_ACTIVE_FLAG |character |
#'    
#'    **PTSLeaders** 
#'    
#'    
#'    |col_name       |types     |
#'    |:--------------|:---------|
#'    |PLAYER_ID      |character |
#'    |PLAYER_NAME    |character |
#'    |PTS            |character |
#'    |PTS_RANK       |character |
#'    |IS_ACTIVE_FLAG |character |
#'    
#'    **ASTLeaders** 
#'    
#'    
#'    |col_name       |types     |
#'    |:--------------|:---------|
#'    |PLAYER_ID      |character |
#'    |PLAYER_NAME    |character |
#'    |AST            |character |
#'    |AST_RANK       |character |
#'    |IS_ACTIVE_FLAG |character |
#'    
#'    **STLLeaders** 
#'    
#'    
#'    |col_name       |types     |
#'    |:--------------|:---------|
#'    |PLAYER_ID      |character |
#'    |PLAYER_NAME    |character |
#'    |STL            |character |
#'    |STL_RANK       |character |
#'    |IS_ACTIVE_FLAG |character |
#'    
#'    **OREBLeaders** 
#'    
#'    
#'    |col_name       |types     |
#'    |:--------------|:---------|
#'    |PLAYER_ID      |character |
#'    |PLAYER_NAME    |character |
#'    |OREB           |character |
#'    |OREB_RANK      |character |
#'    |IS_ACTIVE_FLAG |character |
#'    
#'    **DREBLeaders** 
#'    
#'    
#'    |col_name       |types     |
#'    |:--------------|:---------|
#'    |PLAYER_ID      |character |
#'    |PLAYER_NAME    |character |
#'    |DREB           |character |
#'    |DREB_RANK      |character |
#'    |IS_ACTIVE_FLAG |character |
#'    
#'    **REBLeaders** 
#'    
#'    
#'    |col_name       |types     |
#'    |:--------------|:---------|
#'    |PLAYER_ID      |character |
#'    |PLAYER_NAME    |character |
#'    |REB            |character |
#'    |REB_RANK       |character |
#'    |IS_ACTIVE_FLAG |character |
#'    
#'    **BLKLeaders** 
#'    
#'    
#'    |col_name       |types     |
#'    |:--------------|:---------|
#'    |PLAYER_ID      |character |
#'    |PLAYER_NAME    |character |
#'    |BLK            |character |
#'    |BLK_RANK       |character |
#'    |IS_ACTIVE_FLAG |character |
#'    
#'    **FGMLeaders** 
#'    
#'    
#'    |col_name       |types     |
#'    |:--------------|:---------|
#'    |PLAYER_ID      |character |
#'    |PLAYER_NAME    |character |
#'    |FGM            |character |
#'    |FGM_RANK       |character |
#'    |IS_ACTIVE_FLAG |character |
#'    
#'    **FGALeaders** 
#'    
#'    
#'    |col_name       |types     |
#'    |:--------------|:---------|
#'    |PLAYER_ID      |character |
#'    |PLAYER_NAME    |character |
#'    |FGA            |character |
#'    |FGA_RANK       |character |
#'    |IS_ACTIVE_FLAG |character |
#'    
#'    **FG_PCTLeaders** 
#'    
#'    
#'    |col_name       |types     |
#'    |:--------------|:---------|
#'    |PLAYER_ID      |character |
#'    |PLAYER_NAME    |character |
#'    |FG_PCT         |character |
#'    |FG_PCT_RANK    |character |
#'    |IS_ACTIVE_FLAG |character |
#'    
#'    **TOVLeaders** 
#'    
#'    
#'    |col_name       |types     |
#'    |:--------------|:---------|
#'    |PLAYER_ID      |character |
#'    |PLAYER_NAME    |character |
#'    |TOV            |character |
#'    |TOV_RANK       |character |
#'    |IS_ACTIVE_FLAG |character |
#'    
#'    **FG3MLeaders** 
#'    
#'    
#'    |col_name       |types     |
#'    |:--------------|:---------|
#'    |PLAYER_ID      |character |
#'    |PLAYER_NAME    |character |
#'    |FG3M           |character |
#'    |FG3M_RANK      |character |
#'    |IS_ACTIVE_FLAG |character |
#'    
#'    **FG3ALeaders** 
#'    
#'    
#'    |col_name       |types     |
#'    |:--------------|:---------|
#'    |PLAYER_ID      |character |
#'    |PLAYER_NAME    |character |
#'    |FG3A           |character |
#'    |FG3A_RANK      |character |
#'    |IS_ACTIVE_FLAG |character |
#'    
#'    **FG3_PCTLeaders** 
#'    
#'    
#'    |col_name       |types     |
#'    |:--------------|:---------|
#'    |PLAYER_ID      |character |
#'    |PLAYER_NAME    |character |
#'    |FG3_PCT        |character |
#'    |FG3_PCT_RANK   |character |
#'    |IS_ACTIVE_FLAG |character |
#'    
#'    **PFLeaders** 
#'    
#'    
#'    |col_name       |types     |
#'    |:--------------|:---------|
#'    |PLAYER_ID      |character |
#'    |PLAYER_NAME    |character |
#'    |PF             |character |
#'    |PF_RANK        |character |
#'    |IS_ACTIVE_FLAG |character |
#'    
#'    **FTMLeaders** 
#'    
#'    
#'    |col_name       |types     |
#'    |:--------------|:---------|
#'    |PLAYER_ID      |character |
#'    |PLAYER_NAME    |character |
#'    |FTM            |character |
#'    |FTM_RANK       |character |
#'    |IS_ACTIVE_FLAG |character |
#'    
#'    **FTALeaders** 
#'    
#'    
#'    |col_name       |types     |
#'    |:--------------|:---------|
#'    |PLAYER_ID      |character |
#'    |PLAYER_NAME    |character |
#'    |FTA            |character |
#'    |FTA_RANK       |character |
#'    |IS_ACTIVE_FLAG |character |
#'    
#'    **FT_PCTLeaders** 
#'    
#'    
#'    |col_name       |types     |
#'    |:--------------|:---------|
#'    |PLAYER_ID      |character |
#'    |PLAYER_NAME    |character |
#'    |FT_PCT         |character |
#'    |FT_PCT_RANK    |character |
#'    |IS_ACTIVE_FLAG |character |
#'   
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows as_tibble
#' @import rvest
#' @export
#' @family WNBA Leaders Functions
#' @details
#' ```r
#'   wnba_alltimeleadersgrids(league_id = '10')
#' ```

wnba_alltimeleadersgrids <- function(
    league_id = '10',
    per_mode = 'PerGame',
    season_type = 'Regular Season',
    top_x = 10,
    ...){
  
  # intentional
  # season_type <- gsub(' ', '+', season_type)
  version <- "alltimeleadersgrids"
  endpoint <- wnba_endpoint(version)
  full_url <- endpoint
  
  params <- list(
    LeagueID = league_id,
    PerMode = per_mode,
    SeasonType = season_type,
    TopX = top_x
  )
  
  tryCatch(
    expr = {
      
      resp <- request_with_proxy(url = full_url, params = params, ...)
      
      df_list <- wnba_stats_map_result_sets(resp)
      
    },
    error = function(e) {
      cli::cli_alert_danger("{Sys.time()}: Invalid arguments or no all-time leaders grid data for {league_id} available!")
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


#' **Get WNBA Stats API Assist Leaders**
#' @name wnba_assistleaders
NULL
#' @title
#' **Get WNBA Stats API Assist Leaders**
#' @rdname wnba_assistleaders
#' @author Saiem Gilani
#' @param season Season - format 2020-21
#' @param season_type Season Type - Regular Season, Playoffs, All-Star
#' @param per_mode Per Mode - PerGame, Totals
#' @param player_or_team Player or Team
#' @param league_id League - default: '00'. Other options include '10': WWNBA, '20': G-League
#' @param ... Additional arguments passed to an underlying function like httr.
#' @return Returns a named list of data frames: AssistLeaders
#' 
#'    **AssistLeaders** 
#'    
#'    
#'    |col_name          |types     |
#'    |:-----------------|:---------|
#'    |RANK              |character |
#'    |PLAYER_ID         |character |
#'    |PLAYER            |character |
#'    |TEAM_ID           |character |
#'    |TEAM_ABBREVIATION |character |
#'    |TEAM_NAME         |character |
#'    |JERSEY_NUM        |character |
#'    |PLAYER_POSITION   |character |
#'    |AST               |character |
#' 
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows as_tibble
#' @import rvest
#' @export
#' @family WNBA Leaders Functions
#' @details
#' ```r
#'  wnba_assistleaders(league_id = '10', player_or_team = "Player")
#'  wnba_assistleaders(league_id = '10', player_or_team = "Team")
#' ```
wnba_assistleaders <- function(
    league_id = '10',
    per_mode = 'PerGame',
    player_or_team = 'Team',
    season = most_recent_wnba_season() - 1,
    season_type = 'Regular Season',
    ...){
  
  # Intentional
  # season_type <- gsub(' ','+',season_type)
  version <- "assistleaders"
  endpoint <- wnba_endpoint(version)
  full_url <- endpoint
  
  params <- list(
    LeagueID = league_id,
    PerMode = per_mode,
    PlayerOrTeam = player_or_team,
    Season = season,
    SeasonType = season_type
  )
  
  tryCatch(
    expr = {
      
      resp <- request_with_proxy(url = full_url, params = params, ...)
      
      df_list <- wnba_stats_map_result_sets(resp)
      
    },
    error = function(e) {
      cli::cli_alert_danger("{Sys.time()}: Invalid arguments or no assist leaders data for {season} available!")
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
#' **Get WNBA Stats API Assist Tracker**
#' @name wnba_assisttracker
NULL
#' @title
#' **Get WNBA Stats API Assist Tracker**
#' @rdname wnba_assisttracker
#' @author Saiem Gilani
#' @param season Season - format 2020-21
#' @param season_type Season Type - Regular Season, Playoffs, All-Star
#' @param per_mode Per Mode - PerGame, Totals
#' @param league_id League - default: '00'. Other options include '10': WWNBA, '20': G-League
#' @param ... Additional arguments passed to an underlying function like httr.
#' @return Returns a named list of data frames: AssistTracker
#'  
#'    **AssistTracker** 
#'    
#'    |col_name |types   |
#'    |:--------|:-------|
#'    |ASSISTS  |numeric |
#' 
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows as_tibble
#' @import rvest
#' @export
#' @family WNBA Leaders Functions
#' @details
#' ```r
#'   wnba_assisttracker(league_id = '10')
#' ```
wnba_assisttracker <- function(
    league_id = '10',
    per_mode = 'PerGame',
    season = most_recent_wnba_season() - 1,
    season_type = 'Regular Season',
    ...){
  
  # Intentional
  # season_type <- gsub(' ','+',season_type)
  version <- "assisttracker"
  endpoint <- wnba_endpoint(version)
  full_url <- endpoint
  
  params <- list(
    LeagueID = league_id,
    PerMode = per_mode,
    Season = season,
    SeasonType = season_type)
  
  tryCatch(
    expr = {
      
      resp <- request_with_proxy(url = full_url, params = params, ...)
      
      df_list <- wnba_stats_map_result_sets(resp)
      
    },
    error = function(e) {
      cli::cli_alert_danger("{Sys.time()}: Invalid arguments or no assist tracker data for {season} available!")
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

#' **Get WNBA Stats API Homepage Leaders**
#' @name wnba_homepageleaders
NULL
#' @title
#' **Get WNBA Stats API Homepage Leaders**
#' @rdname wnba_homepageleaders
#' @author Saiem Gilani
#' @param game_scope Game Scope - Season, Last 10, ,Yesterday, Finals
#' @param season Season - format 2020-21
#' @param season_type Season Type - Regular Season, Playoffs
#' @param player_or_team Player or Team
#' @param player_scope Player Scope - All Players, Rookies
#' @param league_id League - default: '00'. Other options include '10': WWNBA, '20': G-League
#' @param stat_category Stat Category: Points, Rebounds, Assists, Defense, Clutch, Playmaking, Efficiency, Fast Break, Scoring Breakdown
#' @param ... Additional arguments passed to an underlying function like httr.
#' @return Returns a named list of data frames: HomePageLeaders, LeagueAverage, LeagueMax
#' 
#'    **HomePageLeaders** 
#'    
#'    
#'    |col_name          |types     |
#'    |:-----------------|:---------|
#'    |RANK              |character |
#'    |PLAYERID          |character |
#'    |PLAYER            |character |
#'    |TEAM_ID           |character |
#'    |TEAM_ABBREVIATION |character |
#'    |TEAM_NAME         |character |
#'    |PTS               |character |
#'    |FG_PCT            |character |
#'    |FG3_PCT           |character |
#'    |FT_PCT            |character |
#'    |EFG_PCT           |character |
#'    |TS_PCT            |character |
#'    |PTS_PER48         |character |
#'    
#'    **LeagueAverage** 
#'    
#'    
#'    |col_name  |types   |
#'    |:---------|:-------|
#'    |PTS       |numeric |
#'    |FG_PCT    |numeric |
#'    |FG3_PCT   |numeric |
#'    |FT_PCT    |numeric |
#'    |EFG_PCT   |numeric |
#'    |TS_PCT    |numeric |
#'    |PTS_PER48 |numeric |
#'    
#'    **LeagueMax** 
#'    
#'    
#'    |col_name  |types   |
#'    |:---------|:-------|
#'    |PTS       |numeric |
#'    |FG_PCT    |numeric |
#'    |FG3_PCT   |numeric |
#'    |FT_PCT    |numeric |
#'    |EFG_PCT   |numeric |
#'    |TS_PCT    |numeric |
#'    |PTS_PER48 |numeric |
#' 
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows as_tibble
#' @import rvest
#' @keywords internal
#' @export
#' @details
#' ```r
#'   wnba_homepageleaders(league_id = '10', player_or_team = "Player")
#'   wnba_homepageleaders(league_id = '10', player_or_team = "Team")
#' ```
wnba_homepageleaders <- function(
    league_id = '10',
    game_scope = 'Season',
    player_or_team = 'Team',
    player_scope = 'All Players',
    season = most_recent_wnba_season() - 1,
    season_type = 'Regular Season',
    stat_category = 'Points',
    ...){
  
  cli::cli_alert_danger("As of v2.1.0, `wnba_homepageleaders()` is deprecated due to changes from the WNBA Stats API. Please use `wnba_homepagewidget()` instead.")
  
  # player_scope <- gsub(' ','+',player_scope)
  # # Intentional
  # # season_type <- gsub(' ','+',season_type)
  # stat_category <- gsub(' ','+',stat_category)
  # version <- "homepageleaders"
  # endpoint <- wnba_endpoint(version)
  # full_url <- endpoint
  # 
  # params <- list(
  #   GameScope =  game_scope,
  #   LeagueID = league_id,
  #   PlayerOrTeam = player_or_team,
  #   PlayerScope = player_scope,
  #   Season = season,
  #   SeasonType = season_type,
  #   StatCategory = stat_category
  # )
  # 
  # tryCatch(
  #   expr = {
  #     
  #     resp <- request_with_proxy(url = full_url, params = params, ...)
  #     
  #     df_list <- wnba_stats_map_result_sets(resp)
  #     
  #   },
  #   error = function(e) {
  #     cli::cli_alert_danger("{Sys.time()}: Invalid arguments or no homepage leaders data for {season} available!")
  #     cli::cli_alert_danger("Error:\n{e}")
  #   },
  #   warning = function(w) {
  #     cli::cli_alert_warning("{Sys.time()}: Warning:\n{w}")
  #   },
  #   finally = {
  #   }
  # )
}


#' **Get WNBA Stats API HomepageV2 Leaders**
#' @name wnba_homepagev2
NULL
#' @title
#' **Get WNBA Stats API HomepageV2 Leaders**
#' @rdname wnba_homepagev2
#' @author Saiem Gilani
#' @param game_scope Game Scope - Season, Last 10, ,Yesterday, Finals
#' @param season Season - format 2020-21
#' @param season_type Season Type - Regular Season, Playoffs
#' @param player_or_team Player or Team
#' @param player_scope Player Scope - All Players, Rookies
#' @param league_id League - default: '00'. Other options include '10': WWNBA, '20': G-League
#' @param stat_type Stat Type - Traditional, Advanced, Tracking
#' @param ... Additional arguments passed to an underlying function like httr.
#' @return Returns a named list of data frames: HomePageStat1, HomePageStat2, HomePageStat3,
#'  HomePageStat4, HomePageStat5, HomePageStat6, HomePageStat7, HomePageStat8
#'
#'    **HomePageStat1**
#'
#'
#'    |col_name          |types     |
#'    |:-----------------|:---------|
#'    |RANK              |character |
#'    |TEAM_ID           |character |
#'    |TEAM_ABBREVIATION |character |
#'    |TEAM_NAME         |character |
#'    |PTS               |character |
#'
#'    **HomePageStat2**
#'
#'
#'    |col_name          |types     |
#'    |:-----------------|:---------|
#'    |RANK              |character |
#'    |TEAM_ID           |character |
#'    |TEAM_ABBREVIATION |character |
#'    |TEAM_NAME         |character |
#'    |REB               |character |
#'
#'    **HomePageStat3**
#'
#'
#'    |col_name          |types     |
#'    |:-----------------|:---------|
#'    |RANK              |character |
#'    |TEAM_ID           |character |
#'    |TEAM_ABBREVIATION |character |
#'    |TEAM_NAME         |character |
#'    |AST               |character |
#'
#'    **HomePageStat4**
#'
#'
#'    |col_name          |types     |
#'    |:-----------------|:---------|
#'    |RANK              |character |
#'    |TEAM_ID           |character |
#'    |TEAM_ABBREVIATION |character |
#'    |TEAM_NAME         |character |
#'    |STL               |character |
#'
#'    **HomePageStat5**
#'
#'
#'    |col_name          |types     |
#'    |:-----------------|:---------|
#'    |RANK              |character |
#'    |TEAM_ID           |character |
#'    |TEAM_ABBREVIATION |character |
#'    |TEAM_NAME         |character |
#'    |FG_PCT            |character |
#'
#'    **HomePageStat6**
#'
#'
#'    |col_name          |types     |
#'    |:-----------------|:---------|
#'    |RANK              |character |
#'    |TEAM_ID           |character |
#'    |TEAM_ABBREVIATION |character |
#'    |TEAM_NAME         |character |
#'    |FT_PCT            |character |
#'
#'    **HomePageStat7**
#'
#'
#'    |col_name          |types     |
#'    |:-----------------|:---------|
#'    |RANK              |character |
#'    |TEAM_ID           |character |
#'    |TEAM_ABBREVIATION |character |
#'    |TEAM_NAME         |character |
#'    |FG3_PCT           |character |
#'
#'    **HomePageStat8**
#'
#'
#'    |col_name          |types     |
#'    |:-----------------|:---------|
#'    |RANK              |character |
#'    |TEAM_ID           |character |
#'    |TEAM_ABBREVIATION |character |
#'    |TEAM_NAME         |character |
#'    |BLK               |character |
#'
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows as_tibble
#' @import rvest
#' @keywords internal
#' @export
#' @details
#' ```r
#'  wnba_homepagev2(league_id = '10', player_or_team = "Player")
#'  wnba_homepagev2(league_id = '10', player_or_team = "Team")
#' ```

wnba_homepagev2 <- function(
    league_id = '10',
    game_scope = 'Season',
    player_or_team = 'Team',
    player_scope = 'All Players',
    season = most_recent_wnba_season() - 1,
    season_type = 'Regular Season',
    stat_type = 'Traditional',
    ...){
  cli::cli_alert_danger("As of v2.1.0, `wnba_homepagev2()` is deprecated due to changes from the WNBA Stats API. Please use `wnba_homepagewidget()` instead.")
  
  # player_scope <- gsub(' ','+',player_scope)
  # # Intentional
  # # season_type <- gsub(' ','+',season_type)
  # stat_type <- gsub(' ','+',stat_type)
  # version <- "homepagev2"
  # endpoint <- wnba_endpoint(version)
  # full_url <- endpoint
  # 
  # params <- list(
  #   GameScope = game_scope,
  #   LeagueID = league_id,
  #   PlayerOrTeam = player_or_team,
  #   PlayerScope = player_scope,
  #   Season = season,
  #   SeasonType = season_type,
  #   StatType = stat_type
  # )
  # 
  # tryCatch(
  #   expr = {
  #     
  #     resp <- request_with_proxy(url = full_url, params = params, ...)
  #     
  #     df_list <- wnba_stats_map_result_sets(resp)
  #     
  #   },
  #   error = function(e) {
  #     cli::cli_alert_danger("{Sys.time()}: Invalid arguments or no homepage v2 data for {season} available!")
  #     cli::cli_alert_danger("Error:\n{e}")
  #   },
  #   warning = function(w) {
  #     cli::cli_alert_warning("{Sys.time()}: Warning:\n{w}")
  #   },
  #   finally = {
  #   }
  # )
}


#' **Get WNBA Stats API Homepage Widget Leaders**
#' @name wnba_homepagewidget
NULL
#' @title
#' **Get WNBA Stats API Homepage Widget Leaders**
#' @rdname wnba_homepagewidget
#' @author Saiem Gilani
#' @param player_or_team Player or Team
#' @param ... Additional arguments passed to an underlying function like httr.
#' @return Returns, for current season, a named list of data frames: PTS, REB, AST, 
#' BLK, STL, FG_PCT, FG3M, FG3_PCT, FANTASY_POINTS, TOTAL_PTS,
#'  TOTAL_REB, TOTAL_AST, ALL_TIME_TD3, TD3, GAME_FG3M, 
#'  GAME_PTS, GAME_AST, GAME_STL, GAME_BLK, PCT_PTS_3PT,
#'   PCT_PTS_2PT, PCT_PTS_2PT_MR
#'
#'    **PTS** 
#'    
#'    
#'    |col_name          |types     |
#'    |:-----------------|:---------|
#'    |title             |character |
#'    |deep_link         |character |
#'    |name              |character |
#'    |timestamp         |character |
#'    |season            |character |
#'    |seasontype        |character |
#'    |permode           |character |
#'    |RANK              |integer   |
#'    |PLAYER_ID         |integer   |
#'    |PLAYER_NAME       |character |
#'    |TEAM_ID           |integer   |
#'    |TEAM_ABBREVIATION |character |
#'    |PTS               |numeric   |
#'    |FIRST_NAME        |character |
#'    |NICKNAME          |character |
#'    |LAST_NAME         |character |
#'    |JERSEY_NUM        |character |
#'    |POSITION          |character |
#'    
#'    **REB** 
#'    
#'    
#'    |col_name          |types     |
#'    |:-----------------|:---------|
#'    |title             |character |
#'    |deep_link         |character |
#'    |name              |character |
#'    |timestamp         |character |
#'    |season            |character |
#'    |seasontype        |character |
#'    |permode           |character |
#'    |RANK              |integer   |
#'    |PLAYER_ID         |integer   |
#'    |PLAYER_NAME       |character |
#'    |TEAM_ID           |integer   |
#'    |TEAM_ABBREVIATION |character |
#'    |REB               |numeric   |
#'    |FIRST_NAME        |character |
#'    |NICKNAME          |character |
#'    |LAST_NAME         |character |
#'    |JERSEY_NUM        |character |
#'    |POSITION          |character |
#'    
#'    **AST** 
#'    
#'    
#'    |col_name          |types     |
#'    |:-----------------|:---------|
#'    |title             |character |
#'    |deep_link         |character |
#'    |name              |character |
#'    |timestamp         |character |
#'    |season            |character |
#'    |seasontype        |character |
#'    |permode           |character |
#'    |RANK              |integer   |
#'    |PLAYER_ID         |integer   |
#'    |PLAYER_NAME       |character |
#'    |TEAM_ID           |integer   |
#'    |TEAM_ABBREVIATION |character |
#'    |AST               |numeric   |
#'    |FIRST_NAME        |character |
#'    |NICKNAME          |character |
#'    |LAST_NAME         |character |
#'    |JERSEY_NUM        |character |
#'    |POSITION          |character |
#'    
#'    **BLK** 
#'    
#'    
#'    |col_name          |types     |
#'    |:-----------------|:---------|
#'    |title             |character |
#'    |deep_link         |character |
#'    |name              |character |
#'    |timestamp         |character |
#'    |season            |character |
#'    |seasontype        |character |
#'    |permode           |character |
#'    |RANK              |integer   |
#'    |PLAYER_ID         |integer   |
#'    |PLAYER_NAME       |character |
#'    |TEAM_ID           |integer   |
#'    |TEAM_ABBREVIATION |character |
#'    |BLK               |numeric   |
#'    |FIRST_NAME        |character |
#'    |NICKNAME          |character |
#'    |LAST_NAME         |character |
#'    |JERSEY_NUM        |character |
#'    |POSITION          |character |
#'    
#'    **STL** 
#'    
#'    
#'    |col_name          |types     |
#'    |:-----------------|:---------|
#'    |title             |character |
#'    |deep_link         |character |
#'    |name              |character |
#'    |timestamp         |character |
#'    |season            |character |
#'    |seasontype        |character |
#'    |permode           |character |
#'    |RANK              |integer   |
#'    |PLAYER_ID         |integer   |
#'    |PLAYER_NAME       |character |
#'    |TEAM_ID           |integer   |
#'    |TEAM_ABBREVIATION |character |
#'    |STL               |numeric   |
#'    |FIRST_NAME        |character |
#'    |NICKNAME          |character |
#'    |LAST_NAME         |character |
#'    |JERSEY_NUM        |character |
#'    |POSITION          |character |
#'    
#'    **FG_PCT** 
#'    
#'    
#'    |col_name          |types     |
#'    |:-----------------|:---------|
#'    |title             |character |
#'    |deep_link         |character |
#'    |name              |character |
#'    |timestamp         |character |
#'    |season            |character |
#'    |seasontype        |character |
#'    |permode           |character |
#'    |RANK              |integer   |
#'    |PLAYER_ID         |integer   |
#'    |PLAYER_NAME       |character |
#'    |TEAM_ID           |integer   |
#'    |TEAM_ABBREVIATION |character |
#'    |FG_PCT            |numeric   |
#'    |FIRST_NAME        |character |
#'    |NICKNAME          |character |
#'    |LAST_NAME         |character |
#'    |JERSEY_NUM        |character |
#'    |POSITION          |character |
#'    
#'    **FG3M** 
#'    
#'    
#'    |col_name          |types     |
#'    |:-----------------|:---------|
#'    |title             |character |
#'    |deep_link         |character |
#'    |name              |character |
#'    |timestamp         |character |
#'    |season            |character |
#'    |seasontype        |character |
#'    |permode           |character |
#'    |RANK              |integer   |
#'    |PLAYER_ID         |integer   |
#'    |PLAYER_NAME       |character |
#'    |TEAM_ID           |integer   |
#'    |TEAM_ABBREVIATION |character |
#'    |FG3M              |integer   |
#'    |FIRST_NAME        |character |
#'    |NICKNAME          |character |
#'    |LAST_NAME         |character |
#'    |JERSEY_NUM        |character |
#'    |POSITION          |character |
#'    
#'    **FG3_PCT** 
#'    
#'    
#'    |col_name          |types     |
#'    |:-----------------|:---------|
#'    |title             |character |
#'    |deep_link         |character |
#'    |name              |character |
#'    |timestamp         |character |
#'    |season            |character |
#'    |seasontype        |character |
#'    |permode           |character |
#'    |RANK              |integer   |
#'    |PLAYER_ID         |integer   |
#'    |PLAYER_NAME       |character |
#'    |TEAM_ID           |integer   |
#'    |TEAM_ABBREVIATION |character |
#'    |FG3_PCT           |numeric   |
#'    |FIRST_NAME        |character |
#'    |NICKNAME          |character |
#'    |LAST_NAME         |character |
#'    |JERSEY_NUM        |character |
#'    |POSITION          |character |
#'    
#'    **FANTASY_POINTS** 
#'    
#'    
#'    |col_name          |types     |
#'    |:-----------------|:---------|
#'    |title             |character |
#'    |deep_link         |character |
#'    |name              |character |
#'    |timestamp         |character |
#'    |season            |character |
#'    |seasontype        |character |
#'    |permode           |character |
#'    |PLAYER_ID         |integer   |
#'    |PLAYER_NAME       |character |
#'    |TEAM_ID           |integer   |
#'    |TEAM_ABBREVIATION |character |
#'    |FANTASY_POINTS    |numeric   |
#'    |FIRST_NAME        |character |
#'    |NICKNAME          |character |
#'    |LAST_NAME         |character |
#'    |JERSEY_NUM        |character |
#'    |POSITION          |character |
#'    
#'    **TOTAL_PTS** 
#'    
#'    
#'    |col_name               |types     |
#'    |:----------------------|:---------|
#'    |title                  |character |
#'    |deep_link              |character |
#'    |name                   |character |
#'    |timestamp              |character |
#'    |permode                |character |
#'    |season                 |character |
#'    |seasontype             |character |
#'    |PLAYER_ID              |integer   |
#'    |PLAYER_NAME            |character |
#'    |PLAYER_NAME_LAST_FIRST |character |
#'    |NICKNAME               |character |
#'    |TEAM_ID                |integer   |
#'    |TEAM_ABBREVIATION      |character |
#'    |TEAM_NAME              |character |
#'    |PTS                    |integer   |
#'    
#'    **TOTAL_REB** 
#'    
#'    
#'    |col_name               |types     |
#'    |:----------------------|:---------|
#'    |title                  |character |
#'    |deep_link              |character |
#'    |name                   |character |
#'    |timestamp              |character |
#'    |permode                |character |
#'    |season                 |character |
#'    |seasontype             |character |
#'    |PLAYER_ID              |integer   |
#'    |PLAYER_NAME            |character |
#'    |PLAYER_NAME_LAST_FIRST |character |
#'    |NICKNAME               |character |
#'    |TEAM_ID                |integer   |
#'    |TEAM_ABBREVIATION      |character |
#'    |TEAM_NAME              |character |
#'    |REB                    |integer   |
#'    
#'    **TOTAL_AST** 
#'    
#'    
#'    |col_name               |types     |
#'    |:----------------------|:---------|
#'    |title                  |character |
#'    |deep_link              |character |
#'    |name                   |character |
#'    |timestamp              |character |
#'    |permode                |character |
#'    |season                 |character |
#'    |seasontype             |character |
#'    |PLAYER_ID              |integer   |
#'    |PLAYER_NAME            |character |
#'    |PLAYER_NAME_LAST_FIRST |character |
#'    |NICKNAME               |character |
#'    |TEAM_ID                |integer   |
#'    |TEAM_ABBREVIATION      |character |
#'    |TEAM_NAME              |character |
#'    |AST                    |integer   |
#'    
#'    **ALL_TIME_TD3** 
#'    
#'    
#'    |col_name               |types     |
#'    |:----------------------|:---------|
#'    |title                  |character |
#'    |deep_link              |character |
#'    |name                   |character |
#'    |timestamp              |character |
#'    |permode                |character |
#'    |season                 |character |
#'    |seasontype             |character |
#'    |PLAYER_ID              |integer   |
#'    |PLAYER_NAME            |character |
#'    |PLAYER_NAME_LAST_FIRST |character |
#'    |TD3                    |integer   |
#'    
#'    **TD3** 
#'    
#'    
#'    |col_name               |types     |
#'    |:----------------------|:---------|
#'    |title                  |character |
#'    |deep_link              |character |
#'    |name                   |character |
#'    |timestamp              |character |
#'    |permode                |character |
#'    |season                 |character |
#'    |seasontype             |character |
#'    |PLAYER_ID              |integer   |
#'    |PLAYER_NAME            |character |
#'    |PLAYER_NAME_LAST_FIRST |character |
#'    |TEAM_ABBREVIATION      |character |
#'    |SEASON_YEAR            |character |
#'    |TD3                    |integer   |
#'    
#'    **GAME_FG3M** 
#'    
#'    
#'    |col_name               |types     |
#'    |:----------------------|:---------|
#'    |title                  |character |
#'    |deep_link              |character |
#'    |name                   |character |
#'    |timestamp              |character |
#'    |permode                |character |
#'    |season                 |character |
#'    |seasontype             |character |
#'    |PLAYER_ID              |integer   |
#'    |PLAYER_NAME            |character |
#'    |PLAYER_NAME_LAST_FIRST |character |
#'    |NICKNAME               |character |
#'    |TEAM_ID                |integer   |
#'    |TEAM_ABBREVIATION      |character |
#'    |TEAM_NAME              |character |
#'    |FG3M                   |integer   |
#'    |GAME_ID                |character |
#'    
#'    **GAME_PTS** 
#'    
#'    
#'    |col_name               |types     |
#'    |:----------------------|:---------|
#'    |title                  |character |
#'    |deep_link              |character |
#'    |name                   |character |
#'    |timestamp              |character |
#'    |permode                |character |
#'    |season                 |character |
#'    |seasontype             |character |
#'    |PLAYER_ID              |integer   |
#'    |PLAYER_NAME            |character |
#'    |PLAYER_NAME_LAST_FIRST |character |
#'    |NICKNAME               |character |
#'    |TEAM_ID                |integer   |
#'    |TEAM_ABBREVIATION      |character |
#'    |TEAM_NAME              |character |
#'    |PTS                    |integer   |
#'    |GAME_ID                |character |
#'    
#'    **GAME_AST** 
#'    
#'    
#'    |col_name               |types     |
#'    |:----------------------|:---------|
#'    |title                  |character |
#'    |deep_link              |character |
#'    |name                   |character |
#'    |timestamp              |character |
#'    |permode                |character |
#'    |season                 |character |
#'    |seasontype             |character |
#'    |PLAYER_ID              |integer   |
#'    |PLAYER_NAME            |character |
#'    |PLAYER_NAME_LAST_FIRST |character |
#'    |NICKNAME               |character |
#'    |TEAM_ID                |integer   |
#'    |TEAM_ABBREVIATION      |character |
#'    |TEAM_NAME              |character |
#'    |AST                    |integer   |
#'    |GAME_ID                |character |
#'    
#'    **GAME_STL** 
#'    
#'    
#'    |col_name               |types     |
#'    |:----------------------|:---------|
#'    |title                  |character |
#'    |deep_link              |character |
#'    |name                   |character |
#'    |timestamp              |character |
#'    |permode                |character |
#'    |season                 |character |
#'    |seasontype             |character |
#'    |PLAYER_ID              |integer   |
#'    |PLAYER_NAME            |character |
#'    |PLAYER_NAME_LAST_FIRST |character |
#'    |NICKNAME               |character |
#'    |TEAM_ID                |integer   |
#'    |TEAM_ABBREVIATION      |character |
#'    |TEAM_NAME              |character |
#'    |STL                    |integer   |
#'    |GAME_ID                |character |
#'    
#'    **GAME_BLK** 
#'    
#'    
#'    |col_name               |types     |
#'    |:----------------------|:---------|
#'    |title                  |character |
#'    |deep_link              |character |
#'    |name                   |character |
#'    |timestamp              |character |
#'    |permode                |character |
#'    |season                 |character |
#'    |seasontype             |character |
#'    |PLAYER_ID              |integer   |
#'    |PLAYER_NAME            |character |
#'    |PLAYER_NAME_LAST_FIRST |character |
#'    |NICKNAME               |character |
#'    |TEAM_ID                |integer   |
#'    |TEAM_ABBREVIATION      |character |
#'    |TEAM_NAME              |character |
#'    |BLK                    |integer   |
#'    |GAME_ID                |character |
#'    
#'    **PCT_PTS_3PT** 
#'    
#'    
#'    |col_name               |types     |
#'    |:----------------------|:---------|
#'    |title                  |character |
#'    |deep_link              |character |
#'    |name                   |character |
#'    |timestamp              |character |
#'    |permode                |character |
#'    |season                 |character |
#'    |seasontype             |character |
#'    |PLAYER_ID              |integer   |
#'    |PLAYER_NAME            |character |
#'    |PLAYER_NAME_LAST_FIRST |character |
#'    |NICKNAME               |character |
#'    |TEAM_ID                |integer   |
#'    |TEAM_ABBREVIATION      |character |
#'    |TEAM_NAME              |character |
#'    |PCT_PTS_3PT            |numeric   |
#'    
#'    **PCT_PTS_2PT** 
#'    
#'    
#'    |col_name               |types     |
#'    |:----------------------|:---------|
#'    |title                  |character |
#'    |deep_link              |character |
#'    |name                   |character |
#'    |timestamp              |character |
#'    |permode                |character |
#'    |season                 |character |
#'    |seasontype             |character |
#'    |PLAYER_ID              |integer   |
#'    |PLAYER_NAME            |character |
#'    |PLAYER_NAME_LAST_FIRST |character |
#'    |NICKNAME               |character |
#'    |TEAM_ID                |integer   |
#'    |TEAM_ABBREVIATION      |character |
#'    |TEAM_NAME              |character |
#'    |PCT_PTS_2PT            |numeric   |
#'    
#'    **PCT_PTS_2PT_MR** 
#'    
#'    
#'    |col_name               |types     |
#'    |:----------------------|:---------|
#'    |title                  |character |
#'    |deep_link              |character |
#'    |name                   |character |
#'    |timestamp              |character |
#'    |permode                |character |
#'    |season                 |character |
#'    |seasontype             |character |
#'    |PLAYER_ID              |integer   |
#'    |PLAYER_NAME            |character |
#'    |PLAYER_NAME_LAST_FIRST |character |
#'    |NICKNAME               |character |
#'    |TEAM_ID                |integer   |
#'    |TEAM_ABBREVIATION      |character |
#'    |TEAM_NAME              |character |
#'    |PCT_PTS_2PT_MR         |numeric   |
#'
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows as_tibble
#' @import rvest
#' @export
#' @family WNBA Leaders Functions
#' @details
#' ```r
#'  wnba_homepagewidget(player_or_team = "Player")
#'  wnba_homepagewidget(player_or_team = "Team")
#' ```

wnba_homepagewidget <- function(
    player_or_team = 'Player',
    ...){
  
  full_url <- "https://stats.wnba.com/js/data/widgets/home_season.json"
  
  params <- list(
    
  )
  
  tryCatch(
    expr = {
      
      resp <- httr::RETRY("GET", url = full_url,
                          httr::add_headers(.headers = wnba_headers_params())
      )
      json <- resp$content %>%
        rawToChar() %>%
        jsonlite::fromJSON(simplifyVector = T) 
      
      
      categories <- json$items %>%
        as_tibble()
      
      categories$items[[1]][1,] %>% 
        tidyr::unnest("playerstats")
      players_df_list <- purrr::map(1:nrow(categories$items[[1]]), function(x){
        df <- categories$items[[1]][x,] %>% 
          tidyr::unnest("playerstats") %>%
          data.frame(stringsAsFactors = F) %>%
          as_tibble()
        return(df)
      })
      players_df_list_names <- categories$items[[1]]$name
      names(players_df_list) <- players_df_list_names
      players_df_list <- players_df_list[sapply(players_df_list, function(x) nrow(x) > 0)]
      
      players_df_list_ext <- purrr::map(1:nrow(categories$items[[3]]), function(x){
        df <- categories$items[[3]][x,] %>% 
          tidyr::unnest("playerstats") %>%
          data.frame(stringsAsFactors = F) %>%
          as_tibble() %>% 
          dplyr::select(-dplyr::any_of(c("teamstats")))
        return(df)
      })
      player_df_list_ext_names <- categories$items[[3]]$name
      season_df_list_ext_names <- c(
        "TOTAL_PTS",
        "TOTAL_REB",
        "TOTAL_AST",
        "ALL_TIME_TD3",
        "TD3",
        "GAME_FG3M",
        "GAME_PTS",
        "PCT_PTS_3PT_PER_GAME",
        "GAME_AST",
        "GAME_AST",
        "GAME_STL",
        "GAME_BLK",
        "GAME_FG3M",
        "PCT_PTS_3PT",
        "PCT_PTS_3PT",
        "PCT_PTS_2PT",
        "PCT_PTS_2PT",
        "PCT_PTS_2PT_MR",
        "PCT_PTS_2PT_MR"
      )
      names(players_df_list_ext) <- season_df_list_ext_names
      players_df_list_ext <- players_df_list_ext[sapply(players_df_list_ext, function(x) nrow(x) > 0)]
      
      players_df_list_final <- c(players_df_list, players_df_list_ext)
      
      players_df_list_final <- players_df_list_final[sapply(players_df_list_final, function(x) nrow(x) > 0)]
      
      
      teams_df_list <- purrr::map(1:nrow(categories$items[[2]]), function(x){
        df <- categories$items[[2]][x,] %>% 
          tidyr::unnest("teamstats") %>%
          data.frame(stringsAsFactors = F) %>%
          as_tibble()
        
        return(df)
      })
      teams_df_list_names <- categories$items[[2]]$name
      names(teams_df_list) <- teams_df_list_names
      teams_df_list <- teams_df_list[sapply(teams_df_list, function(x) nrow(x) > 0)]

      teams_df_list_ext <- purrr::map(1:nrow(categories$items[[3]]), function(x){
        df <- categories$items[[3]][x,] %>% 
          tidyr::unnest("teamstats") %>%
          data.frame(stringsAsFactors = F) %>%
          as_tibble() %>% 
          dplyr::select(-dplyr::any_of(c("playerstats")))
        return(df)
      })
      
      names(teams_df_list_ext) <- season_df_list_ext_names
      teams_df_list_ext <- teams_df_list_ext[sapply(teams_df_list_ext, function(x) nrow(x) > 0)]
      
      teams_df_list_final <- c(teams_df_list, teams_df_list_ext)
      teams_df_list_final <- teams_df_list_final[sapply(teams_df_list_final, function(x) nrow(x) > 0)]
      
      if(tolower(player_or_team) == "player"){
        df_list <- players_df_list_final
      } else if(tolower(player_or_team) == "team"){
        df_list <- teams_df_list_final
      }
      
    },
    error = function(e) {
      cli::cli_alert_danger("{Sys.time()}: Invalid arguments or no homepage widget data for {season} available!")
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



#' **Get WNBA Stats API Leaders Tiles**
#' @name wnba_leaderstiles
NULL
#' @title
#' **Get WNBA Stats API Leaders Tiles**
#' @rdname wnba_leaderstiles
#' @author Saiem Gilani
#' @param game_scope Game Scope - Season, Last 10, ,Yesterday, Finals
#' @param season Season - format 2020-21
#' @param season_type Season Type - Regular Season, Playoffs
#' @param player_or_team Player or Team
#' @param player_scope Player Scope - All Players, Rookies
#' @param league_id League - default: '00'. Other options include '10': WNBA, '20': G-League
#' @param stat Stat - PTS, REB, AST, FG_PCT, FT_PCT, FG3_PCT, STL, BLK
#' @param ... Additional arguments passed to an underlying function like httr.
#' @return Returns a named list of data frames: AllTimeSeasonHigh, LastSeasonHigh, 
#' LeadersTiles, LowSeasonHigh,
#'
#'    **LeadersTiles**
#'
#'
#'    |col_name          |types     |
#'    |:-----------------|:---------|
#'    |RANK              |character |
#'    |TEAM_ID           |character |
#'    |TEAM_ABBREVIATION |character |
#'    |TEAM_NAME         |character |
#'    |PTS               |character |
#'
#'    **AllTimeSeasonHigh**
#'
#'
#'    |col_name          |types     |
#'    |:-----------------|:---------|
#'    |TEAM_ID           |character |
#'    |TEAM_ABBREVIATION |character |
#'    |TEAM_NAME         |character |
#'    |SEASON_YEAR       |character |
#'    |PTS               |character |
#'
#'    **LastSeasonHigh**
#'
#'
#'    |col_name          |types     |
#'    |:-----------------|:---------|
#'    |RANK              |character |
#'    |TEAM_ID           |character |
#'    |TEAM_ABBREVIATION |character |
#'    |TEAM_NAME         |character |
#'    |PTS               |character |
#'
#'    **LowSeasonHigh**
#'
#'
#'    |col_name          |types     |
#'    |:-----------------|:---------|
#'    |TEAM_ID           |character |
#'    |TEAM_ABBREVIATION |character |
#'    |TEAM_NAME         |character |
#'    |SEASON_YEAR       |character |
#'    |PTS               |character |
#'
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows as_tibble
#' @import rvest
#' @keywords internal
#' @export
#' @details
#' ```r
#'   wnba_leaderstiles(league_id = '10', player_or_team = "Player")
#'   wnba_leaderstiles(league_id = '10', player_or_team = "Team")
#' ```

wnba_leaderstiles <- function(
    league_id = '10',
    game_scope = 'Season',
    player_or_team = 'Team',
    player_scope = 'All Players',
    season = most_recent_wnba_season() - 1,
    season_type = 'Regular Season',
    stat = 'PTS',
    ...){
  cli::cli_alert_danger("As of v2.1.0, `wnba_leaderstiles()` is deprecated due to changes from the WNBA Stats API. Please use `wnba_homepagewidget()` instead.")
  
  # player_scope <- gsub(' ','+',player_scope)
  # # season_type <- gsub(' ','+',season_type)
  # stat <- gsub(' ','+',stat)
  # version <- "leaderstiles"
  # endpoint <- wnba_endpoint(version)
  # full_url <- endpoint
  # 
  # params <- list(
  #   GameScope = game_scope,
  #   LeagueID = league_id,
  #   PlayerOrTeam = player_or_team,
  #   PlayerScope = player_scope,
  #   Season = season,
  #   SeasonType = season_type,
  #   Stat = stat
  # )
  # 
  # tryCatch(
  #   expr = {
  #     
  #     resp <- request_with_proxy(url = full_url, params = params, ...)
  #     
  #     df_list <- wnba_stats_map_result_sets(resp)
  #     
  #   },
  #   error = function(e) {
  #     cli::cli_alert_danger("{Sys.time()}: Invalid arguments or no leaders tiles data for {season} available!")
  #     cli::cli_alert_danger("Error:\n{e}")
  #   },
  #   warning = function(w) {
  #     cli::cli_alert_warning("{Sys.time()}: Warning:\n{w}")
  #   },
  #   finally = {
  #   }
  # )
}


#' **Get WNBA Stats API League Leaders**
#' @name wnba_leagueleaders
NULL
#' @title
#' **Get WNBA Stats API League Leaders**
#' @rdname wnba_leagueleaders
#' @author Saiem Gilani
#' @param active_flag Active Flag
#' @param season Season - format 2020-21
#' @param season_type Season Type - Regular Season, Playoffs
#' @param per_mode Per Mode - Totals, PerGame, Per48
#' @param scope Scope - RS, S, Rookies
#' @param league_id League - default: '00'. Other options include '10': WNBA, '20': G-League
#' @param stat_category Stat Category: PTS, REB, AST, FG_PCT, FT_PCT, FG3_PCT, STL, BLK
#' @param ... Additional arguments passed to an underlying function like httr.
#' @return Returns a named list of data frames: LeagueLeaders
#'
#'    **LeagueLeaders**
#'
#'
#'    |col_name  |types     |
#'    |:---------|:---------|
#'    |PLAYER_ID |character |
#'    |RANK      |character |
#'    |PLAYER    |character |
#'    |TEAM_ID   |character |
#'    |TEAM      |character |
#'    |GP        |character |
#'    |MIN       |character |
#'    |FGM       |character |
#'    |FGA       |character |
#'    |FG_PCT    |character |
#'    |FG3M      |character |
#'    |FG3A      |character |
#'    |FG3_PCT   |character |
#'    |FTM       |character |
#'    |FTA       |character |
#'    |FT_PCT    |character |
#'    |OREB      |character |
#'    |DREB      |character |
#'    |REB       |character |
#'    |AST       |character |
#'    |STL       |character |
#'    |BLK       |character |
#'    |TOV       |character |
#'    |PF        |character |
#'    |PTS       |character |
#'    |EFF       |character |
#'    |AST_TOV   |character |
#'    |STL_TOV   |character |
#'
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows as_tibble
#' @import rvest
#' @export
#' @family WNBA Leaders Functions
#' @details
#' ```r
#'  wnba_leagueleaders(league_id = '10')
#' ```

wnba_leagueleaders <- function(
    active_flag = '',
    league_id = '10',
    per_mode = 'Totals',
    scope = 'S',
    season = most_recent_wnba_season() - 1,
    season_type = 'Regular Season',
    stat_category = 'PTS',
    ...){
  
  scope <- gsub(' ','+',scope)
  # season_type <- gsub(' ','+',season_type)
  stat_category <- gsub(' ','+',stat_category)
  version <- "leagueleaders"
  endpoint <- wnba_endpoint(version)
  full_url <- endpoint
  
  params <- list(
    ActiveFlag = active_flag,
    LeagueID = league_id,
    PerMode = per_mode,
    Scope = scope,
    Season = season,
    SeasonType = season_type,
    StatCategory = stat_category
  )
  
  tryCatch(
    expr = {
      
      resp <- request_with_proxy(url = full_url, params = params, ...)
      
      df_list <- purrr::map(1:length(resp$resultSet$name), function(x){
        data <- resp$resultSet$rowSet %>%
          data.frame(stringsAsFactors = F) %>%
          dplyr::as_tibble()
        
        json_names <- resp$resultSet$headers
        colnames(data) <- json_names
        return(data)
      })
      names(df_list) <- resp$resultSet$name
      
    },
    error = function(e) {
      cli::cli_alert_danger("{Sys.time()}: Invalid arguments or no league leaders data for {season} available!")
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


# #' **Get WNBA Stats API Defense Hub**
# #' @name wnba_defensehub
# NULL
# #' @title
# #' **Get WNBA Stats API Defense Hub**
# #' @rdname wnba_defensehub
# #' @author Saiem Gilani
# #' @param game_scope Game Scope - Season, Last 10, ,Yesterday, Finals
# #' @param season Season - format 2020-21
# #' @param season_type Season Type - Regular Season, Playoffs
# #' @param player_or_team Player or Team
# #' @param player_scope Player Scope - All Players, Rookies
# #' @param league_id League - default: '00'. Other options include '10': WNBA, '20': G-League
# #' @param ... Additional arguments passed to an underlying function like httr.
# #' @return Returns a named list of data frames: DefenseHubStat1, DefenseHubStat10, DefenseHubStat2, DefenseHubStat3, DefenseHubStat4, DefenseHubStat5, DefenseHubStat6,
# #' DefenseHubStat7, DefenseHubStat8, DefenseHubStat9
# #' @importFrom jsonlite fromJSON toJSON
# #' @importFrom dplyr filter select rename bind_cols bind_rows as_tibble
# #' @import rvest
# #' @export
# #' @family WNBA Leaders Functions
# #' @details
# #' (Possibly Deprecated)
# #' ```r
# #'  wnba_defensehub(league_id = '10', player_or_team = "Player")
# #'  wnba_defensehub(league_id = '10', player_or_team = "Team")
# #' ```
# 
# wnba_defensehub <- function(
    #     league_id = '10',
#     game_scope = 'Season',
#     player_or_team = 'Team',
#     player_scope = 'All Players',
#     season = most_recent_wnba_season() - 1,
#     season_type = 'Regular Season',
#     ...){
#   
#   player_scope <- gsub(' ','+',player_scope)
#   # season_type <- gsub(' ','+',season_type)
#   version <- "defensehub"
#   endpoint <- wnba_endpoint(version)
#   full_url <- endpoint
#   
#   params <- list(
#     GameScope = game_scope,
#     LeagueID = league_id,
#     PlayerOrTeam = player_or_team,
#     PlayerScope = player_scope,
#     Season = season,
#     SeasonType = season_type
#   )
#   
#   tryCatch(
#     expr = {
#       
#       resp <- request_with_proxy(url = full_url, params = params, ...)
#       
#       df_list <- wnba_stats_map_result_sets(resp)
#       
#     },
#     error = function(e) {
#       cli::cli_alert_danger("{Sys.time()}: Invalid arguments or no defense hub data for {season} available!")
#     },
#     warning = function(w) {
#     },
#     finally = {
#     }
#   )
#   return(df_list)
# }
