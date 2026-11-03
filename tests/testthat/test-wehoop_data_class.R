# A "data.table" class after "tbl_df" sends tail() to data.table's method,
# whose x[i] then hits tibble's `[`, a column selector: "Can't subset columns
# past the end" (hoopR #88). wehoop_data objects must not carry it.

test_that("make_wehoop_data() and rbindlist_with_attrs() output supports head()/tail()/print()", {
  df <- data.frame(a = 1:10, b = letters[1:10])
  out <- make_wehoop_data(df, "unit test data", Sys.time())
  bound <- rbindlist_with_attrs(list(out, out))

  for (x in list(out, bound)) {
    expect_s3_class(x, "wehoop_data")
    expect_false(inherits(x, "data.table"))
    expect_equal(tail(x)$a, 5:10)
    expect_equal(head(x, 3)$a, 1:3)
    expect_no_error(capture.output(print(x)))
  }
})

test_that("every exported load_*() result supports head()/tail() (offline)", {
  # group_quantity: load_wnba_stats_lineups() keeps the 5-man rows
  fake <- function(...) data.table::data.table(a = 1:10, b = letters[1:10], group_quantity = 5L)
  local_mocked_bindings(rds_from_url = fake, parquet_from_url = fake, csv_from_url = fake)
  args <- list(load_wnba_stats_leaguedash = list(table = wnba_stats_leaguedash_tables[[1]]))

  loaders <- grep("^load_", getNamespaceExports("wehoop"), value = TRUE)
  expect_gt(length(loaders), 90)
  for (f in loaders) {
    x <- suppressMessages(do.call(
      getExportedValue("wehoop", f), if (is.null(args[[f]])) list() else args[[f]]
    ))
    # the *_manifest() loaders return the csv as a plain data.table, which is fine;
    # the bug is a data.table class on a tibble
    expect_false(inherits(x, "tbl_df") && inherits(x, "data.table"), label = f)
    expect_equal(nrow(tail(x)), 6L, label = f)
    expect_equal(nrow(head(x, 3)), 3L, label = f)
  }
})
