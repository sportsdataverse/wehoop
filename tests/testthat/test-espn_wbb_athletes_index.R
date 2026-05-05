test_that("ESPN WBB Athletes Index", {
  skip_on_cran()
  skip_on_ci()
  skip_espn_test()

  # Use limit = 50 so the test is fast (avoids fetching 6K-12K rows)
  x <- espn_wbb_athletes_index(season = 2025, limit = 50)

  if (is.null(x) || !is.data.frame(x) || nrow(x) == 0) {
    skip("No rows returned from espn_wbb_athletes_index at test time")
  }

  cols_x <- c(
    "athlete_id", "full_name", "jersey", "position",
    "team_id", "headshot", "status", "link"
  )

  expect_in(sort(cols_x), sort(colnames(x)))
  expect_s3_class(x, "data.frame")
  expect_lte(nrow(x), 50L)

  Sys.sleep(1)
})
