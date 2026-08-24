#' **Load wehoop WNBA Stats Rosters**
#' @name load_wnba_stats_rosters
NULL
#' @title
#' **Load cleaned WNBA Stats API season rosters from the data repo**
#' @rdname load_wnba_stats_rosters
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
    DBI::dbWriteTable(dbConnection, tablename, out, append = TRUE)
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
    DBI::dbWriteTable(dbConnection, tablename, out, append = TRUE)
    out <- NULL
  } else {
    class(out) <- c("wehoop_data","tbl_df","tbl","data.table","data.frame")
  }
  out
}


#' **Load wehoop WNBA Stats Player Season Stats**
#' @name load_wnba_stats_player_stats
NULL
#' @title
#' **Load cleaned WNBA Stats API player season stats from the data repo**
#' @rdname load_wnba_stats_player_stats
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
    DBI::dbWriteTable(dbConnection, tablename, out, append = TRUE)
    out <- NULL
  } else {
    class(out) <- c("wehoop_data","tbl_df","tbl","data.table","data.frame")
  }
  out
}


#' **Load wehoop WNBA Stats Lineups**
#' @name load_wnba_stats_lineups
NULL
#' @title
#' **Load cleaned WNBA Stats API season lineups from the data repo**
#' @rdname load_wnba_stats_lineups
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
    DBI::dbWriteTable(dbConnection, tablename, out, append = TRUE)
    out <- NULL
  } else {
    class(out) <- c("wehoop_data","tbl_df","tbl","data.table","data.frame")
  }
  out
}


#' **Load wehoop WNBA Stats Team Season Stats**
#' @name load_wnba_stats_team_stats
NULL
#' @title
#' **Load cleaned WNBA Stats API team season stats from the data repo**
#' @rdname load_wnba_stats_team_stats
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
#'    |col_name          |types     |description                                                                                                        |
#'    |:-----------------|:---------|:------------------------------------------------------------------------------------------------------------------|
#'    |season            |integer   |Season identifier (4-digit year or 'YYYY-YY' string).                                                              |
#'    |season_type       |character |Season type (1=pre-season, 2=regular season, 3=postseason, 4=off-season for ESPN; or string label for WNBA Stats). |
#'    |team_id           |character |Unique team identifier.                                                                                            |
#'    |team_name         |character |Full team display name (e.g. 'Las Vegas Aces').                                                                    |
#'    |team_abbreviation |character |Short team abbreviation (e.g. 'LAS').                                                                              |
#'    |gp                |integer   |Games played.                                                                                                      |
#'    |w                 |integer   |Wins.                                                                                                              |
#'    |l                 |integer   |Losses.                                                                                                            |
#'    |w_pct             |numeric   |Wins percentage (0-1 decimal).                                                                                     |
#'    |min               |numeric   |Minutes played.                                                                                                    |
#'    |fgm               |numeric   |Field goals made.                                                                                                  |
#'    |fga               |numeric   |Field goal attempts.                                                                                               |
#'    |fg_pct            |numeric   |Field goal percentage (0-1).                                                                                       |
#'    |fg3m              |numeric   |Three-point field goals made.                                                                                      |
#'    |fg3a              |numeric   |Three-point field goal attempts.                                                                                   |
#'    |fg3_pct           |numeric   |Three-point field goal percentage (0-1).                                                                           |
#'    |ftm               |numeric   |Free throws made.                                                                                                  |
#'    |fta               |numeric   |Free throw attempts.                                                                                               |
#'    |ft_pct            |numeric   |Free throw percentage (0-1).                                                                                       |
#'    |oreb              |numeric   |Offensive rebounds.                                                                                                |
#'    |dreb              |numeric   |Defensive rebounds.                                                                                                |
#'    |reb               |numeric   |Total rebounds.                                                                                                    |
#'    |ast               |numeric   |Assists.                                                                                                           |
#'    |tov               |numeric   |Turnovers.                                                                                                         |
#'    |stl               |numeric   |Steals.                                                                                                            |
#'    |blk               |numeric   |Blocks.                                                                                                            |
#'    |pf                |numeric   |Personal fouls.                                                                                                    |
#'    |pts               |numeric   |Points scored.                                                                                                     |
#'    |plus_minus        |numeric   |Plus/minus point differential while on court.                                                                      |
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
    DBI::dbWriteTable(dbConnection, tablename, out, append = TRUE)
    out <- NULL
  } else {
    class(out) <- c("wehoop_data","tbl_df","tbl","data.table","data.frame")
  }
  out
}


