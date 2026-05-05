#' **Get ESPN WNBA Calendar**
#' @name espn_wnba_calendar
NULL
#' @title
#' **Get ESPN WNBA Calendar**
#' @rdname espn_wnba_calendar
#' @author Saiem Gilani
#' @param season integer or character. Four-digit season year (e.g. `2025`).
#'   Defaults to `most_recent_wnba_season()`.
#' @return Returns a tibble of calendar entries.
#'
#'    |col_name          |types     |
#'    |:-----------------|:---------|
#'    |season            |character |
#'    |season_type       |character |
#'    |season_type_label |character |
#'    |season_start_date |character |
#'    |season_end_date   |character |
#'    |label             |character |
#'    |alternate_label   |character |
#'    |detail            |character |
#'    |value             |character |
#'    |start_date        |character |
#'    |end_date          |character |
#'
#' @importFrom jsonlite fromJSON
#' @importFrom dplyr as_tibble
#' @importFrom janitor clean_names
#' @import rvest
#' @export
#' @family ESPN WNBA Functions
#' @details
#' Retrieve the ESPN WNBA schedule calendar for a given season. The underlying
#' scoreboard response contains a `leagues[[1]]$calendar` block with season-type
#' entries (pre-season, regular, post). Uses `getOption("wehoop.proxy")` or
#' `http_proxy`/`https_proxy` environment variables for proxy configuration
#' (per-call proxy override is not supported for ESPN wrappers).
#' ```r
#'  espn_wnba_calendar(season = 2025)
#' ```
espn_wnba_calendar <- function(season = most_recent_wnba_season()) {
  .args <- mget(setdiff(names(formals()), "..."))
  .espn_basketball_calendar(
    league = "wnba",
    season = season
  )
}
