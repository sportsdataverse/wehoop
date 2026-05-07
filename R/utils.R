.datatable.aware <- TRUE

#' Progressively
#'
#' This function helps add progress-reporting to any function - given function `f()` and progressor `p()`, it will return a new function that calls `f()` and then (on-exiting) will call `p()` after every iteration.
#'
#' This is inspired by purrr's `safely`, `quietly`, and `possibly` function decorators.
#'
#' @param f a function to add progressr functionality to.
#' @param p a progressor function as created by `progressr::progressor()`
#' @keywords Internal
#'
#' @return a function that does the same as `f` but it calls `p()` after iteration.
#'
progressively <- function(f, p = NULL){
  if (!is.null(p) && !inherits(p, "progressor")) stop("`p` must be a progressor function!")
  if (is.null(p)) p <- function(...) NULL
  force(f)
  
  function(...){
    on.exit(p("loading..."))
    f(...)
  }
  
}

#' @title
#' **Load .csv / .csv.gz file from a remote connection**
#' @description
#' This is a thin wrapper on data.table::fread
#' @param ... passed to data.table::fread
#' @keywords Internal
#' @importFrom data.table fread
csv_from_url <- function(...){
  data.table::fread(...)
}

#' @title
#' **Load .rds file from a remote connection**
#' @param url a character url
#' @keywords Internal
#' @return a dataframe as created by [`readRDS()`]
#' @importFrom data.table data.table setDT
#' @import rvest
rds_from_url <- function(url) {
  con <- url(url)
  on.exit(close(con))
  load <- try(readRDS(con), silent = TRUE)
  
  if (inherits(load, "try-error")) {
    warning(paste0("Failed to readRDS from <", url, ">"), call. = FALSE)
    return(data.table::data.table())
  }
  
  data.table::setDT(load)
  return(load)
}

# The function `message_completed` to create the green "...completed" message
# only exists to hide the option `in_builder` in dots
message_completed <- function(x, in_builder = FALSE) {
  if (!in_builder) {
    usethis::ui_done("{usethis::ui_field(x)}")
  } else if (in_builder) {
    usethis::ui_done(x)
  }
}
user_message <- function(x, type) {
  if (type == "done") {
    usethis::ui_done("{my_time()} | {x}")
  } else if (type == "todo") {
    usethis::ui_todo("{my_time()} | {x}")
  } else if (type == "info") {
    usethis::ui_info("{my_time()} | {x}")
  } else if (type == "oops") {
    usethis::ui_oops("{my_time()} | {x}")
  }
}

# check if a package is installed
is_installed <- function(pkg) requireNamespace(pkg, quietly = TRUE)
# custom mode function from https://stackoverflow.com/questions/2547402/is-there-a-built-in-function-for-finding-the-mode/8189441
custom_mode <- function(x, na.rm = TRUE) {
  if (na.rm) {
    x <- x[!is.na(x)]
  }
  ux <- unique(x)
  return(ux[which.max(tabulate(match(x, ux)))])
}


#' Most Recent Women's College Basketball Season
#'
#' Returns the most recent women's college basketball season year as an
#' integer based on the current system date. The NCAA WBB season spans two
#' calendar years; this helper rolls over to the next season starting in
#' October. For example, calls made on 2025-11-15 return `2026`, while
#' calls made on 2025-03-15 return `2025`.
#'
#' @return An integer giving the season-ending year (e.g. `2025` for the
#'   2024-25 season).
#' @examples
#' most_recent_wbb_season()
#' @export
most_recent_wbb_season <- function() {
  ifelse(
    as.double(substr(Sys.Date(), 6, 7)) >= 10,
    as.double(substr(Sys.Date(), 1, 4)) + 1,
    as.double(substr(Sys.Date(), 1, 4))
  )
}

#' Most Recent WNBA Season
#'
#' Returns the most recent WNBA season year as an integer based on the
#' current system date. The WNBA season runs from May through October
#' within a single calendar year; this helper rolls forward to the new
#' season starting in May.
#'
#' @return An integer giving the WNBA season year (e.g. `2025`).
#' @examples
#' most_recent_wnba_season()
#' @export
most_recent_wnba_season <- function() {
  ifelse(
    as.double(substr(Sys.Date(), 6, 7)) >= 5,
    as.double(substr(Sys.Date(), 1, 4)),
    as.double(substr(Sys.Date(), 1, 4)) - 1
  )
}

