# wjbl_runtime.R -- transport, season mapping and refusals of the W League wrappers.
#
# R mirror of sdv-py sportsdataverse/basketball/wjbl/wjbl_runtime.py (origin/main e3d232ebc9).
# Host: https://api.wjbl.01core.app/api, the keyless JSON backend of www.wjbl.org.
#
# * Every answer is HTTP 200, errors included. An unknown id is `[]` (or a months object with no
#   months) and a missing or non-numeric parameter is `{"error": {"error_code": "E003", ...}}`. The
#   envelope is wehoop_asset_fetch; the empty answer is wehoop_no_data unless the body can be compared
#   with the request, in which case a body for another game, season, league edition, team or player
#   is wehoop_asset_fetch.
# * Seasons: the public argument is the END year (2026 = 2025-26). The API keys a season edition by an
#   opaque league_id (45 = 2025-26); the runtime maps the END year with the live /leagues list (one
#   extra request, cached for the session; END = 2000 + the second YY of league_title). Phases inside
#   an edition (season_id) are native ids, passed as given.
# * Month paging: /play-schedules answers ONE month; every game is checked against the month and team
#   asked for.
# * Game routes take the global play_schedule_id; the game must be final: the header is fetched first
#   (cached once final) and the team ids of every other game route must be the header's two, in home /
#   away order. The play-by-play must end with the end-of-game line.
# * HTTP 500 is retried (the package default: the captures show no 500 for an unknown id).

#' @noRd
.WJBL_BASE <- "https://api.wjbl.01core.app/api"

#' @noRd
.WJBL_HOST <- "api.wjbl.01core.app/api"

#' @noRd
.WJBL_ROUTES <- c(
  "/leagues", "/play-schedule-months", "/play-schedules", "/play-schedule/detail", "/play-schedule",
  "/boxscore", "/pbp/play-by-play", "/pbp/team-stats", "/pbp/player-stats", "/seasons/standings",
  "/team-standings", "/team-ranking", "/teams/base", "/team/roster", "/player"
)

#' @noRd
.WJBL_GAME_ROUTES <- c("/play-schedule", "/boxscore", "/pbp/play-by-play", "/pbp/team-stats", "/pbp/player-stats")

#' @noRd
.WJBL_PBP_ROUTES <- c("/pbp/play-by-play", "/pbp/team-stats", "/pbp/player-stats")

#' @noRd
.WJBL_INT_PARAMS <- c("league_id", "play_schedule_id", "team_id", "season_id", "player_id")

# Session cache: the league table and every FINAL game header (sdv-py `_CACHE`).
.wjbl_cache <- new.env(parent = emptyenv())

#' Forget the cached league table and game headers (sdv-py `clear_cache`).
#' @noRd
.wjbl_clear_cache <- function() {
  rm(list = ls(.wjbl_cache, all.names = TRUE), envir = .wjbl_cache)
  invisible(NULL)
}

# ---------------------------------------------------------------------------
# JSON helpers (bodies parsed with simplifyVector = FALSE)
# ---------------------------------------------------------------------------

#' A JSON object (a named list; `{}` is a named empty list).
#' @noRd
.wjbl_is_obj <- function(x) is.list(x) && !is.null(names(x))

#' @noRd
.wjbl_obj <- function(x) if (.wjbl_is_obj(x)) x else structure(list(), names = character())

#' The objects of a JSON array; anything else is no rows.
#' @noRd
.wjbl_rows <- function(x) if (is.list(x) && is.null(names(x))) Filter(.wjbl_is_obj, x) else list()

#' `[]` or `{}` (Python `x == [] or x == {}`).
#' @noRd
.wjbl_empty <- function(x) is.list(x) && !length(x)

#' @noRd
.wjbl_scalar <- function(x) !is.null(x) && is.atomic(x) && length(x) == 1L && !is.na(x)

#' Type-strict equality with an integer id or a string (sdv-py `_same`: `True` is not 1, 7987.0 is not 7987).
#' @noRd
.wjbl_same <- function(got, want) {
  if (!.wjbl_scalar(got)) return(FALSE)
  if (is.character(want)) return(is.character(got) && identical(got, want))
  is.integer(got) && got == want
}

