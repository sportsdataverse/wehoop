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
#'   espn_wbb_team_season_roster(team_id = 2509, season = 2025)
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
#'    Columns as documented in the shared [espn_basketball_coach_season_schema] table.
#'
#' @importFrom jsonlite fromJSON
#' @importFrom dplyr as_tibble
#' @export
#' @family ESPN WBB Functions
#' @examples
#' \donttest{
#'   espn_wbb_coach_season(coach_id = 2167842, season = 2025)
#' }
espn_wbb_coach_season <- function(coach_id,
                                   season = most_recent_wbb_season(),
                                   ...) {
  .espn_basketball_coach_season(league = "womens-college-basketball", coach_id = coach_id,
                                  season = season, ...)
}
# ---------------------------------------------------------------------------
# espn_wbb_team_record_detail
# ---------------------------------------------------------------------------

#' **Get ESPN WBB Team Record Detail (Long Format)**
#' @name espn_wbb_team_record_detail
NULL
#' @title
#' **Get ESPN WBB Team Record Detail (Long Format)**
#' @rdname espn_wbb_team_record_detail
#' @author Saiem Gilani
#' @description
#' Returns one team's record detail in long format: one row per stat in
#' the record's `stats[]` array. Use the record-index endpoint to enumerate
#' available `record_id` values per team-season (overall / home / away /
#' conference + per-opponent breakdowns).
#'
#' @param team_id ESPN team identifier.
#' @param season Season year (numeric).
#' @param record_id Record identifier (from the record-index endpoint index).
#' @param season_type Integer season type: 1 = preseason, 2 = regular (default),
#'   3 = postseason.
#' @param ... Additional arguments; currently unused.
#' @return A long tibble.
#' @export
#' @family ESPN WBB Functions
#' @examples
#' \donttest{
#'   espn_wbb_team_record_detail(team_id = 2509, season = 2024, record_id = 0)
#' }
espn_wbb_team_record_detail <- function(team_id, season, record_id,
                                          season_type = 2L, ...) {
  .espn_basketball_team_record_detail(league = "womens-college-basketball",
                                        team_id = team_id,
                                        season = season,
                                        record_id = record_id,
                                        season_type = season_type, ...)
}
