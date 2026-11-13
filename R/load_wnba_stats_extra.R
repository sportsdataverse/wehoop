# Per-season WNBA Stats release loaders for the tags published after the
# original load_wnba_stats_*() set (R/load_wnba_stats.R).

# Shared body: reads `<tag>/<prefix>_<season>.rds`, accepting only
# `first`..most_recent_wnba_stats_season() (see .loader_seasons()).
.load_wnba_stats_release <- function(seasons, tag, prefix, first, fn, default = FALSE,
                                     dbConnection = NULL, tablename = NULL, ...) {
  old <- options(list(stringsAsFactors = FALSE, scipen = 999))
  on.exit(options(old))

  url_for <- function(seasons) paste0(
    "https://github.com/sportsdataverse/sportsdataverse-data/releases/download/",
    tag, "/", prefix, "_", seasons, ".rds"
  )
  seasons <- .loader_seasons(seasons, first, most_recent_wnba_stats_season(),
                             fn = fn, url_for = url_for, default = default)

  p <- NULL
  if (is_installed("progressr")) p <- progressr::progressor(along = seasons)

  out <- lapply(url_for(seasons), progressively(rds_from_url, p))
  out <- data.table::rbindlist(out, use.names = TRUE, fill = TRUE)
  if (!is.null(dbConnection) && !is.null(tablename)) {
    DBI::dbWriteTable(dbConnection, tablename, out, append = TRUE, ...)
    return(NULL)
  }
  class(out) <- c("wehoop_data", "tbl_df", "tbl", "data.frame")
  out
}


#' **Load wehoop WNBA Stats per-event game lineups**
#' @name load_wnba_stats_game_lineups
NULL
#' @title
#' **Load the five players on court for every WNBA Stats play-by-play event**
#' @rdname load_wnba_stats_game_lineups
#' @description Loads the on-court lineups for every event of the WNBA Stats
#'   API play-by-play: one row per game and `action_number`, with the five
#'   home and five away player ids on the floor at that event. Join it to
#'   [load_wnba_stats_pbp()] on `game_id` + `action_number`. Backed by the
#'   `wnba_stats_game_lineups` release tag (assets `wnba_lineups_{season}`,
#'   labelled by the calendar year the season was played).
#' @param seasons A vector of 4-digit years associated with given WNBA seasons.
#'   Published coverage runs 1997 through the most recent season, with no
#'   gaps. Pass `seasons = TRUE` for every published season. (Min: 1997)
#' @param ... Additional arguments passed to an underlying function that writes
#'   the season data into a database.
#' @param dbConnection A `DBIConnection` object, as returned by [DBI::dbConnect()]
#' @param tablename The name of the game lineups data table within the database
#' @return Returns a `wehoop_data` tibble with one row per play-by-play event.
#'
#'    |col_name      |types     |description                                     |
#'    |:-------------|:---------|:-----------------------------------------------|
#'    |game_id       |character |Unique game identifier (10-digit, zero-padded). |
#'    |action_number |integer   |Play-by-play action number within the game.     |
#'    |period        |integer   |Period of the game.                             |
#'    |home_player_1 |integer   |Home lineup slot 1 player identifier.           |
#'    |home_player_2 |integer   |Home lineup slot 2 player identifier.           |
#'    |home_player_3 |integer   |Home lineup slot 3 player identifier.           |
#'    |home_player_4 |integer   |Home lineup slot 4 player identifier.           |
#'    |home_player_5 |integer   |Home lineup slot 5 player identifier.           |
#'    |away_player_1 |integer   |Away lineup slot 1 player identifier.           |
#'    |away_player_2 |integer   |Away lineup slot 2 player identifier.           |
#'    |away_player_3 |integer   |Away lineup slot 3 player identifier.           |
#'    |away_player_4 |integer   |Away lineup slot 4 player identifier.           |
#'    |away_player_5 |integer   |Away lineup slot 5 player identifier.           |
#'    |season        |integer   |Season identifier (4-digit year).               |
#'
#' @source <https://github.com/sportsdataverse/sportsdataverse-data/releases/tag/wnba_stats_game_lineups>
#' @export
#' @family WNBA Stats loader functions
#' @examplesIf interactive()
#' \donttest{
#'   # A season of this table is a multi-MB download, so the example runs interactively only.
#'   try(load_wnba_stats_game_lineups(seasons = most_recent_wnba_stats_season()))
#' }
load_wnba_stats_game_lineups <- function(seasons = most_recent_wnba_stats_season(),
                                         ...,
                                         dbConnection = NULL, tablename = NULL) {
  .load_wnba_stats_release(seasons, "wnba_stats_game_lineups", "wnba_lineups", 1997,
                           fn = "load_wnba_stats_game_lineups", default = missing(seasons),
                           dbConnection = dbConnection, tablename = tablename, ...)
}