#' **Load wehoop WNBA Stats Standings**
#' @name load_wnba_stats_standings
NULL
#' @title
#' **Load cleaned WNBA Stats API season standings from the data repo**
#' @rdname load_wnba_stats_standings
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
#'    |col_name          |types     |description                                           |
#'    |:-----------------|:---------|:-----------------------------------------------------|
#'    |season            |integer   |Season identifier (4-digit year or 'YYYY-YY' string). |
#'    |season_id         |character |Unique season identifier.                             |
#'    |team_id           |character |Unique team identifier.                               |
#'    |team_city         |character |Team city or region (e.g. 'Las Vegas').               |
#'    |team_name         |character |Full team display name (e.g. 'Las Vegas Aces').       |
#'    |conference        |character |Filter players or teams by conference.                |
#'    |conference_record |character |Conference win-loss record.                           |
#'    |playoff_rank      |integer   |League/season rank for playoff.                       |
#'    |wins              |integer   |Total wins.                                           |
#'    |losses            |integer   |Total losses.                                         |
#'    |win_pct           |numeric   |Win percentage (0-1 decimal).                         |
#'    |home_record       |character |Home win-loss record.                                 |
#'    |road_record       |character |Win-loss record for road.                             |
#'    |l10               |character |L10.                                                  |
#'    |strcurrentstreak  |character |Strcurrentstreak.                                     |
#'    |points_pg         |numeric   |Points pg.                                            |
#'    |opp_points_pg     |numeric   |Opponent points pg.                                   |
#'    |diff_points_pg    |numeric   |Diff points pg.                                       |
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
    DBI::dbWriteTable(dbConnection, tablename, out, append = TRUE)
    out <- NULL
  } else {
    class(out) <- c("wehoop_data","tbl_df","tbl","data.table","data.frame")
  }
  out
}


#' **Load wehoop WNBA Stats Draft**
#' @name load_wnba_stats_draft
NULL
#' @title
#' **Load cleaned WNBA Stats API draft picks from the data repo**
#' @rdname load_wnba_stats_draft
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
#'    |col_name            |types     |description                                     |
#'    |:-------------------|:---------|:-----------------------------------------------|
#'    |person_id           |integer   |Unique player identifier (V3 endpoints).        |
#'    |player_name         |character |Player name.                                    |
#'    |season              |integer   |Season identifier (4-digit year).               |
#'    |round_number        |integer   |Numeric round.                                  |
#'    |round_pick          |integer   |Round pick.                                     |
#'    |overall_pick        |integer   |Overall pick.                                   |
#'    |draft_type          |character |Draft type ('Draft', 'Allocation' or 'Elite').  |
#'    |team_id             |integer   |Unique team identifier.                         |
#'    |team_city           |character |Team city or region (e.g. 'Las Vegas').         |
#'    |team_name           |character |Full team display name (e.g. 'Las Vegas Aces'). |
#'    |team_abbreviation   |character |Short team abbreviation (e.g. 'LAS').           |
#'    |organization        |character |Organization.                                   |
#'    |organization_type   |character |Organization type.                              |
#'    |player_profile_flag |integer   |Player profile flag.                            |
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
    DBI::dbWriteTable(dbConnection, tablename, out, append = TRUE)
    out <- NULL
  } else {
    class(out) <- c("wehoop_data","tbl_df","tbl","data.table","data.frame")
  }
  out
}


#' **Load wehoop WNBA Stats Shots**
#' @name load_wnba_stats_shots
NULL
#' @title
#' **Load cleaned WNBA Stats API shot events from the data repo**
#' @rdname load_wnba_stats_shots
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
#'    |col_name      |types     |description                                                    |
#'    |:-------------|:---------|:--------------------------------------------------------------|
#'    |game_id       |character |Unique game identifier.                                        |
#'    |season        |integer   |Season identifier (4-digit year).                              |
#'    |period        |integer   |Period of the game (1-4 quarters; 5+ for OT).                  |
#'    |clock         |character |Game clock remaining in the period (ISO 8601 duration).        |
#'    |team_id       |integer   |Unique team identifier for the shooting team.                  |
#'    |team_tricode  |character |Three-letter team code (e.g. 'LAS' / 'NYL').                   |
#'    |person_id     |integer   |Unique player identifier for the shooter.                      |
#'    |player_name   |character |Shooter's name.                                                |
#'    |action_type   |character |Action type label ('Made Shot' or 'Missed Shot').              |
#'    |sub_type      |character |Shot sub type (e.g. 'Jump Shot', 'Layup', 'DUNK').             |
#'    |shot_result   |character |Shot result, 'Made' or 'Missed'.                               |
#'    |shot_value    |integer   |Points the shot was worth (2 or 3).                            |
#'    |shot_distance |integer   |Shot distance from the basket, in feet.                        |
#'    |x_legacy      |integer   |Legacy X coordinate on the court (0 = basket center).          |
#'    |y_legacy      |integer   |Legacy Y coordinate on the court (baseline at 0).              |
#'    |description   |character |Text description of the play.                                  |
#'    |score_home    |character |Home team score after the play.                                |
#'    |score_away    |character |Away team score after the play.                                |
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
    DBI::dbWriteTable(dbConnection, tablename, out, append = TRUE)
    out <- NULL
  } else {
    class(out) <- c("wehoop_data","tbl_df","tbl","data.table","data.frame")
  }
  out
}


