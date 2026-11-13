# load_crosswalk.R -- cached-snapshot loaders for WNBA and WBB crosswalks.
# Reuse the rds_from_url + progressively + rbindlist plumbing used by the
# other load_wnba_* / load_wbb_* functions. No join logic lives here.

# Generic helper parameterised on release tag + file prefix + the seasons the
# tag publishes (see .loader_seasons() in R/utils.R).
.load_wehoop_crosswalk <- function(seasons, tag, prefix, first, last, gaps = NULL, default = FALSE) {
  old <- options(list(stringsAsFactors = FALSE, scipen = 999))
  on.exit(options(old))

  # ESPN and WNBA Stats ids are integer in every other wehoop dataset; some
  # crosswalk assets publish them as character. wnba_game_id stays character,
  # as in the wnba_*() WNBA Stats tables.
  loader <- function(url) {
    .ids_as_integer(rds_from_url(url), c(
      "wnba_player_id", "wnba_team_id", "wnba_home_team_id", "wnba_away_team_id",
      "espn_game_id", "espn_athlete_id", "espn_team_id",
      "home_espn_team_id", "away_espn_team_id"
    ))
  }

  url_for <- function(seasons) paste0(
    "https://github.com/sportsdataverse/sportsdataverse-data/releases/download/",
    tag, "/", prefix, "_", seasons, ".rds"
  )
  seasons <- .loader_seasons(seasons, first, last, gaps = gaps,
                             fn = paste0("load_", prefix), url_for = url_for,
                             default = default)
  urls <- url_for(seasons)

  p <- NULL
  if (is_installed("progressr")) p <- progressr::progressor(along = seasons)

  out <- lapply(urls, progressively(loader, p))
  out <- data.table::rbindlist(out, use.names = TRUE, fill = TRUE)
  class(out) <- c("wehoop_data", "tbl_df", "tbl", "data.frame")
  out
}

# ---------------------------------------------------------------------------
# WNBA loaders
# ---------------------------------------------------------------------------

#' @title
#' **Load cached WNBA team crosswalk from the data repo**
#' @rdname load_wbb_player_crosswalk
#' @description Loads cached team-crosswalk snapshots that map ESPN team
#'   identifiers to WNBA Stats API team identifiers. One row per team-season.
#'   Backed by the `wnba_crosswalk` release tag in `sportsdataverse-data`.
#' @param seasons A vector of 4-digit seasons, or `TRUE` for every published
#'   season. Each loader accepts the seasons its release publishes: 2002
#'   onward for the three WNBA crosswalks; for WBB, `load_wbb_team_crosswalk()`
#'   2002 onward, `load_wbb_schedule_crosswalk()` 2021 onward and
#'   `load_wbb_player_crosswalk()` 2014 onward. The upper bound is
#'   [most_recent_wnba_season()] / [most_recent_wbb_season()]. When `seasons`
#'   is left at its default and that season is not published yet, the loader
#'   reads the newest published season instead, with a message; an explicit
#'   request for it warns and returns an empty frame. The WNBA Stats ids (`wnba_player_id`, `wnba_team_id`,
#'   `wnba_home_team_id`, `wnba_away_team_id`) and the ESPN ids (`espn_game_id`,
#'   `espn_athlete_id`, `espn_team_id`) are returned as integer, matching the
#'   `wnba_*()` WNBA Stats tables and the ESPN loaders; `wnba_game_id` stays
#'   character.
#' @return A `wehoop_data` tibble of cached team-crosswalk rows.
#' @export
#' @family WNBA Crosswalk Functions
#' @examples
#' \donttest{
#'   try(load_wnba_team_crosswalk(seasons = most_recent_wnba_season()))
#' }
load_wnba_team_crosswalk <- function(seasons = most_recent_wnba_season()) {
  .load_wehoop_crosswalk(seasons, "wnba_crosswalk", "wnba_team_crosswalk", 2002, most_recent_wnba_season(),
                         default = missing(seasons))
}


#' @title
#' **Load cached WNBA schedule crosswalk from the data repo**
#' @rdname load_wbb_player_crosswalk
#' @description Loads cached schedule-crosswalk snapshots that map ESPN game
#'   identifiers to WNBA Stats API game identifiers. One row per game-season.
#'   Backed by the `wnba_crosswalk` release tag in `sportsdataverse-data`.
#' @return A `wehoop_data` tibble of cached schedule-crosswalk rows.
#' @export
#' @family WNBA Crosswalk Functions
#' @examples
#' \donttest{
#'   try(load_wnba_schedule_crosswalk(seasons = most_recent_wnba_season()))
#' }
load_wnba_schedule_crosswalk <- function(seasons = most_recent_wnba_season()) {
  .load_wehoop_crosswalk(seasons, "wnba_crosswalk", "wnba_schedule_crosswalk", 2002, most_recent_wnba_season(),
                         default = missing(seasons))
}


