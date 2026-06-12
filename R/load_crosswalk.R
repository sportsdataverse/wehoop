# load_crosswalk.R -- cached-snapshot loaders for the WNBA crosswalks.
# Reuse the rds_from_url + progressively + rbindlist plumbing used by the
# other load_wnba_* functions. No join logic lives here.

.load_wnba_crosswalk <- function(seasons, tag, prefix) {
  old <- options(list(stringsAsFactors = FALSE, scipen = 999))
  on.exit(options(old))

  loader <- rds_from_url

  if (isTRUE(seasons)) seasons <- 2002:most_recent_wnba_season()

  stopifnot(
    is.numeric(seasons),
    seasons >= 2002,
    seasons <= most_recent_wnba_season()
  )

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
  .load_wnba_crosswalk(seasons, "wnba_crosswalk", "wnba_team_crosswalk")
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
  .load_wnba_crosswalk(seasons, "wnba_crosswalk", "wnba_schedule_crosswalk")
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
  .load_wnba_crosswalk(seasons, "wnba_crosswalk", "wnba_player_crosswalk")
}
