#' **Load wehoop WNBA play-by-play**
#' @name load_wnba_pbp
NULL
#' @title 
#' **Load cleaned WNBA play-by-play from the data repo**
#' @rdname load_wnba_pbp
#' @description helper that loads multiple seasons from the data repo either into memory
#' or writes it into a db using some forwarded arguments in the dots
#' @param seasons A vector of 4-digit years associated with given WNBA seasons. (Min: 2002)
#' @param ... Additional arguments passed to an underlying function that writes
#' the season data into a database (used by `update_wnba_db()`).
#' @param dbConnection A `DBIConnection` object, as returned by [DBI::dbConnect()]
#' @param tablename The name of the play by play data table within the database
#' @return A dataframe with 42 columns
#'
#' | col_name | description |
#' |---|---|
#' | shooting_play | Logical value (TRUE/FALSE) indicating whether the play was a shooting play |
#' | sequence_number | Sequence number is supposed to represent a shot-possession, examine the last two numbers to see if there are multiple events that occur within the same shot-possession. A shot-possession is basically any sequence of plays until there is a shot, change in possession, and probably things like technical fouls and the like. So as soon as a shot goes up, a new sequence starts regardless, even if the shooting team retains possession via offensive or deadball rebound. The first portion of the number is usually time related (i.e. the numeric representation of when the sequence started, from a seconds remaining in the period perspective or so) |
#' | period_display_value | Long form of period (1st quarter, 2nd Quarter, OT, etc.) |
#' | period_number | The numeric period of play in the game |
#' | home_score | Home score at the time of the play |
#' | coordinate_x | The entire scale is a rectangle of size 25x47, intended as a half-court representation of the basketball court (i.e. on the side of the offense), with each coordinate unit representing a foot. It appears that the basket is roughly represented as the (25, 0) point. This is a nonsensical definition when considering that the basket overhangs the court, with the backboard aligned 48 inches from the baseline, then the center of the hoop being roughly 11 inches from there. This is an idiosyncracy of either sensor placement or software and data entry. Use your best judgement in making your charts, I think you will find that making some translations will be helpful. |
#' | coordinate_y |  |
#' | scoring_play | Logical value (TRUE/FALSE) indicating whether the play was a play on which the offense scored |
#' | clock_display_value | Time left within the period |
#' | team_id | Unique team identification number for the offensive team |
#' | type_id | Unique play type identifcation number |
#' | type_text | Play type text description, passed through verbatim from ESPN. Note: ESPN labels the free-throw play TYPE "MadeFreeThrow" for made AND missed free throws; filter makes vs. misses with `scoring_play` (TRUE = made), not `type_text` |
#' | away_score | Away score at the time of the play |
#' | id | Unique play identifcation number |
#' | text | Text description of the play |
#' | score_value | The points value of the shot taken (1 / 2 / 3). Set to the attempt's value even on misses (a missed free throw still carries 1); use `scoring_play` to identify points actually scored |
#' | participants_0_athlete_id | Unique player identification number |
#' | participants_1_athlete_id | Unique player identification number |
#' | participants_2_athlete_id | Unique player identification number |
#' | type_abbreviation | Play type abbreviation |
#' | season | Season of the game |
#' | season_type | Season type of the game, 1 is pre-season, 2 is regular season, 3 is post-season, 4 is off-season |
#' | away_team_id | Unique away team identification number |
#' | away_team_name | Away team name |
#' | away_team_mascot | Away team mascot |
#' | away_team_abbrev | Text abbreviation for the away team |
#' | away_team_name_alt | Alternate versions of the away team abbreviation |
#' | home_team_id | Unique home team identification number |
#' | home_team_name | home team name |
#' | home_team_mascot | home team mascot |
#' | home_team_abbrev | Text abbreviation for the home team |
#' | home_team_name_alt | Alternate versions of the home team abbreviation |
#' | home_team_spread | The game spread with respect to the home team |
#' | game_spread | Game spread in (-X Team) format. There are almost none, I would recommend not trusting any of these three columns |
#' | home_favorite | Logical (TRUE/FALSE) indicating whether the home team is favored |
#' | clock_minutes | Clock minutes split from seconds for developer convenience |
#' | clock_seconds | Clock seconds split from minutes for developer convenience |
#' | half | Half of the game |
#' | lag_half | A lag column on the half |
#' | lead_half | A lead column on the half |
#' | game_play_number | Game play number |
#' | game_id | Unique identifier for the game event |
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
#' **Load wehoop WNBA team box scores**
#' @name load_wnba_team_box
NULL
#' @title
#' **Load cleaned WNBA team box scores from the data repo**
#' @rdname load_wnba_team_box
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




