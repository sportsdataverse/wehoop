## probe_nba_endpoints_with_wnba_params.R
## ---------------------------------------
## Probe NBA-only hoopR endpoints (player-tracking, league-tracking,
## synergy, draft combine, draft history, etc.) with `LeagueID = "10"` to
## see which ones the WNBA Stats host actually populates for WNBA. Most
## tracking endpoints respond 200 with an empty resultSet skeleton (the
## WNBA doesn't publish player-tracking metrics) but a few — drafthistory
## in particular — do return WNBA data.
##
## Also re-probes a few endpoints that returned `MAP ERR` from
## `wnba_stats_map_result_sets()` (typically because the response used the
## singular `resultSet` key instead of `resultSets`) so we can see the raw
## shape for parser fixes.
##
## Run from package root:
##   Rscript tools/probes/probe_nba_endpoints_with_wnba_params.R
options(warn = 1)
suppressPackageStartupMessages(devtools::load_all(quiet = TRUE))

probe_raw <- function(label, endpoint, params) {
  cat("\n=== ", label, " (", endpoint, ") ===\n", sep = "")
  url <- paste0("https://stats.wnba.com/stats/", endpoint)
  resp <- tryCatch(
    wehoop:::request_with_proxy(url = url, params = params),
    error = function(e) { cat("  HTTP ERR:", conditionMessage(e), "\n"); NULL }
  )
  if (is.null(resp)) return(invisible(NULL))
  cat("  resp top-level: ", paste(names(resp), collapse=", "), "\n", sep="")
  if (!is.null(resp$resultSets)) {
    cat("  resultSets class:", class(resp$resultSets)[1], "\n")
    if (is.data.frame(resp$resultSets)) {
      cat("  resultSets has", nrow(resp$resultSets), "named result-sets:",
          paste(resp$resultSets$name, collapse=", "), "\n")
      for (i in seq_len(nrow(resp$resultSets))) {
        rs <- resp$resultSets$rowSet[[i]]
        cat(sprintf("    [%s] rows=%d cols=%d\n",
                    resp$resultSets$name[i],
                    length(rs),
                    length(resp$resultSets$headers[[i]])))
      }
    }
  }
  if (!is.null(resp$resultSet)) {
    cat("  resultSet (singular) class:", class(resp$resultSet)[1], "\n")
    cat("  resultSet$name:", resp$resultSet$name %||% "<null>", "\n")
    cat("  resultSet$headers:", length(resp$resultSet$headers %||% c()), "\n")
    cat("  resultSet$rowSet:", length(resp$resultSet$rowSet %||% list()), "rows\n")
  }
  Sys.sleep(3)
  invisible(resp)
}

`%||%` <- function(a, b) if (is.null(a)) b else a

game_id   <- "1022600021"
season_yy <- "2025-26"

## ----- (A) Re-probe the two failing redirect targets -----

## leagueleaders had `resp$resultSet[[1]]` subscript fail — that means the
## endpoint returned the singular `resultSet` key (not plural `resultSets`)
## which is what wnba_stats_map_result_sets falls back to but with a list
## structure mismatch when only one resultSet exists.
probe_raw("leagueleaders PerGame PTS", "leagueleaders",
          list(LeagueID = "10", PerMode = "PerGame", StatCategory = "PTS",
               Season = season_yy, SeasonType = "Regular Season",
               Scope = "S", ActiveFlag = "No"))

probe_raw("leagueleaders Totals", "leagueleaders",
          list(LeagueID = "10", PerMode = "Totals", StatCategory = "PTS",
               Season = season_yy, SeasonType = "Regular Season",
               Scope = "S", ActiveFlag = "No"))

## videodetailsasset — try a simpler param set, maybe last-shot context
probe_raw("videodetailsasset minimal", "videodetailsasset",
          list(LeagueID = "10", Season = season_yy,
               SeasonType = "Regular Season",
               TeamID = 0, PlayerID = 1628932, GameID = "",
               ContextMeasure = "FGM"))

## ----- (B) NBA-only hoopR functions not in wehoop — test LeagueID=10 -----

## These exist in hoopR but the equivalent wnba_ wrapper isn't exported.
## Endpoints worth checking:
## - playerdashptpass (passing tracking)
## - playerdashptreb (rebounding tracking)
## - playerdashptshotdefend (shot defense tracking)
## - playerdashptshots (shot tracking)
## - leaguedashptdefend (league defensive tracking)
## - leaguedashptstats (league passing/rebound tracking)
## - leaguedashptteamdefend (team defensive tracking)
## - shotchartdetail (already in wehoop?)
## - synergyplaytypes
## - draftcombinestats / draftcombineplayeranthro

