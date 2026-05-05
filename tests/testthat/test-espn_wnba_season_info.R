test_that("ESPN WNBA Season Info", {
  skip_on_cran()
  skip_on_ci()
  skip_espn_test()

  x <- espn_wnba_season_info(season = 2024)

  if (length(x) == 0) {
    skip("No data returned from espn_wnba_season_info at test time")
  }

  expect_true(is.list(x))

  # Info component
  if (!is.null(x[["Info"]]) && is.data.frame(x[["Info"]]) &&
      nrow(x[["Info"]]) > 0) {
    cols_info <- c("year", "display_name")
    expect_in(sort(cols_info), sort(colnames(x[["Info"]])))
    expect_s3_class(x[["Info"]], "data.frame")
  }

  # Types / Athletes / Coaches / Teams / Awards components
  ref_components <- c("Types", "Athletes", "Coaches", "Teams", "Awards")
  for (comp in ref_components) {
    if (!is.null(x[[comp]]) && is.data.frame(x[[comp]]) &&
        nrow(x[[comp]]) > 0) {
      expect_s3_class(x[[comp]], "data.frame")
    }
  }

  Sys.sleep(1)
})
