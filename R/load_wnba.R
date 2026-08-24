#' @title 
#' **Load cleaned WNBA play-by-play from the data repo**
#' @rdname load_wnba_draft
#' @description helper that loads multiple seasons from the data repo either into memory
#' or writes it into a db using some forwarded arguments in the dots
#' @param seasons A vector of 4-digit years associated with given WNBA seasons. (Min: 2002)
#' @param ... Additional arguments passed to an underlying function that writes
#' the season data into a database (used by `update_wnba_db()`).
#' @param dbConnection A `DBIConnection` object, as returned by [DBI::dbConnect()]
#' @param tablename The name of the play by play data table within the database
#' @return A dataframe with 42 columns
#'
#' \if{html}{\tabular{ll}{
#'    col_name \tab description \cr
#'    shooting_play \tab Logical value (TRUE/FALSE) indicating whether the play was a shooting play \cr
#'    sequence_number \tab Sequence number is supposed to represent a shot-possession, examine the last two numbers to see if there are multiple events that occur within the same shot-possession. A shot-possession is basically any sequence of plays until there is a shot, change in possession, and probably things like technical fouls and the like. So as soon as a shot goes up, a new sequence starts regardless, even if the shooting team retains possession via offensive or deadball rebound. The first portion of the number is usually time related (i.e. the numeric representation of when the sequence started, from a seconds remaining in the period perspective or so) \cr
#'    period_display_value \tab Long form of period (1st quarter, 2nd Quarter, OT, etc.) \cr
#'    period_number \tab The numeric period of play in the game \cr
#'    home_score \tab Home score at the time of the play \cr
#'    coordinate_x \tab The entire scale is a rectangle of size 25x47, intended as a half-court representation of the basketball court (i.e. on the side of the offense), with each coordinate unit representing a foot. It appears that the basket is roughly represented as the (25, 0) point. This is a nonsensical definition when considering that the basket overhangs the court, with the backboard aligned 48 inches from the baseline, then the center of the hoop being roughly 11 inches from there. This is an idiosyncracy of either sensor placement or software and data entry. Use your best judgement in making your charts, I think you will find that making some translations will be helpful. \cr
#'    coordinate_y \tab  \cr
#'    scoring_play \tab Logical value (TRUE/FALSE) indicating whether the play was a play on which the offense scored \cr
#'    clock_display_value \tab Time left within the period \cr
#'    team_id \tab Unique team identification number for the offensive team \cr
#'    type_id \tab Unique play type identifcation number \cr
#'    type_text \tab Play type text description, passed through verbatim from ESPN. Note: ESPN labels the free-throw play TYPE "MadeFreeThrow" for made AND missed free throws; filter makes vs. misses with \code{scoring_play} (TRUE = made), not \code{type_text} \cr
#'    away_score \tab Away score at the time of the play \cr
#'    id \tab Unique play identifcation number \cr
#'    text \tab Text description of the play \cr
#'    score_value \tab The points value of the shot taken (1 / 2 / 3). Set to the attempt's value even on misses (a missed free throw still carries 1); use \code{scoring_play} to identify points actually scored \cr
#'    participants_0_athlete_id \tab Unique player identification number \cr
#'    participants_1_athlete_id \tab Unique player identification number \cr
#'    participants_2_athlete_id \tab Unique player identification number \cr
#'    type_abbreviation \tab Play type abbreviation \cr
#'    season \tab Season of the game \cr
#'    season_type \tab Season type of the game, 1 is pre-season, 2 is regular season, 3 is post-season, 4 is off-season \cr
#'    away_team_id \tab Unique away team identification number \cr
#'    away_team_name \tab Away team name \cr
#'    away_team_mascot \tab Away team mascot \cr
#'    away_team_abbrev \tab Text abbreviation for the away team \cr
#'    away_team_name_alt \tab Alternate versions of the away team abbreviation \cr
#'    home_team_id \tab Unique home team identification number \cr
#'    home_team_name \tab home team name \cr
#'    home_team_mascot \tab home team mascot \cr
#'    home_team_abbrev \tab Text abbreviation for the home team \cr
#'    home_team_name_alt \tab Alternate versions of the home team abbreviation \cr
#'    home_team_spread \tab The game spread with respect to the home team \cr
#'    game_spread \tab Game spread in (-X Team) format. There are almost none, I would recommend not trusting any of these three columns \cr
#'    home_favorite \tab Logical (TRUE/FALSE) indicating whether the home team is favored \cr
#'    clock_minutes \tab Clock minutes split from seconds for developer convenience \cr
#'    clock_seconds \tab Clock seconds split from minutes for developer convenience \cr
#'    half \tab Half of the game \cr
#'    lag_half \tab A lag column on the half \cr
#'    lead_half \tab A lead column on the half \cr
#'    game_play_number \tab Game play number \cr
#'    game_id \tab Unique identifier for the game event \cr
#' }}
#' \if{latex}{See the HTML help or pkgdown reference for the column table.}
#'
#' @export
#' @examples
#' \donttest{
#'   try(load_wnba_pbp())
#' }
load_wnba_pbp <- function(seasons = most_recent_wnba_season(), ...,
                         dbConnection = NULL, tablename = NULL) {
  old <- options(list(stringsAsFactors = FALSE, scipen = 999))
  on.exit(options(old))
  dots <- rlang::dots_list(...)
  
  loader <- rds_from_url
  
  if (!is.null(dbConnection) && !is.null(tablename)) in_db <- TRUE else in_db <- FALSE
  
  if (isTRUE(seasons)) seasons <- 2002:most_recent_wnba_season()
  
  stopifnot(is.numeric(seasons),
            seasons >= 2002,
            seasons <= most_recent_wnba_season())
  
  urls <- paste0("https://github.com/sportsdataverse/sportsdataverse-data/releases/download/espn_wnba_pbp/play_by_play_", seasons, ".rds")
  
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
#' **Load cleaned WNBA team box scores from the data repo**
#' @rdname load_wnba_draft
#' @description helper that loads multiple seasons from the data repo either into memory
#' or writes it into a db using some forwarded arguments in the dots
#' @param seasons A vector of 4-digit years associated with given WNBA seasons. (Min: 2003)
#' @param ... Additional arguments passed to an underlying function that writes
#' the season data into a database (used by `update_wnba_db()`).
#' @param dbConnection A `DBIConnection` object, as returned by [DBI::dbConnect()]
#' @param tablename The name of the team box data table within the database
#' @return Returns a tibble
#' @export
#' @examples
#' \donttest{
#'   try(load_wnba_team_box())
#' }
load_wnba_team_box <- function(seasons = most_recent_wnba_season(), ...,
                              dbConnection = NULL, tablename = NULL) {
  old <- options(list(stringsAsFactors = FALSE, scipen = 999))
  on.exit(options(old))
  dots <- rlang::dots_list(...)
  
  loader <- rds_from_url
  if (!is.null(dbConnection) && !is.null(tablename)) in_db <- TRUE else in_db <- FALSE
  
  if (isTRUE(seasons)) seasons <- 2003:most_recent_wnba_season()
  
  stopifnot(is.numeric(seasons),
            seasons >= 2003,
            seasons <= most_recent_wnba_season())
  
  urls <- paste0("https://github.com/sportsdataverse/sportsdataverse-data/releases/download/espn_wnba_team_boxscores/team_box_", seasons, ".rds")
  
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
#' **Load cleaned WNBA player box scores from the data repo**
#' @rdname load_wnba_draft
#' @description helper that loads multiple seasons from the data repo either into memory
#' or writes it into a db using some forwarded arguments in the dots
#' @param seasons A vector of 4-digit years associated with given WNBA seasons. (Min: 2002)
#' @param ... Additional arguments passed to an underlying function that writes
#' the season data into a database (used by `update_wnba_db()`).
#' @param dbConnection A `DBIConnection` object, as returned by [DBI::dbConnect()]
#' @param tablename The name of the player box data table within the database
#' @return Returns a tibble
#' @export
#' @examples
#' \donttest{
#'   try(load_wnba_player_box())
#' }
load_wnba_player_box <- function(seasons = most_recent_wnba_season(), ...,
                                dbConnection = NULL, tablename = NULL) {
  old <- options(list(stringsAsFactors = FALSE, scipen = 999))
  on.exit(options(old))
  dots <- rlang::dots_list(...)
  loader <- rds_from_url
  if (!is.null(dbConnection) && !is.null(tablename)) in_db <- TRUE else in_db <- FALSE
  
  if (isTRUE(seasons)) seasons <- 2002:most_recent_wnba_season()
  
  stopifnot(is.numeric(seasons),
            seasons >= 2002,
            seasons <= most_recent_wnba_season())
  
  urls <- paste0("https://github.com/sportsdataverse/sportsdataverse-data/releases/download/espn_wnba_player_boxscores/player_box_", seasons, ".rds")
  
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
#' **Load cleaned WNBA schedules from the data repo**
#' @rdname load_wnba_draft
#' @description helper that loads multiple seasons from the data repo either into memory
#' or writes it into a db using some forwarded arguments in the dots
#' @param seasons A vector of 4-digit years associated with given WNBA seasons. (Min: 2002)
#' @param ... Additional arguments passed to an underlying function that writes
#' the season data into a database (used by `update_wnba_db()`).
#' @param dbConnection A `DBIConnection` object, as returned by [DBI::dbConnect()]
#' @param tablename The name of the schedule data table within the database
#' @return Returns a tibble
#' @export
#' @examples
#' \donttest{
#'   try(load_wnba_schedule())
#' }
load_wnba_schedule <- function(seasons = most_recent_wnba_season(), ...,
                              dbConnection = NULL, tablename = NULL) {
  old <- options(list(stringsAsFactors = FALSE, scipen = 999))
  on.exit(options(old))
  dots <- rlang::dots_list(...)
  
  loader <- rds_from_url
  if (!is.null(dbConnection) && !is.null(tablename)) in_db <- TRUE else in_db <- FALSE
  
  if (isTRUE(seasons)) seasons <- 2002:most_recent_wnba_season()
  
  stopifnot(is.numeric(seasons),
            seasons >= 2002,
            seasons <= most_recent_wnba_season())
  
  urls <- paste0("https://github.com/sportsdataverse/sportsdataverse-data/releases/download/espn_wnba_schedules/wnba_schedule_", seasons, ".rds")
  
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

# load games file
load_wnba_games <- function(){
  .url <- "https://github.com/sportsdataverse/sportsdataverse-data/releases/download/espn_wnba_schedules/wnba_games_in_data_repo.csv"
  con <- url(.url)
  dat <- utils::read.csv(con)
  # close(con)
  return(dat)
}


#' @rdname load_wnba_draft
#' @description `load_wnba_rosters_manifest()` returns the per-season manifest
#'   CSV (`season`, `row_count`, `generated_at_utc`, `source_endpoint`) for
#'   the rosters release tag without downloading any season's full data.
#' @export
load_wnba_rosters_manifest <- function() {
  url <- paste0(
    "https://github.com/sportsdataverse/sportsdataverse-data/releases/download/",
    "espn_wnba_rosters/wnba_rosters_in_data_repo.csv"
  )
  csv_from_url(url)
}


#' @rdname load_wnba_draft
#' @description `load_wnba_player_stats_manifest()` returns the per-season
#'   manifest CSV (`season`, `row_count`, `generated_at_utc`,
#'   `source_endpoint`) for the player season stats release tag without
#'   downloading any season's full data.
#' @export
load_wnba_player_stats_manifest <- function() {
  url <- paste0(
    "https://github.com/sportsdataverse/sportsdataverse-data/releases/download/",
    "espn_wnba_player_season_stats/wnba_player_season_stats_in_data_repo.csv"
  )
  csv_from_url(url)
}


#' @rdname load_wnba_draft
#' @description `load_wnba_team_stats_manifest()` returns the per-season
#'   manifest CSV (`season`, `row_count`, `generated_at_utc`,
#'   `source_endpoint`) for the team season stats release tag without
#'   downloading any season's full data.
#' @export
load_wnba_team_stats_manifest <- function() {
  url <- paste0(
    "https://github.com/sportsdataverse/sportsdataverse-data/releases/download/",
    "espn_wnba_team_season_stats/wnba_team_season_stats_in_data_repo.csv"
  )
  csv_from_url(url)
}


#' @rdname load_wnba_draft
#' @description `load_wnba_standings_manifest()` returns the per-season
#'   manifest CSV (`season`, `row_count`, `generated_at_utc`,
#'   `source_endpoint`) for the standings release tag without downloading
#'   any season's full data.
#' @export
load_wnba_standings_manifest <- function() {
  url <- paste0(
    "https://github.com/sportsdataverse/sportsdataverse-data/releases/download/",
    "espn_wnba_standings/wnba_standings_in_data_repo.csv"
  )
  csv_from_url(url)
}


#' @rdname load_wnba_draft
#' @description `load_wnba_draft_manifest()` returns the per-season manifest
#'   CSV (`season`, `row_count`, `generated_at_utc`, `source_endpoint`) for
#'   the draft release tag without downloading any season's full data.
#' @export
load_wnba_draft_manifest <- function() {
  url <- paste0(
    "https://github.com/sportsdataverse/sportsdataverse-data/releases/download/",
    "espn_wnba_draft/wnba_draft_in_data_repo.csv"
  )
  csv_from_url(url)
}


#' @rdname load_wnba_draft
#' @description `load_wnba_shots_manifest()` returns the per-season manifest
#'   CSV (`season`, `row_count`, `generated_at_utc`, `source_endpoint`) for
#'   the shots release tag without downloading any season's full data.
#' @export
load_wnba_shots_manifest <- function() {
  url <- paste0(
    "https://github.com/sportsdataverse/sportsdataverse-data/releases/download/",
    "espn_wnba_shots/wnba_shots_in_data_repo.csv"
  )
  csv_from_url(url)
}


#' @rdname load_wnba_draft
#' @description `load_wnba_game_rosters_manifest()` returns the per-season
#'   manifest CSV (`season`, `row_count`, `generated_at_utc`,
#'   `source_endpoint`) for the game rosters release tag without downloading
#'   any season's full data.
#' @export
load_wnba_game_rosters_manifest <- function() {
  url <- paste0(
    "https://github.com/sportsdataverse/sportsdataverse-data/releases/download/",
    "espn_wnba_game_rosters/wnba_game_rosters_in_data_repo.csv"
  )
  csv_from_url(url)
}


#' @rdname load_wnba_draft
#' @description `load_wnba_officials_manifest()` returns the per-season
#'   manifest CSV (`season`, `row_count`, `generated_at_utc`,
#'   `source_endpoint`) for the officials release tag without downloading
#'   any season's full data.
#' @export
load_wnba_officials_manifest <- function() {
  url <- paste0(
    "https://github.com/sportsdataverse/sportsdataverse-data/releases/download/",
    "espn_wnba_officials/wnba_officials_in_data_repo.csv"
  )
  csv_from_url(url)
}


#' @title
#' **Load cleaned WNBA season rosters from the data repo**
#' @rdname load_wnba_draft
#' @description Loads season-level WNBA team rosters scraped from ESPN. One row
#'   per athlete-team-season triple. Backed by the `wehoop-wnba-data` pipeline
#'   that reads raw JSONs from `wehoop-wnba-raw` and publishes parquet/rds
#'   artifacts to the `espn_wnba_rosters` release tag.
#' @param seasons A vector of 4-digit years associated with given WNBA seasons.
#'   (Min: 2002)
#' @param ... Additional arguments passed to an underlying function that writes
#'   the season data into a database.
#' @param dbConnection A `DBIConnection` object, as returned by [DBI::dbConnect()]
#' @param tablename The name of the rosters data table within the database
#' @return Returns a `wehoop_data` tibble with one row per athlete-team-season.
#' @export
#' @family WNBA loader functions
#' @examples
#' \donttest{
#'   try(load_wnba_rosters(seasons = most_recent_wnba_season()))
#' }
load_wnba_rosters <- function(seasons = most_recent_wnba_season(), ...,
                              dbConnection = NULL, tablename = NULL) {
  old <- options(list(stringsAsFactors = FALSE, scipen = 999))
  on.exit(options(old))
  dots <- rlang::dots_list(...)

  loader <- rds_from_url
  if (!is.null(dbConnection) && !is.null(tablename)) in_db <- TRUE else in_db <- FALSE

  if (isTRUE(seasons)) seasons <- 2002:most_recent_wnba_season()

  stopifnot(is.numeric(seasons),
            seasons >= 2002,
            seasons <= most_recent_wnba_season())

  urls <- paste0(
    "https://github.com/sportsdataverse/sportsdataverse-data/releases/download/",
    "espn_wnba_rosters/rosters_", seasons, ".rds"
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
#' **Load cleaned WNBA player season stats from the data repo**
#' @rdname load_wnba_draft
#' @description Loads season-level WNBA player statistics scraped from ESPN.
#'   One row per athlete-team-season-statistic-grouping. Backed by the
#'   `wehoop-wnba-data` pipeline that reads raw JSONs from `wehoop-wnba-raw`
#'   and publishes parquet/rds artifacts to the
#'   `espn_wnba_player_season_stats` release tag.
#' @param seasons A vector of 4-digit years associated with given WNBA seasons.
#'   (Min: 2002)
#' @param ... Additional arguments passed to an underlying function that writes
#'   the season data into a database.
#' @param dbConnection A `DBIConnection` object, as returned by [DBI::dbConnect()]
#' @param tablename The name of the player season stats table within the database
#' @return Returns a `wehoop_data` tibble of player season stats.
#' @export
#' @family WNBA loader functions
#' @examples
#' \donttest{
#'   try(load_wnba_player_stats(seasons = most_recent_wnba_season()))
#' }
load_wnba_player_stats <- function(seasons = most_recent_wnba_season(), ...,
                                   dbConnection = NULL, tablename = NULL) {
  old <- options(list(stringsAsFactors = FALSE, scipen = 999))
  on.exit(options(old))
  dots <- rlang::dots_list(...)

  loader <- rds_from_url
  if (!is.null(dbConnection) && !is.null(tablename)) in_db <- TRUE else in_db <- FALSE

  if (isTRUE(seasons)) seasons <- 2002:most_recent_wnba_season()

  stopifnot(is.numeric(seasons),
            seasons >= 2002,
            seasons <= most_recent_wnba_season())

  urls <- paste0(
    "https://github.com/sportsdataverse/sportsdataverse-data/releases/download/",
    "espn_wnba_player_season_stats/player_season_stats_", seasons, ".rds"
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
#' **Load cleaned WNBA team season stats from the data repo**
#' @rdname load_wnba_draft
#' @description Loads season-level WNBA team statistics scraped from ESPN.
#'   One row per team-season-statistic-grouping. Backed by the
#'   `wehoop-wnba-data` pipeline that reads raw JSONs from `wehoop-wnba-raw`
#'   and publishes parquet/rds artifacts to the
#'   `espn_wnba_team_season_stats` release tag.
#' @param seasons A vector of 4-digit years associated with given WNBA seasons.
#'   (Min: 2002)
#' @param ... Additional arguments passed to an underlying function that writes
#'   the season data into a database.
#' @param dbConnection A `DBIConnection` object, as returned by [DBI::dbConnect()]
#' @param tablename The name of the team season stats table within the database
#' @return Returns a `wehoop_data` tibble of team season stats.
#'
#'    Columns as documented in the shared [basketball_load_wbb_team_stats_schema] table.
#'
#' @export
#' @family WNBA loader functions
#' @examples
#' \donttest{
#'   try(load_wnba_team_stats(seasons = most_recent_wnba_season()))
#' }
load_wnba_team_stats <- function(seasons = most_recent_wnba_season(), ...,
                                 dbConnection = NULL, tablename = NULL) {
  old <- options(list(stringsAsFactors = FALSE, scipen = 999))
  on.exit(options(old))
  dots <- rlang::dots_list(...)

  loader <- rds_from_url
  if (!is.null(dbConnection) && !is.null(tablename)) in_db <- TRUE else in_db <- FALSE

  if (isTRUE(seasons)) seasons <- 2002:most_recent_wnba_season()

  stopifnot(is.numeric(seasons),
            seasons >= 2002,
            seasons <= most_recent_wnba_season())

  urls <- paste0(
    "https://github.com/sportsdataverse/sportsdataverse-data/releases/download/",
    "espn_wnba_team_season_stats/team_season_stats_", seasons, ".rds"
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
#' **Load cleaned WNBA season standings from the data repo**
#' @rdname load_wnba_draft
#' @description Loads season-level WNBA standings scraped from ESPN. One row
#'   per team-season. Backed by the `wehoop-wnba-data` pipeline that reads
#'   raw JSONs from `wehoop-wnba-raw` and publishes parquet/rds artifacts to
#'   the `espn_wnba_standings` release tag.
#' @param seasons A vector of 4-digit years associated with given WNBA seasons.
#'   (Min: 2002)
#' @param ... Additional arguments passed to an underlying function that writes
#'   the season data into a database.
#' @param dbConnection A `DBIConnection` object, as returned by [DBI::dbConnect()]
#' @param tablename The name of the standings data table within the database
#' @return Returns a `wehoop_data` tibble of team standings.
#'
#'    Columns as documented in the shared [basketball_load_wbb_standings_schema] table.
#'
#' @export
#' @family WNBA loader functions
#' @examples
#' \donttest{
#'   try(load_wnba_standings(seasons = most_recent_wnba_season()))
#' }
load_wnba_standings <- function(seasons = most_recent_wnba_season(), ...,
                                dbConnection = NULL, tablename = NULL) {
  old <- options(list(stringsAsFactors = FALSE, scipen = 999))
  on.exit(options(old))
  dots <- rlang::dots_list(...)

  loader <- rds_from_url
  if (!is.null(dbConnection) && !is.null(tablename)) in_db <- TRUE else in_db <- FALSE

  if (isTRUE(seasons)) seasons <- 2002:most_recent_wnba_season()

  stopifnot(is.numeric(seasons),
            seasons >= 2002,
            seasons <= most_recent_wnba_season())

  urls <- paste0(
    "https://github.com/sportsdataverse/sportsdataverse-data/releases/download/",
    "espn_wnba_standings/standings_", seasons, ".rds"
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


#' **Load wehoop WNBA Draft**
#' @name load_wnba_draft
NULL
#' @title
#' **Load cleaned WNBA draft picks from the data repo**
#' @rdname load_wnba_draft
#' @description Loads season-level WNBA draft picks scraped from ESPN. One
#'   row per pick. Backed by the `wehoop-wnba-data` pipeline that reads raw
#'   JSONs from `wehoop-wnba-raw` and publishes parquet/rds artifacts to the
#'   `espn_wnba_draft` release tag.
#' @param seasons A vector of 4-digit years associated with given WNBA draft
#'   seasons. (Min: 2002)
#' @param ... Additional arguments passed to an underlying function that writes
#'   the season data into a database.
#' @param dbConnection A `DBIConnection` object, as returned by [DBI::dbConnect()]
#' @param tablename The name of the draft data table within the database
#' @return Returns a `wehoop_data` tibble of WNBA draft picks.
#'
#'    \if{html}{\tabular{lll}{
#'       col_name \tab types \tab description \cr
#'       season \tab integer \tab Season identifier (4-digit year or 'YYYY-YY' string). \cr
#'       round \tab integer \tab Tournament / playoff round. \cr
#'       pick \tab integer \tab Pick. \cr
#'       overall \tab integer \tab Overall. \cr
#'       team_id \tab character \tab Unique team identifier. \cr
#'       team_display_name \tab character \tab Full team display name. \cr
#'       athlete_id \tab character \tab Unique athlete identifier (ESPN). \cr
#'       athlete_display_name \tab character \tab Athlete display name (full). \cr
#'       athlete_position \tab character \tab Athlete position. \cr
#'       college_id \tab character \tab Unique identifier for college. \cr
#'       college_name \tab character \tab College name. \cr
#'    }}
#'    \if{latex}{See the HTML help or pkgdown reference for the column table.}
#'
#' @export
#' @family WNBA loader functions
#' @examples
#' \donttest{
#'   try(load_wnba_draft(seasons = most_recent_wnba_season()))
#' }
load_wnba_draft <- function(seasons = most_recent_wnba_season(), ...,
                            dbConnection = NULL, tablename = NULL) {
  old <- options(list(stringsAsFactors = FALSE, scipen = 999))
  on.exit(options(old))
  dots <- rlang::dots_list(...)

  loader <- rds_from_url
  if (!is.null(dbConnection) && !is.null(tablename)) in_db <- TRUE else in_db <- FALSE

  if (isTRUE(seasons)) seasons <- 2002:most_recent_wnba_season()

  stopifnot(is.numeric(seasons),
            seasons >= 2002,
            seasons <= most_recent_wnba_season())

  urls <- paste0(
    "https://github.com/sportsdataverse/sportsdataverse-data/releases/download/",
    "espn_wnba_draft/draft_", seasons, ".rds"
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
#' **Load cleaned WNBA shot events from the data repo**
#' @rdname load_wnba_draft
#' @description Loads shot events parsed from ESPN WNBA play-by-play feeds.
#'   One row per shot attempt (made or missed), with court coordinates and
#'   shot metadata. Backed by the `wehoop-wnba-data` pipeline that reads raw
#'   JSONs from `wehoop-wnba-raw` and publishes parquet/rds artifacts to the
#'   `espn_wnba_shots` release tag.
#' @param seasons A vector of 4-digit years associated with given WNBA seasons.
#'   (Min: 2002)
#' @param ... Additional arguments passed to an underlying function that writes
#'   the season data into a database.
#' @param dbConnection A `DBIConnection` object, as returned by [DBI::dbConnect()]
#' @param tablename The name of the shots data table within the database
#' @return Returns a `wehoop_data` tibble with one row per shot attempt.
#'
#'    Columns as documented in the shared [basketball_load_wbb_shots_schema] table.
#'
#' @export
#' @family WNBA loader functions
#' @examples
#' \donttest{
#'   try(load_wnba_shots(seasons = most_recent_wnba_season()))
#' }
load_wnba_shots <- function(seasons = most_recent_wnba_season(), ...,
                            dbConnection = NULL, tablename = NULL) {
  old <- options(list(stringsAsFactors = FALSE, scipen = 999))
  on.exit(options(old))
  dots <- rlang::dots_list(...)

  loader <- rds_from_url
  if (!is.null(dbConnection) && !is.null(tablename)) in_db <- TRUE else in_db <- FALSE

  if (isTRUE(seasons)) seasons <- 2002:most_recent_wnba_season()

  stopifnot(is.numeric(seasons),
            seasons >= 2002,
            seasons <= most_recent_wnba_season())

  urls <- paste0(
    "https://github.com/sportsdataverse/sportsdataverse-data/releases/download/",
    "espn_wnba_shots/shots_", seasons, ".rds"
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
#' **Load cleaned WNBA per-game rosters from the data repo**
#' @rdname load_wnba_draft
#' @description Loads per-game rosters scraped from ESPN WNBA box scores. One
#'   row per athlete-team-game triple, with athlete identifiers, jersey,
#'   position, starter flag, and DNP status. Backed by the `wehoop-wnba-data`
#'   pipeline that reads raw JSONs from `wehoop-wnba-raw` and publishes
#'   parquet/rds artifacts to the `espn_wnba_game_rosters` release tag.
#' @param seasons A vector of 4-digit years associated with given WNBA seasons.
#'   (Min: 2002)
#' @param ... Additional arguments passed to an underlying function that writes
#'   the season data into a database.
#' @param dbConnection A `DBIConnection` object, as returned by [DBI::dbConnect()]
#' @param tablename The name of the game rosters data table within the database
#' @return Returns a `wehoop_data` tibble with one row per athlete-team-game.
#'
#'    Columns as documented in the shared [basketball_load_wbb_game_rosters_schema] table.
#'
#' @export
#' @family WNBA loader functions
#' @examples
#' \donttest{
#'   try(load_wnba_game_rosters(seasons = most_recent_wnba_season()))
#' }
load_wnba_game_rosters <- function(seasons = most_recent_wnba_season(), ...,
                                   dbConnection = NULL, tablename = NULL) {
  old <- options(list(stringsAsFactors = FALSE, scipen = 999))
  on.exit(options(old))
  dots <- rlang::dots_list(...)

  loader <- rds_from_url
  if (!is.null(dbConnection) && !is.null(tablename)) in_db <- TRUE else in_db <- FALSE

  if (isTRUE(seasons)) seasons <- 2002:most_recent_wnba_season()

  stopifnot(is.numeric(seasons),
            seasons >= 2002,
            seasons <= most_recent_wnba_season())

  urls <- paste0(
    "https://github.com/sportsdataverse/sportsdataverse-data/releases/download/",
    "espn_wnba_game_rosters/game_rosters_", seasons, ".rds"
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
#' **Load cleaned WNBA game officials from the data repo**
#' @rdname load_wnba_draft
#' @description Loads game-level officials data scraped from ESPN WNBA summary
#'   feeds. One row per official-game pair. Backed by the `wehoop-wnba-data`
#'   pipeline that reads raw JSONs from `wehoop-wnba-raw` and publishes
#'   parquet/rds artifacts to the `espn_wnba_officials` release tag.
#' @param seasons A vector of 4-digit years associated with given WNBA seasons.
#'   (Min: 2002)
#' @param ... Additional arguments passed to an underlying function that writes
#'   the season data into a database.
#' @param dbConnection A `DBIConnection` object, as returned by [DBI::dbConnect()]
#' @param tablename The name of the officials data table within the database
#' @return Returns a `wehoop_data` tibble with one row per official-game pair.
#'
#'    Columns as documented in the shared [basketball_load_wbb_officials_schema] table.
#'
#' @export
#' @family WNBA loader functions
#' @examples
#' \donttest{
#'   try(load_wnba_officials(seasons = most_recent_wnba_season()))
#' }
load_wnba_officials <- function(seasons = most_recent_wnba_season(), ...,
                                dbConnection = NULL, tablename = NULL) {
  old <- options(list(stringsAsFactors = FALSE, scipen = 999))
  on.exit(options(old))
  dots <- rlang::dots_list(...)

  loader <- rds_from_url
  if (!is.null(dbConnection) && !is.null(tablename)) in_db <- TRUE else in_db <- FALSE

  if (isTRUE(seasons)) seasons <- 2002:most_recent_wnba_season()

  stopifnot(is.numeric(seasons),
            seasons >= 2002,
            seasons <= most_recent_wnba_season())

  urls <- paste0(
    "https://github.com/sportsdataverse/sportsdataverse-data/releases/download/",
    "espn_wnba_officials/officials_", seasons, ".rds"
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


#' **Build/update wehoop WNBA play-by-play database**
#' @name update_wnba_db
NULL

#' @title 
#' **Update or create a wehoop WNBA play-by-play database**
#' @rdname update_wnba_db
#' @description update_wnba_db() updates or creates a database with `wehoop`
#' play by play data of all completed and available games since 2002.
#'
#' @details This function creates and updates a data table with the name `tblname`
#' within a SQLite database (other drivers via `db_connection`) located in
#' `dbdir` and named `dbname`.
#' The data table combines all play by play data for every available game back
#' to the 2002 season and adds the most recent completed games as soon as they
#' are available for `wehoop`.
#'
#' The argument `force_rebuild` is of hybrid type. It can rebuild the play
#' by play data table either for the whole wehoop era (with `force_rebuild = TRUE`)
#' or just for specified seasons (e.g. `force_rebuild = c(2019, 2020)`).
#' Please note the following behavior:
#' 
#'  - `force_rebuild = TRUE`: The data table with the name `tblname`
#'   will be removed completely and rebuilt from scratch. This is helpful when
#'   new columns are added during the Off-Season.
#'  - `force_rebuild = c(2019, 2020)`: The data table with the name `tblname`
#'  will be preserved and only rows from the 2019 and 2020 seasons will be
#'  deleted and re-added. This is intended to be used for ongoing seasons because
#'  ESPN's data provider can make changes to the underlying data during the week.
#'  
#' 
#'
#' The parameter `db_connection` is intended for advanced users who want
#' to use other DBI drivers, such as MariaDB, Postgres or odbc. Please note that
#' the arguments `dbdir` and `dbname` are dropped in case a `db_connection`
#' is provided but the argument `tblname` will still be used to write the
#' data table into the database.
#'
#' @param dbdir Directory in which the database is or shall be located
#' @param dbname File name of an existing or desired SQLite database within `dbdir`
#' @param tblname The name of the play by play data table within the database
#' @param force_rebuild Hybrid parameter (logical or numeric) to rebuild parts
#' of or the complete play by play data table within the database (please see details for further information)
#' @param db_connection A `DBIConnection` object, as returned by
#' [DBI::dbConnect()] (please see details for further information)
#' @param datasets Optional character vector of dataset shortnames. When `NULL`
#'   (the default) the legacy behavior is preserved: the play-by-play table
#'   `tblname` is created/updated. When supplied, only the requested datasets
#'   are written (one table per dataset, named `wnba_<dataset>` -- e.g.
#'   `wnba_rosters`, `wnba_player_stats`). Valid values:
#'   `"pbp"`, `"team_box"`, `"player_box"`, `"schedule"`, `"rosters"`,
#'   `"player_stats"`, `"team_stats"`, `"standings"`, `"draft"`, `"shots"`,
#'   `"game_rosters"`, `"officials"`.
#' @param seasons Optional integer vector of seasons. Forwarded to the dataset
#'   loaders only when `datasets` is supplied. Defaults to all available
#'   seasons for the dataset (`seasons = TRUE`).
#' @return Logical TRUE/FALSE
#' @export
update_wnba_db <- function(dbdir = ".",
                          dbname = "wehoop_db",
                          tblname = "wehoop_wnba_pbp",
                          force_rebuild = FALSE,
                          db_connection = NULL,
                          datasets = NULL,
                          seasons = TRUE) {
  old <- options(list(stringsAsFactors = FALSE, scipen = 999))
  on.exit(options(old))
  
  # rule_header("Update wehoop Play-by-Play Database")
  
  if (!is_installed("DBI") | !is_installed("purrr") |
      (!is_installed("RSQLite") & is.null(db_connection))) {
    usethis::ui_stop("{my_time()} | Packages {usethis::ui_value('DBI')}, {usethis::ui_value('RSQLite')} and {usethis::ui_value('purrr')} required for database communication. Please install them.")
  }
  
  if (any(force_rebuild == "NEW")) {
    usethis::ui_stop("{my_time()} | The argument {usethis::ui_value('force_rebuild = NEW')} is only for internal usage!")
  }
  
  if (!(is.logical(force_rebuild) | is.numeric(force_rebuild))) {
    usethis::ui_stop("{my_time()} | The argument {usethis::ui_value('force_rebuild')} has to be either logical or numeric!")
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

  # --- selective datasets path -------------------------------------------------
  if (!is.null(datasets)) {
    valid <- c("pbp", "team_box", "player_box", "schedule",
               "rosters", "player_stats", "team_stats", "standings",
               "draft", "shots", "game_rosters", "officials")
    bad <- setdiff(datasets, valid)
    if (length(bad) > 0) {
      cli::cli_abort(c(
        "x" = "Unknown {.arg datasets} value{?s}: {.val {bad}}.",
        "i" = "Valid choices: {.val {valid}}."
      ))
    }
    loader_map <- list(
      pbp          = load_wnba_pbp,
      team_box     = load_wnba_team_box,
      player_box   = load_wnba_player_box,
      schedule     = load_wnba_schedule,
      rosters      = load_wnba_rosters,
      player_stats = load_wnba_player_stats,
      team_stats   = load_wnba_team_stats,
      standings    = load_wnba_standings,
      draft        = load_wnba_draft,
      shots        = load_wnba_shots,
      game_rosters = load_wnba_game_rosters,
      officials    = load_wnba_officials
    )
    for (ds in datasets) {
      ds_table <- paste0("wnba_", ds)
      user_message(paste0("Writing wnba dataset '", ds, "' to table '", ds_table, "'..."), "todo")
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
    return(invisible(TRUE))
  }

  # create db if it doesn't exist or user forces rebuild
  if (!DBI::dbExistsTable(connection, tblname)) {
    build_wnba_db(tblname, connection, rebuild = "NEW")
  } else if (DBI::dbExistsTable(connection, tblname) & all(force_rebuild != FALSE)) {
    build_wnba_db(tblname, connection, rebuild = force_rebuild)
  }
  
  # get completed games
  user_message("Checking for missing completed games...", "todo")
  completed_games <- load_wnba_games() %>%
    # completed games since 2002, excluding the broken games
    dplyr::filter(.data$season >= 2002) %>%
    dplyr::pull(.data$game_id)
  
  # function below
  missing <- get_missing_wnba_games(completed_games, connection, tblname)
  
  # rebuild db if number of missing games is too large
  if (length(missing) > 100) {
    build_wnba_db(tblname, connection, show_message = FALSE, rebuild = as.numeric(unique(stringr::str_sub(missing, 1, 4))))
    missing <- get_missing_wnba_games(completed_games, connection, tblname)
  }
  
  # # if there's missing games, scrape and write to db
  # if (length(missing) > 0) {
  #   new_pbp <- build_wehoop_pbp(missing, rules = FALSE)
  #   
  #   if (nrow(new_pbp) == 0) {
  #     user_message("Raw data of new games are not yet ready. Please try again in about 10 minutes.", "oops")
  #   } else {
  #     user_message("Appending new data to database...", "todo")
  #     DBI::dbWriteTable(connection, tblname, new_pbp, append = TRUE)
  #   }
  # }
  
  message_completed("Database update completed", in_builder = TRUE)
  usethis::ui_info("{my_time()} | Path to your db: {usethis::ui_path(DBI::dbGetInfo(connection)$dbname)}")
  if (is.null(db_connection)) DBI::dbDisconnect(connection)
  # rule_footer("DONE")
}

# this is a helper function to build wehoop database from Scratch
build_wnba_db <- function(tblname = "wehoop_wnba_pbp", db_conn, rebuild = FALSE, show_message = TRUE) {
  
  old <- options(list(stringsAsFactors = FALSE, scipen = 999))
  on.exit(options(old))
  valid_seasons <- load_wnba_games() %>%
    dplyr::filter(.data$season >= 2002) %>%
    dplyr::group_by(.data$season) %>%
    dplyr::summarise() %>%
    dplyr::ungroup()
  
  if (all(rebuild == TRUE)) {
    usethis::ui_todo("{my_time()} | Purging the complete data table {usethis::ui_value(tblname)} in your connected database...")
    DBI::dbRemoveTable(db_conn, tblname)
    seasons <- valid_seasons %>% dplyr::pull("season")
    usethis::ui_todo("{my_time()} | Starting download of {length(seasons)} seasons between {min(seasons)} and {max(seasons)}...")
  } else if (is.numeric(rebuild) & all(rebuild %in% valid_seasons$season)) {
    string <- paste0(rebuild, collapse = ", ")
    if (show_message) {usethis::ui_todo("{my_time()} | Purging {string} season(s) from the data table {usethis::ui_value(tblname)} in your connected database...")}
    DBI::dbExecute(
      db_conn,
      paste0(
        "DELETE FROM ", DBI::dbQuoteIdentifier(db_conn, tblname),
        " WHERE season IN (",
        paste(rep("?", length(rebuild)), collapse = ", "),
        ")"
      ),
      params = as.list(rebuild)
    )
    seasons <- valid_seasons %>% dplyr::filter(.data$season %in% rebuild) %>% dplyr::pull("season")
    usethis::ui_todo("{my_time()} | Starting download of the {string} season(s)...")
  } else if (all(rebuild == "NEW")) {
    usethis::ui_info("{my_time()} | Can't find the data table {usethis::ui_value(tblname)} in your database. Will load the play by play data from scratch.")
    seasons <- valid_seasons %>% dplyr::pull("season")
    usethis::ui_todo("{my_time()} | Starting download of {length(seasons)} seasons between {min(seasons)} and {max(seasons)}...")
  } else {
    seasons <- NULL
    usethis::ui_oops("{my_time()} | At least one invalid value passed to argument {usethis::ui_code('force_rebuild')}. Please try again with valid input.")
  }
  
  if (!is.null(seasons)) {
    # this function lives in R/utils.R
    load_wnba_pbp(seasons, dbConnection = db_conn, tablename = tblname)
  }
}

# this is a helper function to check a list of completed games
# against the games that exist in a database connection
get_missing_wnba_games <- function(completed_games, dbConnection, tablename) {
  db_ids <- dplyr::tbl(dbConnection, tablename) %>%
    dplyr::select("game_id") %>%
    dplyr::distinct() %>%
    dplyr::collect() %>%
    dplyr::pull("game_id")
  
  need_scrape <- completed_games[!completed_games %in% db_ids]
  
  usethis::ui_info("{my_time()} | You have {length(db_ids)} games and are missing {length(need_scrape)}.")
  return(need_scrape)
}

#' @title
#' **Load cleaned WNBA player core (identity + bio) from the data repo**
#' @rdname load_wnba_draft
#' @description Loads ESPN WNBA athlete core records -- identity and
#'   biographical fields, one row per athlete who appeared in the season.
#'   Backed by the `wehoop-wnba-data` pipeline that reads raw JSONs from
#'   `wehoop-wnba-raw` and publishes parquet/rds artifacts to the
#'   `espn_wnba_player_core` release tag.
#'
#'   This is the only source of athlete bio in the pipeline: the player season
#'   stats payload carries no identity at all -- not even the athlete id.
#'
#'   Two properties of the source are worth knowing before joining:
#'   \itemize{
#'     \item \code{current_team_id} is the athlete's CURRENT team, not their
#'       team in the requested season. Season team lives in
#'       \code{load_wnba_player_box()} / \code{load_wnba_player_stats()}.
#'     \item Bio (height / weight / jersey) is a current snapshot that ESPN
#'       overwrites in place; it is not era-correct for a historical season.
#'       The season dimension here is participation, not the bio's vintage.
#'   }
#'   Field coverage is era-dependent by nature -- headshots exist only for
#'   modern players, while college and date of birth thin out the other way.
#' @param seasons A vector of 4-digit years associated with given WNBA seasons.
#'   (Min: 2003)
#' @param ... Additional arguments passed to an underlying function that writes
#'   the season data into a database.
#' @param dbConnection A `DBIConnection` object, as returned by [DBI::dbConnect()]
#' @param tablename The name of the player core table within the database
#' @return Returns a `wehoop_data` tibble of athlete core records.
#' @export
#' @family WNBA loader functions
#' @examples
#' \donttest{
#'   try(load_wnba_player_core(seasons = most_recent_wnba_season()))
#' }
load_wnba_player_core <- function(seasons = most_recent_wnba_season(), ...,
                                  dbConnection = NULL, tablename = NULL) {
  old <- options(list(stringsAsFactors = FALSE, scipen = 999))
  on.exit(options(old))
  dots <- rlang::dots_list(...)

  loader <- rds_from_url
  if (!is.null(dbConnection) && !is.null(tablename)) in_db <- TRUE else in_db <- FALSE

  if (isTRUE(seasons)) seasons <- 2003:most_recent_wnba_season()

  stopifnot(is.numeric(seasons),
            seasons >= 2003,
            seasons <= most_recent_wnba_season())

  urls <- paste0(
    "https://github.com/sportsdataverse/sportsdataverse-data/releases/download/",
    "espn_wnba_player_core/player_core_", seasons, ".rds"
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
