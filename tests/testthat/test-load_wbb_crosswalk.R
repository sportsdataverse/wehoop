test_that("load_wbb_team_crosswalk() loads a cached snapshot", {
  skip_on_cran()
  skip_load_test()
  out <- load_wbb_team_crosswalk(seasons = most_recent_wbb_season())
  expect_s3_class(out, "wehoop_data")
  expect_true(all(c("season", "espn_team_id") %in% names(out)))
})

test_that("load_wbb_schedule_crosswalk() loads a cached snapshot", {
  skip_on_cran()
  skip_load_test()
  out <- load_wbb_schedule_crosswalk(seasons = most_recent_wbb_season())
  expect_s3_class(out, "wehoop_data")
  expect_true("season" %in% names(out))
})

test_that("load_wbb_player_crosswalk() loads a cached snapshot", {
  skip_on_cran()
  skip_load_test()
  out <- load_wbb_player_crosswalk(seasons = most_recent_wbb_season())
  expect_s3_class(out, "wehoop_data")
  expect_true("season" %in% names(out))
})

test_that("the NCAA-ESPN crosswalk loaders read wbb_crosswalk and cast ESPN ids (offline)", {
  urls <- character()
  local_mocked_bindings(parquet_from_url = function(url) {
    urls <<- c(urls, url)
    data.table::data.table(ncaa_org_id = 5L, espn_team_id = "2006", espn_conference_id = "14")
  })
  for (f in list(load_wbb_ncaa_espn_team_crosswalk, load_wbb_ncaa_espn_schools,
                 load_wbb_ncaa_espn_school_seasons)) {
    out <- f()
    expect_s3_class(out, "wehoop_data")
    expect_identical(out$espn_team_id, 2006L)
  }
  expect_identical(out$espn_conference_id, 14L)
  base <- "https://github.com/sportsdataverse/sportsdataverse-data/releases/download/wbb_crosswalk/"
  expect_equal(urls, paste0(base, c("ncaa_espn_team_crosswalk", "ncaa_espn_schools",
                                    "ncaa_espn_school_seasons"), ".parquet"))
})

test_that("the NCAA-ESPN crosswalk loaders return the published tables", {
  skip_on_cran()
  skip_load_test()
  tc <- load_wbb_ncaa_espn_team_crosswalk()
  expect_gt(nrow(tc), 0)
  expect_in(c("season", "ncaa_team_id", "ncaa_org_id", "espn_team_id", "match_method"), names(tc))
  expect_type(tc$espn_team_id, "integer")
  expect_type(tc$ncaa_team_id, "integer")
  expect_in(c("ncaa_org_id", "espn_team_id"), names(load_wbb_ncaa_espn_schools()))
  expect_in(c("ncaa_org_id", "sport", "season", "ncaa_team_id", "espn_team_id"),
            names(load_wbb_ncaa_espn_school_seasons()))
})
