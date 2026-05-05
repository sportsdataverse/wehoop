
test_that("ESPN - WNBA Team News", {
  skip_on_cran()
  skip_on_ci()
  skip_espn_test()

  # team_id 17 = Las Vegas Aces
  x <- espn_wnba_team_news(team_id = 17, limit = 10)

  if (is.null(x) || !is.data.frame(x) || nrow(x) == 0) {
    skip("No rows returned from espn_wnba_team_news at test time")
  }

  cols <- c(
    "headline",
    "published"
  )

  expect_in(sort(cols), sort(colnames(x)))
  expect_s3_class(x, "data.frame")

  Sys.sleep(1)
})
