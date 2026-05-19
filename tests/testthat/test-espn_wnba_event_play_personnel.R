test_that("ESPN - WNBA Event Play Personnel", {
  skip_on_cran()
  skip_on_ci()
  skip_espn_test()

  x <- espn_wnba_event_play_personnel(event_id = 401736171, play_id = "401736171001")

  if (is.null(x) || !is.data.frame(x) || nrow(x) == 0) {
    skip("No rows returned from espn_wnba_event_play_personnel at test time")
  }

  required_cols <- c(
    "league",
    "event_id",
    "play_id"
  )
  expect_in(sort(required_cols), sort(colnames(x)))
  expect_s3_class(x, "data.frame")

  Sys.sleep(1)
})