#' **Load wehoop WNBA Stats metric curves**
#' @name load_wnba_stats_metric_curves
NULL
#' @title
#' **Load WNBA Stats field-goal percentage by shot distance curves**
#' @rdname load_wnba_stats_metric_curves
#' @description Loads metric-by-continuous-axis curves built from the WNBA
#'   Stats API shots: for the league, each team and each player, attempts,
#'   makes and rate in one-foot shot-distance buckets
#'   (`metric = "fg_pct_by_shot_distance"`, bucket `[x_lo, x_hi)`). Built
#'   with sportsdataverse-py's `metric_curves()` and published to the
#'   `wnba_stats_metric_curves` release tag.
#' @inheritParams load_wnba_stats_game_lineups
#' @param tablename The name of the metric curves data table within the database
#' @return Returns a `wehoop_data` tibble with one row per entity, metric and
#'   bucket.
#'
#'    |col_name    |types     |description                                              |
#'    |:-----------|:---------|:--------------------------------------------------------|
#'    |season      |integer   |Season identifier (4-digit year).                        |
#'    |entity_type |character |Grain of the row: `league`, `team` or `player`.          |
#'    |entity_id   |character |WNBA Stats team or player id (`NA` for `league` rows).   |
#'    |entity_name |character |Team or player name (`NA` for `league` rows).            |
#'    |team_id     |character |WNBA Stats team id of a player row.                      |
#'    |id_source   |character |Id namespace of `entity_id` / `team_id` (`wnba_stats`).  |
#'    |metric      |character |Curve name (`fg_pct_by_shot_distance`).                  |
#'    |down        |integer   |Football-only down split; always `NA` here.              |
#'    |x_lo        |numeric   |Lower bound of the bucket (feet, inclusive).             |
#'    |x_hi        |numeric   |Upper bound of the bucket (feet, exclusive).             |
#'    |attempts    |integer   |Field goal attempts in the bucket.                       |
#'    |successes   |integer   |Field goals made in the bucket.                          |
#'    |rate        |numeric   |`successes / attempts`.                                  |
#'    |epa_per_att |numeric   |Football-only EPA per attempt; always `NA` here.         |
#'
#' @source <https://github.com/sportsdataverse/sportsdataverse-data/releases/tag/wnba_stats_metric_curves>
#' @export
#' @family WNBA Stats loader functions
#' @examples
#' \donttest{
#'   try(load_wnba_stats_metric_curves(seasons = most_recent_wnba_stats_season()))
#' }
load_wnba_stats_metric_curves <- function(seasons = most_recent_wnba_stats_season(),
                                          ...,
                                          dbConnection = NULL, tablename = NULL) {
  .load_wnba_stats_release(seasons, "wnba_stats_metric_curves", "metric_curves", 1997,
                           fn = "load_wnba_stats_metric_curves", default = missing(seasons),
                           dbConnection = dbConnection, tablename = tablename, ...)
}


