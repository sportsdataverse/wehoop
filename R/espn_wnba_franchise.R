# espn_wnba_franchise.R
# Public WNBA shims for ESPN franchise endpoints.

# ---------------------------------------------------------------------------
# espn_wnba_franchises
# ---------------------------------------------------------------------------

#' **Get ESPN WNBA Franchises Index**
#' @name espn_wnba_franchises
NULL
#' @title
#' **Get ESPN WNBA Franchises Index**
#' @rdname espn_wnba_franchises
#' @author Saiem Gilani
#' @description
#' Returns the full WNBA franchises index from
#' `sports.core.api.espn.com/v2/sports/basketball/leagues/wnba/franchises`.
#' Each row is one franchise with its ID and the canonical `$ref` URL —
#' pass an ID to [espn_wnba_franchise()] for full franchise detail.
#'
#' @param ... Additional arguments; currently unused.
#' @return A tibble with one row per franchise.
#'
#'    |col_name     |types     |description                            |
#'    |:------------|:---------|:--------------------------------------|
#'    |franchise_id |character |ESPN franchise identifier.             |
#'    |ref          |character |Full `$ref` URL for franchise detail.  |
#'    |league       |character |League slug (`"wnba"`).                |
#'
#' @importFrom jsonlite fromJSON
#' @importFrom dplyr as_tibble
#' @export
#' @family ESPN WNBA Functions
#' @examples
#' \donttest{
#'   espn_wnba_franchises()
#' }
espn_wnba_franchises <- function(...) {
  .espn_basketball_franchises(league = "wnba", ...)
}

# ---------------------------------------------------------------------------
# espn_wnba_franchise
# ---------------------------------------------------------------------------

#' **Get ESPN WNBA Franchise Detail**
#' @name espn_wnba_franchise
NULL
#' @title
#' **Get ESPN WNBA Franchise Detail**
#' @rdname espn_wnba_franchise
#' @author Saiem Gilani
#' @description
#' Returns franchise-level metadata for a WNBA franchise. Franchise IDs are
#' stable across relocations and rebrands.
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
#'    |league             |character |League slug (`"wnba"`).                    |
#'    |logo               |character |Primary logo URL.                          |
#'    |logo_dark          |character |Dark-mode logo URL.                        |
#'    |venue_ref          |character |`$ref` to franchise's primary venue.       |
#'    |team_ref           |character |`$ref` to the current team for franchise.  |
#'
#' @importFrom jsonlite fromJSON
#' @importFrom dplyr as_tibble
#' @importFrom janitor clean_names
#' @export
#' @family ESPN WNBA Functions
#' @examples
#' \donttest{
#'   espn_wnba_franchise(franchise_id = 17)
#' }
espn_wnba_franchise <- function(franchise_id, ...) {
  .espn_basketball_franchise(
    league       = "wnba",
    franchise_id = franchise_id,
    ...
  )
}
