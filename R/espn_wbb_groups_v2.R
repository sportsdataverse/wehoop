# espn_wbb_groups_v2.R
# Public WBB shims for ESPN per-season group / conference endpoints.
# (Distinct from the existing site-v2 espn_wbb_groups, which targets a
# different endpoint family — this batch wraps the core-v2 groups.)

# ---------------------------------------------------------------------------
# espn_wbb_season_groups
# ---------------------------------------------------------------------------

#' **Get ESPN WBB Season Groups Index**
#' @name espn_wbb_season_groups
NULL
#' @title
#' **Get ESPN WBB Season Groups Index**
#' @rdname espn_wbb_season_groups
#' @author Saiem Gilani
#' @description
#' Returns the list of group IDs (conferences / divisions) for one
#' (WBB season x season-type) via core-v2
#' `/seasons/{season}/types/{season_type}/groups`.
#'
#' @param season Season year. Defaults to most recent WBB season.
#' @param season_type Season-type id (2 = regular (default)).
#' @param ... Additional arguments; currently unused.
#' @return A tibble with one row per group.
#'
#'    |col_name    |types     |description                              |
#'    |:-----------|:---------|:----------------------------------------|
#'    |league      |character |League slug.                             |
#'    |season      |integer   |Season year.                             |
#'    |season_type |integer   |Season-type id.                          |
#'    |group_id    |character |ESPN group id.                           |
#'    |ref         |character |`$ref` URL for the group detail.         |
#'
#' @importFrom jsonlite fromJSON
#' @importFrom dplyr as_tibble
#' @export
#' @family ESPN WBB Functions
#' @examples
#' \donttest{
#'   espn_wbb_season_groups(season = 2025)
#' }
espn_wbb_season_groups <- function(season = most_recent_wbb_season(),
                                    season_type = c(2L, 3L), ...) {
  .espn_basketball_season_groups(league = "womens-college-basketball", season = season,
                                   season_type = season_type, ...)
}

# ---------------------------------------------------------------------------
# espn_wbb_season_group
# ---------------------------------------------------------------------------

#' **Get ESPN WBB Season Group Detail**
#' @name espn_wbb_season_group
#' @title
#' **Get ESPN WBB Season Group Detail**
#' @rdname espn_wbb_season_group
#' @author Saiem Gilani
#' @description
#' Returns metadata for one group (conference or division) in one
#' (WBB season x season-type), plus `$ref` URLs to its parent group,
#' children groups, member teams, and standings.
#'
#' @param group_id ESPN group identifier.
#' @param season Season year. Defaults to most recent WBB season.
#' @param season_type Season-type id (2 = regular (default)).
#' @param ... Additional arguments; currently unused.
#' @return A single-row tibble.
#'
#'    Columns as documented in the shared [espn_basketball_season_group_schema] table.
#'
#' @importFrom jsonlite fromJSON
#' @importFrom dplyr as_tibble
#' @export
#' @family ESPN WBB Functions
#' @examples
#' \donttest{
#'   espn_wbb_season_group(group_id = 5, season = 2025)
#' }
espn_wbb_season_group <- function(group_id,
                                   season = most_recent_wbb_season(),
                                   season_type = 2L, ...) {
  .espn_basketball_season_group(league = "womens-college-basketball", season = season,
                                  season_type = season_type,
                                  group_id = group_id, ...)
}

# ---------------------------------------------------------------------------
# espn_wbb_season_group_children
# ---------------------------------------------------------------------------

#' **Get ESPN WBB Season Group Children Index**
#' @name espn_wbb_season_group_children
#' @title
#' **Get ESPN WBB Season Group Children Index**
#' @rdname espn_wbb_season_group
#' @author Saiem Gilani
#' @description
#' Returns the list of child groups (e.g. divisions within a conference)
#' for one (WBB season x season-type x parent-group).
#'
#' @param group_id Parent group identifier.
#' @param season Season year. Defaults to most recent WBB season.
#' @param season_type Season-type id (2 = regular (default)).
#' @param ... Additional arguments; currently unused.
#' @return A tibble with one row per child group.
#'
#'    |col_name        |types     |description                            |
#'    |:---------------|:---------|:--------------------------------------|
#'    |league          |character |League slug.                           |
#'    |season          |integer   |Season year.                           |
#'    |season_type     |integer   |Season-type id.                        |
#'    |parent_group_id |character |Parent group id (queried).             |
#'    |child_group_id  |character |Child group id.                        |
#'    |ref             |character |`$ref` to child group detail.          |
#'
#' @importFrom jsonlite fromJSON
#' @importFrom dplyr as_tibble
#' @export
#' @family ESPN WBB Functions
#' @examples
#' \donttest{
#'   espn_wbb_season_group_children(group_id = 5, season = 2025)
#' }
espn_wbb_season_group_children <- function(group_id,
                                            season = most_recent_wbb_season(),
                                            season_type = 2L, ...) {
  .espn_basketball_season_group_children(league = "womens-college-basketball", season = season,
                                           season_type = season_type,
                                           group_id = group_id, ...)
}

# ---------------------------------------------------------------------------
# espn_wbb_season_group_teams
# ---------------------------------------------------------------------------

#' **Get ESPN WBB Season Group Teams Index**
#' @name espn_wbb_season_group_teams
#' @title
#' **Get ESPN WBB Season Group Teams Index**
#' @rdname espn_wbb_season_group
#' @author Saiem Gilani
#' @description
#' Returns the list of team IDs that belong to one group (conference or
#' division) for one (WBB season x season-type).
#'
#' @param group_id ESPN group identifier.
#' @param season Season year. Defaults to most recent WBB season.
#' @param season_type Season-type id (2 = regular (default)).
#' @param ... Additional arguments; currently unused.
#' @return A tibble with one row per team in the group.
#'
#'    |col_name    |types     |description                              |
#'    |:-----------|:---------|:----------------------------------------|
#'    |league      |character |League slug.                             |
#'    |season      |integer   |Season year.                             |
#'    |season_type |integer   |Season-type id.                          |
#'    |group_id    |character |ESPN group id.                           |
#'    |team_id     |character |ESPN team id.                            |
#'    |ref         |character |`$ref` URL to the team-in-season entry.  |
#'
#' @importFrom jsonlite fromJSON
#' @importFrom dplyr as_tibble
#' @export
#' @family ESPN WBB Functions
#' @examples
#' \donttest{
#'   espn_wbb_season_group_teams(group_id = 5, season = 2025)
#' }
espn_wbb_season_group_teams <- function(group_id,
                                         season = most_recent_wbb_season(),
                                         season_type = 2L, ...) {
  .espn_basketball_season_group_teams(league = "womens-college-basketball", season = season,
                                        season_type = season_type,
                                        group_id = group_id, ...)
}