#' **Load wehoop WNBA player box scores**
#' @name load_wnba_player_box
NULL
#' @title
#' **Load cleaned WNBA player box scores from the data repo**
#' @rdname load_wnba_player_box
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

#' **Load wehoop WNBA schedules**
#' @name load_wnba_schedule
NULL
#' @title
#' **Load cleaned WNBA schedules from the data repo**
#' @rdname load_wnba_schedule
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


#' @rdname load_wnba_rosters
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


#' @rdname load_wnba_player_stats
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


#' @rdname load_wnba_team_stats
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


#' @rdname load_wnba_standings
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


#' @rdname load_wnba_shots
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


#' @rdname load_wnba_game_rosters
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


#' @rdname load_wnba_officials
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


#' **Load wehoop WNBA Rosters**
#' @name load_wnba_rosters
NULL
#' @title
#' **Load cleaned WNBA season rosters from the data repo**
#' @rdname load_wnba_rosters
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


#' **Load wehoop WNBA Player Season Stats**
#' @name load_wnba_player_stats
NULL
#' @title
#' **Load cleaned WNBA player season stats from the data repo**
#' @rdname load_wnba_player_stats
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

#' **Load wehoop WNBA Team Season Stats**
#' @name load_wnba_team_stats
NULL
#' @title
#' **Load cleaned WNBA team season stats from the data repo**
#' @rdname load_wnba_team_stats
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
#'    |col_name           |types     |description                                                                                                        |
#'    |:------------------|:---------|:------------------------------------------------------------------------------------------------------------------|
#'    |season             |integer   |Season identifier (4-digit year or 'YYYY-YY' string).                                                              |
#'    |season_type        |integer   |Season type (1=pre-season, 2=regular season, 3=postseason, 4=off-season for ESPN; or string label for WNBA Stats). |
#'    |team_id            |character |Unique team identifier.                                                                                            |
#'    |team_slug          |character |URL-safe team identifier (e.g. 'lasvegas-aces' / 'aces').                                                          |
#'    |team_location      |character |Team city or location string.                                                                                      |
#'    |team_name          |character |Full team display name (e.g. 'Las Vegas Aces').                                                                    |
#'    |team_abbreviation  |character |Short team abbreviation (e.g. 'LAS').                                                                              |
#'    |team_display_name  |character |Full team display name.                                                                                            |
#'    |category           |character |Category label.                                                                                                    |
#'    |stat_name          |character |Stat name.                                                                                                         |
#'    |stat_display_name  |character |Stat display name.                                                                                                 |
#'    |stat_value         |numeric   |Stat value.                                                                                                        |
#'    |stat_display_value |character |Stat display value.                                                                                                |
#'    |stat_rank          |integer   |League/season rank for stat.                                                                                       |
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


#' **Load wehoop WNBA Standings**
#' @name load_wnba_standings
NULL
#' @title
#' **Load cleaned WNBA season standings from the data repo**
#' @rdname load_wnba_standings
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
#'    |col_name           |types     |description                                                                                                        |
#'    |:------------------|:---------|:------------------------------------------------------------------------------------------------------------------|
#'    |season             |integer   |Season identifier (4-digit year or 'YYYY-YY' string).                                                              |
#'    |season_type        |integer   |Season type (1=pre-season, 2=regular season, 3=postseason, 4=off-season for ESPN; or string label for WNBA Stats). |
#'    |team_id            |character |Unique team identifier.                                                                                            |
#'    |team_slug          |character |URL-safe team identifier (e.g. 'lasvegas-aces' / 'aces').                                                          |
#'    |team_location      |character |Team city or location string.                                                                                      |
#'    |team_name          |character |Full team display name (e.g. 'Las Vegas Aces').                                                                    |
#'    |team_abbreviation  |character |Short team abbreviation (e.g. 'LAS').                                                                              |
#'    |team_display_name  |character |Full team display name.                                                                                            |
#'    |conference_id      |character |Conference identifier.                                                                                             |
#'    |conference_name    |character |Full conference name.                                                                                              |
#'    |wins               |integer   |Total wins.                                                                                                        |
#'    |losses             |integer   |Total losses.                                                                                                      |
#'    |win_percent        |numeric   |Win percent.                                                                                                       |
#'    |games_played       |integer   |Games played.                                                                                                      |
#'    |points_for         |numeric   |Points for.                                                                                                        |
#'    |points_against     |numeric   |Points allowed.                                                                                                    |
#'    |point_differential |numeric   |Point differential.                                                                                                |
#'    |streak             |character |Current streak (e.g. 'W3' for three-game win streak).                                                              |
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
#'    |col_name             |types     |description                                           |
#'    |:--------------------|:---------|:-----------------------------------------------------|
#'    |season               |integer   |Season identifier (4-digit year or 'YYYY-YY' string). |
#'    |round                |integer   |Tournament / playoff round.                           |
#'    |pick                 |integer   |Pick.                                                 |
#'    |overall              |integer   |Overall.                                              |
#'    |team_id              |character |Unique team identifier.                               |
#'    |team_display_name    |character |Full team display name.                               |
#'    |athlete_id           |character |Unique athlete identifier (ESPN).                     |
#'    |athlete_display_name |character |Athlete display name (full).                          |
#'    |athlete_position     |character |Athlete position.                                     |
#'    |college_id           |character |Unique identifier for college.                        |
#'    |college_name         |character |College name.                                         |
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


