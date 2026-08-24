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
#'    \if{html}{\tabular{lll}{
#'       col_name \tab types \tab description \cr
#'       league \tab character \tab League slug (\code{"wnba"}). \cr
#'       team_id \tab character \tab ESPN team identifier. \cr
#'       season \tab integer \tab Season year. \cr
#'       season_type \tab integer \tab Season type (1/2/3). \cr
#'       record_id \tab character \tab Record sub-id. \cr
#'       name \tab character \tab Internal record name. \cr
#'       abbreviation \tab character \tab Abbreviation. \cr
#'       display_name \tab character \tab Display name. \cr
#'       short_display_name \tab character \tab Short display. \cr
#'       description \tab character \tab Description. \cr
#'       type \tab character \tab Record type code. \cr
#'       summary \tab character \tab W-L summary. \cr
#'       display_value \tab character \tab Display value. \cr
#'       value \tab numeric \tab Win percentage (0-1). \cr
#'    }}
#'    \if{latex}{See the HTML help or pkgdown reference for the column table.}
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
