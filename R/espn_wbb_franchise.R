# espn_wbb_franchise.R
# Public WBB shims for ESPN franchise endpoints.

# ---------------------------------------------------------------------------
# espn_wbb_franchises
# ---------------------------------------------------------------------------

#' **Get ESPN WBB Franchises Index**
#' @name espn_wbb_franchises
NULL
#' @title
#' **Get ESPN WBB Franchises Index**
#' @rdname espn_wbb_franchises
#' @author Saiem Gilani
#' @description
#' Returns the full WBB franchises index from
#' `sports.core.api.espn.com/v2/sports/basketball/leagues/womens-college-basketball/franchises`.
#' Each row is one franchise with its ID and the canonical `$ref` URL —
#' pass an ID to [espn_wbb_franchise()] for full franchise detail.
#'
#' @param ... Additional arguments; currently unused.
#' @return A tibble with one row per franchise.
#'
#'    |col_name     |types     |description                                  |
#'    |:------------|:---------|:--------------------------------------------|
#'    |franchise_id |character |ESPN franchise identifier.                   |
#'    |ref          |character |Full `$ref` URL for franchise detail.        |
#'    |league       |character |League slug (`"womens-college-basketball"`). |
#'
#' @importFrom jsonlite fromJSON
#' @importFrom dplyr as_tibble
#' @export
#' @family ESPN WBB Functions
#' @examples
#' \donttest{
#'   espn_wbb_franchises()
#' }
espn_wbb_franchises <- function(...) {
  .espn_basketball_franchises(league = "womens-college-basketball", ...)
}

# ---------------------------------------------------------------------------
# espn_wbb_franchise
# ---------------------------------------------------------------------------

#' **Get ESPN WBB Franchise Detail**
#' @name espn_wbb_franchise
NULL
#' @title
#' **Get ESPN WBB Franchise Detail**
#' @rdname espn_wbb_franchise
#' @author Saiem Gilani
#' @description
#' Returns franchise-level metadata for a women's college basketball program.
#' Franchise IDs are stable across program reorganization or rebrands.
#'
#' @param franchise_id ESPN franchise identifier (character or numeric).
#' @param ... Additional arguments; currently unused.
#' @return A single-row tibble.
#'
#'    \if{html}{\tabular{lll}{
#'       col_name \tab types \tab description \cr
#'       id \tab character \tab ESPN franchise identifier. \cr
#'       uid \tab character \tab ESPN UID string. \cr
#'       slug \tab character \tab URL-safe identifier. \cr
#'       location \tab character \tab Franchise location. \cr
#'       name \tab character \tab Franchise name. \cr
#'       nickname \tab character \tab Common nickname. \cr
#'       abbreviation \tab character \tab Short abbreviation. \cr
#'       display_name \tab character \tab Full display name. \cr
#'       short_display_name \tab character \tab Short display name. \cr
#'       color \tab character \tab Primary color (hex, no leading '#'). \cr
#'       is_active \tab logical \tab Whether franchise is currently active. \cr
#'       league \tab character \tab League slug. \cr
#'       logo \tab character \tab Primary logo URL. \cr
#'       logo_dark \tab character \tab Dark-mode logo URL. \cr
#'       venue_ref \tab character \tab \verb{$ref} to franchise's primary venue. \cr
#'       team_ref \tab character \tab \verb{$ref} to the current team for franchise. \cr
#'    }}
#'    \if{latex}{See the HTML help or pkgdown reference for the column table.}
#'
#' @importFrom jsonlite fromJSON
#' @importFrom dplyr as_tibble
#' @importFrom janitor clean_names
#' @export
#' @family ESPN WBB Functions
#' @examples
#' \donttest{
#'   espn_wbb_franchise(franchise_id = 2509)
#' }
espn_wbb_franchise <- function(franchise_id, ...) {
  .espn_basketball_franchise(
    league       = "womens-college-basketball",
    franchise_id = franchise_id,
    ...
  )
}
