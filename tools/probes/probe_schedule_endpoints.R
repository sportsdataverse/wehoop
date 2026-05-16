## probe_schedule_endpoints.R
## --------------------------
## Hunts for a working schedule endpoint when the primary one fails. Tries
## every URL pattern the NBA/WNBA stack is known to expose schedules
## through — both the `stats.*` API host (with x-nba-stats-* headers) and
## the `cdn.*` static-JSON host (browser-ish headers only).
##
## Originally written to find the `cdn.wnba.com/static/json/staticData/
## scheduleLeagueV2.json` replacement after `stats.wnba.com/stats/
## scheduleleaguev2` was retired in March 2026 (wehoop #53, hoopR #184).
## Keep updated as new candidate endpoints surface.
##
## Reports HTTP status, byte count, and JSON skeleton (top-level keys +
## leagueSchedule.gameDates count) per candidate.
##
## Run from package root:
##   Rscript tools/probes/probe_schedule_endpoints.R
options(warn = 1)
suppressPackageStartupMessages({
  library(httr2)
  library(jsonlite)
})

ua <- "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36"

probe <- function(label, url, params = NULL, headers = list(), is_cdn = FALSE) {
  cat("\n=== ", label, " ===\n  URL: ", url, "\n", sep = "")
  hdrs_default <- if (is_cdn) {
    list(
      "User-Agent"      = ua,
      "Accept"          = "application/json, text/plain, */*",
      "Accept-Language" = "en-US,en;q=0.9",
      "Origin"          = "https://www.wnba.com",
      "Referer"         = "https://www.wnba.com/"
    )
  } else {
    list(
      "User-Agent"         = ua,
      "Accept"             = "application/json, text/plain, */*",
      "Accept-Language"    = "en-US,en;q=0.9",
      "Origin"             = "https://stats.wnba.com",
      "Referer"            = "https://www.wnba.com/",
      "x-nba-stats-origin" = "stats",
      "x-nba-stats-token"  = "true"
    )
  }
  hdrs <- modifyList(hdrs_default, headers)
  req <- httr2::request(url) |>
    httr2::req_headers(!!!hdrs) |>
    httr2::req_timeout(45) |>
    httr2::req_retry(max_tries = 3, backoff = function(i) 1 + i,
                     is_transient = function(resp) TRUE)
  if (!is.null(params)) req <- httr2::req_url_query(req, !!!params)
  out <- tryCatch(httr2::req_perform(req),
                  error = function(e) { cat("  ERROR:", conditionMessage(e), "\n"); NULL })
  if (is.null(out)) return(invisible(NULL))
  cat("  status:", httr2::resp_status(out), "  bytes:",
      nchar(httr2::resp_body_string(out)), "\n")
  if (httr2::resp_status(out) >= 400) {
    cat("  body head:", substr(httr2::resp_body_string(out), 1, 200), "\n")
    return(invisible(NULL))
  }
  body <- httr2::resp_body_string(out)
  parsed <- tryCatch(jsonlite::fromJSON(body, simplifyVector = FALSE),
                     error = function(e) { cat("  PARSE ERROR:", conditionMessage(e), "\n"); NULL })
  if (is.null(parsed)) return(invisible(NULL))
  cat("  top-level keys: ", paste(head(names(parsed), 10), collapse=", "), "\n", sep="")
  # peek deeper
  walk <- function(x, depth = 1, prefix = "") {
    if (depth > 3) return()
    if (is.list(x) && length(x)) {
      for (nm in head(names(x), 8)) {
        sub <- x[[nm]]
        klass <- class(sub)[1]
        len <- length(sub)
        cat(prefix, "  $", nm, " (", klass, ", len=", len, ")\n", sep="")
        if (is.list(sub) && depth < 3) walk(sub, depth + 1, paste0(prefix, "  "))
      }
    }
  }
  walk(parsed)
  invisible(parsed)
}

## ---- 1) Original (confirmed dead) ----
probe("ORIGINAL stats.wnba.com/stats/scheduleleaguev2 (LeagueID=10)",
      "https://stats.wnba.com/stats/scheduleleaguev2",
      params = list(LeagueID = "10", Season = "2025"))

## ---- 2) v3 successor on stats host ----
probe("stats.wnba.com/stats/scheduleleaguev3",
      "https://stats.wnba.com/stats/scheduleleaguev3",
      params = list(LeagueID = "10", Season = "2025"))

## ---- 3) International variant ----
probe("stats.wnba.com/stats/scheduleleaguev2int",
      "https://stats.wnba.com/stats/scheduleleaguev2int",
      params = list(LeagueID = "10", Season = "2025"))

## ---- 4) CDN static JSON variants ----
probe("CDN cdn.wnba.com/static/json/staticData/scheduleLeagueV2.json",
      "https://cdn.wnba.com/static/json/staticData/scheduleLeagueV2.json",
      is_cdn = TRUE)

probe("CDN cdn.wnba.com/static/json/staticData/scheduleLeagueV2_1.json",
      "https://cdn.wnba.com/static/json/staticData/scheduleLeagueV2_1.json",
      is_cdn = TRUE)

probe("CDN cdn.wnba.com/static/json/staticData/scheduleLeagueV2_2.json",
      "https://cdn.wnba.com/static/json/staticData/scheduleLeagueV2_2.json",
      is_cdn = TRUE)

probe("CDN cdn.wnba.com/static/json/staticData/scheduleLeagueV2_3.json",
      "https://cdn.wnba.com/static/json/staticData/scheduleLeagueV2_3.json",
      is_cdn = TRUE)

## ---- 5) Live data ----
probe("CDN cdn.wnba.com/static/json/liveData/scoreboard/todaysScoreboard_10.json",
      "https://cdn.wnba.com/static/json/liveData/scoreboard/todaysScoreboard_10.json",
      is_cdn = TRUE)

## ---- 6) Internal-only alt (data.wnba.com legacy) ----
probe("data.wnba.com/data/10s/prod/v2/2025/schedule.json",
      "https://data.wnba.com/data/10s/prod/v2/2025/schedule.json",
      is_cdn = TRUE)

probe("data.wnba.com/data/10s/prod/v1/2025/schedule.json",
      "https://data.wnba.com/data/10s/prod/v1/2025/schedule.json",
      is_cdn = TRUE)

## ---- 7) WNBA app schedule (mobile) ----
probe("CDN cdn.wnba.com/static/json/staticData/leagueSchedule_10.json",
      "https://cdn.wnba.com/static/json/staticData/leagueSchedule_10.json",
      is_cdn = TRUE)

## ---- 8) Older NBA-style endpoint variants on stats host ----
probe("stats.wnba.com/stats/scheduleseason",
      "https://stats.wnba.com/stats/scheduleseason",
      params = list(LeagueID = "10", Season = "2025-26"))

probe("stats.wnba.com/stats/internationalbroadcasterschedule",
      "https://stats.wnba.com/stats/internationalbroadcasterschedule",
      params = list(LeagueID = "10", Season = "2025-26"))

cat("\nDone.\n")
