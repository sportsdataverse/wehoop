test_that("ESPN - WNBA Athlete Stats", {
  skip_on_cran()
  skip_on_ci()
  skip_espn_test()

  x <- espn_wnba_athlete_stats(athlete_id = "3149391", season = 2024)

  if (length(x) == 0) {
    skip("No data returned from endpoint at test time")
  }

  expect_type(x, "list")

  # All returned elements should be data frames
  for (slot_name in names(x)) {
    if (!is.null(x[[slot_name]])) {
      expect_s3_class(x[[slot_name]], "data.frame")
    }
  }

  Sys.sleep(1)
})
