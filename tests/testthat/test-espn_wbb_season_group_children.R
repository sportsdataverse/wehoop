test_that("ESPN - WBB Season Group Children", {
  skip_on_cran()
  skip_on_ci()
  skip_espn_test()

  x <- espn_wbb_season_group_children(group_id = 50, season = 2024, season_type = 2)

  if (is.null(x) || !is.data.frame(x) || nrow(x) == 0) {
    skip("No rows returned from espn_wbb_season_group_children at test time")
  }

  required_cols <- c(
    "child_group_id",
    "parent_group_id",
    "league",
    "season"
  )
  expect_in(sort(required_cols), sort(colnames(x)))
  expect_s3_class(x, "data.frame")

  Sys.sleep(1)
})

