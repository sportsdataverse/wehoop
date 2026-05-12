# **Load wehoop WNBA Player Season Stats**

`load_wnba_player_stats_manifest()` returns the per-season manifest CSV
(`season`, `row_count`, `generated_at_utc`, `source_endpoint`) for the
player season stats release tag without downloading any season's full
data.

Loads season-level WNBA player statistics scraped from ESPN. One row per
athlete-team-season-statistic-grouping. Backed by the `wehoop-wnba-data`
pipeline that reads raw JSONs from `wehoop-wnba-raw` and publishes
parquet/rds artifacts to the `espn_wnba_player_season_stats` release
tag.

## Usage

``` r
load_wnba_player_stats_manifest()

load_wnba_player_stats(
  seasons = most_recent_wnba_season(),
  ...,
  dbConnection = NULL,
  tablename = NULL
)
```

## Arguments

- seasons:

  A vector of 4-digit years associated with given WNBA seasons. (Min:
  2002)

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

Other WNBA loader functions:
[`load_wnba_draft_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wnba_draft.md),
[`load_wnba_game_rosters_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wnba_game_rosters.md),
[`load_wnba_officials_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wnba_officials.md),
[`load_wnba_rosters_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wnba_rosters.md),
[`load_wnba_shots_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wnba_shots.md),
[`load_wnba_standings_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wnba_standings.md),
[`load_wnba_team_stats_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wnba_team_stats.md)

## Examples

``` r
# \donttest{
  try(load_wnba_player_stats(seasons = most_recent_wnba_season()))
#> ──────────────────────────────────────────────────────────────── wehoop 3.0.0 ──
#> # A tibble: 8,080 × 16
#>    season athlete_id athlete_display_name athlete_first_name athlete_last_name
#>     <int>      <int> <chr>                <chr>              <chr>            
#>  1   2026       1054 Tiffany Hayes        Tiffany            Hayes            
#>  2   2026       1054 Tiffany Hayes        Tiffany            Hayes            
#>  3   2026       1054 Tiffany Hayes        Tiffany            Hayes            
#>  4   2026       1054 Tiffany Hayes        Tiffany            Hayes            
#>  5   2026       1054 Tiffany Hayes        Tiffany            Hayes            
#>  6   2026       1054 Tiffany Hayes        Tiffany            Hayes            
#>  7   2026       1054 Tiffany Hayes        Tiffany            Hayes            
#>  8   2026       1054 Tiffany Hayes        Tiffany            Hayes            
#>  9   2026       1054 Tiffany Hayes        Tiffany            Hayes            
#> 10   2026       1054 Tiffany Hayes        Tiffany            Hayes            
#> # ℹ 8,070 more rows
#> # ℹ 11 more variables: athlete_position_abbreviation <chr>,
#> #   athlete_jersey <chr>, team_id <int>, team_display_name <chr>,
#> #   category <chr>, stat_label <chr>, stat_name <chr>, stat_display_name <chr>,
#> #   stat_description <chr>, display_value <chr>, value <dbl>
# }
```
