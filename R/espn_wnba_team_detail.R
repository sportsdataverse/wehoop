# espn_wnba_team_detail.R
# Public WNBA shims for ESPN team-detail endpoints.
# These are thin wrappers over the internal helpers in espn_basketball_team_helpers.R.

# ---------------------------------------------------------------------------
# espn_wnba_team
# ---------------------------------------------------------------------------

#' **Get ESPN WNBA Team Detail**
#' @name espn_wnba_team
NULL
#' @title
#' **Get ESPN WNBA Team Detail**
#' @rdname espn_wnba_team
#' @author Saiem Gilani
#' @param team_id ESPN team identifier (character or numeric).
#' @param season Season year (numeric, e.g. 2025). Defaults to the most
#'   recent WNBA season.
#' @param ... Additional arguments; currently unused but retained for
#'   forward compatibility. Proxy configuration should use
#'   `options(wehoop.proxy = ...)` -- see `?wehoop` for details.
#' @return A named list of data frames: `Info`, `Record`, `NextEvent`,
#'   `StandingSummary`, `Coaches`.
#'
#'    **Info**
#'
#'    |col_name           |types     |description                                |
#'    |:------------------|:---------|:------------------------------------------|
#'    |id                 |character |Unique play identifcation number           |
#'    |uid                |character |ESPN UID string (universal identifier).    |
#'    |slug               |character |URL-safe identifier.                       |
#'    |abbreviation       |character |Short abbreviation.                        |
#'    |display_name       |character |Display name.                              |
#'    |short_display_name |character |Short display name.                        |
#'    |name               |character |Display name.                              |
#'    |nickname           |character |Team or athlete nickname.                  |
#'    |location           |character |Filter results by game location.           |
#'    |color              |character |Primary color (hex without leading '#').   |
#'    |alternate_color    |character |Alternate color (hex without leading '#'). |
#'    |logo               |character |Team or league logo URL.                   |
#'
#'    **Record**
#'
#'    |col_name |types     |description             |
#'    |:--------|:---------|:-----------------------|
#'    |type     |character |Record type / category. |
#'    |summary  |character |Summary.                |
#'    |stats    |list      |Stats.                  |
#'
#'    **NextEvent**
#'
#'    |col_name   |types     |description                      |
#'    |:----------|:---------|:--------------------------------|
#'    |id         |character |Unique play identifcation number |
#'    |date       |character |Date in YYYY-MM-DD format.       |
#'    |name       |character |Display name.                    |
#'    |short_name |character |Short display name.              |
#'
#'    **StandingSummary**
#'
#'    |col_name         |types     |description       |
#'    |:----------------|:---------|:-----------------|
#'    |standing_summary |character |Standing summary. |
#'
#'    **Coaches**
#'
#'    |col_name   |types     |description                       |
#'    |:----------|:---------|:---------------------------------|
#'    |id         |character |Unique play identifcation number  |
#'    |first_name |character |Player's first name.              |
#'    |last_name  |character |Player's last name.               |
#'    |experience |integer   |Years of professional experience. |
#'
#' @importFrom jsonlite fromJSON
#' @importFrom dplyr as_tibble select any_of bind_rows
#' @importFrom janitor clean_names
#' @export
#' @family ESPN WNBA Functions
#' @examples
#' \donttest{
#'   espn_wnba_team(team_id = "17", season = 2025)
#' }
espn_wnba_team <- function(team_id,
                            season = most_recent_wnba_season(),
                            ...) {
  .espn_basketball_team(
    league   = "wnba",
    team_id  = team_id,
    season   = season,
    ...
  )
}

# ---------------------------------------------------------------------------
# espn_wnba_team_roster
# ---------------------------------------------------------------------------

#' **Get ESPN WNBA Team Roster**
#' @name espn_wnba_team_roster
NULL
#' @title
#' **Get ESPN WNBA Team Roster**
#' @rdname espn_wnba_team_roster
#' @author Saiem Gilani
#' @param team_id ESPN team identifier (character or numeric).
#' @param season Season year (numeric). Defaults to the most recent WNBA season.
#' @param ... Additional arguments; currently unused.
#' @return A single tibble with one row per athlete.
#'
#'    |col_name        |types     |description                                            |
#'    |:---------------|:---------|:------------------------------------------------------|
#'    |athlete_id      |character |Unique athlete identifier (ESPN).                      |
#'    |full_name       |character |Player's full name.                                    |
#'    |jersey          |character |Jersey number worn by the player.                      |
#'    |position_abbrev |character |Abbreviation for position.                             |
#'    |position_name   |character |Listed roster position ('Guard', 'Forward', 'Center'). |
#'    |height          |character |Player height (string e.g. '6-2' or inches).           |
#'    |weight          |character |Player weight in pounds.                               |
#'    |age             |character |Player age (in years).                                 |
#'    |birth_date      |character |Date of birth (YYYY-MM-DD).                            |
#'    |birth_place     |character |Place of birth.                                        |
#'    |headshot        |character |Headshot image URL.                                    |
#'    |link_web        |character |Web link / URL.                                        |
#'    |status          |character |Status label.                                          |
#'    |team_id         |character |Unique team identifier.                                |
#'    |season          |integer   |Season identifier (4-digit year or 'YYYY-YY' string).  |
#'
#' @importFrom jsonlite fromJSON
#' @importFrom dplyr as_tibble bind_rows any_of
#' @importFrom janitor clean_names
#' @export
#' @family ESPN WNBA Functions
#' @examples
#' \donttest{
#'   espn_wnba_team_roster(team_id = "17", season = 2025)
#' }
espn_wnba_team_roster <- function(team_id,
                                   season = most_recent_wnba_season(),
                                   ...) {
  .espn_basketball_team_roster(
    league   = "wnba",
    team_id  = team_id,
    season   = season,
    ...
  )
}

