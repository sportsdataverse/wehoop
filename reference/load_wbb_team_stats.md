# **Load wehoop WBB Team Season Stats**

`load_wbb_team_stats_manifest()` returns the per-season manifest CSV
(`season`, `row_count`, `generated_at_utc`, `source_endpoint`) for the
team season stats release tag without downloading any season's full
data.

Loads season-level team statistics scraped from ESPN. One row per
team-season-statistic-grouping. Backed by the `wehoop-wbb-data` pipeline
that reads raw JSONs from `wehoop-wbb-raw` and publishes parquet/rds
artifacts to the `espn_womens_college_basketball_team_season_stats`
release tag.

## Usage

``` r
load_wbb_team_stats_manifest()

load_wbb_team_stats(
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

  The name of the team season stats table within the database

## Value

Returns a `wehoop_data` tibble of team season stats.

|  |  |  |
|----|----|----|
| col_name | types | description |
| season | integer | Season identifier (4-digit year or 'YYYY-YY' string). |
| season_type | integer | Season type (1=pre-season, 2=regular season, 3=postseason, 4=off-season for ESPN; or string label for WNBA Stats). |
| team_id | character | Unique team identifier. |
| team_slug | character | URL-safe team identifier (e.g. 'lasvegas-aces' / 'aces'). |
| team_location | character | Team city or location string. |
| team_name | character | Full team display name (e.g. 'Las Vegas Aces'). |
| team_abbreviation | character | Short team abbreviation (e.g. 'LAS'). |
| team_display_name | character | Full team display name. |
| category | character | Category label. |
| stat_name | character | Stat name. |
| stat_display_name | character | Stat display name. |
| stat_value | numeric | Stat value. |
| stat_display_value | character | Stat display value. |
| stat_rank | integer | League/season rank for stat. |

## See also

Other WBB loader functions:
[`load_wbb_game_rosters_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wbb_game_rosters.md),
[`load_wbb_officials_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wbb_officials.md),
[`load_wbb_player_stats_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wbb_player_stats.md),
[`load_wbb_rosters_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wbb_rosters.md),
[`load_wbb_shots_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wbb_shots.md),
[`load_wbb_standings_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wbb_standings.md)

## Examples

``` r
# \donttest{
  try(load_wbb_team_stats(seasons = most_recent_wbb_season()))
#> ──────────────────────────────────────────────────────────────── wehoop 3.0.0 ──
#> # A tibble: 25,740 × 16
#>    season team_id team_slug team_abbreviation team_display_name         
#>     <int>   <int> <chr>     <chr>             <chr>                     
#>  1   2026       1 NA        UAA               Alaska Anchorage Seawolves
#>  2   2026       1 NA        UAA               Alaska Anchorage Seawolves
#>  3   2026       1 NA        UAA               Alaska Anchorage Seawolves
#>  4   2026       1 NA        UAA               Alaska Anchorage Seawolves
#>  5   2026       1 NA        UAA               Alaska Anchorage Seawolves
#>  6   2026       1 NA        UAA               Alaska Anchorage Seawolves
#>  7   2026       1 NA        UAA               Alaska Anchorage Seawolves
#>  8   2026       1 NA        UAA               Alaska Anchorage Seawolves
#>  9   2026       1 NA        UAA               Alaska Anchorage Seawolves
#> 10   2026       1 NA        UAA               Alaska Anchorage Seawolves
#> # ℹ 25,730 more rows
#> # ℹ 11 more variables: team_short_display_name <chr>, team_color <chr>,
#> #   team_alternate_color <chr>, team_logo <chr>, category <chr>,
#> #   stat_label <chr>, stat_name <chr>, stat_display_name <chr>,
#> #   stat_description <chr>, display_value <chr>, value <dbl>
# }
```
