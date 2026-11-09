# Offline tests for the dbConnection/tablename write path of every release loader.
# The release readers are mocked to return a one-row table, so nothing is downloaded.

fake_release <- function(url) {
  data.table::data.table(season = 2024L, game_id = 401L, team_id = 5L, athlete_id = 1L)
}

local_fake_releases <- function(env = parent.frame()) {
  local_mocked_bindings(
    rds_from_url = fake_release,
    parquet_from_url = fake_release,
    rds_or_parquet_from_url = fake_release,
    .release_asset_exists = function(url) TRUE,
    .release_csv_from_url = function(url, ...) fake_release(url),
    .env = env
  )
}

# Loaders with a required argument besides the db pair.
loader_args <- list(load_wnba_stats_leaguedash = list(table = "player_stats_base"))

call_loader <- function(f, ...) {
  args <- c(loader_args[[f]], list(...))
  suppressMessages(suppressWarnings(do.call(get(f, asNamespace("wehoop")), args)))
}

db_loaders <- function() {
  ns <- asNamespace("wehoop")
  nms <- sort(grep("^load_", getNamespaceExports("wehoop"), value = TRUE))
  nms[vapply(nms, function(f) "dbConnection" %in% names(formals(get(f, ns))), TRUE)]
}

test_that("every db-capable loader writes its table and returns NULL", {
  skip_on_cran()
  skip_if_not_installed("RSQLite")
  local_fake_releases()
  con <- DBI::dbConnect(RSQLite::SQLite(), ":memory:")
  on.exit(DBI::dbDisconnect(con), add = TRUE)

  for (f in db_loaders()) {
    tbl <- paste0("t_", f)
    out <- call_loader(f, dbConnection = con, tablename = tbl)
    expect_null(out, label = f)
    expect_true(DBI::dbExistsTable(con, tbl), label = f)
  }
})

test_that("every db-capable loader returns a wehoop_data frame without a db", {
  skip_on_cran()
  local_fake_releases()
  for (f in db_loaders()) {
    out <- call_loader(f)
    expect_s3_class(out, "data.frame")
  }
})

test_that("update_*_db builds, refreshes and writes selected datasets", {
  skip_on_cran()
  skip_if_not_installed("RSQLite")
  skip_if_not_installed("purrr")
  local_fake_releases()
  for (f in c("update_wbb_db", "update_wnba_db")) {
    upd <- get(f, asNamespace("wehoop"))
    dir <- withr::local_tempdir()
    con <- DBI::dbConnect(RSQLite::SQLite(), ":memory:")
    suppressMessages(suppressWarnings({
      upd(db_connection = con, tblname = "pbp")
      upd(db_connection = con, tblname = "pbp", force_rebuild = TRUE)
      upd(db_connection = con, tblname = "pbp", force_rebuild = 2024)
      upd(db_connection = con, tblname = "pbp", force_rebuild = 1900)
      expect_true(upd(db_connection = con, datasets = "pbp", seasons = 2024))
      upd(dbdir = dir, dbname = "x.sqlite", tblname = "pbp")
    }))
    expect_true(DBI::dbExistsTable(con, "pbp"), label = f)
    expect_error(upd(db_connection = con, force_rebuild = "NEW"), "internal usage")
    expect_error(upd(db_connection = con, force_rebuild = "x"), "logical or numeric")
    expect_error(upd(db_connection = con, datasets = "nope"), "Unknown")
    DBI::dbDisconnect(con)
  }
})

test_that("update_wnba_stats_db writes the selected datasets", {
  skip_on_cran()
  skip_if_not_installed("RSQLite")
  local_fake_releases()
  con <- DBI::dbConnect(RSQLite::SQLite(), ":memory:")
  on.exit(DBI::dbDisconnect(con), add = TRUE)
  expect_true(suppressMessages(update_wnba_stats_db(
    db_connection = con, datasets = c("schedule", "pbp"), seasons = 2024
  )))
  expect_true(DBI::dbExistsTable(con, "wnba_stats_pbp"))
  dir <- withr::local_tempdir()
  expect_true(suppressMessages(update_wnba_stats_db(
    dbdir = file.path(dir, "new"), dbname = "x.sqlite", datasets = "draft", seasons = 2024
  )))
  expect_error(update_wnba_stats_db(db_connection = con), "is required")
  expect_error(update_wnba_stats_db(db_connection = con, datasets = "nope"), "Unknown")
})