#' Python `==` on two JSON scalars (`13 == 13.0`, `True == 1`; `None == None`).
#' @noRd
.wjbl_eq <- function(a, b) {
  if (is.null(a) || is.null(b)) return(is.null(a) && is.null(b))
  if (!.wjbl_scalar(a) || !.wjbl_scalar(b)) return(FALSE)
  num <- function(x) is.numeric(x) || is.logical(x)
  if (num(a) && num(b)) return(as.double(a) == as.double(b))
  is.character(a) && is.character(b) && identical(a, b)
}

#' Python `str()` of a JSON scalar (`None` for a missing value), for messages and the month check.
#' @noRd
.wjbl_pystr <- function(x) {
  if (is.null(x) || (is.atomic(x) && length(x) == 1L && is.na(x))) return("None")
  if (!is.atomic(x) || length(x) != 1L) return(paste(format(x), collapse = " "))
  if (is.character(x)) return(x)
  if (is.logical(x)) return(if (x) "True" else "False")
  if (is.integer(x)) return(as.character(x))
  if (is.finite(x) && x == trunc(x) && abs(x) < 1e16) return(paste0(format(x, scientific = FALSE), ".0"))
  as.character(x)
}

#' Python `repr()` of a JSON scalar (strings quoted), for the scope messages.
#' @noRd
.wjbl_repr <- function(x) if (is.character(x) && length(x) == 1L && !is.na(x)) paste0("'", x, "'") else .wjbl_pystr(x)

# ---------------------------------------------------------------------------
# Arguments
# ---------------------------------------------------------------------------

#' An integer id: a whole number or a digit string (never a logical); `wehoop_bad_request` otherwise.
#' @noRd
.wjbl_int_param <- function(value, name, call = rlang::caller_env()) {
  ok <- length(value) == 1L && !is.logical(value) && !is.na(value) && (
    (is.numeric(value) && is.finite(value) && value == trunc(value) && abs(value) <= .Machine$integer.max) ||
      (is.character(value) && grepl("^\\s*-?[0-9]+\\s*$", value, perl = TRUE))
  )
  if (!ok) {
    shown <- if (is.null(value)) "NULL" else paste(format(value), collapse = ", ")
    .abort_bad_request("{.arg {name}} must be an integer id; got {shown}.", call = call)
  }
  as.integer(if (is.character(value)) trimws(value) else value)
}

#' `season_ids` as the API wants it: a comma list of integer phase ids (`"169,170"`).
#' @noRd
.wjbl_season_ids <- function(value, call = rlang::caller_env()) {
  parts <- if (is.character(value) && length(value) == 1L) strsplit(value, ",", fixed = TRUE)[[1]] else as.list(value)
  parts <- Filter(function(p) !(is.character(p) && !nzchar(trimws(p))), as.list(parts))
  ids <- vapply(parts, .wjbl_int_param, integer(1), name = "season_ids", call = call)
  if (!length(ids)) {
    .abort_bad_request("{.arg season_ids} must name at least one season phase id (see {.fn wjbl_standing_seasons}).",
                       call = call)
  }
  paste(ids, collapse = ",")
}

#' The sdv END year of a league edition title, or `NA` for an all-star game, cup or camp.
#'
#' `"25-26 W League"` (in Japanese) is 2026 and `"99-00 ..."` is 2000: END = 2000 + the second YY, when the
#' two YY are consecutive (sdv-py `season_of_title`).
#' @noRd
.wjbl_season_of_title <- function(title) {
  if (!is.character(title) || length(title) != 1L || is.na(title)) return(NA_integer_)
  m <- regmatches(title, regexec("^\\s*([0-9]{2})-([0-9]{2}) W\u30ea\u30fc\u30b0(?:\\s|$)", title, perl = TRUE))[[1]]
  if (!length(m)) return(NA_integer_)
  first <- as.integer(m[[2]])
  second <- as.integer(m[[3]])
  if ((first + 1L) %% 100L == second) 2000L + second else NA_integer_
}

# ---------------------------------------------------------------------------
# Transport
# ---------------------------------------------------------------------------

#' GET a route through the polite getter (HTTP 500 retried) and parse the JSON body; an error envelope
#' (HTTP 200) is `wehoop_asset_fetch`.
#' @noRd
.wjbl_fetch <- function(route, query = list(), call = rlang::caller_env()) {
  where <- paste0(.WJBL_HOST, route)
  query <- lapply(Filter(Negate(is.null), query), function(v) if (is.character(v)) v else format(v, scientific = FALSE))
  text <- .intl_get(paste0(.WJBL_BASE, route), query = query, retry_500 = TRUE, call = call)
  body <- .intl_json(text, where = where, call = call)
  err <- if (.wjbl_is_obj(body)) body[["error"]] else NULL
  if (.wjbl_is_obj(err)) {
    code <- substr(.wjbl_pystr(err[["error_code"]]), 1L, 20L)
    .abort_asset_fetch("{where} answered an error envelope (error_code={code}): a missing or invalid parameter",
                       call = call)
  }
  body
}

