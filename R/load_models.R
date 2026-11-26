# Model-dataset release loaders, mirroring the wnba_stats_* / ncaa_wbb_*
# loader shape. Backed by the sportsdataverse-py model programs (possession
# engine, player value).
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
#'   the sportsdataverse-py NBA/WNBA possession-engine model program; published to the
#'   `wnba_player_impact` release tag as csv/parquet/rds.
#' @param seasons A vector of 4-digit seasons, or `TRUE` for every published
#'   season: 1997 onward for `load_wnba_player_impact()` (WNBA seasons), 2014
#'   onward for `load_wbb_player_value()` and 2009 onward for `load_wbb_ratings()`
#'   (NCAA women's season-ending years, e.g. `2024` for 2023-24), with no gaps.
#'   The upper bound is [most_recent_wnba_stats_season()] /
#'   [most_recent_wbb_season()].
#'   When `seasons` is left at its default and that season's
#'   file is not published yet, the loader reads the newest published season
#'   instead, with a message. An explicit request for an unpublished season
#'   is kept as asked: the read warns and returns an empty frame.
#' @param ... Additional arguments passed to an underlying function that writes
#'   the season data into a database.
#' @param dbConnection A `DBIConnection` object, as returned by [DBI::dbConnect()]
#' @param tablename The name of the data table within the database
#' @return Returns a `wehoop_data` tibble with one row per player-team-season.
#'   Each of the 16 ratings gets an `_n` (sample size), `_rank` and `_pct`
#'   column, computed within each season and season type. The sample gates
#'   are regular-season sized, so most playoff ranks are null.
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
#'       boban_filtered_skill \tab numeric \tab DARKO-style filtered skill rating. \cr
#'       boban_projected_rating \tab numeric \tab DARKO-style forward-looking projected rating. \cr
#'       boban_projected_sd \tab numeric \tab Standard deviation of the DARKO-style projected rating. \cr
#'       o_rapm_n \tab integer \tab Possessions o_rapm is measured over (off_poss). Its rank and percentile are set only when it reaches 610, the WNBA sample at which an offensive on-court rating is half signal. \cr
#'       d_rapm_n \tab integer \tab Possessions d_rapm is measured over (def_poss). Its rank and percentile are set only when it reaches 1,200, the WNBA sample at which a defensive on-court rating is half signal. \cr
#'       rapm_n \tab integer \tab Possessions rapm is measured over (off_poss + def_poss). Its rank and percentile are set only when it reaches 1,600, the WNBA sample at which a net on-court rating is half signal. \cr
#'       o_adj_rapm_n \tab integer \tab Possessions o_adj_rapm is measured over (off_poss). Its rank and percentile are set only when it reaches 610, the WNBA sample at which an offensive on-court rating is half signal. \cr
#'       d_adj_rapm_n \tab integer \tab Possessions d_adj_rapm is measured over (def_poss). Its rank and percentile are set only when it reaches 1,200, the WNBA sample at which a defensive on-court rating is half signal. \cr
#'       adj_rapm_n \tab integer \tab Possessions adj_rapm is measured over (off_poss + def_poss). Its rank and percentile are set only when it reaches 1,600, the WNBA sample at which a net on-court rating is half signal. \cr
#'       ospm_n \tab integer \tab Possessions ospm is measured over (off_poss). Its rank and percentile are set only when it reaches 610, the WNBA sample at which an offensive on-court rating is half signal. \cr
#'       dspm_n \tab integer \tab Possessions dspm is measured over (def_poss). Its rank and percentile are set only when it reaches 1,200, the WNBA sample at which a defensive on-court rating is half signal. \cr
#'       spm_n \tab integer \tab Possessions spm is measured over (off_poss + def_poss). Its rank and percentile are set only when it reaches 1,600, the WNBA sample at which a net on-court rating is half signal. \cr
#'       obpm_n \tab integer \tab Possessions obpm is measured over (off_poss). Its rank and percentile are set only when it reaches 610, the WNBA sample at which an offensive on-court rating is half signal. \cr
#'       dbpm_n \tab integer \tab Possessions dbpm is measured over (def_poss). Its rank and percentile are set only when it reaches 1,200, the WNBA sample at which a defensive on-court rating is half signal. \cr
#'       bpm_n \tab integer \tab Possessions bpm is measured over (off_poss + def_poss). Its rank and percentile are set only when it reaches 1,600, the WNBA sample at which a net on-court rating is half signal. \cr
#'       war_n \tab integer \tab Possessions behind war (off_poss + def_poss). war is a count, not a rate, so its rank has no sample gate. \cr
#'       boban_filtered_skill_n \tab integer \tab Possessions behind boban_filtered_skill (off_poss + def_poss this season). A multi-season estimate takes the net gate: its rank and percentile are set only when it reaches 1,600. \cr
#'       boban_projected_rating_n \tab integer \tab Possessions behind boban_projected_rating (off_poss + def_poss this season). A multi-season estimate takes the net gate: its rank and percentile are set only when it reaches 1,600. \cr
#'       boban_projected_sd_n \tab integer \tab Possessions behind boban_projected_sd (off_poss + def_poss this season). A multi-season estimate takes the net gate: its rank and percentile are set only when it reaches 1,600. \cr
#'       o_rapm_rank \tab numeric \tab Rank of o_rapm within the season and season type, 1 = best, ties averaged. Null when o_rapm_n is under 610 or fewer than 10 players are ranked. \cr
#'       d_rapm_rank \tab numeric \tab Rank of d_rapm within the season and season type, 1 = best, ties averaged. Null when d_rapm_n is under 1,200 or fewer than 10 players are ranked. \cr
#'       rapm_rank \tab numeric \tab Rank of rapm within the season and season type, 1 = best, ties averaged. Null when rapm_n is under 1,600 or fewer than 10 players are ranked. \cr
#'       o_adj_rapm_rank \tab numeric \tab Rank of o_adj_rapm within the season and season type, 1 = best, ties averaged. Null when o_adj_rapm_n is under 610 or fewer than 10 players are ranked. \cr
#'       d_adj_rapm_rank \tab numeric \tab Rank of d_adj_rapm within the season and season type, 1 = best, ties averaged. Null when d_adj_rapm_n is under 1,200 or fewer than 10 players are ranked. \cr
#'       adj_rapm_rank \tab numeric \tab Rank of adj_rapm within the season and season type, 1 = best, ties averaged. Null when adj_rapm_n is under 1,600 or fewer than 10 players are ranked. \cr
#'       ospm_rank \tab numeric \tab Rank of ospm within the season and season type, 1 = best, ties averaged. Null when ospm_n is under 610 or fewer than 10 players are ranked. \cr
#'       dspm_rank \tab numeric \tab Rank of dspm within the season and season type, 1 = best, ties averaged. Null when dspm_n is under 1,200 or fewer than 10 players are ranked. \cr
#'       spm_rank \tab numeric \tab Rank of spm within the season and season type, 1 = best, ties averaged. Null when spm_n is under 1,600 or fewer than 10 players are ranked. \cr
#'       obpm_rank \tab numeric \tab Rank of obpm within the season and season type, 1 = best, ties averaged. Null when obpm_n is under 610 or fewer than 10 players are ranked. \cr
#'       dbpm_rank \tab numeric \tab Rank of dbpm within the season and season type, 1 = best, ties averaged. Null when dbpm_n is under 1,200 or fewer than 10 players are ranked. \cr
#'       bpm_rank \tab numeric \tab Rank of bpm within the season and season type, 1 = best, ties averaged. Null when bpm_n is under 1,600 or fewer than 10 players are ranked. \cr
#'       war_rank \tab numeric \tab Rank of war within the season and season type, 1 = best, ties averaged. Ungated; null when fewer than 10 players are ranked. \cr
#'       boban_filtered_skill_rank \tab numeric \tab Rank of boban_filtered_skill within the season and season type, 1 = best, ties averaged. Null when boban_filtered_skill_n is under 1,600 or fewer than 10 players are ranked. \cr
#'       boban_projected_rating_rank \tab numeric \tab Rank of boban_projected_rating within the season and season type, 1 = best, ties averaged. Null when boban_projected_rating_n is under 1,600 or fewer than 10 players are ranked. \cr
#'       boban_projected_sd_rank \tab numeric \tab Rank of boban_projected_sd within the season and season type, ascending: 1 = the smallest sd (the most certain projection), ties averaged. Null when boban_projected_sd_n is under 1,600 or fewer than 10 players are ranked. \cr
#'       o_rapm_pct \tab numeric \tab Percentile of o_rapm_rank, 100 x (n + 1 - rank) / (n + 1) over the n ranked players; null where the rank is. \cr
#'       d_rapm_pct \tab numeric \tab Percentile of d_rapm_rank, 100 x (n + 1 - rank) / (n + 1) over the n ranked players; null where the rank is. \cr
#'       rapm_pct \tab numeric \tab Percentile of rapm_rank, 100 x (n + 1 - rank) / (n + 1) over the n ranked players; null where the rank is. \cr
#'       o_adj_rapm_pct \tab numeric \tab Percentile of o_adj_rapm_rank, 100 x (n + 1 - rank) / (n + 1) over the n ranked players; null where the rank is. \cr
#'       d_adj_rapm_pct \tab numeric \tab Percentile of d_adj_rapm_rank, 100 x (n + 1 - rank) / (n + 1) over the n ranked players; null where the rank is. \cr
#'       adj_rapm_pct \tab numeric \tab Percentile of adj_rapm_rank, 100 x (n + 1 - rank) / (n + 1) over the n ranked players; null where the rank is. \cr
#'       ospm_pct \tab numeric \tab Percentile of ospm_rank, 100 x (n + 1 - rank) / (n + 1) over the n ranked players; null where the rank is. \cr
#'       dspm_pct \tab numeric \tab Percentile of dspm_rank, 100 x (n + 1 - rank) / (n + 1) over the n ranked players; null where the rank is. \cr
#'       spm_pct \tab numeric \tab Percentile of spm_rank, 100 x (n + 1 - rank) / (n + 1) over the n ranked players; null where the rank is. \cr
#'       obpm_pct \tab numeric \tab Percentile of obpm_rank, 100 x (n + 1 - rank) / (n + 1) over the n ranked players; null where the rank is. \cr
#'       dbpm_pct \tab numeric \tab Percentile of dbpm_rank, 100 x (n + 1 - rank) / (n + 1) over the n ranked players; null where the rank is. \cr
#'       bpm_pct \tab numeric \tab Percentile of bpm_rank, 100 x (n + 1 - rank) / (n + 1) over the n ranked players; null where the rank is. \cr
#'       war_pct \tab numeric \tab Percentile of war_rank, 100 x (n + 1 - rank) / (n + 1) over the n ranked players; null where the rank is. \cr
#'       boban_filtered_skill_pct \tab numeric \tab Percentile of boban_filtered_skill_rank, 100 x (n + 1 - rank) / (n + 1) over the n ranked players; null where the rank is. \cr
#'       boban_projected_rating_pct \tab numeric \tab Percentile of boban_projected_rating_rank, 100 x (n + 1 - rank) / (n + 1) over the n ranked players; null where the rank is. \cr
#'       boban_projected_sd_pct \tab numeric \tab Percentile of boban_projected_sd_rank, 100 x (n + 1 - rank) / (n + 1) over the n ranked players: high means a more certain projection. Null where the rank is. \cr
#'    }}
#'    \if{latex}{See the HTML help or pkgdown reference for the column table.}
#'
#' @source <https://github.com/sportsdataverse/sportsdataverse-data/releases/tag/wnba_player_impact>
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

  url_for <- function(seasons) paste0(
    "https://github.com/sportsdataverse/sportsdataverse-data/releases/download/",
    "wnba_player_impact/wnba_player_impact_", seasons, ".rds"
  )
  seasons <- .loader_seasons(seasons, 1997, most_recent_wnba_stats_season(),
                             fn = "load_wnba_player_impact", url_for = url_for,
                             default = missing(seasons))

  urls <- url_for(seasons)

  p <- NULL
  if (is_installed("progressr")) p <- progressr::progressor(along = seasons)

  out <- lapply(urls, progressively(loader, p))
  out <- data.table::rbindlist(out, use.names = TRUE, fill = TRUE)
  if (in_db) {
    DBI::dbWriteTable(dbConnection, tablename, out, append = TRUE, ...)
    out <- NULL
  } else {
    class(out) <- c("wehoop_data","tbl_df","tbl","data.frame")
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
#'   csv/rds sibling assets. Produced by the sportsdataverse-py NCAA WBB model program;
#'   published to the `wbb_player_value` release tag.
#' @param ... Additional arguments passed to an underlying function that writes
#'   the season data into a database.
#' @param dbConnection A `DBIConnection` object, as returned by [DBI::dbConnect()]
#' @param tablename The name of the data table within the database
#' @return Returns a `wehoop_data` tibble with one row per player-team-season.
#'
#'    \if{html}{\tabular{lll}{
#'       col_name \tab types \tab description \cr
#'       player_id \tab character \tab ESPN athlete identifier (the box score's athlete_id, as a string). \cr
#'       player \tab character \tab Player display name (title-cased). \cr
#'       season \tab integer \tab Season identifier (4-digit season-ending year). \cr
#'       team_id \tab character \tab Unique team identifier. \cr
#'       min \tab numeric \tab Minutes played. \cr
#'       box_obpm \tab numeric \tab Box-score offensive box plus-minus. \cr
#'       box_dbpm \tab numeric \tab Box-score defensive box plus-minus. \cr
#'       box_bpm \tab numeric \tab Box-score net box plus-minus (box_obpm + box_dbpm). \cr
#'       qualified \tab logical \tab TRUE when min is at least 300, the floor where the spread of box_bpm reaches its high-minute plateau. An additive flag: no row is dropped. \cr
#'    }}
#'    \if{latex}{See the HTML help or pkgdown reference for the column table.}
#'
#' @source <https://github.com/sportsdataverse/sportsdataverse-data/releases/tag/wbb_player_value>
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

  url_for <- function(seasons) paste0(
    "https://github.com/sportsdataverse/sportsdataverse-data/releases/download/",
    "wbb_player_value/wbb_player_value_", seasons, ".parquet"
  )
  seasons <- .loader_seasons(seasons, 2014, most_recent_wbb_season(),
                             fn = "load_wbb_player_value", url_for = url_for,
                             default = missing(seasons))

  urls <- url_for(seasons)

  p <- NULL
  if (is_installed("progressr")) p <- progressr::progressor(along = seasons)

  out <- lapply(urls, progressively(loader, p))
  out <- data.table::rbindlist(out, use.names = TRUE, fill = TRUE)
  if (in_db) {
    DBI::dbWriteTable(dbConnection, tablename, out, append = TRUE, ...)
    out <- NULL
  } else {
    class(out) <- c("wehoop_data","tbl_df","tbl","data.frame")
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
#'   tempo, raw efficiency, and a national rank, solved as an iterative fixed
#'   point. This tag is parquet-only, with no
#'   csv/rds sibling assets. Produced by the sportsdataverse-py NCAA WBB model program;
#'   published to the `wbb_ratings` release tag.
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
#'       adj_o_blend \tab numeric \tab Adjusted offensive efficiency with the preseason prior blended in: the same fixed point as adj_o, with each Division I team shrunk toward last season's regressed rating as if it had played prior_games extra games at it. A team new to Division I (or with no rated game last season) is shrunk toward the 23rd percentile of last season's Division I adj_em instead. \cr
#'       adj_d_blend \tab numeric \tab Adjusted defensive efficiency with the preseason prior blended in, on the same basis as adj_o_blend (lower is better). \cr
#'       adj_em_blend \tab numeric \tab adj_o_blend minus adj_d_blend. A team with g games is rated about g / (g + prior_games) on this season. \cr
#'       rank_blend \tab integer \tab National rank by adj_em_blend (dense, 1 = best). \cr
#'       prior_games \tab numeric \tab Weight of the preseason prior, in games (3 for women's). 0 when the previous season is not released; the blend then equals the unblended rating. \cr
#'    }}
#'    \if{latex}{See the HTML help or pkgdown reference for the column table.}
#'
#' @source <https://github.com/sportsdataverse/sportsdataverse-data/releases/tag/wbb_ratings>
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

  url_for <- function(seasons) paste0(
    "https://github.com/sportsdataverse/sportsdataverse-data/releases/download/",
    "wbb_ratings/wbb_ratings_", seasons, ".parquet"
  )
  seasons <- .loader_seasons(seasons, 2009, most_recent_wbb_season(),
                             fn = "load_wbb_ratings", url_for = url_for,
                             default = missing(seasons))

  urls <- url_for(seasons)

  p <- NULL
  if (is_installed("progressr")) p <- progressr::progressor(along = seasons)

  out <- lapply(urls, progressively(loader, p))
  out <- data.table::rbindlist(out, use.names = TRUE, fill = TRUE)
  if (in_db) {
    DBI::dbWriteTable(dbConnection, tablename, out, append = TRUE, ...)
    out <- NULL
  } else {
    class(out) <- c("wehoop_data","tbl_df","tbl","data.frame")
  }
  out
}

