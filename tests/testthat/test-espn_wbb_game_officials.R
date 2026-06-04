test_that("ESPN - WBB Event Officials", {
  skip_on_cran()
  skip_on_ci()
  skip_espn_test()

  x <- espn_wbb_game_officials(event_id = "401736171")

  if (is.null(x) || !is.data.frame(x) || nrow(x) == 0) {
    skip("No rows returned from espn_wbb_game_officials at test time")
  }

  required_cols <- c(
    "event_id",
    "official_id",
    "full_name",
    "display_name",
    "position_name",
    "order"
  )
  expect_in(sort(required_cols), sort(colnames(x)))
  expect_s3_class(x, "data.frame")

  Sys.sleep(1)
})
