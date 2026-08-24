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
#'    \if{html}{\tabular{lll}{
#'       col_name \tab types \tab description \cr
#'       PLAYER_ID \tab character \tab Unique player identifier. \cr
#'       PLAYER_NAME \tab character \tab Player name. \cr
#'       TEAM_ID \tab character \tab Unique team identifier. \cr
#'       TEAM_ABBREVIATION \tab character \tab Short team abbreviation (e.g. 'LAS'). \cr
#'       AGE \tab character \tab Player age (in years). \cr
#'       G \tab character \tab Games played. \cr
#'       MIN \tab character \tab Minutes played. \cr
#'       CONTESTED_SHOTS \tab character \tab Defensively contested shots. \cr
#'       CONTESTED_SHOTS_2PT \tab character \tab Contested two-point shots. \cr
#'       CONTESTED_SHOTS_3PT \tab character \tab Contested three-point shots. \cr
#'       DEFLECTIONS \tab character \tab Defensive deflections. \cr
#'       CHARGES_DRAWN \tab character \tab Charges drawn. \cr
#'       SCREEN_ASSISTS \tab character \tab Screen assists (resulting in a basket). \cr
#'       SCREEN_AST_PTS \tab character \tab  \cr
#'       OFF_LOOSE_BALLS_RECOVERED \tab character \tab  \cr
#'       DEF_LOOSE_BALLS_RECOVERED \tab character \tab  \cr
#'       LOOSE_BALLS_RECOVERED \tab character \tab Loose balls recovered. \cr
#'       PCT_LOOSE_BALLS_RECOVERED_OFF \tab character \tab  \cr
#'       PCT_LOOSE_BALLS_RECOVERED_DEF \tab character \tab  \cr
#'       OFF_BOXOUTS \tab character \tab  \cr
#'       DEF_BOXOUTS \tab character \tab  \cr
#'       BOX_OUT_PLAYER_TEAM_REBS \tab character \tab  \cr
#'       BOX_OUT_PLAYER_REBS \tab character \tab  \cr
#'       BOX_OUTS \tab character \tab Box-outs executed. \cr
#'       PCT_BOX_OUTS_OFF \tab character \tab  \cr
#'       PCT_BOX_OUTS_DEF \tab character \tab  \cr
#'       PCT_BOX_OUTS_TEAM_REB \tab character \tab  \cr
#'       PCT_BOX_OUTS_REB \tab character \tab  \cr
#'    }}
#'    \if{latex}{See the HTML help or pkgdown reference for the column table.}
#' 
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows as_tibble
#' @import rvest
#' @keywords internal
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

  .args <- .capture_args()

  lifecycle::deprecate_stop(
    when = "3.0.0",
    what = "wnba_leaguehustlestatsplayer()",
    details = "The `leaguehustlestatsplayer` endpoint no longer returns data."
  )
}

