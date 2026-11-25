# A wrapper's tryCatch() error handler must name the cause of a failure, not
# only "no data available": a timeout, a connection reset and a parse bug
# otherwise read like an empty result. Every request is made to fail offline,
# and every function with a reporting tryCatch() error handler must pass that
# cause on, without the error escaping.

# Functions this setup cannot exercise, with why.
.handler_cause_skip <- c(
  .feb_page_record = "parses the html it is given; no request",
  .wehoop_fallback = "a value fallback that records its cause for .wehoop_report_fallbacks(); no request",
  .intl_json = "parses the text it is given; no request",
  .players_on_court_v3_wnba = "takes a play-by-play frame, not request arguments",
  .read_games_index_strict = "aborts on purpose, with the cause as parent = e",
  update_wbb_db = "aborts on purpose in .read_games_index_strict(), with the cause as parent = e",
  update_wnba_db = "aborts on purpose in .read_games_index_strict(), with the cause as parent = e",
  update_wnba_stats_db = "aborts on purpose in .read_games_index_strict(), with the cause as parent = e",
  wnba_playerheadshot = "builds a URL; no request",
  ncaa_wbb_NET_rankings = "reads through xml2, not httr2",
  wnba_referee_assignments = "aborts on purpose, with the cause as parent = cnd",
  wnba_boxscoreplayertrackv2 = "defunct (lifecycle::deprecate_stop())",
  wnba_data_pbp = "defunct (lifecycle::deprecate_stop())",
  wnba_playercareerbycollege = "defunct (lifecycle::deprecate_stop())",
  wnba_teamgamestreakfinder = "defunct (lifecycle::deprecate_stop())",
  wnba_teamhistoricalleaders = "defunct (lifecycle::deprecate_stop())"
)

# Per-function overrides of .handler_cause_args. A past season sends
# .espn_basketball_team_roster() to a release asset instead of the request.
.handler_cause_overrides <- list(
  .espn_basketball_team_roster = list(season = 9999L)
)

.handler_cause_args <- list(
  league = "wnba", season = 2024L, year = 2024L, game_id = "401620213",
  team_id = "5", event_id = "401620213", athlete_id = "2998928",
  coach_id = "1", group_id = "50", tournament_id = "1", week = 1L,
  play_id = "1", ranking_id = "1", season_type = 2L, award_id = "1",
  date = "2024-06-01", franchise_id = "1", group = "50", player_id = "1",
  position_id = "1", provider_id = "1", record_id = "1", round = 1L,
  pick = 1L, order = 1L, sport = "wnba", resource = "teams",
  season_dates = "20240601"
)

test_that("error handlers report the cause of a failed request", {
  skip_on_cran()
  ns <- asNamespace("wehoop")
  # Selected by handler shape (a block body or .report_api_error()), not by
  # whether it already reports the cause, so a handler that loses
  # conditionMessage() fails here instead of dropping out of the list. A
  # value fallback such as `error = function(e) NULL` is not selected.
  has_reporting_handler <- function(nm) {
    f <- get(nm, envir = ns)
    if (!is.function(f) || is.primitive(f)) return(FALSE)
    b <- paste(deparse(body(f)), collapse = "\n")
    grepl("tryCatch", b, fixed = TRUE) &&
      grepl("error = function[(](e|cnd|err)[)] ([{]|[.]report_api_error)", b)
  }
  fns <- Filter(has_reporting_handler, ls(ns, all.names = TRUE))
  expect_true(all(names(.handler_cause_skip) %in% fns))
  fns <- setdiff(fns, names(.handler_cause_skip))
  expect_gt(length(fns), 200L)

  # Anything that reaches the network without httr2 fails fast on a dead proxy.
  withr::local_envvar(http_proxy = "http://127.0.0.1:9", https_proxy = "http://127.0.0.1:9")
  # Fake Her Hoop Stats credentials, so its wrappers get as far as the request.
  withr::local_envvar(HERHOOPSTATS_EMAIL = "test@example.com", HERHOOPSTATS_PW = "test")
  local_mocked_bindings(
    req_perform = function(...) stop("mock outage"),
    .package = "httr2"
  )

  silent <- character()
  escaped <- character()
  for (nm in fns) {
    f <- get(nm, envir = ns)
    # Only the arguments without a default; the defaults cover the rest.
    fm <- formals(f)
    req <- names(fm)[vapply(fm, function(x) identical(x, quote(expr = )), logical(1))]
    args <- .handler_cause_args[intersect(req, names(.handler_cause_args))]
    args[names(.handler_cause_overrides[[nm]])] <- .handler_cause_overrides[[nm]]
    msgs <- character()
    withCallingHandlers(
      tryCatch(do.call(f, args), error = function(e) escaped <<- c(escaped, nm)),
      message = function(m) {
        msgs <<- c(msgs, conditionMessage(m))
        invokeRestart("muffleMessage")
      },
      warning = function(w) invokeRestart("muffleWarning")
    )
    if (!any(grepl("mock outage", msgs, fixed = TRUE))) silent <- c(silent, nm)
  }
  expect_identical(escaped, character())
  expect_identical(setdiff(silent, escaped), character())
})
