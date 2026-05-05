
test_that("ESPN - WNBA Transactions", {
  skip_on_cran()
  skip_on_ci()
  skip_espn_test()

  x <- espn_wnba_transactions(season = 2025, limit = 50)

  # Skip-if-empty guard: transactions may be absent pre-season
  if (is.null(x) || !is.data.frame(x) || nrow(x) == 0) {
    skip("No rows returned from ESPN WNBA transactions endpoint at test time")
  }

  cols <- c(
    "transaction_id",
    "date",
    "type",
    "description",
    "team_id",
    "athlete_id",
    "athlete_name",
    "from_team_id",
    "to_team_id"
  )

  expect_in(sort(cols), sort(colnames(x)))
  expect_s3_class(x, "data.frame")

  Sys.sleep(3)
})
