# espn_wnba_athlete_career.R
# Public WNBA shims for athlete career-level core-v2 endpoints.

# ---------------------------------------------------------------------------
# espn_wnba_player_seasons
# ---------------------------------------------------------------------------

#' **Get ESPN WNBA Athlete Career Seasons**
#' @name espn_wnba_player_seasons
NULL
#' @title
#' **Get ESPN WNBA Athlete Career Seasons**
#' @rdname espn_wnba_player_seasons
#' @author Saiem Gilani
#' @description
#' Returns the list of seasons an WNBA athlete appeared in. Useful for
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
#' @family ESPN WNBA Functions
#' @examples
#' \donttest{
#'   # LeBron James (1966): 23 career seasons
#'   espn_wnba_player_seasons(athlete_id = 3149391)
#' }
espn_wnba_player_seasons <- function(athlete_id, ...) {
  .espn_basketball_athlete_seasons(league = "wnba",
                                     athlete_id = athlete_id, ...)
}

# ---------------------------------------------------------------------------
# espn_wnba_player_career_stats
# ---------------------------------------------------------------------------

#' **Get ESPN WNBA Athlete Career Stats (Long Format)**
#' @name espn_wnba_player_career_stats
#' @title
#' **Get ESPN WNBA Athlete Career Stats (Long Format)**
#' @rdname espn_wnba_player_career_stats
#' @author Saiem Gilani
#' @description
#' Returns career stats for a WNBA athlete in long format. Default
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
#' @family ESPN WNBA Functions
#' @examples
#' \donttest{
#'   # LeBron James — regular + postseason combined
#'   espn_wnba_player_career_stats(athlete_id = 3149391)
#'   # Just career aggregate
#'   espn_wnba_player_career_stats(athlete_id = 3149391, stat_type = 2L)
#' }
espn_wnba_player_career_stats <- function(athlete_id,
                                           stat_type = 0L,
                                           ...) {
  .espn_basketball_athlete_career_stats(league = "wnba",
                                          athlete_id = athlete_id,
                                          stat_type = stat_type, ...)
}

# ---------------------------------------------------------------------------
# espn_wnba_draft_pick
# ---------------------------------------------------------------------------

#' **Get ESPN WNBA Draft Pick Detail**
#' @name espn_wnba_draft_pick
#' @title
#' **Get ESPN WNBA Draft Pick Detail**
#' @rdname espn_wnba_draft_pick
#' @author Saiem Gilani
#' @description
#' Returns a single WNBA draft pick. Defaults to the most recent WNBA
#' season's #1 overall pick. For a full draft, use [espn_wnba_draft()].
#'
#' @param season Season year. Defaults to most recent WNBA season.
#' @param round Draft round (default 1).
#' @param pick Pick number within the round (default 1).
#' @param ... Additional arguments; currently unused.
#' @return A single-row tibble.
#'
#'    |col_name    |types     |description                                |
#'    |:-----------|:---------|:------------------------------------------|
#'    |league      |character |League slug.                               |
#'    |season      |integer   |Season year of the draft.                  |
#'    |round       |integer   |Round number.                              |
#'    |pick        |integer   |Pick within the round.                     |
#'    |overall     |integer   |Overall pick number.                       |
#'    |traded      |logical   |Whether the pick was traded.               |
#'    |trade_note  |character |Trade note (if any).                       |
#'    |status      |character |Pick status name.                          |
#'    |athlete_id  |character |Drafted athlete's ESPN id.                 |
#'    |team_id     |character |Drafting team's ESPN id.                   |
#'    |athlete_ref |character |`$ref` to athlete.                         |
#'    |team_ref    |character |`$ref` to team.                            |
#'
#' @importFrom jsonlite fromJSON
#' @importFrom dplyr as_tibble
#' @export
#' @family ESPN WNBA Functions
#' @examples
#' \donttest{
#'   espn_wnba_draft_pick(season = 2024, round = 1, pick = 1)
#' }
espn_wnba_draft_pick <- function(season = most_recent_wnba_season(),
                                 round = 1L, pick = 1L, ...) {
  .espn_basketball_draft_pick(league = "wnba", season = season,
                                round = round, pick = pick, ...)
}

# espn_wnba_player_eventlog_v2 (core-v2 per-season event log)
# ---------------------------------------------------------------------------

#' **Get ESPN WNBA Athlete Per-Season Event Log (core-v2)**
#' @name espn_wnba_player_eventlog_v2
NULL
#' @title
#' **Get ESPN WNBA Athlete Per-Season Event Log (core-v2)**
#' @rdname espn_wnba_player_eventlog_v2
#' @author Saiem Gilani
#' @description
#' Returns one row per (event x team) for an WNBA athlete's appearances
#' in a given season. Distinct from [espn_wnba_player_eventlog()] which
#' wraps the web-common-v3 gamelog endpoint returning stats per game;
#' this core-v2 variant returns refs + `played` flag and is era-correct.
#'
#' @param athlete_id ESPN athlete identifier.
#' @param season Season year. Defaults to most recent WNBA season.
#' @param ... Additional arguments; currently unused.
#' @return A tibble with one row per event appearance. See package source
#'   for column schema.
#' @export
#' @family ESPN WNBA Functions
#' @examples
#' \donttest{
#'   espn_wnba_player_eventlog_v2(athlete_id = 2999102, season = 2025)
#' }
espn_wnba_player_eventlog_v2 <- function(athlete_id,
                                          season = most_recent_wnba_season(),
                                          ...) {
  .espn_basketball_athlete_eventlog_v2(league = "wnba",
                                      athlete_id = athlete_id,
                                      season = season, ...)
}

