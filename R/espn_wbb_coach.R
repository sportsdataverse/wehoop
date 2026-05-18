# espn_wbb_coach.R

#' **Get ESPN WBB Single-Coach Detail**
#' @name espn_wbb_coach
NULL
#' @title
#' **Get ESPN WBB Single-Coach Detail**
#' @rdname espn_wbb_coach
#' @author Saiem Gilani
#' @description
#' Returns biography, current team / college refs, and counts of career
#' record entries + per-season coaching entries for one WBB head coach.
#'
#' @param coach_id ESPN coach identifier (character or numeric).
#' @param ... Additional arguments; currently unused.
#' @return A single-row tibble.
#'
#'    |col_name        |types     |description                                |
#'    |:---------------|:---------|:------------------------------------------|
#'    |coach_id        |character |ESPN coach identifier.                     |
#'    |uid             |character |ESPN UID string.                           |
#'    |first_name      |character |First name.                                |
#'    |last_name       |character |Last name.                                 |
#'    |date_of_birth   |character |Date of birth (ISO 8601).                  |
#'    |birth_city      |character |Birth city.                                |
#'    |birth_state     |character |Birth state / region.                      |
#'    |n_career_records|integer   |Count of career-records entries.           |
#'    |n_coach_seasons |integer   |Count of seasons coached.                  |
#'    |college_ref     |character |`$ref` to the coach's college.             |
#'    |team_ref        |character |`$ref` to the coach's current team.        |
#'    |league          |character |League slug.                               |
#'
#' @importFrom jsonlite fromJSON
#' @importFrom dplyr as_tibble
#' @export
#' @family ESPN WBB Functions
#' @examples
#' \donttest{
#'   espn_wbb_coach(coach_id = 1031)
#' }
espn_wbb_coach <- function(coach_id, ...) {
  .espn_basketball_coach(league = "womens-college-basketball",
                          coach_id = coach_id, ...)
}
