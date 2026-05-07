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
#' @description Loads season-level WNBA player statistics scraped from the
#'   WNBA Stats API. Backed by the `wehoop-wnba-stats-data` pipeline that
#'   reads raw JSONs from `wehoop-wnba-stats-raw` and publishes parquet/rds
#'   artifacts to the `wnba_stats_player_season_stats` release tag.
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
    "wnba_stats_player_season_stats/player_season_stats_", seasons, ".rds"
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


#' **Load wehoop WNBA Stats Lineups**
#' @name load_wnba_stats_lineups
NULL
#' @title
#' **Load cleaned WNBA Stats API season lineups from the data repo**
#' @rdname load_wnba_stats_lineups
#' @description Loads season-level WNBA lineup statistics scraped from the
#'   WNBA Stats API (`leaguedashlineups`-style outputs). Backed by the
#'   `wehoop-wnba-stats-data` pipeline that reads raw JSONs from
#'   `wehoop-wnba-stats-raw` and publishes parquet/rds artifacts to the
#'   `wnba_stats_lineups` release tag.
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
    "wnba_stats_lineups/lineups_", seasons, ".rds"
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


#' **Load wehoop WNBA Stats Team Season Stats**
#' @name load_wnba_stats_team_stats
NULL
#' @title
#' **Load cleaned WNBA Stats API team season stats from the data repo**
#' @rdname load_wnba_stats_team_stats
#' @description Loads season-level team statistics scraped from the WNBA
#'   Stats API (`leaguedashteamstats`-style outputs). Backed by the
#'   `wehoop-wnba-stats-data` pipeline that reads raw JSONs from
#'   `wehoop-wnba-stats-raw` and publishes parquet/rds artifacts to the
#'   `wnba_stats_team_season_stats` release tag.
#' @param seasons A vector of 4-digit years associated with given WNBA seasons.
#'   (Min: 1997)
#' @param ... Additional arguments passed to an underlying function that writes
#'   the season data into a database.
#' @param dbConnection A `DBIConnection` object, as returned by [DBI::dbConnect()]
#' @param tablename The name of the team season stats table within the database
#' @return Returns a `wehoop_data` tibble of team season stats.
#'
#'    |col_name        |types     |
#'    |:---------------|:---------|
#'    |season          |integer   |
#'    |season_type     |character |
#'    |team_id         |character |
#'    |team_name       |character |
#'    |team_abbreviation|character|
#'    |gp              |integer   |
#'    |w               |integer   |
#'    |l               |integer   |
#'    |w_pct           |numeric   |
#'    |min             |numeric   |
#'    |fgm             |numeric   |
#'    |fga             |numeric   |
#'    |fg_pct          |numeric   |
#'    |fg3m            |numeric   |
#'    |fg3a            |numeric   |
#'    |fg3_pct         |numeric   |
#'    |ftm             |numeric   |
#'    |fta             |numeric   |
#'    |ft_pct          |numeric   |
#'    |oreb            |numeric   |
#'    |dreb            |numeric   |
#'    |reb             |numeric   |
#'    |ast             |numeric   |
#'    |tov             |numeric   |
#'    |stl             |numeric   |
#'    |blk             |numeric   |
#'    |pf              |numeric   |
#'    |pts             |numeric   |
#'    |plus_minus      |numeric   |
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
    "wnba_stats_team_season_stats/team_season_stats_", seasons, ".rds"
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


