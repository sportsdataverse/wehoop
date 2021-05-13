
cols <- c("rank", "previous", "school", "conference",
          "record", "road", "neutral", "home", "non_div_i")

test_that("NCAA - WBB NET Rankings", {
  skip_on_cran()
  x <- ncaa_wbb_NET_rankings()
  
  expect_equal(colnames(x), cols)
  expect_s3_class(x, "data.frame")
})