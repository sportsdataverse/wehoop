test_that(".bb_assemble_team_crosswalk_wnba joins ESPN/Stats/Fox on espn_team_id", {
  skip_on_cran()
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
  skip_on_cran()
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

test_that(".bb_assemble_player_crosswalk_wnba matches ESPN/Stats within team blocks", {
  skip_on_cran()
  espn <- data.frame(
    espn_team_id = c(17L, 17L), team_abbreviation = c("LV", "LV"),
    espn_athlete_id = c("a1", "a2"),
    espn_full_name = c("A'ja Wilson", "Chelsea Gray"),
    espn_jersey = c("22", "12"), espn_position = c("F", "G"),
    espn_birth_date = c("1996-08-08", "1992-10-08"),
    stringsAsFactors = FALSE
  )
  stats <- data.frame(
    espn_team_id = c(17L, 17L),
    wnba_player_id = c("p1", "p2"),
    wnba_player_name = c("Aja Wilson", "Chelsea Gray"),
    wnba_jersey_num = c("22", "12"), wnba_position = c("F", "G"),
    wnba_birth_date = c("1996-08-08", "1992-10-08"),
    stringsAsFactors = FALSE
  )
  fox <- data.frame(
    espn_team_id = integer(), fox_athlete_id = character(),
    fox_player = character(), fox_jersey = character(),
    fox_position_group = character(), stringsAsFactors = FALSE
  )
  out <- .bb_assemble_player_crosswalk_wnba(espn, stats, fox, season = 2024, min_confidence = 0.92)
  expect_equal(nrow(out), 2)
  expect_equal(out$wnba_player_id[out$espn_athlete_id == "a1"], "p1")
  expect_equal(out$wnba_player_id[out$espn_athlete_id == "a2"], "p2")
  expect_true(all(c("fox_athlete_id", "yahoo_player_id") %in% names(out)))
})
