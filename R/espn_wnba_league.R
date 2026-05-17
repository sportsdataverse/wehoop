# espn_wnba_league.R
# Public WNBA shims for ESPN league-wide catalog endpoints.
# These are thin wrappers over the internal helpers in
# espn_basketball_league_helpers.R.

# ---------------------------------------------------------------------------
# espn_wnba_leaders
# ---------------------------------------------------------------------------

#' **Get ESPN WNBA League Leaders**
#' @name espn_wnba_leaders
NULL
#' @title
#' **Get ESPN WNBA League Leaders**
#' @rdname espn_wnba_leaders
#' @author Saiem Gilani
#' @param season Season year (numeric, e.g. 2025). Defaults to the most
#'   recent WNBA season.
#' @param season_type Integer season type: 1 = preseason, 2 = regular
#'   (default), 3 = postseason.
#' @param ... Additional arguments; currently unused but retained for
#'   forward compatibility. Proxy configuration should use
#'   `options(wehoop.proxy = ...)` -- see `?wehoop` for details.
#' @return A single `wehoop_data` tibble with one row per category-athlete
#'   pair.
#'
#'    |col_name      |types     |description                                                                                                        |
#'    |:-------------|:---------|:------------------------------------------------------------------------------------------------------------------|
#'    |season        |integer   |Season identifier (4-digit year or 'YYYY-YY' string).                                                              |
#'    |season_type   |integer   |Season type (1=pre-season, 2=regular season, 3=postseason, 4=off-season for ESPN; or string label for WNBA Stats). |
#'    |category      |character |Category label.                                                                                                    |
#'    |abbreviation  |character |Short abbreviation.                                                                                                |
#'    |athlete_id    |character |Unique athlete identifier (ESPN).                                                                                  |
#'    |athlete_name  |character |Athlete display name (ESPN).                                                                                       |
#'    |team_id       |character |Unique team identifier.                                                                                            |
#'    |team_abbrev   |character |Abbreviation for team.                                                                                             |
#'    |value         |numeric   |Numeric or string value field.                                                                                     |
#'    |rank          |integer   |Whether to include statistical ranks in the returned table.                                                        |
#'    |display_value |character |Human-readable display value.                                                                                      |
#'
#' @importFrom jsonlite fromJSON
#' @importFrom dplyr as_tibble bind_rows any_of
#' @importFrom janitor clean_names
#' @export
#' @family ESPN WNBA Functions
#' @examples
#' \donttest{
#'   espn_wnba_leaders(season = 2024, season_type = 2)
#' }
espn_wnba_leaders <- function(season      = most_recent_wnba_season(),
                               season_type = 2,
                               ...) {
  .espn_basketball_leaders(
    league      = "wnba",
    season      = season,
    season_type = season_type,
    ...
  )
}

# ---------------------------------------------------------------------------
# espn_wnba_venues
# ---------------------------------------------------------------------------

#' **Get ESPN WNBA Venues**
#' @name espn_wnba_venues
NULL
#' @title
#' **Get ESPN WNBA Venues**
#' @rdname espn_wnba_venues
#' @author Saiem Gilani
#' @param ... Additional arguments; currently unused but retained for
#'   forward compatibility. Proxy configuration should use
#'   `options(wehoop.proxy = ...)` -- see `?wehoop` for details.
#' @return A single `wehoop_data` tibble with one row per venue.
#'
#'    |col_name      |types     |description              |
#'    |:-------------|:---------|:------------------------|
#'    |venue_id      |character |Unique venue identifier. |
#'    |name          |character |Display name.            |
#'    |full_name     |character |Player's full name.      |
#'    |address_city  |character |Address city.            |
#'    |address_state |character |Address state.           |
#'    |capacity      |integer   |Capacity.                |
#'    |indoor        |logical   |Indoor.                  |
#'    |grass         |logical   |Grass.                   |
#'    |images_url    |character |URL for images.          |
#'
#' @importFrom jsonlite fromJSON
#' @importFrom dplyr as_tibble bind_rows any_of
#' @importFrom janitor clean_names
#' @export
#' @family ESPN WNBA Functions
#' @examples
#' \donttest{
#'   espn_wnba_venues()
#' }
espn_wnba_venues <- function(...) {
  .espn_basketball_venues(
    league = "wnba",
    ...
  )
}