#' **Load wehoop WNBA Stats rolling windows**
#' @name load_wnba_stats_rolling_windows
NULL
#' @title
#' **Load WNBA Stats player shooting form over rolling shot windows**
#' @rdname load_wnba_stats_rolling_windows
#' @description Loads event-count rolling windows built from the WNBA Stats
#'   API shots: for each player, field-goal and three-point percentage over
#'   her last 50 and 200 attempts (`window_unit`, `window_n`), set against
#'   the window before it, her season start and her career baseline. Built
#'   with sportsdataverse-py's `rolling_windows()` and published to the
#'   `wnba_stats_rolling_windows` release tag.
#' @inheritParams load_wnba_stats_game_lineups
#' @param tablename The name of the rolling windows data table within the database
#' @return Returns a `wehoop_data` tibble with one row per player, metric and
#'   window.
#'
#'    |col_name        |types     |description                                              |
#'    |:---------------|:---------|:--------------------------------------------------------|
#'    |season          |integer   |Season identifier (4-digit year).                        |
#'    |entity_type     |character |Grain of the row (`player`).                             |
#'    |entity_id       |character |WNBA Stats player id.                                    |
#'    |entity_name     |character |Player name.                                             |
#'    |team_id         |character |WNBA Stats team id.                                      |
#'    |metric          |character |`fg_pct` or `fg3_pct`.                                   |
#'    |window_unit     |character |Event the window counts (`fga` or `fg3a`).               |
#'    |window_n        |integer   |Window length in events (50 or 200).                     |
#'    |cur             |numeric   |Rate over the most recent window.                        |
#'    |prev            |numeric   |Rate over the window before it.                          |
#'    |season_start    |numeric   |Rate over the first window of the season.                |
#'    |career_baseline |numeric   |Career rate through this season.                         |
#'    |delta_prev      |numeric   |`cur - prev`.                                            |
#'    |delta_season    |numeric   |`cur - season_start`.                                    |
#'    |delta_career    |numeric   |`cur - career_baseline`.                                 |
#'    |delta_prev_rank |integer   |Rank of `delta_prev` among qualified players.            |
#'    |n               |integer   |Events in the current window.                            |
#'    |qualified       |logical   |Whether the player has a full window.                    |
#'    |last_event_date |Date      |Date of the player's latest event in the window.         |
#'    |as_of_date      |Date      |Date the table was built.                                |
#'    |id_source       |character |Id namespace of `entity_id` / `team_id` (`wnba_stats`).  |
#'
#' @source <https://github.com/sportsdataverse/sportsdataverse-data/releases/tag/wnba_stats_rolling_windows>
#' @export
#' @family WNBA Stats loader functions
#' @examples
#' \donttest{
#'   try(load_wnba_stats_rolling_windows(seasons = most_recent_wnba_stats_season()))
#' }
load_wnba_stats_rolling_windows <- function(seasons = most_recent_wnba_stats_season(),
                                            ...,
                                            dbConnection = NULL, tablename = NULL) {
  .load_wnba_stats_release(seasons, "wnba_stats_rolling_windows", "rolling_windows", 1997,
                           fn = "load_wnba_stats_rolling_windows", default = missing(seasons),
                           dbConnection = dbConnection, tablename = tablename, ...)
}


