# Offline tests of the W League family: R/wjbl.R, R/wjbl_runtime.R, R/wjbl_parsers.R. Every request is
# mocked through httr2, so the season mapping, the game checks, the retries and the error vocabulary run
# end to end; the throttle is recorded, never slept. Parity: fixtures/wjbl/parity/<case>.csv is sdv-py's
# frame of the same wrapper on the same fixture (see fixtures/wjbl/README.md).

wjbl_fx <- function(...) test_path("fixtures", "wjbl", ...)
wjbl_text <- function(name) {
  con <- if (endsWith(name, ".gz")) gzfile(wjbl_fx(name)) else file(wjbl_fx(name))
  on.exit(close(con))
  paste(readLines(con, encoding = "UTF-8", warn = FALSE), collapse = "\n")
}
wjbl_body <- function(name) jsonlite::parse_json(wjbl_text(name), simplifyVector = FALSE)

WJBL_API <- "https://api.wjbl.01core.app/api"
WJBL_G <- 7987L # 2025-26 playoff final game 1, Toyota Antelopes (13) 66-75 Denso Iris (12)

# route -> fixture, the same tables as the sdv-py generator; a game route's fixture is per game id
WJBL_GAME <- c("/play-schedule/detail" = "detail_%s.json", "/play-schedule" = "info_%s.json",
               "/boxscore" = "box_%s.json", "/pbp/play-by-play" = "pbp_%s.json.gz",
               "/pbp/team-stats" = "team_stats_%s.json", "/pbp/player-stats" = "player_stats_%s.json")
WJBL_ROUTES <- c("/leagues" = "leagues.json", "/play-schedule-months" = "months_45.json",
                 "/play-schedules" = "schedules_45_2026-04.json", "/seasons/standings" = "standing_seasons.json",
                 "/team-standings" = "team_standings_169.json", "/team-ranking" = "team_ranking_169_170.json",
                 "/teams/base" = "teams.json", "/team/roster" = "roster_13_169.json", "/player" = "player_9799.json")

wjbl_resp <- function(body, status = 200L, headers = list()) {
  text <- if (is.character(body)) body else as.character(jsonlite::toJSON(body, auto_unbox = TRUE, null = "null",
                                                                         digits = NA))
  httr2::response(status, headers = c(list("Content-Type" = "application/json"), headers),
                  body = charToRaw(enc2utf8(text)))
}
wjbl_route <- function(req) sub(paste0("^", WJBL_API), "", sub("\\?.*$", "", req$url))
wjbl_turns <- function(...) structure(list(...), turns = TRUE)

# Mock the API. `over` replaces a route (or one game's route, as "<route>@<id>"): a fixture name, an R
# body, an httr2 response, a wjbl_turns() list (answered in turn) or a function(req). `seen$reqs` lists
# every request (route + query) and `seen$waits` every throttle wait; the session cache is cleared.
local_wjbl <- function(over = list(), env = parent.frame()) {
  seen <- new.env()
  seen$reqs <- list()
  seen$waits <- 0L
  .wjbl_clear_cache()
  withr::defer(.wjbl_clear_cache(), envir = env)
  withr::local_options(cli.width = 10000, .local_envir = env)
  local_mocked_bindings(
    .intl_wait = function(url, min_interval = 1) {
      seen$waits <- seen$waits + 1L
      invisible(0)
    },
    .package = "wehoop", .env = env
  )
  turn <- new.env()
  httr2::local_mocked_responses(function(req) {
    route <- wjbl_route(req)
    q <- httr2::url_parse(req$url)$query %||% list()
    seen$reqs[[length(seen$reqs) + 1L]] <- list(route = route, query = q)
    key <- paste0(route, "@", q$play_schedule_id %||% "")
    ans <- if (key %in% names(over)) over[[key]] else if (route %in% names(over)) over[[route]] else if (
      route %in% names(WJBL_GAME)) sprintf(WJBL_GAME[[route]], q$play_schedule_id) else WJBL_ROUTES[[route]]
    if (is.list(ans) && !is.null(attr(ans, "turns"))) {
      i <- (turn[[key]] %||% 0L) + 1L
      turn[[key]] <- i
      ans <- ans[[min(i, length(ans))]]
    }
    if (is.function(ans)) return(ans(req))
    if (inherits(ans, "httr2_response")) return(ans)
    if (is.character(ans) && length(ans) == 1L && grepl("\\.json(\\.gz)?$", ans)) return(wjbl_resp(wjbl_text(ans)))
    wjbl_resp(ans)
  }, env = env)
  seen
}
wjbl_routes <- function(seen) vapply(seen$reqs, function(r) r$route, character(1))

