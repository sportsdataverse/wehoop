#!/usr/bin/env Rscript
# Scan R/ for exported functions missing @return or @examples roxygen tags.
files <- list.files("R", pattern = "\\.R$", full.names = TRUE)

miss_ret <- character()
miss_ex <- character()

for (f in files) {
  lines <- readLines(f, warn = FALSE)
  is_rox <- grepl("^#'", lines)
  block_id <- cumsum(c(TRUE, diff(is_rox) != 0))
  block_id[!is_rox] <- NA_integer_

  for (b in unique(block_id[!is.na(block_id)])) {
    rng <- which(block_id == b)
    block_text <- paste(lines[rng], collapse = "\n")
    if (!grepl("@export", block_text)) next
    if (grepl("@noRd", block_text)) next

    # Identify the function/topic name from following non-comment line
    next_idx <- max(rng) + 1
    while (next_idx <= length(lines) && (grepl("^\\s*$", lines[next_idx]) ||
                                          grepl("^NULL", lines[next_idx]))) {
      next_idx <- next_idx + 1
    }
    name <- "unknown"
    if (next_idx <= length(lines)) {
      m <- regmatches(lines[next_idx],
                      regexec("^([A-Za-z_.][A-Za-z0-9_.]*)\\s*<-", lines[next_idx]))[[1]]
      if (length(m) >= 2) name <- m[[2]]
    }
    # Also try @name tag
    m2 <- regmatches(block_text, regexec("@name\\s+(\\S+)", block_text))[[1]]
    if (length(m2) >= 2 && name == "unknown") name <- m2[[2]]

    label <- paste0(basename(f), ": ", name)
    if (!grepl("@return", block_text))   miss_ret <- c(miss_ret, label)
    if (!grepl("@examples", block_text)) miss_ex  <- c(miss_ex,  label)
  }
}

cat("Total exported blocks missing @return:", length(miss_ret), "\n")
if (length(miss_ret) > 0) {
  writeLines(c("--- Missing @return ---", head(miss_ret, 50)))
}
cat("\nTotal exported blocks missing @examples:", length(miss_ex), "\n")
if (length(miss_ex) > 0) {
  writeLines(c("--- Missing @examples ---", head(miss_ex, 50)))
}