## A'ja Wilson (PLAYER_ID 1628932) on Aces (TEAM_ID 1611661319)
team_id   <- "1611661319"
player_id <- "1628932"

probe_raw("playerdashptpass (A'ja)", "playerdashptpass",
          list(LeagueID = "10", PerMode = "PerGame", Season = season_yy,
               SeasonType = "Regular Season",
               LastNGames = 0, Month = 0, OpponentTeamID = 0,
               PlayerID = player_id, TeamID = team_id,
               DateFrom = "", DateTo = "", GameSegment = "",
               Location = "", Outcome = "", SeasonSegment = "",
               VsConference = "", VsDivision = ""))

probe_raw("playerdashptreb (A'ja)", "playerdashptreb",
          list(LeagueID = "10", PerMode = "PerGame", Season = season_yy,
               SeasonType = "Regular Season",
               LastNGames = 0, Month = 0, OpponentTeamID = 0,
               PlayerID = player_id, TeamID = team_id,
               DateFrom = "", DateTo = "", GameSegment = "",
               Location = "", Outcome = "", SeasonSegment = "",
               VsConference = "", VsDivision = ""))

probe_raw("playerdashptshots (A'ja)", "playerdashptshots",
          list(LeagueID = "10", PerMode = "PerGame", Season = season_yy,
               SeasonType = "Regular Season",
               LastNGames = 0, Month = 0, OpponentTeamID = 0,
               PlayerID = player_id, TeamID = team_id,
               DateFrom = "", DateTo = "", GameSegment = "",
               Location = "", Outcome = "", SeasonSegment = "",
               VsConference = "", VsDivision = ""))

probe_raw("playerdashptshotdefend (A'ja)", "playerdashptshotdefend",
          list(LeagueID = "10", PerMode = "PerGame", Season = season_yy,
               SeasonType = "Regular Season",
               LastNGames = 0, Month = 0, OpponentTeamID = 0,
               PlayerID = player_id, TeamID = team_id,
               DateFrom = "", DateTo = "", GameSegment = "",
               Location = "", Outcome = "", SeasonSegment = "",
               VsConference = "", VsDivision = ""))

probe_raw("leaguedashptdefend", "leaguedashptdefend",
          list(LeagueID = "10", PerMode = "PerGame", Season = season_yy,
               SeasonType = "Regular Season",
               DefenseCategory = "Overall",
               College = "", Conference = "", Country = "",
               DateFrom = "", DateTo = "", Division = "",
               DraftPick = "", DraftYear = "", GameSegment = "",
               Height = "", LastNGames = 0, Location = "",
               Month = 0, OpponentTeamID = 0, Outcome = "",
               PORound = "", PlayerExperience = "", PlayerID = 0,
               PlayerPosition = "", SeasonSegment = "",
               StarterBench = "", TeamID = 0, VsConference = "",
               VsDivision = "", Weight = ""))

probe_raw("leaguedashptstats", "leaguedashptstats",
          list(LeagueID = "10", PerMode = "PerGame", Season = season_yy,
               SeasonType = "Regular Season",
               PlayerOrTeam = "Player", PtMeasureType = "SpeedDistance",
               College = "", Conference = "", Country = "",
               DateFrom = "", DateTo = "", Division = "",
               DraftPick = "", DraftYear = "", GameScope = "",
               Height = "", LastNGames = 0, Location = "",
               Month = 0, OpponentTeamID = 0, Outcome = "",
               PORound = "", PlayerExperience = "", PlayerPosition = "",
               SeasonSegment = "", StarterBench = "", TeamID = 0,
               VsConference = "", VsDivision = "", Weight = ""))

probe_raw("synergyplaytypes player", "synergyplaytypes",
          list(LeagueID = "10", PerMode = "PerGame", PlayerOrTeam = "P",
               SeasonType = "Regular Season",
               SeasonYear = season_yy, PlayType = "Isolation",
               TypeGrouping = "offensive"))

probe_raw("draftcombinestats", "draftcombinestats",
          list(LeagueID = "10", SeasonYear = "2024"))

probe_raw("draftcombineplayeranthro", "draftcombineplayeranthro",
          list(LeagueID = "10", SeasonYear = "2024"))

probe_raw("drafthistory", "drafthistory",
          list(LeagueID = "10", Season = "2024",
               TeamID = 0, RoundNum = 0, RoundPick = 0,
               OverallPick = 0, TopX = 0, College = ""))

cat("\nDone.\n")
