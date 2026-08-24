# Model-dataset release loaders, mirroring the wnba_stats_* / ncaa_wbb_*
# loader shape. Backed by the sdv-py model programs described in CLAUDE.md
# (nba-possession-engine-program, mbb-wbb-player-value-spine).
# wnba_player_impact ships csv/parquet/rds -- rds_from_url() is used to match
# the WNBA loader family convention. wbb_player_value / wbb_ratings are
# parquet-only (no csv/rds siblings), so those two use parquet_from_url().

#' @title
#' **Load WNBA player-impact ratings (RAPM / SPM / BPM / DARKO) from the data repo**
#' @rdname load_wbb_player_value
#' @author Saiem Gilani
#' @description Loads season-level WNBA player-impact ratings -- one row per
#'   player-team-season, combining regularized adjusted plus-minus (RAPM),
#'   statistical plus-minus (SPM), box plus-minus (BPM), wins above
#'   replacement (WAR), and a DARKO-style skill/projection pair. Produced by
#'   the sdv-py NBA/WNBA possession-engine model program; published to the
#'   `wnba_player_impact` release tag as csv/parquet/rds.
#' @param seasons A vector of 4-digit years associated with given WNBA
#'   seasons. Published coverage runs 1997 through the most recent season,
#'   with no gaps. Pass `seasons = TRUE` for every published season. (Min:
#'   1997)
#' @param ... Additional arguments passed to an underlying function that writes
#'   the season data into a database.
#' @param dbConnection A `DBIConnection` object, as returned by [DBI::dbConnect()]
#' @param tablename The name of the data table within the database
#' @return Returns a `wehoop_data` tibble with one row per player-team-season.
#'
#'    \if{html}{\tabular{lll}{
#'       col_name \tab types \tab description \cr
#'       player_id \tab integer \tab Unique WNBA Stats player identifier. \cr
#'       player_name \tab character \tab Player display name. \cr
#'       team_id \tab integer \tab Unique team identifier. \cr
#'       team_abbreviation \tab character \tab Team abbreviation. \cr
#'       team_name \tab character \tab Full team display name. \cr
#'       teams \tab character \tab Team abbreviation(s) the player appeared for this season. \cr
#'       season \tab integer \tab Season identifier (4-digit year). \cr
#'       season_type \tab character \tab Season portion (e.g. 'Regular Season'). \cr
#'       o_rapm \tab numeric \tab Offensive regularized adjusted plus-minus. \cr
#'       d_rapm \tab numeric \tab Defensive regularized adjusted plus-minus. \cr
#'       rapm \tab numeric \tab Net regularized adjusted plus-minus (o_rapm + d_rapm). \cr
#'       off_poss \tab integer \tab Offensive possessions used in the RAPM fit. \cr
#'       def_poss \tab integer \tab Defensive possessions used in the RAPM fit. \cr
#'       o_adj_rapm \tab numeric \tab Offensive RAPM adjusted for minutes/possession stability. \cr
#'       d_adj_rapm \tab numeric \tab Defensive RAPM adjusted for minutes/possession stability. \cr
#'       adj_rapm \tab numeric \tab Net adjusted RAPM (o_adj_rapm + d_adj_rapm). \cr
#'       ospm \tab numeric \tab Offensive statistical plus-minus (box-score component). \cr
#'       dspm \tab numeric \tab Defensive statistical plus-minus (box-score component). \cr
#'       spm \tab numeric \tab Net statistical plus-minus. \cr
#'       min \tab numeric \tab Minutes played. \cr
#'       gp \tab integer \tab Games played. \cr
#'       obpm \tab numeric \tab Offensive box plus-minus. \cr
#'       dbpm \tab numeric \tab Defensive box plus-minus. \cr
#'       bpm \tab numeric \tab Net box plus-minus. \cr
#'       war \tab numeric \tab Wins above replacement. \cr
#'       darko_filtered_skill \tab numeric \tab DARKO-style filtered skill rating. \cr
#'       darko_projected_rating \tab numeric \tab DARKO-style forward-looking projected rating. \cr
#'       darko_projected_sd \tab numeric \tab Standard deviation of the DARKO-style projected rating. \cr
#'    }}
#'    \if{latex}{See the HTML help or pkgdown reference for the column table.}
#'
#' @export
#' @family Model Dataset loader functions
#' @examples
#' \donttest{
#'   try(load_wnba_player_impact(seasons = most_recent_wnba_stats_season()))
#' }
load_wnba_player_impact <- function(seasons = most_recent_wnba_stats_season(),
                            ...,
                            dbConnection = NULL, tablename = NULL) {
  old <- options(list(stringsAsFactors = FALSE, scipen = 999))
  on.exit(options(old))
  dots <- rlang::dots_list(...)

  loader <- rds_from_url
  if (!is.null(dbConnection) && !is.null(tablename)) in_db <- TRUE else in_db <- FALSE

  if (isTRUE(seasons)) seasons <- 1997:most_recent_wnba_stats_season()

  stopifnot(is.numeric(seasons),
            all(seasons >= 1997),
            all(seasons <= most_recent_wnba_stats_season()))

  urls <- paste0(
    "https://github.com/sportsdataverse/sportsdataverse-data/releases/download/",
    "wnba_player_impact/wnba_player_impact_", seasons, ".rds"
  )

  p <- NULL
  if (is_installed("progressr")) p <- progressr::progressor(along = seasons)

  out <- lapply(urls, progressively(loader, p))
  out <- data.table::rbindlist(out, use.names = TRUE, fill = TRUE)
  if (in_db) {
    DBI::dbWriteTable(dbConnection, tablename, out, append = TRUE, ...)
    out <- NULL
  } else {
    class(out) <- c("wehoop_data","tbl_df","tbl","data.table","data.frame")
  }
  out
}


