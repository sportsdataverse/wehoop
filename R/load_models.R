# Model-dataset release loaders -- thin wrappers around parquet_from_url()
# (these release tags are parquet-only; no csv/rds siblings) mirroring the
# wnba_stats_* / ncaa_wbb_* loader shape. Backed by the sdv-py model programs
# described in CLAUDE.md (nba-possession-engine-program, mbb-wbb-player-value-spine).

#' **Load WNBA player-impact ratings (RAPM / SPM / BPM / DARKO) from the data repo**
#' @name load_wnba_player_impact
NULL
#' @title
#' **Load WNBA player-impact ratings (RAPM / SPM / BPM / DARKO) from the data repo**
#' @rdname load_wnba_player_impact
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
#'    |col_name               |types     |description                                               |
#'    |:---------------------|:--------|:--------------------------------------------------------|
#'    |player_id              |integer   |Unique WNBA Stats player identifier.                      |
#'    |player_name            |character |Player display name.                                      |
#'    |team_id                |integer   |Unique team identifier.                                   |
#'    |team_abbreviation      |character |Team abbreviation.                                        |
#'    |team_name              |character |Full team display name.                                   |
#'    |teams                  |character |Team abbreviation(s) the player appeared for this season. |
#'    |season                 |integer   |Season identifier (4-digit year).                         |
#'    |season_type            |character |Season portion (e.g. 'Regular Season').                   |
#'    |o_rapm                 |numeric   |Offensive regularized adjusted plus-minus.                |
#'    |d_rapm                 |numeric   |Defensive regularized adjusted plus-minus.                |
#'    |rapm                   |numeric   |Net regularized adjusted plus-minus (o_rapm + d_rapm).    |
#'    |off_poss               |integer   |Offensive possessions used in the RAPM fit.               |
#'    |def_poss               |integer   |Defensive possessions used in the RAPM fit.               |
#'    |o_adj_rapm             |numeric   |Offensive RAPM adjusted for minutes/possession stability. |
#'    |d_adj_rapm             |numeric   |Defensive RAPM adjusted for minutes/possession stability. |
#'    |adj_rapm               |numeric   |Net adjusted RAPM (o_adj_rapm + d_adj_rapm).              |
#'    |ospm                   |numeric   |Offensive statistical plus-minus (box-score component).   |
#'    |dspm                   |numeric   |Defensive statistical plus-minus (box-score component).   |
#'    |spm                    |numeric   |Net statistical plus-minus.                               |
#'    |min                    |numeric   |Minutes played.                                           |
#'    |gp                     |integer   |Games played.                                             |
#'    |obpm                   |numeric   |Offensive box plus-minus.                                 |
#'    |dbpm                   |numeric   |Defensive box plus-minus.                                 |
#'    |bpm                    |numeric   |Net box plus-minus.                                       |
#'    |war                    |numeric   |Wins above replacement.                                   |
#'    |darko_filtered_skill   |numeric   |DARKO-style filtered skill rating.                        |
#'    |darko_projected_rating |numeric   |DARKO-style forward-looking projected rating.             |
#'    |darko_projected_sd     |numeric   |Standard deviation of the DARKO-style projected rating.   |
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

  loader <- parquet_from_url
  if (!is.null(dbConnection) && !is.null(tablename)) in_db <- TRUE else in_db <- FALSE

  if (isTRUE(seasons)) seasons <- 1997:most_recent_wnba_stats_season()

  stopifnot(is.numeric(seasons),
            seasons >= 1997,
            seasons <= most_recent_wnba_stats_season())

  urls <- paste0(
    "https://github.com/sportsdataverse/sportsdataverse-data/releases/download/",
    "wnba_player_impact/wnba_player_impact_", seasons, ".parquet"
  )

  p <- NULL
  if (is_installed("progressr")) p <- progressr::progressor(along = seasons)

  out <- lapply(urls, progressively(loader, p))
  out <- data.table::rbindlist(out, use.names = TRUE, fill = TRUE)
  if (in_db) {
    DBI::dbWriteTable(dbConnection, tablename, out, append = TRUE)
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
#'    |col_name  |types     |description                                         |
#'    |:--------|:--------|:--------------------------------------------------|
#'    |player_id |character |stats.ncaa.org player identifier.                   |
#'    |player    |character |Player display name (title-cased).                  |
#'    |season    |integer   |Season identifier (4-digit season-ending year).     |
#'    |team_id   |character |Unique team identifier.                             |
#'    |min       |numeric   |Minutes played.                                     |
#'    |box_obpm  |numeric   |Box-score offensive box plus-minus.                 |
#'    |box_dbpm  |numeric   |Box-score defensive box plus-minus.                 |
#'    |box_bpm   |numeric   |Box-score net box plus-minus (box_obpm + box_dbpm). |
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
            seasons >= 2014,
            seasons <= most_recent_wbb_season())

  urls <- paste0(
    "https://github.com/sportsdataverse/sportsdataverse-data/releases/download/",
    "wbb_player_value/wbb_player_value_", seasons, ".parquet"
  )

  p <- NULL
  if (is_installed("progressr")) p <- progressr::progressor(along = seasons)

  out <- lapply(urls, progressively(loader, p))
  out <- data.table::rbindlist(out, use.names = TRUE, fill = TRUE)
  if (in_db) {
    DBI::dbWriteTable(dbConnection, tablename, out, append = TRUE)
    out <- NULL
  } else {
    class(out) <- c("wehoop_data","tbl_df","tbl","data.table","data.frame")
  }
  out
}


#' **Load NCAA women's college basketball adjusted efficiency team ratings from the data repo**
#' @name load_wbb_ratings
NULL
#' @title
#' **Load NCAA women's college basketball adjusted efficiency team ratings from the data repo**
#' @rdname load_wbb_ratings
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
#'    |col_name  |types     |description                                                                            |
#'    |:--------|:--------|:-------------------------------------------------------------------------------------|
#'    |season    |integer   |Season identifier (4-digit season-ending year).                                        |
#'    |team_id   |character |Unique team identifier.                                                                |
#'    |adj_o     |numeric   |Adjusted offensive efficiency (points per 100 possessions, opponent-adjusted).         |
#'    |adj_d     |numeric   |Adjusted defensive efficiency (points allowed per 100 possessions, opponent-adjusted). |
#'    |adj_em    |numeric   |Adjusted efficiency margin (adj_o minus adj_d).                                        |
#'    |adj_tempo |numeric   |Adjusted possessions per 40 minutes.                                                   |
#'    |raw_o     |numeric   |Unadjusted (raw) offensive efficiency.                                                 |
#'    |raw_d     |numeric   |Unadjusted (raw) defensive efficiency.                                                 |
#'    |games     |integer   |Games played (season total).                                                           |
#'    |rank      |integer   |National rank by adj_em.                                                               |
#'    |adj_em_z  |numeric   |Z-score of adj_em relative to the season's team distribution.                          |
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
            seasons >= 2008,
            seasons <= most_recent_wbb_season())

  urls <- paste0(
    "https://github.com/sportsdataverse/sportsdataverse-data/releases/download/",
    "wbb_ratings/wbb_ratings_", seasons, ".parquet"
  )

  p <- NULL
  if (is_installed("progressr")) p <- progressr::progressor(along = seasons)

  out <- lapply(urls, progressively(loader, p))
  out <- data.table::rbindlist(out, use.names = TRUE, fill = TRUE)
  if (in_db) {
    DBI::dbWriteTable(dbConnection, tablename, out, append = TRUE)
    out <- NULL
  } else {
    class(out) <- c("wehoop_data","tbl_df","tbl","data.table","data.frame")
  }
  out
}

