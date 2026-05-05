test_that("ESPN - WNBA Athlete Overview", {
  skip_on_cran()
  skip_on_ci()
  skip_espn_test()

  x <- espn_wnba_athlete_overview(athlete_id = "3149391", season = 2024)

  if (length(x) == 0) {
    skip("No data returned from endpoint at test time")
  }

  expect_type(x, "list")

  expected_slots <- c("Statistics", "NextGame", "Last5Games",
                      "Headlines", "FantasyOutlook")
  expect_in(sort(expected_slots), sort(names(x)))

  for (slot_name in expected_slots) {
    if (!is.null(x[[slot_name]]) && is.data.frame(x[[slot_name]])) {
      expect_s3_class(x[[slot_name]], "data.frame")
    }
  }

  Sys.sleep(1)
})
