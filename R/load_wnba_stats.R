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
#'   (Min: 1997)
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
#'   (Min: 1997)
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
#'   the cube's `player_stats_*` / `player_master` assets directly for the
#'   full surface.
#' @param seasons A vector of 4-digit years associated with given WNBA seasons.
#'   (Min: 1997)
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
#'   `lineups_*` / `lineups_master` assets directly for the full surface.
#' @param seasons A vector of 4-digit years associated with given WNBA seasons.
#'   (Min: 1997)
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
#'   `team_master` assets directly for the full surface.
#' @param seasons A vector of 4-digit years associated with given WNBA seasons.
#'   (Min: 1997)
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
#'   (Min: 1997)
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
#'   seasons. (Min: 1997)
#' @param ... Additional arguments passed to an underlying function that writes
#'   the season data into a database.
#' @param dbConnection A `DBIConnection` object, as returned by [DBI::dbConnect()]
#' @param tablename The name of the draft data table within the database
#' @return Returns a `wehoop_data` tibble of WNBA draft picks.
#'
#'    |col_name            |types     |description                                           |
#'    |:-------------------|:---------|:-----------------------------------------------------|
#'    |season              |integer   |Season identifier (4-digit year or 'YYYY-YY' string). |
#'    |person_id           |character |Unique player identifier (V3 endpoints).              |
#'    |player_name         |character |Player name.                                          |
#'    |round_number        |integer   |Numeric round.                                        |
#'    |round_pick          |integer   |Round pick.                                           |
#'    |overall_pick        |integer   |Overall pick.                                         |
#'    |team_id             |character |Unique team identifier.                               |
#'    |team_city           |character |Team city or region (e.g. 'Las Vegas').               |
#'    |team_name           |character |Full team display name (e.g. 'Las Vegas Aces').       |
#'    |team_abbreviation   |character |Short team abbreviation (e.g. 'LAS').                 |
#'    |organization        |character |Organization.                                         |
#'    |organization_type   |character |Organization type.                                    |
#'    |player_profile_flag |character |Player profile flag.                                  |
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
#' @description Loads shot events scraped from the WNBA Stats API
#'   (`shotchartdetail`-style outputs). One row per shot attempt with court
#'   coordinates, shot type, distance, and made/missed flag. Backed by the
#'   `wehoop-wnba-stats-data` pipeline that reads raw JSONs from
#'   `wehoop-wnba-stats-raw` and publishes parquet/rds artifacts to the
#'   `wnba_stats_shots` release tag.
#' @param seasons A vector of 4-digit years associated with given WNBA seasons.
#'   (Min: 1997)
#' @param ... Additional arguments passed to an underlying function that writes
#'   the season data into a database.
#' @param dbConnection A `DBIConnection` object, as returned by [DBI::dbConnect()]
#' @param tablename The name of the shots data table within the database
#' @return Returns a `wehoop_data` tibble with one row per shot attempt.
#'
#'    |col_name            |types     |description                                                           |
#'    |:-------------------|:---------|:---------------------------------------------------------------------|
#'    |season              |integer   |Season identifier (4-digit year or 'YYYY-YY' string).                 |
#'    |game_id             |character |Unique game identifier.                                               |
#'    |game_event_id       |character |Unique identifier for game event.                                     |
#'    |player_id           |character |Unique player identifier.                                             |
#'    |player_name         |character |Player name.                                                          |
#'    |team_id             |character |Unique team identifier.                                               |
#'    |team_name           |character |Full team display name (e.g. 'Las Vegas Aces').                       |
#'    |period              |integer   |Period of the game (1-4 quarters; 5+ for OT).                         |
#'    |minutes_remaining   |integer   |Minutes remaining.                                                    |
#'    |seconds_remaining   |integer   |Seconds remaining in the period.                                      |
#'    |event_type          |character |Event / play type code (V2 PBP).                                      |
#'    |action_type         |character |Action type label (e.g. 'Made Shot', 'Substitution').                 |
#'    |shot_type           |character |Shot type label (e.g. 'Jump Shot', 'Layup').                          |
#'    |shot_zone_basic     |character |Shot zone (e.g. 'Restricted Area', 'Mid-Range', 'Above the Break 3'). |
#'    |shot_zone_area      |character |Shot zone area ('Left Side', 'Right Side', 'Center').                 |
#'    |shot_zone_range     |character |Shot zone range ('Less Than 8 ft.', '8-16 ft.', '16-24 ft.', etc.).   |
#'    |shot_distance       |numeric   |Shot distance from the basket, in feet.                               |
#'    |loc_x               |numeric   |X coordinate on the court (units of inches; 0 = basket center).       |
#'    |loc_y               |numeric   |Y coordinate on the court (units of inches; baseline at 0).           |
#'    |coordinate_x        |numeric   |X coordinate on the court (half-court layout).                        |
#'    |coordinate_y        |numeric   |Y coordinate on the court (half-court layout).                        |
#'    |shot_attempted_flag |integer   |1 if a shot was attempted on this event.                              |
#'    |shot_made_flag      |integer   |1 if the shot was made; 0 if missed.                                  |
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
#' @description Loads per-game rosters scraped from the WNBA Stats API
#'   (`boxscoretraditionalv3`-style outputs). One row per athlete-team-game
#'   triple with jersey, position, starter flag, and DNP status. Backed by
#'   the `wehoop-wnba-stats-data` pipeline that reads raw JSONs from
#'   `wehoop-wnba-stats-raw` and publishes parquet/rds artifacts to the
#'   `wnba_stats_game_rosters` release tag.
#' @param seasons A vector of 4-digit years associated with given WNBA seasons.
#'   (Min: 1997)
#' @param ... Additional arguments passed to an underlying function that writes
#'   the season data into a database.
#' @param dbConnection A `DBIConnection` object, as returned by [DBI::dbConnect()]
#' @param tablename The name of the game rosters data table within the database
#' @return Returns a `wehoop_data` tibble with one row per athlete-team-game.
#'
#'    |col_name     |types     |description                                                                  |
#'    |:------------|:---------|:----------------------------------------------------------------------------|
#'    |season       |integer   |Season identifier (4-digit year or 'YYYY-YY' string).                        |
#'    |game_id      |character |Unique game identifier.                                                      |
#'    |team_id      |character |Unique team identifier.                                                      |
#'    |team_city    |character |Team city or region (e.g. 'Las Vegas').                                      |
#'    |team_name    |character |Full team display name (e.g. 'Las Vegas Aces').                              |
#'    |team_tricode |character |Three-letter team code (e.g. 'LAS' / 'NYL').                                 |
#'    |athlete_id   |character |Unique athlete identifier (ESPN).                                            |
#'    |first_name   |character |Player's first name.                                                         |
#'    |family_name  |character |Player's family / last name.                                                 |
#'    |name_i       |character |Initialed name (e.g. 'A. Wilson').                                           |
#'    |player_slug  |character |URL-safe player identifier.                                                  |
#'    |jersey_num   |character |Jersey number worn by the player.                                            |
#'    |position     |character |Listed roster position (G, F, C, etc.).                                      |
#'    |starter      |logical   |TRUE if the player was in the starting lineup; FALSE otherwise.              |
#'    |did_not_play |logical   |TRUE if the player did not appear in the game.                               |
#'    |status       |character |Status label.                                                                |
#'    |comment      |character |Player status / inactive reason (e.g. 'DNP - Coach's Decision', 'Inactive'). |
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
#'   (Min: 1997)
#' @param ... Additional arguments passed to an underlying function that writes
#'   the season data into a database.
#' @param dbConnection A `DBIConnection` object, as returned by [DBI::dbConnect()]
#' @param tablename The name of the officials data table within the database
#' @return Returns a `wehoop_data` tibble with one row per official-game pair.
#'
#'    |col_name     |types     |description                                           |
#'    |:------------|:---------|:-----------------------------------------------------|
#'    |season       |integer   |Season identifier (4-digit year or 'YYYY-YY' string). |
#'    |game_id      |character |Unique game identifier.                               |
#'    |official_id  |character |Unique official / referee identifier.                 |
#'    |display_name |character |Display name.                                         |
#'    |first_name   |character |Player's first name.                                  |
#'    |last_name    |character |Player's last name.                                   |
#'    |jersey_num   |character |Jersey number worn by the player.                     |
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

  if (isTRUE(seasons)) seasons <- 1997:most_recent_wnba_stats_season()

  stopifnot(is.numeric(seasons),
            seasons >= 1997,
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
#'   (Min: 1997)
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
#'   (Min: 1997)
#' @param ... Additional arguments passed to an underlying function that writes
#'   the season data into a database.
#' @param dbConnection A `DBIConnection` object, as returned by [DBI::dbConnect()]
#' @param tablename The name of the schedules data table within the database
#' @return Returns a `wehoop_data` tibble of per-season schedules.
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
    "wnba_stats_schedules/wnba_stats_schedule_", seasons, ".rds"
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
#' @description Loads season-level WNBA play-by-play (V3 with on-court
#'   five-on-each-side player IDs, supplied by [wnba_pbp()] in the upstream
#'   compile script). Backed by the `wehoop-wnba-stats-data` pipeline that
#'   publishes parquet/rds artifacts to the `wnba_stats_pbp` release tag.
#' @param seasons A vector of 4-digit years associated with given WNBA seasons.
#'   (Min: 1997)
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
    "wnba_stats_pbp/play_by_play_", seasons, ".rds"
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
