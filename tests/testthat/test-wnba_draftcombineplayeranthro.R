# test_that("WNBA Draft Combine Anthro", {
#   skip_on_cran()
#   skip_on_ci()
#   x <- wnba_draftcombineplayeranthro(season_year = most_recent_wnba_season() - 1)
#   
#   cols_x1 <- c(
#     
#   )
#   
#   expect_equal(sort(colnames(x[[1]])), sort(cols_x1))
#   expect_s3_class(x[[1]], "data.frame")
#   
#   Sys.sleep(3)
# })
 