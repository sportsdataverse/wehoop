# test-wbb_crosswalk_sources.R
# Offline tests for the season-correct sources behind wbb_team_crosswalk()
# (R port of sportsdataverse-py #604 / #605). No network: every source is
# served from a recorded fixture in fixtures/crosswalk_basketball/:
#   * fox_wcbk_standings_18_2016.json -- real capture (Fox wcbk Big Ten asked
#     for season=2016 answers with the current season), copied from
#     sportsdataverse-py tests/fixtures/crosswalk_basketball.
#   * fox_wcbk_conferences.json, wbb_group_seasons.parquet,
#     wbb_team_group_seasons_{2024,2025}.parquet -- the Fox wcbk conference
#     catalog and the wbb_groups release assets (captured 2026-09-27).
#   * torvik_wbb_2025_403.html -- barttorvik.com's CloudFront 403 body, as a
#     blocked egress receives it (captured 2026-09-27).
#   * torvik_wbb_2021_head.csv -- the header and first three rows of Torvik's
#     ncaaw/2021_team_results.csv (captured 2026-09-27).

.xw_fixture <- function(name) testthat::test_path("fixtures", "crosswalk_basketball", name)

.xw_json <- function(name) {
  jsonlite::fromJSON(.xw_fixture(name), simplifyVector = FALSE,
                     simplifyDataFrame = FALSE, simplifyMatrix = FALSE)
}

# Serve the committed wbb_groups assets; an absent one reads as a 404.
.serve_groups <- function(env = parent.frame()) {
  testthat::local_mocked_bindings(
    .bb_release_parquet = function(file, missing_ok = FALSE) {
      f <- .xw_fixture(basename(file))
      if (!file.exists(f)) {
        if (missing_ok) return(NULL)
        .bb_source_error(paste("release asset", file, "answered HTTP 404"))
      }
      as.data.frame(arrow::read_parquet(f))
    },
    .env = env
  )
}

# ---------------------------------------------------------------------------
# (b) Torvik: a blocked or empty answer fails the build
# ---------------------------------------------------------------------------

test_that("a blocked or empty Torvik answer fails the build, never NA bart_*", {
  skip_on_cran()
  blocked <- paste(readLines(.xw_fixture("torvik_wbb_2025_403.html"), warn = FALSE), collapse = "\n")
  local_mocked_bindings(.bb_espn_team_directory = function(...) {
    data.frame(team_id = "2579", abbreviation = "SC", display_name = "South Carolina Gamecocks",
               short_name = "South Carolina", team = "South Carolina", mascot = "Gamecocks",
               conference_name = "Southeastern Conference", stringsAsFactors = FALSE)
  })
  for (body in c(blocked, "")) {
    local_mocked_bindings(.bart_wbb_text = function(path) body)
    expect_error(
      suppressMessages(wbb_team_crosswalk(season = 2025, fox = data.frame())),
      class = "crosswalk_source_error"
    )
  }
})

test_that("Torvik is not called before its first women's season (2021)", {
  skip_on_cran()
  boom <- function(...) stop("Torvik must not be called")
  expect_equal(nrow(.bb_torvik_teams(boom, 2020L, .wbb_torvik_first_season)), 0L)
  expect_error(.bb_torvik_teams(boom, 2021L, .wbb_torvik_first_season), "must not be called")
})

test_that("a season before Torvik's history builds with NA bart_*", {
  skip_on_cran()
  local_mocked_bindings(
    .bb_espn_team_directory = function(...) {
      data.frame(team_id = "2579", abbreviation = "SC", display_name = "South Carolina Gamecocks",
                 short_name = "South Carolina", team = "South Carolina", mascot = "Gamecocks",
                 conference_name = "Southeastern Conference", stringsAsFactors = FALSE)
    },
    bart_wbb_ratings = function(...) stop("Torvik must not be called")
  )
  out <- wbb_team_crosswalk(season = 2020, fox = data.frame())
  expect_equal(nrow(out), 1L)
  expect_true(is.na(out$bart_team))
  expect_equal(out$match_method, "espn_only")
})

