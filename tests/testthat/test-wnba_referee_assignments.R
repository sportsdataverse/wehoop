# Offline tests answer every request through a mocked httr2::req_perform()
# (see helper-official-nba.R), so none of them touches the network.

officials_schema <- c(
  league = "character", game_id = "character", game_date = "Date",
  season = "integer", season_type = "character", game_code = "character",
  home_team_id = "integer", home_team_abbr = "character",
  away_team_id = "integer", away_team_abbr = "character",
  crew_position = "integer", official_id = "integer",
  official_name = "character", jersey_num = "character"
)
replay_schema <- c(
  league = "character", game_date = "Date",
  official_id = "integer", official_name = "character"
)

read_payload <- function() {
  jsonlite::read_json(official_fixture("referee_assignments_2026-06-13.json"))
}
read_gold <- function(name) {
  utils::read.csv(official_fixture(name), colClasses = "character")
}
empty_200 <- function() {
  httr2::response(200L, body = charToRaw('{"wnba":{"Table":{"rows":[]},"Table1":{"rows":[]}}}'))
}

test_that("parser matches the sdv-py golden CSVs on every column", {
  result <- .parse_wnba_referee_assignments(read_payload(), league = "wnba")

  gold_officials <- read_gold("referee_assignments_2026-06-13_wnba_officials.csv")
  expect_identical(names(result$officials), names(gold_officials))
  expect_equal(nrow(result$officials), 12L)
  expect_equal(chr_frame(result$officials), chr_frame(gold_officials))
  # WNBA seasons sit in one calendar year: the START year is the season.
  expect_true(all(result$officials$season == 2026L))

  gold_replay <- read_gold("referee_assignments_2026-06-13_wnba_replay_center.csv")
  expect_identical(names(result$replay_center), names(gold_replay))
  expect_equal(chr_frame(result$replay_center), chr_frame(gold_replay))
})

test_that("both tables keep one typed schema, empty or not, through bind_rows()", {
  full <- .parse_wnba_referee_assignments(read_payload(), league = "wnba")
  empty <- .parse_wnba_referee_assignments(list(), league = "wnba")
  schemas <- list(officials = officials_schema, replay_center = replay_schema)

  for (tbl in names(schemas)) {
    expect_equal(nrow(empty[[tbl]]), 0L)
    expect_identical(col_classes(empty[[tbl]]), schemas[[tbl]], info = tbl)
    expect_identical(col_classes(full[[tbl]]), schemas[[tbl]], info = tbl)
    bound <- dplyr::bind_rows(empty[[tbl]], full[[tbl]])
    expect_identical(col_classes(bound), schemas[[tbl]], info = tbl)
    expect_equal(nrow(bound), nrow(full[[tbl]]))
  }
})

test_that("a null field becomes NA -- it never drops a row or a column", {
  raw <- read_payload()
  game1_id <- pad_id(raw$wnba$Table$rows[[1]]$game_id)
  game2_id <- pad_id(raw$wnba$Table$rows[[2]]$game_id)

  raw$wnba$Table$rows[[1]]["official3_JNum"] <- list(NULL)
  raw$wnba$Table$rows[[2]]["season"] <- list(NULL)
  for (i in seq_along(raw$wnba$Table$rows)) {
    raw$wnba$Table$rows[[i]]["game_code"] <- list(NULL)
    raw$wnba$Table$rows[[i]]["home_team_id"] <- list(NULL)
  }
  raw$wnba$Table1$rows[[1]]["official_code"] <- list(NULL)

  result <- .parse_wnba_referee_assignments(raw, league = "wnba")

  expect_equal(nrow(result$officials), 12L)
  expect_identical(col_classes(result$officials), officials_schema)

  row3 <- result$officials[result$officials$game_id == game1_id & result$officials$crew_position == 3L, ]
  expect_equal(nrow(row3), 1L)
  expect_true(is.na(row3$jersey_num))

  rows2 <- result$officials[result$officials$game_id == game2_id, ]
  expect_equal(nrow(rows2), 3L)
  expect_true(all(is.na(rows2$season)))
  expect_true(all(is.na(rows2$season_type)))

  # A field missing from every row is an all-NA column of the documented type.
  expect_true(all(is.na(result$officials$game_code)))
  expect_true(all(is.na(result$officials$home_team_id)))

  expect_equal(nrow(result$replay_center), 1L)
  expect_identical(col_classes(result$replay_center), replay_schema)
  expect_true(is.na(result$replay_center$official_id))
  expect_false(is.na(result$replay_center$official_name))
})

