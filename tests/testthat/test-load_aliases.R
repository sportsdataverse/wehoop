test_that("alias loaders read the wbb_groups / wnba_groups release assets (offline)", {
  urls <- character()
  local_mocked_bindings(parquet_from_url = function(url) {
    urls <<- c(urls, url)
    data.table::data.table(league = "wbb", team_id = "150")
  })

  for (f in c(load_wbb_team_aliases, load_wbb_player_aliases,
              load_wnba_team_aliases, load_wnba_player_aliases)) {
    expect_s3_class(f(), "wehoop_data")
  }

  base <- "https://github.com/sportsdataverse/sportsdataverse-data/releases/download/"
  expect_equal(urls, paste0(base, c(
    "wbb_groups/wbb_team_aliases.parquet",
    "wbb_groups/wbb_player_aliases.parquet",
    "wnba_groups/wnba_team_aliases.parquet",
    "wnba_groups/wnba_player_aliases.parquet"
  )))
})

test_that("alias loaders return the published wbb_groups / wnba_groups tables", {
  skip_on_cran()
  skip_on_ci()
  skip_load_test()

  t <- load_wnba_team_aliases()
  expect_s3_class(t, "wehoop_data")
  expect_gt(nrow(t), 0)
  expect_in(c("team_id", "source", "source_id", "id_kind", "name_kind", "value",
              "valid_from", "valid_to", "match_method"), colnames(t))
  expect_type(t$team_id, "character")
  expect_type(t$source_id, "character")
  # WNBA Stats team id 1611661325 is the Indiana Fever, ESPN team 5.
  expect_equal(unique(t$team_id[t$source == "wnba_stats" & t$source_id == "1611661325"]), "5")

  p <- load_wbb_player_aliases()
  expect_s3_class(p, "wehoop_data")
  expect_gt(nrow(p), 0)
  expect_in(c("athlete_id", "source", "source_player_id", "team_id",
              "valid_from", "valid_to", "match_method", "match_confidence"), colnames(p))
  expect_type(p$athlete_id, "character")
  expect_in("ncaa", p$source)
})