# ---------------------------------------------------------------------------
# espn_wnba_draft_rounds
# ---------------------------------------------------------------------------

#' **Get ESPN WNBA Draft Rounds Summary**
#' @name espn_wnba_draft_rounds
#' @title
#' **Get ESPN WNBA Draft Rounds Summary**
#' @rdname espn_wnba_draft_rounds
#' @author Saiem Gilani
#' @description
#' Returns one row per round of the WNBA draft (typically 2 rounds:
#' 1st with 30 picks, 2nd with ~28 picks).
#'
#' @param season Season year. Defaults to most recent WNBA season.
#' @param ... Additional arguments; currently unused.
#' @return A tibble with one row per round.
#' @export
#' @family ESPN WNBA Functions
#' @examples
#' \donttest{
#'   espn_wnba_draft_rounds(season = 2024)
#' }
espn_wnba_draft_rounds <- function(season = most_recent_wnba_season(), ...) {
  .espn_basketball_draft_rounds(league = "wnba", season = season, ...)
}

# ---------------------------------------------------------------------------
# espn_wnba_draft_athletes
# ---------------------------------------------------------------------------

#' **Get ESPN WNBA Draft Athletes Index**
#' @name espn_wnba_draft_athletes
#' @title
#' **Get ESPN WNBA Draft Athletes Index**
#' @rdname espn_wnba_draft_athletes
#' @author Saiem Gilani
#' @description
#' Returns one row per drafted athlete in a given WNBA draft year.
#'
#' @param season Season year. Defaults to most recent WNBA season.
#' @param ... Additional arguments; currently unused.
#' @return A tibble of athlete IDs + `$ref` URLs.
#' @export
#' @family ESPN WNBA Functions
#' @examples
#' \donttest{
#'   espn_wnba_draft_athletes(season = 2024)
#' }
espn_wnba_draft_athletes <- function(season = most_recent_wnba_season(), ...) {
  .espn_basketball_draft_athletes(league = "wnba", season = season, ...)
}

# ---------------------------------------------------------------------------
# espn_wnba_draft_status
# ---------------------------------------------------------------------------

#' **Get ESPN WNBA Draft Status**
#' @name espn_wnba_draft_status
#' @title
#' **Get ESPN WNBA Draft Status**
#' @rdname espn_wnba_draft_status
#' @author Saiem Gilani
#' @description
#' Returns the current status of one WNBA draft year (round, state,
#' description). Live during the draft; static afterward.
#'
#' @param season Season year. Defaults to most recent WNBA season.
#' @param ... Additional arguments; currently unused.
#' @return A single-row tibble.
#' @export
#' @family ESPN WNBA Functions
#' @examples
#' \donttest{
#'   espn_wnba_draft_status(season = 2024)
#' }
espn_wnba_draft_status <- function(season = most_recent_wnba_season(), ...) {
  .espn_basketball_draft_status(league = "wnba", season = season, ...)
}

# ---------------------------------------------------------------------------
# espn_wnba_season_draft
# ---------------------------------------------------------------------------

#' **Get ESPN WNBA Season Draft (Top-Level Metadata)**
#' @name espn_wnba_season_draft
NULL
#' @title
#' **Get ESPN WNBA Season Draft (Top-Level Metadata)**
#' @rdname espn_wnba_season_draft
#' @author Saiem Gilani
#' @description
#' Returns a single-row tibble with top-level draft-year metadata: year,
#' number of rounds, display name, plus `$ref`s for the deeper sub-resources
#' (status, athletes, rounds) already wrapped by [espn_wnba_draft_status()],
#' [espn_wnba_draft_athletes()], and [espn_wnba_draft_rounds()].
#'
#' @param season Season year (numeric). Defaults to the most recent WNBA season.
#' @param ... Additional arguments; currently unused.
#' @return A single-row tibble.
#' @export
#' @family ESPN WNBA Functions
#' @examples
#' \donttest{
#'   espn_wnba_season_draft(season = 2024)
#' }
espn_wnba_season_draft <- function(season = most_recent_wnba_season(), ...) {
  .espn_basketball_season_draft(league = "wnba", season = season, ...)
}

# ---------------------------------------------------------------------------
# espn_wnba_draft_athlete_detail
# ---------------------------------------------------------------------------

#' **Get ESPN WNBA Draft Athlete Detail (Single Drafted Player)**
#' @name espn_wnba_draft_athlete_detail
NULL
#' @title
#' **Get ESPN WNBA Draft Athlete Detail (Single Drafted Player)**
#' @rdname espn_wnba_draft_athlete_detail
#' @author Saiem Gilani
#' @description
#' Returns rich single-row detail for one drafted athlete in one NBA
#' draft year: name, height, weight, position, pick (overall/round/team),
#' and a `$ref` to the athlete's core-v2 profile. Use
#' [espn_wnba_draft_athletes()] to enumerate draftees for a year.
#'
#' @param season Draft year (numeric). Defaults to the most recent NBA season.
#' @param athlete_id ESPN draftee identifier.
#' @param ... Additional arguments; currently unused.
#' @return A single-row tibble.
#' @export
#' @family ESPN WNBA Functions
#' @examples
#' \donttest{
#'   espn_wnba_draft_athlete_detail(season = 2024, athlete_id = 3149391)
#' }
espn_wnba_draft_athlete_detail <- function(season = most_recent_wnba_season(),
                                            athlete_id, ...) {
  .espn_basketball_draft_athlete_detail(league = "wnba",
                                          season = season,
                                          athlete_id = athlete_id, ...)
}