#' `expect_error()` on the class, then the pattern on the message.
wjbl_err <- function(expr, class, pattern = NULL) {
  e <- expect_error(expr, class = class)
  if (!is.null(pattern)) expect_match(gsub("\\s+", " ", conditionMessage(e)), pattern, fixed = TRUE)
  invisible(e)
}

# the wrapper calls of the parity CSVs (the same calls as the sdv-py generator)
WJBL_GID <- list(play_schedule_id = WJBL_G)
WJBL_CASES <- list(
  wjbl_leagues = list(), wjbl_game_months = list(season = 2026),
  wjbl_schedule = list(season = 2026, game_month = "2026-04"),
  wjbl_game = WJBL_GID, wjbl_period_scores = WJBL_GID, wjbl_period_scores__7360 = list(play_schedule_id = 7360),
  wjbl_game_info = WJBL_GID, wjbl_box_score = WJBL_GID, wjbl_team_box_score = WJBL_GID, wjbl_pbp = WJBL_GID,
  wjbl_team_period_stats = WJBL_GID, wjbl_player_period_leaders = WJBL_GID, wjbl_standing_seasons = list(),
  wjbl_team_standings = list(season_ids = "169"), wjbl_head_to_head = list(season_ids = "169"),
  wjbl_team_ranking = list(season_ids = "169,170"), wjbl_teams = list(),
  wjbl_roster = list(team_id = 13, season_id = 169), wjbl_staff = list(team_id = 13, season_id = 169),
  wjbl_player = list(player_id = 9799)
)
WJBL_RTYPE <- c(Int64 = "integer", Float64 = "numeric", String = "character")

wjbl_run <- function(case, over = list(), env = parent.frame()) {
  seen <- local_wjbl(over, env = env)
  list(out = do.call(sub("__.*$", "", case), WJBL_CASES[[case]]), seen = seen)
}
wjbl_type <- function(x) if (is.double(x)) "numeric" else class(x)[[1]]

# cells that differ, NA-vs-value counted as a mismatch
wjbl_mismatches <- function(got, want_chr) {
  want <- if (is.numeric(got)) suppressWarnings(as.numeric(want_chr)) else gsub("\\r", "\r", want_chr, fixed = TRUE)
  both <- !is.na(got) & !is.na(want)
  diff <- if (is.double(got)) abs(got[both] - want[both]) > 1e-9 else got[both] != want[both]
  sum(is.na(got) != is.na(want)) + sum(diff)
}

