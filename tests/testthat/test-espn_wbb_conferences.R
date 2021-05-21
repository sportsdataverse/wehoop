
cols <- c("group_id", "short_name", "uid", "name", "logo", "parent_group_id")

test_that("ESPN - WBB Conferences", {
  skip_on_cran()
  x <- espn_wbb_conferences()
  expect_equal(colnames(x), cols)
  expect_s3_class(x, "data.frame")
})
