
test_that("ESPN - WNBA Draft", {
  skip_on_cran()
  skip_on_ci()
  skip_espn_test()

  x <- espn_wnba_draft(season = 2025)

  # Skip-if-empty guard: draft data may be absent outside the draft window
  if (is.null(x) || !is.data.frame(x) || nrow(x) == 0) {
    skip("No rows returned from ESPN WNBA draft endpoint at test time")
  }

  cols <- c(
    "season",
    "round",
    "pick",
    "overall",
    "team_id",
    "athlete_id",
    "athlete_name",
    "position",
    "college"
  )

  expect_in(sort(cols), sort(colnames(x)))
  expect_s3_class(x, "data.frame")

  Sys.sleep(3)
})
