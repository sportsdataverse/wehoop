test_that("New WNBA league wrappers are available", {
  expect_true(is.function(wnba_leaguedashptdefend))
  expect_true(is.function(wnba_leaguedashptstats))
  expect_true(is.function(wnba_leaguedashptteamdefend))
  expect_true(is.function(wnba_leaguestandings))
})

test_that("New WNBA player dashboard tracking wrappers are available", {
  expect_true(is.function(wnba_playerdashptpass))
  expect_true(is.function(wnba_playerdashptreb))
  expect_true(is.function(wnba_playerdashptshotdefend))
  expect_true(is.function(wnba_playerdashptshots))
})

test_that("New WNBA team dashboard tracking wrappers are available", {
  expect_true(is.function(wnba_teamdashptpass))
  expect_true(is.function(wnba_teamdashptreb))
  expect_true(is.function(wnba_teamdashptshots))
  expect_true(is.function(wnba_teamandplayersvsplayers))
})
