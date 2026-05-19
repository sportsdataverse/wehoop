# espn_wbb_positions.R
# Public NBA shims for the ESPN position dictionary.

# ---------------------------------------------------------------------------
# espn_wbb_positions
# ---------------------------------------------------------------------------

#' **Get ESPN WBB Positions Index**
#' @name espn_wbb_positions
NULL
#' @title
#' **Get ESPN WBB Positions Index**
#' @rdname espn_wbb_positions
#' @author Saiem Gilani
#' @description
#' Returns the WBB position dictionary index. One row per position with
#' its id and the canonical `$ref` URL — pass an id to
#' [espn_wbb_position()] for full details (display name, abbreviation,
#' leaf flag, parent link).
#'
#' @param ... Additional arguments; currently unused.
#' @return A tibble with one row per position.
#' @export
#' @family ESPN WBB Functions
#' @examples
#' \donttest{
#'   espn_wbb_positions()
#' }
espn_wbb_positions <- function(...) {
  .espn_basketball_positions(league = "womens-college-basketball", ...)
}

# ---------------------------------------------------------------------------
# espn_wbb_position
# ---------------------------------------------------------------------------

#' **Get ESPN WBB Position Detail**
#' @name espn_wbb_position
NULL
#' @title
#' **Get ESPN WBB Position Detail**
#' @rdname espn_wbb_position
#' @author Saiem Gilani
#' @description
#' Returns metadata for a single WBB position. Useful for dereferencing
#' position `$ref` URLs embedded in athlete records, and for navigating
#' parent/leaf relationships in the position taxonomy.
#'
#' @param position_id ESPN position identifier (character or numeric).
#' @param ... Additional arguments; currently unused.
#' @return A single-row tibble.
#' @export
#' @family ESPN WBB Functions
#' @examples
#' \donttest{
#'   espn_wbb_position(position_id = 1)
#' }
espn_wbb_position <- function(position_id, ...) {
  .espn_basketball_position(league = "womens-college-basketball",
                              position_id = position_id, ...)
}