test_that("string-encoded ids are coerced to integer", {
  raw <- list(wnba = list(
    Table = list(rows = list(list(
      game_id = "1022600097", game_date = "06/13/2026", season = "22026",
      game_code = "20260613/INDCON",
      home_team_id = "1611661323", home_team_abbr = "CON",
      away_team_id = "1611661325", away_team_abbr = "IND",
      official1 = "Kevin Fahy", official1_code = "1628952", official1_JNum = "43"
    ))),
    Table1 = list(rows = list(list(
      game_date = "06/13/2026", official_code = "101284", replaycenter_official = "John Goble"
    )))
  ))
  result <- .parse_wnba_referee_assignments(raw, league = "wnba")

  expect_identical(result$officials$home_team_id, 1611661323L)
  expect_identical(result$officials$away_team_id, 1611661325L)
  expect_identical(result$officials$official_id, 1628952L)
  expect_identical(result$replay_center$official_id, 101284L)
})

test_that("end to end: a mocked 200 returns wehoop_data tibbles matching the goldens", {
  local_official_response(official_response(200L, "referee_assignments_2026-06-13.json"))
  result <- wnba_referee_assignments("2026-06-13")

  expect_named(result, c("officials", "replay_center"))
  expect_s3_class(result$officials, "wehoop_data")
  expect_s3_class(result$replay_center, "wehoop_data")
  expect_equal(
    chr_frame(result$officials),
    chr_frame(read_gold("referee_assignments_2026-06-13_wnba_officials.csv"))
  )
  expect_equal(
    chr_frame(result$replay_center),
    chr_frame(read_gold("referee_assignments_2026-06-13_wnba_replay_center.csv"))
  )
})

test_that("a POSIXct date keeps its own calendar day (no as.Date() UTC shift)", {
  sent <- NULL
  local_official_response(function(req) {
    sent <<- httr2::url_parse(req$url)$query$date
    empty_200()
  })

  # 22:30 EDT is 02:30 UTC the next day: as.Date() would send 2026-06-14.
  result <- wnba_referee_assignments(as.POSIXct("2026-06-13 22:30:00", tz = "America/New_York"))
  expect_identical(sent, "2026-06-13")
  expect_equal(nrow(result$officials), 0L)

  wnba_referee_assignments(as.Date("2026-06-13"))
  expect_identical(sent, "2026-06-13")
  wnba_referee_assignments("2026-06-13")
  expect_identical(sent, "2026-06-13")
})

test_that("a malformed, multi-value or NA date is rejected before any request", {
  local_official_response(function(req) stop("no request expected"))

  expect_error(wnba_referee_assignments("06/13/2026"), regexp = "YYYY-MM-DD")
  expect_error(wnba_referee_assignments("2026-6-13"), regexp = "YYYY-MM-DD")
  expect_error(wnba_referee_assignments(NA_character_), regexp = "YYYY-MM-DD")
  expect_error(wnba_referee_assignments(c("2026-06-13", "2026-06-14")), regexp = "YYYY-MM-DD")
  expect_error(wnba_referee_assignments(as.Date(c("2026-06-13", "2026-06-14"))), regexp = "YYYY-MM-DD")
  expect_error(wnba_referee_assignments(as.Date(NA)), regexp = "YYYY-MM-DD")
  # Shape-valid but impossible: must fail here, not reach the (stubbed) request.
  expect_error(wnba_referee_assignments("2026-02-31"), regexp = "YYYY-MM-DD")
})

