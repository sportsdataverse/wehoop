
test_that("ESPN - WBB Team Detail", {
  skip_on_cran()
  skip_on_ci()
  skip_espn_test()

  x <- espn_wbb_team(team_id = 2509, season = 2025)

  if (length(x) == 0 || is.null(x[["Info"]]) || !is.data.frame(x[["Info"]]) ||
      nrow(x[["Info"]]) == 0) {
    skip("No rows returned from espn_wbb_team at test time")
  }

  info_cols <- c("id", "abbreviation", "display_name")
  expect_in(sort(info_cols), sort(colnames(x[["Info"]])))
  expect_s3_class(x[["Info"]], "data.frame")

  expect_true(is.list(x))
  expect_true("Info" %in% names(x))
  expect_true("Record" %in% names(x))
  expect_true("NextEvent" %in% names(x))
  expect_true("StandingSummary" %in% names(x))
  expect_true("Coaches" %in% names(x))

  Sys.sleep(1)
})
