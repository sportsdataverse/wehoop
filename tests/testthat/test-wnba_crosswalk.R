test_that(".bb_assemble_team_crosswalk_wnba joins ESPN/Stats/Fox on espn_team_id", {
  espn <- data.frame(
    team_id = c(17L, 9L), abbreviation = c("LV", "NY"),
    display_name = c("Las Vegas Aces", "New York Liberty"),
    short_name = c("Las Vegas", "New York"),
    team = c("Las Vegas", "New York"), mascot = c("Aces", "Liberty"),
    stringsAsFactors = FALSE
  )
  stats <- data.frame(
    wnba_team_id = c("1611661319", "1611661313"),
    wnba_team_tricode = c("LVA", "NYL"),
    wnba_team_name = c("Aces", "Liberty"),
    wnba_team_city = c("Las Vegas", "New York"),
    wnba_team_slug = c("aces", "liberty"),
    stringsAsFactors = FALSE
  )
  fox <- data.frame(
    fox_team_id = c("11", "12"),
    fox_team_name = c("Las Vegas Aces", "New York Liberty"),
    fox_section = c("WNBA", "WNBA"), stringsAsFactors = FALSE
  )
  out <- .bb_assemble_team_crosswalk_wnba(espn, stats, fox, season = 2024)
  expect_equal(nrow(out), 2)
  expect_equal(out$wnba_team_id[out$espn_team_id == 17L], "1611661319")
  expect_equal(out$fox_team_id[out$espn_team_id == 9L], "12")
  expect_true(all(out$match_method == "exact_name"))
  expect_true("yahoo_team_id" %in% names(out))
  expect_true(all(is.na(out$yahoo_team_id)))
})

test_that(".bb_assemble_schedule_crosswalk_wnba full-outer joins on ET date + teams", {
  team_xwalk <- data.frame(
    espn_team_id = c(17L, 9L), wnba_team_id = c("1611661319", "1611661313"),
    stringsAsFactors = FALSE
  )
  espn_games <- data.frame(
    espn_game_id = "401",
    game_date = as.Date("2024-06-01"),
    espn_home_team_id = 17L, espn_away_team_id = 9L,
    stringsAsFactors = FALSE
  )
  stats_games <- data.frame(
    wnba_game_id = "1002", wnba_game_code = "20240601/NYLLVA",
    game_date = as.Date("2024-06-01"),
    wnba_home_team_id = "1611661319", wnba_away_team_id = "1611661313",
    season_type = "Regular Season",
    stringsAsFactors = FALSE
  )
  out <- .bb_assemble_schedule_crosswalk_wnba(espn_games, stats_games, team_xwalk, season = 2024)
  expect_equal(nrow(out), 1)
  expect_equal(out$espn_game_id, "401")
  expect_equal(out$wnba_game_id, "1002")
  expect_equal(out$match_method, "both")
  expect_true(all(c("fox_game_id", "yahoo_game_id") %in% names(out)))
})