#' **Load wehoop WNBA Stats Standings**
#' @name load_wnba_stats_standings
NULL
#' @title
#' **Load cleaned WNBA Stats API season standings from the data repo**
#' @rdname load_wnba_stats_standings
#' @description Loads season-level WNBA standings scraped from the WNBA Stats
#'   API (`leaguestandingsv3`-style outputs). One row per team-season. Backed
#'   by the `wehoop-wnba-stats-data` pipeline that reads raw JSONs from
#'   `wehoop-wnba-stats-raw` and publishes parquet/rds artifacts to the
#'   `wnba_stats_standings` release tag.
#' @param seasons A vector of 4-digit years associated with given WNBA seasons.
#'   (Min: 1997)
#' @param ... Additional arguments passed to an underlying function that writes
#'   the season data into a database.
#' @param dbConnection A `DBIConnection` object, as returned by [DBI::dbConnect()]
#' @param tablename The name of the standings data table within the database
#' @return Returns a `wehoop_data` tibble of team standings.
#'
#'    |col_name        |types     |
#'    |:---------------|:---------|
#'    |season          |integer   |
#'    |season_id       |character |
#'    |team_id         |character |
#'    |team_city       |character |
#'    |team_name       |character |
#'    |conference      |character |
#'    |conference_record|character|
#'    |playoff_rank    |integer   |
#'    |wins            |integer   |
#'    |losses          |integer   |
#'    |win_pct         |numeric   |
#'    |home_record     |character |
#'    |road_record     |character |
#'    |l10             |character |
#'    |strcurrentstreak|character |
#'    |points_pg       |numeric   |
#'    |opp_points_pg   |numeric   |
#'    |diff_points_pg  |numeric   |
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
    "wnba_stats_standings/standings_", seasons, ".rds"
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
#'    |col_name        |types     |
#'    |:---------------|:---------|
#'    |season          |integer   |
#'    |person_id       |character |
#'    |player_name     |character |
#'    |round_number    |integer   |
#'    |round_pick      |integer   |
#'    |overall_pick    |integer   |
#'    |team_id         |character |
#'    |team_city       |character |
#'    |team_name       |character |
#'    |team_abbreviation|character|
#'    |organization    |character |
#'    |organization_type|character|
#'    |player_profile_flag|character|
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
#'    |col_name           |types     |
#'    |:------------------|:---------|
#'    |season             |integer   |
#'    |game_id            |character |
#'    |game_event_id      |character |
#'    |player_id          |character |
#'    |player_name        |character |
#'    |team_id            |character |
#'    |team_name          |character |
#'    |period             |integer   |
#'    |minutes_remaining  |integer   |
#'    |seconds_remaining  |integer   |
#'    |event_type         |character |
#'    |action_type        |character |
#'    |shot_type          |character |
#'    |shot_zone_basic    |character |
#'    |shot_zone_area     |character |
#'    |shot_zone_range    |character |
#'    |shot_distance      |numeric   |
#'    |loc_x              |numeric   |
#'    |loc_y              |numeric   |
#'    |coordinate_x       |numeric   |
#'    |coordinate_y       |numeric   |
#'    |shot_attempted_flag|integer   |
#'    |shot_made_flag     |integer   |
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
#'    |col_name        |types     |
#'    |:---------------|:---------|
#'    |season          |integer   |
#'    |game_id         |character |
#'    |team_id         |character |
#'    |team_city       |character |
#'    |team_name       |character |
#'    |team_tricode    |character |
#'    |athlete_id      |character |
#'    |first_name      |character |
#'    |family_name     |character |
#'    |name_i          |character |
#'    |player_slug     |character |
#'    |jersey_num      |character |
#'    |position        |character |
#'    |starter         |logical   |
#'    |did_not_play    |logical   |
#'    |status          |character |
#'    |comment         |character |
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
#'    |col_name        |types     |
#'    |:---------------|:---------|
#'    |season          |integer   |
#'    |game_id         |character |
#'    |official_id     |character |
#'    |display_name    |character |
#'    |first_name      |character |
#'    |last_name       |character |
#'    |jersey_num      |character |
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
#' `"rosters"`, `"coaches"`, `"player_stats"`, `"lineups"`, `"team_stats"`,
#' `"standings"`, `"draft"`, `"shots"`, `"game_rosters"`, `"officials"`.
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

  valid <- c("rosters", "coaches", "player_stats", "lineups",
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