#' **Load NCAA women's college basketball player-value ratings (box BPM) from the data repo**
#' @name load_wbb_player_value
NULL
#' @title
#' **Load NCAA women's college basketball player-value ratings (box BPM) from the data repo**
#' @rdname load_wbb_player_value
#' @author Saiem Gilani
#' @description Loads season-level NCAA women's college basketball
#'   player-value ratings -- one row per player-team-season, with a
#'   box-score-derived offensive/defensive/net box plus-minus (BPM). Coverage
#'   starts at 2014 (the earliest season with published box-score inputs of
#'   sufficient quality for the model); this tag is parquet-only, with no
#'   csv/rds sibling assets. Produced by the sdv-py NCAA WBB model program;
#'   published to the `wbb_player_value` release tag.
#' @param seasons A vector of 4-digit season-ending years for NCAA women's
#'   college basketball. Published coverage runs 2014 through the most recent
#'   season, with no gaps. Pass `seasons = TRUE` for every published season.
#'   (Min: 2014)
#' @param ... Additional arguments passed to an underlying function that writes
#'   the season data into a database.
#' @param dbConnection A `DBIConnection` object, as returned by [DBI::dbConnect()]
#' @param tablename The name of the data table within the database
#' @return Returns a `wehoop_data` tibble with one row per player-team-season.
#'
#'    \if{html}{\tabular{lll}{
#'       col_name \tab types \tab description \cr
#'       player_id \tab character \tab stats.ncaa.org player identifier. \cr
#'       player \tab character \tab Player display name (title-cased). \cr
#'       season \tab integer \tab Season identifier (4-digit season-ending year). \cr
#'       team_id \tab character \tab Unique team identifier. \cr
#'       min \tab numeric \tab Minutes played. \cr
#'       box_obpm \tab numeric \tab Box-score offensive box plus-minus. \cr
#'       box_dbpm \tab numeric \tab Box-score defensive box plus-minus. \cr
#'       box_bpm \tab numeric \tab Box-score net box plus-minus (box_obpm + box_dbpm). \cr
#'    }}
#'    \if{latex}{See the HTML help or pkgdown reference for the column table.}
#'
#' @export
#' @family Model Dataset loader functions
#' @examples
#' \donttest{
#'   try(load_wbb_player_value(seasons = most_recent_wbb_season()))
#' }
load_wbb_player_value <- function(seasons = most_recent_wbb_season(),
                            ...,
                            dbConnection = NULL, tablename = NULL) {
  old <- options(list(stringsAsFactors = FALSE, scipen = 999))
  on.exit(options(old))
  dots <- rlang::dots_list(...)

  loader <- parquet_from_url
  if (!is.null(dbConnection) && !is.null(tablename)) in_db <- TRUE else in_db <- FALSE

  if (isTRUE(seasons)) seasons <- 2014:most_recent_wbb_season()

  stopifnot(is.numeric(seasons),
            all(seasons >= 2014),
            all(seasons <= most_recent_wbb_season()))

  urls <- paste0(
    "https://github.com/sportsdataverse/sportsdataverse-data/releases/download/",
    "wbb_player_value/wbb_player_value_", seasons, ".parquet"
  )

  p <- NULL
  if (is_installed("progressr")) p <- progressr::progressor(along = seasons)

  out <- lapply(urls, progressively(loader, p))
  out <- data.table::rbindlist(out, use.names = TRUE, fill = TRUE)
  if (in_db) {
    DBI::dbWriteTable(dbConnection, tablename, out, append = TRUE, ...)
    out <- NULL
  } else {
    class(out) <- c("wehoop_data","tbl_df","tbl","data.table","data.frame")
  }
  out
}


