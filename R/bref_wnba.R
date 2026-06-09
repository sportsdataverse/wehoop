#' @title
#' **Basketball-Reference WNBA Player Season Stats**
#' @description
#' **Get WNBA league-wide player season statistics from
#' [Basketball-Reference](https://www.basketball-reference.com/wnba/).**
#'
#' One row per player for a season. No account or API key is required.
#' Basketball-Reference rate-limits aggressive scraping (~20 requests/minute) --
#' space repeated calls with `Sys.sleep()`.
#' @param season Season, in 4-digit year format (e.g. `2024`). Defaults to
#'   `most_recent_wnba_season()`.
#' @param table Which stats table -- one of `"per_game"` (default), `"totals"`
#'   or `"advanced"`.
#' @return A `wehoop_data` tibble with one row per player, carrying `season` and
#'   `table` columns.
#'
#'    |col_name |types     |
#'    |:--------|:---------|
#'    |player   |character |
#'    |team_id  |character |
#'    |pos      |character |
#'    |g        |numeric   |
#'    |pts_per_g|numeric   |
#'    |season   |integer   |
#'    |table    |character |
#'
#' @importFrom janitor clean_names
#' @importFrom dplyr as_tibble rename any_of
#' @export
#' @family WNBA Basketball-Reference Functions
#' @examples
#' \donttest{
#'   try(bref_wnba_player_stats(season = 2024, table = "per_game"))
#' }
bref_wnba_player_stats <- function(season = most_recent_wnba_season(), table = "per_game") {
  .args <- .capture_args()

  df <- data.frame()

  tryCatch(
    expr = {
      if (!table %in% c("per_game", "totals", "advanced")) {
        stop("`table` must be one of 'per_game', 'totals', 'advanced'", call. = FALSE)
      }
      html <- .bref_wnba_text(sprintf("/wnba/years/%s_%s.html", season, table))
      d <- .bref_wnba_table(html, table)
      if (nrow(d) == 0) stop("WNBA player-stats table not found", call. = FALSE)
      d <- .bref_wnba_finish(d)
      d <- dplyr::rename(d, dplyr::any_of(c("player" = "name_display", "team_id" = "team_name_abbr")))
      if ("player" %in% names(d)) d <- d[!is.na(d[["player"]]) & d[["player"]] != "Player", , drop = FALSE]
      d[["season"]] <- as.integer(season)
      d[["table"]] <- table
      df <- make_wehoop_data(d, "WNBA player season stats from basketball-reference.com", Sys.time())
    },
    error = function(e) {
      .report_api_error(e, hint = "No WNBA player stats for {season} ({table})!", args = .args)
    },
    warning = function(w) {
      .report_api_warning(w, hint = "Warning fetching WNBA player stats for {season}", args = .args)
    },
    finally = {
    }
  )
  return(df)
}

