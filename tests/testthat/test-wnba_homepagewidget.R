test_that("WNBA Home Page Widget", {
  skip_on_cran()
  skip_on_ci()
  skip_wnba_stats_test()

  x <- wnba_homepagewidget(player_or_team = "Player")

  if (length(x) == 0 || is.null(x[[1]]) || !is.data.frame(x[[1]]) || nrow(x[[1]]) == 0) {
    fail("No rows returned from endpoint at test time")
    return(invisible(NULL))
  }

  # The widget's category list drifts upstream (sections are added/removed
  # between seasons), so assert by table NAME, never by position -- a
  # positional column contract broke the day the feed went from 19 to 18
  # season-leader sections.
  expect_true(length(x) >= 8)
  expect_true(all(vapply(x, is.data.frame, logical(1))))
  expect_true(all(nzchar(names(x))))

  # Core per-season leader tables that have shipped in every capture.
  for (tab in intersect(c("PTS", "REB", "AST", "BLK", "STL"), names(x))) {
    expect_s3_class(x[[tab]], "data.frame")
    expect_gt(nrow(x[[tab]]), 0)
    expect_true(all(c("PLAYER_ID", "PLAYER_NAME") %in% colnames(x[[tab]])),
                info = paste0("table ", tab, " missing player id/name columns"))
  }
  expect_true(any(c("PTS", "REB", "AST") %in% names(x)))
})

test_that("WNBA Home Page Widget (Team)", {
  skip_on_cran()
  skip_on_ci()
  skip_wnba_stats_test()

  x <- wnba_homepagewidget(player_or_team = "Team")

  if (length(x) == 0 || is.null(x[[1]]) || !is.data.frame(x[[1]]) || nrow(x[[1]]) == 0) {
    fail("No rows returned from endpoint at test time")
    return(invisible(NULL))
  }

  expect_true(all(vapply(x, is.data.frame, logical(1))))
  for (tab in intersect(c("PTS", "REB", "AST"), names(x))) {
    expect_gt(nrow(x[[tab]]), 0)
    expect_true("TEAM_ID" %in% colnames(x[[tab]]),
                info = paste0("table ", tab, " missing TEAM_ID"))
  }
})
