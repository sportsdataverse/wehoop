test_that("ESPN - WNBA Athlete Awards", {
  skip_on_cran()
  skip_on_ci()
  skip_espn_test()

  x <- espn_wnba_player_awards(athlete_id = "3149391")

  # Awards endpoint is sparse -- always returns a data frame (possibly empty)
  expect_s3_class(x, "data.frame")

  # Canonical columns must be present even when empty
  canonical_cols <- c("season", "award_id", "name", "description", "date", "type")
  expect_in(sort(canonical_cols), sort(colnames(x)))

  Sys.sleep(1)
})
