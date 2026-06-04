test_that("ESPN - WNBA Event Official Detail", {
  skip_on_cran()
  skip_on_ci()
  skip_espn_test()

  x <- espn_wnba_game_official_detail(event_id = 401736171, order = 1)

  if (is.null(x) || !is.data.frame(x) || nrow(x) == 0) {
    skip("No rows returned from espn_wnba_game_official_detail at test time")
  }

  required_cols <- c(
    "league",
    "event_id",
    "full_name",
    "position_name"
  )
  expect_in(sort(required_cols), sort(colnames(x)))
  expect_s3_class(x, "data.frame")

  Sys.sleep(1)
})