#' @title
#' **Load cached WNBA player crosswalk from the data repo**
#' @rdname load_wbb_player_crosswalk
#' @description Loads cached player-crosswalk snapshots that map ESPN athlete
#'   identifiers to WNBA Stats API player identifiers. One row per
#'   athlete-season. Backed by the `wnba_crosswalk` release tag in
#'   `sportsdataverse-data`.
#' @return A `wehoop_data` tibble of cached player-crosswalk rows.
#' @source <https://github.com/sportsdataverse/sportsdataverse-data/releases/tag/wnba_crosswalk>
#' @export
#' @family WNBA Crosswalk Functions
#' @examples
#' \donttest{
#'   try(load_wnba_player_crosswalk(seasons = most_recent_wnba_season()))
#' }
load_wnba_player_crosswalk <- function(seasons = most_recent_wnba_season()) {
  .load_wehoop_crosswalk(seasons, "wnba_crosswalk", "wnba_player_crosswalk", 2002, most_recent_wnba_season(),
                         default = missing(seasons))
}

# ---------------------------------------------------------------------------
# WBB loaders
# ---------------------------------------------------------------------------

#' @title
#' **Load cached WBB team crosswalk from the data repo**
#' @rdname load_wbb_player_crosswalk
#' @description Loads cached team-crosswalk snapshots that map ESPN team
#'   identifiers to Fox Sports and Bart Torvik team identifiers for Women's
#'   College Basketball. One row per team-season. Backed by the
#'   `wbb_crosswalk` release tag in `sportsdataverse-data`.
#' @return A `wehoop_data` tibble of cached WBB team-crosswalk rows.
#' @export
#' @family WBB Crosswalk Functions
#' @examples
#' \donttest{
#'   try(load_wbb_team_crosswalk(seasons = most_recent_wbb_season()))
#' }
load_wbb_team_crosswalk <- function(seasons = most_recent_wbb_season()) {
  .load_wehoop_crosswalk(seasons, "wbb_crosswalk", "wbb_team_crosswalk", 2002, most_recent_wbb_season(),
                         default = missing(seasons))
}


#' @title
#' **Load cached WBB schedule crosswalk from the data repo**
#' @rdname load_wbb_player_crosswalk
#' @description Loads cached schedule-crosswalk snapshots that map ESPN game
#'   identifiers to Bart Torvik game identifiers for Women's College
#'   Basketball. One row per game-season. Backed by the `wbb_crosswalk`
#'   release tag in `sportsdataverse-data`.
#' @return A `wehoop_data` tibble of cached WBB schedule-crosswalk rows.
#' @export
#' @family WBB Crosswalk Functions
#' @examples
#' \donttest{
#'   try(load_wbb_schedule_crosswalk(seasons = most_recent_wbb_season()))
#' }
load_wbb_schedule_crosswalk <- function(seasons = most_recent_wbb_season()) {
  .load_wehoop_crosswalk(seasons, "wbb_crosswalk", "wbb_schedule_crosswalk", 2021, most_recent_wbb_season(),
                         default = missing(seasons))
}


#' **Load cached WBB player crosswalk**
#' @name load_wbb_player_crosswalk
NULL
#' @title
#' **Load cached WBB player crosswalk from the data repo**
#' @rdname load_wbb_player_crosswalk
#' @description Loads cached player-crosswalk snapshots that map ESPN athlete
#'   identifiers to Fox Sports player identifiers for Women's College
#'   Basketball. One row per athlete-season. Backed by the `wbb_crosswalk`
#'   release tag in `sportsdataverse-data`.
#' @return A `wehoop_data` tibble of cached WBB player-crosswalk rows.
#' @source <https://github.com/sportsdataverse/sportsdataverse-data/releases/tag/wbb_crosswalk>
#' @export
#' @family WBB Crosswalk Functions
#' @examples
#' \donttest{
#'   try(load_wbb_player_crosswalk(seasons = most_recent_wbb_season()))
#' }
load_wbb_player_crosswalk <- function(seasons = most_recent_wbb_season()) {
  .load_wehoop_crosswalk(seasons, "wbb_crosswalk", "wbb_player_crosswalk", 2014, most_recent_wbb_season(),
                         default = missing(seasons))
}

# ---------------------------------------------------------------------------
# stats.ncaa.org <-> ESPN (static, all-seasons files on the wbb_crosswalk tag)
# ---------------------------------------------------------------------------

# The release publishes the ESPN ids as character; cast them like every
# other wehoop ESPN id. The NCAA ids are already integer.
.load_wbb_ncaa_espn <- function(file) {
  out <- .ids_as_integer(parquet_from_url(paste0(
    "https://github.com/sportsdataverse/sportsdataverse-data/releases/download/",
    "wbb_crosswalk/", file, ".parquet"
  )), c("espn_team_id", "espn_conference_id"))
  class(out) <- c("wehoop_data", "tbl_df", "tbl", "data.frame")
  out
}

