#' **Load wehoop women's college basketball play-by-play**
#' @name load_wbb_pbp
NULL
#' @title 
#' **Load cleaned women's college basketball play-by-play from the data repo**
#' @rdname load_wbb_pbp
#' @description helper that loads multiple seasons from the data repo either into memory
#' or writes it into a db using some forwarded arguments in the dots
#' @param seasons A vector of 4-digit years associated with given women's college basketball seasons. (Min: 2004)
#' @param ... Additional arguments passed to an underlying function that writes
#' the season data into a database (used by `update_wbb_db()`).
#' @param dbConnection A `DBIConnection` object, as returned by [DBI::dbConnect()] 
#' @param tablename The name of the play by play data table within the database
#' @return A dataframe of play-by-play events with the columns documented below:
#'
#' | col_name | description |
#' |---|---|
#' | shooting_play | Logical value (TRUE/FALSE) indicating whether the play was a shooting play |
#' | sequence_number | Sequence number is supposed to represent a shot-possession, examine the last two numbers to see if there are multiple events that occur within the same shot-possession. A shot-possession is basically any sequence of plays until there is a shot, change in possession, and probably things like technical fouls and the like. So as soon as a shot goes up, a new sequence starts regardless, even if the shooting team retains possession via offensive or deadball rebound. The first portion of the number is usually time related (i.e. the numeric representation of when the sequence started, from a seconds remaining in the period perspective or so) |
#' | period_display_value | Long form of period (1st quarter, 2nd Quarter, OT, etc.) |
#' | period_number | The numeric period of play in the game |
#' | home_score | Home score at the time of the play |
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
#' | game_spread | Game spread in (-X Team) format |
#' | home_favorite | Logical (TRUE/FALSE) indicating whether the home team is favored |
#' | game_spread_available | Logical (TRUE/FALSE) indicating whether the spread was available from ESPN. Basically, I would just not recommend using any of the spread information, I think I defaulted a lot of them to -2.5 for the home team. Most games probably do not have spread information. This column should really be listed first |
#' | game_id | Unique identifier for the game event |
#' | qtr | Quarter of the game |
#' | time | Time left within the period |
#' | clock_minutes | Clock minutes split from seconds for developer convenience |
#' | clock_seconds | Clock seconds split from minutes for developer convenience |
#' | half | Half of the game |
#' | game_half | Half of the game |
#' | lag_qtr | A lag column on the quarter |
#' | lead_qtr | A lead column on the quarter |
#' | lag_game_half | A lag column on the half |
#' | lead_game_half | A lead column on the half |
#' | start_quarter_seconds_remaining | Quarter seconds remaining at the start of the play (these are more or less code artifacts from other sports, but may eventually be used more seriously) |
#' | start_half_seconds_remaining | Game half seconds remaining at the start of the play (these are more or less code artifacts from other sports, but may eventually be used more seriously) |
#' | start_game_seconds_remaining | Game seconds remaining at the start of the play (''') |
#' | game_play_number | Game play number |
#' | end_quarter_seconds_remaining | Quarter seconds remaining at the end of the play (''') |
#' | end_half_seconds_remaining | Game half seconds remaining at the end of the play (''') |
#' | end_game_seconds_remaining | Game seconds remaining at the end of the play (''') |
#' | period | Period of the game |
#' | coordinate_x | The entire scale is a rectangle of size 25x47, intended as a half-court representation of the basketball court (i.e. on the side of the offense), with each coordinate unit representing a foot. It appears that the basket is roughly represented as the (25, 0) point. This is a nonsensical definition when considering that the basket overhangs the court, with the backboard aligned 48 inches from the baseline, then the center of the hoop being roughly 11 inches from there. This is an idiosyncracy of either sensor placement or software and data entry. Use your best judgement in making your charts, I think you will find that making some translations will be helpful. |
#' | coordinate_y |  |
#' | week | Apparently there are weeks |
#' | media_id | Where did you come from |
#' | pregame_home_prob | Pre-game win probability for the home team, constant across every play of the game |
#' | home_win_prob | Home team's win probability at this play, updated play-by-play |
#'
#' @export
#' @examples
#' \donttest{
#'   try(load_wbb_pbp())
#' }
load_wbb_pbp <- function(seasons = most_recent_wbb_season(), ...,
                         dbConnection = NULL, tablename = NULL) {
  old <- options(list(stringsAsFactors = FALSE, scipen = 999))
  on.exit(options(old))
  dots <- rlang::dots_list(...)
  loader <- rds_from_url
  if (!is.null(dbConnection) && !is.null(tablename)) in_db <- TRUE else in_db <- FALSE
  
  if (isTRUE(seasons)) seasons <- 2004:most_recent_wbb_season()
  
  stopifnot(is.numeric(seasons),
            seasons >= 2004,
            seasons <= most_recent_wbb_season())
  
  urls <- paste0("https://github.com/sportsdataverse/sportsdataverse-data/releases/download/espn_womens_college_basketball_pbp/play_by_play_", seasons, ".rds")
  
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


#' **Load wehoop women's college basketball team box scores**
#' @name load_wbb_team_box
NULL
#' @title
#' **Load cleaned women's college basketball team box scores from the data repo**
#' @rdname load_wbb_team_box
#' @description helper that loads multiple seasons from the data repo either into memory
#' or writes it into a db using some forwarded arguments in the dots
#' @param seasons A vector of 4-digit years associated with given women's college basketball seasons. (Min: 2006)
#' @param ... Additional arguments passed to an underlying function that writes
#' the season data into a database (used by `update_wbb_db()`).
#' @param dbConnection A `DBIConnection` object, as returned by [DBI::dbConnect()] 
#' @param tablename The name of the play by play data table within the database
#' @return Returns a tibble
#' @export
#' @examples \donttest{
#'   try(load_wbb_team_box())
#' }
load_wbb_team_box <- function(seasons = most_recent_wbb_season(), ...,
                              dbConnection = NULL, tablename = NULL) {
  old <- options(list(stringsAsFactors = FALSE, scipen = 999))
  on.exit(options(old))
  dots <- rlang::dots_list(...)
  loader <- rds_from_url
  
  if (!is.null(dbConnection) && !is.null(tablename)) in_db <- TRUE else in_db <- FALSE
  if (isTRUE(seasons)) seasons <- 2006:most_recent_wbb_season()
  
  stopifnot(is.numeric(seasons),
            seasons >= 2006,
            seasons <= most_recent_wbb_season())
  
  urls <- paste0("https://github.com/sportsdataverse/sportsdataverse-data/releases/download/espn_womens_college_basketball_team_boxscores/team_box_", seasons, ".rds")
  
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


#' **Load wehoop women's college basketball player box scores**
#' @name load_wbb_player_box
NULL
#' @title
#' **Load cleaned women's college basketball player box scores from the data repo**
#' @rdname load_wbb_player_box
#' @description helper that loads multiple seasons from the data repo either into memory
#' or writes it into a db using some forwarded arguments in the dots
#' @param seasons A vector of 4-digit years associated with given women's college basketball seasons. (Min: 2006)
#' @param ... Additional arguments passed to an underlying function that writes
#' the season data into a database (used by `update_wbb_db()`).
#' @param dbConnection A `DBIConnection` object, as returned by [DBI::dbConnect()] 
#' @param tablename The name of the play by play data table within the database
#' @return Returns a tibble
#' @export
#' @examples \donttest{
#'   try(load_wbb_player_box())
#' }
load_wbb_player_box <- function(seasons = most_recent_wbb_season(), ...,
                                dbConnection = NULL, tablename = NULL) {
  old <- options(list(stringsAsFactors = FALSE, scipen = 999))
  on.exit(options(old))
  dots <- rlang::dots_list(...)
  loader <- rds_from_url
  
  if (!is.null(dbConnection) && !is.null(tablename)) in_db <- TRUE else in_db <- FALSE
  if (isTRUE(seasons)) seasons <- 2003:most_recent_wbb_season()
  
  stopifnot(is.numeric(seasons),
            seasons >= 2003,
            seasons <= most_recent_wbb_season())
  
  urls <- paste0("https://github.com/sportsdataverse/sportsdataverse-data/releases/download/espn_womens_college_basketball_player_boxscores/player_box_", seasons, ".rds")
  
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


#' **Load wehoop women's college basketball schedule**
#' @name load_wbb_schedule
NULL
#' @title
#' **Load cleaned women's college basketball schedules from the data repo**
#' @rdname load_wbb_schedule
#' @description helper that loads multiple seasons from the data repo either into memory
#' or writes it into a db using some forwarded arguments in the dots
#' @param seasons A vector of 4-digit years associated with given women's college basketball seasons. (Min: 2002)
#' @param ... Additional arguments passed to an underlying function that writes
#' the season data into a database (used by `update_wbb_db()`).
#' @param dbConnection A `DBIConnection` object, as returned by [DBI::dbConnect()] 
#' @param tablename The name of the play by play data table within the database
#' @return Returns a tibble
#' @export
#' @examples \donttest{
#'   try(load_wbb_schedule())
#' }

load_wbb_schedule <- function(seasons = most_recent_wbb_season(), ...,
                              dbConnection = NULL, tablename = NULL) {
  old <- options(list(stringsAsFactors = FALSE, scipen = 999))
  on.exit(options(old))
  dots <- rlang::dots_list(...)
  
  loader <- rds_from_url
  
  if (!is.null(dbConnection) && !is.null(tablename)) in_db <- TRUE else in_db <- FALSE
  if (isTRUE(seasons)) seasons <- 2002:most_recent_wbb_season()
  
  stopifnot(is.numeric(seasons),
            seasons >= 2002,
            seasons <= most_recent_wbb_season())
  
  urls <- paste0("https://github.com/sportsdataverse/sportsdataverse-data/releases/download/espn_womens_college_basketball_schedules/wbb_schedule_", seasons, ".rds")
  
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
load_wbb_games <- function(){
  .url <- "https://github.com/sportsdataverse/sportsdataverse-data/releases/download/espn_womens_college_basketball_schedules/wbb_games_in_data_repo.csv"
  dat <- csv_from_url(.url)
  # close(con)
  return(dat)
}


#' @rdname load_wbb_rosters
#' @description `load_wbb_rosters_manifest()` returns the per-season manifest
#'   CSV (columns: `season`, `row_count`, `generated_at_utc`,
#'   `source_endpoint`) describing which seasons are currently published to
#'   the release tag, without downloading any season's full data.
#' @export
load_wbb_rosters_manifest <- function() {
  url <- paste0(
    "https://github.com/sportsdataverse/sportsdataverse-data/releases/download/",
    "espn_womens_college_basketball_rosters/",
    "wbb_rosters_in_data_repo.csv"
  )
  csv_from_url(url)
}


#' @rdname load_wbb_player_stats
#' @description `load_wbb_player_stats_manifest()` returns the per-season
#'   manifest CSV (`season`, `row_count`, `generated_at_utc`,
#'   `source_endpoint`) for the player season stats release tag without
#'   downloading any season's full data.
#' @export
load_wbb_player_stats_manifest <- function() {
  url <- paste0(
    "https://github.com/sportsdataverse/sportsdataverse-data/releases/download/",
    "espn_womens_college_basketball_player_season_stats/",
    "wbb_player_season_stats_in_data_repo.csv"
  )
  csv_from_url(url)
}


#' @rdname load_wbb_team_stats
#' @description `load_wbb_team_stats_manifest()` returns the per-season
#'   manifest CSV (`season`, `row_count`, `generated_at_utc`,
#'   `source_endpoint`) for the team season stats release tag without
#'   downloading any season's full data.
#' @export
load_wbb_team_stats_manifest <- function() {
  url <- paste0(
    "https://github.com/sportsdataverse/sportsdataverse-data/releases/download/",
    "espn_womens_college_basketball_team_season_stats/",
    "wbb_team_season_stats_in_data_repo.csv"
  )
  csv_from_url(url)
}


#' @rdname load_wbb_standings
#' @description `load_wbb_standings_manifest()` returns the per-season
#'   manifest CSV (`season`, `row_count`, `generated_at_utc`,
#'   `source_endpoint`) for the standings release tag without downloading
#'   any season's full data.
#' @export
load_wbb_standings_manifest <- function() {
  url <- paste0(
    "https://github.com/sportsdataverse/sportsdataverse-data/releases/download/",
    "espn_womens_college_basketball_standings/",
    "wbb_standings_in_data_repo.csv"
  )
  csv_from_url(url)
}


#' @rdname load_wbb_shots
#' @description `load_wbb_shots_manifest()` returns the per-season manifest
#'   CSV (`season`, `row_count`, `generated_at_utc`, `source_endpoint`) for
#'   the shots release tag without downloading any season's full data.
#' @export
load_wbb_shots_manifest <- function() {
  url <- paste0(
    "https://github.com/sportsdataverse/sportsdataverse-data/releases/download/",
    "espn_womens_college_basketball_shots/",
    "wbb_shots_in_data_repo.csv"
  )
  csv_from_url(url)
}


#' @rdname load_wbb_game_rosters
#' @description `load_wbb_game_rosters_manifest()` returns the per-season
#'   manifest CSV (`season`, `row_count`, `generated_at_utc`,
#'   `source_endpoint`) for the game rosters release tag without downloading
#'   any season's full data.
#' @export
load_wbb_game_rosters_manifest <- function() {
  url <- paste0(
    "https://github.com/sportsdataverse/sportsdataverse-data/releases/download/",
    "espn_womens_college_basketball_game_rosters/",
    "wbb_game_rosters_in_data_repo.csv"
  )
  csv_from_url(url)
}


#' @rdname load_wbb_officials
#' @description `load_wbb_officials_manifest()` returns the per-season
#'   manifest CSV (`season`, `row_count`, `generated_at_utc`,
#'   `source_endpoint`) for the officials release tag without downloading
#'   any season's full data.
#' @export
load_wbb_officials_manifest <- function() {
  url <- paste0(
    "https://github.com/sportsdataverse/sportsdataverse-data/releases/download/",
    "espn_womens_college_basketball_officials/",
    "wbb_officials_in_data_repo.csv"
  )
  csv_from_url(url)
}


#' **Load wehoop WBB Rosters**
#' @name load_wbb_rosters
NULL
#' @title
#' **Load cleaned WBB season rosters from the data repo**
#' @rdname load_wbb_rosters
#' @description Loads season-level team rosters scraped from ESPN. One row per
#'   athlete-team-season triple. Backed by the `wehoop-wbb-data` pipeline that
#'   reads raw JSONs from `wehoop-wbb-raw` and publishes parquet/rds artifacts
#'   to the `espn_womens_college_basketball_rosters` release tag.
#' @param seasons A vector of 4-digit years associated with given women's
#'   college basketball seasons. (Min: 2002)
#' @param ... Additional arguments passed to an underlying function that writes
#'   the season data into a database.
#' @param dbConnection A `DBIConnection` object, as returned by [DBI::dbConnect()]
#' @param tablename The name of the rosters data table within the database
#' @return Returns a `wehoop_data` tibble with one row per athlete-team-season.
#' @export
#' @family WBB loader functions
#' @examples
#' \donttest{
#'   try(load_wbb_rosters(seasons = most_recent_wbb_season()))
#' }
load_wbb_rosters <- function(seasons = most_recent_wbb_season(), ...,
                             dbConnection = NULL, tablename = NULL) {
  old <- options(list(stringsAsFactors = FALSE, scipen = 999))
  on.exit(options(old))
  dots <- rlang::dots_list(...)

  loader <- rds_from_url
  if (!is.null(dbConnection) && !is.null(tablename)) in_db <- TRUE else in_db <- FALSE

  if (isTRUE(seasons)) seasons <- 2002:most_recent_wbb_season()

  stopifnot(is.numeric(seasons),
            seasons >= 2002,
            seasons <= most_recent_wbb_season())

  urls <- paste0(
    "https://github.com/sportsdataverse/sportsdataverse-data/releases/download/",
    "espn_womens_college_basketball_rosters/rosters_", seasons, ".rds"
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


#' **Load wehoop WBB Player Season Stats**
#' @name load_wbb_player_stats
NULL
#' @title
#' **Load cleaned WBB player season stats from the data repo**
#' @rdname load_wbb_player_stats
#' @description Loads season-level player statistics scraped from ESPN. One row
#'   per athlete-team-season-statistic-grouping. Backed by the `wehoop-wbb-data`
#'   pipeline that reads raw JSONs from `wehoop-wbb-raw` and publishes
#'   parquet/rds artifacts to the
#'   `espn_womens_college_basketball_player_season_stats` release tag.
#' @param seasons A vector of 4-digit years associated with given women's
#'   college basketball seasons. (Min: 2002)
#' @param ... Additional arguments passed to an underlying function that writes
#'   the season data into a database.
#' @param dbConnection A `DBIConnection` object, as returned by [DBI::dbConnect()]
#' @param tablename The name of the player season stats table within the database
#' @return Returns a `wehoop_data` tibble of player season stats.
#' @export
#' @family WBB loader functions
#' @examples
#' \donttest{
#'   try(load_wbb_player_stats(seasons = most_recent_wbb_season()))
#' }
load_wbb_player_stats <- function(seasons = most_recent_wbb_season(), ...,
                                  dbConnection = NULL, tablename = NULL) {
  old <- options(list(stringsAsFactors = FALSE, scipen = 999))
  on.exit(options(old))
  dots <- rlang::dots_list(...)

  loader <- rds_from_url
  if (!is.null(dbConnection) && !is.null(tablename)) in_db <- TRUE else in_db <- FALSE

  if (isTRUE(seasons)) seasons <- 2002:most_recent_wbb_season()

  stopifnot(is.numeric(seasons),
            seasons >= 2002,
            seasons <= most_recent_wbb_season())

  urls <- paste0(
    "https://github.com/sportsdataverse/sportsdataverse-data/releases/download/",
    "espn_womens_college_basketball_player_season_stats/player_season_stats_",
    seasons, ".rds"
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


#' **Load wehoop WBB Team Season Stats**
#' @name load_wbb_team_stats
NULL
#' @title
#' **Load cleaned WBB team season stats from the data repo**
#' @rdname load_wbb_team_stats
#' @description Loads season-level team statistics scraped from ESPN. One row
#'   per team-season-statistic-grouping. Backed by the `wehoop-wbb-data`
#'   pipeline that reads raw JSONs from `wehoop-wbb-raw` and publishes
#'   parquet/rds artifacts to the
#'   `espn_womens_college_basketball_team_season_stats` release tag.
#' @param seasons A vector of 4-digit years associated with given women's
#'   college basketball seasons. (Min: 2002)
#' @param ... Additional arguments passed to an underlying function that writes
#'   the season data into a database.
#' @param dbConnection A `DBIConnection` object, as returned by [DBI::dbConnect()]
#' @param tablename The name of the team season stats table within the database
#' @return Returns a `wehoop_data` tibble of team season stats.
#'
#'    Columns as documented in the shared [basketball_load_wbb_team_stats_schema] table.
#'
#' @export
#' @family WBB loader functions
#' @examples
#' \donttest{
#'   try(load_wbb_team_stats(seasons = most_recent_wbb_season()))
#' }
load_wbb_team_stats <- function(seasons = most_recent_wbb_season(), ...,
                                dbConnection = NULL, tablename = NULL) {
  old <- options(list(stringsAsFactors = FALSE, scipen = 999))
  on.exit(options(old))
  dots <- rlang::dots_list(...)

  loader <- rds_from_url
  if (!is.null(dbConnection) && !is.null(tablename)) in_db <- TRUE else in_db <- FALSE

  if (isTRUE(seasons)) seasons <- 2002:most_recent_wbb_season()

  stopifnot(is.numeric(seasons),
            seasons >= 2002,
            seasons <= most_recent_wbb_season())

  urls <- paste0(
    "https://github.com/sportsdataverse/sportsdataverse-data/releases/download/",
    "espn_womens_college_basketball_team_season_stats/team_season_stats_",
    seasons, ".rds"
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


#' **Load wehoop WBB Standings**
#' @name load_wbb_standings
NULL
#' @title
#' **Load cleaned WBB season standings from the data repo**
#' @rdname load_wbb_standings
#' @description Loads season-level conference and overall standings scraped
#'   from ESPN. One row per team-season. Backed by the `wehoop-wbb-data`
#'   pipeline that reads raw JSONs from `wehoop-wbb-raw` and publishes
#'   parquet/rds artifacts to the
#'   `espn_womens_college_basketball_standings` release tag.
#' @param seasons A vector of 4-digit years associated with given women's
#'   college basketball seasons. (Min: 2002)
#' @param ... Additional arguments passed to an underlying function that writes
#'   the season data into a database.
#' @param dbConnection A `DBIConnection` object, as returned by [DBI::dbConnect()]
#' @param tablename The name of the standings data table within the database
#' @return Returns a `wehoop_data` tibble of team standings.
#'
#'    Columns as documented in the shared [basketball_load_wbb_standings_schema] table.
#'
#' @export
#' @family WBB loader functions
#' @examples
#' \donttest{
#'   try(load_wbb_standings(seasons = most_recent_wbb_season()))
#' }
load_wbb_standings <- function(seasons = most_recent_wbb_season(), ...,
                               dbConnection = NULL, tablename = NULL) {
  old <- options(list(stringsAsFactors = FALSE, scipen = 999))
  on.exit(options(old))
  dots <- rlang::dots_list(...)

  loader <- rds_from_url
  if (!is.null(dbConnection) && !is.null(tablename)) in_db <- TRUE else in_db <- FALSE

  if (isTRUE(seasons)) seasons <- 2002:most_recent_wbb_season()

  stopifnot(is.numeric(seasons),
            seasons >= 2002,
            seasons <= most_recent_wbb_season())

  urls <- paste0(
    "https://github.com/sportsdataverse/sportsdataverse-data/releases/download/",
    "espn_womens_college_basketball_standings/standings_", seasons, ".rds"
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


#' **Load wehoop WBB Shots**
#' @name load_wbb_shots
NULL
#' @title
#' **Load cleaned WBB shot events from the data repo**
#' @rdname load_wbb_shots
#' @description Loads shot events parsed from ESPN women's college basketball
#'   play-by-play feeds. One row per shot attempt (made or missed), with court
#'   coordinates and shot metadata. Backed by the `wehoop-wbb-data` pipeline
#'   that reads raw JSONs from `wehoop-wbb-raw` and publishes parquet/rds
#'   artifacts to the `espn_womens_college_basketball_shots` release tag.
#' @param seasons A vector of 4-digit years associated with given women's
#'   college basketball seasons. (Min: 2002)
#' @param ... Additional arguments passed to an underlying function that writes
#'   the season data into a database.
#' @param dbConnection A `DBIConnection` object, as returned by [DBI::dbConnect()]
#' @param tablename The name of the shots data table within the database
#' @return Returns a `wehoop_data` tibble with one row per shot attempt.
#'
#'    Columns as documented in the shared [basketball_load_wbb_shots_schema] table.
#'
#' @export
#' @family WBB loader functions
#' @examples
#' \donttest{
#'   try(load_wbb_shots(seasons = most_recent_wbb_season()))
#' }
load_wbb_shots <- function(seasons = most_recent_wbb_season(), ...,
                           dbConnection = NULL, tablename = NULL) {
  old <- options(list(stringsAsFactors = FALSE, scipen = 999))
  on.exit(options(old))
  dots <- rlang::dots_list(...)

  loader <- rds_from_url
  if (!is.null(dbConnection) && !is.null(tablename)) in_db <- TRUE else in_db <- FALSE

  if (isTRUE(seasons)) seasons <- 2002:most_recent_wbb_season()

  stopifnot(is.numeric(seasons),
            seasons >= 2002,
            seasons <= most_recent_wbb_season())

  urls <- paste0(
    "https://github.com/sportsdataverse/sportsdataverse-data/releases/download/",
    "espn_womens_college_basketball_shots/shots_", seasons, ".rds"
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


#' **Load wehoop WBB Game Rosters**
#' @name load_wbb_game_rosters
NULL
#' @title
#' **Load cleaned WBB per-game rosters from the data repo**
#' @rdname load_wbb_game_rosters
#' @description Loads per-game rosters scraped from ESPN women's college
#'   basketball box scores. One row per athlete-team-game triple, with athlete
#'   identifiers, jersey, position, starter flag, and DNP status. Backed by
#'   the `wehoop-wbb-data` pipeline that reads raw JSONs from
#'   `wehoop-wbb-raw` and publishes parquet/rds artifacts to the
#'   `espn_womens_college_basketball_game_rosters` release tag.
#' @param seasons A vector of 4-digit years associated with given women's
#'   college basketball seasons. (Min: 2002)
#' @param ... Additional arguments passed to an underlying function that writes
#'   the season data into a database.
#' @param dbConnection A `DBIConnection` object, as returned by [DBI::dbConnect()]
#' @param tablename The name of the game rosters data table within the database
#' @return Returns a `wehoop_data` tibble with one row per athlete-team-game.
#'
#'    Columns as documented in the shared [basketball_load_wbb_game_rosters_schema] table.
#'
#' @export
#' @family WBB loader functions
#' @examples
#' \donttest{
#'   try(load_wbb_game_rosters(seasons = most_recent_wbb_season()))
#' }
load_wbb_game_rosters <- function(seasons = most_recent_wbb_season(), ...,
                                  dbConnection = NULL, tablename = NULL) {
  old <- options(list(stringsAsFactors = FALSE, scipen = 999))
  on.exit(options(old))
  dots <- rlang::dots_list(...)

  loader <- rds_from_url
  if (!is.null(dbConnection) && !is.null(tablename)) in_db <- TRUE else in_db <- FALSE

  if (isTRUE(seasons)) seasons <- 2002:most_recent_wbb_season()

  stopifnot(is.numeric(seasons),
            seasons >= 2002,
            seasons <= most_recent_wbb_season())

  urls <- paste0(
    "https://github.com/sportsdataverse/sportsdataverse-data/releases/download/",
    "espn_womens_college_basketball_game_rosters/game_rosters_", seasons, ".rds"
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


#' **Load wehoop WBB Officials**
#' @name load_wbb_officials
NULL
#' @title
#' **Load cleaned WBB game officials from the data repo**
#' @rdname load_wbb_officials
#' @description Loads game-level officials data scraped from ESPN women's
#'   college basketball summary feeds. One row per official-game pair. Backed
#'   by the `wehoop-wbb-data` pipeline that reads raw JSONs from
#'   `wehoop-wbb-raw` and publishes parquet/rds artifacts to the
#'   `espn_womens_college_basketball_officials` release tag.
#' @param seasons A vector of 4-digit years associated with given women's
#'   college basketball seasons. (Min: 2002)
#' @param ... Additional arguments passed to an underlying function that writes
#'   the season data into a database.
#' @param dbConnection A `DBIConnection` object, as returned by [DBI::dbConnect()]
#' @param tablename The name of the officials data table within the database
#' @return Returns a `wehoop_data` tibble with one row per official-game pair.
#'
#'    Columns as documented in the shared [basketball_load_wbb_officials_schema] table.
#'
#' @export
#' @family WBB loader functions
#' @examples
#' \donttest{
#'   try(load_wbb_officials(seasons = most_recent_wbb_season()))
#' }
load_wbb_officials <- function(seasons = most_recent_wbb_season(), ...,
                               dbConnection = NULL, tablename = NULL) {
  old <- options(list(stringsAsFactors = FALSE, scipen = 999))
  on.exit(options(old))
  dots <- rlang::dots_list(...)

  loader <- rds_from_url
  if (!is.null(dbConnection) && !is.null(tablename)) in_db <- TRUE else in_db <- FALSE

  if (isTRUE(seasons)) seasons <- 2002:most_recent_wbb_season()

  stopifnot(is.numeric(seasons),
            seasons >= 2002,
            seasons <= most_recent_wbb_season())

  urls <- paste0(
    "https://github.com/sportsdataverse/sportsdataverse-data/releases/download/",
    "espn_womens_college_basketball_officials/officials_", seasons, ".rds"
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


#' **Build/update wehoop WBB play-by-play database**
#' @name update_wbb_db
NULL

#' @title 
#' **Update or create a wehoop WBB play-by-play database**
#' @rdname update_wbb_db
#' @description update_wbb_db() updates or creates a database with `wehoop`
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
#'   are written (one table per dataset, named `wbb_<dataset>` -- e.g.
#'   `wbb_rosters`, `wbb_player_stats`). Valid values:
#'   `"pbp"`, `"team_box"`, `"player_box"`, `"schedule"`, `"rosters"`,
#'   `"player_stats"`, `"team_stats"`, `"standings"`, `"shots"`,
#'   `"game_rosters"`, `"officials"`.
#' @param seasons Optional integer vector of seasons. Forwarded to the dataset
#'   loaders only when `datasets` is supplied. Defaults to all available
#'   seasons for the dataset (`seasons = TRUE`).
#' @return Logical TRUE/FALSE
#' @export
update_wbb_db <- function(dbdir = ".",
                          dbname = "wehoop_db",
                          tblname = "wehoop_wbb_pbp",
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
               "shots", "game_rosters", "officials")
    bad <- setdiff(datasets, valid)
    if (length(bad) > 0) {
      cli::cli_abort(c(
        "x" = "Unknown {.arg datasets} value{?s}: {.val {bad}}.",
        "i" = "Valid choices: {.val {valid}}."
      ))
    }
    loader_map <- list(
      pbp          = load_wbb_pbp,
      team_box     = load_wbb_team_box,
      player_box   = load_wbb_player_box,
      schedule     = load_wbb_schedule,
      rosters      = load_wbb_rosters,
      player_stats = load_wbb_player_stats,
      team_stats   = load_wbb_team_stats,
      standings    = load_wbb_standings,
      shots        = load_wbb_shots,
      game_rosters = load_wbb_game_rosters,
      officials    = load_wbb_officials
    )
    for (ds in datasets) {
      ds_table <- paste0("wbb_", ds)
      user_message(paste0("Writing wbb dataset '", ds, "' to table '", ds_table, "'..."), "todo")
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
    build_wbb_db(tblname, connection, rebuild = "NEW")
  } else if (DBI::dbExistsTable(connection, tblname) & all(force_rebuild != FALSE)) {
    build_wbb_db(tblname, connection, rebuild = force_rebuild)
  }

  # get completed games
  user_message("Checking for missing completed games...", "todo")
  completed_games <- load_wbb_games() %>%
    # completed games since 2006, excluding the broken games
    dplyr::filter(.data$season >= 2004) %>%
    dplyr::pull(.data$game_id)

  # function below
  missing <- get_missing_wbb_games(completed_games, connection, tblname)

  # rebuild db if number of missing games is too large
  if (length(missing) > 100) {
    build_wbb_db(tblname, connection, show_message = FALSE, rebuild = as.numeric(unique(stringr::str_sub(missing, 1, 4))))
    missing <- get_missing_wbb_games(completed_games, connection, tblname)
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
build_wbb_db <- function(tblname = "wehoop_wbb_pbp", db_conn, rebuild = FALSE, show_message = TRUE) {
  
  old <- options(list(stringsAsFactors = FALSE, scipen = 999))
  on.exit(options(old))
  valid_seasons <- load_wbb_games() %>%
    dplyr::filter(.data$season >= 2004) %>%
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
    load_wbb_pbp(rev(seasons), dbConnection = db_conn, tablename = tblname)
  }
}

# this is a helper function to check a list of completed games
# against the games that exist in a database connection
get_missing_wbb_games <- function(completed_games, dbConnection, tablename) {
  db_ids <- dplyr::tbl(dbConnection, tablename) %>%
    dplyr::select("game_id") %>%
    dplyr::distinct() %>%
    dplyr::collect() %>%
    dplyr::pull("game_id")
  
  need_scrape <- completed_games[!completed_games %in% db_ids]
  
  usethis::ui_info("{my_time()} | You have {length(db_ids)} games and are missing {length(need_scrape)}.")
  return(need_scrape)
}

#' @name load_wbb_player_core
NULL
#' @title
#' **Load cleaned WBB player core (identity + bio) from the data repo**
#' @rdname load_wbb_player_core
#' @description Loads ESPN WBB athlete core records -- identity and
#'   biographical fields, one row per athlete who appeared in the season.
#'   Backed by the `wehoop-wbb-data` pipeline that reads raw JSONs from
#'   `wehoop-wbb-raw` and publishes parquet/rds artifacts to the
#'   `espn_womens_college_basketball_player_core` release tag.
#'
#'   This is the only source of athlete bio in the pipeline: the player season
#'   stats payload carries no identity at all -- not even the athlete id.
#'
#'   Two properties of the source are worth knowing before joining:
#'   \itemize{
#'     \item \code{current_team_id} is the athlete's CURRENT team, not their
#'       team in the requested season. Season team lives in
#'       \code{load_wbb_player_box()} / \code{load_wbb_player_stats()}.
#'     \item Bio (height / weight / jersey) is a current snapshot that ESPN
#'       overwrites in place; it is not era-correct for a historical season.
#'       The season dimension here is participation, not the bio's vintage.
#'   }
#'   Field coverage is era-dependent by nature -- headshots exist only for
#'   modern players, while college and date of birth thin out the other way.
#' @param seasons A vector of 4-digit years associated with given WBB seasons.
#'   (Min: 2004)
#' @param ... Additional arguments passed to an underlying function that writes
#'   the season data into a database.
#' @param dbConnection A `DBIConnection` object, as returned by [DBI::dbConnect()]
#' @param tablename The name of the player core table within the database
#' @return Returns a `wehoop_data` tibble of athlete core records.
#' @export
#' @family WBB loader functions
#' @examples
#' \donttest{
#'   try(load_wbb_player_core(seasons = most_recent_wbb_season()))
#' }
load_wbb_player_core <- function(seasons = most_recent_wbb_season(), ...,
                                  dbConnection = NULL, tablename = NULL) {
  old <- options(list(stringsAsFactors = FALSE, scipen = 999))
  on.exit(options(old))
  dots <- rlang::dots_list(...)

  loader <- rds_from_url
  if (!is.null(dbConnection) && !is.null(tablename)) in_db <- TRUE else in_db <- FALSE

  if (isTRUE(seasons)) seasons <- 2004:most_recent_wbb_season()

  stopifnot(is.numeric(seasons),
            seasons >= 2004,
            seasons <= most_recent_wbb_season())

  urls <- paste0(
    "https://github.com/sportsdataverse/sportsdataverse-data/releases/download/",
    "espn_womens_college_basketball_player_core/player_core_", seasons, ".rds"
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
