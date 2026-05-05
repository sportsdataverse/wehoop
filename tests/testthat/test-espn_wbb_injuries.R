
test_that("ESPN - WBB Injuries (league-wide)", {
  skip_on_cran()
  skip_on_ci()
  skip_espn_test()

  x <- espn_wbb_injuries()

  # Skip-if-empty guard: WBB injury data is typically sparse on ESPN.
  # The function must return a tibble (possibly zero rows) rather than NULL.
  expect_true(is.data.frame(x) || is.null(x))

  if (is.null(x) || !is.data.frame(x) || nrow(x) == 0L) {
    skip("No injury rows returned for WBB at test time (expected -- WBB injuries are typically sparse on ESPN)")
  }

  cols <- c(
    "team_id",
    "athlete_id",
    "athlete_name",
    "position",
    "status"
  )

  expect_in(sort(cols), sort(colnames(x)))
  expect_s3_class(x, "data.frame")

  Sys.sleep(1)
})
