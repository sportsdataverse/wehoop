test_that("ESPN - WBB Athlete Awards", {
  skip_on_cran()
  skip_on_ci()
  skip_espn_test()

  x <- espn_wbb_athlete_awards(athlete_id = "4432755")

  # Awards endpoint is sparse -- always returns a data frame (possibly empty)
  expect_s3_class(x, "data.frame")

  # Canonical columns must be present even when empty
  canonical_cols <- c("season", "award_id", "name", "description", "date", "type")
  expect_in(sort(canonical_cols), sort(colnames(x)))

  Sys.sleep(1)
})
