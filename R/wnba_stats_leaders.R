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
      message(glue::glue("{Sys.time()}: Invalid arguments or no all-time leaders grid data for {league_id} available!"))
    },
    warning = function(w) {
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
      message(glue::glue("{Sys.time()}: Invalid arguments or no assist leaders data for {season} available!"))
    },
    warning = function(w) {
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
      message(glue::glue("{Sys.time()}: Invalid arguments or no assist tracker data for {season} available!"))
    },
    warning = function(w) {
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
#' @export
#' @family WNBA Leaders Functions
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
  
  player_scope <- gsub(' ','+',player_scope)
  # Intentional
  # season_type <- gsub(' ','+',season_type)
  stat_category <- gsub(' ','+',stat_category)
  version <- "homepageleaders"
  endpoint <- wnba_endpoint(version)
  full_url <- endpoint
  
  params <- list(
    GameScope =  game_scope,
    LeagueID = league_id,
    PlayerOrTeam = player_or_team,
    PlayerScope = player_scope,
    Season = season,
    SeasonType = season_type,
    StatCategory = stat_category
  )
  
  tryCatch(
    expr = {
      
      resp <- request_with_proxy(url = full_url, params = params, ...)
      
      df_list <- wnba_stats_map_result_sets(resp)
      
    },
    error = function(e) {
      message(glue::glue("{Sys.time()}: Invalid arguments or no homepage leaders data for {season} available!"))
    },
    warning = function(w) {
    },
    finally = {
    }
  )
  return(df_list)
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
#' @export
#' @family WNBA Leaders Functions
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
  
  player_scope <- gsub(' ','+',player_scope)
  # Intentional
  # season_type <- gsub(' ','+',season_type)
  stat_type <- gsub(' ','+',stat_type)
  version <- "homepagev2"
  endpoint <- wnba_endpoint(version)
  full_url <- endpoint
  
  params <- list(
    GameScope = game_scope,
    LeagueID = league_id,
    PlayerOrTeam = player_or_team,
    PlayerScope = player_scope,
    Season = season,
    SeasonType = season_type,
    StatType = stat_type
  )
  
  tryCatch(
    expr = {
      
      resp <- request_with_proxy(url = full_url, params = params, ...)
      
      df_list <- wnba_stats_map_result_sets(resp)
      
    },
    error = function(e) {
      message(glue::glue("{Sys.time()}: Invalid arguments or no homepage v2 data for {season} available!"))
    },
    warning = function(w) {
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
#' @export
#' @family WNBA Leaders Functions
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
  
  player_scope <- gsub(' ','+',player_scope)
  # season_type <- gsub(' ','+',season_type)
  stat <- gsub(' ','+',stat)
  version <- "leaderstiles"
  endpoint <- wnba_endpoint(version)
  full_url <- endpoint
  
  params <- list(
    GameScope = game_scope,
    LeagueID = league_id,
    PlayerOrTeam = player_or_team,
    PlayerScope = player_scope,
    Season = season,
    SeasonType = season_type,
    Stat = stat
  )
  
  tryCatch(
    expr = {
      
      resp <- request_with_proxy(url = full_url, params = params, ...)
      
      df_list <- wnba_stats_map_result_sets(resp)
      
    },
    error = function(e) {
      message(glue::glue("{Sys.time()}: Invalid arguments or no leaders tiles data for {season} available!"))
    },
    warning = function(w) {
    },
    finally = {
    }
  )
  return(df_list)
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
      message(glue::glue("{Sys.time()}: Invalid arguments or no league leaders data for {season} available!"))
    },
    warning = function(w) {
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
#       message(glue::glue("{Sys.time()}: Invalid arguments or no defense hub data for {season} available!"))
#     },
#     warning = function(w) {
#     },
#     finally = {
#     }
#   )
#   return(df_list)
# }
