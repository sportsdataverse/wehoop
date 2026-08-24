# espn_wbb_athlete_career.R
# Public WBB shims for athlete career-level core-v2 endpoints.

# ---------------------------------------------------------------------------
# espn_wbb_player_seasons
# ---------------------------------------------------------------------------

#' **Get ESPN WBB Athlete Career Seasons**
#' @name espn_wbb_player_seasons
NULL
#' @title
#' **Get ESPN WBB Athlete Career Seasons**
#' @rdname espn_wbb_player_seasons
#' @author Saiem Gilani
#' @description
#' Returns the list of seasons an WBB athlete appeared in. Useful for
#' bounding follow-up calls to per-season endpoints.
#'
#' @param athlete_id ESPN athlete identifier (character or numeric).
#' @param ... Additional arguments; currently unused.
#' @return A tibble with one row per career season.
#'
#'    |col_name   |types     |description                              |
#'    |:----------|:---------|:----------------------------------------|
#'    |league     |character |League slug.                             |
#'    |athlete_id |character |ESPN athlete id.                         |
#'    |season     |integer   |Season year.                             |
#'    |ref        |character |`$ref` URL to the season detail.         |
#'
#' @importFrom jsonlite fromJSON
#' @importFrom dplyr as_tibble
#' @export
#' @family ESPN WBB Functions
#' @examples
#' \donttest{
#'   # LeBron James (1966): 23 career seasons
#'   espn_wbb_player_seasons(athlete_id = 4433404)
#' }
espn_wbb_player_seasons <- function(athlete_id, ...) {
  .espn_basketball_athlete_seasons(league = "womens-college-basketball",
                                     athlete_id = athlete_id, ...)
}

# ---------------------------------------------------------------------------
# espn_wbb_player_career_stats
# ---------------------------------------------------------------------------

#' **Get ESPN WBB Athlete Career Stats (Long Format)**
#' @name espn_wbb_player_career_stats
#' @title
#' **Get ESPN WBB Athlete Career Stats (Long Format)**
#' @rdname espn_wbb_player_career_stats
#' @author Saiem Gilani
#' @description
#' Returns career stats for a WBB athlete in long format. Default
#' `stat_type = 0L` fetches the standard "All Splits" / regular-season
#' view. Pass a vector like `c(0L, 1L, 2L)` to attempt multiple types
#' and bind them via a `stat_type_id` column; variants that 404 for that
#' athlete are silently skipped. Stat types: 0 = regular season (default
#' endpoint), 1 = postseason, 2 = career aggregate. Coverage of types 1
#' and 2 is sparse — many athletes only have type 0 populated.
#'
#' @param athlete_id ESPN athlete identifier.
#' @param stat_type Integer or integer vector of stat-type codes.
#'   Default `0L` fetches the standard "All Splits" / regular-season view.
#'   Pass a vector like `c(0L, 1L, 2L)` to bind multiple types via a
#'   `stat_type_id` column; non-existent variants are silently skipped.
#' @param ... Additional arguments; currently unused.
#' @return A long tibble (one row per stat_type × split × category × stat).
#'
#'    Columns as documented in the shared [espn_basketball_player_career_stats_schema] table.
#'
#' @importFrom jsonlite fromJSON
#' @importFrom dplyr as_tibble
#' @export
#' @family ESPN WBB Functions
#' @examples
#' \donttest{
#'   # LeBron James — regular + postseason combined
#'   espn_wbb_player_career_stats(athlete_id = 4433404)
#'   # Just career aggregate
#'   espn_wbb_player_career_stats(athlete_id = 4433404, stat_type = 2L)
#' }
espn_wbb_player_career_stats <- function(athlete_id,
                                           stat_type = 0L,
                                           ...) {
  .espn_basketball_athlete_career_stats(league = "womens-college-basketball",
                                          athlete_id = athlete_id,
                                          stat_type = stat_type, ...)
}


# espn_wbb_player_eventlog_v2 (core-v2 per-season event log)
# ---------------------------------------------------------------------------

#' **Get ESPN WBB Athlete Per-Season Event Log (core-v2)**
#' @name espn_wbb_player_eventlog_v2
NULL
#' @title
#' **Get ESPN WBB Athlete Per-Season Event Log (core-v2)**
#' @rdname espn_wbb_player_eventlog_v2
#' @author Saiem Gilani
#' @description
#' Returns one row per (event x team) for an WBB athlete's appearances
#' in a given season. Distinct from [espn_wbb_player_eventlog()] which
#' wraps the web-common-v3 endpoint; this core-v2 variant is era-correct.
#'
#' @param athlete_id ESPN athlete identifier.
#' @param season Season year. Defaults to most recent WBB season.
#' @param ... Additional arguments; currently unused.
#' @return A tibble with one row per event appearance.
#' @export
#' @family ESPN WBB Functions
#' @examples
#' \donttest{
#'   espn_wbb_player_eventlog_v2(athlete_id = 4433404, season = 2025)
#' }
espn_wbb_player_eventlog_v2 <- function(athlete_id,
                                          season = most_recent_wbb_season(),
                                          ...) {
  .espn_basketball_athlete_eventlog_v2(league = "womens-college-basketball",
                                      athlete_id = athlete_id,
                                      season = season, ...)
}
