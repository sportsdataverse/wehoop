# Regression tests for #79: load_wbb_player_core(), load_wnba_team_box(), and
# load_wnba_player_core() documented a dbConnection/tablename write via
# DBI::dbWriteTable() but never actually issued the call. These confirm the
# write now happens against an in-memory RSQLite database.

test_that("load_wbb_player_core writes into the db when dbConnection/tablename are supplied", {
  skip_on_cran()
  skip_on_ci()
  skip_load_test()
  skip_if_not_installed("RSQLite")

  con <- DBI::dbConnect(RSQLite::SQLite(), ":memory:")
  on.exit(DBI::dbDisconnect(con), add = TRUE)

  out <- load_wbb_player_core(seasons = most_recent_wbb_season(),
                               dbConnection = con, tablename = "wbb_player_core")

  expect_null(out)
  expect_true(DBI::dbExistsTable(con, "wbb_player_core"))
  tbl <- DBI::dbReadTable(con, "wbb_player_core")
  expect_gt(nrow(tbl), 0)
  expect_true(all(c("athlete_id", "display_name") %in% colnames(tbl)))
})

test_that("load_wnba_team_box writes into the db when dbConnection/tablename are supplied", {
  skip_on_cran()
  skip_on_ci()
  skip_load_test()
  skip_if_not_installed("RSQLite")

  con <- DBI::dbConnect(RSQLite::SQLite(), ":memory:")
  on.exit(DBI::dbDisconnect(con), add = TRUE)

  out <- load_wnba_team_box(seasons = most_recent_wnba_season(),
                             dbConnection = con, tablename = "wnba_team_box")

  expect_null(out)
  expect_true(DBI::dbExistsTable(con, "wnba_team_box"))
  tbl <- DBI::dbReadTable(con, "wnba_team_box")
  expect_gt(nrow(tbl), 0)
  expect_true(all(c("game_id", "team_id", "season") %in% colnames(tbl)))
})

test_that("load_wnba_player_core writes into the db when dbConnection/tablename are supplied", {
  skip_on_cran()
  skip_on_ci()
  skip_load_test()
  skip_if_not_installed("RSQLite")

  con <- DBI::dbConnect(RSQLite::SQLite(), ":memory:")
  on.exit(DBI::dbDisconnect(con), add = TRUE)

  out <- load_wnba_player_core(seasons = most_recent_wnba_season(),
                                dbConnection = con, tablename = "wnba_player_core")

  expect_null(out)
  expect_true(DBI::dbExistsTable(con, "wnba_player_core"))
  tbl <- DBI::dbReadTable(con, "wnba_player_core")
  expect_gt(nrow(tbl), 0)
  expect_true(all(c("athlete_id", "display_name") %in% colnames(tbl)))
})
