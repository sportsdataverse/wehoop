test_that("bart_wbb_ratings() returns a women's T-Rank table", {
  skip_on_cran()
  if (Sys.getenv("TORVIK_TESTS") != "1") skip("TORVIK_TESTS not set")
  df <- bart_wbb_ratings(2024)
  expect_s3_class(df, "wehoop_data")
  expect_true(all(c("team", "conf", "barthag", "year") %in% names(df)))
  expect_gt(nrow(df), 300)
})

test_that("bart_wbb_game_schedule() returns a women's season schedule", {
  skip_on_cran()
  if (Sys.getenv("TORVIK_TESTS") != "1") skip("TORVIK_TESTS not set")
  df <- bart_wbb_game_schedule(2024)
  expect_s3_class(df, "wehoop_data")
  expect_true(all(c("team1", "team2", "year") %in% names(df)))
  expect_gt(nrow(df), 1000)
})