#' The `/leagues` rows (cached for the session).
#' @noRd
.wjbl_leagues <- function(call = rlang::caller_env()) {
  if (is.null(.wjbl_cache$leagues)) {
    rows <- .wjbl_rows(.wjbl_fetch("/leagues", list(target = "play_schedule"), call = call))
    if (!length(rows)) {
      .abort_asset_fetch("{.WJBL_HOST}/leagues answered no editions, so the season cannot be mapped", call = call)
    }
    .wjbl_cache$leagues <- rows
  }
  .wjbl_cache$leagues
}

#' The opaque `league_id` of the edition whose END year is `season` (sdv-py `league_id`).
#' @noRd
.wjbl_league_id <- function(season, call = rlang::caller_env()) {
  ok <- length(season) == 1L && !is.logical(season) && !is.na(season) && (
    (is.numeric(season) && is.finite(season) && season >= 0 && season == trunc(season)) ||
      (is.character(season) && grepl("^\\s*[0-9]+\\s*$", season, perl = TRUE))
  )
  if (!ok) {
    shown <- if (is.null(season)) "NULL" else paste(format(season), collapse = ", ")
    .abort_bad_request("{.arg season} must be an END year such as 2026 (2025-26); got {shown}.", call = call)
  }
  end <- as.integer(if (is.character(season)) trimws(season) else season)
  ends <- integer()
  ids <- integer()
  for (r in .wjbl_leagues(call = call)) {
    edition <- .wjbl_season_of_title(r[["league_title"]])
    lid <- r[["league_id"]]
    if (!is.na(edition) && .wjbl_scalar(lid) && is.integer(lid)) {
      ids[as.character(edition)] <- lid
      ends <- union(ends, edition)
    }
  }
  if (!as.character(end) %in% names(ids)) {
    lo <- min(ends)
    hi <- max(ends)
    .abort_bad_request("No W League edition ends in {end} (seasons {lo}-{hi}; 2000 = 1999-2000).", call = call)
  }
  ids[[as.character(end)]]
}

#' Refuse a game header that is empty, for another game, not final, or without both team ids.
#' @noRd
.wjbl_check_header <- function(where, gid, head, call = rlang::caller_env()) {
  if (.wjbl_empty(head)) .abort_no_data("{where}: the API has no game with this id", call = call)
  body <- .wjbl_obj(head)
  if (!.wjbl_same(body[["play_schedule_id"]], gid)) {
    got <- .wjbl_repr(body[["play_schedule_id"]])
    .abort_asset_fetch("{where}: asked for game {gid}, the body has play_schedule_id={got}", call = call)
  }
  if (!.wjbl_same(body[["game_status"]], "fixed")) {
    got <- .wjbl_repr(body[["game_status"]])
    .abort_asset_fetch("{where}: the game is not final (game_status={got})", call = call)
  }
  for (side in c("home", "away")) {
    tid <- .wjbl_obj(body[[side]])[["team_id"]]
    if (!(.wjbl_scalar(tid) && is.integer(tid))) {
      .abort_asset_fetch("{where}: the header has no {side} team_id", call = call)
    }
  }
  invisible(NULL)
}

#' The `/play-schedule/detail` header of a game, which must be final (cached once it is).
#' @noRd
.wjbl_final_header <- function(gid, call = rlang::caller_env()) {
  key <- paste0("header:", gid)
  if (is.null(.wjbl_cache[[key]])) {
    head <- .wjbl_fetch("/play-schedule/detail", list(play_schedule_id = gid), call = call)
    .wjbl_check_header(paste0(.WJBL_HOST, "/play-schedule/detail"), gid, head, call = call)
    .wjbl_cache[[key]] <- head
  }
  .wjbl_cache[[key]]
}

# ---------------------------------------------------------------------------
# Checks
# ---------------------------------------------------------------------------

#' @noRd
.wjbl_pair <- function(a, b) paste0("(", .wjbl_pystr(a), ", ", .wjbl_pystr(b), ")")