#' @title
#' **Get WNBA Stats API League Hustle Stats Player Leaders**
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
#' @return Returns a named list of data frames: PlayerChargesDrawnLeaders, 
#' PlayerContestedShotsLeaders, PlayerDeflectionsLeaders, PlayerLooseBallLeaders, 
#' PlayerScreenAssistLeaders, Table5
#' 
#'    **PlayerContestedShotsLeaders** 
#'    
#'    
#'    |col_name          |types     |description                                                 |
#'    |:-----------------|:---------|:-----------------------------------------------------------|
#'    |PLAYER_ID         |character |Unique player identifier.                                   |
#'    |PLAYER_NAME       |character |Player name.                                                |
#'    |TEAM_ID           |character |Unique team identifier.                                     |
#'    |TEAM_ABBREVIATION |character |Short team abbreviation (e.g. 'LAS').                       |
#'    |AGE               |character |Player age (in years).                                      |
#'    |RANK              |character |Whether to include statistical ranks in the returned table. |
#'    |CONTESTED_SHOTS   |character |Defensively contested shots.                                |
#'    
#'    **PlayerChargesDrawnLeaders** 
#'    
#'    
#'    |col_name          |types     |description                                                 |
#'    |:-----------------|:---------|:-----------------------------------------------------------|
#'    |PLAYER_ID         |character |Unique player identifier.                                   |
#'    |PLAYER_NAME       |character |Player name.                                                |
#'    |TEAM_ID           |character |Unique team identifier.                                     |
#'    |TEAM_ABBREVIATION |character |Short team abbreviation (e.g. 'LAS').                       |
#'    |AGE               |character |Player age (in years).                                      |
#'    |RANK              |character |Whether to include statistical ranks in the returned table. |
#'    |CHARGES_DRAWN     |character |Charges drawn.                                              |
#'    
#'    **PlayerDeflectionsLeaders** 
#'    
#'    
#'    |col_name          |types     |description                                                 |
#'    |:-----------------|:---------|:-----------------------------------------------------------|
#'    |PLAYER_ID         |character |Unique player identifier.                                   |
#'    |PLAYER_NAME       |character |Player name.                                                |
#'    |TEAM_ID           |character |Unique team identifier.                                     |
#'    |TEAM_ABBREVIATION |character |Short team abbreviation (e.g. 'LAS').                       |
#'    |AGE               |character |Player age (in years).                                      |
#'    |RANK              |character |Whether to include statistical ranks in the returned table. |
#'    |DEFLECTIONS       |character |Defensive deflections.                                      |
#'    
#'    **PlayerLooseBallLeaders** 
#'    
#'    
#'    |col_name              |types     |description                                                 |
#'    |:---------------------|:---------|:-----------------------------------------------------------|
#'    |PLAYER_ID             |character |Unique player identifier.                                   |
#'    |PLAYER_NAME           |character |Player name.                                                |
#'    |TEAM_ID               |character |Unique team identifier.                                     |
#'    |TEAM_ABBREVIATION     |character |Short team abbreviation (e.g. 'LAS').                       |
#'    |AGE                   |character |Player age (in years).                                      |
#'    |RANK                  |character |Whether to include statistical ranks in the returned table. |
#'    |LOOSE_BALLS_RECOVERED |character |Loose balls recovered.                                      |
#'    
#'    **PlayerScreenAssistLeaders** 
#'    
#'    
#'    |col_name          |types     |description                                                 |
#'    |:-----------------|:---------|:-----------------------------------------------------------|
#'    |PLAYER_ID         |character |Unique player identifier.                                   |
#'    |PLAYER_NAME       |character |Player name.                                                |
#'    |TEAM_ID           |character |Unique team identifier.                                     |
#'    |TEAM_ABBREVIATION |character |Short team abbreviation (e.g. 'LAS').                       |
#'    |AGE               |character |Player age (in years).                                      |
#'    |RANK              |character |Whether to include statistical ranks in the returned table. |
#'    |SCREEN_ASSISTS    |character |Screen assists (resulting in a basket).                     |
#'    
#'    **Table5** 
#'    
#'    
#'    |col_name          |types     |description                                                 |
#'    |:-----------------|:---------|:-----------------------------------------------------------|
#'    |PLAYER_ID         |character |Unique player identifier.                                   |
#'    |PLAYER_NAME       |character |Player name.                                                |
#'    |TEAM_ID           |character |Unique team identifier.                                     |
#'    |TEAM_ABBREVIATION |character |Short team abbreviation (e.g. 'LAS').                       |
#'    |AGE               |character |Player age (in years).                                      |
#'    |RANK              |character |Whether to include statistical ranks in the returned table. |
#'    |BOX_OUTS          |character |Box-outs executed.                                          |
#' 
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows as_tibble
#' @import rvest
#' @keywords internal
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

  .args <- .capture_args()

  lifecycle::deprecate_stop(
    when = "3.0.0",
    what = "wnba_leaguehustlestatsplayerleaders()",
    details = "The `leaguehustlestatsplayerleaders` endpoint no longer returns data."
  )
}

#' @title
#' **Get WNBA Stats API League Hustle Stats Team**
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
#' @return Returns a named list of data frames: HustleStatsTeam
#' 
#'    **HustleStatsTeam** 
#'    
#'    
#'    \if{html}{\tabular{lll}{
#'       col_name \tab types \tab description \cr
#'       TEAM_ID \tab character \tab Unique team identifier. \cr
#'       TEAM_NAME \tab character \tab Full team display name (e.g. 'Las Vegas Aces'). \cr
#'       MIN \tab character \tab Minutes played. \cr
#'       CONTESTED_SHOTS \tab character \tab Defensively contested shots. \cr
#'       CONTESTED_SHOTS_2PT \tab character \tab Contested two-point shots. \cr
#'       CONTESTED_SHOTS_3PT \tab character \tab Contested three-point shots. \cr
#'       DEFLECTIONS \tab character \tab Defensive deflections. \cr
#'       CHARGES_DRAWN \tab character \tab Charges drawn. \cr
#'       SCREEN_ASSISTS \tab character \tab Screen assists (resulting in a basket). \cr
#'       SCREEN_AST_PTS \tab character \tab  \cr
#'       OFF_LOOSE_BALLS_RECOVERED \tab character \tab  \cr
#'       DEF_LOOSE_BALLS_RECOVERED \tab character \tab  \cr
#'       LOOSE_BALLS_RECOVERED \tab character \tab Loose balls recovered. \cr
#'       PCT_LOOSE_BALLS_RECOVERED_OFF \tab character \tab  \cr
#'       PCT_LOOSE_BALLS_RECOVERED_DEF \tab character \tab  \cr
#'       OFF_BOXOUTS \tab character \tab  \cr
#'       DEF_BOXOUTS \tab character \tab  \cr
#'       BOX_OUTS \tab character \tab Box-outs executed. \cr
#'       PCT_BOX_OUTS_OFF \tab character \tab  \cr
#'       PCT_BOX_OUTS_DEF \tab character \tab  \cr
#'    }}
#'    \if{latex}{See the HTML help or pkgdown reference for the column table.}
#' 
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows as_tibble
#' @import rvest
#' @keywords internal
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

  .args <- .capture_args()

  lifecycle::deprecate_stop(
    when = "3.0.0",
    what = "wnba_leaguehustlestatsteam()",
    details = "The `leaguehustlestatsteam` endpoint no longer returns data."
  )
}

