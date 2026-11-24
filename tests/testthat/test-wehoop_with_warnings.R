test_that(".wehoop_with_warnings() names the wrapper and keeps the result", {
  f <- function() {
    df <- data.frame()
    tryCatch(
      expr = .wehoop_with_warnings("my_wrapper", {
        x <- as.integer("not a number") # warns: NAs introduced by coercion
        df <- data.frame(x = x, y = 1L)
      }),
      error = function(e) NULL
    )
    df
  }
  expect_warning(out <- f(), class = "wehoop_warning", regexp = "my_wrapper\\(\\): .*coercion")
  expect_equal(nrow(out), 1L)
  expect_identical(out$y, 1L)
})

test_that("nested .wehoop_with_warnings() raises one warning, named by the inner wrapper", {
  w <- testthat::capture_warnings(
    .wehoop_with_warnings("outer", .wehoop_with_warnings("inner", warning("boom")))
  )
  expect_length(w, 1L)
  expect_match(w, "inner\\(\\): boom")
})

test_that(".wehoop_with_warnings() keeps return(), error handling and the original class", {
  early <- function() {
    tryCatch(expr = .wehoop_with_warnings("early", {
      return("returned")
      "not reached"
    }), error = function(e) "error")
  }
  expect_identical(early(), "returned")

  expect_warning(caught <- tryCatch(
    expr = .wehoop_with_warnings("caught", {
      warning("first")
      stop("then failed")
    }),
    error = function(e) conditionMessage(e)
  ), class = "wehoop_warning")
  expect_identical(caught, "then failed")

  custom <- function() warning(warningCondition("deprecated thing", class = "my_deprecation"))
  expect_no_warning(suppressWarnings(.wehoop_with_warnings("cls", custom()), classes = "my_deprecation"))
})

test_that("an ESPN wrapper returns its rows when parsing warns", {
  # Before 3.1.0 a tryCatch(warning =) handler stopped the parse at the first
  # warning, reported it, and returned the empty frame. clean_names() warns
  # here, ahead of the assignment, so the old behaviour returns 0 rows.
  body <- paste0(
    '{"conferences":[{"uid":"s:40~l:54~g:1","groupId":"1",',
    '"name":"America East Conference","shortName":"America East",',
    '"logo":"x.png","parentGroupId":"50"}]}'
  )
  httr2::local_mocked_responses(function(req) {
    httr2::response(
      status_code = 200L, url = req$url,
      headers = list(`Content-Type` = "application/json"),
      body = charToRaw(body)
    )
  })
  real_clean_names <- janitor::clean_names
  local_mocked_bindings(
    clean_names = function(dat, ...) {
      warning("synthetic parse warning")
      real_clean_names(dat, ...)
    },
    .package = "janitor"
  )
  expect_warning(out <- espn_wbb_conferences(), class = "wehoop_warning",
                 regexp = "espn_wbb_conferences\\(\\): synthetic parse warning")
  expect_equal(nrow(out), 1L)
  expect_identical(out$conference_short_name, "America East")
})
