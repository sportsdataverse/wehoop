## probe_pr50_candidates.R
## ------------------------
## Live-probe the 6 PR #50 endpoint wrappers that the existing
## `probe_nba_endpoints_with_wnba_params.R` does NOT cover, against
## `LeagueID = "10"` on stats.wnba.com. Companion to that probe — same
## helper, same cadence, same goal (does the WNBA host actually populate
## this endpoint, or does it 200 with an empty rowSet?).
##
## Endpoints under test:
##   - leaguestandings           (V2 standings, expected: populates)
##   - teamandplayersvsplayers   (matchup endpoint, expected: unknown)
##   - leaguedashptteamdefend    (team-level tracking, expected: empty)
##   - teamdashptpass            (team-level tracking, expected: empty)
##   - teamdashptreb             (team-level tracking, expected: empty)
##   - teamdashptshots           (team-level tracking, expected: empty)
##
## Run from package root:
##   Rscript tools/probes/probe_pr50_candidates.R
options(warn = 1)
suppressPackageStartupMessages(devtools::load_all(quiet = TRUE))

`%||%` <- function(a, b) if (is.null(a)) b else a

probe_raw <- function(label, endpoint, params) {
  cat("\n=== ", label, " (", endpoint, ") ===\n", sep = "")
  url <- paste0("https://stats.wnba.com/stats/", endpoint)
  resp <- tryCatch(
    wehoop:::request_with_proxy(url = url, params = params),
    error = function(e) { cat("  HTTP ERR:", conditionMessage(e), "\n"); NULL }
  )
  if (is.null(resp)) return(invisible(NULL))
  cat("  resp top-level: ", paste(names(resp), collapse = ", "), "\n", sep = "")
  if (!is.null(resp$resultSets)) {
    cat("  resultSets class:", class(resp$resultSets)[1], "\n")
    if (is.data.frame(resp$resultSets)) {
      cat("  resultSets has", nrow(resp$resultSets), "named result-sets:",
          paste(resp$resultSets$name, collapse = ", "), "\n")
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

season_yy <- "2025-26"

## Aces / A'ja Wilson and Liberty / Sabrina Ionescu for matchup tests
aces_id    <- "1611661319"
liberty_id <- "1611661313"
aja_id     <- "1628932"
sabrina_id <- "1629137"

## ----- (1) leaguestandings (V2, basic non-tracking) -----
## Bot PR shape: LeagueID + Season + SeasonType + SeasonYear.
## Try with both "2025-26" Season form and integer-style "2025" + SeasonYear.
probe_raw("leaguestandings (Season=2025-26)", "leaguestandings",
          list(LeagueID = "10", Season = season_yy,
               SeasonType = "Regular Season", SeasonYear = ""))

probe_raw("leaguestandings (Season=2025 + SeasonYear)", "leaguestandings",
          list(LeagueID = "10", Season = "2025",
               SeasonType = "Regular Season", SeasonYear = "2025-26"))

## ----- (2) teamandplayersvsplayers (matchup endpoint) -----
## Heavy param surface — try a minimal call with Aces vs Liberty + 1 player each.
probe_raw("teamandplayersvsplayers (ACES vs LIB, A'ja vs Sabrina)",
          "teamandplayersvsplayers",
          list(LeagueID = "10", Season = season_yy,
               SeasonType = "Regular Season",
               MeasureType = "Base", PerMode = "PerGame",
               PlusMinus = "N", PaceAdjust = "N", Rank = "N",
               TeamID = aces_id, VsTeamID = liberty_id,
               PlayerID1 = aja_id, PlayerID2 = 0, PlayerID3 = 0,
               PlayerID4 = 0, PlayerID5 = 0,
               VsPlayerID1 = sabrina_id, VsPlayerID2 = 0, VsPlayerID3 = 0,
               VsPlayerID4 = 0, VsPlayerID5 = 0,
               LastNGames = 0, Month = 0, OpponentTeamID = 0,
               GameID = "", Period = 0,
               DateFrom = "", DateTo = "", GameSegment = "",
               Location = "", Outcome = "", SeasonSegment = "",
               VsConference = "", VsDivision = ""))

## ----- (3) leaguedashptteamdefend (team-level defensive tracking) -----
probe_raw("leaguedashptteamdefend", "leaguedashptteamdefend",
          list(LeagueID = "10", PerMode = "PerGame", Season = season_yy,
               SeasonType = "Regular Season",
               DefenseCategory = "Overall",
               College = "", Conference = "", Country = "",
               DateFrom = "", DateTo = "", Division = "",
               DraftPick = "", DraftYear = "", GameSegment = "",
               Height = "", LastNGames = 0, Location = "",
               Month = 0, OpponentTeamID = 0, Outcome = "",
               PORound = "", PlayerExperience = "", PlayerPosition = "",
               SeasonSegment = "", StarterBench = "", TeamID = 0,
               VsConference = "", VsDivision = "", Weight = ""))

## ----- (4) teamdashptpass (team passing tracking) -----
probe_raw("teamdashptpass (Aces)", "teamdashptpass",
          list(LeagueID = "10", PerMode = "PerGame", Season = season_yy,
               SeasonType = "Regular Season", TeamID = aces_id,
               LastNGames = 0, Month = 0, OpponentTeamID = 0,
               DateFrom = "", DateTo = "", GameSegment = "",
               Location = "", Outcome = "", SeasonSegment = "",
               VsConference = "", VsDivision = ""))

## ----- (5) teamdashptreb (team rebounding tracking) -----
probe_raw("teamdashptreb (Aces)", "teamdashptreb",
          list(LeagueID = "10", PerMode = "PerGame", Season = season_yy,
               SeasonType = "Regular Season", TeamID = aces_id,
               LastNGames = 0, Month = 0, OpponentTeamID = 0,
               DateFrom = "", DateTo = "", GameSegment = "",
               Location = "", Outcome = "", SeasonSegment = "",
               VsConference = "", VsDivision = ""))

## ----- (6) teamdashptshots (team shot tracking) -----
probe_raw("teamdashptshots (Aces)", "teamdashptshots",
          list(LeagueID = "10", PerMode = "PerGame", Season = season_yy,
               SeasonType = "Regular Season", TeamID = aces_id,
               LastNGames = 0, Month = 0, OpponentTeamID = 0,
               DateFrom = "", DateTo = "", GameSegment = "",
               Location = "", Outcome = "", SeasonSegment = "",
               VsConference = "", VsDivision = ""))

cat("\nDone.\n")
