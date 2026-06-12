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
