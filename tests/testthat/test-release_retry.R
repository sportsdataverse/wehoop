# A slow release download used to hit R's default 60 s timeout, and the
# loader returned the other seasons with only a vague warning.

# A reader that fails `fails` times, then returns `value`; records each call.
flaky <- function(fails, value = data.frame(x = 1)) {
  calls <- 0L
  timeouts <- numeric()
  f <- function(url) {
    calls <<- calls + 1L
    timeouts <<- c(timeouts, getOption("timeout"))
    if (calls <= fails) stop("Timeout of 60 seconds was reached")
    value
  }
  list(read = f, calls = function() calls, timeouts = function() timeouts)
}

test_that("a transient failure is retried with a raised timeout, then restored", {
  withr::local_options(timeout = 60)
  r <- flaky(2)
  expect_no_warning(out <- .read_release_asset("https://x/a_2024.rds", r$read))
  expect_equal(out, data.frame(x = 1))
  expect_equal(r$calls(), 3L)
  expect_equal(r$timeouts(), rep(150, 3))
  expect_equal(getOption("timeout"), 60)
})

test_that("a larger user timeout is kept", {
  withr::local_options(timeout = 3600)
  r <- flaky(0)
  .read_release_asset("https://x/a_2024.rds", r$read)
  expect_equal(r$timeouts(), 3600)
  expect_equal(getOption("timeout"), 3600)
})

test_that("a persistent failure warns with the url and returns a try-error", {
  withr::local_options(timeout = 60)
  r <- flaky(Inf)
  expect_warning(
    out <- .read_release_asset("https://x/a_2024.rds", r$read),
    "a_2024.rds.*incomplete"
  )
  expect_s3_class(out, "try-error")
  expect_equal(r$calls(), 3L)
  expect_equal(getOption("timeout"), 60)
})

test_that("a 404 is not retried", {
  calls <- 0L
  read <- function(url) {
    calls <<- calls + 1L
    warning("cannot open URL 'u': HTTP status was '404 Not Found'")
    stop("cannot open the connection")
  }
  expect_warning(.read_release_asset("https://x/a_1800.rds", read), "a_1800.rds")
  expect_equal(calls, 1L)
})

test_that("a loader keeps the seasons that load and names the one that failed", {
  withr::local_options(timeout = 60)
  calls <- 0L
  local_mocked_bindings(.read_rds_url = function(url) {
    calls <<- calls + 1L
    if (endsWith(url, "_2024.rds")) stop("Timeout of 60 seconds was reached")
    data.frame(season = 2023L, team_id = 1L)
  })
  expect_warning(
    out <- load_wnba_team_box(2023:2024),
    "team_box_2024.rds", fixed = TRUE
  )
  expect_equal(nrow(out), 1L)
  expect_equal(out$season, 2023L)
  expect_equal(calls, 4L)
  expect_s3_class(out, "wehoop_data")
  expect_false("data.table" %in% class(out))
  expect_equal(getOption("timeout"), 60)
})

test_that("parquet_from_url retries a download that does not parse", {
  skip_if_not_installed("arrow")
  src <- withr::local_tempfile(fileext = ".parquet")
  arrow::write_parquet(data.frame(x = 1:2), src)
  calls <- 0L
  local_mocked_bindings(.download_url = function(url, dest) {
    calls <<- calls + 1L
    if (calls == 1L) return(writeBin(charToRaw("truncated"), dest))
    file.copy(src, dest, overwrite = TRUE)
  })
  expect_no_warning(out <- parquet_from_url("https://x/a.parquet"))
  expect_equal(out$x, 1:2)
  expect_equal(calls, 2L)
})

test_that("rds_or_parquet_from_url warns once, with every failure reason", {
  local_mocked_bindings(
    .read_rds_url = function(url) stop("Timeout of 150 seconds was reached"),
    .download_url = function(url, dest) stop("HTTP status was '404 Not Found'")
  )
  msgs <- character()
  out <- withCallingHandlers(
    rds_or_parquet_from_url("https://x/wbb_2024.rds"),
    warning = function(w) {
      msgs <<- c(msgs, conditionMessage(w))
      invokeRestart("muffleWarning")
    }
  )
  expect_equal(nrow(out), 0L)
  expect_length(msgs, 1L)
  expect_match(msgs, "wbb_2024.rds", fixed = TRUE)
  expect_match(msgs, "Timeout of 150 seconds", fixed = TRUE)
  if (is_installed("arrow")) expect_match(msgs, "404 Not Found", fixed = TRUE)
})

