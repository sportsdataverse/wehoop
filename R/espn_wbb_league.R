# espn_wbb_league.R
# Public WBB shims for ESPN league-wide catalog endpoints.
# These are thin wrappers over the internal helpers in
# espn_basketball_league_helpers.R.

# ---------------------------------------------------------------------------
# espn_wbb_leaders
# ---------------------------------------------------------------------------

#' **Get ESPN Women's College Basketball League Leaders**
#' @name espn_wbb_leaders
NULL
#' @title
#' **Get ESPN Women's College Basketball League Leaders**
#' @rdname espn_wbb_leaders
#' @author Saiem Gilani
#' @param season Season year (numeric, e.g. 2025). Defaults to the most
#'   recent WBB season.
#' @param season_type Integer season type: 1 = preseason, 2 = regular
#'   (default), 3 = postseason.
#' @param ... Additional arguments; currently unused but retained for
#'   forward compatibility. Proxy configuration should use
#'   `options(wehoop.proxy = ...)` -- see `?wehoop` for details.
#' @return A single `wehoop_data` tibble with one row per category-athlete
#'   pair.
#'
#'    Columns as documented in the shared [espn_basketball_leaders_schema] table.
#'
#' @importFrom jsonlite fromJSON
#' @importFrom dplyr as_tibble bind_rows any_of
#' @importFrom janitor clean_names
#' @export
#' @family ESPN WBB Functions
#' @examples
#' \donttest{
#'   espn_wbb_leaders(season = 2025, season_type = 2)
#' }
espn_wbb_leaders <- function(season      = most_recent_wbb_season(),
                              season_type = 2,
                              ...) {
  .espn_basketball_leaders(
    league      = "womens-college-basketball",
    season      = season,
    season_type = season_type,
    ...
  )
}

# ---------------------------------------------------------------------------
# espn_wbb_venues
# ---------------------------------------------------------------------------

#' **Get ESPN Women's College Basketball Venues**
#' @name espn_wbb_venues
NULL
#' @title
#' **Get ESPN Women's College Basketball Venues**
#' @rdname espn_wbb_venues
#' @author Saiem Gilani
#' @param ... Additional arguments; currently unused but retained for
#'   forward compatibility. Proxy configuration should use
#'   `options(wehoop.proxy = ...)` -- see `?wehoop` for details.
#' @return A single `wehoop_data` tibble with one row per venue.
#'
#'    Columns as documented in the shared [espn_basketball_venues_schema] table.
#'
#' @importFrom jsonlite fromJSON
#' @importFrom dplyr as_tibble bind_rows any_of
#' @importFrom janitor clean_names
#' @export
#' @family ESPN WBB Functions
#' @examples
#' \donttest{
#'   espn_wbb_venues()
#' }
espn_wbb_venues <- function(...) {
  .espn_basketball_venues(
    league = "womens-college-basketball",
    ...
  )
}

# ---------------------------------------------------------------------------
# espn_wbb_coaches
# ---------------------------------------------------------------------------

#' **Get ESPN Women's College Basketball Coaches**
#' @name espn_wbb_coaches
NULL
#' @title
#' **Get ESPN Women's College Basketball Coaches**
#' @rdname espn_wbb_coaches
#' @author Saiem Gilani
#' @param season Season year (numeric, e.g. 2025). Defaults to the most
#'   recent WBB season.
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
#' @family ESPN WBB Functions
#' @examples
#' \donttest{
#'   espn_wbb_coaches(season = 2025)
#' }
espn_wbb_coaches <- function(season = most_recent_wbb_season(),
                              ...) {
  .espn_basketball_coaches(
    league = "womens-college-basketball",
    season = season,
    ...
  )
}

# ---------------------------------------------------------------------------
# espn_wbb_athletes_index
# ---------------------------------------------------------------------------

#' **Get ESPN Women's College Basketball Athletes Index**
#' @name espn_wbb_athletes_index
NULL
#' @title
#' **Get ESPN Women's College Basketball Athletes Index**
#' @rdname espn_wbb_athletes_index
#' @author Saiem Gilani
#' @param season Season year (numeric, e.g. 2025). Defaults to the most
#'   recent WBB season.
#' @param active logical. When `TRUE` (default) only active athletes are
#'   returned. Set to `FALSE` for the full historical roster.
#' @param limit integer. Maximum number of rows to return. Default 25000.
#'   WBB can return 6,000-12,000 athletes per season; increase if needed.
#'   Pass a small value (e.g. `limit = 50`) in tests to keep execution fast.
#' @param ... Additional arguments; currently unused but retained for
#'   forward compatibility. Proxy configuration should use
#'   `options(wehoop.proxy = ...)` -- see `?wehoop` for details.
#' @return A single `wehoop_data` tibble with one row per athlete.
#'
#'    Columns as documented in the shared [espn_basketball_athletes_index_schema] table.
#'
#' @importFrom jsonlite fromJSON
#' @importFrom dplyr as_tibble bind_rows any_of
#' @importFrom janitor clean_names
#' @export
#' @family ESPN WBB Functions
#' @examples
#' \donttest{
#'   espn_wbb_athletes_index(season = 2025, limit = 50)
#' }
espn_wbb_athletes_index <- function(season = most_recent_wbb_season(),
                                     active = TRUE,
                                     limit  = 25000L,
                                     ...) {
  .espn_basketball_athletes_index(
    league = "womens-college-basketball",
    season = season,
    active = active,
    limit  = limit,
    ...
  )
}

# ---------------------------------------------------------------------------
# espn_wbb_seasons
# ---------------------------------------------------------------------------

#' **Get ESPN Women's College Basketball Seasons**
#' @name espn_wbb_seasons
NULL
#' @title
#' **Get ESPN Women's College Basketball Seasons**
#' @rdname espn_wbb_seasons
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
#' @family ESPN WBB Functions
#' @examples
#' \donttest{
#'   espn_wbb_seasons()
#' }
espn_wbb_seasons <- function(...) {
  .espn_basketball_seasons(
    league = "womens-college-basketball",
    ...
  )
}

# ---------------------------------------------------------------------------
# espn_wbb_season_info
# ---------------------------------------------------------------------------

#' **Get ESPN Women's College Basketball Season Info**
#' @name espn_wbb_season_info
NULL
#' @title
#' **Get ESPN Women's College Basketball Season Info**
#' @rdname espn_wbb_season_info
#' @author Saiem Gilani
#' @param season Season year (numeric, e.g. 2025). Defaults to the most
#'   recent WBB season.
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
#' @family ESPN WBB Functions
#' @examples
#' \donttest{
#'   espn_wbb_season_info(season = 2025)
#' }
espn_wbb_season_info <- function(season = most_recent_wbb_season(),
                                  ...) {
  .espn_basketball_season_info(
    league = "womens-college-basketball",
    season = season,
    ...
  )
}
