#' **Get ESPN Women's College Basketball Injuries**
#' @name espn_wbb_injuries
NULL
#' @title
#' **Get ESPN Women's College Basketball Injuries**
#' @rdname espn_wbb_injuries
#' @author Saiem Gilani
#' @param season Numeric or character season year (e.g. `2025`). The ESPN
#'   injury endpoint does not filter by season server-side; the value is
#'   attached as a constant column on the returned tibble for downstream joins.
#'   Defaults to `most_recent_wbb_season()`.
#' @param ... Currently unused; reserved for future argument threading.
#' @return Returns a tibble of league-wide WBB injury records. ESPN's WBB
#'   injury data is typically sparse; the function returns an empty tibble
#'   (zero rows) when no injuries are reported.
#'
#'    **Injuries**
#'
#'    |col_name      |types     |
#'    |:-------------|:---------|
#'    |team_id       |character |
#'    |athlete_id    |character |
#'    |athlete_name  |character |
#'    |position      |character |
#'    |status        |character |
#'    |date          |character |
#'    |type          |character |
#'    |side          |character |
#'    |returns_at    |character |
#'    |short_comment |character |
#'    |long_comment  |character |
#'    |season        |integer   |
#'
#' @importFrom jsonlite fromJSON
#' @importFrom dplyr as_tibble bind_rows mutate
#' @importFrom janitor clean_names
#' @export
#' @family ESPN WBB Functions
#' @examples
#' \donttest{
#'   espn_wbb_injuries()
#' }
espn_wbb_injuries <- function(season = most_recent_wbb_season(), ...) {
  .espn_basketball_league_injuries(
    league = "womens-college-basketball",
    season = season,
    ...
  )
}


#' **Get ESPN Women's College Basketball Team Injuries**
#' @name espn_wbb_team_injuries
NULL
#' @title
#' **Get ESPN Women's College Basketball Team Injuries**
#' @rdname espn_wbb_team_injuries
#' @author Saiem Gilani
#' @param team_id ESPN team identifier (character or numeric; passed as-is).
#'   Use `espn_wbb_teams()` to look up team IDs. Example: `"2509"` (UConn).
#' @param ... Currently unused; reserved for future argument threading.
#' @return Returns a tibble of injury records for the specified WBB team.
#'   Returns an empty tibble (zero rows) when the team has no reported
#'   injuries.
#'
#'    **Injuries**
#'
#'    |col_name      |types     |
#'    |:-------------|:---------|
#'    |team_id       |character |
#'    |athlete_id    |character |
#'    |athlete_name  |character |
#'    |position      |character |
#'    |status        |character |
#'    |date          |character |
#'    |type          |character |
#'    |side          |character |
#'    |returns_at    |character |
#'    |short_comment |character |
#'    |long_comment  |character |
#'
#' @importFrom jsonlite fromJSON
#' @importFrom dplyr as_tibble bind_rows
#' @importFrom janitor clean_names
#' @export
#' @family ESPN WBB Functions
#' @examples
#' \donttest{
#'   espn_wbb_team_injuries(team_id = "2509")
#' }
espn_wbb_team_injuries <- function(team_id, ...) {
  .espn_basketball_team_injuries(
    league  = "womens-college-basketball",
    team_id = team_id,
    ...
  )
}
