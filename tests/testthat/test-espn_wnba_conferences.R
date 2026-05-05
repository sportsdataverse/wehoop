
test_that("ESPN - WNBA Conferences", {
  skip_on_cran()
  skip_espn_test()

  x <- espn_wnba_conferences()

  # Skip-if-empty guard
  if (is.null(x) || !is.data.frame(x) || nrow(x) == 0) {
    skip("No rows returned from ESPN WNBA conferences endpoint at test time")
  }

  cols <- c(
    "group_id",
    "conference_short_name",
    "conference_uid",
    "conference_name",
    "conference_logo",
    "parent_group_id",
    "conference_id"
  )

  expect_in(sort(cols), sort(colnames(x)))
  expect_s3_class(x, "data.frame")
})
