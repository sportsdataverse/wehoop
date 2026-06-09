# ---------------------------------------------------------------------------
# Internal: Basketball-Reference WNBA scraping layer (basketball-reference.com/wnba)
# ---------------------------------------------------------------------------
#
# Basketball-Reference's WNBA section mirrors its NBA structure and carries the
# same two Sports-Reference quirks:
#   1. Secondary tables are hidden inside HTML comments (`<!-- ... -->`) to defer
#      rendering -- we strip the comment markers so every table is reachable.
#   2. Tables use multi-row "over-headers"; column names are read from each
#      cell's `data-stat` attribute (stable canonical keys) rather than the
#      rendered header, which avoids the mangled `x`, `x_2`, ... names that
#      `rvest::html_table()` would produce.
#
# No account or API key is required. Basketball-Reference rate-limits aggressive
# clients (~20 requests/minute); space repeated calls with `Sys.sleep()`.

.bref_wnba_base_url <- "https://www.basketball-reference.com"
.bref_wnba_user_agent <- "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) wehoop Safari/537.36"

#' Internal: GET a Basketball-Reference WNBA page and return the body text
#' @param path Page path beginning with `/` (e.g. `"/wnba/years/2024_per_game.html"`).
#' @return The response body as a character string.
#' @keywords internal
.bref_wnba_text <- function(path) {
  resp <- .retry_request(
    paste0(.bref_wnba_base_url, path),
    headers = c("User-Agent" = .bref_wnba_user_agent)
  )
  .resp_text(resp)
}

#' Internal: parse a Basketball-Reference WNBA table by id using data-stat keys
#'
#' Un-comments the page (so comment-hidden tables are reachable), selects the
#' table by `id`, drops mid-table header-repeat rows, and builds a data.frame
#' whose columns are the cells' `data-stat` attributes.
#'
#' @param html Raw page HTML (character).
#' @param table_id Table `id` (e.g. `"per_game"`); `NULL` = first table.
#' @return A data.frame (character columns), or an empty data.frame if not found.
#' @keywords internal
#' @importFrom rvest read_html html_element html_elements html_attr html_text2
#' @importFrom data.table rbindlist
.bref_wnba_table <- function(html, table_id = NULL) {
  html <- gsub("<!--", "", html, fixed = TRUE)
  html <- gsub("-->", "", html, fixed = TRUE)
  doc <- rvest::read_html(html)

  node <- if (is.null(table_id)) {
    rvest::html_element(doc, "table")
  } else {
    rvest::html_element(doc, paste0("table#", table_id))
  }
  if (inherits(node, "xml_missing")) return(data.frame())

  rows <- rvest::html_elements(node, "tbody > tr")
  if (length(rows) == 0) return(data.frame())

  cls <- rvest::html_attr(rows, "class")
  cls[is.na(cls)] <- ""
  rows <- rows[!grepl("thead", cls, fixed = TRUE)]

  lst <- lapply(rows, function(r) {
    cells <- rvest::html_elements(r, "th, td")
    stats <- rvest::html_attr(cells, "data-stat")
    vals  <- rvest::html_text2(cells)
    keep  <- !is.na(stats)
    out <- as.list(vals[keep])
    names(out) <- stats[keep]
    out
  })

  df <- data.table::rbindlist(lst, use.names = TRUE, fill = TRUE)
  as.data.frame(df)
}

# Convert character columns that are fully numeric to numeric, leaving the rest
# (names, team codes, positions) as character.
.bref_wnba_type_convert <- function(df) {
  num <- vapply(df, function(col) {
    col <- col[!is.na(col) & col != ""]
    length(col) > 0 && !any(is.na(suppressWarnings(as.numeric(col))))
  }, logical(1))
  for (j in which(num)) df[[j]] <- suppressWarnings(as.numeric(df[[j]]))
  df
}

# Drop Sports-Reference blank "DUMMY" spacer columns + all-empty rows, then
# type-convert and clean_names into a tibble.
#' @importFrom janitor clean_names
#' @importFrom dplyr as_tibble
.bref_wnba_finish <- function(d) {
  d <- d[, !is.na(colnames(d)) & !colnames(d) %in% c("DUMMY", ""), drop = FALSE]
  d <- d[rowSums(!is.na(d) & d != "") > 0, , drop = FALSE]
  d <- .bref_wnba_type_convert(d)
  janitor::clean_names(dplyr::as_tibble(d))
}