test_that("bart_wbb_ratings() keeps a season whose header fread has to re-quote", {
  skip_on_cran()
  # 2021-2022 files quote one header ("Fun Rk, adjt"); fread warns, and that
  # warning used to discard the whole season as an empty frame.
  csv <- paste(readLines(.xw_fixture("torvik_wbb_2021_head.csv"), warn = FALSE), collapse = "\n")
  local_mocked_bindings(.bart_wbb_text = function(path) csv)
  out <- bart_wbb_ratings(year = 2021)
  expect_equal(out$team, c("Stanford", "Baylor", "Connecticut"))
  expect_equal(out$conf, c("P12", "B12", "BE"))
})

# ---------------------------------------------------------------------------
# (a) Fox: the requested season's standings only
# ---------------------------------------------------------------------------

test_that("Fox standings labelled with another season do not stamp this one", {
  skip_on_cran()
  catalog <- .xw_json("fox_wcbk_conferences.json")
  stale <- .xw_json("fox_wcbk_standings_18_2016.json")  # labelled "2026"
  local_mocked_bindings(.fox_bb_get = function(path, query = list(), missing_ok = FALSE) {
    if (endsWith(path, "league/conferences")) return(catalog)
    if (identical(as.character(query$groupId), "18")) stale else list()
  })
  expect_error(.bb_fox_season_teams("wcbk", 2019L, .wbb_fox_first_season),
               "no 2018-19 standings", class = "crosswalk_source_error")
})

test_that("Fox is not called before its first women's season (2018-19)", {
  skip_on_cran()
  local_mocked_bindings(.fox_bb_get = function(...) stop("Fox must not be called"))
  expect_equal(nrow(.bb_fox_season_teams("wcbk", 2018L, .wbb_fox_first_season)), 0L)
})

test_that("a Fox conference needs two agreeing teams that stay put", {
  skip_on_cran()
  x <- data.frame(
    espn_team_id = c(2130L, 2305L, 239L, 2483L),
    espn_conference = c("Western Athletic Conference", "Big 12 Conference",
                        "Big 12 Conference", "Pac-12 Conference"),
    fox_section = c("Independents (DI)", "Big 12", "Big 12", "Big Ten"),
    stringsAsFactors = FALSE
  )
  # 2483 Oregon moves to the Big Ten the next season, so it cannot vote for it.
  out <- .bb_drop_unconfirmed_fox_sections(x, movers = "2483")
  expect_equal(out$fox_section, c(NA, "Big 12", "Big 12", NA))
})

test_that("next-season movers come from both seasons' reference assets", {
  skip_on_cran()
  skip_if_not_installed("arrow")
  .serve_groups()
  movers <- .bb_next_season_movers("wbb", 2024L)
  expect_true(all(c("2483", "26", "30", "264") %in% movers))  # Pac-12 -> Big Ten
  expect_false("2579" %in% movers)  # South Carolina stayed in the SEC
  expect_equal(.bb_next_season_movers("wbb", 2025L), character())  # no 2026 fixture
})

# ---------------------------------------------------------------------------
# (e) espn_conference: that season's conference under that season's name
# ---------------------------------------------------------------------------

test_that("the conference map names each conference as of the season", {
  skip_on_cran()
  skip_if_not_installed("arrow")
  .serve_groups()
  out <- .bb_conference_map("wbb", 2024L)
  expect_equal(names(out), c("team_id", "conference_name"))
  expect_true(is.character(out$team_id))
  expect_equal(nrow(out), 360L)
  named <- stats::setNames(out$conference_name, out$team_id)
  expect_equal(unname(named[c("3101", "2000")]), rep("Western Athletic Conference", 2))
  expect_equal(unname(named["2483"]), "Pac-12 Conference")
  expect_false("United Athletic Conference" %in% out$conference_name)
  expect_error(.bb_conference_map("wbb", 2031L), "team_group_seasons_2031",
               class = "crosswalk_source_error")
})
