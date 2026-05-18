# espn_wbb_awards.R
# Public WBB shims for ESPN season-awards endpoints.

# ---------------------------------------------------------------------------
# espn_wbb_season_awards
# ---------------------------------------------------------------------------

#' **Get ESPN WBB Season Awards Index**
#' @name espn_wbb_season_awards
NULL
#' @title
#' **Get ESPN WBB Season Awards Index**
#' @rdname espn_wbb_season_awards
#' @author Saiem Gilani
#' @description
#' Returns the list of award IDs given out in a WBB season from
#' `sports.core.api.espn.com/v2/sports/basketball/leagues/womens-college-basketball/seasons/{season}/awards`.
#' The index only contains IDs and `$ref` URLs — pass an ID to
#' [espn_wbb_award()] for the award name, description, and winners.
#'
#' @param season Season year (numeric). Defaults to the most recent WBB season.
#' @param ... Additional arguments; currently unused.
#' @return A tibble with one row per award.
#'
#'    |col_name |types     |description                                  |
#'    |:--------|:---------|:--------------------------------------------|
#'    |season   |integer   |Season year.                                 |
#'    |award_id |character |ESPN award identifier.                       |
#'    |ref      |character |Full `$ref` URL for the award detail.        |
#'    |league   |character |League slug (`"womens-college-basketball"`). |
#'
#' @importFrom jsonlite fromJSON
#' @importFrom dplyr as_tibble
#' @export
#' @family ESPN WBB Functions
#' @examples
#' \donttest{
#'   espn_wbb_season_awards(season = 2024)
#' }
espn_wbb_season_awards <- function(season = most_recent_wbb_season(), ...) {
  .espn_basketball_season_awards(league = "womens-college-basketball",
                                  season = season, ...)
}

# ---------------------------------------------------------------------------
# espn_wbb_award
# ---------------------------------------------------------------------------

#' **Get ESPN WBB Season Award Detail**
#' @name espn_wbb_award
NULL
#' @title
#' **Get ESPN WBB Season Award Detail**
#' @rdname espn_wbb_award
#' @author Saiem Gilani
#' @description
#' Returns the name, description, and winners of one WBB season award.
#'
#' @param award_id ESPN award identifier (character or numeric).
#' @param season Season year (numeric). Defaults to the most recent WBB season.
#' @param ... Additional arguments; currently unused.
#' @return A tibble with one row per winner.
#'
#'    |col_name    |types     |description                                              |
#'    |:-----------|:---------|:--------------------------------------------------------|
#'    |league      |character |League slug.                                             |
#'    |season      |integer   |Season year.                                             |
#'    |award_id    |character |ESPN award identifier.                                   |
#'    |name        |character |Award name.                                              |
#'    |description |character |Award description.                                       |
#'    |athlete_id  |character |ESPN athlete id of winner.                               |
#'    |team_id     |character |ESPN team id.                                            |
#'    |athlete_ref |character |`$ref` to winner's per-season athlete resource.          |
#'    |team_ref    |character |`$ref` to winner's per-season team resource.             |
#'
#' @importFrom jsonlite fromJSON
#' @importFrom dplyr as_tibble
#' @export
#' @family ESPN WBB Functions
#' @examples
#' \donttest{
#'   espn_wbb_award(award_id = 33, season = 2024)
#' }
espn_wbb_award <- function(award_id,
                            season = most_recent_wbb_season(),
                            ...) {
  .espn_basketball_award(
    league   = "womens-college-basketball",
    season   = season,
    award_id = award_id,
    ...
  )
}
