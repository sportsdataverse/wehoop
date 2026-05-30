test_that("ESPN - WBB Athlete Info", {
  skip_on_cran()
  skip_on_ci()
  skip_espn_test()

  x <- espn_wbb_athlete_info(athlete_id = "4433985")

  if (length(x) == 0) {
    skip("No data returned from endpoint at test time")
  }

  expect_type(x, "list")

  # Bio slot
  if (!is.null(x[["Bio"]]) && is.data.frame(x[["Bio"]]) && nrow(x[["Bio"]]) > 0) {
    bio_cols <- c("id", "full_name")
    expect_in(sort(bio_cols), sort(colnames(x[["Bio"]])))
    expect_s3_class(x[["Bio"]], "data.frame")
  }

  # Team slot
  if (!is.null(x[["Team"]]) && is.data.frame(x[["Team"]])) {
    expect_s3_class(x[["Team"]], "data.frame")
  }

  # Position slot
  if (!is.null(x[["Position"]]) && is.data.frame(x[["Position"]])) {
    expect_s3_class(x[["Position"]], "data.frame")
  }

  # Status slot
  if (!is.null(x[["Status"]]) && is.data.frame(x[["Status"]])) {
    expect_s3_class(x[["Status"]], "data.frame")
  }

  # College slot
  if (!is.null(x[["College"]]) && is.data.frame(x[["College"]])) {
    expect_s3_class(x[["College"]], "data.frame")
  }

  # Draft slot
  if (!is.null(x[["Draft"]]) && is.data.frame(x[["Draft"]])) {
    expect_s3_class(x[["Draft"]], "data.frame")
  }

  Sys.sleep(1)
})
