# load_crosswalk.R -- cached-snapshot loaders for WNBA and WBB crosswalks.
# Reuse the rds_from_url + progressively + rbindlist plumbing used by the
# other load_wnba_* / load_wbb_* functions. No join logic lives here.

# Generic helper parameterised on release tag + file prefix.
# Season validation (bounds, numeric check) is handled in each public wrapper
# before delegating here, keeping the helper sport-agnostic.
.load_wehoop_crosswalk <- function(seasons, tag, prefix) {
  old <- options(list(stringsAsFactors = FALSE, scipen = 999))
  on.exit(options(old))

  loader <- rds_from_url

  urls <- paste0(
    "https://github.com/sportsdataverse/sportsdataverse-data/releases/download/",
    tag, "/", prefix, "_", seasons, ".rds"
  )

  p <- NULL
  if (is_installed("progressr")) p <- progressr::progressor(along = seasons)

  out <- lapply(urls, progressively(loader, p))
  out <- data.table::rbindlist(out, use.names = TRUE, fill = TRUE)
  class(out) <- c("wehoop_data", "tbl_df", "tbl", "data.table", "data.frame")
  out
}

# ---------------------------------------------------------------------------
# WNBA loaders
# ---------------------------------------------------------------------------

#' **Load cached WNBA team crosswalk**
#' @name load_wnba_team_crosswalk
NULL
#' @title
#' **Load cached WNBA team crosswalk from the data repo**
#' @rdname load_wnba_team_crosswalk
#' @description Loads cached team-crosswalk snapshots that map ESPN team
#'   identifiers to WNBA Stats API team identifiers. One row per team-season.
#'   Backed by the `wnba_crosswalk` release tag in `sportsdataverse-data`.
#' @param seasons A vector of 4-digit years associated with given WNBA seasons.
#'   (Min: 2002)
#' @return A `wehoop_data` tibble of cached team-crosswalk rows.
#' @export
#' @family WNBA Crosswalk Functions
#' @examples
#' \donttest{
#'   try(load_wnba_team_crosswalk(seasons = most_recent_wnba_season()))
#' }
load_wnba_team_crosswalk <- function(seasons = most_recent_wnba_season()) {
  if (isTRUE(seasons)) seasons <- 2002:most_recent_wnba_season()
  stopifnot(
    is.numeric(seasons),
    seasons >= 2002,
    seasons <= most_recent_wnba_season()
  )
  .load_wehoop_crosswalk(seasons, "wnba_crosswalk", "wnba_team_crosswalk")
}


#' **Load cached WNBA schedule crosswalk**
#' @name load_wnba_schedule_crosswalk
NULL
#' @title
#' **Load cached WNBA schedule crosswalk from the data repo**
#' @rdname load_wnba_schedule_crosswalk
#' @description Loads cached schedule-crosswalk snapshots that map ESPN game
#'   identifiers to WNBA Stats API game identifiers. One row per game-season.
#'   Backed by the `wnba_crosswalk` release tag in `sportsdataverse-data`.
#' @param seasons A vector of 4-digit years associated with given WNBA seasons.
#'   (Min: 2002)
#' @return A `wehoop_data` tibble of cached schedule-crosswalk rows.
#' @export
#' @family WNBA Crosswalk Functions
#' @examples
#' \donttest{
#'   try(load_wnba_schedule_crosswalk(seasons = most_recent_wnba_season()))
#' }
load_wnba_schedule_crosswalk <- function(seasons = most_recent_wnba_season()) {
  if (isTRUE(seasons)) seasons <- 2002:most_recent_wnba_season()
  stopifnot(
    is.numeric(seasons),
    seasons >= 2002,
    seasons <= most_recent_wnba_season()
  )
  .load_wehoop_crosswalk(seasons, "wnba_crosswalk", "wnba_schedule_crosswalk")
}


