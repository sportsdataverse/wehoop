# espn_wnba_team_deep.R
# Public WNBA shims for deeper per-team / per-coach core-v2 endpoints.

# ---------------------------------------------------------------------------
# espn_wnba_team_season_roster
# ---------------------------------------------------------------------------

#' **Get ESPN WNBA Team Roster (Per-Season, core-v2)**
#' @name espn_wnba_team_season_roster
#' @title
#' **Get ESPN WNBA Team Roster (Per-Season, core-v2)**
#' @rdname espn_wnba_team_season_roster
#' @author Saiem Gilani
#' @description
#' Returns the per-season team roster as a tibble of athlete IDs from
#' `seasons/{y}/teams/{id}/athletes`. Distinct from [espn_wnba_team_roster()]
#' which targets a site-v2 endpoint optimized for the current season; this
#' core-v2 variant is era-correct and available back to ESPN's earliest
#' season for each league.
#'
#' @param team_id ESPN team identifier.
#' @param season Season year. Defaults to most recent WNBA season.
#' @param ... Additional arguments; currently unused.
#' @return A tibble with one row per athlete on the season roster.
#'
#'    |col_name   |types     |description                              |
#'    |:----------|:---------|:----------------------------------------|
#'    |league     |character |League slug.                             |
#'    |team_id    |character |ESPN team id.                            |
#'    |season     |integer   |Season year.                             |
#'    |athlete_id |character |ESPN athlete id.                         |
#'    |ref        |character |`$ref` URL to athlete-in-season detail.  |
#'
#' @importFrom jsonlite fromJSON
#' @importFrom dplyr as_tibble
#' @export
#' @family ESPN WNBA Functions
#' @examples
#' \donttest{
#'   espn_wnba_team_season_roster(team_id = 13, season = 2025)
#' }
espn_wnba_team_season_roster <- function(team_id,
                                         season = most_recent_wnba_season(),
                                         ...) {
  .espn_basketball_team_season_roster(league = "wnba", team_id = team_id,
                                        season = season, ...)
}

# ---------------------------------------------------------------------------
# espn_wnba_coach_season
# ---------------------------------------------------------------------------

#' **Get ESPN WNBA Coach-in-Season Detail**
#' @name espn_wnba_coach_season
#' @title
#' **Get ESPN WNBA Coach-in-Season Detail**
#' @rdname espn_wnba_coach_season
#' @author Saiem Gilani
#' @description
#' Per-season coach detail (name, birth info, `$ref`s to team/college/
#' person). ESPN's coverage of this endpoint is sparse; many
#' (coach × season) combinations return 404.
#'
#' @param coach_id ESPN coach identifier.
#' @param season Season year. Defaults to most recent WNBA season.
#' @param ... Additional arguments; currently unused.
#' @return A single-row tibble.
#'
#'    |col_name      |types     |description                                |
#'    |:-------------|:---------|:------------------------------------------|
#'    |league        |character |League slug.                               |
#'    |season        |integer   |Season year.                               |
#'    |coach_id      |character |ESPN coach id.                             |
#'    |uid           |character |ESPN UID string.                           |
#'    |first_name    |character |First name.                                |
#'    |last_name     |character |Last name.                                 |
#'    |date_of_birth |character |Date of birth.                             |
#'    |birth_city    |character |Birth city.                                |
#'    |birth_state   |character |Birth state / region.                      |
#'    |n_records     |integer   |Count of records entries.                  |
#'    |person_ref    |character |`$ref` to person resource.                 |
#'    |college_ref   |character |`$ref` to college.                         |
#'    |team_ref      |character |`$ref` to team-in-season.                  |
#'
#' @importFrom jsonlite fromJSON
#' @importFrom dplyr as_tibble
#' @export
#' @family ESPN WNBA Functions
#' @examples
#' \donttest{
#'   espn_wnba_coach_season(coach_id = 6385, season = 2025)
#' }
espn_wnba_coach_season <- function(coach_id,
                                   season = most_recent_wnba_season(),
                                   ...) {
  .espn_basketball_coach_season(league = "wnba", coach_id = coach_id,
                                  season = season, ...)
}
