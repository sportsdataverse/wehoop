## probe_hoopr_redirect_targets.R
## ------------------------------
## Live-probe every endpoint that is either (a) a hoopR `with =` deprecation
## redirect target, or (b) deprecated in wehoop but with an NBA twin that is
## still active in hoopR. Goal: figure out which endpoints actually have WNBA
## data right now, so we know which wehoop deprecations to revisit and which
## hoopR-recommended replacements actually work for WNBA users.
##
## Bypasses each deprecated wehoop wrapper's `lifecycle::deprecate_stop()`
## shim by calling `request_with_proxy()` directly with the right endpoint +
## params. Use this any time you're considering deprecating a wrapper, or
## any time hoopR adds a new `with = ` redirect.
##
## Run from package root:
##   Rscript tools/probes/probe_hoopr_redirect_targets.R
options(warn = 1)
suppressPackageStartupMessages(devtools::load_all(quiet = TRUE))

`%||%` <- function(a, b) if (is.null(a)) b else a

probe <- function(label, endpoint, params, parse = c("map", "raw")) {
  parse <- match.arg(parse)
  cat("\n=== ", label, " (", endpoint, ") ===\n", sep = "")
  url <- paste0("https://stats.wnba.com/stats/", endpoint)
  resp <- tryCatch(
    wehoop:::request_with_proxy(url = url, params = params),
    error = function(e) { cat("  HTTP/parse ERR:", conditionMessage(e), "\n"); NULL }
  )
  if (is.null(resp)) return(invisible(NULL))
  if (parse == "map") {
    sets <- tryCatch(wehoop:::wnba_stats_map_result_sets(resp),
                     error = function(e) { cat("  MAP ERR:", conditionMessage(e), "\n"); NULL })
    if (is.null(sets)) return(invisible(NULL))
    for (nm in names(sets)) {
      d <- sets[[nm]]
      cat(sprintf("  [%s]  rows=%d  cols=%d\n", nm, nrow(d), ncol(d)))
      if (nrow(d) > 0 && ncol(d) > 0) {
        cat("    cols: ", paste(head(colnames(d), 10), collapse=", "),
            if (ncol(d) > 10) ", ..." else "", "\n", sep = "")
      }
    }
  } else {
    cat("  raw top-level: ", paste(names(resp), collapse=", "), "\n", sep="")
  }
  Sys.sleep(3)
  invisible(resp)
}

game_id     <- "1022600021"  # CON vs LVA, 2026-05-15
season_yy   <- "2025-26"
season_int  <- 2025

## ============================================================
## (1) wehoop-deprecated, hoopR still uses as redirect target
## ============================================================

## playerprofilev2 — hoopR redirects nba_playernextngames → nba_playerprofilev2.
## wehoop deprecated wnba_playerprofilev2(). Test if endpoint returns data.
probe("playerprofilev2 (A'ja Wilson)", "playerprofilev2",
      list(LeagueID = "10", PerMode = "PerGame", PlayerID = "1628932"))

## videodetailsasset — hoopR redirects nba_videodetails → nba_videodetailsasset.
## wehoop deprecated wnba_videodetailsasset(). Game-keyed.
probe("videodetailsasset (WNBA game)", "videodetailsasset",
      list(
        LeagueID = "10", Season = season_yy, SeasonType = "Regular Season",
        TeamID = 0, PlayerID = 0, GameID = game_id,
        ContextMeasure = "FGM", PlayerPosition = "", GameSegment = "",
        Period = 0, LastNGames = 0, ClutchTime = "", AheadBehind = "",
        PointDiff = "", RangeType = 0, StartPeriod = 1, EndPeriod = 10,
        StartRange = 0, EndRange = 28800, ContextFilter = "",
        OppPlayerID = 0, RookieYear = "", Outcome = "", Location = "",
        Month = 0, SeasonSegment = "", DateFrom = "", DateTo = "",
        OpponentTeamID = 0, VsConference = "", VsDivision = ""
      ))

## ============================================================
## (2) Active redirect targets — confirm WNBA actually populates
## ============================================================

probe("leagueleaders (2025-26 PerGame PTS)", "leagueleaders",
      list(LeagueID = "10", PerMode = "PerGame", StatCategory = "PTS",
           Season = season_yy, SeasonType = "Regular Season",
           Scope = "S", ActiveFlag = "No"))

probe("franchiseleaders (Aces)", "franchiseleaders",
      list(LeagueID = "10", TeamID = "1611661319"))

probe("teamgamelogs (Aces, 2025-26)", "teamgamelogs",
      list(LeagueID = "10", TeamID = "1611661319",
           Season = season_yy, SeasonType = "Regular Season",
           DateFrom = "", DateTo = "", Location = "", Outcome = "",
           SeasonSegment = "", VsConference = "", VsDivision = "",
           GameSegment = "", Period = 0, LastNGames = 0,
           MeasureType = "Base", PerMode = "Totals",
           PlusMinus = "N", PaceAdjust = "N", Rank = "N",
           Conference = "", Division = ""))

probe("playercareerbycollegerollup", "playercareerbycollegerollup",
      list(LeagueID = "10", PerMode = "Totals", Season = season_yy,
           SeasonType = "Regular Season", College = ""))

probe("leaguedashplayerbiostats", "leaguedashplayerbiostats",
      list(LeagueID = "10", PerMode = "PerGame", Season = season_yy,
           SeasonType = "Regular Season",
           College = "", Conference = "", Country = "",
           DateFrom = "", DateTo = "", Division = "",
           DraftPick = "", DraftYear = "",
           GameScope = "", GameSegment = "",
           Height = "", LastNGames = 0, Location = "",
           Month = 0, OpponentTeamID = 0, Outcome = "",
           PORound = "", PlayerExperience = "", PlayerPosition = "",
           SeasonSegment = "", ShotClockRange = "",
           StarterBench = "", TeamID = 0,
           VsConference = "", VsDivision = "", Weight = ""))

## ============================================================
## (3) wehoop-only deprecations worth re-checking
## ============================================================

probe("teaminfocommon (Aces 2025-26)", "teaminfocommon",
      list(LeagueID = "10", SeasonType = "Regular Season",
           TeamID = "1611661319", season_nullable = ""))

probe("teamyearbyyearstats (Aces)", "teamyearbyyearstats",
      list(LeagueID = "10", PerMode = "Totals",
           SeasonType = "Regular Season", TeamID = "1611661319"))

probe("leaguelineupviz", "leaguelineupviz",
      list(LeagueID = "10", PerMode = "PerGame", Season = season_yy,
           SeasonType = "Regular Season", GroupQuantity = 5,
           MinutesMin = 0, DateFrom = "", DateTo = "", Division = "",
           Conference = "", GameSegment = "", LastNGames = 0,
           Location = "", MeasureType = "Base", Month = 0,
           OpponentTeamID = 0, Outcome = "", PORound = "",
           PaceAdjust = "N", Period = 0, PlusMinus = "N", Rank = "N",
           SeasonSegment = "", ShotClockRange = "",
           TeamID = 0, VsConference = "", VsDivision = ""))

cat("\nDone.\n")
