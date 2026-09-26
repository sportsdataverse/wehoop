chr_frame <- function(df) {
  out <- as.data.frame(lapply(df, as.character), stringsAsFactors = FALSE)
  out[is.na(out)] <- ""
  out
}

test_that("wnba_referee_assignments() internal parser matches the golden fixtures", {
  raw <- jsonlite::read_json(
    test_path("fixtures/official_nba/referee_assignments_2026-06-13.json")
  )
  result <- .parse_wnba_referee_assignments(raw, league = "wnba")

  expected_officials <- utils::read.csv(
    test_path("fixtures/official_nba/referee_assignments_2026-06-13_wnba_officials.csv"),
    colClasses = "character"
  )
  expect_equal(names(result$officials), names(expected_officials))
  expect_equal(nrow(result$officials), 12L)
  expect_equal(chr_frame(result$officials), chr_frame(expected_officials))

  expected_replay <- utils::read.csv(
    test_path("fixtures/official_nba/referee_assignments_2026-06-13_wnba_replay_center.csv"),
    colClasses = "character"
  )
  expect_equal(names(result$replay_center), names(expected_replay))
  expect_equal(chr_frame(result$replay_center), chr_frame(expected_replay))
})

test_that("wnba_referee_assignments() live smoke test", {
  # No dedicated gate exists yet for official.nba.com; reuses the WNBA Stats
  # gate since both are browser-UA-required NBA-family JSON APIs with the
  # same small-request cost profile (see helper-skip.R).
  skip_wnba_stats_test()
  skip_on_cran()
  skip_on_ci()

  result <- wnba_referee_assignments(Sys.Date() - 1)
  expect_type(result, "list")
  expect_named(result, c("officials", "replay_center"))
  expect_s3_class(result$officials, "wehoop_data")
  expect_s3_class(result$replay_center, "wehoop_data")
})