#' @title
#' **Get WNBA Stats API League Hustle Stats Team Leaders**
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
#' @return Returns a named list of data frames: Table5, Table6, TeamChargesDrawnLeaders, 
#' TeamContestedShotsLeaders, TeamDeflectionsLeaders,  
#' TeamLooseBallLeaders, TeamScreenAssistLeaders
#' 
#'    **TeamContestedShotsLeaders** 
#'    
#'    
#'    |col_name          |types     |description                                                 |
#'    |:-----------------|:---------|:-----------------------------------------------------------|
#'    |TEAM_ID           |character |Unique team identifier.                                     |
#'    |TEAM_NAME         |character |Full team display name (e.g. 'Las Vegas Aces').             |
#'    |TEAM_ABBREVIATION |character |Short team abbreviation (e.g. 'LAS').                       |
#'    |RANK              |character |Whether to include statistical ranks in the returned table. |
#'    |CONTESTED_SHOTS   |character |Defensively contested shots.                                |
#'    
#'    **TeamChargesDrawnLeaders** 
#'    
#'    
#'    |col_name          |types     |description                                                 |
#'    |:-----------------|:---------|:-----------------------------------------------------------|
#'    |TEAM_ID           |character |Unique team identifier.                                     |
#'    |TEAM_NAME         |character |Full team display name (e.g. 'Las Vegas Aces').             |
#'    |TEAM_ABBREVIATION |character |Short team abbreviation (e.g. 'LAS').                       |
#'    |RANK              |character |Whether to include statistical ranks in the returned table. |
#'    |CHARGES_DRAWN     |character |Charges drawn.                                              |
#'    
#'    **TeamDeflectionsLeaders** 
#'    
#'    
#'    |col_name          |types     |description                                                 |
#'    |:-----------------|:---------|:-----------------------------------------------------------|
#'    |TEAM_ID           |character |Unique team identifier.                                     |
#'    |TEAM_NAME         |character |Full team display name (e.g. 'Las Vegas Aces').             |
#'    |TEAM_ABBREVIATION |character |Short team abbreviation (e.g. 'LAS').                       |
#'    |RANK              |character |Whether to include statistical ranks in the returned table. |
#'    |DEFLECTIONS       |character |Defensive deflections.                                      |
#'    
#'    **TeamLooseBallLeaders** 
#'    
#'    
#'    |col_name              |types     |description                                                 |
#'    |:---------------------|:---------|:-----------------------------------------------------------|
#'    |TEAM_ID               |character |Unique team identifier.                                     |
#'    |TEAM_NAME             |character |Full team display name (e.g. 'Las Vegas Aces').             |
#'    |TEAM_ABBREVIATION     |character |Short team abbreviation (e.g. 'LAS').                       |
#'    |RANK                  |character |Whether to include statistical ranks in the returned table. |
#'    |LOOSE_BALLS_RECOVERED |character |Loose balls recovered.                                      |
#'    
#'    **TeamScreenAssistLeaders** 
#'    
#'    
#'    |col_name          |types     |description                                                 |
#'    |:-----------------|:---------|:-----------------------------------------------------------|
#'    |TEAM_ID           |character |Unique team identifier.                                     |
#'    |TEAM_NAME         |character |Full team display name (e.g. 'Las Vegas Aces').             |
#'    |TEAM_ABBREVIATION |character |Short team abbreviation (e.g. 'LAS').                       |
#'    |RANK              |character |Whether to include statistical ranks in the returned table. |
#'    |SCREEN_ASSISTS    |character |Screen assists (resulting in a basket).                     |
#'    
#'    **Table5** 
#'    
#'    
#'    |col_name          |types     |description                                                 |
#'    |:-----------------|:---------|:-----------------------------------------------------------|
#'    |TEAM_ID           |character |Unique team identifier.                                     |
#'    |TEAM_NAME         |character |Full team display name (e.g. 'Las Vegas Aces').             |
#'    |TEAM_ABBREVIATION |character |Short team abbreviation (e.g. 'LAS').                       |
#'    |RANK              |character |Whether to include statistical ranks in the returned table. |
#'    |BOX_OUTS          |character |Box-outs executed.                                          |
#'    
#'    **Table6** 
#'    
#'    
#'    Same columns as the **Table5** table above.
#' 
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows as_tibble
#' @import rvest
#' @keywords internal
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

  .args <- .capture_args()

  lifecycle::deprecate_stop(
    when = "3.0.0",
    what = "wnba_leaguehustlestatsteamleaders()",
    details = "The `leaguehustlestatsteamleaders` endpoint no longer returns data."
  )
}
