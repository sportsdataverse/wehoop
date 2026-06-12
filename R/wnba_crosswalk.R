# wnba_crosswalk.R -- exported WNBA cross-source crosswalk builders.
# Thin wrappers over the .bb_* engine in crosswalk_basketball.R.

# Internal: assemble the wide team crosswalk from already-fetched source frames.
#' @keywords internal
#' @importFrom dplyr transmute left_join mutate select coalesce if_else
.bb_assemble_team_crosswalk_wnba <- function(espn, stats, fox, season) {
  espn2 <- dplyr::transmute(
    espn,
    espn_team_id = as.integer(.data$team_id),
    espn_abbreviation = as.character(.data$abbreviation),
    espn_display_name = as.character(.data$display_name),
    espn_short_name = as.character(.data$short_name),
    espn_location = as.character(.data$team),
    espn_mascot = as.character(.data$mascot),
    .team_key = .bb_normalize_team(.data$display_name)
  )
  stats2 <- dplyr::transmute(
    stats,
    wnba_team_id = as.character(.data$wnba_team_id),
    wnba_team_tricode = as.character(.data$wnba_team_tricode),
    wnba_team_name = as.character(.data$wnba_team_name),
    wnba_team_city = as.character(.data$wnba_team_city),
    wnba_team_slug = as.character(.data$wnba_team_slug),
    .team_key = .bb_normalize_team(paste(.data$wnba_team_city, .data$wnba_team_name))
  )
  if (is.null(fox) || !nrow(fox)) {
    fox2 <- data.frame(fox_team_id = character(), fox_team_name = character(),
                       .team_key = character(), stringsAsFactors = FALSE)
  } else {
    fox2 <- dplyr::transmute(
      fox,
      fox_team_id = as.character(.data$fox_team_id),
      fox_team_name = as.character(.data$fox_team_name),
      .team_key = .bb_normalize_team(.data$fox_team_name)
    )
  }

  out <- espn2 |>
    dplyr::left_join(stats2, by = ".team_key") |>
    dplyr::left_join(fox2, by = ".team_key") |>
    dplyr::mutate(
      season = as.integer(season),
      yahoo_team_id = NA_character_,
      yahoo_team_abbreviation = NA_character_,
      yahoo_team_name = NA_character_,
      match_method = dplyr::if_else(!is.na(.data$wnba_team_id), "exact_name", "unmatched"),
      match_confidence = dplyr::if_else(!is.na(.data$wnba_team_id), 1, NA_real_)
    ) |>
    dplyr::select(
      "season", "espn_team_id", "espn_abbreviation", "espn_display_name",
      "espn_short_name", "espn_location", "espn_mascot",
      "wnba_team_id", "wnba_team_tricode", "wnba_team_name", "wnba_team_city",
      "wnba_team_slug", "fox_team_id", "fox_team_name",
      "yahoo_team_id", "yahoo_team_abbreviation", "yahoo_team_name",
      "match_method", "match_confidence"
    )
  out
}