#' **Load wehoop WNBA Stats Game Rosters**
#' @name load_wnba_stats_game_rosters
NULL
#' @title
#' **Load cleaned WNBA Stats API per-game rosters from the data repo**
#' @rdname load_wnba_stats_game_rosters
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
#'    |col_name          |types     |description                                     |
#'    |:-----------------|:---------|:-----------------------------------------------|
#'    |player_id         |integer   |Unique player identifier.                       |
#'    |first_name        |character |Player's first name.                            |
#'    |last_name         |character |Player's last name.                             |
#'    |jersey_num        |character |Jersey number worn by the player.               |
#'    |team_id           |integer   |Unique team identifier.                         |
#'    |team_city         |character |Team city or region (e.g. 'Las Vegas').         |
#'    |team_name         |character |Full team display name (e.g. 'Las Vegas Aces'). |
#'    |team_abbreviation |character |Short team abbreviation (e.g. 'LAS').           |
#'    |season            |integer   |Season identifier (4-digit year).               |
#'    |game_id           |character |Unique game identifier.                         |
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
    DBI::dbWriteTable(dbConnection, tablename, out, append = TRUE)
    out <- NULL
  } else {
    class(out) <- c("wehoop_data","tbl_df","tbl","data.table","data.frame")
  }
  out
}


#' **Load wehoop WNBA Stats Officials**
#' @name load_wnba_stats_officials
NULL
#' @title
#' **Load cleaned WNBA Stats API game officials from the data repo**
#' @rdname load_wnba_stats_officials
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
    DBI::dbWriteTable(dbConnection, tablename, out, append = TRUE)
    out <- NULL
  } else {
    class(out) <- c("wehoop_data","tbl_df","tbl","data.table","data.frame")
  }
  out
}


#' **Load wehoop WNBA Stats Player Game Logs**
#' @name load_wnba_stats_player_game_logs
NULL
#' @title
#' **Load cleaned WNBA Stats API per-player per-game logs from the data repo**
#' @rdname load_wnba_stats_player_game_logs
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
    DBI::dbWriteTable(dbConnection, tablename, out, append = TRUE)
    out <- NULL
  } else {
    class(out) <- c("wehoop_data","tbl_df","tbl","data.table","data.frame")
  }
  out
}


#' **Load wehoop WNBA Stats Schedules**
#' @name load_wnba_stats_schedule
NULL
#' @title
#' **Load cleaned WNBA Stats API season schedules from the data repo**
#' @rdname load_wnba_stats_schedule
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
#'    |col_name               |types     |description                                                       |
#'    |:----------------------|:---------|:-----------------------------------------------------------------|
#'    |game_id                |character |Unique game identifier.                                           |
#'    |season                 |integer   |Season identifier (4-digit year).                                 |
#'    |season_type            |character |Portion of the season: `regular-season` or `playoffs`.            |
#'    |game_date              |character |Date the game was played, as an ISO `YYYY-MM-DD` string.          |
#'    |matchup                |character |Matchup string, home side first (e.g. `WAS vs. NYL`).             |
#'    |home_team_id           |integer   |Unique WNBA Stats team identifier for the home team.              |
#'    |home_team_abbreviation |character |Home team abbreviation.                                           |
#'    |home_team_name         |character |Home team full name.                                              |
#'    |home_pts               |integer   |Points scored by the home team.                                   |
#'    |home_wl                |character |Home team result, `W` or `L`.                                     |
#'    |away_team_id           |integer   |Unique WNBA Stats team identifier for the away team.              |
#'    |away_team_abbreviation |character |Away team abbreviation.                                           |
#'    |away_team_name         |character |Away team full name.                                              |
#'    |away_pts               |integer   |Points scored by the away team.                                   |
#'    |away_wl                |character |Away team result, `W` or `L`.                                     |
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
    DBI::dbWriteTable(dbConnection, tablename, out, append = TRUE)
    out <- NULL
  } else {
    class(out) <- c("wehoop_data","tbl_df","tbl","data.table","data.frame")
  }
  out
}