test_that("every wrapper matches sdv-py's frame on the same fixture (columns, order, types, cells, requests)", {
  dtypes <- jsonlite::read_json(wjbl_fx("parity", "dtypes.json"))
  requests <- jsonlite::read_json(wjbl_fx("parity", "requests.json"))
  expect_setequal(names(WJBL_CASES), names(dtypes))
  exports <- getNamespaceExports("wehoop")
  expect_setequal(unique(sub("__.*$", "", names(WJBL_CASES))), exports[startsWith(exports, "wjbl_")])
  expect_length(exports[startsWith(exports, "wjbl_")], 19L)
  for (case in names(WJBL_CASES)) {
    res <- wjbl_run(case)
    got <- res$out
    path <- wjbl_fx("parity", paste0(case, ".csv"))
    if (!file.exists(path)) path <- paste0(path, ".gz")
    want <- utils::read.csv(path, colClasses = "character", na.strings = "\\N", check.names = FALSE,
                            encoding = "UTF-8")
    expect_s3_class(got, "wehoop_data")
    expect_identical(names(got), names(want), label = case)
    expect_identical(nrow(got), nrow(want), label = case)
    expect_gt(nrow(got), 0L)
    want_types <- stats::setNames(unname(WJBL_RTYPE[unlist(dtypes[[case]])]), names(dtypes[[case]]))
    expect_identical(vapply(got, wjbl_type, character(1)), want_types[names(got)], label = case)
    bad <- vapply(names(got), function(n) wjbl_mismatches(got[[n]], want[[n]]), numeric(1))
    expect_identical(names(bad)[bad > 0], character(), label = paste(case, "mismatched columns"))
    # the same requests, in the same order, with the same query as sdv-py
    want_req <- requests[[case]]
    expect_identical(wjbl_routes(res$seen), vapply(want_req, function(r) r$route, character(1)), label = case)
    flat <- function(x) sort(paste(names(x), vapply(x, as.character, ""), sep = "="))
    for (i in seq_along(want_req)) {
      expect_identical(flat(res$seen$reqs[[i]]$query), flat(want_req[[i]]$params), label = paste(case, i))
    }
  }
})

test_that("ids, flags and counts are integers, rates doubles; the frames read as sdv-py documents", {
  box <- wjbl_run("wjbl_box_score")$out
  for (col in c("play_schedule_id", "team_id", "player_id", "gs", "pts", "min_seconds")) expect_type(box[[col]], "integer")
  expect_type(box$player_number, "character")
  expect_identical(c(sum(box$pts[box$team_side == "home"]), sum(box$pts[box$team_side == "away"])), c(66L, 75L))
  teams <- wjbl_run("wjbl_team_box_score")$out
  expect_type(teams$fgp, "double")
  expect_identical(teams$row_type, c("team", "total", "team", "total"))
  pbp <- wjbl_run("wjbl_pbp")$out
  expect_type(pbp$player_id1, "integer")
  expect_identical(pbp$end_game_flg[[nrow(pbp)]], 1L)
  expect_setequal(stats::na.omit(unique(pbp$team_side)), c("home", "away"))
  ot <- wjbl_run("wjbl_period_scores__7360")$out
  expect_identical(unique(ot$period_label), c("Q1", "Q2", "Q3", "Q4", "OT1"))
  ranking <- wjbl_run("wjbl_team_ranking")$out
  expect_type(ranking$fg, "double")
  expect_identical(unique(ranking$season), 2026L)
  info <- wjbl_run("wjbl_game_info")$out
  expect_false("contact" %in% names(info))
  expect_identical(info$game_day, "2026-04-04")
})

test_that("the season (END year) maps to the league edition through the live league list, cached", {
  res <- wjbl_run("wjbl_game_months")
  expect_identical(wjbl_routes(res$seen), c("/leagues", "/play-schedule-months"))
  expect_identical(res$seen$reqs[[2]]$query, list(league_id = "45"))
  expect_identical(unique(res$out$season), 2026L)
  expect_identical(unique(res$out$league_id), 45L)
  expect_identical(.wjbl_league_id(2000), 4L)
  expect_identical(.wjbl_league_id("2027"), 47L)
  expect_identical(.wjbl_league_id(2014), 20L)
  expect_identical(sum(wjbl_routes(res$seen) == "/leagues"), 1L) # cached
  expect_identical(.wjbl_season_of_title("99-00 W\u30ea\u30fc\u30b0"), 2000L)
  expect_identical(.wjbl_season_of_title("W\u30ea\u30fc\u30b0\u30aa\u30fc\u30eb\u30b9\u30bf\u30fc2025-26"), NA_integer_)
  local_wjbl()
  for (bad in list(1990, "20x6", TRUE, 2026.5, NULL)) {
    wjbl_err(wjbl_game_months(bad), "wehoop_bad_request")
  }
  wjbl_err(wjbl_game_months(1990), "wehoop_bad_request", "No W League edition ends in 1990")
})