#' @title
#' **Basketball-Reference WNBA Team Season Stats**
#' @description
#' **Get WNBA team season statistics from
#' [Basketball-Reference](https://www.basketball-reference.com/wnba/).**
#'
#' One row per team for a season. No account or API key is required.
#' @param season Season, 4-digit year format (e.g. `2024`). Defaults to
#'   `most_recent_wnba_season()`.
#' @param table Which stats table -- one of `"per_game"` (default), `"totals"`,
#'   `"per_poss"` or `"advanced"`.
#' @return A `wehoop_data` tibble with one row per team, carrying `season` and
#'   `table` columns.
#'
#'    |col_name |types     |
#'    |:--------|:---------|
#'    |team     |character |
#'    |g        |numeric   |
#'    |pts_per_g|numeric   |
#'    |season   |integer   |
#'    |table    |character |
#'
#' @importFrom janitor clean_names
#' @importFrom dplyr as_tibble rename any_of
#' @export
#' @family WNBA Basketball-Reference Functions
#' @examples
#' \donttest{
#'   try(bref_wnba_team_stats(season = 2024, table = "per_game"))
#' }
bref_wnba_team_stats <- function(season = most_recent_wnba_season(), table = "per_game") {
  .args <- .capture_args()

  df <- data.frame()

  tryCatch(
    expr = {
      if (!table %in% c("per_game", "totals", "per_poss", "advanced")) {
        stop("`table` must be one of 'per_game', 'totals', 'per_poss', 'advanced'", call. = FALSE)
      }
      html <- .bref_wnba_text(sprintf("/wnba/years/%s.html", season))
      d <- .bref_wnba_table(html, paste0(table, "-team"))
      if (nrow(d) == 0) stop("WNBA team-stats table not found", call. = FALSE)
      d <- .bref_wnba_finish(d)
      d <- dplyr::rename(d, dplyr::any_of(c("team" = "team_name")))
      if ("team" %in% names(d)) d <- d[!is.na(d[["team"]]) & d[["team"]] != "League Average", , drop = FALSE]
      d[["season"]] <- as.integer(season)
      d[["table"]] <- table
      df <- make_wehoop_data(d, "WNBA team season stats from basketball-reference.com", Sys.time())
    },
    error = function(e) {
      .report_api_error(e, hint = "No WNBA team stats for {season} ({table})!", args = .args)
    },
    warning = function(w) {
      .report_api_warning(w, hint = "Warning fetching WNBA team stats for {season}", args = .args)
    },
    finally = {
    }
  )
  return(df)
}

#' @title
#' **Basketball-Reference WNBA Standings**
#' @description
#' **Get WNBA standings (both conferences) from
#' [Basketball-Reference](https://www.basketball-reference.com/wnba/).**
#'
#' One row per team with record and win percentage, labelled by a `conference`
#' column (`Eastern` / `Western`). No account or API key is required.
#' @param season Season, 4-digit year format (e.g. `2024`). Defaults to
#'   `most_recent_wnba_season()`.
#' @return A `wehoop_data` tibble with one row per team:
#'
#'    |col_name     |types     |
#'    |:------------|:---------|
#'    |team         |character |
#'    |wins         |numeric   |
#'    |losses       |numeric   |
#'    |win_loss_pct |numeric   |
#'    |conference   |character |
#'    |season       |integer   |
#'
#' @importFrom janitor clean_names
#' @importFrom dplyr as_tibble bind_rows rename any_of
#' @export
#' @family WNBA Basketball-Reference Functions
#' @examples
#' \donttest{
#'   try(bref_wnba_standings(season = 2024))
#' }
bref_wnba_standings <- function(season = most_recent_wnba_season()) {
  .args <- .capture_args()

  df <- data.frame()

  tryCatch(
    expr = {
      html <- .bref_wnba_text(sprintf("/wnba/years/%s.html", season))
      parse_conf <- function(id, label) {
        d <- .bref_wnba_table(html, id)
        if (nrow(d) == 0) return(NULL)
        d <- .bref_wnba_finish(d)
        d <- dplyr::rename(d, dplyr::any_of(c("team" = "team_name")))
        d[["conference"]] <- label
        d
      }
      parts <- list(parse_conf("standings_e", "Eastern"),
                    parse_conf("standings_w", "Western"))
      parts <- parts[!vapply(parts, is.null, logical(1))]
      if (!length(parts)) stop("WNBA standings tables not found", call. = FALSE)
      d <- dplyr::bind_rows(parts)
      d[["season"]] <- as.integer(season)
      df <- make_wehoop_data(d, "WNBA standings from basketball-reference.com", Sys.time())
    },
    error = function(e) {
      .report_api_error(e, hint = "No WNBA standings for {season}!", args = .args)
    },
    warning = function(w) {
      .report_api_warning(w, hint = "Warning fetching WNBA standings for {season}", args = .args)
    },
    finally = {
    }
  )
  return(df)
}
