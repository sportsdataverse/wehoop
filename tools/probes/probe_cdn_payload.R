## probe_cdn_payload.R
## -------------------
## Walks the first gameDates[].games[] entry of the CDN schedule JSON for
## both leagues and prints every leaf key + a sample value. Used to verify
## that a candidate CDN endpoint is parser-compatible with the existing
## `wnba_schedule()` / `nba_schedule()` `tidyr::unnest("games") |>
## unnest("awayTeam"|"homeTeam")` pipeline before migrating a wrapper.
##
## Run from package root:
##   Rscript tools/probes/probe_cdn_payload.R
options(warn = 1)
suppressPackageStartupMessages({
  library(httr2)
  library(jsonlite)
})

ua <- "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36"

fetch <- function(url) {
  resp <- httr2::request(url) |>
    httr2::req_headers(
      "User-Agent" = ua,
      "Accept"     = "application/json"
    ) |>
    httr2::req_timeout(60) |>
    httr2::req_retry(max_tries = 3, backoff = function(i) 2 + i,
                     is_transient = function(r) TRUE) |>
    httr2::req_perform()
  list(status = httr2::resp_status(resp),
       body = httr2::resp_body_string(resp))
}

show_game_shape <- function(label, url) {
  cat("\n=== ", label, " ===\n", sep = "")
  r <- tryCatch(fetch(url), error = function(e) { cat("ERROR:", conditionMessage(e), "\n"); NULL })
  if (is.null(r)) return(invisible(NULL))
  cat("status:", r$status, "  bytes:", nchar(r$body), "\n")
  if (r$status >= 400) return(invisible(NULL))
  d <- jsonlite::fromJSON(r$body, simplifyVector = FALSE)
  ls <- d$leagueSchedule
  cat("seasonYear:", ls$seasonYear, "  leagueId:", ls$leagueId,
      "  gameDates count:", length(ls$gameDates), "\n")
  if (!length(ls$gameDates)) return(invisible(NULL))
  gd1 <- ls$gameDates[[1]]
  cat("first gameDate keys:", paste(names(gd1), collapse=", "), "\n")
  cat("first gameDate.gameDate value:", gd1$gameDate, "\n")
  if (length(gd1$games) == 0) {
    cat("first gameDate has 0 games; trying gameDates[[2]]\n")
    gd1 <- ls$gameDates[[2]]
  }
  g1 <- gd1$games[[1]]
  cat("\nfirst game keys (", length(g1), "):\n  ", paste(names(g1), collapse="\n  "), "\n", sep="")
  cat("\nawayTeam sub-keys:\n  ", paste(names(g1$awayTeam), collapse=", "), "\n", sep="")
  cat("\nhomeTeam sub-keys:\n  ", paste(names(g1$homeTeam), collapse=", "), "\n", sep="")
  cat("\nfirst game sample (selected scalars):\n")
  scalars <- c("gameId", "gameCode", "gameStatus", "gameStatusText",
               "gameDateEst", "gameTimeEst", "gameDateTimeEst",
               "weekNumber", "weekName", "seriesGameNumber", "seriesText",
               "arenaName", "arenaCity", "arenaState", "ifNecessary",
               "postponedStatus", "branchLink", "gameSubtype")
  for (k in scalars) {
    v <- g1[[k]]
    if (!is.null(v)) cat("  ", k, " = ", as.character(v), "\n", sep="")
  }
  cat("  awayTeam.teamId/tricode = ", g1$awayTeam$teamId, " / ",
      g1$awayTeam$teamTricode, "\n", sep="")
  cat("  homeTeam.teamId/tricode = ", g1$homeTeam$teamId, " / ",
      g1$homeTeam$teamTricode, "\n", sep="")
  invisible(d)
}

show_game_shape("WNBA CDN scheduleLeagueV2.json",
                "https://cdn.wnba.com/static/json/staticData/scheduleLeagueV2.json")

show_game_shape("WNBA CDN scheduleLeagueV2_1.json",
                "https://cdn.wnba.com/static/json/staticData/scheduleLeagueV2_1.json")

show_game_shape("NBA  CDN scheduleLeagueV2.json",
                "https://cdn.nba.com/static/json/staticData/scheduleLeagueV2.json")

show_game_shape("NBA  CDN scheduleLeagueV2_1.json",
                "https://cdn.nba.com/static/json/staticData/scheduleLeagueV2_1.json")

cat("\nDone.\n")