#' **Load wehoop WNBA Shots**
#' @name load_wnba_shots
NULL
#' @title
#' **Load cleaned WNBA shot events from the data repo**
#' @rdname load_wnba_shots
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
#'    |col_name            |types     |description                                                |
#'    |:-------------------|:---------|:----------------------------------------------------------|
#'    |game_id             |character |Unique game identifier.                                    |
#'    |season              |integer   |Season identifier (4-digit year or 'YYYY-YY' string).      |
#'    |period_number       |integer   |Numeric period (1-4 for quarters; 5+ for OT).              |
#'    |clock_display_value |character |Game clock display string (e.g. '8:32').                   |
#'    |team_id             |character |Unique team identifier.                                    |
#'    |athlete_id_1        |character |Primary athlete identifier (e.g. shooter).                 |
#'    |athlete_id_2        |character |Secondary athlete identifier (e.g. assister / fouler).     |
#'    |type_id             |character |Type identifier (numeric).                                 |
#'    |type_text           |character |Display text for the type field.                           |
#'    |scoring_play        |logical   |TRUE if the play resulted in points scored.                |
#'    |score_value         |integer   |Point value of the play (2 / 3 / 1).                       |
#'    |coordinate_x        |numeric   |X coordinate on the court (half-court layout).             |
#'    |coordinate_y        |numeric   |Y coordinate on the court (half-court layout).             |
#'    |coordinate_x_raw    |numeric   |X coordinate as returned by the API before any adjustment. |
#'    |coordinate_y_raw    |numeric   |Y coordinate as returned by the API before any adjustment. |
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


#' **Load wehoop WNBA Game Rosters**
#' @name load_wnba_game_rosters
NULL
#' @title
#' **Load cleaned WNBA per-game rosters from the data repo**
#' @rdname load_wnba_game_rosters
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
#'    |col_name             |types     |description                                                     |
#'    |:--------------------|:---------|:---------------------------------------------------------------|
#'    |game_id              |character |Unique game identifier.                                         |
#'    |season               |integer   |Season identifier (4-digit year or 'YYYY-YY' string).           |
#'    |team_id              |character |Unique team identifier.                                         |
#'    |athlete_id           |character |Unique athlete identifier (ESPN).                               |
#'    |athlete_display_name |character |Athlete display name (full).                                    |
#'    |athlete_position     |character |Athlete position.                                               |
#'    |athlete_jersey       |character |Athlete jersey number.                                          |
#'    |starter              |logical   |TRUE if the player was in the starting lineup; FALSE otherwise. |
#'    |did_not_play         |logical   |TRUE if the player did not appear in the game.                  |
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


#' **Load wehoop WNBA Officials**
#' @name load_wnba_officials
NULL
#' @title
#' **Load cleaned WNBA game officials from the data repo**
#' @rdname load_wnba_officials
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
#'    |col_name     |types     |description                                           |
#'    |:------------|:---------|:-----------------------------------------------------|
#'    |game_id      |character |Unique game identifier.                               |
#'    |season       |integer   |Season identifier (4-digit year or 'YYYY-YY' string). |
#'    |official_id  |character |Unique official / referee identifier.                 |
#'    |display_name |character |Display name.                                         |
#'    |full_name    |character |Player's full name.                                   |
#'    |first_name   |character |Player's first name.                                  |
#'    |last_name    |character |Player's last name.                                   |
#'    |position     |character |Listed roster position (G, F, C, etc.).               |
#'    |order        |integer   |Display order within the result set.                  |
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

#' @name load_wnba_player_core
NULL
#' @title
#' **Load cleaned WNBA player core (identity + bio) from the data repo**
#' @rdname load_wnba_player_core
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
