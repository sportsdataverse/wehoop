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

# Leading digit of the feed's five-character `<type digit><START year>` season
# code.
.officiating_season_types <- c(
  "1" = "preseason", "2" = "regular", "3" = "all-star",
  "4" = "playoffs", "5" = "play-in", "6" = "nba-cup-final"
)

.mdy_to_date <- function(x) {
  if (is.null(x)) return(as.Date(NA))
  as.Date(x, format = "%m/%d/%Y")
}

# Typed zero-row prototypes for `purrr::list_rbind(ptype = )`: a date with no
# games returns the same schema as a date with data. IDs are integer (hoopR
# convention; every NBA-family id fits in 32 bits).
.OFFICIALS_PTYPE <- dplyr::tibble(
  league = character(), game_id = character(), game_date = as.Date(character()),
  season = integer(), season_type = character(), game_code = character(),
  home_team_id = integer(), home_team_abbr = character(),
  away_team_id = integer(), away_team_abbr = character(),
  crew_position = integer(), official_id = integer(),
  official_name = character(), jersey_num = character()
)
.REPLAY_PTYPE <- dplyr::tibble(
  league = character(), game_date = as.Date(character()),
  official_id = integer(), official_name = character()
)

#' Parse an official.nba.com get-game-officials payload for one league block
#'
#' Internal parser for [wnba_referee_assignments()]. Kept separate from the
#' HTTP fetch so it can be unit-tested against a captured JSON fixture.
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
  # `[[` not `$`: `$` partial-matches, so a missing `Table` would silently
  # read `Table1`.
  block <- payload[[league]]
  games <- block[["Table"]][["rows"]] %||% list()
  replay_rows <- block[["Table1"]][["rows"]] %||% list()

  # A null field must become NA, never vanish: `as.character(NULL)` is
  # `character(0)`, which recycles a one-row tibble() down to zero rows, and a
  # bare NULL drops the column. `%||% NA` pins every field to length 1 first.
  officials <- purrr::map(games, function(g) {
    s <- as.character(g[["season"]] %||% "")
    rows <- purrr::map(1:4, function(k) {
      name <- g[[paste0("official", k)]]
      if (is.null(name) || identical(name, "")) return(NULL)
      dplyr::tibble(
        league = league,
        game_id = if (is.null(g[["game_id"]])) NA_character_ else pad_id(g[["game_id"]]),
        game_date = .mdy_to_date(g[["game_date"]]),
        season = if (identical(nchar(s), 5L)) as.integer(substr(s, 2, 5)) else NA_integer_,
        season_type = unname(.officiating_season_types[substr(s, 1, 1)]),
        game_code = as.character(g[["game_code"]] %||% NA),
        home_team_id = as.integer(g[["home_team_id"]] %||% NA),
        home_team_abbr = as.character(g[["home_team_abbr"]] %||% NA),
        away_team_id = as.integer(g[["away_team_id"]] %||% NA),
        away_team_abbr = as.character(g[["away_team_abbr"]] %||% NA),
        crew_position = k,
        official_id = as.integer(g[[paste0("official", k, "_code")]] %||% NA),
        official_name = as.character(name),
        jersey_num = as.character(g[[paste0("official", k, "_JNum")]] %||% NA)
      )
    })
    purrr::list_rbind(purrr::compact(rows), ptype = .OFFICIALS_PTYPE)
  })

  replay_center <- purrr::map(replay_rows, function(r) {
    dplyr::tibble(
      league = league,
      game_date = .mdy_to_date(r[["game_date"]]),
      official_id = as.integer(r[["official_code"]] %||% NA),
      official_name = as.character(r[["replaycenter_official"]] %||% NA)
    )
  })

  list(
    officials = purrr::list_rbind(officials, ptype = .OFFICIALS_PTYPE),
    replay_center = purrr::list_rbind(replay_center, ptype = .REPLAY_PTYPE)
  )
}