test_that("a response without the wnba Table/Table1 block is a fetch error, not an empty day", {
  # The live feed carries every league's block on every date (zero rows on a
  # day without games), so a missing block is an error envelope or a new schema.
  for (json in c('{"nba":{"Table":{"rows":[]},"Table1":{"rows":[]}}}',
                 '{"wnba":{"Table":{"rows":[]}}}',
                 '{"message":"error"}')) {
    local_official_response(function(req) httr2::response(200L, body = charToRaw(json)))
    expect_error(wnba_referee_assignments("2026-06-13"), class = "wehoop_fetch_error", info = json)
  }
  local_official_response(function(req) empty_200())
  result <- wnba_referee_assignments("2026-06-13")
  expect_equal(nrow(result$officials), 0L)
  expect_equal(nrow(result$replay_center), 0L)
})

test_that("an S3 AccessDenied 403 or a 404 signals wehoop_no_data", {
  cases <- list(
    s3_403 = official_response(403L, "l2m_json_0022500002_no_report_s3_403.xml"),
    not_found_404 = httr2::response(404L, body = charToRaw("<html>Not Found</html>"))
  )
  for (nm in names(cases)) {
    local_official_response(cases[[nm]])
    cnd <- expect_error(wnba_referee_assignments("2026-06-13"), class = "wehoop_no_data", info = nm)
    expect_true(inherits(cnd, "wehoop_error") && inherits(cnd, "error"), info = nm)
    expect_false(inherits(cnd, "wehoop_fetch_error"), info = nm)
  }
})

test_that("a block, a bad status, an empty or non-JSON body, or a transport failure signals wehoop_fetch_error", {
  cases <- list(
    akamai_html_403 = official_response(403L, "akamai_403_blocked_ua.html"),
    access_denied_500 = httr2::response(500L, body = charToRaw("<Error><Code>AccessDenied</Code></Error>")),
    bodiless_503 = httr2::response(status_code = 503L),
    empty_200 = httr2::response(status_code = 200L),
    html_200 = official_response(200L, "akamai_403_blocked_ua.html"),
    transport = function(req) stop("simulated connection reset")
  )
  for (nm in names(cases)) {
    local_official_response(cases[[nm]])
    cnd <- expect_error(wnba_referee_assignments("2026-06-13"), class = "wehoop_fetch_error", info = nm)
    expect_true(inherits(cnd, "wehoop_error") && inherits(cnd, "error"), info = nm)
    expect_false(inherits(cnd, "wehoop_no_data"), info = nm)
  }
})

test_that("a caller mistake surfaces as itself, not as a wehoop_fetch_error", {
  local_official_response(function(req) stop("no request expected"))
  cnd <- expect_error(wnba_referee_assignments("2026-06-13", proxy = list(bogus_arg = 1)), regexp = "bogus_arg")
  expect_false(inherits(cnd, "wehoop_fetch_error"))
})

test_that("retries cover transient statuses and transport failures, never 403/404", {
  sent <- NULL
  local_official_response(function(req) {
    sent <<- req
    empty_200()
  })
  wnba_referee_assignments("2026-06-13")

  # httr2 stores the req_retry() settings in `req$policies`.
  policies <- sent$policies
  expect_true(policies$retry_on_failure)
  expect_equal(policies$retry_max_tries, 3)
  for (status in c(408L, 429L, 500L, 502L, 503L, 504L)) {
    expect_true(policies$retry_is_transient(httr2::response(status)), info = status)
  }
  for (status in c(200L, 403L, 404L)) {
    expect_false(policies$retry_is_transient(httr2::response(status)), info = status)
  }
})

test_that("wnba_referee_assignments() live smoke test", {
  skip_official_nba_test()
  skip_on_cran()
  skip_on_ci()
  skip_if_offline("official.nba.com")

  result <- wnba_referee_assignments(Sys.Date() - 1)
  expect_named(result, c("officials", "replay_center"))
  expect_s3_class(result$officials, "wehoop_data")
  expect_s3_class(result$replay_center, "wehoop_data")
  # A zero-row day is fine; the schema must match regardless.
  expect_identical(col_classes(result$officials), officials_schema)
  expect_identical(col_classes(result$replay_center), replay_schema)
})
