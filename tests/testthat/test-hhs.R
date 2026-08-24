# Her Hoop Stats is a subscription service -- these only run when the caller has
# set HERHOOPSTATS_EMAIL / HERHOOPSTATS_PW (or the matching options).

test_that("Her Hoop Stats - Teams", {
  skip_on_cran()
  skip_on_ci()
  if (!has_hhs_login()) skip("No Her Hoop Stats credentials (HERHOOPSTATS_EMAIL/PW)")

  x <- hhs_teams(min_season = 2024, max_season = 2024, division = 1)
  if (!is.data.frame(x) || nrow(x) == 0) skip("No Her Hoop Stats data returned at test time")

  expect_s3_class(x, "data.frame")
  expect_true(all(c("min_season", "max_season", "division") %in% colnames(x)))
  expect_gt(ncol(x), 3)

  Sys.sleep(2)
})

test_that("Her Hoop Stats - credential gate", {
  skip_on_cran()
  # With no credentials, the wrappers must fail gracefully (empty data.frame),
  # never error out of the tryCatch.
  old_e <- Sys.getenv("HERHOOPSTATS_EMAIL")
  old_p <- Sys.getenv("HERHOOPSTATS_PW")
  old_oe <- getOption("wehoop.herhoopstats_email")
  old_op <- getOption("wehoop.herhoopstats_password")
  on.exit({
    Sys.setenv(HERHOOPSTATS_EMAIL = old_e, HERHOOPSTATS_PW = old_p)
    options(wehoop.herhoopstats_email = old_oe, wehoop.herhoopstats_password = old_op)
  }, add = TRUE)

  Sys.setenv(HERHOOPSTATS_EMAIL = "", HERHOOPSTATS_PW = "")
  options(wehoop.herhoopstats_email = NULL, wehoop.herhoopstats_password = NULL)

  expect_false(has_hhs_login())
  x <- suppressMessages(hhs_teams())
  expect_s3_class(x, "data.frame")
  expect_equal(nrow(x), 0)
})
