test_that("ESPN - WNBA Award Detail", {
  skip_on_cran()
  skip_on_ci()
  skip_espn_test()

  x <- espn_wnba_award(award_id = 247)

  if (is.null(x) || !is.data.frame(x) || nrow(x) == 0) {
    skip("No rows returned from espn_wnba_award at test time")
  }

  required_cols <- c(
    "league",
    "award_id",
    "name"
  )
  expect_in(sort(required_cols), sort(colnames(x)))
  expect_s3_class(x, "data.frame")

  Sys.sleep(1)
})