# ---------------------------------------------------------------------------
# espn_wnba_coaches
# ---------------------------------------------------------------------------

#' **Get ESPN WNBA Coaches**
#' @name espn_wnba_coaches
NULL
#' @title
#' **Get ESPN WNBA Coaches**
#' @rdname espn_wnba_coaches
#' @author Saiem Gilani
#' @param season Season year (numeric, e.g. 2025). Defaults to the most
#'   recent WNBA season.
#' @param ... Additional arguments; currently unused but retained for
#'   forward compatibility. Proxy configuration should use
#'   `options(wehoop.proxy = ...)` -- see `?wehoop` for details.
#' @return A single `wehoop_data` tibble with one row per coach.
#'
#'    |col_name   |types     |description                       |
#'    |:----------|:---------|:---------------------------------|
#'    |coach_id   |character |Unique identifier for coach.      |
#'    |first_name |character |Player's first name.              |
#'    |last_name  |character |Player's last name.               |
#'    |full_name  |character |Player's full name.               |
#'    |experience |integer   |Years of professional experience. |
#'    |team_id    |character |Unique team identifier.           |
#'
#' @importFrom jsonlite fromJSON
#' @importFrom dplyr as_tibble bind_rows any_of
#' @importFrom janitor clean_names
#' @export
#' @family ESPN WNBA Functions
#' @examples
#' \donttest{
#'   espn_wnba_coaches(season = 2025)
#' }
espn_wnba_coaches <- function(season = most_recent_wnba_season(),
                               ...) {
  .espn_basketball_coaches(
    league = "wnba",
    season = season,
    ...
  )
}

# ---------------------------------------------------------------------------
# espn_wnba_athletes_index
# ---------------------------------------------------------------------------

#' **Get ESPN WNBA Athletes Index**
#' @name espn_wnba_athletes_index
NULL
#' @title
#' **Get ESPN WNBA Athletes Index**
#' @rdname espn_wnba_athletes_index
#' @author Saiem Gilani
#' @param season Season year (numeric, e.g. 2025). Defaults to the most
#'   recent WNBA season.
#' @param active logical. When `TRUE` (default) only active athletes are
#'   returned. Set to `FALSE` for the full historical roster.
#' @param limit integer. Maximum number of rows to return. Default 5000.
#'   Pass a small value (e.g. `limit = 50`) in tests to keep execution fast.
#' @param ... Additional arguments; currently unused but retained for
#'   forward compatibility. Proxy configuration should use
#'   `options(wehoop.proxy = ...)` -- see `?wehoop` for details.
#' @return A single `wehoop_data` tibble with one row per athlete.
#'
#'    |col_name   |types     |description                             |
#'    |:----------|:---------|:---------------------------------------|
#'    |athlete_id |character |Unique athlete identifier (ESPN).       |
#'    |full_name  |character |Player's full name.                     |
#'    |jersey     |character |Jersey number worn by the player.       |
#'    |position   |character |Listed roster position (G, F, C, etc.). |
#'    |team_id    |character |Unique team identifier.                 |
#'    |headshot   |character |Headshot image URL.                     |
#'    |status     |character |Status label.                           |
#'    |link       |character |Link.                                   |
#'
#' @importFrom jsonlite fromJSON
#' @importFrom dplyr as_tibble bind_rows any_of
#' @importFrom janitor clean_names
#' @export
#' @family ESPN WNBA Functions
#' @examples
#' \donttest{
#'   espn_wnba_athletes_index(season = 2025, limit = 50)
#' }
espn_wnba_athletes_index <- function(season = most_recent_wnba_season(),
                                      active = TRUE,
                                      limit  = 5000L,
                                      ...) {
  .espn_basketball_athletes_index(
    league = "wnba",
    season = season,
    active = active,
    limit  = limit,
    ...
  )
}

