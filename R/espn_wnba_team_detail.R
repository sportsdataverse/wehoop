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
#'    |col_name          |types     |
#'    |:-----------------|:---------|
#'    |id                |character |
#'    |uid               |character |
#'    |slug              |character |
#'    |abbreviation      |character |
#'    |display_name      |character |
#'    |short_display_name|character |
#'    |name              |character |
#'    |nickname          |character |
#'    |location          |character |
#'    |color             |character |
#'    |alternate_color   |character |
#'    |logo              |character |
#'
#'    **Record**
#'
#'    |col_name |types     |
#'    |:--------|:---------|
#'    |type     |character |
#'    |summary  |character |
#'    |stats    |list      |
#'
#'    **NextEvent**
#'
#'    |col_name   |types     |
#'    |:----------|:---------|
#'    |id         |character |
#'    |date       |character |
#'    |name       |character |
#'    |short_name |character |
#'
#'    **StandingSummary**
#'
#'    |col_name         |types     |
#'    |:----------------|:---------|
#'    |standing_summary |character |
#'
#'    **Coaches**
#'
#'    |col_name   |types     |
#'    |:----------|:---------|
#'    |id         |character |
#'    |first_name |character |
#'    |last_name  |character |
#'    |experience |integer   |
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
#'    |col_name        |types     |
#'    |:---------------|:---------|
#'    |athlete_id      |character |
#'    |full_name       |character |
#'    |jersey          |character |
#'    |position_abbrev |character |
#'    |position_name   |character |
#'    |height          |character |
#'    |weight          |character |
#'    |age             |character |
#'    |birth_date      |character |
#'    |birth_place     |character |
#'    |headshot        |character |
#'    |link_web        |character |
#'    |status          |character |
#'    |team_id         |character |
#'    |season          |integer   |
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
#'    |col_name               |types     |
#'    |:----------------------|:---------|
#'    |event_id               |character |
#'    |season                 |integer   |
#'    |season_type            |integer   |
#'    |week                   |integer   |
#'    |date                   |character |
#'    |name                   |character |
#'    |short_name             |character |
#'    |opponent_id            |character |
#'    |opponent_abbrev        |character |
#'    |home_away              |character |
#'    |neutral_site           |logical   |
#'    |conference_competition |logical   |
#'    |venue_id               |character |
#'    |venue_name             |character |
#'    |venue_city             |character |
#'    |venue_state            |character |
#'    |broadcast              |character |
#'    |result                 |character |
#'    |team_score             |character |
#'    |opponent_score         |character |
#'    |winner                 |logical   |
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
#'    |col_name     |types     |
#'    |:------------|:---------|
#'    |team_id      |character |
#'    |season       |integer   |
#'    |category     |character |
#'    |display_name |character |
#'    |athlete_id   |character |
#'    |athlete_name |character |
#'    |value        |numeric   |
#'    |rank         |integer   |
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
