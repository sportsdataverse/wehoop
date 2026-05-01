#!/usr/bin/env Rscript
# One-off migration: replace httr callsites with the httr2-backed
# .retry_request() / .resp_text() helpers in R/utils.R.
#
# Patterns handled:
#   1.  httr::RETRY("GET", URL)                       -> .retry_request(URL)
#   2.  httr::RETRY("GET", URL, ...)                  -> .retry_request(URL)
#   3.  httr::content(<...>, as = "text", encoding = "UTF-8")  -> .resp_text(<...>)
#   4.  httr::content(as = "text", encoding = "UTF-8")          -> .resp_text()  (pipe form)
#
# Multi-line / parameterized calls (timeouts, custom headers, query =, etc.)
# are flagged but NOT auto-replaced — fix those by hand. The script reports
# the file:line of each unhandled callsite at the end.

files <- list.files("R", pattern = "\\.R$", full.names = TRUE)

n_replaced <- 0L
unhandled <- character(0)

for (f in files) {
  if (basename(f) == "utils.R") next  # skip the file that DEFINES the helpers
  lines <- readLines(f, warn = FALSE)
  orig  <- lines

  # 1. Simple single-line `httr::RETRY("GET", URL)` -> `.retry_request(URL)`
  lines <- sub(
    'httr::RETRY\\("GET",\\s*([^,()]+?)\\)',
    '.retry_request(\\1)',
    lines
  )

  # 2. `httr::RETRY("GET", URL, ...)` (the variadic form) -> `.retry_request(URL)`
  lines <- sub(
    'httr::RETRY\\("GET",\\s*([^,()]+?),\\s*\\.\\.\\.\\)',
    '.retry_request(\\1)',
    lines
  )

  # 3. Pipe-style: `httr::content(as = "text", encoding = "UTF-8")` -> `.resp_text()`
  lines <- sub(
    'httr::content\\(as\\s*=\\s*"text",\\s*encoding\\s*=\\s*"UTF-8"\\)',
    '.resp_text()',
    lines
  )

  # 4. Direct call: `httr::content(<x>, as = "text", encoding = "UTF-8")`
  lines <- sub(
    'httr::content\\(([^,]+),\\s*as\\s*=\\s*"text",\\s*encoding\\s*=\\s*"UTF-8"\\)',
    '.resp_text(\\1)',
    lines
  )

  diff <- sum(lines != orig)
  if (diff > 0) {
    writeLines(lines, f)
    n_replaced <- n_replaced + diff
    cat(basename(f), ": ", diff, " lines replaced\n", sep = "")
  }

  # Surface remaining httr:: callsites for manual review.
  rem_idx <- grep("httr::", lines)
  if (length(rem_idx) > 0) {
    for (i in rem_idx) {
      unhandled <- c(unhandled, paste0(f, ":", i, " | ", trimws(lines[i])))
    }
  }
}

cat("\n== Summary ==\n")
cat("Total lines replaced (auto):", n_replaced, "\n")
cat("Remaining httr:: callsites needing manual fix:", length(unhandled), "\n")
if (length(unhandled) > 0) {
  cat("\n== Unhandled callsites ==\n")
  for (u in unhandled) cat(u, "\n")
}
