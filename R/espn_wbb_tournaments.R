# espn_wbb_tournaments.R
# Public WBB shims for ESPN tournaments endpoints.

# ---------------------------------------------------------------------------
# espn_wbb_tournaments
# ---------------------------------------------------------------------------

#' **Get ESPN WBB Tournaments Index**
#' @name espn_wbb_tournaments
NULL
#' @title
#' **Get ESPN WBB Tournaments Index**
#' @rdname espn_wbb_tournaments
#' @author Saiem Gilani
#' @description
#' Returns the index of women's college basketball tournaments tracked
#' by ESPN — including the NCAA Tournament, WNIT, conference tournaments,
#' and other in-season events. Pass an ID to [espn_wbb_tournament()]
#' for the human-readable name and seasons-list ref.
#'
#' Note: ESPN does not expose a tournaments endpoint for the WNBA.
#'
#' @param ... Additional arguments; currently unused.
#' @return A tibble with one row per tournament.
#'
#'    |col_name      |types     |description                                  |
#'    |:-------------|:---------|:--------------------------------------------|
#'    |tournament_id |character |ESPN tournament identifier.                  |
#'    |ref           |character |Full `$ref` URL for the detail.              |
#'    |league        |character |League slug (`"womens-college-basketball"`). |
#'
#' @importFrom jsonlite fromJSON
#' @importFrom dplyr as_tibble
#' @export
#' @family ESPN WBB Functions
#' @examples
#' \donttest{
#'   espn_wbb_tournaments()
#' }
espn_wbb_tournaments <- function(...) {
  .espn_basketball_tournaments(league = "womens-college-basketball", ...)
}

# ---------------------------------------------------------------------------
# espn_wbb_tournament
# ---------------------------------------------------------------------------

#' **Get ESPN WBB Tournament Detail**
#' @name espn_wbb_tournament
NULL
#' @title
#' **Get ESPN WBB Tournament Detail**
#' @rdname espn_wbb_tournament
#' @author Saiem Gilani
#' @description
#' Returns metadata for a single WBB tournament plus the `$ref` URL for
#' the tournament's seasons list. Tournament IDs of interest include
#' the NCAA Tournament and WNIT (resolve via [espn_wbb_tournaments()]).
#'
#' @param tournament_id ESPN tournament identifier.
#' @param ... Additional arguments; currently unused.
#' @return A single-row tibble.
#'
#'    |col_name      |types     |description                                    |
#'    |:-------------|:---------|:----------------------------------------------|
#'    |tournament_id |character |ESPN tournament identifier.                    |
#'    |display_name  |character |Human-readable tournament name.                |
#'    |seasons_ref   |character |`$ref` to the seasons-list endpoint.           |
#'    |league        |character |League slug.                                   |
#'
#' @importFrom jsonlite fromJSON
#' @importFrom dplyr as_tibble
#' @export
#' @family ESPN WBB Functions
#' @examples
#' \donttest{
#'   espn_wbb_tournament(tournament_id = 23)
#' }
espn_wbb_tournament <- function(tournament_id, ...) {
  .espn_basketball_tournament(league = "womens-college-basketball",
                               tournament_id = tournament_id, ...)
}

# ---------------------------------------------------------------------------
# espn_wbb_tournament_seasons
# ---------------------------------------------------------------------------

#' **Get ESPN WBB Tournament Seasons List**
#' @name espn_wbb_tournament_seasons
NULL
#' @title
#' **Get ESPN WBB Tournament Seasons List**
#' @rdname espn_wbb_tournament_seasons
#' @author Saiem Gilani
#' @description
#' Returns the seasons in which a given WBB tournament was held.
#'
#' @param tournament_id ESPN tournament identifier.
#' @param ... Additional arguments; currently unused.
#' @return A tibble with one row per season.
#'
#'    |col_name      |types     |description                              |
#'    |:-------------|:---------|:----------------------------------------|
#'    |league        |character |League slug.                             |
#'    |tournament_id |character |ESPN tournament identifier.              |
#'    |season        |integer   |Season year.                             |
#'    |ref           |character |Full `$ref` URL for that season.         |
#'
#' @importFrom jsonlite fromJSON
#' @importFrom dplyr as_tibble
#' @export
#' @family ESPN WBB Functions
#' @examples
#' \donttest{
#'   espn_wbb_tournament_seasons(tournament_id = 23)
#' }
espn_wbb_tournament_seasons <- function(tournament_id, ...) {
  .espn_basketball_tournament_seasons(league = "womens-college-basketball",
                                       tournament_id = tournament_id, ...)
}
