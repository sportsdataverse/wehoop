# Regression tests for issue #44: espn_wnba_pbp() crashed with
# "'names' attribute [4] must be the same length as the vector [3]" when a
# game's plays maxed out at fewer than 3 participants. These tests exercise
# the exact unnest_wider + dynamic-naming + NA-padding sequence used in
# R/espn_wnba_data.R (parse_wnba_pbp) against stub ESPN JSON shapes, without
# hitting the network.

build_wnba_aths <- function(plays) {
  plays <- plays %>%
    tidyr::unnest_wider("participants")
  suppressWarnings(
    aths <- plays %>%
      dplyr::group_by(.data$id) %>%
      dplyr::select(
        "id",
        "athlete.id") %>%
      tidyr::unnest_wider("athlete.id", names_sep = "_")
  )
  names(aths) <- c("play.id", paste0("athlete.id.", seq_len(ncol(aths) - 1)))
  for (nm in paste0("athlete.id.", 1:3)) {
    if (!nm %in% names(aths)) aths[[nm]] <- NA_character_
  }
  aths <- aths[, c("play.id", paste0("athlete.id.", 1:3))]
  aths
}

test_that("WNBA participants: 2-max-participant game does not error and pads athlete.id.3", {
  skip_on_cran()
  plays <- dplyr::tibble(
    id = c("1", "2"),
    participants = list(
      dplyr::tibble(athlete.id = c("100", "101")),
      dplyr::tibble(athlete.id = c("200"))
    )
  )

  aths <- expect_no_error(build_wnba_aths(plays))

  expect_equal(names(aths), c("play.id", "athlete.id.1", "athlete.id.2", "athlete.id.3"))
  expect_true(all(is.na(aths$athlete.id.3)))
  expect_equal(nrow(aths), 2)
})

test_that("WNBA participants: 4-participant play does not error and truncates to athlete.id.3", {
  skip_on_cran()
  plays <- dplyr::tibble(
    id = c("1"),
    participants = list(
      dplyr::tibble(athlete.id = c("100", "101", "102", "103"))
    )
  )

  aths <- expect_no_error(build_wnba_aths(plays))

  expect_equal(names(aths), c("play.id", "athlete.id.1", "athlete.id.2", "athlete.id.3"))
  expect_equal(nrow(aths), 1)
})
