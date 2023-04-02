test_that("WNBA Draft Board", {
  skip_on_cran()
  skip_on_ci()
  x <- wnba_draftboard(season = most_recent_wnba_season() - 1)
  
  cols_x1 <- c(
    "id",
    "external-id",
    "slug",
    "name",
    "city",
    "state",
    "url",
    "primarycolor",
    "seconarycolor"
  )
  
  cols_x2 <- c(
    "draft_status",
    "draft_modified",
    "draft_title",
    "draft_show_players",
    "draft_id",
    "draft_url",
    "draft_location",
    "sponsor_logo",
    "header_image",
    "sponsor_link",
    "draft_date",
    "draft_time_hh",
    "draft_time_mm",
    "draft_time_am",
    "draft_time_tz",
    "draft_round_1_channel",
    "draft_round_2_channel",
    "draft_round_3_channel",
    "draft_interval"
  )
  cols_x3 <- c(
    "team",
    "details",
    "player_name",
    "player_id",
    "player_college",
    "player_position",
    "player_ppg",
    "player_rpg",
    "player_apg",
    "player_fg",
    "player_headshot",
    "player_url",
    "round"
  )
  
  expect_equal(sort(colnames(x[[1]])), sort(cols_x1))
  expect_s3_class(x[[1]], "data.frame")
  expect_equal(sort(colnames(x[[2]])), sort(cols_x2))
  expect_s3_class(x[[2]], "data.frame")
  expect_equal(sort(colnames(x[[3]])), sort(cols_x3))
  expect_s3_class(x[[3]], "data.frame")
  
  Sys.sleep(3)
})
 