#' **WNBA referee assignments for a given date**
#' @name wnba_referee_assignments
NULL
#' @title
#' **WNBA referee assignments for a given date**
#' @rdname wnba_referee_assignments
#' @author Saiem Gilani
#' @description
#' Retrieves the referee crew assignments and replay-center officials for
#' every WNBA game on `date`, from official.nba.com's internal
#' `get-game-officials` endpoint (the same feed used by the NBA officiating
#' pages). That endpoint returns NBA and G-League blocks in the same
#' payload; this function extracts only `"wnba"`.
#' @param date Date to fetch: a single `Date`, `POSIXct`/`POSIXlt`, or
#'   `"YYYY-MM-DD"` string. Date-times are formatted in their own time zone,
#'   so a late-evening `POSIXct` keeps its calendar day.
#' @param proxy Optional proxy config. `NULL` (default) falls back to
#'   `getOption("wehoop.proxy")`, then lets libcurl honor the standard
#'   `http_proxy` / `https_proxy` / `no_proxy` environment variables. A single
#'   URL string (e.g. `"http://host:port"`) is forwarded to
#'   `httr2::req_proxy(url = proxy)`. A named list is spread as keyword args
#'   into `httr2::req_proxy()` (`url`, `port`, `username`, `password`, `auth`).
#' @return A named list of two `wehoop_data` tibbles.
#'
#'   `officials` -- long format, one row per game x filled crew slot (WNBA
#'   crews have three officials, so slot 4 is usually absent):
#'
#'    \if{html}{\tabular{lll}{
#'       col_name \tab types \tab description \cr
#'       league \tab character \tab League slug; always "wnba". \cr
#'       game_id \tab character \tab 10-character zero-padded game id. \cr
#'       game_date \tab Date \tab Game date. \cr
#'       season \tab integer \tab Season (the START year of the feed's season
#'       code; one calendar year for the WNBA). NA when the code is missing or
#'       not 5 characters. \cr
#'       season_type \tab character \tab One of preseason / regular /
#'       all-star / playoffs / play-in / nba-cup-final, from the season code's
#'       leading digit. NA when the code is missing or the digit is unknown. \cr
#'       game_code \tab character \tab official.nba.com game code
#'       (\code{YYYYMMDD/AWAYHOME}). \cr
#'       home_team_id \tab integer \tab Home team id. \cr
#'       home_team_abbr \tab character \tab Home team abbreviation. \cr
#'       away_team_id \tab integer \tab Away team id. \cr
#'       away_team_abbr \tab character \tab Away team abbreviation. \cr
#'       crew_position \tab integer \tab Feed slot order (1-4); slot 1 is
#'       inferred to be the crew chief. \cr
#'       official_id \tab integer \tab Official id. \cr
#'       official_name \tab character \tab Official display name. \cr
#'       jersey_num \tab character \tab Official jersey number. \cr
#'    }}
#'    \if{latex}{See the HTML help or pkgdown reference for the column table.}
#'
#'   `replay_center` -- one row per replay-center official per game date:
#'
#'    \if{html}{\tabular{lll}{
#'       col_name \tab types \tab description \cr
#'       league \tab character \tab League slug; always "wnba". \cr
#'       game_date \tab Date \tab Game date. \cr
#'       official_id \tab integer \tab Replay-center official id. \cr
#'       official_name \tab character \tab Replay-center official display
#'       name. \cr
#'    }}
#'    \if{latex}{See the HTML help or pkgdown reference for the column table.}
#'
#'   A date with no WNBA games returns zero-row tibbles carrying this schema,
#'   not an error. A field the feed omits comes back as `NA`; it never drops
#'   the row or the column.
#' @details
#' `crew_position` (1-4) is the feed's slot order; slot 1 is inferred to be
#' the crew chief -- official.nba.com does not label crew roles in this feed.
#' The feed encodes the season as `<type digit><START year>` (e.g. `"22026"`
#' is the 2026 regular season). `season` is that START year: a WNBA season
#' sits inside one calendar year, so no end-year conversion is applied.
#' `season_type` decodes the leading digit.
#'
#' Failures are signalled as classed conditions, both inheriting
#' `wehoop_error`:
#' * `wehoop_no_data` -- HTTP 404, or HTTP 403 with an S3
#'   `<Code>AccessDenied</Code>` XML body: official.nba.com has no report
#'   for `date`.
#' * `wehoop_fetch_error` -- any other non-200 status (e.g. an Akamai HTML
#'   403 block, or a rate limit / 5xx that outlived the retries), an empty or
#'   non-JSON body, JSON without the `wnba` `Table`/`Table1` `rows` lists, or a
#'   transport failure (DNS, TLS, dropped connection). The feed carries the
#'   `wnba` block on every date, with zero rows on a day without games, so a
#'   missing block is never an empty day.
#'
#' A malformed `date`, including an impossible one such as `"2026-02-31"`, is
#' an ordinary error raised before any request.
#'
#' Statuses 408, 429, 500, 502, 503 and 504 and transport failures are retried
#' (3 attempts in total); 403 and 404 are definitive and never retried.
#' @export
#' @family WNBA Officiating Functions
#' @examples
#' \donttest{
#'   try(wnba_referee_assignments(date = "2026-06-13"))
#' }
wnba_referee_assignments <- function(date, proxy = NULL) {
  call <- environment()
  day <- if (inherits(date, c("Date", "POSIXt"))) format(date, "%Y-%m-%d") else as.character(date)
  # Parse and round-trip, so a shape-valid but impossible date ("2026-02-31") is
  # rejected even where strptime would normalize it.
  parsed <- if (length(day) == 1L && !is.na(day)) as.Date(day, format = "%Y-%m-%d") else as.Date(NA)
  if (length(day) != 1L || is.na(day) || !grepl("^[0-9]{4}-[0-9]{2}-[0-9]{2}$", day) ||
      is.na(parsed) || format(parsed, "%Y-%m-%d") != day) {
    cli::cli_abort(
      "{.arg date} must be a single Date, POSIXct/POSIXlt, or valid \"YYYY-MM-DD\" date string, not {.val {day}}."
    )
  }

  req <- httr2::request("https://official.nba.com/wp-json/api/v1/get-game-officials") |>
    httr2::req_url_query(date = day) |>
    httr2::req_headers(!!!as.list(.official_nba_headers())) |>
    httr2::req_timeout(15) |>
    httr2::req_retry(
      max_tries = 3,
      retry_on_failure = TRUE,
      # 403 (S3 "no report" or an Akamai block) and 404 are definitive.
      is_transient = function(resp) httr2::resp_status(resp) %in% c(408L, 429L, 500L, 502L, 503L, 504L),
      backoff = function(i) stats::runif(1, 0.5, 1.5) * (2^i)
    ) |>
    httr2::req_error(is_error = function(resp) FALSE)
  proxy <- proxy %||% getOption("wehoop.proxy")
  if (is.character(proxy)) proxy <- list(url = proxy)
  if (!is.null(proxy)) req <- do.call(httr2::req_proxy, c(list(req), proxy))
  url <- req$url

  # Only the network call is wrapped: a caller mistake above (e.g. a malformed
  # `proxy`) surfaces as itself instead of being relabelled a fetch error.
  resp <- tryCatch(
    httr2::req_perform(req),
    error = function(cnd) {
      cli::cli_abort(
        "official.nba.com request failed (transport error) for {.url {url}}.",
        class = c("wehoop_fetch_error", "wehoop_error"),
        parent = cnd,
        call = call
      )
    }
  )
  status <- httr2::resp_status(resp)
  body <- if (httr2::resp_has_body(resp)) .resp_text(resp) else ""

  if (status == 404L || (status == 403L && grepl("<Code>AccessDenied</Code>", body, fixed = TRUE))) {
    cli::cli_abort(
      c(
        "official.nba.com has no referee-assignments report for {day}.",
        "i" = "HTTP {status} from {.url {url}}."
      ),
      class = c("wehoop_no_data", "wehoop_error"),
      call = call
    )
  }
  if (status != 200L) {
    cli::cli_abort(
      c(
        "official.nba.com returned HTTP {status} for {.url {url}}.",
        "i" = "Likely an Akamai WAF block or a rate limit; transient statuses were already retried."
      ),
      class = c("wehoop_fetch_error", "wehoop_error"),
      call = call
    )
  }
  payload <- tryCatch(
    jsonlite::fromJSON(body, simplifyVector = FALSE),
    error = function(cnd) {
      cli::cli_abort(
        "official.nba.com returned an empty or non-JSON body for {.url {url}}.",
        class = c("wehoop_fetch_error", "wehoop_error"),
        parent = cnd,
        call = call
      )
    }
  )

  # The feed always carries nba, gl and wnba blocks, each with Table and Table1
  # (zero rows on a day without games), so a missing block is a changed schema
  # or an error envelope, not a day without WNBA games.
  block <- if (is.list(payload)) payload[["wnba"]] else NULL
  # Each table must hold a rows list; a null table or missing rows is not an empty day.
  has_rows <- function(t) is.list(block[[t]]) && is.list(block[[t]][["rows"]])
  if (!is.list(block) || !has_rows("Table") || !has_rows("Table1")) {
    cli::cli_abort(
      "official.nba.com returned no {.val wnba} Table/Table1 block for {day} ({.url {url}}).",
      class = c("wehoop_fetch_error", "wehoop_error"),
      call = call
    )
  }

  parsed <- .parse_wnba_referee_assignments(payload, league = "wnba")
  ts <- Sys.time()
  list(
    officials = make_wehoop_data(parsed$officials, "WNBA referee assignments from official.nba.com", ts),
    replay_center = make_wehoop_data(parsed$replay_center, "WNBA replay-center officials from official.nba.com", ts)
  )
}
