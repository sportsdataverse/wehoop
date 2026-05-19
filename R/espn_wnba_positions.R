# espn_wnba_positions.R
# Public NBA shims for the ESPN position dictionary.

# ---------------------------------------------------------------------------
# espn_wnba_positions
# ---------------------------------------------------------------------------

#' **Get ESPN WNBA Positions Index**
#' @name espn_wnba_positions
NULL
#' @title
#' **Get ESPN WNBA Positions Index**
#' @rdname espn_wnba_positions
#' @author Saiem Gilani
#' @description
#' Returns the WNBA position dictionary index. One row per position with
#' its id and the canonical `$ref` URL — pass an id to
#' [espn_wnba_position()] for full details (display name, abbreviation,
#' leaf flag, parent link).
#'
#' @param ... Additional arguments; currently unused.
#' @return A tibble with one row per position.
#' @export
#' @family ESPN WNBA Functions
#' @examples
#' \donttest{
#'   espn_wnba_positions()
#' }
espn_wnba_positions <- function(...) {
  .espn_basketball_positions(league = "wnba", ...)
}

# ---------------------------------------------------------------------------
# espn_wnba_position
# ---------------------------------------------------------------------------

#' **Get ESPN WNBA Position Detail**
#' @name espn_wnba_position
NULL
#' @title
#' **Get ESPN WNBA Position Detail**
#' @rdname espn_wnba_position
#' @author Saiem Gilani
#' @description
#' Returns metadata for a single WNBA position. Useful for dereferencing
#' position `$ref` URLs embedded in athlete records, and for navigating
#' parent/leaf relationships in the position taxonomy.
#'
#' @param position_id ESPN position identifier (character or numeric).
#' @param ... Additional arguments; currently unused.
#' @return A single-row tibble.
#' @export
#' @family ESPN WNBA Functions
#' @examples
#' \donttest{
#'   espn_wnba_position(position_id = 1)
#' }
espn_wnba_position <- function(position_id, ...) {
  .espn_basketball_position(league = "wnba",
                              position_id = position_id, ...)
}