#' **Load the stats.ncaa.org to ESPN WBB crosswalks**
#' @name load_wbb_ncaa_espn_team_crosswalk
NULL
#' @title
#' **Load the stats.ncaa.org to ESPN WBB team crosswalk from the data repo**
#' @rdname load_wbb_ncaa_espn_team_crosswalk
#' @description stats.ncaa.org gives a team a new numeric id every season
#'   and spells school names in AP style; ESPN keeps one id per school. These
#'   loaders read the all-seasons crosswalk tables on the `wbb_crosswalk`
#'   release tag that join the two, so the `load_ncaa_wbb_*()` tables can be
#'   matched to the ESPN-based `load_wbb_*()` tables.
#'
#'   * `load_wbb_ncaa_espn_team_crosswalk()`: one row per season and
#'     stats.ncaa.org team id (2009-10 onward), with the ESPN team and both
#'     sources' conference for that season. The same table as
#'     sportsdataverse-py's `ncaa_espn_team_crosswalk(league = "wbb")`.
#'   * `load_wbb_ncaa_espn_schools()`: one row per NCAA school (org id)
#'     with its ESPN team.
#'   * `load_wbb_ncaa_espn_school_seasons()`: one row per school, sport and
#'     season with that season's stats.ncaa.org team id. It covers both
#'     sports (`sport` is `mbb` or `wbb`), since an org id is shared by every
#'     team of a school.
#'
#'   The ESPN ids (`espn_team_id`, `espn_conference_id`) are returned as
#'   integer, matching the ESPN loaders; `ncaa_team_id` and `ncaa_org_id`
#'   are integer, as in [load_ncaa_wbb_team_ids()]. `season` is the
#'   `"YYYY-YY"` string the release uses.
#' @return `load_wbb_ncaa_espn_team_crosswalk()` returns a `wehoop_data`
#'   tibble:
#'
#'    |col_name             |types     |description                                                                 |
#'    |:--------------------|:---------|:---------------------------------------------------------------------------|
#'    |season               |character |Season, `"YYYY-YY"` (e.g. `"2024-25"`).                                     |
#'    |ncaa_team_id         |integer   |stats.ncaa.org team id for that season.                                     |
#'    |ncaa_org_id          |integer   |stats.ncaa.org school (org) id, stable across seasons.                      |
#'    |ncaa_team            |character |stats.ncaa.org school name.                                                 |
#'    |ncaa_conference      |character |stats.ncaa.org conference that season.                                      |
#'    |conference_id        |character |SportsDataverse group id (e.g. `wbb:big-ten`).                              |
#'    |espn_team_id         |integer   |ESPN team id.                                                               |
#'    |espn_display_name    |character |ESPN team display name.                                                     |
#'    |espn_location        |character |ESPN team location.                                                         |
#'    |espn_mascot          |character |ESPN team mascot.                                                           |
#'    |espn_abbreviation    |character |ESPN team abbreviation.                                                     |
#'    |espn_conference_name |character |ESPN conference name that season.                                           |
#'    |espn_conference_id   |integer   |ESPN conference (group) id that season.                                     |
#'    |match_method         |character |How the team was matched: `exact`, `dict`, `alias`, `org` or `unmatched`.   |
#'
#'   `load_wbb_ncaa_espn_schools()` returns `ncaa_org_id`, `ncaa_team`,
#'   `espn_team_id` and `espn_display_name`.
#'   `load_wbb_ncaa_espn_school_seasons()` returns `ncaa_org_id`, `sport`,
#'   `season`, `ncaa_team_id` and `espn_team_id`.
#' @source <https://github.com/sportsdataverse/sportsdataverse-data/releases/tag/wbb_crosswalk>
#' @export
#' @family WBB Crosswalk Functions
#' @examples
#' \donttest{
#'   try(load_wbb_ncaa_espn_team_crosswalk())
#'   try(load_wbb_ncaa_espn_schools())
#'   try(load_wbb_ncaa_espn_school_seasons())
#' }
load_wbb_ncaa_espn_team_crosswalk <- function() .load_wbb_ncaa_espn("ncaa_espn_team_crosswalk")

#' @rdname load_wbb_ncaa_espn_team_crosswalk
#' @export
load_wbb_ncaa_espn_schools <- function() .load_wbb_ncaa_espn("ncaa_espn_schools")

#' @rdname load_wbb_ncaa_espn_team_crosswalk
#' @export
load_wbb_ncaa_espn_school_seasons <- function() .load_wbb_ncaa_espn("ncaa_espn_school_seasons")