test_that("an empty or malformed body parses to the documented zero-row frame", {
  parsers <- ls(asNamespace("wehoop"), pattern = "^\\.wjbl_parse_", all.names = TRUE)
  expect_length(parsers, 19L)
  for (p in parsers) {
    kind <- sub("^\\.wjbl_parse_", "", p)
    for (bad in list(list(), NULL, "x", 3L, list(items = list()))) {
      df <- get(p, envir = asNamespace("wehoop"))(bad)
      expect_identical(nrow(df), 0L, label = p)
      expect_identical(names(df), names(.wjbl_specs[[kind]]), label = p)
    }
  }
  # a valid answer with nothing in a list: the documented zero-row frame, not an error
  roster <- wjbl_body("roster_13_169.json")
  roster$staffs <- list()
  local_wjbl(list("/team/roster" = roster))
  staff <- wjbl_staff(13, 169)
  expect_identical(nrow(staff), 0L)
  expect_identical(names(staff), names(.wjbl_specs$staff))
  expect_type(staff$team_id, "integer")
})

test_that("an empty answer is wehoop_no_data on every kind of route", {
  local_wjbl(list("/teams/base" = list(), "/leagues" = list(), "/seasons/standings" = list(), "/player" = list(),
                  "/team/roster" = list(), "/team-standings" = list(),
                  "/play-schedule/detail@1" = list()))
  wjbl_err(wjbl_teams(), "wehoop_no_data")
  wjbl_err(wjbl_leagues(), "wehoop_no_data")
  wjbl_err(wjbl_standing_seasons(), "wehoop_no_data")
  wjbl_err(wjbl_player(1), "wehoop_no_data", "has no player 1")
  wjbl_err(wjbl_roster(13, 1), "wehoop_no_data")
  wjbl_err(wjbl_team_standings(999), "wehoop_no_data")
  wjbl_err(wjbl_game(1), "wehoop_no_data", "has no game with this id")
  wjbl_err(wjbl_box_score(1), "wehoop_no_data", "has no game with this id")
})

test_that("a game route reads the header first, caches a final one, and refuses a non-final one", {
  seen <- local_wjbl()
  wjbl_box_score(WJBL_G)
  wjbl_team_box_score(WJBL_G)
  expect_identical(wjbl_routes(seen), c("/play-schedule/detail", "/boxscore", "/boxscore"))
  live <- wjbl_body("detail_7987.json")
  live$game_status <- "live"
  seen <- local_wjbl(list("/play-schedule/detail" = live))
  for (f in list(wjbl_game, wjbl_box_score, wjbl_pbp, wjbl_game_info)) {
    wjbl_err(f(WJBL_G), "wehoop_asset_fetch", "the game is not final (game_status='live')")
  }
  expect_true(all(wjbl_routes(seen) == "/play-schedule/detail")) # never read the body, never cached
  other <- wjbl_body("detail_7987.json")
  other$play_schedule_id <- 7360L
  local_wjbl(list("/play-schedule/detail" = other))
  wjbl_err(wjbl_game(WJBL_G), "wehoop_asset_fetch", "asked for game 7987, the body has play_schedule_id=7360")
  nohome <- wjbl_body("detail_7987.json")
  nohome$home$team_id <- "13"
  local_wjbl(list("/play-schedule/detail" = nohome))
  wjbl_err(wjbl_game(WJBL_G), "wehoop_asset_fetch", "the header has no home team_id")
})

