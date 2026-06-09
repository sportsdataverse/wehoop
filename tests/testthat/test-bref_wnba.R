test_that("Basketball-Reference WNBA - Player Stats", {
  skip_on_cran()
  skip_on_ci()

  x <- bref_wnba_player_stats(season = 2024, table = "per_game")
  if (!is.data.frame(x) || nrow(x) == 0) skip("No WNBA player stats returned at test time")

  cols <- c("player", "g", "season", "table")
  expect_in(sort(cols), sort(colnames(x)))
  expect_s3_class(x, "data.frame")
  expect_equal(unique(x$season), 2024L)

  Sys.sleep(4)
})

test_that("Basketball-Reference WNBA - Team Stats", {
  skip_on_cran()
  skip_on_ci()

  x <- bref_wnba_team_stats(season = 2024, table = "per_game")
  if (!is.data.frame(x) || nrow(x) == 0) skip("No WNBA team stats returned at test time")

  cols <- c("team", "g", "season", "table")
  expect_in(sort(cols), sort(colnames(x)))
  expect_s3_class(x, "data.frame")

  Sys.sleep(4)
})

test_that("Basketball-Reference WNBA - Standings", {
  skip_on_cran()
  skip_on_ci()

  x <- bref_wnba_standings(season = 2024)
  if (!is.data.frame(x) || nrow(x) == 0) skip("No WNBA standings returned at test time")

  cols <- c("team", "wins", "losses", "conference", "season")
  expect_in(sort(cols), sort(colnames(x)))
  expect_setequal(unique(x$conference), c("Eastern", "Western"))

  Sys.sleep(4)
})
