test_that("ESPN - WNBA Athlete Eventlog", {
  skip_on_cran()
  skip_on_ci()
  skip_espn_test()

  x <- espn_wnba_player_eventlog(athlete_id = "3149391", season = 2024)

  if (is.null(x) || !is.data.frame(x) || nrow(x) == 0) {
    skip("No rows returned from endpoint at test time")
  }

  expect_s3_class(x, "data.frame")

  # statistics_ref must be present as a character column when data exist
  if (nrow(x) > 0 && "statistics_ref" %in% colnames(x)) {
    expect_type(x[["statistics_ref"]], "character")
  }

  Sys.sleep(1)
})