#' **Get the WNBA cross-source team crosswalk**
#' @name wnba_team_crosswalk
NULL
#' @title
#' **Get the WNBA cross-source team crosswalk**
#' @rdname wnba_team_crosswalk
#' @author Saiem Gilani
#' @description
#' Build a wide, one-row-per-team-per-season crosswalk linking ESPN, the WNBA
#' Stats API, and Fox Sports team identities, keyed on `espn_team_id`. Yahoo
#' columns are placeholders (NA) until that source is implemented.
#' @param season Season year (numeric). Defaults to the most recent WNBA season.
#' @return A `wehoop_data` tibble, one row per team:
#'
#'    |col_name          |types     |description                             |
#'    |:-----------------|:---------|:---------------------------------------|
#'    |season            |integer   |Season year.                            |
#'    |espn_team_id      |integer   |ESPN team id (canonical key).           |
#'    |espn_abbreviation |character |ESPN abbreviation.                      |
#'    |espn_display_name |character |ESPN display name.                      |
#'    |espn_short_name   |character |ESPN short name.                        |
#'    |espn_location     |character |ESPN team location.                     |
#'    |espn_mascot       |character |ESPN team mascot/nickname.              |
#'    |wnba_team_id      |character |WNBA Stats team id.                     |
#'    |wnba_team_tricode |character |WNBA Stats tricode.                     |
#'    |wnba_team_name    |character |WNBA Stats team name.                   |
#'    |wnba_team_city    |character |WNBA Stats team city.                   |
#'    |wnba_team_slug    |character |WNBA Stats team slug.                   |
#'    |fox_team_id       |character |Fox Bifrost team id.                    |
#'    |fox_team_name     |character |Fox team name.                          |
#'    |yahoo_team_id     |character |Yahoo team id (NA placeholder).         |
#'    |yahoo_team_abbreviation |character |Yahoo abbreviation (NA placeholder).|
#'    |yahoo_team_name   |character |Yahoo team name (NA placeholder).       |
#'    |match_method      |character |How the row was matched.                |
#'    |match_confidence  |numeric   |Match confidence (1 for deterministic). |
#'
#' @importFrom dplyr distinct select bind_rows transmute
#' @export
#' @family WNBA Crosswalk Functions
#' @examples
#' \donttest{
#'   try(wnba_team_crosswalk(season = 2024))
#' }
wnba_team_crosswalk <- function(season = most_recent_wnba_season()) {
  espn <- espn_wnba_teams()
  sched <- wnba_schedule(season = season)
  stats <- dplyr::bind_rows(
    dplyr::transmute(sched,
      wnba_team_id = .data$home_team_id, wnba_team_tricode = .data$home_team_tricode,
      wnba_team_name = .data$home_team_name, wnba_team_city = .data$home_team_city,
      wnba_team_slug = .data$home_team_slug),
    dplyr::transmute(sched,
      wnba_team_id = .data$away_team_id, wnba_team_tricode = .data$away_team_tricode,
      wnba_team_name = .data$away_team_name, wnba_team_city = .data$away_team_city,
      wnba_team_slug = .data$away_team_slug)
  ) |>
    dplyr::distinct()
  fox <- tryCatch(fox_wnba_teams(), error = function(e) NULL)
  .bb_assemble_team_crosswalk_wnba(espn, stats, fox, season) |>
    make_wehoop_data("WNBA team crosswalk (ESPN / WNBA Stats / Fox)", Sys.time())
}

#' @keywords internal
#' @importFrom dplyr full_join mutate select case_when if_else transmute
.bb_assemble_schedule_crosswalk_wnba <- function(espn_games, stats_games, team_xwalk, season) {
  e2s <- function(id) team_xwalk$espn_team_id[match(as.character(id), as.character(team_xwalk$wnba_team_id))]

  espn2 <- dplyr::transmute(
    espn_games,
    game_date = .data$game_date,
    home_espn_team_id = as.integer(.data$espn_home_team_id),
    away_espn_team_id = as.integer(.data$espn_away_team_id),
    espn_game_id = as.character(.data$espn_game_id)
  )
  stats2 <- dplyr::transmute(
    stats_games,
    game_date = .data$game_date,
    season_type = as.character(.data$season_type),
    home_espn_team_id = as.integer(e2s(.data$wnba_home_team_id)),
    away_espn_team_id = as.integer(e2s(.data$wnba_away_team_id)),
    wnba_game_id = as.character(.data$wnba_game_id),
    wnba_game_code = as.character(.data$wnba_game_code),
    wnba_home_team_id = as.character(.data$wnba_home_team_id),
    wnba_away_team_id = as.character(.data$wnba_away_team_id)
  )

  key <- c("game_date", "home_espn_team_id", "away_espn_team_id")
  out <- dplyr::full_join(espn2, stats2, by = key) |>
    dplyr::mutate(
      season = as.integer(season),
      espn_home_team_id = .data$home_espn_team_id,
      espn_away_team_id = .data$away_espn_team_id,
      fox_game_id = NA_character_,
      fox_home_team_id = NA_character_,
      fox_away_team_id = NA_character_,
      yahoo_game_id = NA_character_,
      match_method = dplyr::case_when(
        !is.na(.data$espn_game_id) & !is.na(.data$wnba_game_id) ~ "both",
        !is.na(.data$espn_game_id) ~ "espn_only",
        TRUE ~ "stats_only"
      ),
      match_confidence = dplyr::if_else(.data$match_method == "both", 1, NA_real_)
    ) |>
    dplyr::select(
      "season", "season_type", "game_date",
      "home_espn_team_id", "away_espn_team_id",
      "espn_game_id", "espn_home_team_id", "espn_away_team_id",
      "wnba_game_id", "wnba_game_code", "wnba_home_team_id", "wnba_away_team_id",
      "fox_game_id", "fox_home_team_id", "fox_away_team_id",
      "yahoo_game_id", "match_method", "match_confidence"
    )
  out
}