#' Refuse a game-route body that is empty, for another game, not final, for other teams or truncated.
#' @noRd
.wjbl_check_game <- function(route, gid, data, call = rlang::caller_env()) {
  where <- paste0(.WJBL_HOST, route)
  head <- .wjbl_final_header(gid, call = call)
  home <- .wjbl_obj(head[["home"]])[["team_id"]]
  away <- .wjbl_obj(head[["away"]])[["team_id"]]
  if (.wjbl_empty(data)) {
    if (route %in% .WJBL_PBP_ROUTES) {
      .abort_no_data("{where}: no play-by-play for game {gid} (the /pbp routes start with 2018-19)", call = call)
    }
    .abort_no_data("{where}: the API answered nothing for game {gid}", call = call)
  }
  body <- .wjbl_obj(data)
  if (!.wjbl_same(body[["play_schedule_id"]], gid)) {
    got <- .wjbl_repr(body[["play_schedule_id"]])
    .abort_asset_fetch("{where}: asked for game {gid}, the body has play_schedule_id={got}", call = call)
  }
  if ("game_status" %in% names(body) && !.wjbl_same(body[["game_status"]], "fixed")) {
    got <- .wjbl_repr(body[["game_status"]])
    .abort_asset_fetch("{where}: the game is not final (game_status={got})", call = call)
  }
  want <- .wjbl_pair(home, away)
  if (route %in% c("/boxscore", "/play-schedule")) {
    h <- .wjbl_obj(body[["home"]])[["team_id"]]
    a <- .wjbl_obj(body[["away"]])[["team_id"]]
    if (!(.wjbl_eq(h, home) && .wjbl_eq(a, away))) {
      got <- .wjbl_pair(h, a)
      .abort_asset_fetch("{where}: teams {got} are not game {gid}'s {want} in home/away order", call = call)
    }
    if (route == "/boxscore" &&
        !all(vapply(c("home", "away"), function(s) length(.wjbl_rows(.wjbl_obj(body[[s]])[["players"]])) > 0L,
                    logical(1)))) {
      .abort_no_data("{where}: the game has no player lines", call = call)
    }
  } else if (route %in% c("/pbp/team-stats", "/pbp/player-stats")) {
    h <- body[["home_team_id"]]
    a <- body[["away_team_id"]]
    if (!(.wjbl_eq(h, home) && .wjbl_eq(a, away))) {
      got <- .wjbl_pair(h, a)
      .abort_asset_fetch("{where}: teams {got} are not game {gid}'s {want} in home/away order", call = call)
    }
    if (!length(.wjbl_obj(body[["periods"]]))) .abort_no_data("{where}: no period rows for game {gid}", call = call)
  } else if (route == "/pbp/play-by-play") {
    plays <- .wjbl_rows(body[["play_by_plays"]])
    if (!length(plays)) .abort_no_data("{where}: no plays for game {gid}", call = call)
    for (p in plays) {
      side <- p[["home_away"]]
      team <- p[["team_id"]]
      if (is.null(side)) next
      known <- .wjbl_eq(side, 1L) || .wjbl_eq(side, 2L)
      if (!known || !.wjbl_eq(team, if (.wjbl_eq(side, 1L)) home else away)) {
        no <- .wjbl_repr(p[["no"]])
        got_team <- .wjbl_repr(team)
        got_side <- .wjbl_repr(side)
        .abort_asset_fetch(paste0("{where}: play {no} has team_id={got_team} on side {got_side}, ",
                                  "not game {gid}'s {want}"), call = call)
      }
    }
    if (!.wjbl_same(plays[[length(plays)]][["end_game_flg"]], 1L)) {
      .abort_asset_fetch("{where}: truncated play-by-play (it does not end with the end-of-game line)", call = call)
    }
  }
  invisible(NULL)
}

