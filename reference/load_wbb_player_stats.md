# **Load wehoop WBB Player Season Stats**

`load_wbb_player_stats_manifest()` returns the per-season manifest CSV
(`season`, `row_count`, `generated_at_utc`, `source_endpoint`) for the
player season stats release tag without downloading any season's full
data.

Loads season-level player statistics scraped from ESPN. One row per
athlete-team-season-statistic-grouping. Backed by the `wehoop-wbb-data`
pipeline that reads raw JSONs from `wehoop-wbb-raw` and publishes
parquet/rds artifacts to the
`espn_womens_college_basketball_player_season_stats` release tag.

## Usage

``` r
load_wbb_player_stats_manifest()

load_wbb_player_stats(
  seasons = most_recent_wbb_season(),
  ...,
  dbConnection = NULL,
  tablename = NULL
)
```

## Arguments

- seasons:

  A vector of 4-digit years associated with given women's college
  basketball seasons. (Min: 2002)

- ...:

  Additional arguments passed to an underlying function that writes the
  season data into a database.

- dbConnection:

  A `DBIConnection` object, as returned by
  [`DBI::dbConnect()`](https://dbi.r-dbi.org/reference/dbConnect.html)

- tablename:

  The name of the player season stats table within the database

## Value

Returns a `wehoop_data` tibble of player season stats.

## See also

Other WBB loader functions:
[`load_wbb_game_rosters_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wbb_game_rosters.md),
[`load_wbb_officials_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wbb_officials.md),
[`load_wbb_player_core()`](https://wehoop.sportsdataverse.org/reference/load_wbb_player_core.md),
[`load_wbb_rosters_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wbb_rosters.md),
[`load_wbb_shots_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wbb_shots.md),
[`load_wbb_standings_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wbb_standings.md),
[`load_wbb_team_stats_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wbb_team_stats.md)

## Examples

``` r
# \donttest{
  try(load_wbb_player_stats(seasons = most_recent_wbb_season()))
#> ──────────────────────────────────────────────────────────────── wehoop 3.0.0 ──
#> # A tibble: 41,919 × 16
#>    season athlete_id athlete_display_name athlete_first_name athlete_last_name
#>     <int>      <int> <chr>                <chr>              <chr>            
#>  1   2026    4399380 Anna Newman          Anna               Newman           
#>  2   2026    4399380 Anna Newman          Anna               Newman           
#>  3   2026    4399380 Anna Newman          Anna               Newman           
#>  4   2026    4399380 Anna Newman          Anna               Newman           
#>  5   2026    4399380 Anna Newman          Anna               Newman           
#>  6   2026    4399380 Anna Newman          Anna               Newman           
#>  7   2026    4399380 Anna Newman          Anna               Newman           
#>  8   2026    4399380 Anna Newman          Anna               Newman           
#>  9   2026    4399380 Anna Newman          Anna               Newman           
#> 10   2026    4399380 Anna Newman          Anna               Newman           
#> # ℹ 41,909 more rows
#> # ℹ 11 more variables: athlete_position_abbreviation <chr>,
#> #   athlete_jersey <chr>, team_id <int>, team_display_name <chr>,
#> #   category <chr>, stat_label <chr>, stat_name <chr>, stat_display_name <chr>,
#> #   stat_description <chr>, display_value <chr>, value <dbl>
# }
```