#' @title
#' **Load NCAA women's college basketball adjusted efficiency team ratings from the data repo**
#' @rdname load_wbb_player_value
#' @author Saiem Gilani
#' @description Loads season-level NCAA women's college basketball team
#'   ratings -- one row per team-season, with adjusted
#'   (opponent-strength-normalized) offensive/defensive efficiency, adjusted
#'   tempo, raw efficiency, and a national rank. A KenPom-style
#'   adjusted-efficiency-margin rating. This tag is parquet-only, with no
#'   csv/rds sibling assets. Produced by the sdv-py NCAA WBB model program;
#'   published to the `wbb_ratings` release tag.
#' @param seasons A vector of 4-digit season-ending years for NCAA women's
#'   college basketball. Published coverage runs 2008 through the most recent
#'   season, with no gaps. Pass `seasons = TRUE` for every published season.
#'   (Min: 2008)
#' @param ... Additional arguments passed to an underlying function that writes
#'   the season data into a database.
#' @param dbConnection A `DBIConnection` object, as returned by [DBI::dbConnect()]
#' @param tablename The name of the data table within the database
#' @return Returns a `wehoop_data` tibble with one row per team-season.
#'
#'    \if{html}{\tabular{lll}{
#'       col_name \tab types \tab description \cr
#'       season \tab integer \tab Season identifier (4-digit season-ending year). \cr
#'       team_id \tab character \tab Unique team identifier. \cr
#'       adj_o \tab numeric \tab Adjusted offensive efficiency (points per 100 possessions, opponent-adjusted). \cr
#'       adj_d \tab numeric \tab Adjusted defensive efficiency (points allowed per 100 possessions, opponent-adjusted). \cr
#'       adj_em \tab numeric \tab Adjusted efficiency margin (adj_o minus adj_d). \cr
#'       adj_tempo \tab numeric \tab Adjusted possessions per 40 minutes. \cr
#'       raw_o \tab numeric \tab Unadjusted (raw) offensive efficiency. \cr
#'       raw_d \tab numeric \tab Unadjusted (raw) defensive efficiency. \cr
#'       games \tab integer \tab Games played (season total). \cr
#'       rank \tab integer \tab National rank by adj_em. \cr
#'       adj_em_z \tab numeric \tab Z-score of adj_em relative to the season's team distribution. \cr
#'    }}
#'    \if{latex}{See the HTML help or pkgdown reference for the column table.}
#'
#' @export
#' @family Model Dataset loader functions
#' @examples
#' \donttest{
#'   try(load_wbb_ratings(seasons = most_recent_wbb_season()))
#' }
load_wbb_ratings <- function(seasons = most_recent_wbb_season(),
                            ...,
                            dbConnection = NULL, tablename = NULL) {
  old <- options(list(stringsAsFactors = FALSE, scipen = 999))
  on.exit(options(old))
  dots <- rlang::dots_list(...)

  loader <- parquet_from_url
  if (!is.null(dbConnection) && !is.null(tablename)) in_db <- TRUE else in_db <- FALSE

  if (isTRUE(seasons)) seasons <- 2008:most_recent_wbb_season()

  stopifnot(is.numeric(seasons),
            all(seasons >= 2008),
            all(seasons <= most_recent_wbb_season()))

  urls <- paste0(
    "https://github.com/sportsdataverse/sportsdataverse-data/releases/download/",
    "wbb_ratings/wbb_ratings_", seasons, ".parquet"
  )

  p <- NULL
  if (is_installed("progressr")) p <- progressr::progressor(along = seasons)

  out <- lapply(urls, progressively(loader, p))
  out <- data.table::rbindlist(out, use.names = TRUE, fill = TRUE)
  if (in_db) {
    DBI::dbWriteTable(dbConnection, tablename, out, append = TRUE, ...)
    out <- NULL
  } else {
    class(out) <- c("wehoop_data","tbl_df","tbl","data.table","data.frame")
  }
  out
}

