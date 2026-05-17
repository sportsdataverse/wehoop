# **Load wehoop WNBA Team Season Stats**

`load_wnba_team_stats_manifest()` returns the per-season manifest CSV
(`season`, `row_count`, `generated_at_utc`, `source_endpoint`) for the
team season stats release tag without downloading any season's full
data.

Loads season-level WNBA team statistics scraped from ESPN. One row per
team-season-statistic-grouping. Backed by the `wehoop-wnba-data`
pipeline that reads raw JSONs from `wehoop-wnba-raw` and publishes
parquet/rds artifacts to the `espn_wnba_team_season_stats` release tag.

## Usage

``` r
load_wnba_team_stats_manifest()

load_wnba_team_stats(
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

Other WNBA loader functions:
[`load_wnba_draft_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wnba_draft.md),
[`load_wnba_game_rosters_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wnba_game_rosters.md),
[`load_wnba_officials_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wnba_officials.md),
[`load_wnba_player_stats_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wnba_player_stats.md),
[`load_wnba_rosters_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wnba_rosters.md),
[`load_wnba_shots_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wnba_shots.md),
[`load_wnba_standings_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wnba_standings.md)

## Examples

``` r
# \donttest{
  try(load_wnba_team_stats(seasons = most_recent_wnba_season()))
#> ──────────────────────────────────────────────────────────────── wehoop 3.0.0 ──
#> # A tibble: 675 × 16
#>    season team_id team_slug team_abbreviation team_display_name
#>     <int>   <int> <chr>     <chr>             <chr>            
#>  1   2026      11 NA        PHX               Phoenix Mercury  
#>  2   2026      11 NA        PHX               Phoenix Mercury  
#>  3   2026      11 NA        PHX               Phoenix Mercury  
#>  4   2026      11 NA        PHX               Phoenix Mercury  
#>  5   2026      11 NA        PHX               Phoenix Mercury  
#>  6   2026      11 NA        PHX               Phoenix Mercury  
#>  7   2026      11 NA        PHX               Phoenix Mercury  
#>  8   2026      11 NA        PHX               Phoenix Mercury  
#>  9   2026      11 NA        PHX               Phoenix Mercury  
#> 10   2026      11 NA        PHX               Phoenix Mercury  
#> # ℹ 665 more rows
#> # ℹ 11 more variables: team_short_display_name <chr>, team_color <chr>,
#> #   team_alternate_color <chr>, team_logo <chr>, category <chr>,
#> #   stat_label <chr>, stat_name <chr>, stat_display_name <chr>,
#> #   stat_description <chr>, display_value <chr>, value <dbl>
# }
```
