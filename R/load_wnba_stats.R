#' @title
#' **Load cleaned WNBA Stats API season rosters from the data repo**
#' @rdname load_wnba_stats_coaches
#' @description Loads season-level WNBA team rosters scraped from the WNBA
#'   Stats API. One row per athlete-team-season triple. Backed by the
#'   `wehoop-wnba-stats-data` pipeline that reads raw JSONs from
#'   `wehoop-wnba-stats-raw` and publishes parquet/rds artifacts to the
#'   `wnba_stats_rosters` release tag.
#' @param seasons A vector of 4-digit years associated with given WNBA seasons.
#'   Published coverage runs 1997 through the most recent season, with no
#'   gaps. Pass `seasons = TRUE` for every published season. (Min: 1997)
#' @param ... Additional arguments passed to an underlying function that writes
#'   the season data into a database.
#' @param dbConnection A `DBIConnection` object, as returned by [DBI::dbConnect()]
#' @param tablename The name of the rosters data table within the database
#' @return Returns a `wehoop_data` tibble with one row per athlete-team-season.
#' @export
#' @family WNBA Stats loader functions
#' @examples
#' \donttest{
#'   try(load_wnba_stats_rosters(seasons = most_recent_wnba_stats_season()))
#' }
load_wnba_stats_rosters <- function(seasons = most_recent_wnba_stats_season(),
                                    ...,
                                    dbConnection = NULL, tablename = NULL) {
  old <- options(list(stringsAsFactors = FALSE, scipen = 999))
  on.exit(options(old))
  dots <- rlang::dots_list(...)

  loader <- rds_from_url
  if (!is.null(dbConnection) && !is.null(tablename)) in_db <- TRUE else in_db <- FALSE

  if (isTRUE(seasons)) seasons <- 1997:most_recent_wnba_stats_season()

  stopifnot(is.numeric(seasons),
            seasons >= 1997,
            seasons <= most_recent_wnba_stats_season())

  urls <- paste0(
    "https://github.com/sportsdataverse/sportsdataverse-data/releases/download/",
    "wnba_stats_rosters/rosters_", seasons, ".rds"
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


#' **Load wehoop WNBA Stats Coaches**
#' @name load_wnba_stats_coaches
NULL
#' @title
#' **Load cleaned WNBA Stats API season coaches from the data repo**
#' @rdname load_wnba_stats_coaches
#' @description Loads season-level WNBA coaching staff data scraped from the
#'   WNBA Stats API. One row per coach-team-season triple. Backed by the
#'   `wehoop-wnba-stats-data` pipeline that reads raw JSONs from
#'   `wehoop-wnba-stats-raw` and publishes parquet/rds artifacts to the
#'   `wnba_stats_coaches` release tag.
#' @param seasons A vector of 4-digit years associated with given WNBA seasons.
#'   Published coverage runs 1997 through the most recent season with one
#'   gap: **2019 is absent upstream** -- `commonteamroster` returns no
#'   coaching staff for that season (confirmed by positive controls on 2018
#'   and 2020), so no 2019 asset is published. Requesting 2019 emits a
#'   download warning and contributes no rows. Historical seasons also lack
#'   the `sub_sort_sequence` column added in 2026. Pass `seasons = TRUE` for
#'   every published season. (Min: 1997)
#' @param ... Additional arguments passed to an underlying function that writes
#'   the season data into a database.
#' @param dbConnection A `DBIConnection` object, as returned by [DBI::dbConnect()]
#' @param tablename The name of the coaches data table within the database
#' @return Returns a `wehoop_data` tibble with one row per coach-team-season.
#' @export
#' @family WNBA Stats loader functions
#' @examples
#' \donttest{
#'   try(load_wnba_stats_coaches(seasons = most_recent_wnba_stats_season()))
#' }
load_wnba_stats_coaches <- function(seasons = most_recent_wnba_stats_season(),
                                    ...,
                                    dbConnection = NULL, tablename = NULL) {
  old <- options(list(stringsAsFactors = FALSE, scipen = 999))
  on.exit(options(old))
  dots <- rlang::dots_list(...)

  loader <- rds_from_url
  if (!is.null(dbConnection) && !is.null(tablename)) in_db <- TRUE else in_db <- FALSE

  if (isTRUE(seasons)) seasons <- 1997:most_recent_wnba_stats_season()

  stopifnot(is.numeric(seasons),
            seasons >= 1997,
            seasons <= most_recent_wnba_stats_season())

  urls <- paste0(
    "https://github.com/sportsdataverse/sportsdataverse-data/releases/download/",
    "wnba_stats_coaches/coaches_", seasons, ".rds"
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
#' **Load cleaned WNBA Stats API player season stats from the data repo**
#' @rdname load_wnba_stats_coaches
#' @description `r lifecycle::badge("deprecated")` Loads season-level WNBA
#'   player statistics. **Deprecated**: the `wnba_stats_player_season_stats`
#'   release tag (R-scraped, `Base`/`Advanced`/`Misc`/`Scoring`/`Usage`/
#'   `Defense` measures) is superseded by the `wnba_stats_leaguedash` tag
#'   (Python-scraped parameter cube, same 6 measure types plus `player_bio`
#'   and a wide `player_master` mega). This function reshapes the cube back
#'   into the old stacked-by-`measure_type` contract for compatibility; call
#'   the cube's `player_stats_*` / `player_master` assets directly with
#'   [load_wnba_stats_leaguedash()] for the full surface.
#' @param seasons A vector of 4-digit years associated with given WNBA seasons.
#'   Published coverage runs 1997 through the most recent season, with no
#'   gaps. Pass `seasons = TRUE` for every published season. (Min: 1997)
#' @param ... Additional arguments passed to an underlying function that writes
#'   the season data into a database.
#' @param dbConnection A `DBIConnection` object, as returned by [DBI::dbConnect()]
#' @param tablename The name of the player season stats table within the database
#' @return Returns a `wehoop_data` tibble of player season stats.
#' @export
#' @family WNBA Stats loader functions
#' @examples
#' \donttest{
#'   try(load_wnba_stats_player_stats(seasons = most_recent_wnba_stats_season()))
#' }
load_wnba_stats_player_stats <- function(seasons = most_recent_wnba_stats_season(),
                                         ...,
                                         dbConnection = NULL, tablename = NULL) {
  lifecycle::deprecate_warn(
    when = "3.0.0",
    what = "load_wnba_stats_player_stats()",
    details = "Backing data moved from the wnba_stats_player_season_stats release tag to the wnba_stats_leaguedash release tag (a Python-scraped parameter cube). This call reshapes the cube's player_stats_{base,advanced,misc,scoring,usage,defense} assets back into the old stacked-by-measure_type contract."
  )
  old <- options(list(stringsAsFactors = FALSE, scipen = 999))
  on.exit(options(old))
  dots <- rlang::dots_list(...)

  if (!is.null(dbConnection) && !is.null(tablename)) in_db <- TRUE else in_db <- FALSE

  if (isTRUE(seasons)) seasons <- 1997:most_recent_wnba_stats_season()

  stopifnot(is.numeric(seasons),
            seasons >= 1997,
            seasons <= most_recent_wnba_stats_season())

  measures <- c(base = "Base", advanced = "Advanced", misc = "Misc",
                scoring = "Scoring", usage = "Usage", defense = "Defense")
  base_url <- paste0(
    "https://github.com/sportsdataverse/sportsdataverse-data/releases/download/",
    "wnba_stats_leaguedash/"
  )

  p <- NULL
  if (is_installed("progressr")) p <- progressr::progressor(along = seasons)

  out <- lapply(seasons, function(season) {
    per_measure <- lapply(names(measures), function(slug) {
      df <- parquet_from_url(paste0(base_url, "player_stats_", slug, "_", season, ".parquet"))
      if (nrow(df) == 0) return(df)
      data.table::set(df, j = "measure_type", value = measures[[slug]])
      df
    })
    if (!is.null(p)) p("loading...")
    data.table::rbindlist(per_measure, use.names = TRUE, fill = TRUE)
  })
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
#' **Load cleaned WNBA Stats API season lineups from the data repo**
#' @rdname load_wnba_stats_coaches
#' @description `r lifecycle::badge("deprecated")` Loads season-level WNBA
#'   5-man lineup statistics (`leaguedashlineups`-style outputs).
#'   **Deprecated**: the `wnba_stats_lineups` release tag (R-scraped,
#'   `Base`/`Advanced` measures, 5-man only) is superseded by the
#'   `wnba_stats_leaguedash` tag (Python-scraped parameter cube: 6 measure
#'   types x 2/3/4/5-man). This function reshapes the cube back into the old
#'   5-man `Base`+`Advanced` contract for compatibility; call the cube's
#'   `lineups_*` / `lineups_master` assets directly with
#'   [load_wnba_stats_leaguedash()] for the full surface.
#' @param seasons A vector of 4-digit years associated with given WNBA seasons.
#'   Published coverage runs 1997 through the most recent season, with no
#'   gaps. Pass `seasons = TRUE` for every published season. (Min: 1997)
#' @param ... Additional arguments passed to an underlying function that writes
#'   the season data into a database.
#' @param dbConnection A `DBIConnection` object, as returned by [DBI::dbConnect()]
#' @param tablename The name of the lineups data table within the database
#' @return Returns a `wehoop_data` tibble of lineup stats.
#' @export
#' @family WNBA Stats loader functions
#' @examples
#' \donttest{
#'   try(load_wnba_stats_lineups(seasons = most_recent_wnba_stats_season()))
#' }
load_wnba_stats_lineups <- function(seasons = most_recent_wnba_stats_season(),
                                    ...,
                                    dbConnection = NULL, tablename = NULL) {
  lifecycle::deprecate_warn(
    when = "3.0.0",
    what = "load_wnba_stats_lineups()",
    details = "Backing data moved from the wnba_stats_lineups release tag (5-man Base+Advanced only) to the wnba_stats_leaguedash release tag (a Python-scraped parameter cube covering 2/3/4/5-man x 6 measure types). This call filters the cube's lineups_{base,advanced} assets down to group_quantity == 5 to match the old contract."
  )
  old <- options(list(stringsAsFactors = FALSE, scipen = 999))
  on.exit(options(old))
  dots <- rlang::dots_list(...)

  if (!is.null(dbConnection) && !is.null(tablename)) in_db <- TRUE else in_db <- FALSE

  if (isTRUE(seasons)) seasons <- 1997:most_recent_wnba_stats_season()

  stopifnot(is.numeric(seasons),
            seasons >= 1997,
            seasons <= most_recent_wnba_stats_season())

  measures <- c(base = "Base", advanced = "Advanced")
  base_url <- paste0(
    "https://github.com/sportsdataverse/sportsdataverse-data/releases/download/",
    "wnba_stats_leaguedash/"
  )

  p <- NULL
  if (is_installed("progressr")) p <- progressr::progressor(along = seasons)

  out <- lapply(seasons, function(season) {
    per_measure <- lapply(names(measures), function(slug) {
      df <- parquet_from_url(paste0(base_url, "lineups_", slug, "_", season, ".parquet"))
      if (nrow(df) == 0) return(df)
      df <- df[df$group_quantity == 5, ]
      data.table::set(df, j = "measure_type", value = measures[[slug]])
      df
    })
    if (!is.null(p)) p("loading...")
    data.table::rbindlist(per_measure, use.names = TRUE, fill = TRUE)
  })
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
#' **Load cleaned WNBA Stats API team season stats from the data repo**
#' @rdname load_wnba_stats_coaches
#' @description `r lifecycle::badge("deprecated")` Loads season-level team
#'   statistics (`leaguedashteamstats`-style outputs). **Deprecated**: the
#'   `wnba_stats_team_season_stats` release tag (R-scraped, `Base`/
#'   `Advanced`/`Misc`/`Scoring`/`Defense`/`Opponent` measures) is superseded
#'   by the `wnba_stats_leaguedash` tag (Python-scraped parameter cube, same
#'   6 measures plus `Four Factors` and a wide `team_master` mega). This
#'   function reshapes the cube back into the old stacked-by-`measure_type`
#'   contract for compatibility; call the cube's `team_stats_*` /
#'   `team_master` assets directly with
#'   [load_wnba_stats_leaguedash()] for the full surface.
#' @param seasons A vector of 4-digit years associated with given WNBA seasons.
#'   Published coverage runs 1997 through the most recent season, with no
#'   gaps. Pass `seasons = TRUE` for every published season. (Min: 1997)
#' @param ... Additional arguments passed to an underlying function that writes
#'   the season data into a database.
#' @param dbConnection A `DBIConnection` object, as returned by [DBI::dbConnect()]
#' @param tablename The name of the team season stats table within the database
#' @return Returns a `wehoop_data` tibble of team season stats.
#'
#'    \if{html}{\tabular{lll}{
#'       col_name \tab types \tab description \cr
#'       season \tab integer \tab Season identifier (4-digit year or 'YYYY-YY' string). \cr
#'       season_type \tab character \tab Season type (1=pre-season, 2=regular season, 3=postseason, 4=off-season for ESPN; or string label for WNBA Stats). \cr
#'       team_id \tab character \tab Unique team identifier. \cr
#'       team_name \tab character \tab Full team display name (e.g. 'Las Vegas Aces'). \cr
#'       team_abbreviation \tab character \tab Short team abbreviation (e.g. 'LAS'). \cr
#'       gp \tab integer \tab Games played. \cr
#'       w \tab integer \tab Wins. \cr
#'       l \tab integer \tab Losses. \cr
#'       w_pct \tab numeric \tab Wins percentage (0-1 decimal). \cr
#'       min \tab numeric \tab Minutes played. \cr
#'       fgm \tab numeric \tab Field goals made. \cr
#'       fga \tab numeric \tab Field goal attempts. \cr
#'       fg_pct \tab numeric \tab Field goal percentage (0-1). \cr
#'       fg3m \tab numeric \tab Three-point field goals made. \cr
#'       fg3a \tab numeric \tab Three-point field goal attempts. \cr
#'       fg3_pct \tab numeric \tab Three-point field goal percentage (0-1). \cr
#'       ftm \tab numeric \tab Free throws made. \cr
#'       fta \tab numeric \tab Free throw attempts. \cr
#'       ft_pct \tab numeric \tab Free throw percentage (0-1). \cr
#'       oreb \tab numeric \tab Offensive rebounds. \cr
#'       dreb \tab numeric \tab Defensive rebounds. \cr
#'       reb \tab numeric \tab Total rebounds. \cr
#'       ast \tab numeric \tab Assists. \cr
#'       tov \tab numeric \tab Turnovers. \cr
#'       stl \tab numeric \tab Steals. \cr
#'       blk \tab numeric \tab Blocks. \cr
#'       pf \tab numeric \tab Personal fouls. \cr
#'       pts \tab numeric \tab Points scored. \cr
#'       plus_minus \tab numeric \tab Plus/minus point differential while on court. \cr
#'    }}
#'    \if{latex}{See the HTML help or pkgdown reference for the column table.}
#'
#' @export
#' @family WNBA Stats loader functions
#' @examples
#' \donttest{
#'   try(load_wnba_stats_team_stats(seasons = most_recent_wnba_stats_season()))
#' }
load_wnba_stats_team_stats <- function(seasons = most_recent_wnba_stats_season(),
                                       ...,
                                       dbConnection = NULL, tablename = NULL) {
  lifecycle::deprecate_warn(
    when = "3.0.0",
    what = "load_wnba_stats_team_stats()",
    details = "Backing data moved from the wnba_stats_team_season_stats release tag to the wnba_stats_leaguedash release tag (a Python-scraped parameter cube). This call reshapes the cube's team_stats_{base,advanced,misc,scoring,defense,opponent} assets back into the old stacked-by-measure_type contract."
  )
  old <- options(list(stringsAsFactors = FALSE, scipen = 999))
  on.exit(options(old))
  dots <- rlang::dots_list(...)

  if (!is.null(dbConnection) && !is.null(tablename)) in_db <- TRUE else in_db <- FALSE

  if (isTRUE(seasons)) seasons <- 1997:most_recent_wnba_stats_season()

  stopifnot(is.numeric(seasons),
            seasons >= 1997,
            seasons <= most_recent_wnba_stats_season())

  measures <- c(base = "Base", advanced = "Advanced", misc = "Misc",
                scoring = "Scoring", defense = "Defense", opponent = "Opponent")
  base_url <- paste0(
    "https://github.com/sportsdataverse/sportsdataverse-data/releases/download/",
    "wnba_stats_leaguedash/"
  )

  p <- NULL
  if (is_installed("progressr")) p <- progressr::progressor(along = seasons)

  out <- lapply(seasons, function(season) {
    per_measure <- lapply(names(measures), function(slug) {
      df <- parquet_from_url(paste0(base_url, "team_stats_", slug, "_", season, ".parquet"))
      if (nrow(df) == 0) return(df)
      data.table::set(df, j = "measure_type", value = measures[[slug]])
      df
    })
    if (!is.null(p)) p("loading...")
    data.table::rbindlist(per_measure, use.names = TRUE, fill = TRUE)
  })
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
#' **Load cleaned WNBA Stats API season standings from the data repo**
#' @rdname load_wnba_stats_coaches
#' @description `r lifecycle::badge("deprecated")` Loads season-level WNBA
#'   standings (`leaguestandingsv3`-style outputs). One row per team-season.
#'   **Deprecated**: the `wnba_stats_standings` release tag (R-scraped) is
#'   superseded by the `wnba_stats_leaguedash` tag's `standings` asset
#'   (same underlying endpoint/params, Python-scraped) — this is close to a
#'   pure passthrough.
#' @param seasons A vector of 4-digit years associated with given WNBA seasons.
#'   Published coverage runs 1997 through the most recent season, with no
#'   gaps. Pass `seasons = TRUE` for every published season. (Min: 1997)
#' @param ... Additional arguments passed to an underlying function that writes
#'   the season data into a database.
#' @param dbConnection A `DBIConnection` object, as returned by [DBI::dbConnect()]
#' @param tablename The name of the standings data table within the database
#' @return Returns a `wehoop_data` tibble of team standings.
#'
#'    \if{html}{\tabular{lll}{
#'       col_name \tab types \tab description \cr
#'       season \tab integer \tab Season identifier (4-digit year or 'YYYY-YY' string). \cr
#'       season_id \tab character \tab Unique season identifier. \cr
#'       team_id \tab character \tab Unique team identifier. \cr
#'       team_city \tab character \tab Team city or region (e.g. 'Las Vegas'). \cr
#'       team_name \tab character \tab Full team display name (e.g. 'Las Vegas Aces'). \cr
#'       conference \tab character \tab Filter players or teams by conference. \cr
#'       conference_record \tab character \tab Conference win-loss record. \cr
#'       playoff_rank \tab integer \tab League/season rank for playoff. \cr
#'       wins \tab integer \tab Total wins. \cr
#'       losses \tab integer \tab Total losses. \cr
#'       win_pct \tab numeric \tab Win percentage (0-1 decimal). \cr
#'       home_record \tab character \tab Home win-loss record. \cr
#'       road_record \tab character \tab Win-loss record for road. \cr
#'       l10 \tab character \tab L10. \cr
#'       strcurrentstreak \tab character \tab Strcurrentstreak. \cr
#'       points_pg \tab numeric \tab Points pg. \cr
#'       opp_points_pg \tab numeric \tab Opponent points pg. \cr
#'       diff_points_pg \tab numeric \tab Diff points pg. \cr
#'    }}
#'    \if{latex}{See the HTML help or pkgdown reference for the column table.}
#'
#' @export
#' @family WNBA Stats loader functions
#' @examples
#' \donttest{
#'   try(load_wnba_stats_standings(seasons = most_recent_wnba_stats_season()))
#' }
load_wnba_stats_standings <- function(seasons = most_recent_wnba_stats_season(),
                                      ...,
                                      dbConnection = NULL, tablename = NULL) {
  lifecycle::deprecate_warn(
    when = "3.0.0",
    what = "load_wnba_stats_standings()",
    details = "Backing data moved from the wnba_stats_standings release tag to the wnba_stats_leaguedash release tag's standings_{season}.parquet asset (same underlying leaguestandingsv3 endpoint/params, Python-scraped)."
  )
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
    "wnba_stats_leaguedash/standings_", seasons, ".parquet"
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
#' **Load cleaned WNBA Stats API draft picks from the data repo**
#' @rdname load_wnba_stats_coaches
#' @description Loads season-level WNBA draft picks scraped from the WNBA
#'   Stats API (`drafthistory`-style outputs). One row per pick. Backed by
#'   the `wehoop-wnba-stats-data` pipeline that reads raw JSONs from
#'   `wehoop-wnba-stats-raw` and publishes parquet/rds artifacts to the
#'   `wnba_stats_draft` release tag.
#' @param seasons A vector of 4-digit years associated with given WNBA draft
#'   seasons. Published coverage runs 1997 through the most recent season,
#'   with no gaps. Pass `seasons = TRUE` for every published season.
#'   (Min: 1997)
#' @param ... Additional arguments passed to an underlying function that writes
#'   the season data into a database.
#' @param dbConnection A `DBIConnection` object, as returned by [DBI::dbConnect()]
#' @param tablename The name of the draft data table within the database
#' @return Returns a `wehoop_data` tibble of WNBA draft picks.
#'
#'    \if{html}{\tabular{lll}{
#'       col_name \tab types \tab description \cr
#'       person_id \tab integer \tab Unique player identifier (V3 endpoints). \cr
#'       player_name \tab character \tab Player name. \cr
#'       season \tab integer \tab Season identifier (4-digit year). \cr
#'       round_number \tab integer \tab Numeric round. \cr
#'       round_pick \tab integer \tab Round pick. \cr
#'       overall_pick \tab integer \tab Overall pick. \cr
#'       draft_type \tab character \tab Draft type ('Draft', 'Allocation' or 'Elite'). \cr
#'       team_id \tab integer \tab Unique team identifier. \cr
#'       team_city \tab character \tab Team city or region (e.g. 'Las Vegas'). \cr
#'       team_name \tab character \tab Full team display name (e.g. 'Las Vegas Aces'). \cr
#'       team_abbreviation \tab character \tab Short team abbreviation (e.g. 'LAS'). \cr
#'       organization \tab character \tab Organization. \cr
#'       organization_type \tab character \tab Organization type. \cr
#'       player_profile_flag \tab integer \tab Player profile flag. \cr
#'    }}
#'    \if{latex}{See the HTML help or pkgdown reference for the column table.}
#'
#' @export
#' @family WNBA Stats loader functions
#' @examples
#' \donttest{
#'   try(load_wnba_stats_draft(seasons = most_recent_wnba_stats_season()))
#' }
load_wnba_stats_draft <- function(seasons = most_recent_wnba_stats_season(),
                                  ...,
                                  dbConnection = NULL, tablename = NULL) {
  old <- options(list(stringsAsFactors = FALSE, scipen = 999))
  on.exit(options(old))
  dots <- rlang::dots_list(...)

  loader <- rds_from_url
  if (!is.null(dbConnection) && !is.null(tablename)) in_db <- TRUE else in_db <- FALSE

  if (isTRUE(seasons)) seasons <- 1997:most_recent_wnba_stats_season()

  stopifnot(is.numeric(seasons),
            seasons >= 1997,
            seasons <= most_recent_wnba_stats_season())

  urls <- paste0(
    "https://github.com/sportsdataverse/sportsdataverse-data/releases/download/",
    "wnba_stats_draft/draft_", seasons, ".rds"
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
#' **Load cleaned WNBA Stats API shot events from the data repo**
#' @rdname load_wnba_stats_coaches
#' @description Loads shot events scraped from the WNBA Stats API. One row
#'   per shot attempt with legacy court coordinates, action/sub type,
#'   distance, and made/missed result, carried through from the V3
#'   play-by-play feed (not `shotchartdetail`). Backed by the
#'   `wehoop-wnba-stats-data` pipeline that reads raw JSONs from
#'   `wehoop-wnba-stats-raw` and publishes parquet/rds artifacts to the
#'   `wnba_stats_shots` release tag.
#' @param seasons A vector of 4-digit years associated with given WNBA seasons.
#'   Published coverage runs 1997 through the most recent season, with no
#'   gaps. Pass `seasons = TRUE` for every published season. (Min: 1997)
#' @param ... Additional arguments passed to an underlying function that writes
#'   the season data into a database.
#' @param dbConnection A `DBIConnection` object, as returned by [DBI::dbConnect()]
#' @param tablename The name of the shots data table within the database
#' @return Returns a `wehoop_data` tibble with one row per shot attempt.
#'
#'    \if{html}{\tabular{lll}{
#'       col_name \tab types \tab description \cr
#'       game_id \tab character \tab Unique game identifier. \cr
#'       season \tab integer \tab Season identifier (4-digit year). \cr
#'       period \tab integer \tab Period of the game (1-4 quarters; 5+ for OT). \cr
#'       clock \tab character \tab Game clock remaining in the period (ISO 8601 duration). \cr
#'       team_id \tab integer \tab Unique team identifier for the shooting team. \cr
#'       team_tricode \tab character \tab Three-letter team code (e.g. 'LAS' / 'NYL'). \cr
#'       person_id \tab integer \tab Unique player identifier for the shooter. \cr
#'       player_name \tab character \tab Shooter's name. \cr
#'       action_type \tab character \tab Action type label ('Made Shot' or 'Missed Shot'). \cr
#'       sub_type \tab character \tab Shot sub type (e.g. 'Jump Shot', 'Layup', 'DUNK'). \cr
#'       shot_result \tab character \tab Shot result, 'Made' or 'Missed'. \cr
#'       shot_value \tab integer \tab Points the shot was worth (2 or 3). \cr
#'       shot_distance \tab integer \tab Shot distance from the basket, in feet. \cr
#'       x_legacy \tab integer \tab Legacy X coordinate on the court (0 = basket center). \cr
#'       y_legacy \tab integer \tab Legacy Y coordinate on the court (baseline at 0). \cr
#'       description \tab character \tab Text description of the play. \cr
#'       score_home \tab character \tab Home team score after the play. \cr
#'       score_away \tab character \tab Away team score after the play. \cr
#'    }}
#'    \if{latex}{See the HTML help or pkgdown reference for the column table.}
#'
#' @export
#' @family WNBA Stats loader functions
#' @examples
#' \donttest{
#'   try(load_wnba_stats_shots(seasons = most_recent_wnba_stats_season()))
#' }
load_wnba_stats_shots <- function(seasons = most_recent_wnba_stats_season(),
                                  ...,
                                  dbConnection = NULL, tablename = NULL) {
  old <- options(list(stringsAsFactors = FALSE, scipen = 999))
  on.exit(options(old))
  dots <- rlang::dots_list(...)

  loader <- rds_from_url
  if (!is.null(dbConnection) && !is.null(tablename)) in_db <- TRUE else in_db <- FALSE

  if (isTRUE(seasons)) seasons <- 1997:most_recent_wnba_stats_season()

  stopifnot(is.numeric(seasons),
            seasons >= 1997,
            seasons <= most_recent_wnba_stats_season())

  urls <- paste0(
    "https://github.com/sportsdataverse/sportsdataverse-data/releases/download/",
    "wnba_stats_shots/shots_", seasons, ".rds"
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
#' **Load cleaned WNBA Stats API per-game rosters from the data repo**
#' @rdname load_wnba_stats_coaches
#' @description Loads the per-game **inactive player** list scraped from the
#'   WNBA Stats API -- the `InactivePlayers` result set of
#'   `boxscoresummaryv2`. One row per inactive athlete-game pair, not a full
#'   per-game roster: use [load_wnba_stats_player_game_logs()] for the
#'   athletes who did play. Backed by the `wehoop-wnba-stats-data` pipeline
#'   that reads raw JSONs from `wehoop-wnba-stats-raw` and publishes
#'   parquet/rds artifacts to the `wnba_stats_game_rosters` release tag.
#'
#'   Coverage is thin by construction because the upstream result set is
#'   thin: stats.wnba.com reports inactives for only a fraction of games,
#'   and most heavily for 2006-2008 and 2021 onward. Season row counts range
#'   from 1 (1997) to 610 across 184 games (2026); 2009-2012 carry fewer
#'   than 10 rows each. A season with almost no rows is upstream sparsity,
#'   not a download failure.
#' @param seasons A vector of 4-digit years associated with given WNBA seasons.
#'   Published coverage runs 1997 through the most recent season, with no
#'   gaps. Pass `seasons = TRUE` for every published season. (Min: 1997)
#' @param ... Additional arguments passed to an underlying function that writes
#'   the season data into a database.
#' @param dbConnection A `DBIConnection` object, as returned by [DBI::dbConnect()]
#' @param tablename The name of the game rosters data table within the database
#' @return Returns a `wehoop_data` tibble with one row per inactive
#'   athlete-game pair.
#'
#'    \if{html}{\tabular{lll}{
#'       col_name \tab types \tab description \cr
#'       player_id \tab integer \tab Unique player identifier. \cr
#'       first_name \tab character \tab Player's first name. \cr
#'       last_name \tab character \tab Player's last name. \cr
#'       jersey_num \tab character \tab Jersey number worn by the player. \cr
#'       team_id \tab integer \tab Unique team identifier. \cr
#'       team_city \tab character \tab Team city or region (e.g. 'Las Vegas'). \cr
#'       team_name \tab character \tab Full team display name (e.g. 'Las Vegas Aces'). \cr
#'       team_abbreviation \tab character \tab Short team abbreviation (e.g. 'LAS'). \cr
#'       season \tab integer \tab Season identifier (4-digit year). \cr
#'       game_id \tab character \tab Unique game identifier. \cr
#'    }}
#'    \if{latex}{See the HTML help or pkgdown reference for the column table.}
#'
#' @export
#' @family WNBA Stats loader functions
#' @examples
#' \donttest{
#'   try(load_wnba_stats_game_rosters(seasons = most_recent_wnba_stats_season()))
#' }
load_wnba_stats_game_rosters <- function(seasons = most_recent_wnba_stats_season(),
                                         ...,
                                         dbConnection = NULL, tablename = NULL) {
  old <- options(list(stringsAsFactors = FALSE, scipen = 999))
  on.exit(options(old))
  dots <- rlang::dots_list(...)

  loader <- rds_from_url
  if (!is.null(dbConnection) && !is.null(tablename)) in_db <- TRUE else in_db <- FALSE

  if (isTRUE(seasons)) seasons <- 1997:most_recent_wnba_stats_season()

  stopifnot(is.numeric(seasons),
            seasons >= 1997,
            seasons <= most_recent_wnba_stats_season())

  urls <- paste0(
    "https://github.com/sportsdataverse/sportsdataverse-data/releases/download/",
    "wnba_stats_game_rosters/game_rosters_", seasons, ".rds"
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
#' **Load cleaned WNBA Stats API game officials from the data repo**
#' @rdname load_wnba_stats_coaches
#' @description Loads game-level officials data scraped from the WNBA Stats
#'   API (`boxscoresummaryv2`-style outputs). One row per official-game pair.
#'   Backed by the `wehoop-wnba-stats-data` pipeline that reads raw JSONs
#'   from `wehoop-wnba-stats-raw` and publishes parquet/rds artifacts to the
#'   `wnba_stats_officials` release tag.
#' @param seasons A vector of 4-digit years associated with given WNBA seasons.
#'   Published coverage runs 2004 through the most recent season, with no
#'   gaps. 2004 is an enforced floor: `boxscoresummaryv2` does return an
#'   `Officials` block for a handful of pre-2004 games, but only 1-2 games
#'   per season are covered (e.g. 2/158 games in one season), so those
#'   fragments are deliberately not published. Pass `seasons = TRUE` for
#'   every published season. (Min: 2004)
#' @param ... Additional arguments passed to an underlying function that writes
#'   the season data into a database.
#' @param dbConnection A `DBIConnection` object, as returned by [DBI::dbConnect()]
#' @param tablename The name of the officials data table within the database
#' @return Returns a `wehoop_data` tibble with one row per official-game pair.
#'
#'    |col_name    |types     |description                                     |
#'    |:-----------|:---------|:-----------------------------------------------|
#'    |official_id |integer   |Unique official / referee identifier.           |
#'    |first_name  |character |Official's first name.                          |
#'    |last_name   |character |Official's last name.                           |
#'    |jersey_num  |character |Jersey number worn by the official.             |
#'    |season      |integer   |Season identifier (4-digit year).               |
#'    |game_id     |character |Unique game identifier.                         |
#'
#' @export
#' @family WNBA Stats loader functions
#' @examples
#' \donttest{
#'   try(load_wnba_stats_officials(seasons = most_recent_wnba_stats_season()))
#' }
load_wnba_stats_officials <- function(seasons = most_recent_wnba_stats_season(),
                                      ...,
                                      dbConnection = NULL, tablename = NULL) {
  old <- options(list(stringsAsFactors = FALSE, scipen = 999))
  on.exit(options(old))
  dots <- rlang::dots_list(...)

  loader <- rds_from_url
  if (!is.null(dbConnection) && !is.null(tablename)) in_db <- TRUE else in_db <- FALSE

  # Officials publication starts at 2004 -- pre-2004 seasons exist upstream
  # only as 1-2 game fragments and are deliberately withheld, so expanding
  # `seasons = TRUE` from 1997 would issue seven guaranteed-404 downloads.
  if (isTRUE(seasons)) seasons <- 2004:most_recent_wnba_stats_season()

  stopifnot(is.numeric(seasons),
            seasons >= 2004,
            seasons <= most_recent_wnba_stats_season())

  urls <- paste0(
    "https://github.com/sportsdataverse/sportsdataverse-data/releases/download/",
    "wnba_stats_officials/officials_", seasons, ".rds"
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
#' **Load cleaned WNBA Stats API per-player per-game logs from the data repo**
#' @rdname load_wnba_stats_coaches
#' @description Loads per-player per-game logs scraped from
#'   `stats.wnba.com/leaguegamelog?PlayerOrTeam=P` (one row per
#'   athlete-game pair: minutes, shooting splits, rebounds, steals, blocks,
#'   turnovers, personal fouls, plus/minus). Backed by the
#'   `wehoop-wnba-stats-data` pipeline that publishes parquet/rds artifacts
#'   to the `wnba_stats_player_game_logs` release tag.
#' @param seasons A vector of 4-digit years associated with given WNBA seasons.
#'   Published coverage runs 1997 through the most recent season, with no
#'   gaps. Pass `seasons = TRUE` for every published season. (Min: 1997)
#' @param ... Additional arguments passed to an underlying function that writes
#'   the season data into a database.
#' @param dbConnection A `DBIConnection` object, as returned by [DBI::dbConnect()]
#' @param tablename The name of the player game logs table within the database
#' @return Returns a `wehoop_data` tibble of per-athlete per-game log rows.
#' @export
#' @family WNBA Stats loader functions
#' @examples
#' \donttest{
#'   try(load_wnba_stats_player_game_logs(seasons = most_recent_wnba_stats_season()))
#' }
load_wnba_stats_player_game_logs <- function(seasons = most_recent_wnba_stats_season(),
                                             ...,
                                             dbConnection = NULL, tablename = NULL) {
  old <- options(list(stringsAsFactors = FALSE, scipen = 999))
  on.exit(options(old))
  dots <- rlang::dots_list(...)

  loader <- rds_from_url
  if (!is.null(dbConnection) && !is.null(tablename)) in_db <- TRUE else in_db <- FALSE

  if (isTRUE(seasons)) seasons <- 1997:most_recent_wnba_stats_season()

  stopifnot(is.numeric(seasons),
            seasons >= 1997,
            seasons <= most_recent_wnba_stats_season())

  urls <- paste0(
    "https://github.com/sportsdataverse/sportsdataverse-data/releases/download/",
    "wnba_stats_player_game_logs/player_game_logs_", seasons, ".rds"
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
#' **Load cleaned WNBA Stats API season schedules from the data repo**
#' @rdname load_wnba_stats_coaches
#' @description Loads season-level WNBA schedules scraped from
#'   `stats.wnba.com/leaguegamefinder` (regular season + playoffs combined,
#'   pre-rejoined home/away). Backed by the `wehoop-wnba-stats-data`
#'   pipeline that publishes parquet/rds artifacts to the
#'   `wnba_stats_schedules` release tag.
#' @param seasons A vector of 4-digit years associated with given WNBA seasons.
#'   Published coverage runs 1997 through the most recent season, with no
#'   gaps. Pass `seasons = TRUE` for every published season. (Min: 1997)
#' @param ... Additional arguments passed to an underlying function that writes
#'   the season data into a database.
#' @param dbConnection A `DBIConnection` object, as returned by [DBI::dbConnect()]
#' @param tablename The name of the schedules data table within the database
#' @return Returns a `wehoop_data` tibble of per-season schedules, one row per
#'   game with the home/away sides pre-joined into `home_*` / `away_*` columns.
#'
#'    \if{html}{\tabular{lll}{
#'       col_name \tab types \tab description \cr
#'       game_id \tab character \tab Unique game identifier. \cr
#'       season \tab integer \tab Season identifier (4-digit year). \cr
#'       season_type \tab character \tab Portion of the season: \code{regular-season} or \code{playoffs}. \cr
#'       game_date \tab character \tab Date the game was played, as an ISO \code{YYYY-MM-DD} string. \cr
#'       matchup \tab character \tab Matchup string, home side first (e.g. \verb{WAS vs. NYL}). \cr
#'       home_team_id \tab integer \tab Unique WNBA Stats team identifier for the home team. \cr
#'       home_team_abbreviation \tab character \tab Home team abbreviation. \cr
#'       home_team_name \tab character \tab Home team full name. \cr
#'       home_pts \tab integer \tab Points scored by the home team. \cr
#'       home_wl \tab character \tab Home team result, \code{W} or \code{L}. \cr
#'       away_team_id \tab integer \tab Unique WNBA Stats team identifier for the away team. \cr
#'       away_team_abbreviation \tab character \tab Away team abbreviation. \cr
#'       away_team_name \tab character \tab Away team full name. \cr
#'       away_pts \tab integer \tab Points scored by the away team. \cr
#'       away_wl \tab character \tab Away team result, \code{W} or \code{L}. \cr
#'    }}
#'    \if{latex}{See the HTML help or pkgdown reference for the column table.}
#'
#' @export
#' @family WNBA Stats loader functions
#' @examples
#' \donttest{
#'   try(load_wnba_stats_schedule(seasons = most_recent_wnba_stats_season()))
#' }
load_wnba_stats_schedule <- function(seasons = most_recent_wnba_stats_season(),
                                     ...,
                                     dbConnection = NULL, tablename = NULL) {
  old <- options(list(stringsAsFactors = FALSE, scipen = 999))
  on.exit(options(old))
  dots <- rlang::dots_list(...)

  loader <- rds_from_url
  if (!is.null(dbConnection) && !is.null(tablename)) in_db <- TRUE else in_db <- FALSE

  if (isTRUE(seasons)) seasons <- 1997:most_recent_wnba_stats_season()

  stopifnot(is.numeric(seasons),
            seasons >= 1997,
            seasons <= most_recent_wnba_stats_season())

  urls <- paste0(
    "https://github.com/sportsdataverse/sportsdataverse-data/releases/download/",
    "wnba_stats_schedules/wnba_schedule_", seasons, ".rds"
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
#' **Load cleaned WNBA Stats API play-by-play from the data repo**
#' @rdname load_wnba_stats_coaches
#' @description Loads season-level WNBA play-by-play (V3), supplied by
#'   [wnba_pbp()] in the upstream compile script. Backed by the
#'   `wehoop-wnba-stats-data` pipeline that publishes parquet/rds artifacts to
#'   the `wnba_stats_pbp` release tag.
#' @param seasons A vector of 4-digit years associated with given WNBA seasons.
#'   Published coverage runs 1997 through the most recent season, with no
#'   gaps. Pass `seasons = TRUE` for every published season. (Min: 1997)
#' @param ... Additional arguments passed to an underlying function that writes
#'   the season data into a database.
#' @param dbConnection A `DBIConnection` object, as returned by [DBI::dbConnect()]
#' @param tablename The name of the play-by-play data table within the database
#' @return Returns a `wehoop_data` tibble of per-event play-by-play rows.
#' @export
#' @family WNBA Stats loader functions
#' @examples
#' \donttest{
#'   try(load_wnba_stats_pbp(seasons = most_recent_wnba_stats_season()))
#' }
load_wnba_stats_pbp <- function(seasons = most_recent_wnba_stats_season(),
                                ...,
                                dbConnection = NULL, tablename = NULL) {
  old <- options(list(stringsAsFactors = FALSE, scipen = 999))
  on.exit(options(old))
  dots <- rlang::dots_list(...)

  loader <- rds_from_url
  if (!is.null(dbConnection) && !is.null(tablename)) in_db <- TRUE else in_db <- FALSE

  if (isTRUE(seasons)) seasons <- 1997:most_recent_wnba_stats_season()

  stopifnot(is.numeric(seasons),
            seasons >= 1997,
            seasons <= most_recent_wnba_stats_season())

  urls <- paste0(
    "https://github.com/sportsdataverse/sportsdataverse-data/releases/download/",
    "wnba_stats_pbp/wnba_play_by_play_", seasons, ".rds"
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


#' **Load wehoop WNBA Stats League Dashboard cube**
#' @name load_wnba_stats_leaguedash
NULL

#' Valid `table` values for [load_wnba_stats_leaguedash()].
#' @keywords Internal
#' @noRd
wnba_stats_leaguedash_tables <- c(
  "player_bio", "player_master",
  "player_stats_base", "player_stats_advanced", "player_stats_misc",
  "player_stats_scoring", "player_stats_usage", "player_stats_defense",
  "team_master",
  "team_stats_base", "team_stats_advanced", "team_stats_misc",
  "team_stats_scoring", "team_stats_defense", "team_stats_opponent",
  "team_stats_fourfactors",
  "lineups_master",
  "lineups_base", "lineups_advanced", "lineups_misc",
  "lineups_scoring", "lineups_opponent", "lineups_fourfactors",
  "standings"
)

#' @title
#' **Load a single table of the WNBA Stats league dashboard cube**
#' @rdname load_wnba_stats_leaguedash
#' @description Loads one asset of the `wnba_stats_leaguedash` release tag --
#'   the Python-scraped `leaguedash*` parameter cube that supersedes the old
#'   R-scraped player / team / lineups / standings tags. The cube publishes
#'   24 tables per season and is the full surface behind the compatibility
#'   reshapes in [load_wnba_stats_player_stats()],
#'   [load_wnba_stats_team_stats()], [load_wnba_stats_lineups()] and
#'   [load_wnba_stats_standings()]; several tables (`player_bio`,
#'   `*_master`, `team_stats_fourfactors`, the non-5-man and non-Base/Advanced
#'   `lineups_*` measures) are reachable only through this function.
#' @param seasons A vector of 4-digit years associated with given WNBA seasons.
#'   Published coverage runs 1997 through the most recent season, with no
#'   gaps. Pass `seasons = TRUE` for every published season. (Min: 1997)
#' @param table Name of the cube table to load. One of `player_bio`,
#'   `player_master`, `player_stats_base`, `player_stats_advanced`,
#'   `player_stats_misc`, `player_stats_scoring`, `player_stats_usage`,
#'   `player_stats_defense`, `team_master`, `team_stats_base`,
#'   `team_stats_advanced`, `team_stats_misc`, `team_stats_scoring`,
#'   `team_stats_defense`, `team_stats_opponent`, `team_stats_fourfactors`,
#'   `lineups_master`, `lineups_base`, `lineups_advanced`, `lineups_misc`,
#'   `lineups_scoring`, `lineups_opponent`, `lineups_fourfactors`,
#'   `standings`.
#' @param ... Additional arguments passed to an underlying function that writes
#'   the season data into a database.
#' @param dbConnection A `DBIConnection` object, as returned by [DBI::dbConnect()]
#' @param tablename The name of the data table within the database
#' @return Returns a `wehoop_data` tibble of the requested cube table, one
#'   row per player-season, team-season or lineup-season depending on
#'   `table`. Column sets differ per table; the `*_master` tables are wide
#'   joins of every measure type for that entity.
#' @export
#' @family WNBA Stats loader functions
#' @examples
#' \donttest{
#'   try(load_wnba_stats_leaguedash(seasons = most_recent_wnba_stats_season(),
#'                                  table = "player_bio"))
#' }
load_wnba_stats_leaguedash <- function(seasons = most_recent_wnba_stats_season(),
                                       table = NULL,
                                       ...,
                                       dbConnection = NULL, tablename = NULL) {
  old <- options(list(stringsAsFactors = FALSE, scipen = 999))
  on.exit(options(old))

  if (is.null(table) || length(table) != 1 ||
      !table %in% wnba_stats_leaguedash_tables) {
    cli::cli_abort(c(
      "x" = "{.arg table} must be exactly one of the published cube tables.",
      "i" = "Valid choices: {.val {wnba_stats_leaguedash_tables}}."
    ))
  }

  loader <- parquet_from_url
  if (!is.null(dbConnection) && !is.null(tablename)) in_db <- TRUE else in_db <- FALSE

  if (isTRUE(seasons)) seasons <- 1997:most_recent_wnba_stats_season()

  stopifnot(is.numeric(seasons),
            seasons >= 1997,
            seasons <= most_recent_wnba_stats_season())

  urls <- paste0(
    "https://github.com/sportsdataverse/sportsdataverse-data/releases/download/",
    "wnba_stats_leaguedash/", table, "_", seasons, ".parquet"
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


# -----------------------------------------------------------------------------
# Manifest loaders -- thin wrappers around csv_from_url() that return the
# per-season manifest CSV (columns: season, row_count, generated_at_utc,
# source_endpoint) attached to each release tag, without downloading the
# full per-season RDS payloads. Useful for discovering which seasons are
# currently published before issuing a heavy `load_*()` call.
# -----------------------------------------------------------------------------

#' @rdname load_wnba_stats_coaches
#' @description `load_wnba_stats_rosters_manifest()` returns the per-season
#'   manifest CSV (`season`, `row_count`, `generated_at_utc`,
#'   `source_endpoint`) for the WNBA Stats rosters release tag without
#'   downloading any season's full data.
#' @export
load_wnba_stats_rosters_manifest <- function() {
  url <- paste0(
    "https://github.com/sportsdataverse/sportsdataverse-data/releases/download/",
    "wnba_stats_rosters/wnba_stats_rosters_in_data_repo.csv"
  )
  csv_from_url(url)
}

#' @rdname load_wnba_stats_coaches
#' @description `load_wnba_stats_coaches_manifest()` returns the per-season
#'   manifest CSV (`season`, `row_count`, `generated_at_utc`,
#'   `source_endpoint`) for the WNBA Stats coaches release tag without
#'   downloading any season's full data.
#' @export
load_wnba_stats_coaches_manifest <- function() {
  url <- paste0(
    "https://github.com/sportsdataverse/sportsdataverse-data/releases/download/",
    "wnba_stats_coaches/wnba_stats_coaches_in_data_repo.csv"
  )
  csv_from_url(url)
}

#' @rdname load_wnba_stats_coaches
#' @description `load_wnba_stats_player_stats_manifest()` returns the
#'   per-season manifest CSV (`season`, `row_count`, `generated_at_utc`,
#'   `source_endpoint`) for the WNBA Stats player season stats release tag
#'   without downloading any season's full data.
#' @export
load_wnba_stats_player_stats_manifest <- function() {
  url <- paste0(
    "https://github.com/sportsdataverse/sportsdataverse-data/releases/download/",
    "wnba_stats_player_season_stats/",
    "wnba_stats_player_season_stats_in_data_repo.csv"
  )
  csv_from_url(url)
}

#' @rdname load_wnba_stats_coaches
#' @description `load_wnba_stats_lineups_manifest()` returns the per-season
#'   manifest CSV (`season`, `row_count`, `generated_at_utc`,
#'   `source_endpoint`) for the WNBA Stats lineups release tag without
#'   downloading any season's full data.
#' @export
load_wnba_stats_lineups_manifest <- function() {
  url <- paste0(
    "https://github.com/sportsdataverse/sportsdataverse-data/releases/download/",
    "wnba_stats_lineups/wnba_stats_lineups_in_data_repo.csv"
  )
  csv_from_url(url)
}

#' @rdname load_wnba_stats_coaches
#' @description `load_wnba_stats_team_stats_manifest()` returns the per-season
#'   manifest CSV (`season`, `row_count`, `generated_at_utc`,
#'   `source_endpoint`) for the WNBA Stats team season stats release tag
#'   without downloading any season's full data.
#' @export
load_wnba_stats_team_stats_manifest <- function() {
  url <- paste0(
    "https://github.com/sportsdataverse/sportsdataverse-data/releases/download/",
    "wnba_stats_team_season_stats/",
    "wnba_stats_team_season_stats_in_data_repo.csv"
  )
  csv_from_url(url)
}

#' @rdname load_wnba_stats_coaches
#' @description `load_wnba_stats_standings_manifest()` returns the per-season
#'   manifest CSV (`season`, `row_count`, `generated_at_utc`,
#'   `source_endpoint`) for the WNBA Stats standings release tag without
#'   downloading any season's full data.
#' @export
load_wnba_stats_standings_manifest <- function() {
  url <- paste0(
    "https://github.com/sportsdataverse/sportsdataverse-data/releases/download/",
    "wnba_stats_standings/wnba_stats_standings_in_data_repo.csv"
  )
  csv_from_url(url)
}

#' @rdname load_wnba_stats_coaches
#' @description `load_wnba_stats_draft_manifest()` returns the per-season
#'   manifest CSV (`season`, `row_count`, `generated_at_utc`,
#'   `source_endpoint`) for the WNBA Stats draft release tag without
#'   downloading any season's full data.
#' @export
load_wnba_stats_draft_manifest <- function() {
  url <- paste0(
    "https://github.com/sportsdataverse/sportsdataverse-data/releases/download/",
    "wnba_stats_draft/wnba_stats_draft_in_data_repo.csv"
  )
  csv_from_url(url)
}

#' @rdname load_wnba_stats_coaches
#' @description `load_wnba_stats_shots_manifest()` returns the per-season
#'   manifest CSV (`season`, `row_count`, `generated_at_utc`,
#'   `source_endpoint`) for the WNBA Stats shots release tag without
#'   downloading any season's full data.
#' @export
load_wnba_stats_shots_manifest <- function() {
  url <- paste0(
    "https://github.com/sportsdataverse/sportsdataverse-data/releases/download/",
    "wnba_stats_shots/wnba_stats_shots_in_data_repo.csv"
  )
  csv_from_url(url)
}

#' @rdname load_wnba_stats_coaches
#' @description `load_wnba_stats_game_rosters_manifest()` returns the
#'   per-season manifest CSV (`season`, `row_count`, `generated_at_utc`,
#'   `source_endpoint`) for the WNBA Stats game rosters release tag without
#'   downloading any season's full data.
#' @export
load_wnba_stats_game_rosters_manifest <- function() {
  url <- paste0(
    "https://github.com/sportsdataverse/sportsdataverse-data/releases/download/",
    "wnba_stats_game_rosters/wnba_stats_game_rosters_in_data_repo.csv"
  )
  csv_from_url(url)
}

#' @rdname load_wnba_stats_coaches
#' @description `load_wnba_stats_officials_manifest()` returns the per-season
#'   manifest CSV (`season`, `row_count`, `generated_at_utc`,
#'   `source_endpoint`) for the WNBA Stats officials release tag without
#'   downloading any season's full data.
#' @export
load_wnba_stats_officials_manifest <- function() {
  url <- paste0(
    "https://github.com/sportsdataverse/sportsdataverse-data/releases/download/",
    "wnba_stats_officials/wnba_stats_officials_in_data_repo.csv"
  )
  csv_from_url(url)
}

#' @rdname load_wnba_stats_coaches
#' @description `load_wnba_stats_player_game_logs_manifest()` returns the
#'   per-season manifest CSV (`season`, `row_count`, `generated_at_utc`,
#'   `source_endpoint`) for the WNBA Stats player game logs release tag
#'   without downloading any season's full data.
#' @export
load_wnba_stats_player_game_logs_manifest <- function() {
  url <- paste0(
    "https://github.com/sportsdataverse/sportsdataverse-data/releases/download/",
    "wnba_stats_player_game_logs/wnba_stats_player_game_logs_in_data_repo.csv"
  )
  csv_from_url(url)
}

#' @rdname load_wnba_stats_coaches
#' @description `load_wnba_stats_schedule_manifest()` returns the per-season
#'   manifest CSV (`season`, `row_count`, `generated_at_utc`,
#'   `source_endpoint`) for the WNBA Stats schedules release tag without
#'   downloading any season's full data.
#' @export
load_wnba_stats_schedule_manifest <- function() {
  url <- paste0(
    "https://github.com/sportsdataverse/sportsdataverse-data/releases/download/",
    "wnba_stats_schedules/wnba_stats_schedules_in_data_repo.csv"
  )
  csv_from_url(url)
}

#' @rdname load_wnba_stats_coaches
#' @description `load_wnba_stats_pbp_manifest()` returns the per-season
#'   manifest CSV (`season`, `row_count`, `generated_at_utc`,
#'   `source_endpoint`) for the WNBA Stats play-by-play release tag without
#'   downloading any season's full data.
#' @export
load_wnba_stats_pbp_manifest <- function() {
  url <- paste0(
    "https://github.com/sportsdataverse/sportsdataverse-data/releases/download/",
    "wnba_stats_pbp/wnba_stats_pbp_in_data_repo.csv"
  )
  csv_from_url(url)
}


#' **Build/update wehoop WNBA Stats database**
#' @name update_wnba_stats_db
NULL

#' @title
#' **Update or create a wehoop WNBA Stats database**
#' @rdname update_wnba_stats_db
#' @description `update_wnba_stats_db()` writes one or more WNBA Stats API
#'   datasets into a database. Mirrors the WNBA / WBB `update_*_db()` shape
#'   but points at the `load_wnba_stats_*` family. Each dataset is written
#'   to its own table, named `wnba_stats_<dataset>`.
#' @details
#' Unlike `update_wnba_db()` / `update_wbb_db()`, there is no historical
#' "play-by-play table" default to preserve, so `datasets` is required.
#'
#' Valid `datasets` values:
#' `"schedule"`, `"player_game_logs"`, `"pbp"`, `"rosters"`, `"coaches"`,
#' `"player_stats"`, `"lineups"`, `"team_stats"`, `"standings"`,
#' `"draft"`, `"shots"`, `"game_rosters"`, `"officials"`, `"possessions"`.
#'
#' @param dbdir Directory in which the database is or shall be located.
#' @param dbname File name of an existing or desired SQLite database within
#'   `dbdir`.
#' @param datasets Character vector of dataset shortnames (see Details).
#' @param seasons Optional integer vector of seasons to load. Defaults to all
#'   available seasons (`seasons = TRUE`).
#' @param db_connection A `DBIConnection` object. When supplied, `dbdir` and
#'   `dbname` are ignored.
#' @return Invisibly returns `TRUE` on success.
#' @export
update_wnba_stats_db <- function(dbdir = ".",
                                 dbname = "wehoop_db",
                                 datasets = NULL,
                                 seasons = TRUE,
                                 db_connection = NULL) {
  old <- options(list(stringsAsFactors = FALSE, scipen = 999))
  on.exit(options(old))

  if (!is_installed("DBI") |
      (!is_installed("RSQLite") & is.null(db_connection))) {
    usethis::ui_stop("{my_time()} | Packages {usethis::ui_value('DBI')} and {usethis::ui_value('RSQLite')} required for database communication. Please install them.")
  }

  valid <- c("schedule", "player_game_logs", "pbp",
             "rosters", "coaches", "player_stats", "lineups",
             "team_stats", "standings", "draft", "shots",
             "game_rosters", "officials", "possessions")
  if (is.null(datasets) || length(datasets) == 0) {
    cli::cli_abort(c(
      "x" = "{.arg datasets} is required for {.fn update_wnba_stats_db}.",
      "i" = "Valid choices: {.val {valid}}."
    ))
  }
  bad <- setdiff(datasets, valid)
  if (length(bad) > 0) {
    cli::cli_abort(c(
      "x" = "Unknown {.arg datasets} value{?s}: {.val {bad}}.",
      "i" = "Valid choices: {.val {valid}}."
    ))
  }

  if (!dir.exists(dbdir) & is.null(db_connection)) {
    usethis::ui_oops("{my_time()} | Directory {usethis::ui_path(dbdir)} doesn't exist yet. Try creating...")
    dir.create(dbdir)
  }

  if (is.null(db_connection)) {
    connection <- DBI::dbConnect(RSQLite::SQLite(), file.path(dbdir, dbname))
  } else {
    connection <- db_connection
  }

  loader_map <- list(
    schedule         = load_wnba_stats_schedule,
    player_game_logs = load_wnba_stats_player_game_logs,
    pbp              = load_wnba_stats_pbp,
    rosters      = load_wnba_stats_rosters,
    coaches      = load_wnba_stats_coaches,
    player_stats = load_wnba_stats_player_stats,
    lineups      = load_wnba_stats_lineups,
    team_stats   = load_wnba_stats_team_stats,
    standings    = load_wnba_stats_standings,
    draft        = load_wnba_stats_draft,
    shots        = load_wnba_stats_shots,
    game_rosters = load_wnba_stats_game_rosters,
    officials    = load_wnba_stats_officials,
    possessions  = load_wnba_stats_possessions
  )

  for (ds in datasets) {
    ds_table <- paste0("wnba_stats_", ds)
    user_message(paste0("Writing wnba_stats dataset '", ds, "' to table '", ds_table, "'..."), "todo")
    tryCatch(
      loader_map[[ds]](seasons = seasons,
                       dbConnection = connection,
                       tablename = ds_table),
      error = function(e) {
        cli::cli_alert_danger("{Sys.time()}: dataset {.val {ds}} failed: {e$message}")
      }
    )
  }

  message_completed("Database update completed", in_builder = TRUE)
  usethis::ui_info("{my_time()} | Path to your db: {usethis::ui_path(DBI::dbGetInfo(connection)$dbname)}")
  if (is.null(db_connection)) DBI::dbDisconnect(connection)
  invisible(TRUE)
}


#' @title
#' **Load cleaned WNBA Stats API possessions from the data repo**
#' @rdname load_wnba_stats_coaches
#' @author Saiem Gilani
#' @description Loads possession-level data derived from the WNBA Stats API
#'   play-by-play -- one row per possession, with the on-court 5-man lineups
#'   for both teams, shooting/rebounding/turnover splits, and the possession
#'   start type. Backed by the `wehoop-wnba-stats-data` pipeline that reads
#'   raw JSONs from `wehoop-wnba-stats-raw` and publishes csv.gz/parquet/rds
#'   artifacts to the `wnba_stats_possessions` release tag.
#' @param seasons A vector of 4-digit years associated with given WNBA
#'   seasons. Published coverage runs 1997 through the most recent season,
#'   with no gaps. Pass `seasons = TRUE` for every published season. (Min:
#'   1997)
#' @param ... Additional arguments passed to an underlying function that writes
#'   the season data into a database.
#' @param dbConnection A `DBIConnection` object, as returned by [DBI::dbConnect()]
#' @param tablename The name of the data table within the database
#' @return Returns a `wehoop_data` tibble with one row per possession.
#'
#'    \if{html}{\tabular{lll}{
#'       col_name \tab types \tab description \cr
#'       game_id \tab character \tab Unique game identifier. \cr
#'       period \tab integer \tab Period of the game (1-2 halves pre-2016, 1-4 quarters 2016+). \cr
#'       possession_number \tab integer \tab Sequential possession number within the game. \cr
#'       offense_team_id \tab integer \tab Team identifier for the team on offense. \cr
#'       defense_team_id \tab integer \tab Team identifier for the team on defense. \cr
#'       start_order_index \tab integer \tab Play-by-play order index at the start of the possession. \cr
#'       end_order_index \tab integer \tab Play-by-play order index at the end of the possession. \cr
#'       start_seconds_remaining \tab numeric \tab Seconds remaining in the period at possession start. \cr
#'       end_seconds_remaining \tab numeric \tab Seconds remaining in the period at possession end. \cr
#'       points \tab integer \tab Points scored on the possession. \cr
#'       is_second_chance \tab logical \tab Whether the possession followed an offensive rebound. \cr
#'       number_in_period \tab integer \tab Sequential possession number within the period. \cr
#'       possession_start_type \tab character \tab How the possession started (e.g. 'OffDeadball', 'OffRebound'). \cr
#'       count_as_possession \tab logical \tab Whether the event counts as a scoreable possession. \cr
#'       fg2a \tab integer \tab 2-point field goal attempts by the lineup. \cr
#'       fg2m \tab integer \tab 2-point field goals made by the lineup. \cr
#'       fg3a \tab integer \tab Fg3a. \cr
#'       fg3m \tab integer \tab Fg3m. \cr
#'       fta \tab integer \tab Free throw attempts by the lineup. \cr
#'       ftm \tab integer \tab Free throws made by the lineup. \cr
#'       oreb \tab integer \tab Offensive rebounds. \cr
#'       dreb \tab integer \tab Defensive rebounds. \cr
#'       tov \tab integer \tab Turnovers. \cr
#'       off_player_1 \tab integer \tab Offensive lineup slot 1 player identifier. \cr
#'       off_player_2 \tab integer \tab Offensive lineup slot 2 player identifier. \cr
#'       off_player_3 \tab integer \tab Offensive lineup slot 3 player identifier. \cr
#'       off_player_4 \tab integer \tab Offensive lineup slot 4 player identifier. \cr
#'       off_player_5 \tab integer \tab Offensive lineup slot 5 player identifier. \cr
#'       def_player_1 \tab integer \tab Defensive lineup slot 1 player identifier. \cr
#'       def_player_2 \tab integer \tab Defensive lineup slot 2 player identifier. \cr
#'       def_player_3 \tab integer \tab Defensive lineup slot 3 player identifier. \cr
#'       def_player_4 \tab integer \tab Defensive lineup slot 4 player identifier. \cr
#'       def_player_5 \tab integer \tab Defensive lineup slot 5 player identifier. \cr
#'       season \tab integer \tab Season identifier (4-digit year). \cr
#'    }}
#'    \if{latex}{See the HTML help or pkgdown reference for the column table.}
#'
#' @export
#' @family WNBA Stats loader functions
#' @examples
#' \donttest{
#'   try(load_wnba_stats_possessions(seasons = most_recent_wnba_stats_season()))
#' }
load_wnba_stats_possessions <- function(seasons = most_recent_wnba_stats_season(),
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
    "wnba_stats_possessions/wnba_possessions_", seasons, ".rds"
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
