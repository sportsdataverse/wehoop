#' **Get WNBA Stats API League Hustle Stats Player**
#' @name wnba_leaguehustlestatsplayer
NULL
#' @title
#' **Get WNBA Stats API League Hustle Stats Player**
#' @rdname wnba_leaguehustlestatsplayer
#' @author Saiem Gilani
#' @param college college
#' @param conference conference
#' @param country country
#' @param date_from date_from
#' @param date_to date_to
#' @param division division
#' @param draft_pick draft_pick
#' @param draft_year draft_year
#' @param height height
#' @param last_n_games last_n_games
#' @param league_id league_id
#' @param location location
#' @param month month
#' @param opponent_team_id opponent_team_id
#' @param outcome outcome
#' @param po_round po_round
#' @param per_mode per_mode
#' @param player_experience player_experience
#' @param player_position player_position
#' @param season season
#' @param season_segment season_segment
#' @param season_type season_type
#' @param team_id team_id
#' @param vs_conference vs_conference
#' @param vs_division vs_division
#' @param weight weight
#' @param ... Additional arguments passed to an underlying function like httr.
#' @return Returns a named list of data frames: HustleStatsPlayer
#' 
#'    **HustleStatsPlayer** 
#'    
#'    
#'    |col_name                      |types     |
#'    |:-----------------------------|:---------|
#'    |PLAYER_ID                     |character |
#'    |PLAYER_NAME                   |character |
#'    |TEAM_ID                       |character |
#'    |TEAM_ABBREVIATION             |character |
#'    |AGE                           |character |
#'    |G                             |character |
#'    |MIN                           |character |
#'    |CONTESTED_SHOTS               |character |
#'    |CONTESTED_SHOTS_2PT           |character |
#'    |CONTESTED_SHOTS_3PT           |character |
#'    |DEFLECTIONS                   |character |
#'    |CHARGES_DRAWN                 |character |
#'    |SCREEN_ASSISTS                |character |
#'    |SCREEN_AST_PTS                |character |
#'    |OFF_LOOSE_BALLS_RECOVERED     |character |
#'    |DEF_LOOSE_BALLS_RECOVERED     |character |
#'    |LOOSE_BALLS_RECOVERED         |character |
#'    |PCT_LOOSE_BALLS_RECOVERED_OFF |character |
#'    |PCT_LOOSE_BALLS_RECOVERED_DEF |character |
#'    |OFF_BOXOUTS                   |character |
#'    |DEF_BOXOUTS                   |character |
#'    |BOX_OUT_PLAYER_TEAM_REBS      |character |
#'    |BOX_OUT_PLAYER_REBS           |character |
#'    |BOX_OUTS                      |character |
#'    |PCT_BOX_OUTS_OFF              |character |
#'    |PCT_BOX_OUTS_DEF              |character |
#'    |PCT_BOX_OUTS_TEAM_REB         |character |
#'    |PCT_BOX_OUTS_REB              |character |
#' 
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows as_tibble
#' @import rvest
#' @export
#' @family WNBA Hustle Functions
#' @details
#' ```r
#'  wnba_leaguehustlestatsplayer(league_id = '10')
#'  wnba_leaguehustlestatsplayer(league_id = '10', team_id = '1611661324')
#' ```
wnba_leaguehustlestatsplayer <- function(
    college = '',
    conference = '',
    country = '',
    date_from = '',
    date_to = '',
    division = '',
    draft_pick = '',
    draft_year = '',
    height = '',
    last_n_games = 0,
    league_id = '10',
    location = '',
    month = 0,
    opponent_team_id = 0,
    outcome = '',
    po_round = '',
    per_mode = 'Totals',
    player_experience = '',
    player_position = '',
    season = most_recent_wnba_season() - 1,
    season_segment = '',
    season_type = 'Regular Season',
    team_id = '',
    vs_conference = '',
    vs_division = '',
    weight = '',
    ...){
  
  # Intentional
  # season_type <- gsub(' ','+',season_type)
  version <- "leaguehustlestatsplayer"
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
    Height = height,
    LeagueID = league_id,
    Location = location,
    Month = month,
    OpponentTeamID = opponent_team_id,
    Outcome = outcome,
    PORound = po_round,
    PerMode = per_mode,
    PlayerExperience = player_experience,
    PlayerPosition = player_position,
    Season = season,
    SeasonSegment = season_segment,
    SeasonType = season_type,
    TeamID = team_id,
    VsConference = vs_conference,
    VsDivision = vs_division,
    Weight = weight
  )
  
  tryCatch(
    expr = {
      
      resp <- request_with_proxy(url = full_url, params = params, ...)
      
      df_list <- wnba_stats_map_result_sets(resp)
      
    },
    error = function(e) {
      cli::cli_alert_danger("{Sys.time()}: Invalid arguments or no league hustle player stats data available for {season}!")
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

#' **Get WNBA Stats API League Hustle Stats Player Leaders**
#' @name wnba_leaguehustlestatsplayerleaders
NULL
#' @title
#' **Get WNBA Stats API League Hustle Stats Player Leaders**
#' @rdname wnba_leaguehustlestatsplayerleaders
#' @author Saiem Gilani
#' @param college college
#' @param conference conference
#' @param country country
#' @param date_from date_from
#' @param date_to date_to
#' @param division division
#' @param draft_pick draft_pick
#' @param draft_year draft_year
#' @param height height
#' @param last_n_games last_n_games
#' @param league_id league_id
#' @param location location
#' @param month month
#' @param opponent_team_id opponent_team_id
#' @param outcome outcome
#' @param po_round po_round
#' @param per_mode per_mode
#' @param player_experience player_experience
#' @param player_position player_position
#' @param season season
#' @param season_segment season_segment
#' @param season_type season_type
#' @param team_id team_id
#' @param vs_conference vs_conference
#' @param vs_division vs_division
#' @param weight weight
#' @param ... Additional arguments passed to an underlying function like httr.
#' @return Returns a named list of data frames: PlayerChargesDrawnLeaders, 
#' PlayerContestedShotsLeaders, PlayerDeflectionsLeaders, PlayerLooseBallLeaders, 
#' PlayerScreenAssistLeaders, Table5
#' 
#'    **PlayerContestedShotsLeaders** 
#'    
#'    
#'    |col_name          |types     |
#'    |:-----------------|:---------|
#'    |PLAYER_ID         |character |
#'    |PLAYER_NAME       |character |
#'    |TEAM_ID           |character |
#'    |TEAM_ABBREVIATION |character |
#'    |AGE               |character |
#'    |RANK              |character |
#'    |CONTESTED_SHOTS   |character |
#'    
#'    **PlayerChargesDrawnLeaders** 
#'    
#'    
#'    |col_name          |types     |
#'    |:-----------------|:---------|
#'    |PLAYER_ID         |character |
#'    |PLAYER_NAME       |character |
#'    |TEAM_ID           |character |
#'    |TEAM_ABBREVIATION |character |
#'    |AGE               |character |
#'    |RANK              |character |
#'    |CHARGES_DRAWN     |character |
#'    
#'    **PlayerDeflectionsLeaders** 
#'    
#'    
#'    |col_name          |types     |
#'    |:-----------------|:---------|
#'    |PLAYER_ID         |character |
#'    |PLAYER_NAME       |character |
#'    |TEAM_ID           |character |
#'    |TEAM_ABBREVIATION |character |
#'    |AGE               |character |
#'    |RANK              |character |
#'    |DEFLECTIONS       |character |
#'    
#'    **PlayerLooseBallLeaders** 
#'    
#'    
#'    |col_name              |types     |
#'    |:---------------------|:---------|
#'    |PLAYER_ID             |character |
#'    |PLAYER_NAME           |character |
#'    |TEAM_ID               |character |
#'    |TEAM_ABBREVIATION     |character |
#'    |AGE                   |character |
#'    |RANK                  |character |
#'    |LOOSE_BALLS_RECOVERED |character |
#'    
#'    **PlayerScreenAssistLeaders** 
#'    
#'    
#'    |col_name          |types     |
#'    |:-----------------|:---------|
#'    |PLAYER_ID         |character |
#'    |PLAYER_NAME       |character |
#'    |TEAM_ID           |character |
#'    |TEAM_ABBREVIATION |character |
#'    |AGE               |character |
#'    |RANK              |character |
#'    |SCREEN_ASSISTS    |character |
#'    
#'    **Table5** 
#'    
#'    
#'    |col_name          |types     |
#'    |:-----------------|:---------|
#'    |PLAYER_ID         |character |
#'    |PLAYER_NAME       |character |
#'    |TEAM_ID           |character |
#'    |TEAM_ABBREVIATION |character |
#'    |AGE               |character |
#'    |RANK              |character |
#'    |BOX_OUTS          |character |
#' 
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows as_tibble
#' @import rvest
#' @export
#' @family WNBA Hustle Functions
#' @details
#' ```r
#'   wnba_leaguehustlestatsplayerleaders(league_id = '10')
#' ```
wnba_leaguehustlestatsplayerleaders <- function(
    college = '',
    conference = '',
    country = '',
    date_from = '',
    date_to = '',
    division = '',
    draft_pick = '',
    draft_year = '',
    height = '',
    last_n_games = 0,
    league_id = '10',
    location = '',
    month = 0,
    opponent_team_id = 0,
    outcome = '',
    po_round = '',
    per_mode = 'Totals',
    player_experience = '',
    player_position = '',
    season = most_recent_wnba_season() - 1,
    season_segment = '',
    season_type = 'Regular Season',
    team_id = '',
    vs_conference = '',
    vs_division = '',
    weight = '',
    ...){
  
  # Intentional
  # season_type <- gsub(' ','+',season_type)
  version <- "leaguehustlestatsplayerleaders"
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
    Height = height,
    LeagueID = league_id,
    Location = location,
    Month = month,
    OpponentTeamID = opponent_team_id,
    Outcome = outcome,
    PORound = po_round,
    PerMode = per_mode,
    PlayerExperience = player_experience,
    PlayerPosition = player_position,
    Season = season,
    SeasonSegment = season_segment,
    SeasonType = season_type,
    TeamID = team_id,
    VsConference = vs_conference,
    VsDivision = vs_division,
    Weight = weight
  )
  
  tryCatch(
    expr = {
      
      resp <- request_with_proxy(url = full_url, params = params, ...)
      
      df_list <- wnba_stats_map_result_sets(resp)
      
    },
    error = function(e) {
      cli::cli_alert_danger("{Sys.time()}: Invalid arguments or no league hustle stats player leaders data available for {season}!")
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

#' **Get WNBA Stats API League Hustle Stats Team**
#' @name wnba_leaguehustlestatsteam
NULL
#' @title
#' **Get WNBA Stats API League Hustle Stats Team**
#' @rdname wnba_leaguehustlestatsteam
#' @author Saiem Gilani
#' @param college college
#' @param conference conference
#' @param country country
#' @param date_from date_from
#' @param date_to date_to
#' @param division division
#' @param draft_pick draft_pick
#' @param draft_year draft_year
#' @param height height
#' @param last_n_games last_n_games
#' @param league_id league_id
#' @param location location
#' @param month month
#' @param opponent_team_id opponent_team_id
#' @param outcome outcome
#' @param po_round po_round
#' @param per_mode per_mode
#' @param player_experience player_experience
#' @param player_position player_position
#' @param season season
#' @param season_segment season_segment
#' @param season_type season_type
#' @param team_id team_id
#' @param vs_conference vs_conference
#' @param vs_division vs_division
#' @param weight weight
#' @param ... Additional arguments passed to an underlying function like httr.
#' @return Returns a named list of data frames: HustleStatsTeam
#' 
#'    **HustleStatsTeam** 
#'    
#'    
#'    |col_name                      |types     |
#'    |:-----------------------------|:---------|
#'    |TEAM_ID                       |character |
#'    |TEAM_NAME                     |character |
#'    |MIN                           |character |
#'    |CONTESTED_SHOTS               |character |
#'    |CONTESTED_SHOTS_2PT           |character |
#'    |CONTESTED_SHOTS_3PT           |character |
#'    |DEFLECTIONS                   |character |
#'    |CHARGES_DRAWN                 |character |
#'    |SCREEN_ASSISTS                |character |
#'    |SCREEN_AST_PTS                |character |
#'    |OFF_LOOSE_BALLS_RECOVERED     |character |
#'    |DEF_LOOSE_BALLS_RECOVERED     |character |
#'    |LOOSE_BALLS_RECOVERED         |character |
#'    |PCT_LOOSE_BALLS_RECOVERED_OFF |character |
#'    |PCT_LOOSE_BALLS_RECOVERED_DEF |character |
#'    |OFF_BOXOUTS                   |character |
#'    |DEF_BOXOUTS                   |character |
#'    |BOX_OUTS                      |character |
#'    |PCT_BOX_OUTS_OFF              |character |
#'    |PCT_BOX_OUTS_DEF              |character |
#' 
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows as_tibble
#' @import rvest
#' @export
#' @family WNBA Hustle Functions
#' @details
#' ```r
#'  wnba_leaguehustlestatsteam(league_id = '10')
#' ```
wnba_leaguehustlestatsteam <- function(
    college = '',
    conference = '',
    country = '',
    date_from = '',
    date_to = '',
    division = '',
    draft_pick = '',
    draft_year = '',
    height = '',
    last_n_games = 0,
    league_id = '10',
    location = '',
    month = 0,
    opponent_team_id = 0,
    outcome = '',
    po_round = '',
    per_mode = 'Totals',
    player_experience = '',
    player_position = '',
    season = most_recent_wnba_season() - 1,
    season_segment = '',
    season_type = 'Regular Season',
    team_id = '',
    vs_conference = '',
    vs_division = '',
    weight = '',
    ...){
  
  # Intentional
  # season_type <- gsub(' ','+',season_type)
  version <- "leaguehustlestatsteam"
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
    Height = height,
    LeagueID = league_id,
    Location = location,
    Month = month,
    OpponentTeamID = opponent_team_id,
    Outcome = outcome,
    PORound = po_round,
    PerMode = per_mode,
    PlayerExperience = player_experience,
    PlayerPosition = player_position,
    Season = season,
    SeasonSegment = season_segment,
    SeasonType = season_type,
    TeamID = team_id,
    VsConference = vs_conference,
    VsDivision = vs_division,
    Weight = weight
  )
  
  tryCatch(
    expr = {
      
      resp <- request_with_proxy(url = full_url, params = params, ...)
      
      df_list <- wnba_stats_map_result_sets(resp)
      
    },
    error = function(e) {
      cli::cli_alert_danger("{Sys.time()}: Invalid arguments or no league hustle team stats data available for {season}!")
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
#' **Get WNBA Stats API League Hustle Stats Team Leaders**
#' @name wnba_leaguehustlestatsteamleaders
NULL
#' @title
#' **Get WNBA Stats API League Hustle Stats Team Leaders**
#' @rdname wnba_leaguehustlestatsteamleaders
#' @author Saiem Gilani
#' @param college college
#' @param conference conference
#' @param country country
#' @param date_from date_from
#' @param date_to date_to
#' @param division division
#' @param draft_pick draft_pick
#' @param draft_year draft_year
#' @param height height
#' @param last_n_games last_n_games
#' @param league_id league_id
#' @param location location
#' @param month month
#' @param opponent_team_id opponent_team_id
#' @param outcome outcome
#' @param po_round po_round
#' @param per_mode per_mode
#' @param player_experience player_experience
#' @param player_position player_position
#' @param season season
#' @param season_segment season_segment
#' @param season_type season_type
#' @param team_id team_id
#' @param vs_conference vs_conference
#' @param vs_division vs_division
#' @param weight weight
#' @param ... Additional arguments passed to an underlying function like httr.
#' @return Returns a named list of data frames: Table5, Table6, TeamChargesDrawnLeaders, 
#' TeamContestedShotsLeaders, TeamDeflectionsLeaders,  
#' TeamLooseBallLeaders, TeamScreenAssistLeaders
#' 
#'    **TeamContestedShotsLeaders** 
#'    
#'    
#'    |col_name          |types     |
#'    |:-----------------|:---------|
#'    |TEAM_ID           |character |
#'    |TEAM_NAME         |character |
#'    |TEAM_ABBREVIATION |character |
#'    |RANK              |character |
#'    |CONTESTED_SHOTS   |character |
#'    
#'    **TeamChargesDrawnLeaders** 
#'    
#'    
#'    |col_name          |types     |
#'    |:-----------------|:---------|
#'    |TEAM_ID           |character |
#'    |TEAM_NAME         |character |
#'    |TEAM_ABBREVIATION |character |
#'    |RANK              |character |
#'    |CHARGES_DRAWN     |character |
#'    
#'    **TeamDeflectionsLeaders** 
#'    
#'    
#'    |col_name          |types     |
#'    |:-----------------|:---------|
#'    |TEAM_ID           |character |
#'    |TEAM_NAME         |character |
#'    |TEAM_ABBREVIATION |character |
#'    |RANK              |character |
#'    |DEFLECTIONS       |character |
#'    
#'    **TeamLooseBallLeaders** 
#'    
#'    
#'    |col_name              |types     |
#'    |:---------------------|:---------|
#'    |TEAM_ID               |character |
#'    |TEAM_NAME             |character |
#'    |TEAM_ABBREVIATION     |character |
#'    |RANK                  |character |
#'    |LOOSE_BALLS_RECOVERED |character |
#'    
#'    **TeamScreenAssistLeaders** 
#'    
#'    
#'    |col_name          |types     |
#'    |:-----------------|:---------|
#'    |TEAM_ID           |character |
#'    |TEAM_NAME         |character |
#'    |TEAM_ABBREVIATION |character |
#'    |RANK              |character |
#'    |SCREEN_ASSISTS    |character |
#'    
#'    **Table5** 
#'    
#'    
#'    |col_name          |types     |
#'    |:-----------------|:---------|
#'    |TEAM_ID           |character |
#'    |TEAM_NAME         |character |
#'    |TEAM_ABBREVIATION |character |
#'    |RANK              |character |
#'    |BOX_OUTS          |character |
#'    
#'    **Table6** 
#'    
#'    
#'    |col_name          |types     |
#'    |:-----------------|:---------|
#'    |TEAM_ID           |character |
#'    |TEAM_NAME         |character |
#'    |TEAM_ABBREVIATION |character |
#'    |RANK              |character |
#'    |BOX_OUTS          |character |
#' 
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows as_tibble
#' @import rvest
#' @export
#' @family WNBA Hustle Functions
#' @details
#' ```r
#'   wnba_leaguehustlestatsteamleaders(league_id = '10')
#' ```
wnba_leaguehustlestatsteamleaders <- function(
    college = '',
    conference = '',
    country = '',
    date_from = '',
    date_to = '',
    division = '',
    draft_pick = '',
    draft_year = '',
    height = '',
    last_n_games = 0,
    league_id = '10',
    location = '',
    month = 0,
    opponent_team_id = 0,
    outcome = '',
    po_round = '',
    per_mode = 'Totals',
    player_experience = '',
    player_position = '',
    season = most_recent_wnba_season() - 1,
    season_segment = '',
    season_type = 'Regular Season',
    team_id = '',
    vs_conference = '',
    vs_division = '',
    weight = '',
    ...){
  
  # intentional
  # season_type <- gsub(' ','+',season_type)
  version <- "leaguehustlestatsteamleaders"
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
    Height = height,
    LeagueID = league_id,
    Location = location,
    Month = month,
    OpponentTeamID = opponent_team_id,
    Outcome = outcome,
    PORound = po_round,
    PerMode = per_mode,
    PlayerExperience = player_experience,
    PlayerPosition = player_position,
    Season = season,
    SeasonSegment = season_segment,
    SeasonType = season_type,
    TeamID = team_id,
    VsConference = vs_conference,
    VsDivision = vs_division,
    Weight = weight
  )
  
  tryCatch(
    expr = {
      
      resp <- request_with_proxy(url = full_url, params = params, ...)
      
      df_list <- wnba_stats_map_result_sets(resp)
      
    },
    error = function(e) {
      cli::cli_alert_danger("{Sys.time()}: Invalid arguments or no league hustle team stats leaders data available for {season}!")
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
