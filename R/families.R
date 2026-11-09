# Family index pages.
#
# roxygen's `@family` writes every member of a family into the "See also" of
# every other member, so a family of n pages carries n^2 links. For the large
# families that was over 0.4 MB of the installed help (ESPN WNBA and WBB alone).
# Their members carry `@concept <family>` and one `@seealso` link to the
# family's index page below instead; the index lists the family once, built at
# document() time from the `@concept` tags in R/.

#' Roxygen lines listing every function whose roxygen block carries
#' `@concept <family>` (roxygen `@eval`, run by `devtools::document()` from the
#' package root).
#'
#' A function counts when its block is followed by its definition
#' (`name <- function`, blank lines allowed between), whether it has a page of
#' its own or shares one through `@rdname`.
#'
#' @param family The family name, exactly as in the `@concept` tags.
#' @return Character vector of roxygen lines.
#' @noRd
.family_index <- function(family) {
  fns <- character()
  for (path in sort(list.files("R", "[.][Rr]$", full.names = TRUE))) {
    l <- readLines(path, warn = FALSE)
    for (i in which(l == paste0("#' @concept ", family))) {
      j <- i
      while (j <= length(l) && (startsWith(l[j], "#'") || !nzchar(trimws(l[j])))) j <- j + 1L
      m <- regmatches(l[j], regexec("^`?([A-Za-z][A-Za-z0-9._]*)`? *<- *function", l[j]))[[1]]
      if (length(m)) fns <- c(fns, m[2])
    }
  }
  fns <- sort(unique(fns))
  if (!length(fns)) stop("no function carries `@concept ", family, "`", call. = FALSE)
  c("@description",
    paste0("Every function in the ", family, " family (", length(fns), "):"),
    "",
    paste0("* [", fns, "()]"))
}

#' ESPN WNBA Functions: family index
#'
#' @name family_espn_wnba
#' @eval .family_index("ESPN WNBA Functions")
#' @keywords internal
NULL

#' ESPN WBB Functions: family index
#'
#' @name family_espn_wbb
#' @eval .family_index("ESPN WBB Functions")
#' @keywords internal
NULL

#' FIBA Functions: family index
#'
#' @name family_fiba
#' @eval .family_index("FIBA Functions")
#' @keywords internal
NULL

#' TBF Functions: family index
#'
#' @name family_tbf
#' @eval .family_index("TBF Functions")
#' @keywords internal
NULL

#' WNBA Player Functions: family index
#'
#' @name family_wnba_player
#' @eval .family_index("WNBA Player Functions")
#' @keywords internal
NULL

#' SCB Functions: family index
#'
#' @name family_scb
#' @eval .family_index("SCB Functions")
#' @keywords internal
NULL

#' WNBA Team Functions: family index
#'
#' @name family_wnba_team
#' @eval .family_index("WNBA Team Functions")
#' @keywords internal
NULL

#' NBL Rosetta Functions: family index
#'
#' @name family_nbl_rosetta
#' @eval .family_index("NBL Rosetta Functions")
#' @keywords internal
NULL

#' WJBL Functions: family index
#'
#' @name family_wjbl
#' @eval .family_index("WJBL Functions")
#' @keywords internal
NULL