#' Refuse a month page for another league, month or team, and an empty one.
#' @noRd
.wjbl_check_schedules <- function(where, wire, data, call = rlang::caller_env()) {
  body <- .wjbl_obj(data)
  lid <- wire[["league_id"]]
  if (!length(body)) .abort_no_data("{where}: the API answered nothing for league {lid}", call = call)
  if (!.wjbl_same(body[["league_id"]], lid)) {
    got <- .wjbl_repr(body[["league_id"]])
    .abort_asset_fetch("{where}: asked for league_id={lid}, got {got}", call = call)
  }
  games <- unlist(lapply(unname(.wjbl_obj(body[["seasons"]])), function(ph) .wjbl_rows(.wjbl_obj(ph)[["play_schedules"]])),
                  recursive = FALSE)
  month <- wire[["game_month"]]
  if (!length(games)) {
    shown <- month %||% "its latest month"
    .abort_no_data("{where}: no games in league {lid} for {shown}", call = call)
  }
  team <- wire[["team_id"]]
  for (g in games) {
    gid <- .wjbl_repr(g[["play_schedule_id"]])
    if (!is.null(month)) {
      got <- paste0(.wjbl_pystr(g[["game_year"]]), "-", substr(.wjbl_pystr(g[["game_date"]]), 1L, 2L))
      if (got != month) .abort_asset_fetch("{where}: asked for {month}, game {gid} is in {got}", call = call)
    }
    if (!is.null(team) && !(.wjbl_eq(g[["home_team_id"]], team) || .wjbl_eq(g[["away_team_id"]], team))) {
      .abort_asset_fetch("{where}: game {gid} does not involve team {team}", call = call)
    }
  }
  invisible(NULL)
}

#' Refuse a standings or ranking body whose season phases are not exactly the ones asked for.
#' @noRd
.wjbl_check_phases <- function(where, route, ids, data, call = rlang::caller_env()) {
  want <- sort(unique(as.integer(strsplit(ids, ",", fixed = TRUE)[[1]])))
  if (.wjbl_empty(data)) .abort_no_data("{where}: the API has no season phase in {ids}", call = call)
  got <- if (route == "/team-standings") {
    lapply(.wjbl_rows(data), function(r) r[["season_id"]])
  } else {
    lapply(unname(.wjbl_obj(.wjbl_obj(data)[["seasons"]])), function(ph) .wjbl_obj(ph)[["season_id"]])
  }
  num <- vapply(got, function(v) if (.wjbl_scalar(v) && (is.numeric(v) || is.logical(v))) as.double(v) else NA_real_,
                double(1))
  if (anyNA(num) || !setequal(unique(num), want)) {
    shown_want <- paste0("[", paste(want, collapse = ", "), "]")
    shown_got <- paste0("[", paste(paste0("'", sort(unique(vapply(got, .wjbl_pystr, character(1)))), "'"),
                                   collapse = ", "), "]")
    .abort_asset_fetch("{where}: asked for season_ids {shown_want}, got {shown_got}", call = call)
  }
  invisible(NULL)
}

#' Raise `wehoop_no_data` for a row-less body, `wehoop_asset_fetch` for a partial or out-of-scope one.
#' @noRd
.wjbl_check <- function(route, wire, data, call = rlang::caller_env()) {
  where <- paste0(.WJBL_HOST, route)
  if (route %in% .WJBL_GAME_ROUTES) return(.wjbl_check_game(route, wire[["play_schedule_id"]], data, call = call))
  if (route == "/play-schedule/detail") return(.wjbl_check_header(where, wire[["play_schedule_id"]], data, call = call))
  if (route %in% c("/leagues", "/seasons/standings", "/teams/base")) {
    if (!length(.wjbl_rows(data))) .abort_no_data("{where}: the API answered no rows", call = call)
  } else if (route == "/play-schedule-months") {
    body <- .wjbl_obj(data)
    lid <- wire[["league_id"]]
    got <- body[["league_id"]]
    if (!(.wjbl_scalar(got) && is.character(got) && identical(got, as.character(lid)))) {
      shown <- .wjbl_repr(got)
      .abort_asset_fetch("{where}: asked for league_id={lid}, got {shown}", call = call)
    }
    if (!length(.wjbl_rows(body[["game_months"]]))) {
      .abort_no_data("{where}: league {lid} has no game months", call = call)
    }
  } else if (route == "/play-schedules") {
    .wjbl_check_schedules(where, wire, data, call = call)
  } else if (route %in% c("/team-standings", "/team-ranking")) {
    .wjbl_check_phases(where, route, wire[["season_ids"]], data, call = call)
  } else if (route == "/team/roster") {
    body <- .wjbl_obj(data)
    tid <- wire[["team_id"]]
    sid <- .wjbl_pystr(wire[["season_id"]])
    if (!length(body)) .abort_no_data("{where}: no roster for team {tid} in season {sid}", call = call)
    if (!.wjbl_same(body[["team_id"]], tid) ||
        (!is.null(wire[["season_id"]]) && !.wjbl_same(body[["season_id"]], wire[["season_id"]]))) {
      got_t <- .wjbl_repr(body[["team_id"]])
      got_s <- .wjbl_repr(body[["season_id"]])
      .abort_asset_fetch("{where}: asked for team {tid} season {sid}, got team {got_t} season {got_s}", call = call)
    }
  } else if (route == "/player") {
    body <- .wjbl_obj(data)
    pid <- wire[["player_id"]]
    if (!length(body)) .abort_no_data("{where}: the API has no player {pid}", call = call)
    if (!.wjbl_same(body[["player_id"]], pid)) {
      got <- .wjbl_repr(body[["player_id"]])
      .abort_asset_fetch("{where}: asked for player {pid}, the body has {got}", call = call)
    }
  }
  invisible(NULL)
}

