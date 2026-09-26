# Browser UA + Referer required by official.nba.com (Akamai-fronted); no
# API key. Mirrors the shape of `.wnba_cdn_headers()` in utils_wnba_stats.R.
.official_nba_headers <- function() {
  c(
    `User-Agent` = paste0(
      "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 ",
      "(KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36"),
    `Accept` = "application/json, text/html;q=0.9, */*;q=0.8",
    `Referer` = "https://official.nba.com/"
  )
}

# season code = <type digit><START year>. WNBA plays a single-calendar-year
# season, so the season column is the START year, unchanged.
.officiating_season_types <- c(
  "1" = "preseason", "2" = "regular", "3" = "all-star",
  "4" = "playoffs", "5" = "play-in", "6" = "nba-cup-final"
)

.mdy_to_date <- function(x) {
  if (is.null(x)) return(as.Date(NA))
  as.Date(x, format = "%m/%d/%Y")
}

#' Parse an official.nba.com get-game-officials payload for one league block
#'
#' Internal parser shared by [wnba_referee_assignments()]. Kept separate
#' from the HTTP fetch so it can be unit-tested against a captured JSON
#' fixture without a network call.
#'
#' @param payload Parsed JSON payload (list, `simplifyVector = FALSE`)
#'   from the `get-game-officials` endpoint, i.e. the full `{nba, gl, wnba}`
#'   object.
#' @param league Which top-level block to extract (`"wnba"` for wehoop).
#' @return A list with two plain tibbles: `officials` (long, one row per
#'   game x non-empty crew slot) and `replay_center`.
#' @keywords internal
#' @noRd
.parse_wnba_referee_assignments <- function(payload, league = "wnba") {
  block <- payload[[league]]
  if (is.null(block)) block <- list()
  games <- block$Table$rows
  if (is.null(games)) games <- list()
  replay_rows <- block$Table1$rows
  if (is.null(replay_rows)) replay_rows <- list()

  officials <- purrr::map_dfr(games, function(g) {
    purrr::map_dfr(1:4, function(k) {
      name <- g[[paste0("official", k)]]
      if (is.null(name) || identical(name, "")) return(NULL)
      season_code <- as.character(g$season)
      tibble::tibble(
        league = league,
        game_id = pad_id(g$game_id),
        game_date = .mdy_to_date(g$game_date),
        season = as.integer(substr(season_code, 2, nchar(season_code))),
        season_type = unname(.officiating_season_types[substr(season_code, 1, 1)]),
        game_code = g$game_code,
        home_team_id = g$home_team_id,
        home_team_abbr = g$home_team_abbr,
        away_team_id = g$away_team_id,
        away_team_abbr = g$away_team_abbr,
        crew_position = k,
        official_id = g[[paste0("official", k, "_code")]],
        official_name = name,
        jersey_num = as.character(g[[paste0("official", k, "_JNum")]])
      )
    })
  })
  if (nrow(officials) == 0L) {
    officials <- tibble::tibble(
      league = character(), game_id = character(), game_date = as.Date(character()),
      season = integer(), season_type = character(), game_code = character(),
      home_team_id = numeric(), home_team_abbr = character(),
      away_team_id = numeric(), away_team_abbr = character(),
      crew_position = integer(), official_id = numeric(),
      official_name = character(), jersey_num = character()
    )
  }

  replay_center <- purrr::map_dfr(replay_rows, function(r) {
    tibble::tibble(
      league = league,
      game_date = .mdy_to_date(r$game_date),
      official_id = r$official_code,
      official_name = r$replaycenter_official
    )
  })
  if (nrow(replay_center) == 0L) {
    replay_center <- tibble::tibble(
      league = character(), game_date = as.Date(character()),
      official_id = numeric(), official_name = character()
    )
  }

  list(officials = officials, replay_center = replay_center)
}

#' **WNBA referee assignments for a given date**
#' @title
#' **WNBA referee assignments for a given date**
#' @description
#' Retrieves the referee crew assignments and replay-center officials for
#' every WNBA game on `date`, from official.nba.com's internal
#' `get-game-officials` endpoint (the same feed used by the NBA officiating
#' pages). That endpoint returns NBA and G-League blocks in the same
#' payload; this function extracts only `"wnba"`.
#' @param date Date to fetch, as a `Date` or a `"YYYY-MM-DD"` string.
#' @param ... Currently unused (reserved for future arguments).
#' @return A named list of two `wehoop_data` tibbles:
#'   \itemize{
#'     \item `officials` -- long format, one row per game x crew slot, with
#'       columns `league`, `game_id`, `game_date`, `season`, `season_type`,
#'       `game_code`, `home_team_id`, `home_team_abbr`, `away_team_id`,
#'       `away_team_abbr`, `crew_position`, `official_id`, `official_name`,
#'       `jersey_num`.
#'     \item `replay_center` -- one row per replay-center official per
#'       game-date, with columns `league`, `game_date`, `official_id`,
#'       `official_name`.
#'   }
#'   A date with no WNBA games returns zero-row tibbles carrying the
#'   documented schema, not an error.
#' @details
#' `crew_position` (1-4) is the feed's slot order; slot 1 is INFERRED to be
#' the crew chief -- official.nba.com does not label crew roles in this
#' feed. `season` is the feed's `<type digit><START year>` season code
#' converted to an integer; WNBA plays a single-calendar-year season, so
#' `season` is the START year unchanged.
#'
#' A 403 response whose body is an S3 `AccessDenied` XML document means
#' there is no report for that date and is treated as empty data (mirrors
#' the Akamai-block handling used elsewhere in wehoop, e.g.
#' `ncaa_wbb_team_list()`); any other non-200 response aborts via
#' `cli::cli_abort()`.
#' @export
#' @family WNBA Officiating Functions
#' @examples
#' \donttest{
#'   try(wnba_referee_assignments(date = "2026-06-13"))
#' }
wnba_referee_assignments <- function(date, ...) {
  day <- as.character(date)
  url <- "https://official.nba.com/wp-json/api/v1/get-game-officials"

  resp <- .retry_request(
    url,
    params = list(date = day),
    headers = .official_nba_headers(),
    timeout = 15
  )
  status <- httr2::resp_status(resp)
  body <- .resp_text(resp)

  if (status == 403L && grepl("<Code>AccessDenied</Code>", body, fixed = TRUE)) {
    payload <- list()
  } else if (status >= 400L) {
    cli::cli_abort(c(
      "official.nba.com returned HTTP {status} for date {day}.",
      "i" = "The referee-assignments endpoint may be rate-limiting or blocking this request."
    ))
  } else {
    payload <- jsonlite::fromJSON(body, simplifyVector = FALSE)
  }

  ts <- Sys.time()
  parsed <- .parse_wnba_referee_assignments(payload, league = "wnba")

  list(
    officials = make_wehoop_data(parsed$officials, "wnba_referee_assignments_officials", ts),
    replay_center = make_wehoop_data(parsed$replay_center, "wnba_referee_assignments_replay_center", ts)
  )
}