#' **Load cached WNBA player crosswalk**
#' @name load_wnba_player_crosswalk
NULL
#' @title
#' **Load cached WNBA player crosswalk from the data repo**
#' @rdname load_wnba_player_crosswalk
#' @description Loads cached player-crosswalk snapshots that map ESPN athlete
#'   identifiers to WNBA Stats API player identifiers. One row per
#'   athlete-season. Backed by the `wnba_crosswalk` release tag in
#'   `sportsdataverse-data`.
#' @param seasons A vector of 4-digit years associated with given WNBA seasons.
#'   (Min: 2002)
#' @return A `wehoop_data` tibble of cached player-crosswalk rows.
#' @export
#' @family WNBA Crosswalk Functions
#' @examples
#' \donttest{
#'   try(load_wnba_player_crosswalk(seasons = most_recent_wnba_season()))
#' }
load_wnba_player_crosswalk <- function(seasons = most_recent_wnba_season()) {
  if (isTRUE(seasons)) seasons <- 2002:most_recent_wnba_season()
  stopifnot(
    is.numeric(seasons),
    seasons >= 2002,
    seasons <= most_recent_wnba_season()
  )
  .load_wehoop_crosswalk(seasons, "wnba_crosswalk", "wnba_player_crosswalk")
}

# ---------------------------------------------------------------------------
# WBB loaders
# ---------------------------------------------------------------------------

#' **Load cached WBB team crosswalk**
#' @name load_wbb_team_crosswalk
NULL
#' @title
#' **Load cached WBB team crosswalk from the data repo**
#' @rdname load_wbb_team_crosswalk
#' @description Loads cached team-crosswalk snapshots that map ESPN team
#'   identifiers to Fox Sports and Bart Torvik team identifiers for Women's
#'   College Basketball. One row per team-season. Backed by the
#'   `wbb_crosswalk` release tag in `sportsdataverse-data`.
#' @param seasons A vector of 4-digit years associated with given WBB seasons.
#'   (Min: 2014)
#' @return A `wehoop_data` tibble of cached WBB team-crosswalk rows.
#' @export
#' @family WBB Crosswalk Functions
#' @examples
#' \donttest{
#'   try(load_wbb_team_crosswalk(seasons = most_recent_wbb_season()))
#' }
load_wbb_team_crosswalk <- function(seasons = most_recent_wbb_season()) {
  if (isTRUE(seasons)) seasons <- 2014:most_recent_wbb_season()
  stopifnot(
    is.numeric(seasons),
    seasons >= 2014,
    seasons <= most_recent_wbb_season()
  )
  .load_wehoop_crosswalk(seasons, "wbb_crosswalk", "wbb_team_crosswalk")
}


#' **Load cached WBB schedule crosswalk**
#' @name load_wbb_schedule_crosswalk
NULL
#' @title
#' **Load cached WBB schedule crosswalk from the data repo**
#' @rdname load_wbb_schedule_crosswalk
#' @description Loads cached schedule-crosswalk snapshots that map ESPN game
#'   identifiers to Bart Torvik game identifiers for Women's College
#'   Basketball. One row per game-season. Backed by the `wbb_crosswalk`
#'   release tag in `sportsdataverse-data`.
#' @param seasons A vector of 4-digit years associated with given WBB seasons.
#'   (Min: 2014)
#' @return A `wehoop_data` tibble of cached WBB schedule-crosswalk rows.
#' @export
#' @family WBB Crosswalk Functions
#' @examples
#' \donttest{
#'   try(load_wbb_schedule_crosswalk(seasons = most_recent_wbb_season()))
#' }
load_wbb_schedule_crosswalk <- function(seasons = most_recent_wbb_season()) {
  if (isTRUE(seasons)) seasons <- 2014:most_recent_wbb_season()
  stopifnot(
    is.numeric(seasons),
    seasons >= 2014,
    seasons <= most_recent_wbb_season()
  )
  .load_wehoop_crosswalk(seasons, "wbb_crosswalk", "wbb_schedule_crosswalk")
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
#' @param seasons A vector of 4-digit years associated with given WBB seasons.
#'   (Min: 2014)
#' @return A `wehoop_data` tibble of cached WBB player-crosswalk rows.
#' @export
#' @family WBB Crosswalk Functions
#' @examples
#' \donttest{
#'   try(load_wbb_player_crosswalk(seasons = most_recent_wbb_season()))
#' }
load_wbb_player_crosswalk <- function(seasons = most_recent_wbb_season()) {
  if (isTRUE(seasons)) seasons <- 2014:most_recent_wbb_season()
  stopifnot(
    is.numeric(seasons),
    seasons >= 2014,
    seasons <= most_recent_wbb_season()
  )
  .load_wehoop_crosswalk(seasons, "wbb_crosswalk", "wbb_player_crosswalk")
}
