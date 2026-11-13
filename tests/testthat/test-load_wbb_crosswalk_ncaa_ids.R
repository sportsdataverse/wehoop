test_that("load_wbb_player_crosswalk() accepts 2007 onward and returns ncaa ids as integer (offline)", {
  urls <- character()
  local_mocked_bindings(
    rds_from_url = function(url) {
      urls <<- c(urls, url)
      data.table::data.table(season = 2007L, espn_athlete_id = "5630", ncaa_player_id = "9342950")
    },
    .release_asset_exists = function(url) TRUE
  )
  out <- load_wbb_player_crosswalk(seasons = 2007:2008)
  expect_length(urls, 2)
  expect_identical(out$espn_athlete_id[1], 5630L)
  expect_identical(out$ncaa_player_id[1], 9342950L)
  expect_error(load_wbb_player_crosswalk(seasons = 2006), "Published seasons: 2007")
})

test_that("the WBB schedule and player crosswalks carry the ncaa ids", {
  skip_on_cran()
  skip_load_test()
  s <- load_wbb_schedule_crosswalk(seasons = 2026)
  expect_in(c("yahoo_game_id", "ncaa_contest_id"), names(s))
  expect_type(s$ncaa_contest_id, "integer")
  p <- load_wbb_player_crosswalk(seasons = c(2007, 2026))
  expect_setequal(unique(p$season), c(2007L, 2026L))
  expect_true(all(is.na(p$ncaa_player_id[p$season == 2007])))
  expect_gt(sum(!is.na(p$ncaa_player_id[p$season == 2026])), 0)
})

test_that("the crosswalk ncaa ids join load_ncaa_wbb_* ids without a cast", {
  skip_on_cran()
  skip_load_test()
  p <- load_wbb_player_crosswalk(seasons = 2025)
  r <- load_ncaa_wbb_team_rosters(seasons = 2025)
  expect_identical(class(p$ncaa_player_id), class(r$player_id))
  expect_gt(length(intersect(p$ncaa_player_id, r$player_id)), 1000)
  s <- load_wbb_schedule_crosswalk(seasons = 2025)
  g <- load_ncaa_wbb_schedule(seasons = 2025)
  expect_identical(class(s$ncaa_contest_id), class(g$contest_id))
  expect_gt(length(intersect(s$ncaa_contest_id, g$contest_id)), 1000)
})
