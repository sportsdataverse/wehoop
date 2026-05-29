#' @name wnba_stats
#' @aliases wnba_stats wehoop_wnba_stats
#' @title **WNBA Stats API Endpoint Overview**
#' @description
#' Wrappers around the WNBA Stats backend at `stats.wnba.com/stats/...`.
#' All requests go through `request_with_proxy()` in
#' `utils_wnba_stats.R` which sets the required WNBA-side headers
#' (`Origin: https://stats.wnba.com`,
#' `Referer: https://www.wnba.com/`) and threads a proxy via
#' `getOption("wehoop.proxy")` / env vars / explicit `proxy =` arg.
#'
#' WNBA-specific differences vs the NBA Stats API:
#' quarters are 10 minutes (not 12), regulation is 40 minutes (not 48),
#' game IDs start with `"10"`, `LeagueID = "10"`.
#'
#' @details
#'
#' ## **Boxscores (V2)**
#'
#' Tabular `resultSets[]` responses parsed via `wnba_stats_map_result_sets()`.
#' See [wnba_boxscoreadvancedv2()], [wnba_boxscoretraditionalv2()],
#' [wnba_boxscorefourfactorsv2()],
#' [wnba_boxscoremiscv2()], [wnba_boxscoreplayertrackv2()],
#' [wnba_boxscorescoringv2()],
#' [wnba_boxscoresummaryv2()], [wnba_boxscoreusagev2()],
#' [wnba_hustlestatsboxscore()].
#'
#' ## **Boxscores (V3)**
#'
#' Nested JSON parsed via `purrr::pluck()`. See
#' [wnba_boxscoreadvancedv3()], [wnba_boxscoretraditionalv3()],
#' [wnba_boxscorefourfactorsv3()], [wnba_boxscoremiscv3()],
#' [wnba_boxscoreplayertrackv3()], [wnba_boxscorescoringv3()],
#' [wnba_boxscoreusagev3()].
#'
#' ## **Play-by-play**
#'
#' | Function | Purpose |
#' |---|---|
#' | [wnba_pbp()]                  | V2 + V3 PBP (with V3-to-V2 conversion pipeline) |
#' | [wnba_pbps()]                 | Multi-game PBP loader |
#' | [wnba_playbyplayv3()]         | V3-only PBP |
#'
#' ## **Leaders, standings, league**
#'
#' [wnba_leagueleaders()], [wnba_leaguestandingsv3()],
#' [wnba_homepageleaders()], [wnba_leaderstiles()].
#'
#' ## **Player + team season + game stats**
#'
#' Full per-mode / per-split families. Search the reference index for
#' `wnba_playerdashboard*`, `wnba_teamdashboard*`,
#' `wnba_leaguedashplayerstats()`, `wnba_leaguedashteamstats()`,
#' `wnba_playergamelogs()`, `wnba_teamgamelogs()`,
#' `wnba_playerprofile*`.
#'
#' ## **Schedule + scoreboard**
#'
#' [wnba_schedule()], [wnba_scoreboard()], [wnba_scoreboardv2()],
#' [wnba_scoreboardv3()], [wnba_todays_scoreboard()].
#'
#' ## **Draft + franchise + reference**
#'
#' [wnba_draftboard()], [wnba_drafthistory()],
#' [wnba_draftcombinestats()],
#' [wnba_franchisehistory()], [wnba_franchiseleaders()].
#'
#' @keywords WNBA Stats API
#' @family WNBA Stats
NULL
