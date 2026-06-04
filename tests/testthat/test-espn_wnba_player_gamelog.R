test_that("ESPN - WNBA Athlete Gamelog", {
  skip_on_cran()
  skip_on_ci()
  skip_espn_test()

  x <- espn_wnba_player_gamelog(athlete_id = "3149391", season = 2024)

  if (is.null(x) || !is.data.frame(x) || nrow(x) == 0) {
    skip("No rows returned from endpoint at test time")
  }

  expect_s3_class(x, "data.frame")
  expect_gt(nrow(x), 0)

  Sys.sleep(1)
})