#' Most Recent WNBA Stats API Season
#'
#' Returns the most recent WNBA Stats API season year as an integer. This
#' is a thin wrapper around [most_recent_wnba_season()] kept as a separate
#' helper for naming symmetry with the `wnba_stats_*` family of loaders
#' (mirrors the `most_recent_*_season()` convention used elsewhere in the
#' package). The WNBA Stats API and ESPN's WNBA endpoints share the same
#' calendar-year season identifier, so the returned value is identical
#' to `most_recent_wnba_season()`.
#'
#' @return An integer giving the WNBA season year (e.g. `2025`).
#' @examples
#' most_recent_wnba_stats_season()
#' @export
most_recent_wnba_stats_season <- function() {
  most_recent_wnba_season()
}

my_time <- function() strftime(Sys.time(), format = "%H:%M:%S")

#' Check Status function
#' @param res Response from an httr2 request
#' @keywords Internal
#' @import rvest
#'
check_status <- function(res) {

  x <- httr2::resp_status(res)

  if (x != 200) stop("The API returned an error", call. = FALSE)

}

#' Retry an HTTP request with httr2
#'
#' Internal helper used by `request_with_proxy()` and other wrappers that
#' previously called `httr::RETRY()`. Wraps `httr2` request building, header /
#' query injection, timeout, and retry policy in a single call.
#'
#' @param url Base request URL.
#' @param params Optional named list of query parameters.
#' @param headers Optional named character vector of HTTP headers.
#' @param timeout Request timeout in seconds.
#' @return An `httr2_response` object.
#' @keywords internal
.retry_request <- function(url, params = list(), headers = NULL, timeout = 60,
                           proxy = NULL) {
  req <- httr2::request(url)
  if (length(params) > 0) {
    req <- req |> httr2::req_url_query(!!!params)
  }
  if (!is.null(headers)) {
    req <- req |> httr2::req_headers(!!!as.list(headers))
  }
  # Optional proxy support. Resolution order:
  #   1. `proxy` argument (caller-supplied, highest precedence).
  #   2. `getOption("wehoop.proxy")` (session-level fallback — set once with
  #      `options(wehoop.proxy = ...)` and every call picks it up; needed for
  #      ESPN / NCAA wrappers that don't thread `...` to `.retry_request`).
  #   3. `http_proxy` / `https_proxy` / `no_proxy` env vars (read by libcurl
  #      automatically when the explicit `proxy` is NULL — no code path here).
  #
  # The `proxy` argument accepts:
  #   - a single URL string                         -- e.g. "http://host:port",
  #                                                    passed to
  #                                                    `httr2::req_proxy(url=)`.
  #   - a named list                                -- spread as keyword args
  #                                                    into `httr2::req_proxy()`
  #                                                    for full control
  #                                                    (`url`, `port`,
  #                                                    `username`, `password`,
  #                                                    `auth`).
  if (is.null(proxy)) {
    proxy <- getOption("wehoop.proxy", default = NULL)
  }
  if (!is.null(proxy)) {
    req <- if (is.list(proxy)) {
      do.call(httr2::req_proxy, c(list(req = req), proxy))
    } else {
      httr2::req_proxy(req, url = proxy)
    }
  }
  req |>
    httr2::req_timeout(timeout) |>
    httr2::req_retry(max_tries = 3) |>
    httr2::req_error(is_error = function(resp) FALSE) |>
    httr2::req_perform()
}

#' Extract response body as text
#'
#' Replaces the `httr::content(res, as = "text", encoding = "UTF-8")` pattern.
#'
#' @param resp An `httr2_response` object.
#' @return Character string of response body.
#' @keywords internal
.resp_text <- function(resp) {
  httr2::resp_body_string(resp, encoding = "UTF-8")
}

#' Capture the calling function's formal arguments
#'
#' Returns a named list of the bound formal arguments (excluding `...`) of the
#' calling function, suitable for passing to `.report_api_error()` /
#' `.report_api_warning()`. Tolerates functions with empty or `...`-only
#' formals (where `names(formals())` is `NULL`), unlike the inline
#' `mget(setdiff(names(formals()), "..."))` pattern that errors with
#' `mget: invalid first argument` for arg-less wrappers.
#'
#' Caller usage:
#'
#' ```r
#' some_wrapper <- function(...) {
#'   .args <- .capture_args()
#'   ...
#' }
#' ```
#'
#' @return Named list. Empty list if the caller has no non-... formals.
#' @keywords internal
.capture_args <- function() {
  parent_fn <- sys.function(sys.parent())
  if (is.null(parent_fn)) return(list())
  fmls <- formals(parent_fn)
  if (length(fmls) == 0L) return(list())
  nms <- setdiff(names(fmls), "...")
  if (length(nms) == 0L) return(list())
  mget(nms, envir = parent.frame(), ifnotfound = list(NULL))
}

