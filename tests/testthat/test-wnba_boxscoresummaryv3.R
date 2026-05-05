test_that("WNBA Boxscore Summary V3", {
  skip_on_cran()
  skip_on_ci()
  skip_wnba_stats_test()

  # `wnba_boxscoresummaryv3()` is soft-deprecated as of 3.0.0 — it emits
  # `lifecycle::deprecate_warn()` recommending the V2 variant. Suppress
  # the expected warning here so the test output stays clean; the
  # downstream "no rows returned" check still fails loudly if the V3
  # endpoint is genuinely broken.
  x <- suppressWarnings(wnba_boxscoresummaryv3(game_id = "1012600004"))

  if (length(x) == 0 || is.null(x$game_summary) || nrow(x$game_summary) == 0) {
    fail("No rows returned from wnba_boxscoresummaryv3() at test time")
    return(invisible(NULL))
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