test_that("every game route must be the header's game and teams, in home/away order, and complete", {
  box <- wjbl_body("box_7987.json")
  swapped <- box
  swapped$home <- box$away
  swapped$away <- box$home
  local_wjbl(list("/boxscore" = swapped))
  wjbl_err(wjbl_box_score(WJBL_G), "wehoop_asset_fetch", "teams (12, 13) are not game 7987's (13, 12)")
  other <- box
  other$play_schedule_id <- 1L
  local_wjbl(list("/boxscore" = other))
  wjbl_err(wjbl_box_score(WJBL_G), "wehoop_asset_fetch", "asked for game 7987")
  empty <- box
  empty$home$players <- list()
  local_wjbl(list("/boxscore" = empty))
  wjbl_err(wjbl_box_score(WJBL_G), "wehoop_no_data", "no player lines")
  ts <- wjbl_body("team_stats_7987.json")
  ts$home_team_id <- 30L
  local_wjbl(list("/pbp/team-stats" = ts))
  wjbl_err(wjbl_team_period_stats(WJBL_G), "wehoop_asset_fetch", "teams (30, 12)")
  pbp <- wjbl_body("pbp_7987.json.gz")
  cut <- pbp
  cut$play_by_plays <- cut$play_by_plays[-length(cut$play_by_plays)]
  local_wjbl(list("/pbp/play-by-play" = cut))
  wjbl_err(wjbl_pbp(WJBL_G), "wehoop_asset_fetch", "truncated play-by-play")
  wrong <- pbp
  i <- which(vapply(wrong$play_by_plays, function(p) identical(p$home_away, 1L), logical(1)))[[1]]
  wrong$play_by_plays[[i]]$team_id <- 30L
  local_wjbl(list("/pbp/play-by-play" = wrong))
  wjbl_err(wjbl_pbp(WJBL_G), "wehoop_asset_fetch", "has team_id=30 on side 1")
})

test_that("a game before 2018-19 has no play-by-play (wehoop_no_data), but its box score route still runs", {
  local_wjbl(list("/pbp/play-by-play" = list(), "/pbp/team-stats" = list(), "/pbp/player-stats" = list()))
  wjbl_err(wjbl_pbp(4243), "wehoop_no_data", "the /pbp routes start with 2018-19")
  wjbl_err(wjbl_team_period_stats(4243), "wehoop_no_data", "the /pbp routes start with 2018-19")
  wjbl_err(wjbl_player_period_leaders(4243), "wehoop_no_data", "the /pbp routes start with 2018-19")
  expect_identical(wjbl_game(4243)$play_schedule_id, 4243L)
})

test_that("an error envelope is wehoop_asset_fetch even at HTTP 200", {
  local_wjbl(list("/teams/base" = list(error = list(error_code = "E003", error_message = "bad"))))
  wjbl_err(wjbl_teams(), "wehoop_asset_fetch", "error_code=E003")
  local_wjbl(list("/teams/base" = "not json"))
  wjbl_err(wjbl_teams(), "wehoop_asset_fetch", "non-JSON")
})

test_that("the months, the schedule month, the season phases, the roster and the player echo the request", {
  months <- wjbl_body("months_45.json")
  months$league_id <- 45L # the API echoes a string
  local_wjbl(list("/play-schedule-months" = months))
  wjbl_err(wjbl_game_months(2026), "wehoop_asset_fetch", "asked for league_id=45, got 45")
  months$league_id <- "45"
  months$game_months <- list()
  local_wjbl(list("/play-schedule-months" = months))
  wjbl_err(wjbl_game_months(2026), "wehoop_no_data", "has no game months")
  local_wjbl()
  wjbl_err(wjbl_schedule(2026, game_month = "2026-03"), "wehoop_asset_fetch", "asked for 2026-03")
  wjbl_err(wjbl_schedule(2026, game_month = "2026-04", team_id = 30), "wehoop_asset_fetch", "does not involve team 30")
  expect_identical(nrow(wjbl_schedule(2026, game_month = "2026-04", team_id = 13)), 4L)
  wjbl_err(wjbl_schedule(2027, game_month = "2026-04"), "wehoop_asset_fetch", "asked for league_id=47, got 45")
  wjbl_err(wjbl_team_standings("169,170"), "wehoop_asset_fetch", "asked for season_ids [169, 170], got ['169']")
  wjbl_err(wjbl_team_ranking(169), "wehoop_asset_fetch", "asked for season_ids [169]")
  wjbl_err(wjbl_team_standings(170), "wehoop_asset_fetch", "asked for season_ids [170]")
  seen <- local_wjbl()
  expect_identical(nrow(wjbl_team_ranking(c(169, 170))), 6L)
  expect_identical(seen$reqs[[1]]$query, list(season_ids = "169,170"))
  wjbl_err(wjbl_roster(12, 169), "wehoop_asset_fetch", "asked for team 12 season 169")
  wjbl_err(wjbl_roster(13, 170), "wehoop_asset_fetch", "got team 13 season 169")
  expect_identical(unique(wjbl_roster(13)$team_id), 13L)
  wjbl_err(wjbl_player(1), "wehoop_asset_fetch", "asked for player 1, the body has 9799")
})