test_that("the low-level readers read a local file and reject an empty one", {
  withr::local_options(download.file.method = "auto")
  file_url <- function(path) {
    path <- normalizePath(path, winslash = "/")
    paste0("file://", if (!startsWith(path, "/")) "/", path)
  }
  src <- withr::local_tempfile(fileext = ".rds")
  saveRDS(data.frame(x = 1:2), src, compress = FALSE)
  expect_equal(.read_rds_url(file_url(src)), data.frame(x = 1:2))
  expect_equal(rds_from_url(file_url(src))$x, 1:2)

  dest <- withr::local_tempfile()
  .download_url(file_url(src), dest)
  expect_equal(readRDS(dest), data.frame(x = 1:2))

  empty <- withr::local_tempfile()
  file.create(empty)
  expect_error(.download_url(file_url(empty), withr::local_tempfile()), "empty")
})

test_that("warnings from a read that succeeds are passed on", {
  read <- function(url) {
    warning("a note from the reader")
    1
  }
  expect_warning(out <- .read_release_asset("https://x/a_2024.rds", read), "a note from the reader")
  expect_equal(out, 1)
})

test_that("parquet_from_url returns an empty table when the download keeps failing", {
  skip_if_not_installed("arrow")
  local_mocked_bindings(.download_url = function(url, dest) stop("Timeout of 150 seconds was reached"))
  expect_warning(out <- parquet_from_url("https://x/b_2024.parquet"), "b_2024.parquet", fixed = TRUE)
  expect_equal(nrow(out), 0L)
})

# A fake download that records each url and writes `lines` to the temp file.
fake_download <- function(lines = c("season,game_id", "2024,1")) {
  urls <- character()
  f <- function(url, dest) {
    urls <<- c(urls, url)
    writeLines(lines, dest)
    invisible(dest)
  }
  list(download = f, urls = function() urls)
}

test_that("a release csv read is retried and passes its arguments on", {
  withr::local_options(timeout = 60)
  calls <- 0L
  dl <- fake_download()
  local_mocked_bindings(
    .download_url = dl$download,
    csv_from_url = function(file, ...) {
      calls <<- calls + 1L
      expect_equal(getOption("timeout"), 150)
      expect_true(file.exists(file))
      if (calls == 1L) stop("Timeout of 60 seconds was reached")
      data.table::data.table(file = file, ...)
    }
  )
  expect_no_warning(out <- load_wnba_stats_rosters_manifest())
  expect_equal(calls, 2L)
  expect_match(dl$urls(), "wnba_stats_rosters_in_data_repo.csv", fixed = TRUE)
  # fread() reads the downloaded copy, not the url, and the copy is removed
  expect_false(grepl("^https?://", out$file))
  expect_false(file.exists(out$file))
  expect_equal(.release_csv_from_url("https://x/a.csv", sep = ",")$sep, ",")
  expect_equal(getOption("timeout"), 60)
})

test_that("a release csv that keeps failing warns with the url, then raises", {
  calls <- 0L
  local_mocked_bindings(
    .download_url = fake_download()$download,
    csv_from_url = function(file, ...) {
      calls <<- calls + 1L
      stop("Timeout of 150 seconds was reached")
    }
  )
  expect_error(
    expect_warning(load_wbb_games(), "wbb_games_in_data_repo.csv", fixed = TRUE),
    "Timeout of 150 seconds"
  )
  expect_equal(calls, 3L)
})

test_that("a failed release csv download is retried, then raises", {
  calls <- 0L
  local_mocked_bindings(.download_url = function(url, dest) {
    calls <<- calls + 1L
    stop("cannot open URL: HTTP status was '503 Service Unavailable'")
  })
  expect_error(
    expect_warning(.release_csv_from_url("https://x/a.csv"), "a.csv", fixed = TRUE),
    "503"
  )
  expect_equal(calls, 3L)
})

test_that("the WNBA games index is read through the retrying release reader", {
  calls <- 0L
  dl <- fake_download()
  local_mocked_bindings(
    .download_url = dl$download,
    csv_from_url = function(file, ...) {
      calls <<- calls + 1L
      if (calls == 1L) stop("Timeout of 60 seconds was reached")
      data.table::fread(file = file)
    }
  )
  expect_no_warning(out <- load_wnba_games())
  expect_equal(calls, 2L)
  expect_match(dl$urls()[1], "espn_wnba_schedules/wnba_games_in_data_repo.csv", fixed = TRUE)
  expect_equal(out$game_id, 1L)
})

