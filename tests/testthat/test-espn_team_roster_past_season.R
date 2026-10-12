# ESPN's /teams/{id}/roster ignores ?season=, so a past season is built from that
# season's player box scores. Fixture: real 2025 Indiana Fever (5) and Las Vegas
# Aces (17) rows from wehoop-wnba-data player_box_2025.parquet, trimmed to 11 columns.

box_2025 <- function() readRDS(test_path("fixtures", "espn_team_roster", "wnba_player_box_2025_ind_lv.rds"))

test_that("a past season's roster comes from that season's box scores, not the live endpoint", {
  rm(list = ls(wehoop:::.espn_past_roster_cache), envir = wehoop:::.espn_past_roster_cache)
  calls <- 0L
  local_mocked_bindings(
    most_recent_wnba_season = function() 2026,
    load_wnba_player_box = function(seasons, ...) {
      calls <<- calls + 1L
      expect_equal(seasons, 2025L)
      box_2025()
    },
    .retry_request = function(...) stop("the live roster endpoint must not be called")
  )
  fever <- espn_wnba_team_roster(team_id = 5, season = 2025)
  expect_equal(nrow(fever), 18L)
  expect_true(all(fever$team_id == "5") && all(fever$season == 2025L))
  clark <- fever[fever$full_name == "Caitlin Clark", ]
  expect_equal(c(clark$athlete_id, clark$jersey, clark$position_abbrev), c("4433403", "22", "G"))
  aces <- espn_wnba_team_roster(team_id = "17", season = 2025)
  expect_equal(nrow(aces), 15L)
  expect_false(any(aces$athlete_id %in% fever$athlete_id))
  expect_equal(calls, 1L) # one release read per season, cached across teams
})

test_that("a past season with no published box scores errors instead of using today's roster", {
  rm(list = ls(wehoop:::.espn_past_roster_cache), envir = wehoop:::.espn_past_roster_cache)
  local_mocked_bindings(
    most_recent_wbb_season = function() 2027,
    load_wbb_player_box = function(...) data.frame(),
    .retry_request = function(...) stop("the live roster endpoint must not be called")
  )
  expect_error(espn_wbb_team_roster(team_id = 52, season = 2025), "No womens-college-basketball player box scores")
})
