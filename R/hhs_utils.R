# ---------------------------------------------------------------------------
# Internal: Her Hoop Stats authenticated-scraping layer (herhoopstats.com)
# ---------------------------------------------------------------------------
#
# Her Hoop Stats (https://herhoopstats.com) is a *subscription* women's
# basketball statistics service (WNBA + NCAA). The member tables live behind a
# Django login, so the `hhs_*()` wrappers log in with the subscriber's own
# credentials (never bundled) and reuse the session cookie -- the same shape as
# the KenPom `kp_*()` wrappers in hoopR.
#
# Credentials are read, in order, from:
#   1. the function's `email` / `password` arguments,
#   2. `getOption("wehoop.herhoopstats_email")` / `..._password")`,
#   3. the `HERHOOPSTATS_EMAIL` / `HERHOOPSTATS_PW` environment variables.
#
# NOTE: this family has NOT been verified against a live subscription. The login
# form fields and member-table layout may need small adjustments if the site has
# changed; treat selectors here as a starting point.

.hhs_base_url <- "https://herhoopstats.com"
.hhs_login_url <- "https://herhoopstats.com/accounts/login/"
.hhs_user_agent <- "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) wehoop Safari/537.36"

.hhs_email <- function(email = NULL) {
  email %||% getOption("wehoop.herhoopstats_email", default = NULL) %||%
    (function() { v <- Sys.getenv("HERHOOPSTATS_EMAIL"); if (nzchar(v)) v else NULL })()
}

.hhs_password <- function(password = NULL) {
  password %||% getOption("wehoop.herhoopstats_password", default = NULL) %||%
    (function() { v <- Sys.getenv("HERHOOPSTATS_PW"); if (nzchar(v)) v else NULL })()
}

#' Are Her Hoop Stats subscription credentials available?
#' @param email,password Optional explicit credentials.
#' @return `TRUE` when both an email and a password can be resolved.
#' @keywords internal
has_hhs_login <- function(email = NULL, password = NULL) {
  !is.null(.hhs_email(email)) && !is.null(.hhs_password(password))
}

#' Internal: an httr2 request bound to a Her Hoop Stats cookie jar
#' @keywords internal
.hhs_request <- function(url, jar) {
  httr2::req_cookie_preserve(
    httr2::req_headers(httr2::request(url), `User-Agent` = .hhs_user_agent),
    jar
  )
}

#' Internal: log into Her Hoop Stats and return the session cookie jar
#'
#' GETs the Django login page (to obtain the `csrftoken` cookie and the hidden
#' `csrfmiddlewaretoken`), then POSTs the credentials. Returns the cookie-jar
#' path for reuse by authenticated requests.
#'
#' @param email,password Subscriber credentials (resolved from args / options /
#'   env vars when `NULL`).
#' @return The path to the session cookie jar (a tempfile).
#' @keywords internal
#' @importFrom rvest read_html html_element html_attr
.hhs_login <- function(email = NULL, password = NULL) {
  email <- .hhs_email(email)
  password <- .hhs_password(password)
  if (is.null(email) || is.null(password)) {
    stop(paste0(
      "This function requires a Her Hoop Stats subscription e-mail and password,\n",
      "  set as the environment variables HERHOOPSTATS_EMAIL and HERHOOPSTATS_PW\n",
      "  (or options(wehoop.herhoopstats_email=, wehoop.herhoopstats_password=))."
    ), call. = FALSE)
  }

  jar <- tempfile(fileext = ".txt")

  # GET the login page -> session cookies + CSRF token
  resp <- httr2::req_perform(.hhs_request(.hhs_login_url, jar))
  page <- rvest::read_html(.resp_text(resp))
  token <- rvest::html_attr(
    rvest::html_element(page, "input[name='csrfmiddlewaretoken']"), "value")

  # POST credentials (Django needs the CSRF token + a matching Referer)
  body <- list(email = email, password = password)
  if (!is.na(token) && nzchar(token)) body$csrfmiddlewaretoken <- token
  req <- httr2::req_headers(.hhs_request(.hhs_login_url, jar), Referer = .hhs_login_url)
  req <- do.call(httr2::req_body_form, c(list(req), body))
  httr2::req_perform(req)

  jar
}

#' Internal: GET an authenticated Her Hoop Stats page and parse it
#' @param path Page path (beginning with `/`) or full URL.
#' @param jar A session cookie jar from [.hhs_login()].
#' @return An `xml_document`.
#' @keywords internal
#' @importFrom rvest read_html
.hhs_doc <- function(path, jar) {
  url <- if (grepl("^https?://", path)) path else paste0(.hhs_base_url, path)
  resp <- httr2::req_perform(.hhs_request(url, jar))
  rvest::read_html(.resp_text(resp))
}
