#' **Get ESPN WNBA Injuries**
#' @name espn_wnba_injuries
NULL
#' @title
#' **Get ESPN WNBA Injuries**
#' @rdname espn_wnba_injuries
#' @author Saiem Gilani
#' @param season Numeric or character season year (e.g. `2025`). The ESPN
#'   injury endpoint does not filter by season server-side; the value is
#'   attached as a constant column on the returned tibble for downstream joins.
#'   Defaults to `most_recent_wnba_season()`.
#' @param ... Currently unused; reserved for future argument threading.
#' @return Returns a tibble of league-wide WNBA injury records.
#'   Returns an empty tibble (zero rows) when no injuries are reported.
#'
#'    **Injuries**
#'
#'    Columns as documented in the shared [espn_basketball_injuries_schema] table.
#'
#' @importFrom jsonlite fromJSON
#' @importFrom dplyr as_tibble bind_rows mutate
#' @importFrom janitor clean_names
#' @export
#' @family ESPN WNBA Functions
#' @examples
#' \donttest{
#'   espn_wnba_injuries()
#' }
espn_wnba_injuries <- function(season = most_recent_wnba_season(), ...) {
  .espn_basketball_league_injuries(
    league = "wnba",
    season = season,
    ...
  )
}


#' **Get ESPN WNBA Team Injuries**
#' @name espn_wnba_team_injuries
NULL
#' @title
#' **Get ESPN WNBA Team Injuries**
#' @rdname espn_wnba_team_injuries
#' @author Saiem Gilani
#' @param team_id ESPN team identifier (character or numeric; passed as-is).
#'   Use `espn_wnba_teams()` to look up team IDs. Example: `"17"` (Las Vegas
#'   Aces).
#' @param ... Currently unused; reserved for future argument threading.
#' @return Returns a tibble of injury records for the specified WNBA team.
#'   Returns an empty tibble (zero rows) when the team has no reported
#'   injuries.
#'
#'    **Injuries**
#'
#'    Columns as documented in the shared [espn_basketball_team_injuries_injuries_schema] table.
#'
#' @importFrom jsonlite fromJSON
#' @importFrom dplyr as_tibble bind_rows
#' @importFrom janitor clean_names
#' @export
#' @family ESPN WNBA Functions
#' @examples
#' \donttest{
#'   espn_wnba_team_injuries(team_id = "17")
#' }
espn_wnba_team_injuries <- function(team_id, ...) {
  .espn_basketball_team_injuries(
    league  = "wnba",
    team_id = team_id,
    ...
  )
}
