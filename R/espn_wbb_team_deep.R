# espn_wbb_team_deep.R
# Public WBB shims for deeper per-team / per-coach core-v2 endpoints.

# ---------------------------------------------------------------------------
# espn_wbb_team_season_roster
# ---------------------------------------------------------------------------

#' **Get ESPN WBB Team Roster (Per-Season, core-v2)**
#' @name espn_wbb_team_season_roster
#' @title
#' **Get ESPN WBB Team Roster (Per-Season, core-v2)**
#' @rdname espn_wbb_team_season_roster
#' @author Saiem Gilani
#' @description
#' Returns the per-season team roster as a tibble of athlete IDs from
#' `seasons/{y}/teams/{id}/athletes`. Distinct from [espn_wbb_team_roster()]
#' which targets a site-v2 endpoint optimized for the current season; this
#' core-v2 variant is era-correct and available back to ESPN's earliest
#' season for each league.
#'
#' @param team_id ESPN team identifier.
#' @param season Season year. Defaults to most recent WBB season.
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
#' @family ESPN WBB Functions
#' @examples
#' \donttest{
#'   espn_wbb_team_season_roster(team_id = 13, season = 2025)
#' }
espn_wbb_team_season_roster <- function(team_id,
                                         season = most_recent_wbb_season(),
                                         ...) {
  .espn_basketball_team_season_roster(league = "womens-college-basketball", team_id = team_id,
                                        season = season, ...)
}

# ---------------------------------------------------------------------------
# espn_wbb_coach_season
# ---------------------------------------------------------------------------

#' **Get ESPN WBB Coach-in-Season Detail**
#' @name espn_wbb_coach_season
#' @title
#' **Get ESPN WBB Coach-in-Season Detail**
#' @rdname espn_wbb_coach_season
#' @author Saiem Gilani
#' @description
#' Per-season coach detail (name, birth info, `$ref`s to team/college/
#' person). ESPN's coverage of this endpoint is sparse; many
#' (coach × season) combinations return 404.
#'
#' @param coach_id ESPN coach identifier.
#' @param season Season year. Defaults to most recent WBB season.
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
#' @family ESPN WBB Functions
#' @examples
#' \donttest{
#'   espn_wbb_coach_season(coach_id = 6385, season = 2025)
#' }
espn_wbb_coach_season <- function(coach_id,
                                   season = most_recent_wbb_season(),
                                   ...) {
  .espn_basketball_coach_season(league = "womens-college-basketball", coach_id = coach_id,
                                  season = season, ...)
}
