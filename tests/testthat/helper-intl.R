# Live tests of the international basketball families (R/intl_basketball_*.R and
# the per-league files) hit third-party hosts politely (>= 1 s per host). They run
# only with WEHOOP_INTL_LIVE_TESTS=1, never on CRAN. Genius and CBA live tests also
# need GENIUS_PROXY / CBA_PROXY (datacenter IPs are refused); skip those with
# skip_intl_live("GENIUS_PROXY").
skip_intl_live <- function(proxy_env = NULL) {
  testthat::skip_on_cran()
  if (Sys.getenv("WEHOOP_INTL_LIVE_TESTS") != "1") {
    testthat::skip("International basketball live tests are off (set WEHOOP_INTL_LIVE_TESTS=1)")
  }
  if (!is.null(proxy_env) && !nzchar(trimws(Sys.getenv(proxy_env)))) {
    testthat::skip(paste0("International basketball live test needs ", proxy_env, " set"))
  }
  invisible()
}

# A fake .intl_now() leaves throttle slots in the runtime's `.intl_clock` that are far in the
# future of the real clock; a later REAL request would sleep until them. Every test that mocks
# the clock clears it now and again when `env` ends.
local_intl_clock <- function(env = parent.frame()) {
  rm(list = ls(.intl_clock), envir = .intl_clock)
  withr::defer(rm(list = ls(.intl_clock), envir = .intl_clock), envir = env)
  invisible()
}

# polars write_csv writes a null as an empty field and "" as a quoted empty field: read a parity CSV (every
# column character) keeping the two apart. A writer that never quotes "" (feb, bleague) cannot tell them apart.
intl_read_oracle <- function(path) {
  con <- if (grepl("\\.gz$", path)) gzfile(path, "rb") else file(path, "rb")
  on.exit(close(con))
  lines <- readLines(con, encoding = "UTF-8", warn = FALSE)
  marked <- gsub('(^|,)""(?=,|$)', "\\1\"\001\"", lines, perl = TRUE)
  want <- utils::read.csv(text = marked, colClasses = "character", na.strings = "", check.names = FALSE,
                          encoding = "UTF-8")
  want[] <- lapply(want, function(x) {
    x[!is.na(x) & x == "\001"] <- ""
    x
  })
  want
}

# Each column's R class against sdv-py's polars dtypes (one frame of a parity dtypes.json, read with
# jsonlite::read_json): Int64 integer, Float64 numeric, String character, Boolean logical, Date Date,
# Datetime POSIXct. An unmapped dtype is an error.
intl_oracle_types <- function(dtypes) {
  map <- c(Int64 = "integer", Float64 = "numeric", String = "character", Boolean = "logical", Date = "Date")
  vapply(dtypes, function(t) if (startsWith(t, "Datetime")) "POSIXct" else map[[t]], "")
}
intl_r_types <- function(df) {
  vapply(df, function(x) if (is.double(x) && !inherits(x, c("Date", "POSIXct"))) "numeric" else class(x)[[1]], "")
}
