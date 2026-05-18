# espn_wbb_powerindex.R

#' **Get ESPN WBB Season Power Index (Long Format)**
#' @name espn_wbb_powerindex
NULL
#' @title
#' **Get ESPN WBB Season Power Index (Long Format)**
#' @rdname espn_wbb_powerindex
#' @author Saiem Gilani
#' @description
#' Returns ESPN's Basketball Power Index (BPI) and related per-team
#' metrics for one WBB season, in long format: one row per (team x stat).
#'
#' @param season Season year (numeric). Defaults to the most recent WBB season.
#' @param season_type Integer (1=preseason, 2=regular (default), 3=postseason).
#' @param ... Additional arguments; currently unused.
#' @return A long tibble with one row per (team x stat).
#'
#'    |col_name      |types     |description                                  |
#'    |:-------------|:---------|:--------------------------------------------|
#'    |league        |character |League slug.                                 |
#'    |season        |integer   |Season year.                                 |
#'    |season_type   |integer   |1=preseason, 2=regular, 3=postseason.        |
#'    |team_id       |character |ESPN team id.                                |
#'    |stat_name     |character |Internal stat key.                           |
#'    |abbreviation  |character |Short stat abbreviation.                     |
#'    |display_name  |character |Human-readable stat name.                    |
#'    |description   |character |Stat description.                            |
#'    |value         |numeric   |Stat value.                                  |
#'    |display_value |character |Display-formatted value.                     |
#'    |last_updated  |character |Last-updated timestamp.                      |
#'    |team_ref      |character |`$ref` to the team-in-season resource.       |
#'
#' @importFrom jsonlite fromJSON
#' @importFrom dplyr as_tibble
#' @export
#' @family ESPN WBB Functions
#' @examples
#' \donttest{
#'   espn_wbb_powerindex(season = 2025)
#' }
espn_wbb_powerindex <- function(season = most_recent_wbb_season(),
                                 season_type = c(2L, 3L), ...) {
  .espn_basketball_powerindex(league = "womens-college-basketball",
                                season = season,
                                season_type = season_type, ...)
}