# ---------------------------------------------------------------------------
# espn_wnba_team_schedule
# ---------------------------------------------------------------------------

#' **Get ESPN WNBA Team Schedule**
#' @name espn_wnba_team_schedule
NULL
#' @title
#' **Get ESPN WNBA Team Schedule**
#' @rdname espn_wnba_team_schedule
#' @author Saiem Gilani
#' @param team_id ESPN team identifier (character or numeric).
#' @param season Season year (numeric). Defaults to the most recent WNBA season.
#' @param season_type Integer season type: 1 = preseason, 2 = regular (default),
#'   3 = postseason.
#' @param ... Additional arguments; currently unused.
#' @return A single tibble with one row per event.
#'
#'    |col_name               |types     |description                                                                                                        |
#'    |:----------------------|:---------|:------------------------------------------------------------------------------------------------------------------|
#'    |event_id               |character |Unique event / game identifier (ESPN).                                                                             |
#'    |season                 |integer   |Season identifier (4-digit year or 'YYYY-YY' string).                                                              |
#'    |season_type            |integer   |Season type (1=pre-season, 2=regular season, 3=postseason, 4=off-season for ESPN; or string label for WNBA Stats). |
#'    |week                   |integer   |Week number within the season.                                                                                     |
#'    |date                   |character |Date in YYYY-MM-DD format.                                                                                         |
#'    |name                   |character |Display name.                                                                                                      |
#'    |short_name             |character |Short display name.                                                                                                |
#'    |opponent_id            |character |Unique identifier for opponent.                                                                                    |
#'    |opponent_abbrev        |character |Abbreviation for opponent.                                                                                         |
#'    |home_away              |character |Game venue label ('home' or 'away').                                                                               |
#'    |neutral_site           |logical   |Neutral site.                                                                                                      |
#'    |conference_competition |logical   |Conference competition.                                                                                            |
#'    |venue_id               |character |Unique venue identifier.                                                                                           |
#'    |venue_name             |character |Venue name.                                                                                                        |
#'    |venue_city             |character |Venue city.                                                                                                        |
#'    |venue_state            |character |Venue state / region.                                                                                              |
#'    |broadcast              |character |Broadcast information string.                                                                                      |
#'    |result                 |character |Result.                                                                                                            |
#'    |team_score             |character |Team's score / final score.                                                                                        |
#'    |opponent_score         |character |Opponent score.                                                                                                    |
#'    |winner                 |logical   |Winner.                                                                                                            |
#'
#' @importFrom jsonlite fromJSON
#' @importFrom dplyr as_tibble bind_rows any_of
#' @importFrom janitor clean_names
#' @export
#' @family ESPN WNBA Functions
#' @examples
#' \donttest{
#'   espn_wnba_team_schedule(team_id = "17", season = 2025)
#' }
espn_wnba_team_schedule <- function(team_id,
                                     season      = most_recent_wnba_season(),
                                     season_type = 2,
                                     ...) {
  .espn_basketball_team_schedule(
    league      = "wnba",
    team_id     = team_id,
    season      = season,
    season_type = season_type,
    ...
  )
}

# ---------------------------------------------------------------------------
# espn_wnba_team_leaders
# ---------------------------------------------------------------------------

#' **Get ESPN WNBA Team Leaders**
#' @name espn_wnba_team_leaders
NULL
#' @title
#' **Get ESPN WNBA Team Leaders**
#' @rdname espn_wnba_team_leaders
#' @author Saiem Gilani
#' @param team_id ESPN team identifier (character or numeric).
#' @param season Season year (numeric). Defaults to the most recent WNBA season.
#' @param ... Additional arguments; currently unused.
#' @return A single long-format tibble (one row per category-rank-athlete).
#'
#'    |col_name     |types     |description                                                 |
#'    |:------------|:---------|:-----------------------------------------------------------|
#'    |team_id      |character |Unique team identifier.                                     |
#'    |season       |integer   |Season identifier (4-digit year or 'YYYY-YY' string).       |
#'    |category     |character |Category label.                                             |
#'    |display_name |character |Display name.                                               |
#'    |athlete_id   |character |Unique athlete identifier (ESPN).                           |
#'    |athlete_name |character |Athlete display name (ESPN).                                |
#'    |value        |numeric   |Numeric or string value field.                              |
#'    |rank         |integer   |Whether to include statistical ranks in the returned table. |
#'
#' @importFrom jsonlite fromJSON
#' @importFrom dplyr as_tibble bind_rows any_of
#' @importFrom janitor clean_names
#' @export
#' @family ESPN WNBA Functions
#' @examples
#' \donttest{
#'   espn_wnba_team_leaders(team_id = "17", season = 2025)
#' }
espn_wnba_team_leaders <- function(team_id,
                                    season = most_recent_wnba_season(),
                                    ...) {
  .espn_basketball_team_leaders(
    league   = "wnba",
    team_id  = team_id,
    season   = season,
    ...
  )
}