test_that("a bad argument is wehoop_bad_request before any request", {
  seen <- local_wjbl()
  wjbl_err(wjbl_schedule(2026, game_month = "2026-4"), "wehoop_bad_request", "game_month")
  expect_identical(wjbl_routes(seen), "/leagues") # as in sdv-py, the season is mapped first
  seen$reqs <- list()
  wjbl_err(wjbl_box_score("abc"), "wehoop_bad_request", "play_schedule_id")
  wjbl_err(wjbl_box_score(TRUE), "wehoop_bad_request", "play_schedule_id")
  wjbl_err(wjbl_box_score(NULL), "wehoop_bad_request", "needs play_schedule_id")
  wjbl_err(wjbl_player(1.5), "wehoop_bad_request", "player_id")
  wjbl_err(wjbl_roster(NULL), "wehoop_bad_request", "needs team_id")
  for (bad in list("", "a", "169,x", list(), 1.5)) wjbl_err(wjbl_team_ranking(bad), "wehoop_bad_request", "season_ids")
  expect_length(seen$reqs, 0L)
  wjbl_err(.wjbl_get("/coach", list(coach_id = 1)), "wehoop_bad_request", "Not a W League route")
})

test_that("HTTP statuses use the package vocabulary; 5xx (500 included) are retried, every attempt throttled", {
  seen <- local_wjbl(list("/teams/base" = wjbl_turns(wjbl_resp("busy", 503L), wjbl_resp("oops", 500L), "teams.json")))
  expect_identical(nrow(wjbl_teams()), 69L)
  expect_length(seen$reqs, 3L)
  expect_identical(seen$waits, 3L)
  local_wjbl(list("/teams/base" = wjbl_resp("down", 503L)))
  e <- wjbl_err(wjbl_teams(), "wehoop_asset_fetch", "HTTP 503")
  expect_true(e$transient)
  local_wjbl(list("/teams/base" = wjbl_resp("gone", 404L)))
  wjbl_err(wjbl_teams(), "wehoop_no_data", "HTTP 404")
  local_wjbl(list("/teams/base" = wjbl_resp("bad", 400L)))
  wjbl_err(wjbl_teams(), "wehoop_bad_request", "HTTP 400")
  local_wjbl(list("/teams/base" = wjbl_resp("no", 403L)))
  e <- wjbl_err(wjbl_teams(), "wehoop_asset_fetch", "HTTP 403")
  expect_false(e$transient)
})

test_that("free text is cleaned of phone numbers and e-mail addresses; contact keys and blood type are dropped", {
  info <- wjbl_body("info_7987.json")
  info$comment <- "TEL 03-1234-5678 / \uff10\uff13\uff0d\uff11\uff12\uff13\uff14\uff0d\uff15\uff16\uff17\uff18 mail a.b@x.co.jp"
  info$contact <- "03-1111-2222"
  local_wjbl(list("/play-schedule" = info))
  got <- wjbl_game_info(WJBL_G)
  expect_identical(got$comment, "TEL [redacted-phone] / [redacted-phone] mail [redacted-email]")
  expect_false(any(grepl("contact", names(got))))
  player <- wjbl_body("player_9799.json")
  player$player_blood <- "A"
  local_wjbl(list("/player" = player))
  got <- wjbl_player(9799)
  expect_false("player_blood" %in% names(got))
  expect_type(got$player_height_cm, "integer")
})

test_that("live: the league list and a final game's box score", {
  skip_intl_live()
  .wjbl_clear_cache()
  withr::defer(.wjbl_clear_cache())
  leagues <- wjbl_leagues()
  expect_identical(leagues$league_id[leagues$season %in% 2026L], 45L)
  box <- wjbl_box_score(WJBL_G)
  expect_identical(sum(box$pts), 141L)
})