# ---------------------------------------------------------------------------
# The getter
# ---------------------------------------------------------------------------

#' GET a W League route, refuse the empty, partial, non-final and out-of-scope answers and stamp the request.
#'
#' @param route The route path under `/api` (one of `.WJBL_ROUTES`).
#' @param params Query parameters; `NULL` values are dropped. `season` (the END year) is sent as the opaque
#'   `league_id`; `season_ids` may be an integer vector or a comma string.
#' @param call The frame named in a raised condition (the exported wrapper).
#' @return The body (a named list; a bare list comes back as `list(items = <rows>)`) with the request under
#'   `_request` (`season` the END year).
#' @noRd
.wjbl_get <- function(route, params = list(), call = rlang::caller_env()) {
  if (!route %in% .WJBL_ROUTES) .abort_bad_request("Not a W League route: {.val {route}}.", call = call)
  wire <- Filter(Negate(is.null), params)
  stamp <- list()
  if ("season" %in% names(wire)) {
    end <- wire[["season"]]
    wire[["season"]] <- NULL
    lid <- .wjbl_league_id(end, call = call)
    if (is.null(wire[["league_id"]])) wire[["league_id"]] <- lid
    stamp$season <- as.integer(if (is.character(end)) trimws(end) else end)
  }
  for (key in intersect(.WJBL_INT_PARAMS, names(wire))) wire[[key]] <- .wjbl_int_param(wire[[key]], key, call = call)
  if ("season_ids" %in% names(wire)) wire[["season_ids"]] <- .wjbl_season_ids(wire[["season_ids"]], call = call)
  if ("game_month" %in% names(wire)) {
    gm <- wire[["game_month"]]
    if (!(is.character(gm) && length(gm) == 1L && !is.na(gm) && grepl("^[0-9]{4}-(0[1-9]|1[0-2])$", gm))) {
      shown <- paste(format(gm), collapse = ", ")
      .abort_bad_request("{.arg game_month} must be 'YYYY-MM' (see {.fn wjbl_game_months}); got {shown}.", call = call)
    }
  }
  needs <- switch(route,
    "/play-schedule-months" = "league_id",
    "/team-standings" = , "/team-ranking" = "season_ids",
    "/team/roster" = "team_id",
    "/player" = "player_id",
    "/play-schedule/detail" = , "/play-schedule" = , "/boxscore" = , "/pbp/play-by-play" = ,
    "/pbp/team-stats" = , "/pbp/player-stats" = "play_schedule_id",
    character()
  )
  missing <- setdiff(needs, names(wire))
  if (length(missing)) .abort_bad_request("{route} needs {missing}.", call = call)
  if (route == "/play-schedules" && is.null(wire[["league_id"]])) {
    .abort_bad_request("/play-schedules needs a season (END year) or league_id.", call = call)
  }
  if (route == "/leagues" && is.null(wire[["target"]])) wire[["target"]] <- "play_schedule"
  # first: an unknown or live game is refused before the body is read
  if (route %in% .WJBL_GAME_ROUTES) .wjbl_final_header(wire[["play_schedule_id"]], call = call)
  data <- .wjbl_fetch(route, wire, call = call)
  .wjbl_check(route, wire, data, call = call)
  if (route == "/play-schedule/detail") .wjbl_cache[[paste0("header:", wire[["play_schedule_id"]])]] <- data
  if (route == "/leagues") .wjbl_cache$leagues <- .wjbl_rows(data)
  out <- if (.wjbl_is_obj(data)) data else list(items = data)
  wire[["target"]] <- NULL
  req <- wire
  req[names(stamp)] <- stamp
  out[["_request"]] <- req
  out
}
