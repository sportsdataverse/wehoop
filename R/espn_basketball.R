#' @name espn_basketball
#' @aliases espn_basketball espn_wnba espn_wbb
#' @title **ESPN Basketball Endpoint Overview (WNBA + WBB)**
#' @description
#' Wrappers around ESPN's basketball endpoints. Two parallel families
#' share a common set of internal helpers in `R/espn_basketball_*.R`:
#'
#' - `espn_wnba_*()` — ESPN WNBA wrappers
#' - `espn_wbb_*()` — ESPN women's college basketball wrappers
#'
#' Each public wrapper is a thin shim over an internal helper that
#' takes a `league` argument (`"wnba"` or
#' `"womens-college-basketball"`); the helper does the actual HTTP
#' call + parsing. Error reporting flows through ESPN-side reporters
#' `.report_api_error()` / `.report_api_warning()` in `R/utils.R`
#' (do **not** use raw `cli::cli_alert_danger()` here — that is the
#' WNBA Stats convention).
#'
#' @details
#'
#' ## **Play-by-play, scoreboard, schedule**
#'
#' | WNBA function | WBB function |
#' |---|---|
#' | [espn_wnba_pbp()]            | [espn_wbb_pbp()] |
#' | [espn_wnba_scoreboard()]     | [espn_wbb_scoreboard()] |
#' | [espn_wnba_game_all()]       | [espn_wbb_game_all()] |
#' | [espn_wnba_game_rosters()]   | [espn_wbb_game_rosters()] |
#' | [espn_wnba_player_box()]     | [espn_wbb_player_box()] |
#' | [espn_wnba_team_box()]       | [espn_wbb_team_box()] |
#'
#' ## **Reference data**
#'
#' | WNBA function | WBB function |
#' |---|---|
#' | [espn_wnba_teams()]          | [espn_wbb_teams()] |
#' | [espn_wnba_standings()]      | [espn_wbb_standings()] |
#' | [espn_wnba_player_stats()]   | [espn_wbb_player_stats()] |
#' | [espn_wnba_team_stats()]     | [espn_wbb_team_stats()] |
#' |                              | [espn_wbb_conferences()] |
#' |                              | [espn_wbb_rankings()] |
#'
#' ## **HTTP layer**
#'
#' ESPN wrappers call `.retry_request()` directly without `...`, so
#' per-call proxy overrides aren't supported. Use
#' `options(wehoop.proxy = ...)` or the `http_proxy` /
#' `https_proxy` env vars for proxy routing.
#'
#' @keywords ESPN
#' @family ESPN Basketball
NULL
