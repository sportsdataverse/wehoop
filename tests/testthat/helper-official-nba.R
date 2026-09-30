# Shared helpers for the official.nba.com (wnba_referee_assignments) tests.

official_fixture <- function(name) {
  testthat::test_path("fixtures", "official_nba", name)
}

# Compare frames as character with NA == "" (the golden CSVs are read with
# colClasses = "character", where an empty field is "").
chr_frame <- function(df) {
  out <- as.data.frame(lapply(df, as.character), stringsAsFactors = FALSE)
  out[is.na(out)] <- ""
  out
}

# Named vector of each column's first class, e.g. c(game_date = "Date").
col_classes <- function(df) {
  vapply(df, function(x) class(x)[[1]], character(1))
}

# A canned httr2 response whose body is a captured fixture file.
official_response <- function(status, name) {
  path <- official_fixture(name)
  httr2::response(status_code = status, body = readBin(path, "raw", file.size(path)))
}

# Answer every httr2::req_perform() call with `resp` (an httr2_response, or a
# function(req) returning one) so no test ever touches the network.
local_official_response <- function(resp, env = parent.frame()) {
  force(resp)
  testthat::local_mocked_bindings(
    req_perform = function(req, ...) if (is.function(resp)) resp(req) else resp,
    .package = "httr2",
    .env = env
  )
}
