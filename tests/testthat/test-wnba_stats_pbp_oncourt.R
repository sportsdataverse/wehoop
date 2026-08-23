.oncourt_stub_pbp <- function() {
  away_ids <- as.character(201:205)
  home_ids <- as.character(101:105)
  dplyr::tibble(
    game_id = "1022400001",
    period = 1L,
    minute_remaining_quarter = 9,
    seconds_remaining_quarter = 30,
    event_type = "1",
    event_num = as.character(1:10),
    player1_id = c(away_ids, home_ids),
    player1_name = paste("Player", 1:10),
    person1type = c(rep("5", 5), rep("4", 5)),
    player2_id = "0",
    player2_name = NA_character_,
    person2type = "0",
    player3_id = "0",
    player3_name = NA_character_,
    person3type = "0"
  )
}

test_that(".players_on_court_v3_wnba falls back to substitution inference on empty rotation", {
  testthat::local_mocked_bindings(wnba_gamerotation = function(...) NULL)
  pbp <- .oncourt_stub_pbp()
  res <- suppressMessages(.players_on_court_v3_wnba(pbp))
  expect_setequal(
    as.numeric(unlist(res[1, paste0("away_player", 1:5)])),
    as.numeric(201:205)
  )
  expect_setequal(
    as.numeric(unlist(res[1, paste0("home_player", 1:5)])),
    as.numeric(101:105)
  )
})

test_that(".players_on_court_v3_wnba degrades to NA columns when the fallback also fails", {
  testthat::local_mocked_bindings(wnba_gamerotation = function(...) NULL)
  # frame lacks the columns substitution inference needs -> fallback errors -> NA path
  pbp <- dplyr::tibble(game_id = "1022400001", period = 1L)
  res <- suppressMessages(.players_on_court_v3_wnba(pbp))
  oncourt_cols <- c(paste0("away_player", 1:5), paste0("home_player", 1:5))
  expect_true(all(oncourt_cols %in% names(res)))
  expect_true(all(is.na(unlist(res[, oncourt_cols]))))
})
