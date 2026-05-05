
test_that("ESPN - WNBA Free Agents", {
  skip_on_cran()
  skip_on_ci()
  skip_espn_test()

  x <- espn_wnba_freeagents(season = 2025)

  # Skip-if-empty guard: free agent data is often absent outside the FA window
  if (is.null(x) || !is.data.frame(x) || nrow(x) == 0) {
    skip("No rows returned from ESPN WNBA freeagents endpoint at test time")
  }

  cols <- c(
    "season",
    "athlete_id",
    "athlete_name",
    "position",
    "prior_team_id",
    "status",
    "signed_team_id",
    "signed_date",
    "contract_value",
    "contract_term_years"
  )

  expect_in(sort(cols), sort(colnames(x)))
  expect_s3_class(x, "data.frame")

  Sys.sleep(3)
})