#' **Get the WNBA cross-source schedule crosswalk**
#' @name wnba_schedule_crosswalk
NULL
#' @title
#' **Get the WNBA cross-source schedule crosswalk**
#' @rdname wnba_schedule_crosswalk
#' @author Saiem Gilani
#' @description
#' Build a wide, one-row-per-game crosswalk linking ESPN and WNBA Stats game ids
#' (with NA Fox/Yahoo placeholders) for a season. Dates from both sources are
#' reduced to the local Eastern-Time game date before joining. Note: the WNBA
#' Stats CDN serves the current season only, so the live builder is effectively
#' current-season; historical coverage comes from cached release artifacts.
#' @param season Season year (numeric). Defaults to the most recent WNBA season.
#' @return A `wehoop_data` tibble, one row per game (columns: `season`,
#'   `season_type`, `game_date`, resolved `home_espn_team_id`/`away_espn_team_id`,
#'   `espn_game_id`, `wnba_game_id`, `wnba_game_code`, Fox/Yahoo placeholders,
#'   `match_method`, `match_confidence`).
#' @importFrom dplyr transmute distinct bind_rows
#' @export
#' @family WNBA Crosswalk Functions
#' @examples
#' \donttest{
#'   try(wnba_schedule_crosswalk(season = 2024))
#' }
wnba_schedule_crosswalk <- function(season = most_recent_wnba_season()) {
  team_xwalk <- wnba_team_crosswalk(season = season)

  stats <- wnba_schedule(season = season)
  st <- if ("season_type_description" %in% names(stats)) {
    stats$season_type_description
  } else if ("week_name" %in% names(stats)) {
    stats$week_name
  } else {
    NA_character_
  }
  stats_games <- dplyr::transmute(
    stats,
    wnba_game_id = .data$game_id,
    wnba_game_code = .data$game_code,
    game_date = .bb_to_eastern(.data$game_date_time_utc),
    wnba_home_team_id = .data$home_team_id,
    wnba_away_team_id = .data$away_team_id,
    season_type = st
  )

  # ESPN side: iterate the season's ET game dates (live) via the daily scoreboard.
  dates <- sort(unique(stats_games$game_date))
  espn_list <- lapply(dates, function(d) {
    sb <- tryCatch(espn_wnba_scoreboard(season = as.integer(format(d, "%Y%m%d"))),
                   error = function(e) NULL)
    if (is.null(sb) || !nrow(sb)) return(NULL)
    dplyr::transmute(
      sb,
      espn_game_id = .data$game_id,
      game_date = .bb_to_eastern(.data$game_date_time),
      espn_home_team_id = .data$home_team_id,
      espn_away_team_id = .data$away_team_id
    )
  })
  espn_games <- dplyr::bind_rows(espn_list)

  .bb_assemble_schedule_crosswalk_wnba(espn_games, stats_games, team_xwalk, season) |>
    make_wehoop_data("WNBA schedule crosswalk (ESPN / WNBA Stats)", Sys.time())
}