#' Minimal brace-template interpolator
#'
#' Replaces `{expr}` tokens in `template` by evaluating `expr` in `envir`.
#' Used in `.report_api_error()` / `.report_api_warning()` so callers can
#' write hints like `"No data for {game_id}"` and have `{game_id}` resolve
#' against the function's frame at the call-site.
#'
#' Per-token failures (unbound name, parse error) leave the literal
#' `{expr}` in place rather than erroring, so partial interpolation still
#' produces a useful message.
#'
#' @param template character(1).
#' @param envir environment to evaluate expressions against.
#' @return character(1).
#' @keywords internal
.interp_braces <- function(template, envir = parent.frame()) {
  if (length(template) != 1L || !is.character(template) || is.na(template)) {
    return(as.character(template))
  }
  m <- gregexpr("\\{([^{}]+)\\}", template, perl = TRUE)[[1]]
  if (length(m) == 1L && m[1] == -1L) return(template)
  starts <- as.integer(m)
  lens <- attr(m, "match.length")
  out <- character(0)
  pos <- 1L
  for (i in seq_along(starts)) {
    s <- starts[i]; l <- lens[i]
    if (s > pos) out <- c(out, substr(template, pos, s - 1L))
    expr <- substr(template, s + 1L, s + l - 2L)
    val <- tryCatch(
      paste(as.character(eval(parse(text = expr), envir = envir)), collapse = ""),
      error = function(.e) substr(template, s, s + l - 1L)
    )
    out <- c(out, val)
    pos <- s + l
  }
  if (pos <= nchar(template)) out <- c(out, substr(template, pos, nchar(template)))
  paste(out, collapse = "")
}

#' Report an API-call error with full context
#'
#' Internal helper that standardizes the message every WNBA / ESPN / NCAA
#' wrapper emits inside its `tryCatch(error = ...)` block. Always emits, in
#' order:
#'
#' 1. A timestamped friendly hint (brace-interpolated against the caller env),
#' 2. A dump of the function call's arguments,
#' 3. The actual error message (`conditionMessage(e)`).
#'
#' Functions opt in by capturing their formals once near the top —
#' `.args <- mget(setdiff(names(formals()), "..."))` — and then calling
#' `.report_api_error(e, hint = "...", args = .args)` from the error handler.
#'
#' @param e error condition (the `e` from `function(e)` in `tryCatch`).
#' @param hint character. A friendly message with optional `{name}` tokens
#'   that resolve against the *caller's* environment (so `{game_id}` etc.
#'   pull from the wrapper's formals). If `NULL`, defaults to "Request
#'   failed".
#' @param args optional named list of caller arguments to dump (typically
#'   `mget(setdiff(names(formals()), "..."))` captured at function entry).
#' @return Invisibly `NULL`. Called for its side effects.
#' @keywords internal
.report_api_error <- function(e, hint = NULL, args = list()) {
  caller_env <- parent.frame()

  hint_text <- if (!is.null(hint)) {
    .interp_braces(hint, envir = caller_env)
  } else {
    "Request failed"
  }

  cli::cli_alert_danger("{Sys.time()}: {hint_text}")

  if (length(args) > 0) {
    args_str <- paste0(
      names(args), " = ",
      vapply(args, function(a) {
        s <- tryCatch(deparse(a, width.cutoff = 60)[1],
                      error = function(...) "<?>")
        if (nchar(s) > 60) paste0(substr(s, 1, 60), "...") else s
      }, character(1)),
      collapse = ", "
    )
    cli::cli_alert_danger("Args: {args_str}")
  }

  cli::cli_alert_danger("Error: {conditionMessage(e)}")
  invisible(NULL)
}

