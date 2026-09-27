test_that("group loaders read the wbb_groups / wnba_groups release assets (offline)", {
  urls <- character()
  local_mocked_bindings(parquet_from_url = function(url) {
    urls <<- c(urls, url)
    data.table::data.table(league = "wbb", group_id = "wbb:sec")
  })

  x <- load_wbb_team_group_seasons(c(2024, 2025))
  expect_s3_class(x, "wehoop_data")
  expect_equal(nrow(x), 2L)
  expect_s3_class(load_wnba_team_group_seasons(2024), "wehoop_data")
  for (f in c(load_wbb_groups, load_wbb_group_seasons, load_wbb_group_aliases,
              load_wnba_groups, load_wnba_group_seasons, load_wnba_group_aliases)) {
    expect_s3_class(f(), "wehoop_data")
  }

  base <- "https://github.com/sportsdataverse/sportsdataverse-data/releases/download/"
  expect_equal(urls, paste0(base, c(
    "wbb_groups/wbb_team_group_seasons_2024.parquet",
    "wbb_groups/wbb_team_group_seasons_2025.parquet",
    "wnba_groups/wnba_team_group_seasons_2024.parquet",
    "wbb_groups/wbb_groups.parquet",
    "wbb_groups/wbb_group_seasons.parquet",
    "wbb_groups/wbb_group_aliases.parquet",
    "wnba_groups/wnba_groups.parquet",
    "wnba_groups/wnba_group_seasons.parquet",
    "wnba_groups/wnba_group_aliases.parquet"
  )))

  urls <- character()
  load_wnba_team_group_seasons(TRUE)
  expect_equal(basename(urls), "wnba_team_group_seasons.parquet")
})

test_that("team_group_seasons loaders validate the seasons argument", {
  expect_error(load_wbb_team_group_seasons(2001))
  expect_error(load_wnba_team_group_seasons(1996))
  expect_error(load_wnba_team_group_seasons("2024"))
  expect_error(load_wnba_team_group_seasons(2024.5))
})

test_that("group loaders return the published wbb_groups / wnba_groups tables", {
  skip_on_cran()
  skip_on_ci()
  skip_load_test()

  x <- load_wbb_team_group_seasons(2025)
  expect_gt(nrow(x), 0)

  expect_s3_class(x, "wehoop_data")
  expect_in(c("season", "team_id", "team_name", "conference_id", "sources_agree"), colnames(x))
  expect_type(x$team_id, "character")
  # Texas and Oklahoma joined the SEC for 2024-25.
  expect_setequal(x$conference_id[x$team_id %in% c("251", "201")], "wbb:sec")
  expect_in(unique(x$conference_id), load_wbb_groups()$group_id)

  w <- load_wnba_team_group_seasons(2024)
  if (nrow(w) == 0) skip("No rows returned at test time -- release may not exist yet")
  expect_setequal(w$conference_id, c("wnba:east", "wnba:west"))
})