#' **Load wehoop WNBA Stats box scores**
#' @name load_wnba_stats_player_boxscores
NULL
#' @title
#' **Load WNBA Stats API player and team box scores from the data repo**
#' @rdname load_wnba_stats_player_boxscores
#' @description `load_wnba_stats_player_boxscores()` loads WNBA Stats API
#'   (`boxscoretraditionalv3`) player box scores, one row per player per
#'   game, from the `wnba_stats_player_boxscores` release tag.
#'   `load_wnba_stats_team_boxscores()` loads the matching team totals, one
#'   row per team per game, from the `wnba_stats_team_boxscores` release
#'   tag. Both carry the WNBA Stats ids (`team_id`, `person_id`, `game_id`),
#'   not ESPN's; for ESPN box scores see [load_wnba_player_box()] and
#'   [load_wnba_team_box()].
#' @param seasons A vector of 4-digit years associated with given WNBA seasons.
#'   Both releases start in 2026, so coverage runs 2026 through the most
#'   recent season. Pass `seasons = TRUE` for every published season.
#'   (Min: 2026)
#' @inheritParams load_wnba_stats_game_lineups
#' @param tablename The name of the box score data table within the database
#' @return `load_wnba_stats_player_boxscores()` returns a `wehoop_data`
#'   tibble with one row per player per game:
#'
#'    |col_name                  |types     |description                                     |
#'    |:-------------------------|:---------|:-----------------------------------------------|
#'    |team_id                   |integer   |WNBA Stats team identifier.                     |
#'    |team_name                 |character |Team nickname (e.g. 'Liberty').                 |
#'    |team_tricode              |character |Three-letter team code (e.g. 'NYL').            |
#'    |side                      |character |`home` or `away`.                               |
#'    |person_id                 |integer   |WNBA Stats player identifier.                   |
#'    |first_name                |character |Player first name.                              |
#'    |family_name               |character |Player last name.                               |
#'    |name_i                    |character |Abbreviated name (e.g. 'B. Stewart').           |
#'    |player_slug               |character |URL slug of the player.                         |
#'    |position                  |character |Starting position (blank for reserves).         |
#'    |comment                   |character |Did-not-play reason, if any.                    |
#'    |jersey_num                |character |Jersey number.                                  |
#'    |minutes                   |character |Minutes played (`MM:SS`).                       |
#'    |field_goals_made          |integer   |Field goals made.                               |
#'    |field_goals_attempted     |integer   |Field goals attempted.                          |
#'    |field_goals_percentage    |numeric   |Field goal percentage (0-1).                    |
#'    |three_pointers_made       |integer   |Three-pointers made.                            |
#'    |three_pointers_attempted  |integer   |Three-pointers attempted.                       |
#'    |three_pointers_percentage |numeric   |Three-point percentage (0-1).                   |
#'    |free_throws_made          |integer   |Free throws made.                               |
#'    |free_throws_attempted     |integer   |Free throws attempted.                          |
#'    |free_throws_percentage    |numeric   |Free throw percentage (0-1).                    |
#'    |rebounds_offensive        |integer   |Offensive rebounds.                             |
#'    |rebounds_defensive        |integer   |Defensive rebounds.                             |
#'    |rebounds_total            |integer   |Total rebounds.                                 |
#'    |assists                   |integer   |Assists.                                        |
#'    |steals                    |integer   |Steals.                                         |
#'    |blocks                    |integer   |Blocks.                                         |
#'    |turnovers                 |integer   |Turnovers.                                      |
#'    |fouls_personal            |integer   |Personal fouls.                                 |
#'    |points                    |integer   |Points.                                         |
#'    |plus_minus_points         |numeric   |Plus/minus while on court.                      |
#'    |game_id                   |character |Unique game identifier (10-digit, zero-padded). |
#'    |season                    |integer   |Season identifier (4-digit year).               |
#'
#'   `load_wnba_stats_team_boxscores()` returns a `wehoop_data` tibble with
#'   one row per team per game: `team_id`, `team_name`, `team_tricode`,
#'   `side`, `minutes`, the same shooting, rebounding and counting columns
#'   from `field_goals_made` through `plus_minus_points`, `game_id` and
#'   `season`.
#' @source <https://github.com/sportsdataverse/sportsdataverse-data/releases/tag/wnba_stats_player_boxscores>,
#'   <https://github.com/sportsdataverse/sportsdataverse-data/releases/tag/wnba_stats_team_boxscores>
#' @export
#' @family WNBA Stats loader functions
#' @examples
#' \donttest{
#'   try(load_wnba_stats_player_boxscores(seasons = 2026))
#'   try(load_wnba_stats_team_boxscores(seasons = 2026))
#' }
load_wnba_stats_player_boxscores <- function(seasons = most_recent_wnba_stats_season(),
                                             ...,
                                             dbConnection = NULL, tablename = NULL) {
  .load_wnba_stats_release(seasons, "wnba_stats_player_boxscores", "player_boxscores", 2026,
                           fn = "load_wnba_stats_player_boxscores", default = missing(seasons),
                           dbConnection = dbConnection, tablename = tablename, ...)
}

#' @rdname load_wnba_stats_player_boxscores
#' @export
load_wnba_stats_team_boxscores <- function(seasons = most_recent_wnba_stats_season(),
                                           ...,
                                           dbConnection = NULL, tablename = NULL) {
  .load_wnba_stats_release(seasons, "wnba_stats_team_boxscores", "team_boxscores", 2026,
                           fn = "load_wnba_stats_team_boxscores", default = missing(seasons),
                           dbConnection = dbConnection, tablename = tablename, ...)
}
