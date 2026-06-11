# Live tests for the Fox Sports (Bifrost) basketball wrappers (NBA + MBB).
# Stable ids captured 2026-06-10: wnba event 2215 / team 1; wcbk event 388986 /
# team 11. Subset-direction column checks; skip-if-empty guards for transient
# API errors + the ephemeral odds market.

test_that("Fox WNBA play-by-play", {
  skip_on_cran()
  x <- fox_wnba_pbp("2215")
  if (is.null(x) || !is.data.frame(x) || nrow(x) == 0) skip("No Fox WNBA pbp at test time")
  expect_in(c("game_id", "period", "play_id", "clock", "play_text", "team"), colnames(x))
  expect_s3_class(x, "data.frame")
  Sys.sleep(1)
})

test_that("Fox WNBA boxscore", {
  skip_on_cran()
  x <- fox_wnba_boxscore("2215")
  if (is.null(x) || !is.data.frame(x) || nrow(x) == 0) skip("No Fox WNBA boxscore at test time")
  expect_in(c("game_id", "team", "stat_group", "player", "stat", "value"), colnames(x))
  Sys.sleep(1)
})

test_that("Fox WNBA team roster", {
  skip_on_cran()
  x <- fox_wnba_team_roster("1")
  if (is.null(x) || !is.data.frame(x) || nrow(x) == 0) skip("No Fox WNBA roster at test time")
  expect_in(c("team_id", "position_group", "player", "athlete_id"), colnames(x))
  Sys.sleep(1)
})

test_that("Fox WNBA standings + leaders + gamelog", {
  skip_on_cran()
  st <- fox_wnba_standings("1")
  if (!is.null(st) && nrow(st) > 0) expect_in(c("team_id", "section", "entity_id"), colnames(st))
  Sys.sleep(1)
  ll <- fox_wnba_league_leaders("scoring")
  if (!is.null(ll) && nrow(ll) > 0) expect_in("entity_id", colnames(ll))
  Sys.sleep(1)
  gl <- fox_wnba_team_gamelog("1")
  if (!is.null(gl) && nrow(gl) > 0) {
    expect_in(c("team_id", "category", "game_id", "stat", "value"), colnames(gl))
  }
  Sys.sleep(1)
})

test_that("Fox WNBA odds (ephemeral market tolerated)", {
  skip_on_cran()
  x <- fox_wnba_odds("2215")
  expect_s3_class(x, "data.frame")
  if (!is.null(x) && nrow(x) > 0) expect_in(c("game_id", "team"), colnames(x))
  Sys.sleep(1)
})

test_that("Fox WBB play-by-play + boxscore + roster", {
  skip_on_cran()
  pb <- fox_wbb_pbp("388986")
  if (is.null(pb) || !is.data.frame(pb) || nrow(pb) == 0) skip("No Fox WBB pbp at test time")
  expect_in(c("game_id", "period", "play_id", "play_text"), colnames(pb))
  Sys.sleep(1)
  bo <- fox_wbb_boxscore("388986")
  if (!is.null(bo) && nrow(bo) > 0) expect_in(c("game_id", "team", "player", "stat", "value"), colnames(bo))
  Sys.sleep(1)
  ro <- fox_wbb_team_roster("11")
  if (!is.null(ro) && nrow(ro) > 0) expect_in(c("team_id", "player", "athlete_id"), colnames(ro))
  Sys.sleep(1)
})
