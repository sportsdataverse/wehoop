test_that("ESPN - WBB Event Broadcasts", {
  skip_on_cran()
  skip_on_ci()
  skip_espn_test()

  x <- espn_wbb_event_broadcasts(event_id = "401736171")

  if (is.null(x) || !is.data.frame(x) || nrow(x) == 0) {
    skip("No rows returned from espn_wbb_event_broadcasts at test time")
  }

  required_cols <- c(
    "event_id",
    "broadcast_id",
    "names"
  )
  expect_in(sort(required_cols), sort(colnames(x)))
  expect_s3_class(x, "data.frame")

  Sys.sleep(1)
})