#' Report an API-call warning with full context
#'
#' Mirrors `.report_api_error()` but for `tryCatch(warning = ...)` handlers.
#' Emits, in order:
#'
#' 1. A timestamped friendly hint (brace-interpolated against the caller env),
#' 2. A dump of the function call's arguments,
#' 3. The actual warning message (`conditionMessage(w)`).
#'
#' @param w warning condition (the `w` from `function(w)` in `tryCatch`).
#' @param hint character. Same semantics as `.report_api_error()`'s `hint`.
#'   If `NULL`, defaults to "Request emitted a warning".
#' @param args optional named list of caller arguments to dump.
#' @return Invisibly `NULL`. Called for its side effects.
#' @keywords internal
.report_api_warning <- function(w, hint = NULL, args = list()) {
  caller_env <- parent.frame()

  hint_text <- if (!is.null(hint)) {
    .interp_braces(hint, envir = caller_env)
  } else {
    "Request emitted a warning"
  }

  cli::cli_alert_warning("{Sys.time()}: {hint_text}")

  if (length(args) > 0) {
    args_str <- paste0(
      names(args), " = ",
      vapply(args, function(a) {
        s <- tryCatch(deparse(a, width.cutoff = 60)[1],
                      error = function(...) "<?>")
        if (nchar(s) > 60) paste0(substr(s, 1, 60), "...") else s
      }, character(1)),
      collapse = ", "
    )
    cli::cli_alert_warning("Args: {args_str}")
  }

  cli::cli_alert_warning("Warning: {conditionMessage(w)}")
  invisible(NULL)
}

#' @title
#' **Convert a calendar year to a WNBA / NBA season string**
#' @description
#' Returns a season string of the form `YYYY-YY` (e.g. `2024 -> "2024-25"`).
#' WNBA seasons span a single calendar year, but several Stats API endpoints
#' (and several NBA-derived endpoints used in load helpers) accept the
#' two-year season-string form, so this helper is provided for parity with
#' the analogous helper in the `hoopR` package.
#' @param year a four-digit calendar year (numeric or character).
#' @return A character season string, e.g. `"2024-25"`.
#' @keywords Internal
#' @export
year_to_season <- function(year) {
  first_year <- substr(year, 3, 4)
  next_year <- as.numeric(first_year) + 1
  next_year <- dplyr::case_when(
    next_year < 10 & first_year > 0 ~ paste0("0", next_year),
    first_year == 99 ~ "00",
    TRUE ~ as.character(next_year)
  )
  return(paste0(year, "-", next_year))
}

#' @importFrom magrittr %>%
#' @usage lhs \%>\% rhs
NULL

#' @import utils
utils::globalVariables(c("where"))

# check if a package is installed
is_installed <- function(pkg) requireNamespace(pkg, quietly = TRUE)



#' @keywords internal
"_PACKAGE"

#' @importFrom Rcpp getRcppVersion
#' @importFrom RcppParallel defaultNumThreads
NULL

`%c%` <- function(x,y){
  ifelse(!is.na(x),x,y)
}



# Functions for custom class
# turn a data.frame into a tibble/wehoop_data
make_wehoop_data <- function(df, type, timestamp){
  out <- df %>%
    tidyr::as_tibble()
  
  class(out) <- c("wehoop_data","tbl_df","tbl","data.table","data.frame")
  attr(out,"wehoop_timestamp") <- timestamp
  attr(out,"wehoop_type") <- type
  return(out)
}

#' @export
#' @noRd
print.wehoop_data <- function(x,...) {
  cli::cli_rule(left = "{attr(x,'wehoop_type')}",right = "{.emph wehoop {utils::packageVersion('wehoop')}}")
  
  if (!is.null(attr(x,'wehoop_timestamp'))) {
    cli::cli_alert_info(
      "Data updated: {.field {format(attr(x,'wehoop_timestamp'), tz = Sys.timezone(), usetz = TRUE)}}"
    )
  }
  
  NextMethod(print,x)
  invisible(x)
}



# rbindlist but maintain attributes of last file
rbindlist_with_attrs <- function(dflist){
  
  wehoop_timestamp <- attr(dflist[[length(dflist)]], "wehoop_timestamp")
  wehoop_type <- attr(dflist[[length(dflist)]], "wehoop_type")
  out <- data.table::rbindlist(dflist, use.names = TRUE, fill = TRUE)
  attr(out,"wehoop_timestamp") <- wehoop_timestamp
  attr(out,"wehoop_type") <- wehoop_type
  class(out) <- c("wehoop_data","tbl_df","tbl","data.table","data.frame")
  out
}