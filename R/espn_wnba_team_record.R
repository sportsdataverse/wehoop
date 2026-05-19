# espn_wnba_team_record.R

#' **Get ESPN WNBA Team Record (Per Season Type)**
#' @name espn_wnba_team_record
NULL
#' @title
#' **Get ESPN WNBA Team Record (Per Season Type)**
#' @rdname espn_wnba_team_record
#' @author Saiem Gilani
#' @description
#' Returns the long-format record breakdown for a WNBA team in one season
#' and season-type. Each row is one record category.
#'
#' @param team_id ESPN team identifier.
#' @param season Season year. Defaults to most recent WNBA season.
#' @param season_type Integer (2 = regular season default).
#' @param ... Additional arguments; currently unused.
#' @return A tibble with one row per record category.
#'
#'    |col_name           |types     |description                                |
#'    |:------------------|:---------|:------------------------------------------|
#'    |league             |character |League slug (`"wnba"`).                    |
#'    |team_id            |character |ESPN team identifier.                      |
#'    |season             |integer   |Season year.                               |
#'    |season_type        |integer   |Season type (1/2/3).                       |
#'    |record_id          |character |Record sub-id.                             |
#'    |name               |character |Internal record name.                      |
#'    |abbreviation       |character |Abbreviation.                              |
#'    |display_name       |character |Display name.                              |
#'    |short_display_name |character |Short display.                             |
#'    |description        |character |Description.                               |
#'    |type               |character |Record type code.                          |
#'    |summary            |character |W-L summary.                               |
#'    |display_value      |character |Display value.                             |
#'    |value              |numeric   |Win percentage (0-1).                      |
#'
#' @importFrom jsonlite fromJSON
#' @importFrom dplyr as_tibble
#' @export
#' @family ESPN WNBA Functions
#' @examples
#' \donttest{
#'   espn_wnba_team_record(team_id = 17, season = 2025)
#' }
espn_wnba_team_record <- function(team_id,
                                   season = most_recent_wnba_season(),
                                   season_type = c(2L, 3L), ...) {
  .espn_basketball_team_record(league = "wnba", team_id = team_id,
                                 season = season,
                                 season_type = season_type, ...)
}