#' **Load wehoop WNBA Stats Play-by-Play**
#' @name load_wnba_stats_pbp
NULL
#' @title
#' **Load cleaned WNBA Stats API play-by-play from the data repo**
#' @rdname load_wnba_stats_pbp
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
    DBI::dbWriteTable(dbConnection, tablename, out, append = TRUE)
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

#' @rdname load_wnba_stats_rosters
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

#' @rdname load_wnba_stats_player_stats
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

#' @rdname load_wnba_stats_lineups
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

#' @rdname load_wnba_stats_team_stats
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

#' @rdname load_wnba_stats_standings
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

#' @rdname load_wnba_stats_draft
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

#' @rdname load_wnba_stats_shots
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

#' @rdname load_wnba_stats_game_rosters
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

#' @rdname load_wnba_stats_officials
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

#' @rdname load_wnba_stats_player_game_logs
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

#' @rdname load_wnba_stats_schedule
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

#' @rdname load_wnba_stats_pbp
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
#' `"draft"`, `"shots"`, `"game_rosters"`, `"officials"`.
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
             "game_rosters", "officials")
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
    officials    = load_wnba_stats_officials
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


#' **Load cleaned WNBA Stats API possessions from the data repo**
#' @name load_wnba_stats_possessions
NULL
#' @title
#' **Load cleaned WNBA Stats API possessions from the data repo**
#' @rdname load_wnba_stats_possessions
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
#'    |col_name                |types     |description                                                    |
#'    |:----------------------|:--------|:-------------------------------------------------------------|
#'    |game_id                 |character |Unique game identifier.                                        |
#'    |period                  |integer   |Period of the game (1-2 halves pre-2016, 1-4 quarters 2016+).  |
#'    |possession_number       |integer   |Sequential possession number within the game.                  |
#'    |offense_team_id         |integer   |Team identifier for the team on offense.                       |
#'    |defense_team_id         |integer   |Team identifier for the team on defense.                       |
#'    |start_order_index       |integer   |Play-by-play order index at the start of the possession.       |
#'    |end_order_index         |integer   |Play-by-play order index at the end of the possession.         |
#'    |start_seconds_remaining |numeric   |Seconds remaining in the period at possession start.           |
#'    |end_seconds_remaining   |numeric   |Seconds remaining in the period at possession end.             |
#'    |points                  |integer   |Points scored on the possession.                               |
#'    |is_second_chance        |logical   |Whether the possession followed an offensive rebound.          |
#'    |number_in_period        |integer   |Sequential possession number within the period.                |
#'    |possession_start_type   |character |How the possession started (e.g. 'OffDeadball', 'OffRebound'). |
#'    |count_as_possession     |logical   |Whether the event counts as a scoreable possession.            |
#'    |fg2a                    |integer   |2-point field goal attempts by the lineup.                     |
#'    |fg2m                    |integer   |2-point field goals made by the lineup.                        |
#'    |fg3a                    |integer   |Fg3a.                                                          |
#'    |fg3m                    |integer   |Fg3m.                                                          |
#'    |fta                     |integer   |Free throw attempts by the lineup.                             |
#'    |ftm                     |integer   |Free throws made by the lineup.                                |
#'    |oreb                    |integer   |Offensive rebounds.                                            |
#'    |dreb                    |integer   |Defensive rebounds.                                            |
#'    |tov                     |integer   |Turnovers.                                                     |
#'    |off_player_1            |integer   |Offensive lineup slot 1 player identifier.                     |
#'    |off_player_2            |integer   |Offensive lineup slot 2 player identifier.                     |
#'    |off_player_3            |integer   |Offensive lineup slot 3 player identifier.                     |
#'    |off_player_4            |integer   |Offensive lineup slot 4 player identifier.                     |
#'    |off_player_5            |integer   |Offensive lineup slot 5 player identifier.                     |
#'    |def_player_1            |integer   |Defensive lineup slot 1 player identifier.                     |
#'    |def_player_2            |integer   |Defensive lineup slot 2 player identifier.                     |
#'    |def_player_3            |integer   |Defensive lineup slot 3 player identifier.                     |
#'    |def_player_4            |integer   |Defensive lineup slot 4 player identifier.                     |
#'    |def_player_5            |integer   |Defensive lineup slot 5 player identifier.                     |
#'    |season                  |integer   |Season identifier (4-digit year).                              |
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
            seasons >= 1997,
            seasons <= most_recent_wnba_stats_season())

  urls <- paste0(
    "https://github.com/sportsdataverse/sportsdataverse-data/releases/download/",
    "wnba_stats_possessions/wnba_possessions_", seasons, ".rds"
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
