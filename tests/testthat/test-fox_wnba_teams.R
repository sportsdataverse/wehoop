test_that(".fox_bb_teams parses a standings payload into a team directory", {
  raw <- jsonlite::fromJSON(
    testthat::test_path("fixtures", "fox_wnba_standings.json"),
    simplifyDataFrame = FALSE, simplifyVector = FALSE, simplifyMatrix = FALSE
  )
  df <- wehoop:::.fox_bb_teams(raw)
  expect_s3_class(df, "data.frame")
  expect_true(all(c("fox_team_id", "fox_team_name", "fox_section") %in% names(df)))
  expect_gt(nrow(df), 0)
  expect_false(any(duplicated(df$fox_team_id)))
})

test_that("fox_wnba_teams() returns a live directory", {
  skip_on_cran()
  skip_fox_test()
  df <- fox_wnba_teams()
  expect_s3_class(df, "wehoop_data")
  expect_gte(nrow(df), 12)
})
