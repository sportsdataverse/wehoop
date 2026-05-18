# espn_wnba_futures.R
# Public WNBA shim for ESPN season-futures endpoint.

# ---------------------------------------------------------------------------
# espn_wnba_futures
# ---------------------------------------------------------------------------

#' **Get ESPN WNBA Season Futures (Long Format)**
#' @name espn_wnba_futures
NULL
#' @title
#' **Get ESPN WNBA Season Futures (Long Format)**
#' @rdname espn_wnba_futures
#' @author Saiem Gilani
#' @description
#' Returns the full futures-betting board for a WNBA season, in long
#' format: one row per (market x team). Markets include championship
#' winner and conference winners. Backed by
#' `sports.core.api.espn.com/v2/sports/basketball/leagues/wnba/seasons/{season}/futures`.
#'
#' Note: ESPN does not currently expose a futures endpoint for women's
#' college basketball.
#'
#' @param season Season year (numeric). Defaults to the most recent WNBA season.
#' @param ... Additional arguments; currently unused.
#' @return A long-format tibble.
#'
#'    |col_name        |types     |description                                                       |
#'    |:---------------|:---------|:-----------------------------------------------------------------|
#'    |season          |integer   |Season year.                                                      |
#'    |league          |character |League slug (`"wnba"`).                                           |
#'    |market_id       |character |ESPN futures-market identifier.                                   |
#'    |market_name     |character |Internal market name.                                             |
#'    |market_type     |character |Market type code.                                                 |
#'    |market_display  |character |Human-readable market name.                                       |
#'    |provider_id     |character |Sportsbook provider identifier.                                   |
#'    |provider_name   |character |Sportsbook provider name.                                         |
#'    |team_id         |character |ESPN team id.                                                     |
#'    |odds_value      |character |American odds for the team.                                       |
#'    |team_ref        |character |`$ref` to the per-season team resource.                           |
#'
#' @importFrom jsonlite fromJSON
#' @importFrom dplyr as_tibble
#' @export
#' @family ESPN WNBA Functions
#' @examples
#' \donttest{
#'   espn_wnba_futures(season = 2025)
#' }
espn_wnba_futures <- function(season = most_recent_wnba_season(), ...) {
  .espn_basketball_futures(league = "wnba", season = season, ...)
}
