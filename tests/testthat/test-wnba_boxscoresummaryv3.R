test_that("WNBA Boxscore Summary V3", {
  skip_on_cran()
  skip_on_ci()

  x <- wnba_boxscoresummaryv3(game_id = "1022200034")

  if (length(x) == 0 || is.null(x$game_summary) || nrow(x$game_summary) == 0) {
    skip("No rows returned from wnba_boxscoresummaryv3() at test time")
  }

  expect_true("game_summary" %in% names(x))
  expect_s3_class(x$game_summary, "data.frame")
  expect_true(nrow(x$game_summary) > 0)

  core_game_summary_cols <- c(
    "game_id",
    "game_status_id",
    "game_status_text",
    "home_team_id",
    "visitor_team_id",
    "season"
  )
  expect_true(all(core_game_summary_cols %in% colnames(x$game_summary)))

  if ("line_score" %in% names(x) && nrow(x$line_score) > 0) {
    core_line_score_cols <- c(
      "game_id",
      "team_id"
    )
    expect_true(all(core_line_score_cols %in% colnames(x$line_score)))
    expect_s3_class(x$line_score, "data.frame")
  }

  if ("officials" %in% names(x) && nrow(x$officials) > 0) {
    expect_s3_class(x$officials, "data.frame")
  }

  Sys.sleep(3)

})
