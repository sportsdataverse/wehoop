test_that("load_wnba_stats_leaguedash rejects an unknown or missing table", {
  expect_error(load_wnba_stats_leaguedash(seasons = 2026),
               "must be exactly one of")
  expect_error(load_wnba_stats_leaguedash(seasons = 2026, table = "not_a_table"),
               "must be exactly one of")
  expect_error(
    load_wnba_stats_leaguedash(seasons = 2026,
                               table = c("player_bio", "player_master")),
    "must be exactly one of"
  )
})

test_that("load_wnba_stats_leaguedash returns a wehoop_data tibble for a cube table", {
  skip_on_cran()
  skip_on_ci()
  skip_load_test()

  bio <- load_wnba_stats_leaguedash(seasons = most_recent_wnba_stats_season(),
                                    table = "player_bio")

  if (length(bio) == 0 || nrow(bio) == 0) {
    skip("No rows returned at test time -- release may not exist yet")
  }

  expect_s3_class(bio, "wehoop_data")
  expect_s3_class(bio, "data.frame")
  expect_in("player_id", colnames(bio))
})

test_that("load_wnba_stats_leaguedash reaches a historical season", {
  skip_on_cran()
  skip_on_ci()
  skip_load_test()

  std <- load_wnba_stats_leaguedash(seasons = 1997, table = "standings")

  if (length(std) == 0 || nrow(std) == 0) {
    skip("No rows returned at test time -- release may not exist yet")
  }

  expect_gt(nrow(std), 0)
  expect_in("team_id", colnames(std))
})
