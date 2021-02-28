
x <- wbb_espn_conferences()

cols <- c("groupId", "shortName", "uid", "name", "logo", "parentGroupId")

test_that("WBB ESPN Conferences", {
  expect_equal(colnames(x), cols)
  expect_s3_class(x, "data.frame")
})