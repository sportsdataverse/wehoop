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
#'    |col_name      |types     |
#'    |:-------------|:---------|
#'    |season        |integer   |
#'    |season_type   |integer   |
#'    |category      |character |
#'    |abbreviation  |character |
#'    |athlete_id    |character |
#'    |athlete_name  |character |
#'    |team_id       |character |
#'    |team_abbrev   |character |
#'    |value         |numeric   |
#'    |rank          |integer   |
#'    |display_value |character |
#'
#' @importFrom jsonlite fromJSON
#' @importFrom dplyr as_tibble bind_rows any_of
#' @importFrom janitor clean_names
#' @export
#' @family ESPN WNBA Functions
#' @details
#' ```r
#'  espn_wnba_leaders(season = 2025, season_type = 2)
#' ```
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
#'    |col_name      |types     |
#'    |:-------------|:---------|
#'    |venue_id      |character |
#'    |name          |character |
#'    |full_name     |character |
#'    |address_city  |character |
#'    |address_state |character |
#'    |capacity      |integer   |
#'    |indoor        |logical   |
#'    |grass         |logical   |
#'    |images_url    |character |
#'
#' @importFrom jsonlite fromJSON
#' @importFrom dplyr as_tibble bind_rows any_of
#' @importFrom janitor clean_names
#' @export
#' @family ESPN WNBA Functions
#' @details
#' ```r
#'  espn_wnba_venues()
#' ```
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
#'    |col_name   |types     |
#'    |:----------|:---------|
#'    |coach_id   |character |
#'    |first_name |character |
#'    |last_name  |character |
#'    |full_name  |character |
#'    |experience |integer   |
#'    |team_id    |character |
#'
#' @importFrom jsonlite fromJSON
#' @importFrom dplyr as_tibble bind_rows any_of
#' @importFrom janitor clean_names
#' @export
#' @family ESPN WNBA Functions
#' @details
#' ```r
#'  espn_wnba_coaches(season = 2025)
#' ```
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
#'    |col_name   |types     |
#'    |:----------|:---------|
#'    |athlete_id |character |
#'    |full_name  |character |
#'    |jersey     |character |
#'    |position   |character |
#'    |team_id    |character |
#'    |headshot   |character |
#'    |status     |character |
#'    |link       |character |
#'
#' @importFrom jsonlite fromJSON
#' @importFrom dplyr as_tibble bind_rows any_of
#' @importFrom janitor clean_names
#' @export
#' @family ESPN WNBA Functions
#' @details
#' ```r
#'  espn_wnba_athletes_index(season = 2025, limit = 50)
#' ```
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
#'    |col_name          |types     |
#'    |:-----------------|:---------|
#'    |season            |integer   |
#'    |start_date        |character |
#'    |end_date          |character |
#'    |display_name      |character |
#'    |season_type_count |integer   |
#'
#' @importFrom jsonlite fromJSON
#' @importFrom dplyr as_tibble any_of
#' @importFrom janitor clean_names
#' @export
#' @family ESPN WNBA Functions
#' @details
#' ```r
#'  espn_wnba_seasons()
#' ```
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
#'    |col_name     |types     |
#'    |:------------|:---------|
#'    |year         |integer   |
#'    |start_date   |character |
#'    |end_date     |character |
#'    |display_name |character |
#'    |type_id      |character |
#'    |type_name    |character |
#'
#'    **Types / Athletes / Coaches / Teams / Awards**
#'
#'    |col_name |types     |
#'    |:--------|:---------|
#'    |count    |integer   |
#'    |ref      |character |
#'
#' @importFrom jsonlite fromJSON
#' @importFrom dplyr as_tibble any_of
#' @importFrom janitor clean_names
#' @export
#' @family ESPN WNBA Functions
#' @details
#' ```r
#'  espn_wnba_season_info(season = 2025)
#' ```
espn_wnba_season_info <- function(season = most_recent_wnba_season(),
                                   ...) {
  .espn_basketball_season_info(
    league = "wnba",
    season = season,
    ...
  )
}
