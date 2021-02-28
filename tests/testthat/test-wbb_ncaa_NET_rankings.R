
x <- wbb_ncaa_NET_rankings()

cols <- c("Rank", "Previous", "School", "Conference", "Record", "Road", 
          "Neutral", "Home", "Non Div I")

test_that("WBB NCAA NET Rankings", {
  expect_equal(colnames(x), cols)
  expect_s3_class(x, "data.frame")
})