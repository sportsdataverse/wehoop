test_that("WNBA Draft Board", {
  skip_on_cran()
  skip_on_ci()
  skip_wnba_stats_test()

  x <- wnba_draftboard(season = most_recent_wnba_season())

  if (length(x) == 0 || is.null(x$picks) || !is.data.frame(x$picks) ||
      nrow(x$picks) == 0) {
    fail("No rows returned from wnba_draftboard() at test time")
    return(invisible(NULL))
  }

  cols_board <- c(
    "draft_id",
    "title",
    "season",
    "status",
    "on_the_clock",
    "draft_date",
    "modified"
  )

  cols_picks <- c(
    "round",
    "pick",
    "team_id",
    "team_external_id",
    "team_name",
    "prospect_id",
    "first_name",
    "last_name",
    "position",
    "country",
    "college",
    "ppg",
    "rpg",
    "apg",
    "spg",
    "bpg",
    "fg_pct",
    "description",
    "headshot_url"
  )

  expect_in(sort(cols_board), sort(colnames(x$board)))
  expect_s3_class(x$board, "data.frame")
  expect_in(sort(cols_picks), sort(colnames(x$picks)))
  expect_s3_class(x$picks, "data.frame")

  Sys.sleep(3)
})
