test_that("ESPN - WBB Franchise Detail", {
  skip_on_cran()
  skip_on_ci()
  skip_espn_test()

  x <- espn_wbb_franchise(franchise_id = "2509")

  if (is.null(x) || !is.data.frame(x) || nrow(x) == 0) {
    skip("No rows returned from espn_wbb_franchise at test time")
  }

  required_cols <- c(
    "id",
    "name",
    "league"
  )
  expect_in(sort(required_cols), sort(colnames(x)))
  expect_s3_class(x, "data.frame")

  Sys.sleep(1)
})

