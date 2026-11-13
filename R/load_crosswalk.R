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
#'   `load_wbb_player_crosswalk()` 2007 onward. The upper bound is
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
#' @return `load_wbb_schedule_crosswalk()` returns a `wehoop_data` tibble of
#'   cached WBB schedule-crosswalk rows, one row per game:
#'
#'    \if{html}{\tabular{lll}{
#'       col_name \tab types \tab description \cr
#'       season \tab integer \tab Season year (ending year). \cr
#'       game_date \tab Date \tab ET game date. \cr
#'       home_espn_team_id \tab integer \tab ESPN home team id (NA for bart-only rows). \cr
#'       away_espn_team_id \tab integer \tab ESPN away team id (NA for bart-only rows). \cr
#'       espn_game_id \tab integer \tab ESPN game id (NA for bart-only rows). \cr
#'       bart_muid \tab character \tab Torvik muid (NA for espn-only rows). \cr
#'       bart_team1 \tab character \tab Torvik team1 name. \cr
#'       bart_team2 \tab character \tab Torvik team2 name. \cr
#'       bart_winner \tab character \tab Torvik winner name. \cr
#'       fox_game_id \tab character \tab Fox game id (NA when unmatched). \cr
#'       yahoo_game_id \tab character \tab Yahoo game id (e.g. \code{ncaaw.g.202511030525}). \cr
#'       ncaa_contest_id \tab character \tab stats.ncaa.org contest id (NA when unmatched). \cr
#'       match_method \tab character \tab "both"/"espn_only"/"bart_only". \cr
#'       match_confidence \tab numeric \tab 1 for matched, NA for unmatched. \cr
#'    }}
#'    \if{latex}{See the HTML help or pkgdown reference for the column table.}
#'
#'   `ncaa_contest_id` is kept as character, like the other provider ids
#'   (`fox_game_id`, `yahoo_game_id`); `as.integer()` it to join to the
#'   integer `contest_id` of the `load_ncaa_wbb_*()` tables.
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
#' @return `load_wbb_player_crosswalk()` returns a `wehoop_data` tibble of
#'   cached WBB player-crosswalk rows, one row per player per team:
#'
#'    \if{html}{\tabular{lll}{
#'       col_name \tab types \tab description \cr
#'       season \tab integer \tab Season year (ending year). \cr
#'       espn_team_id \tab integer \tab ESPN team id. \cr
#'       team_abbreviation \tab character \tab ESPN team abbreviation. \cr
#'       player_name \tab character \tab Normalized player name (matching key). \cr
#'       espn_athlete_id \tab integer \tab ESPN athlete id. \cr
#'       espn_full_name \tab character \tab ESPN full name. \cr
#'       espn_jersey \tab character \tab ESPN jersey number. \cr
#'       espn_position \tab character \tab ESPN position abbreviation. \cr
#'       fox_athlete_id \tab character \tab Fox athlete id (NA if unmatched). \cr
#'       fox_player \tab character \tab Fox player name. \cr
#'       fox_jersey \tab character \tab Fox jersey number. \cr
#'       fox_position_group \tab character \tab Fox position group label. \cr
#'       yahoo_player_id \tab character \tab Yahoo player id (e.g. \code{ncaaw.p.70879}). \cr
#'       yahoo_player_name \tab character \tab Yahoo player name. \cr
#'       ncaa_player_id \tab character \tab stats.ncaa.org player id (NA before 2010 and when unmatched). \cr
#'       match_method \tab character \tab How the player was matched. \cr
#'       match_confidence \tab numeric \tab Match score (1 for exact). \cr
#'       match_keys \tab character \tab Keys the match used. \cr
#'    }}
#'    \if{latex}{See the HTML help or pkgdown reference for the column table.}
#'
#'   The 2007-2009 seasons carry ESPN columns only: Fox, Yahoo and
#'   stats.ncaa.org ids start later. `ncaa_player_id` is kept as character,
#'   like `fox_athlete_id` and `yahoo_player_id`; `as.integer()` it to join
#'   to the integer `player_id` of the `load_ncaa_wbb_*()` tables.
#' @export
#' @family WBB Crosswalk Functions
#' @examples
#' \donttest{
#'   try(load_wbb_player_crosswalk(seasons = most_recent_wbb_season()))
#' }
load_wbb_player_crosswalk <- function(seasons = most_recent_wbb_season()) {
  .load_wehoop_crosswalk(seasons, "wbb_crosswalk", "wbb_player_crosswalk", 2007, most_recent_wbb_season(),
                         default = missing(seasons))
}