# ---------------------------------------------------------------------------
# espn_wnba_seasons
# ---------------------------------------------------------------------------

#' **Get ESPN WNBA Seasons**
#' @name espn_wnba_seasons
NULL
#' @title
#' **Get ESPN WNBA Seasons**
#' @rdname espn_wnba_seasons
#' @author Saiem Gilani
#' @param ... Additional arguments; currently unused but retained for
#'   forward compatibility. Proxy configuration should use
#'   `options(wehoop.proxy = ...)` -- see `?wehoop` for details.
#' @return A single `wehoop_data` tibble with one row per season.
#'
#'    |col_name          |types     |description                                           |
#'    |:-----------------|:---------|:-----------------------------------------------------|
#'    |season            |integer   |Season identifier (4-digit year or 'YYYY-YY' string). |
#'    |start_date        |character |Start date (YYYY-MM-DD).                              |
#'    |end_date          |character |End date (YYYY-MM-DD).                                |
#'    |display_name      |character |Display name.                                         |
#'    |season_type_count |integer   |Count of season type.                                 |
#'
#' @importFrom jsonlite fromJSON
#' @importFrom dplyr as_tibble any_of
#' @importFrom janitor clean_names
#' @export
#' @family ESPN WNBA Functions
#' @examples
#' \donttest{
#'   espn_wnba_seasons()
#' }
espn_wnba_seasons <- function(...) {
  .espn_basketball_seasons(
    league = "wnba",
    ...
  )
}

# ---------------------------------------------------------------------------
# espn_wnba_season_info
# ---------------------------------------------------------------------------

#' **Get ESPN WNBA Season Info**
#' @name espn_wnba_season_info
NULL
#' @title
#' **Get ESPN WNBA Season Info**
#' @rdname espn_wnba_season_info
#' @author Saiem Gilani
#' @param season Season year (numeric, e.g. 2025). Defaults to the most
#'   recent WNBA season.
#' @param ... Additional arguments; currently unused but retained for
#'   forward compatibility. Proxy configuration should use
#'   `options(wehoop.proxy = ...)` -- see `?wehoop` for details.
#' @return A named list of `wehoop_data` tibbles:
#'   `Info`, `Types`, `Athletes`, `Coaches`, `Teams`, `Awards`.
#'   `$ref` URL components are returned as character columns and are NOT
#'   auto-resolved -- use targeted endpoint functions for details.
#'
#'    **Info**
#'
#'    |col_name     |types     |description                |
#'    |:------------|:---------|:--------------------------|
#'    |year         |integer   |4-digit year.              |
#'    |start_date   |character |Start date (YYYY-MM-DD).   |
#'    |end_date     |character |End date (YYYY-MM-DD).     |
#'    |display_name |character |Display name.              |
#'    |type_id      |character |Type identifier (numeric). |
#'    |type_name    |character |Type name.                 |
#'
#'    **Types / Athletes / Coaches / Teams / Awards**
#'
#'    |col_name |types     |description     |
#'    |:--------|:---------|:---------------|
#'    |count    |integer   |Count of count. |
#'    |ref      |character |Ref.            |
#'
#' @importFrom jsonlite fromJSON
#' @importFrom dplyr as_tibble any_of
#' @importFrom janitor clean_names
#' @export
#' @family ESPN WNBA Functions
#' @examples
#' \donttest{
#'   espn_wnba_season_info(season = 2025)
#' }
espn_wnba_season_info <- function(season = most_recent_wnba_season(),
                                   ...) {
  .espn_basketball_season_info(
    league = "wnba",
    season = season,
    ...
  )
}
