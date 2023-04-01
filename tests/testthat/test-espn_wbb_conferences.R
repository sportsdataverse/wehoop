
test_that("ESPN - WBB Conferences", {
  skip_on_cran()
  x <- espn_wbb_conferences()
  
  cols <- c(
    "group_id",
    "conference_short_name",
    "conference_uid",
    "conference_name",
    "conference_logo",
    "parent_group_id",
    "conference_id"
  )
  
  expect_equal(colnames(x), cols)
  expect_s3_class(x, "data.frame")
})