test_that("a release csv is read from a local file", {
  withr::local_options(download.file.method = "auto")
  src <- withr::local_tempfile(fileext = ".csv")
  data.table::fwrite(data.frame(season = 2024L, game_id = 1:2), src)
  path <- normalizePath(src, winslash = "/")
  out <- .release_csv_from_url(paste0("file://", if (!startsWith(path, "/")) "/", path))
  expect_equal(out$game_id, 1:2)
})

# fread() can stop early on a malformed row: it warns and returns the rows
# before it. That partial table must not pass as the whole games index.
partial_fread <- function(file, ...) {
  warning("Stopped early on line 3. Expected 2 fields but found 3.")
  data.table::data.table(season = 2024L, game_id = 1L)
}

test_that("strict = TRUE turns a fread() warning into an error", {
  local_mocked_bindings(.download_url = fake_download()$download, csv_from_url = partial_fread)
  # not strict: the warning is passed on with the partial table, as before
  expect_warning(out <- .release_csv_from_url("https://x/g.csv"), "Stopped early")
  expect_equal(nrow(out), 1L)
  expect_error(
    suppressWarnings(.release_csv_from_url("https://x/g.csv", strict = TRUE)),
    "Stopped early"
  )
  # the partial read is not retried (the file is the same on every try), and
  # fread() finished its own cleanup, so the next read is clean
  reads <- 0L
  local_mocked_bindings(csv_from_url = function(file, ...) {
    reads <<- reads + 1L
    partial_fread(file, ...)
  })
  expect_error(
    suppressWarnings(.release_csv_from_url("https://x/g.csv", strict = TRUE)),
    class = "release_csv_partial"
  )
  expect_equal(reads, 1L)
  expect_no_warning(data.table::fread(text = "a,b\n1,2"))
  expect_error(
    suppressWarnings(load_wbb_games(strict = TRUE)),
    "wbb_games_in_data_repo.csv", class = "wehoop_games_index_failed"
  )
  # the abort replaces the "result is incomplete" warning
  expect_no_warning(try(load_wbb_games(strict = TRUE), silent = TRUE), class = "wehoop_read_failed")
})

for (sport in c("wbb", "wnba")) {
  test_that(paste0("build_", sport, "_db(rebuild = TRUE) keeps the table when the index read fails"), {
    skip_if_not_installed("DBI")
    skip_if_not_installed("RSQLite")
    con <- DBI::dbConnect(RSQLite::SQLite(), withr::local_tempfile(fileext = ".sqlite"))
    on.exit(DBI::dbDisconnect(con), add = TRUE)
    tbl <- paste0("wehoop_", sport, "_pbp")
    old <- data.frame(season = c(2023L, 2024L), game_id = c(1L, 2L))
    DBI::dbWriteTable(con, tbl, old)
    pbp_loads <- 0L
    local_mocked_bindings(
      .download_url = fake_download()$download,
      csv_from_url = partial_fread,
      load_wbb_pbp = function(...) pbp_loads <<- pbp_loads + 1L,
      load_wnba_pbp = function(...) pbp_loads <<- pbp_loads + 1L
    )
    build <- get(paste0("build_", sport, "_db"))
    expect_error(
      suppressWarnings(build(tbl, con, rebuild = TRUE)),
      paste0(sport, "_games_in_data_repo.csv"), class = "wehoop_games_index_failed"
    )
    expect_true(DBI::dbExistsTable(con, tbl))
    expect_equal(DBI::dbReadTable(con, tbl), old)
    expect_equal(pbp_loads, 0L)
  })
}

test_that("a header-only games index aborts before build_wbb_db() purges the table", {
  skip_if_not_installed("DBI")
  skip_if_not_installed("RSQLite")
  con <- DBI::dbConnect(RSQLite::SQLite(), withr::local_tempfile(fileext = ".sqlite"))
  on.exit(DBI::dbDisconnect(con), add = TRUE)
  old <- data.frame(season = 2024L, game_id = 1L)
  DBI::dbWriteTable(con, "wehoop_wbb_pbp", old)
  local_mocked_bindings(
    .download_url = fake_download()$download,
    # what fread() gives for a file holding only the "season,game_id" header
    csv_from_url = function(file, ...) data.table::data.table(season = integer(), game_id = integer()),
    load_wbb_pbp = function(...) stop("must not load")
  )
  expect_error(
    build_wbb_db("wehoop_wbb_pbp", con, rebuild = TRUE),
    "no rows", class = "wehoop_games_index_failed"
  )
  expect_equal(DBI::dbReadTable(con, "wehoop_wbb_pbp"), old)
})
