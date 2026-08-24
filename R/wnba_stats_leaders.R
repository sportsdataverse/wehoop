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
#'    |col_name       |types     |description               |
#'    |:--------------|:---------|:-------------------------|
#'    |PLAYER_ID      |character |Unique player identifier. |
#'    |PLAYER_NAME    |character |Player name.              |
#'    |GP             |character |Games played.             |
#'    |GP_RANK        |character |                          |
#'    |IS_ACTIVE_FLAG |character |                          |
#'    
#'    **PTSLeaders** 
#'    
#'    
#'    |col_name       |types     |description               |
#'    |:--------------|:---------|:-------------------------|
#'    |PLAYER_ID      |character |Unique player identifier. |
#'    |PLAYER_NAME    |character |Player name.              |
#'    |PTS            |character |Points scored.            |
#'    |PTS_RANK       |character |                          |
#'    |IS_ACTIVE_FLAG |character |                          |
#'    
#'    **ASTLeaders** 
#'    
#'    
#'    |col_name       |types     |description               |
#'    |:--------------|:---------|:-------------------------|
#'    |PLAYER_ID      |character |Unique player identifier. |
#'    |PLAYER_NAME    |character |Player name.              |
#'    |AST            |character |Assists.                  |
#'    |AST_RANK       |character |                          |
#'    |IS_ACTIVE_FLAG |character |                          |
#'    
#'    **STLLeaders** 
#'    
#'    
#'    |col_name       |types     |description               |
#'    |:--------------|:---------|:-------------------------|
#'    |PLAYER_ID      |character |Unique player identifier. |
#'    |PLAYER_NAME    |character |Player name.              |
#'    |STL            |character |Steals.                   |
#'    |STL_RANK       |character |                          |
#'    |IS_ACTIVE_FLAG |character |                          |
#'    
#'    **OREBLeaders** 
#'    
#'    
#'    |col_name       |types     |description               |
#'    |:--------------|:---------|:-------------------------|
#'    |PLAYER_ID      |character |Unique player identifier. |
#'    |PLAYER_NAME    |character |Player name.              |
#'    |OREB           |character |Offensive rebounds.       |
#'    |OREB_RANK      |character |                          |
#'    |IS_ACTIVE_FLAG |character |                          |
#'    
#'    **DREBLeaders** 
#'    
#'    
#'    |col_name       |types     |description               |
#'    |:--------------|:---------|:-------------------------|
#'    |PLAYER_ID      |character |Unique player identifier. |
#'    |PLAYER_NAME    |character |Player name.              |
#'    |DREB           |character |Defensive rebounds.       |
#'    |DREB_RANK      |character |                          |
#'    |IS_ACTIVE_FLAG |character |                          |
#'    
#'    **REBLeaders** 
#'    
#'    
#'    |col_name       |types     |description               |
#'    |:--------------|:---------|:-------------------------|
#'    |PLAYER_ID      |character |Unique player identifier. |
#'    |PLAYER_NAME    |character |Player name.              |
#'    |REB            |character |Total rebounds.           |
#'    |REB_RANK       |character |                          |
#'    |IS_ACTIVE_FLAG |character |                          |
#'    
#'    **BLKLeaders** 
#'    
#'    
#'    |col_name       |types     |description               |
#'    |:--------------|:---------|:-------------------------|
#'    |PLAYER_ID      |character |Unique player identifier. |
#'    |PLAYER_NAME    |character |Player name.              |
#'    |BLK            |character |Blocks.                   |
#'    |BLK_RANK       |character |                          |
#'    |IS_ACTIVE_FLAG |character |                          |
#'    
#'    **FGMLeaders** 
#'    
#'    
#'    |col_name       |types     |description               |
#'    |:--------------|:---------|:-------------------------|
#'    |PLAYER_ID      |character |Unique player identifier. |
#'    |PLAYER_NAME    |character |Player name.              |
#'    |FGM            |character |Field goals made.         |
#'    |FGM_RANK       |character |                          |
#'    |IS_ACTIVE_FLAG |character |                          |
#'    
#'    **FGALeaders** 
#'    
#'    
#'    |col_name       |types     |description               |
#'    |:--------------|:---------|:-------------------------|
#'    |PLAYER_ID      |character |Unique player identifier. |
#'    |PLAYER_NAME    |character |Player name.              |
#'    |FGA            |character |Field goal attempts.      |
#'    |FGA_RANK       |character |                          |
#'    |IS_ACTIVE_FLAG |character |                          |
#'    
#'    **FG_PCTLeaders** 
#'    
#'    
#'    |col_name       |types     |description                  |
#'    |:--------------|:---------|:----------------------------|
#'    |PLAYER_ID      |character |Unique player identifier.    |
#'    |PLAYER_NAME    |character |Player name.                 |
#'    |FG_PCT         |character |Field goal percentage (0-1). |
#'    |FG_PCT_RANK    |character |                             |
#'    |IS_ACTIVE_FLAG |character |                             |
#'    
#'    **TOVLeaders** 
#'    
#'    
#'    |col_name       |types     |description               |
#'    |:--------------|:---------|:-------------------------|
#'    |PLAYER_ID      |character |Unique player identifier. |
#'    |PLAYER_NAME    |character |Player name.              |
#'    |TOV            |character |Turnovers.                |
#'    |TOV_RANK       |character |                          |
#'    |IS_ACTIVE_FLAG |character |                          |
#'    
#'    **FG3MLeaders** 
#'    
#'    
#'    |col_name       |types     |description                   |
#'    |:--------------|:---------|:-----------------------------|
#'    |PLAYER_ID      |character |Unique player identifier.     |
#'    |PLAYER_NAME    |character |Player name.                  |
#'    |FG3M           |character |Three-point field goals made. |
#'    |FG3M_RANK      |character |                              |
#'    |IS_ACTIVE_FLAG |character |                              |
#'    
#'    **FG3ALeaders** 
#'    
#'    
#'    |col_name       |types     |description                      |
#'    |:--------------|:---------|:--------------------------------|
#'    |PLAYER_ID      |character |Unique player identifier.        |
#'    |PLAYER_NAME    |character |Player name.                     |
#'    |FG3A           |character |Three-point field goal attempts. |
#'    |FG3A_RANK      |character |                                 |
#'    |IS_ACTIVE_FLAG |character |                                 |
#'    
#'    **FG3_PCTLeaders** 
#'    
#'    
#'    |col_name       |types     |description                              |
#'    |:--------------|:---------|:----------------------------------------|
#'    |PLAYER_ID      |character |Unique player identifier.                |
#'    |PLAYER_NAME    |character |Player name.                             |
#'    |FG3_PCT        |character |Three-point field goal percentage (0-1). |
#'    |FG3_PCT_RANK   |character |                                         |
#'    |IS_ACTIVE_FLAG |character |                                         |
#'    
#'    **PFLeaders** 
#'    
#'    
#'    |col_name       |types     |description               |
#'    |:--------------|:---------|:-------------------------|
#'    |PLAYER_ID      |character |Unique player identifier. |
#'    |PLAYER_NAME    |character |Player name.              |
#'    |PF             |character |Personal fouls.           |
#'    |PF_RANK        |character |                          |
#'    |IS_ACTIVE_FLAG |character |                          |
#'    
#'    **FTMLeaders** 
#'    
#'    
#'    |col_name       |types     |description               |
#'    |:--------------|:---------|:-------------------------|
#'    |PLAYER_ID      |character |Unique player identifier. |
#'    |PLAYER_NAME    |character |Player name.              |
#'    |FTM            |character |Free throws made.         |
#'    |FTM_RANK       |character |                          |
#'    |IS_ACTIVE_FLAG |character |                          |
#'    
#'    **FTALeaders** 
#'    
#'    
#'    |col_name       |types     |description               |
#'    |:--------------|:---------|:-------------------------|
#'    |PLAYER_ID      |character |Unique player identifier. |
#'    |PLAYER_NAME    |character |Player name.              |
#'    |FTA            |character |Free throw attempts.      |
#'    |FTA_RANK       |character |                          |
#'    |IS_ACTIVE_FLAG |character |                          |
#'    
#'    **FT_PCTLeaders** 
#'    
#'    
#'    |col_name       |types     |description                  |
#'    |:--------------|:---------|:----------------------------|
#'    |PLAYER_ID      |character |Unique player identifier.    |
#'    |PLAYER_NAME    |character |Player name.                 |
#'    |FT_PCT         |character |Free throw percentage (0-1). |
#'    |FT_PCT_RANK    |character |                             |
#'    |IS_ACTIVE_FLAG |character |                             |
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
  .args <- mget(setdiff(names(formals()), "..."))
  
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
  
  df_list <- list()

  tryCatch(
    expr = {
      
      resp <- request_with_proxy(url = full_url, params = params, ...)
      
      df_list <- wnba_stats_map_result_sets(resp)
      
    },
    error = function(e) .report_api_error(
      e,
      hint = "Invalid arguments or no all-time leaders grid data for {league_id} available!",
      args = .args
    ),
    warning = function(w) .report_api_warning(w, args = .args),
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
#'    \if{html}{\tabular{lll}{
#'       col_name \tab types \tab description \cr
#'       RANK \tab character \tab Whether to include statistical ranks in the returned table. \cr
#'       PLAYER_ID \tab character \tab Unique player identifier. \cr
#'       PLAYER \tab character \tab  \cr
#'       TEAM_ID \tab character \tab Unique team identifier. \cr
#'       TEAM_ABBREVIATION \tab character \tab Short team abbreviation (e.g. 'LAS'). \cr
#'       TEAM_NAME \tab character \tab Full team display name (e.g. 'Las Vegas Aces'). \cr
#'       JERSEY_NUM \tab character \tab Jersey number worn by the player. \cr
#'       PLAYER_POSITION \tab character \tab  \cr
#'       AST \tab character \tab Assists. \cr
#'    }}
#'    \if{latex}{See the HTML help or pkgdown reference for the column table.}
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
  .args <- mget(setdiff(names(formals()), "..."))
  
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
  
  df_list <- list()

  tryCatch(
    expr = {
      
      resp <- request_with_proxy(url = full_url, params = params, ...)
      
      df_list <- wnba_stats_map_result_sets(resp)
      
    },
    error = function(e) .report_api_error(
      e,
      hint = "Invalid arguments or no assist leaders data for {season} available!",
      args = .args
    ),
    warning = function(w) .report_api_warning(w, args = .args),
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
#'    |col_name |types   |description    |
#'    |:--------|:-------|:--------------|
#'    |ASSISTS  |numeric |Total assists. |
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
  .args <- mget(setdiff(names(formals()), "..."))
  
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
  
  df_list <- list()

  tryCatch(
    expr = {
      
      resp <- request_with_proxy(url = full_url, params = params, ...)
      
      df_list <- wnba_stats_map_result_sets(resp)
      
    },
    error = function(e) .report_api_error(
      e,
      hint = "Invalid arguments or no assist tracker data for {season} available!",
      args = .args
    ),
    warning = function(w) .report_api_warning(w, args = .args),
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
#'    \if{html}{\tabular{lll}{
#'       col_name \tab types \tab description \cr
#'       RANK \tab character \tab Whether to include statistical ranks in the returned table. \cr
#'       PLAYERID \tab character \tab  \cr
#'       PLAYER \tab character \tab  \cr
#'       TEAM_ID \tab character \tab Unique team identifier. \cr
#'       TEAM_ABBREVIATION \tab character \tab Short team abbreviation (e.g. 'LAS'). \cr
#'       TEAM_NAME \tab character \tab Full team display name (e.g. 'Las Vegas Aces'). \cr
#'       PTS \tab character \tab Points scored. \cr
#'       FG_PCT \tab character \tab Field goal percentage (0-1). \cr
#'       FG3_PCT \tab character \tab Three-point field goal percentage (0-1). \cr
#'       FT_PCT \tab character \tab Free throw percentage (0-1). \cr
#'       EFG_PCT \tab character \tab Effective field goal percentage (0-1). \cr
#'       TS_PCT \tab character \tab True shooting percentage (0-1). \cr
#'       PTS_PER48 \tab character \tab  \cr
#'    }}
#'    \if{latex}{See the HTML help or pkgdown reference for the column table.}
#'    
#'    **LeagueAverage** 
#'    
#'    
#'    |col_name  |types   |description                              |
#'    |:---------|:-------|:----------------------------------------|
#'    |PTS       |numeric |Points scored.                           |
#'    |FG_PCT    |numeric |Field goal percentage (0-1).             |
#'    |FG3_PCT   |numeric |Three-point field goal percentage (0-1). |
#'    |FT_PCT    |numeric |Free throw percentage (0-1).             |
#'    |EFG_PCT   |numeric |Effective field goal percentage (0-1).   |
#'    |TS_PCT    |numeric |True shooting percentage (0-1).          |
#'    |PTS_PER48 |numeric |                                         |
#'    
#'    **LeagueMax** 
#'    
#'    
#'    Same columns as the **LeagueAverage** table above.
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
  
  .args <- .capture_args()

  lifecycle::deprecate_stop(
    when = "2.1.0",
    what = "wnba_homepageleaders()",
    with = "wnba_homepagewidget()"
  )
  
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
#'    Columns as documented in the shared [wnba_homepagev2_home_page_stat1_schema] table.
#'
#'    **HomePageStat2**
#'
#'
#'    |col_name          |types     |description                                                 |
#'    |:-----------------|:---------|:-----------------------------------------------------------|
#'    |RANK              |character |Whether to include statistical ranks in the returned table. |
#'    |TEAM_ID           |character |Unique team identifier.                                     |
#'    |TEAM_ABBREVIATION |character |Short team abbreviation (e.g. 'LAS').                       |
#'    |TEAM_NAME         |character |Full team display name (e.g. 'Las Vegas Aces').             |
#'    |REB               |character |Total rebounds.                                             |
#'
#'    **HomePageStat3**
#'
#'
#'    |col_name          |types     |description                                                 |
#'    |:-----------------|:---------|:-----------------------------------------------------------|
#'    |RANK              |character |Whether to include statistical ranks in the returned table. |
#'    |TEAM_ID           |character |Unique team identifier.                                     |
#'    |TEAM_ABBREVIATION |character |Short team abbreviation (e.g. 'LAS').                       |
#'    |TEAM_NAME         |character |Full team display name (e.g. 'Las Vegas Aces').             |
#'    |AST               |character |Assists.                                                    |
#'
#'    **HomePageStat4**
#'
#'
#'    |col_name          |types     |description                                                 |
#'    |:-----------------|:---------|:-----------------------------------------------------------|
#'    |RANK              |character |Whether to include statistical ranks in the returned table. |
#'    |TEAM_ID           |character |Unique team identifier.                                     |
#'    |TEAM_ABBREVIATION |character |Short team abbreviation (e.g. 'LAS').                       |
#'    |TEAM_NAME         |character |Full team display name (e.g. 'Las Vegas Aces').             |
#'    |STL               |character |Steals.                                                     |
#'
#'    **HomePageStat5**
#'
#'
#'    |col_name          |types     |description                                                 |
#'    |:-----------------|:---------|:-----------------------------------------------------------|
#'    |RANK              |character |Whether to include statistical ranks in the returned table. |
#'    |TEAM_ID           |character |Unique team identifier.                                     |
#'    |TEAM_ABBREVIATION |character |Short team abbreviation (e.g. 'LAS').                       |
#'    |TEAM_NAME         |character |Full team display name (e.g. 'Las Vegas Aces').             |
#'    |FG_PCT            |character |Field goal percentage (0-1).                                |
#'
#'    **HomePageStat6**
#'
#'
#'    |col_name          |types     |description                                                 |
#'    |:-----------------|:---------|:-----------------------------------------------------------|
#'    |RANK              |character |Whether to include statistical ranks in the returned table. |
#'    |TEAM_ID           |character |Unique team identifier.                                     |
#'    |TEAM_ABBREVIATION |character |Short team abbreviation (e.g. 'LAS').                       |
#'    |TEAM_NAME         |character |Full team display name (e.g. 'Las Vegas Aces').             |
#'    |FT_PCT            |character |Free throw percentage (0-1).                                |
#'
#'    **HomePageStat7**
#'
#'
#'    |col_name          |types     |description                                                 |
#'    |:-----------------|:---------|:-----------------------------------------------------------|
#'    |RANK              |character |Whether to include statistical ranks in the returned table. |
#'    |TEAM_ID           |character |Unique team identifier.                                     |
#'    |TEAM_ABBREVIATION |character |Short team abbreviation (e.g. 'LAS').                       |
#'    |TEAM_NAME         |character |Full team display name (e.g. 'Las Vegas Aces').             |
#'    |FG3_PCT           |character |Three-point field goal percentage (0-1).                    |
#'
#'    **HomePageStat8**
#'
#'
#'    |col_name          |types     |description                                                 |
#'    |:-----------------|:---------|:-----------------------------------------------------------|
#'    |RANK              |character |Whether to include statistical ranks in the returned table. |
#'    |TEAM_ID           |character |Unique team identifier.                                     |
#'    |TEAM_ABBREVIATION |character |Short team abbreviation (e.g. 'LAS').                       |
#'    |TEAM_NAME         |character |Full team display name (e.g. 'Las Vegas Aces').             |
#'    |BLK               |character |Blocks.                                                     |
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
  .args <- .capture_args()

  lifecycle::deprecate_stop(
    when = "2.1.0",
    what = "wnba_homepagev2()",
    with = "wnba_homepagewidget()"
  )
  
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
#'    \if{html}{\tabular{lll}{
#'       col_name \tab types \tab description \cr
#'       title \tab character \tab Title or label for the record. \cr
#'       deep_link \tab character \tab Deep link URL into wnba.com / espn.com. \cr
#'       name \tab character \tab Display name. \cr
#'       timestamp \tab character \tab ISO 8601 UTC timestamp. \cr
#'       season \tab character \tab Season identifier (4-digit year or 'YYYY-YY' string). \cr
#'       seasontype \tab character \tab Season type ('Regular Season', 'Playoffs', 'Pre Season', 'All Star'). \cr
#'       permode \tab character \tab Per-mode aggregation ('Totals', 'PerGame', 'Per40', 'Per100Possessions', etc.). \cr
#'       RANK \tab integer \tab Whether to include statistical ranks in the returned table. \cr
#'       PLAYER_ID \tab integer \tab Unique player identifier. \cr
#'       PLAYER_NAME \tab character \tab Player name. \cr
#'       TEAM_ID \tab integer \tab Unique team identifier. \cr
#'       TEAM_ABBREVIATION \tab character \tab Short team abbreviation (e.g. 'LAS'). \cr
#'       PTS \tab numeric \tab Points scored. \cr
#'       FIRST_NAME \tab character \tab Player's first name. \cr
#'       NICKNAME \tab character \tab Team or athlete nickname. \cr
#'       LAST_NAME \tab character \tab Player's last name. \cr
#'       JERSEY_NUM \tab character \tab Jersey number worn by the player. \cr
#'       POSITION \tab character \tab Listed roster position (G, F, C, etc.). \cr
#'    }}
#'    \if{latex}{See the HTML help or pkgdown reference for the column table.}
#'    
#'    **REB** 
#'    
#'    
#'    \if{html}{\tabular{lll}{
#'       col_name \tab types \tab description \cr
#'       title \tab character \tab Title or label for the record. \cr
#'       deep_link \tab character \tab Deep link URL into wnba.com / espn.com. \cr
#'       name \tab character \tab Display name. \cr
#'       timestamp \tab character \tab ISO 8601 UTC timestamp. \cr
#'       season \tab character \tab Season identifier (4-digit year or 'YYYY-YY' string). \cr
#'       seasontype \tab character \tab Season type ('Regular Season', 'Playoffs', 'Pre Season', 'All Star'). \cr
#'       permode \tab character \tab Per-mode aggregation ('Totals', 'PerGame', 'Per40', 'Per100Possessions', etc.). \cr
#'       RANK \tab integer \tab Whether to include statistical ranks in the returned table. \cr
#'       PLAYER_ID \tab integer \tab Unique player identifier. \cr
#'       PLAYER_NAME \tab character \tab Player name. \cr
#'       TEAM_ID \tab integer \tab Unique team identifier. \cr
#'       TEAM_ABBREVIATION \tab character \tab Short team abbreviation (e.g. 'LAS'). \cr
#'       REB \tab numeric \tab Total rebounds. \cr
#'       FIRST_NAME \tab character \tab Player's first name. \cr
#'       NICKNAME \tab character \tab Team or athlete nickname. \cr
#'       LAST_NAME \tab character \tab Player's last name. \cr
#'       JERSEY_NUM \tab character \tab Jersey number worn by the player. \cr
#'       POSITION \tab character \tab Listed roster position (G, F, C, etc.). \cr
#'    }}
#'    \if{latex}{See the HTML help or pkgdown reference for the column table.}
#'    
#'    **AST** 
#'    
#'    
#'    \if{html}{\tabular{lll}{
#'       col_name \tab types \tab description \cr
#'       title \tab character \tab Title or label for the record. \cr
#'       deep_link \tab character \tab Deep link URL into wnba.com / espn.com. \cr
#'       name \tab character \tab Display name. \cr
#'       timestamp \tab character \tab ISO 8601 UTC timestamp. \cr
#'       season \tab character \tab Season identifier (4-digit year or 'YYYY-YY' string). \cr
#'       seasontype \tab character \tab Season type ('Regular Season', 'Playoffs', 'Pre Season', 'All Star'). \cr
#'       permode \tab character \tab Per-mode aggregation ('Totals', 'PerGame', 'Per40', 'Per100Possessions', etc.). \cr
#'       RANK \tab integer \tab Whether to include statistical ranks in the returned table. \cr
#'       PLAYER_ID \tab integer \tab Unique player identifier. \cr
#'       PLAYER_NAME \tab character \tab Player name. \cr
#'       TEAM_ID \tab integer \tab Unique team identifier. \cr
#'       TEAM_ABBREVIATION \tab character \tab Short team abbreviation (e.g. 'LAS'). \cr
#'       AST \tab numeric \tab Assists. \cr
#'       FIRST_NAME \tab character \tab Player's first name. \cr
#'       NICKNAME \tab character \tab Team or athlete nickname. \cr
#'       LAST_NAME \tab character \tab Player's last name. \cr
#'       JERSEY_NUM \tab character \tab Jersey number worn by the player. \cr
#'       POSITION \tab character \tab Listed roster position (G, F, C, etc.). \cr
#'    }}
#'    \if{latex}{See the HTML help or pkgdown reference for the column table.}
#'    
#'    **BLK** 
#'    
#'    
#'    \if{html}{\tabular{lll}{
#'       col_name \tab types \tab description \cr
#'       title \tab character \tab Title or label for the record. \cr
#'       deep_link \tab character \tab Deep link URL into wnba.com / espn.com. \cr
#'       name \tab character \tab Display name. \cr
#'       timestamp \tab character \tab ISO 8601 UTC timestamp. \cr
#'       season \tab character \tab Season identifier (4-digit year or 'YYYY-YY' string). \cr
#'       seasontype \tab character \tab Season type ('Regular Season', 'Playoffs', 'Pre Season', 'All Star'). \cr
#'       permode \tab character \tab Per-mode aggregation ('Totals', 'PerGame', 'Per40', 'Per100Possessions', etc.). \cr
#'       RANK \tab integer \tab Whether to include statistical ranks in the returned table. \cr
#'       PLAYER_ID \tab integer \tab Unique player identifier. \cr
#'       PLAYER_NAME \tab character \tab Player name. \cr
#'       TEAM_ID \tab integer \tab Unique team identifier. \cr
#'       TEAM_ABBREVIATION \tab character \tab Short team abbreviation (e.g. 'LAS'). \cr
#'       BLK \tab numeric \tab Blocks. \cr
#'       FIRST_NAME \tab character \tab Player's first name. \cr
#'       NICKNAME \tab character \tab Team or athlete nickname. \cr
#'       LAST_NAME \tab character \tab Player's last name. \cr
#'       JERSEY_NUM \tab character \tab Jersey number worn by the player. \cr
#'       POSITION \tab character \tab Listed roster position (G, F, C, etc.). \cr
#'    }}
#'    \if{latex}{See the HTML help or pkgdown reference for the column table.}
#'    
#'    **STL** 
#'    
#'    
#'    \if{html}{\tabular{lll}{
#'       col_name \tab types \tab description \cr
#'       title \tab character \tab Title or label for the record. \cr
#'       deep_link \tab character \tab Deep link URL into wnba.com / espn.com. \cr
#'       name \tab character \tab Display name. \cr
#'       timestamp \tab character \tab ISO 8601 UTC timestamp. \cr
#'       season \tab character \tab Season identifier (4-digit year or 'YYYY-YY' string). \cr
#'       seasontype \tab character \tab Season type ('Regular Season', 'Playoffs', 'Pre Season', 'All Star'). \cr
#'       permode \tab character \tab Per-mode aggregation ('Totals', 'PerGame', 'Per40', 'Per100Possessions', etc.). \cr
#'       RANK \tab integer \tab Whether to include statistical ranks in the returned table. \cr
#'       PLAYER_ID \tab integer \tab Unique player identifier. \cr
#'       PLAYER_NAME \tab character \tab Player name. \cr
#'       TEAM_ID \tab integer \tab Unique team identifier. \cr
#'       TEAM_ABBREVIATION \tab character \tab Short team abbreviation (e.g. 'LAS'). \cr
#'       STL \tab numeric \tab Steals. \cr
#'       FIRST_NAME \tab character \tab Player's first name. \cr
#'       NICKNAME \tab character \tab Team or athlete nickname. \cr
#'       LAST_NAME \tab character \tab Player's last name. \cr
#'       JERSEY_NUM \tab character \tab Jersey number worn by the player. \cr
#'       POSITION \tab character \tab Listed roster position (G, F, C, etc.). \cr
#'    }}
#'    \if{latex}{See the HTML help or pkgdown reference for the column table.}
#'    
#'    **FG_PCT** 
#'    
#'    
#'    \if{html}{\tabular{lll}{
#'       col_name \tab types \tab description \cr
#'       title \tab character \tab Title or label for the record. \cr
#'       deep_link \tab character \tab Deep link URL into wnba.com / espn.com. \cr
#'       name \tab character \tab Display name. \cr
#'       timestamp \tab character \tab ISO 8601 UTC timestamp. \cr
#'       season \tab character \tab Season identifier (4-digit year or 'YYYY-YY' string). \cr
#'       seasontype \tab character \tab Season type ('Regular Season', 'Playoffs', 'Pre Season', 'All Star'). \cr
#'       permode \tab character \tab Per-mode aggregation ('Totals', 'PerGame', 'Per40', 'Per100Possessions', etc.). \cr
#'       RANK \tab integer \tab Whether to include statistical ranks in the returned table. \cr
#'       PLAYER_ID \tab integer \tab Unique player identifier. \cr
#'       PLAYER_NAME \tab character \tab Player name. \cr
#'       TEAM_ID \tab integer \tab Unique team identifier. \cr
#'       TEAM_ABBREVIATION \tab character \tab Short team abbreviation (e.g. 'LAS'). \cr
#'       FG_PCT \tab numeric \tab Field goal percentage (0-1). \cr
#'       FIRST_NAME \tab character \tab Player's first name. \cr
#'       NICKNAME \tab character \tab Team or athlete nickname. \cr
#'       LAST_NAME \tab character \tab Player's last name. \cr
#'       JERSEY_NUM \tab character \tab Jersey number worn by the player. \cr
#'       POSITION \tab character \tab Listed roster position (G, F, C, etc.). \cr
#'    }}
#'    \if{latex}{See the HTML help or pkgdown reference for the column table.}
#'    
#'    **FG3M** 
#'    
#'    
#'    \if{html}{\tabular{lll}{
#'       col_name \tab types \tab description \cr
#'       title \tab character \tab Title or label for the record. \cr
#'       deep_link \tab character \tab Deep link URL into wnba.com / espn.com. \cr
#'       name \tab character \tab Display name. \cr
#'       timestamp \tab character \tab ISO 8601 UTC timestamp. \cr
#'       season \tab character \tab Season identifier (4-digit year or 'YYYY-YY' string). \cr
#'       seasontype \tab character \tab Season type ('Regular Season', 'Playoffs', 'Pre Season', 'All Star'). \cr
#'       permode \tab character \tab Per-mode aggregation ('Totals', 'PerGame', 'Per40', 'Per100Possessions', etc.). \cr
#'       RANK \tab integer \tab Whether to include statistical ranks in the returned table. \cr
#'       PLAYER_ID \tab integer \tab Unique player identifier. \cr
#'       PLAYER_NAME \tab character \tab Player name. \cr
#'       TEAM_ID \tab integer \tab Unique team identifier. \cr
#'       TEAM_ABBREVIATION \tab character \tab Short team abbreviation (e.g. 'LAS'). \cr
#'       FG3M \tab integer \tab Three-point field goals made. \cr
#'       FIRST_NAME \tab character \tab Player's first name. \cr
#'       NICKNAME \tab character \tab Team or athlete nickname. \cr
#'       LAST_NAME \tab character \tab Player's last name. \cr
#'       JERSEY_NUM \tab character \tab Jersey number worn by the player. \cr
#'       POSITION \tab character \tab Listed roster position (G, F, C, etc.). \cr
#'    }}
#'    \if{latex}{See the HTML help or pkgdown reference for the column table.}
#'    
#'    **FG3_PCT** 
#'    
#'    
#'    \if{html}{\tabular{lll}{
#'       col_name \tab types \tab description \cr
#'       title \tab character \tab Title or label for the record. \cr
#'       deep_link \tab character \tab Deep link URL into wnba.com / espn.com. \cr
#'       name \tab character \tab Display name. \cr
#'       timestamp \tab character \tab ISO 8601 UTC timestamp. \cr
#'       season \tab character \tab Season identifier (4-digit year or 'YYYY-YY' string). \cr
#'       seasontype \tab character \tab Season type ('Regular Season', 'Playoffs', 'Pre Season', 'All Star'). \cr
#'       permode \tab character \tab Per-mode aggregation ('Totals', 'PerGame', 'Per40', 'Per100Possessions', etc.). \cr
#'       RANK \tab integer \tab Whether to include statistical ranks in the returned table. \cr
#'       PLAYER_ID \tab integer \tab Unique player identifier. \cr
#'       PLAYER_NAME \tab character \tab Player name. \cr
#'       TEAM_ID \tab integer \tab Unique team identifier. \cr
#'       TEAM_ABBREVIATION \tab character \tab Short team abbreviation (e.g. 'LAS'). \cr
#'       FG3_PCT \tab numeric \tab Three-point field goal percentage (0-1). \cr
#'       FIRST_NAME \tab character \tab Player's first name. \cr
#'       NICKNAME \tab character \tab Team or athlete nickname. \cr
#'       LAST_NAME \tab character \tab Player's last name. \cr
#'       JERSEY_NUM \tab character \tab Jersey number worn by the player. \cr
#'       POSITION \tab character \tab Listed roster position (G, F, C, etc.). \cr
#'    }}
#'    \if{latex}{See the HTML help or pkgdown reference for the column table.}
#'    
#'    **FANTASY_POINTS** 
#'    
#'    
#'    \if{html}{\tabular{lll}{
#'       col_name \tab types \tab description \cr
#'       title \tab character \tab Title or label for the record. \cr
#'       deep_link \tab character \tab Deep link URL into wnba.com / espn.com. \cr
#'       name \tab character \tab Display name. \cr
#'       timestamp \tab character \tab ISO 8601 UTC timestamp. \cr
#'       season \tab character \tab Season identifier (4-digit year or 'YYYY-YY' string). \cr
#'       seasontype \tab character \tab Season type ('Regular Season', 'Playoffs', 'Pre Season', 'All Star'). \cr
#'       permode \tab character \tab Per-mode aggregation ('Totals', 'PerGame', 'Per40', 'Per100Possessions', etc.). \cr
#'       PLAYER_ID \tab integer \tab Unique player identifier. \cr
#'       PLAYER_NAME \tab character \tab Player name. \cr
#'       TEAM_ID \tab integer \tab Unique team identifier. \cr
#'       TEAM_ABBREVIATION \tab character \tab Short team abbreviation (e.g. 'LAS'). \cr
#'       FANTASY_POINTS \tab numeric \tab  \cr
#'       FIRST_NAME \tab character \tab Player's first name. \cr
#'       NICKNAME \tab character \tab Team or athlete nickname. \cr
#'       LAST_NAME \tab character \tab Player's last name. \cr
#'       JERSEY_NUM \tab character \tab Jersey number worn by the player. \cr
#'       POSITION \tab character \tab Listed roster position (G, F, C, etc.). \cr
#'    }}
#'    \if{latex}{See the HTML help or pkgdown reference for the column table.}
#'    
#'    **TOTAL_PTS** 
#'    
#'    
#'    \if{html}{\tabular{lll}{
#'       col_name \tab types \tab description \cr
#'       title \tab character \tab Title or label for the record. \cr
#'       deep_link \tab character \tab Deep link URL into wnba.com / espn.com. \cr
#'       name \tab character \tab Display name. \cr
#'       timestamp \tab character \tab ISO 8601 UTC timestamp. \cr
#'       permode \tab character \tab Per-mode aggregation ('Totals', 'PerGame', 'Per40', 'Per100Possessions', etc.). \cr
#'       season \tab character \tab Season identifier (4-digit year or 'YYYY-YY' string). \cr
#'       seasontype \tab character \tab Season type ('Regular Season', 'Playoffs', 'Pre Season', 'All Star'). \cr
#'       PLAYER_ID \tab integer \tab Unique player identifier. \cr
#'       PLAYER_NAME \tab character \tab Player name. \cr
#'       PLAYER_NAME_LAST_FIRST \tab character \tab  \cr
#'       NICKNAME \tab character \tab Team or athlete nickname. \cr
#'       TEAM_ID \tab integer \tab Unique team identifier. \cr
#'       TEAM_ABBREVIATION \tab character \tab Short team abbreviation (e.g. 'LAS'). \cr
#'       TEAM_NAME \tab character \tab Full team display name (e.g. 'Las Vegas Aces'). \cr
#'       PTS \tab integer \tab Points scored. \cr
#'    }}
#'    \if{latex}{See the HTML help or pkgdown reference for the column table.}
#'    
#'    **TOTAL_REB** 
#'    
#'    
#'    \if{html}{\tabular{lll}{
#'       col_name \tab types \tab description \cr
#'       title \tab character \tab Title or label for the record. \cr
#'       deep_link \tab character \tab Deep link URL into wnba.com / espn.com. \cr
#'       name \tab character \tab Display name. \cr
#'       timestamp \tab character \tab ISO 8601 UTC timestamp. \cr
#'       permode \tab character \tab Per-mode aggregation ('Totals', 'PerGame', 'Per40', 'Per100Possessions', etc.). \cr
#'       season \tab character \tab Season identifier (4-digit year or 'YYYY-YY' string). \cr
#'       seasontype \tab character \tab Season type ('Regular Season', 'Playoffs', 'Pre Season', 'All Star'). \cr
#'       PLAYER_ID \tab integer \tab Unique player identifier. \cr
#'       PLAYER_NAME \tab character \tab Player name. \cr
#'       PLAYER_NAME_LAST_FIRST \tab character \tab  \cr
#'       NICKNAME \tab character \tab Team or athlete nickname. \cr
#'       TEAM_ID \tab integer \tab Unique team identifier. \cr
#'       TEAM_ABBREVIATION \tab character \tab Short team abbreviation (e.g. 'LAS'). \cr
#'       TEAM_NAME \tab character \tab Full team display name (e.g. 'Las Vegas Aces'). \cr
#'       REB \tab integer \tab Total rebounds. \cr
#'    }}
#'    \if{latex}{See the HTML help or pkgdown reference for the column table.}
#'    
#'    **TOTAL_AST** 
#'    
#'    
#'    \if{html}{\tabular{lll}{
#'       col_name \tab types \tab description \cr
#'       title \tab character \tab Title or label for the record. \cr
#'       deep_link \tab character \tab Deep link URL into wnba.com / espn.com. \cr
#'       name \tab character \tab Display name. \cr
#'       timestamp \tab character \tab ISO 8601 UTC timestamp. \cr
#'       permode \tab character \tab Per-mode aggregation ('Totals', 'PerGame', 'Per40', 'Per100Possessions', etc.). \cr
#'       season \tab character \tab Season identifier (4-digit year or 'YYYY-YY' string). \cr
#'       seasontype \tab character \tab Season type ('Regular Season', 'Playoffs', 'Pre Season', 'All Star'). \cr
#'       PLAYER_ID \tab integer \tab Unique player identifier. \cr
#'       PLAYER_NAME \tab character \tab Player name. \cr
#'       PLAYER_NAME_LAST_FIRST \tab character \tab  \cr
#'       NICKNAME \tab character \tab Team or athlete nickname. \cr
#'       TEAM_ID \tab integer \tab Unique team identifier. \cr
#'       TEAM_ABBREVIATION \tab character \tab Short team abbreviation (e.g. 'LAS'). \cr
#'       TEAM_NAME \tab character \tab Full team display name (e.g. 'Las Vegas Aces'). \cr
#'       AST \tab integer \tab Assists. \cr
#'    }}
#'    \if{latex}{See the HTML help or pkgdown reference for the column table.}
#'    
#'    **ALL_TIME_TD3** 
#'    
#'    
#'    \if{html}{\tabular{lll}{
#'       col_name \tab types \tab description \cr
#'       title \tab character \tab Title or label for the record. \cr
#'       deep_link \tab character \tab Deep link URL into wnba.com / espn.com. \cr
#'       name \tab character \tab Display name. \cr
#'       timestamp \tab character \tab ISO 8601 UTC timestamp. \cr
#'       permode \tab character \tab Per-mode aggregation ('Totals', 'PerGame', 'Per40', 'Per100Possessions', etc.). \cr
#'       season \tab character \tab Season identifier (4-digit year or 'YYYY-YY' string). \cr
#'       seasontype \tab character \tab Season type ('Regular Season', 'Playoffs', 'Pre Season', 'All Star'). \cr
#'       PLAYER_ID \tab integer \tab Unique player identifier. \cr
#'       PLAYER_NAME \tab character \tab Player name. \cr
#'       PLAYER_NAME_LAST_FIRST \tab character \tab  \cr
#'       TD3 \tab integer \tab  \cr
#'    }}
#'    \if{latex}{See the HTML help or pkgdown reference for the column table.}
#'    
#'    **TD3** 
#'    
#'    
#'    \if{html}{\tabular{lll}{
#'       col_name \tab types \tab description \cr
#'       title \tab character \tab Title or label for the record. \cr
#'       deep_link \tab character \tab Deep link URL into wnba.com / espn.com. \cr
#'       name \tab character \tab Display name. \cr
#'       timestamp \tab character \tab ISO 8601 UTC timestamp. \cr
#'       permode \tab character \tab Per-mode aggregation ('Totals', 'PerGame', 'Per40', 'Per100Possessions', etc.). \cr
#'       season \tab character \tab Season identifier (4-digit year or 'YYYY-YY' string). \cr
#'       seasontype \tab character \tab Season type ('Regular Season', 'Playoffs', 'Pre Season', 'All Star'). \cr
#'       PLAYER_ID \tab integer \tab Unique player identifier. \cr
#'       PLAYER_NAME \tab character \tab Player name. \cr
#'       PLAYER_NAME_LAST_FIRST \tab character \tab  \cr
#'       TEAM_ABBREVIATION \tab character \tab Short team abbreviation (e.g. 'LAS'). \cr
#'       SEASON_YEAR \tab character \tab Season year string ('YYYY-YY' format). \cr
#'       TD3 \tab integer \tab  \cr
#'    }}
#'    \if{latex}{See the HTML help or pkgdown reference for the column table.}
#'    
#'    **GAME_FG3M** 
#'    
#'    
#'    \if{html}{\tabular{lll}{
#'       col_name \tab types \tab description \cr
#'       title \tab character \tab Title or label for the record. \cr
#'       deep_link \tab character \tab Deep link URL into wnba.com / espn.com. \cr
#'       name \tab character \tab Display name. \cr
#'       timestamp \tab character \tab ISO 8601 UTC timestamp. \cr
#'       permode \tab character \tab Per-mode aggregation ('Totals', 'PerGame', 'Per40', 'Per100Possessions', etc.). \cr
#'       season \tab character \tab Season identifier (4-digit year or 'YYYY-YY' string). \cr
#'       seasontype \tab character \tab Season type ('Regular Season', 'Playoffs', 'Pre Season', 'All Star'). \cr
#'       PLAYER_ID \tab integer \tab Unique player identifier. \cr
#'       PLAYER_NAME \tab character \tab Player name. \cr
#'       PLAYER_NAME_LAST_FIRST \tab character \tab  \cr
#'       NICKNAME \tab character \tab Team or athlete nickname. \cr
#'       TEAM_ID \tab integer \tab Unique team identifier. \cr
#'       TEAM_ABBREVIATION \tab character \tab Short team abbreviation (e.g. 'LAS'). \cr
#'       TEAM_NAME \tab character \tab Full team display name (e.g. 'Las Vegas Aces'). \cr
#'       FG3M \tab integer \tab Three-point field goals made. \cr
#'       GAME_ID \tab character \tab Unique game identifier. \cr
#'    }}
#'    \if{latex}{See the HTML help or pkgdown reference for the column table.}
#'    
#'    **GAME_PTS** 
#'    
#'    
#'    \if{html}{\tabular{lll}{
#'       col_name \tab types \tab description \cr
#'       title \tab character \tab Title or label for the record. \cr
#'       deep_link \tab character \tab Deep link URL into wnba.com / espn.com. \cr
#'       name \tab character \tab Display name. \cr
#'       timestamp \tab character \tab ISO 8601 UTC timestamp. \cr
#'       permode \tab character \tab Per-mode aggregation ('Totals', 'PerGame', 'Per40', 'Per100Possessions', etc.). \cr
#'       season \tab character \tab Season identifier (4-digit year or 'YYYY-YY' string). \cr
#'       seasontype \tab character \tab Season type ('Regular Season', 'Playoffs', 'Pre Season', 'All Star'). \cr
#'       PLAYER_ID \tab integer \tab Unique player identifier. \cr
#'       PLAYER_NAME \tab character \tab Player name. \cr
#'       PLAYER_NAME_LAST_FIRST \tab character \tab  \cr
#'       NICKNAME \tab character \tab Team or athlete nickname. \cr
#'       TEAM_ID \tab integer \tab Unique team identifier. \cr
#'       TEAM_ABBREVIATION \tab character \tab Short team abbreviation (e.g. 'LAS'). \cr
#'       TEAM_NAME \tab character \tab Full team display name (e.g. 'Las Vegas Aces'). \cr
#'       PTS \tab integer \tab Points scored. \cr
#'       GAME_ID \tab character \tab Unique game identifier. \cr
#'    }}
#'    \if{latex}{See the HTML help or pkgdown reference for the column table.}
#'    
#'    **GAME_AST** 
#'    
#'    
#'    \if{html}{\tabular{lll}{
#'       col_name \tab types \tab description \cr
#'       title \tab character \tab Title or label for the record. \cr
#'       deep_link \tab character \tab Deep link URL into wnba.com / espn.com. \cr
#'       name \tab character \tab Display name. \cr
#'       timestamp \tab character \tab ISO 8601 UTC timestamp. \cr
#'       permode \tab character \tab Per-mode aggregation ('Totals', 'PerGame', 'Per40', 'Per100Possessions', etc.). \cr
#'       season \tab character \tab Season identifier (4-digit year or 'YYYY-YY' string). \cr
#'       seasontype \tab character \tab Season type ('Regular Season', 'Playoffs', 'Pre Season', 'All Star'). \cr
#'       PLAYER_ID \tab integer \tab Unique player identifier. \cr
#'       PLAYER_NAME \tab character \tab Player name. \cr
#'       PLAYER_NAME_LAST_FIRST \tab character \tab  \cr
#'       NICKNAME \tab character \tab Team or athlete nickname. \cr
#'       TEAM_ID \tab integer \tab Unique team identifier. \cr
#'       TEAM_ABBREVIATION \tab character \tab Short team abbreviation (e.g. 'LAS'). \cr
#'       TEAM_NAME \tab character \tab Full team display name (e.g. 'Las Vegas Aces'). \cr
#'       AST \tab integer \tab Assists. \cr
#'       GAME_ID \tab character \tab Unique game identifier. \cr
#'    }}
#'    \if{latex}{See the HTML help or pkgdown reference for the column table.}
#'    
#'    **GAME_STL** 
#'    
#'    
#'    \if{html}{\tabular{lll}{
#'       col_name \tab types \tab description \cr
#'       title \tab character \tab Title or label for the record. \cr
#'       deep_link \tab character \tab Deep link URL into wnba.com / espn.com. \cr
#'       name \tab character \tab Display name. \cr
#'       timestamp \tab character \tab ISO 8601 UTC timestamp. \cr
#'       permode \tab character \tab Per-mode aggregation ('Totals', 'PerGame', 'Per40', 'Per100Possessions', etc.). \cr
#'       season \tab character \tab Season identifier (4-digit year or 'YYYY-YY' string). \cr
#'       seasontype \tab character \tab Season type ('Regular Season', 'Playoffs', 'Pre Season', 'All Star'). \cr
#'       PLAYER_ID \tab integer \tab Unique player identifier. \cr
#'       PLAYER_NAME \tab character \tab Player name. \cr
#'       PLAYER_NAME_LAST_FIRST \tab character \tab  \cr
#'       NICKNAME \tab character \tab Team or athlete nickname. \cr
#'       TEAM_ID \tab integer \tab Unique team identifier. \cr
#'       TEAM_ABBREVIATION \tab character \tab Short team abbreviation (e.g. 'LAS'). \cr
#'       TEAM_NAME \tab character \tab Full team display name (e.g. 'Las Vegas Aces'). \cr
#'       STL \tab integer \tab Steals. \cr
#'       GAME_ID \tab character \tab Unique game identifier. \cr
#'    }}
#'    \if{latex}{See the HTML help or pkgdown reference for the column table.}
#'    
#'    **GAME_BLK** 
#'    
#'    
#'    \if{html}{\tabular{lll}{
#'       col_name \tab types \tab description \cr
#'       title \tab character \tab Title or label for the record. \cr
#'       deep_link \tab character \tab Deep link URL into wnba.com / espn.com. \cr
#'       name \tab character \tab Display name. \cr
#'       timestamp \tab character \tab ISO 8601 UTC timestamp. \cr
#'       permode \tab character \tab Per-mode aggregation ('Totals', 'PerGame', 'Per40', 'Per100Possessions', etc.). \cr
#'       season \tab character \tab Season identifier (4-digit year or 'YYYY-YY' string). \cr
#'       seasontype \tab character \tab Season type ('Regular Season', 'Playoffs', 'Pre Season', 'All Star'). \cr
#'       PLAYER_ID \tab integer \tab Unique player identifier. \cr
#'       PLAYER_NAME \tab character \tab Player name. \cr
#'       PLAYER_NAME_LAST_FIRST \tab character \tab  \cr
#'       NICKNAME \tab character \tab Team or athlete nickname. \cr
#'       TEAM_ID \tab integer \tab Unique team identifier. \cr
#'       TEAM_ABBREVIATION \tab character \tab Short team abbreviation (e.g. 'LAS'). \cr
#'       TEAM_NAME \tab character \tab Full team display name (e.g. 'Las Vegas Aces'). \cr
#'       BLK \tab integer \tab Blocks. \cr
#'       GAME_ID \tab character \tab Unique game identifier. \cr
#'    }}
#'    \if{latex}{See the HTML help or pkgdown reference for the column table.}
#'    
#'    **PCT_PTS_3PT** 
#'    
#'    
#'    \if{html}{\tabular{lll}{
#'       col_name \tab types \tab description \cr
#'       title \tab character \tab Title or label for the record. \cr
#'       deep_link \tab character \tab Deep link URL into wnba.com / espn.com. \cr
#'       name \tab character \tab Display name. \cr
#'       timestamp \tab character \tab ISO 8601 UTC timestamp. \cr
#'       permode \tab character \tab Per-mode aggregation ('Totals', 'PerGame', 'Per40', 'Per100Possessions', etc.). \cr
#'       season \tab character \tab Season identifier (4-digit year or 'YYYY-YY' string). \cr
#'       seasontype \tab character \tab Season type ('Regular Season', 'Playoffs', 'Pre Season', 'All Star'). \cr
#'       PLAYER_ID \tab integer \tab Unique player identifier. \cr
#'       PLAYER_NAME \tab character \tab Player name. \cr
#'       PLAYER_NAME_LAST_FIRST \tab character \tab  \cr
#'       NICKNAME \tab character \tab Team or athlete nickname. \cr
#'       TEAM_ID \tab integer \tab Unique team identifier. \cr
#'       TEAM_ABBREVIATION \tab character \tab Short team abbreviation (e.g. 'LAS'). \cr
#'       TEAM_NAME \tab character \tab Full team display name (e.g. 'Las Vegas Aces'). \cr
#'       PCT_PTS_3PT \tab numeric \tab  \cr
#'    }}
#'    \if{latex}{See the HTML help or pkgdown reference for the column table.}
#'    
#'    **PCT_PTS_2PT** 
#'    
#'    
#'    \if{html}{\tabular{lll}{
#'       col_name \tab types \tab description \cr
#'       title \tab character \tab Title or label for the record. \cr
#'       deep_link \tab character \tab Deep link URL into wnba.com / espn.com. \cr
#'       name \tab character \tab Display name. \cr
#'       timestamp \tab character \tab ISO 8601 UTC timestamp. \cr
#'       permode \tab character \tab Per-mode aggregation ('Totals', 'PerGame', 'Per40', 'Per100Possessions', etc.). \cr
#'       season \tab character \tab Season identifier (4-digit year or 'YYYY-YY' string). \cr
#'       seasontype \tab character \tab Season type ('Regular Season', 'Playoffs', 'Pre Season', 'All Star'). \cr
#'       PLAYER_ID \tab integer \tab Unique player identifier. \cr
#'       PLAYER_NAME \tab character \tab Player name. \cr
#'       PLAYER_NAME_LAST_FIRST \tab character \tab  \cr
#'       NICKNAME \tab character \tab Team or athlete nickname. \cr
#'       TEAM_ID \tab integer \tab Unique team identifier. \cr
#'       TEAM_ABBREVIATION \tab character \tab Short team abbreviation (e.g. 'LAS'). \cr
#'       TEAM_NAME \tab character \tab Full team display name (e.g. 'Las Vegas Aces'). \cr
#'       PCT_PTS_2PT \tab numeric \tab  \cr
#'    }}
#'    \if{latex}{See the HTML help or pkgdown reference for the column table.}
#'    
#'    **PCT_PTS_2PT_MR** 
#'    
#'    
#'    \if{html}{\tabular{lll}{
#'       col_name \tab types \tab description \cr
#'       title \tab character \tab Title or label for the record. \cr
#'       deep_link \tab character \tab Deep link URL into wnba.com / espn.com. \cr
#'       name \tab character \tab Display name. \cr
#'       timestamp \tab character \tab ISO 8601 UTC timestamp. \cr
#'       permode \tab character \tab Per-mode aggregation ('Totals', 'PerGame', 'Per40', 'Per100Possessions', etc.). \cr
#'       season \tab character \tab Season identifier (4-digit year or 'YYYY-YY' string). \cr
#'       seasontype \tab character \tab Season type ('Regular Season', 'Playoffs', 'Pre Season', 'All Star'). \cr
#'       PLAYER_ID \tab integer \tab Unique player identifier. \cr
#'       PLAYER_NAME \tab character \tab Player name. \cr
#'       PLAYER_NAME_LAST_FIRST \tab character \tab  \cr
#'       NICKNAME \tab character \tab Team or athlete nickname. \cr
#'       TEAM_ID \tab integer \tab Unique team identifier. \cr
#'       TEAM_ABBREVIATION \tab character \tab Short team abbreviation (e.g. 'LAS'). \cr
#'       TEAM_NAME \tab character \tab Full team display name (e.g. 'Las Vegas Aces'). \cr
#'       PCT_PTS_2PT_MR \tab numeric \tab  \cr
#'    }}
#'    \if{latex}{See the HTML help or pkgdown reference for the column table.}
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
  .args <- mget(setdiff(names(formals()), "..."))
  
  full_url <- "https://stats.wnba.com/js/data/widgets/home_season.json"
  
  params <- list(
    
  )
  
  df_list <- list()

  tryCatch(
    expr = {
      
      resp <- .retry_request(full_url, headers = wnba_headers_params())
      json <- resp %>%
        .resp_text() %>%
        jsonlite::fromJSON(simplifyVector = TRUE)
      
      
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
    error = function(e) .report_api_error(
      e,
      hint = "Invalid arguments or no homepage widget data for {season} available!",
      args = .args
    ),
    warning = function(w) .report_api_warning(w, args = .args),
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
#'    Columns as documented in the shared [wnba_homepagev2_home_page_stat1_schema] table.
#'
#'    **AllTimeSeasonHigh**
#'
#'
#'    |col_name          |types     |description                                     |
#'    |:-----------------|:---------|:-----------------------------------------------|
#'    |TEAM_ID           |character |Unique team identifier.                         |
#'    |TEAM_ABBREVIATION |character |Short team abbreviation (e.g. 'LAS').           |
#'    |TEAM_NAME         |character |Full team display name (e.g. 'Las Vegas Aces'). |
#'    |SEASON_YEAR       |character |Season year string ('YYYY-YY' format).          |
#'    |PTS               |character |Points scored.                                  |
#'
#'    **LastSeasonHigh**
#'
#'
#'    Columns as documented in the shared [wnba_homepagev2_home_page_stat1_schema] table.
#'
#'    **LowSeasonHigh**
#'
#'
#'    Same columns as the **AllTimeSeasonHigh** table above.
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
  .args <- .capture_args()

  lifecycle::deprecate_stop(
    when = "2.1.0",
    what = "wnba_leaderstiles()",
    with = "wnba_homepagewidget()"
  )
  
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
#'    \if{html}{\tabular{lll}{
#'       col_name \tab types \tab description \cr
#'       PLAYER_ID \tab character \tab Unique player identifier. \cr
#'       RANK \tab character \tab Whether to include statistical ranks in the returned table. \cr
#'       PLAYER \tab character \tab  \cr
#'       TEAM_ID \tab character \tab Unique team identifier. \cr
#'       TEAM \tab character \tab Team-side label or team identifier. \cr
#'       GP \tab character \tab Games played. \cr
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
#'       STL \tab character \tab Steals. \cr
#'       BLK \tab character \tab Blocks. \cr
#'       TOV \tab character \tab Turnovers. \cr
#'       PF \tab character \tab Personal fouls. \cr
#'       PTS \tab character \tab Points scored. \cr
#'       EFF \tab character \tab  \cr
#'       AST_TOV \tab character \tab  \cr
#'       STL_TOV \tab character \tab  \cr
#'    }}
#'    \if{latex}{See the HTML help or pkgdown reference for the column table.}
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
  .args <- mget(setdiff(names(formals()), "..."))
  
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
  
  df_list <- list()

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
    error = function(e) .report_api_error(
      e,
      hint = "Invalid arguments or no league leaders data for {season} available!",
      args = .args
    ),
    warning = function(w) .report_api_warning(w, args = .args),
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
