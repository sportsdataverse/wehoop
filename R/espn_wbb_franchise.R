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
#'    |col_name           |types     |description                                |
#'    |:------------------|:---------|:------------------------------------------|
#'    |id                 |character |ESPN franchise identifier.                 |
#'    |uid                |character |ESPN UID string.                           |
#'    |slug               |character |URL-safe identifier.                       |
#'    |location           |character |Franchise location.                        |
#'    |name               |character |Franchise name.                            |
#'    |nickname           |character |Common nickname.                           |
#'    |abbreviation       |character |Short abbreviation.                        |
#'    |display_name       |character |Full display name.                         |
#'    |short_display_name |character |Short display name.                        |
#'    |color              |character |Primary color (hex, no leading '#').       |
#'    |is_active          |logical   |Whether franchise is currently active.     |
#'    |league             |character |League slug.                               |
#'    |logo               |character |Primary logo URL.                          |
#'    |logo_dark          |character |Dark-mode logo URL.                        |
#'    |venue_ref          |character |`$ref` to franchise's primary venue.       |
#'    |team_ref           |character |`$ref` to the current team for franchise.  |
#'
#' @importFrom jsonlite fromJSON
#' @importFrom dplyr as_tibble
#' @importFrom janitor clean_names
#' @export
#' @family ESPN WBB Functions
#' @examples
#' \donttest{
#'   espn_wbb_franchise(franchise_id = 41)
#' }
espn_wbb_franchise <- function(franchise_id, ...) {
  .espn_basketball_franchise(
    league       = "womens-college-basketball",
    franchise_id = franchise_id,
    ...
  )
}
