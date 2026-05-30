# **Load wehoop WNBA Draft**

`load_wnba_draft_manifest()` returns the per-season manifest CSV
(`season`, `row_count`, `generated_at_utc`, `source_endpoint`) for the
draft release tag without downloading any season's full data.

Loads season-level WNBA draft picks scraped from ESPN. One row per pick.
Backed by the `wehoop-wnba-data` pipeline that reads raw JSONs from
`wehoop-wnba-raw` and publishes parquet/rds artifacts to the
`espn_wnba_draft` release tag.

## Usage

``` r
load_wnba_draft_manifest()

load_wnba_draft(
  seasons = most_recent_wnba_season(),
  ...,
  dbConnection = NULL,
  tablename = NULL
)
```

## Arguments

- seasons:

  A vector of 4-digit years associated with given WNBA draft seasons.
  (Min: 2002)

- ...:

  Additional arguments passed to an underlying function that writes the
  season data into a database.

- dbConnection:

  A `DBIConnection` object, as returned by
  [`DBI::dbConnect()`](https://dbi.r-dbi.org/reference/dbConnect.html)

- tablename:

  The name of the draft data table within the database

## Value

Returns a `wehoop_data` tibble of WNBA draft picks.

|  |  |  |
|----|----|----|
| col_name | types | description |
| season | integer | Season identifier (4-digit year or 'YYYY-YY' string). |
| round | integer | Tournament / playoff round. |
| pick | integer | Pick. |
| overall | integer | Overall. |
| team_id | character | Unique team identifier. |
| team_display_name | character | Full team display name. |
| athlete_id | character | Unique athlete identifier (ESPN). |
| athlete_display_name | character | Athlete display name (full). |
| athlete_position | character | Athlete position. |
| college_id | character | Unique identifier for college. |
| college_name | character | College name. |

## See also

Other WNBA loader functions:
[`load_wnba_game_rosters_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wnba_game_rosters.md),
[`load_wnba_officials_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wnba_officials.md),
[`load_wnba_player_stats_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wnba_player_stats.md),
[`load_wnba_rosters_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wnba_rosters.md),
[`load_wnba_shots_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wnba_shots.md),
[`load_wnba_standings_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wnba_standings.md),
[`load_wnba_team_stats_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wnba_team_stats.md)

## Examples

``` r
# \donttest{
  try(load_wnba_draft(seasons = most_recent_wnba_season()))
#> ──────────────────────────────────────────────────────────────── wehoop 3.0.0 ──
#> # A tibble: 45 × 35
#>    season round round_display_name  pick overall_pick pick_traded pick_notes
#>     <int> <int> <chr>              <int>        <int> <chr>       <chr>     
#>  1   2026     1 NA                     1            1 FALSE       NA        
#>  2   2026     1 NA                     2            2 TRUE        NA        
#>  3   2026     1 NA                     3            3 TRUE        NA        
#>  4   2026     1 NA                     4            4 FALSE       NA        
#>  5   2026     1 NA                     5            5 TRUE        NA        
#>  6   2026     1 NA                     6            6 FALSE       NA        
#>  7   2026     1 NA                     7            7 FALSE       NA        
#>  8   2026     1 NA                     8            8 TRUE        NA        
#>  9   2026     1 NA                     9            9 TRUE        NA        
#> 10   2026     1 NA                    10           10 FALSE       NA        
#> # ℹ 35 more rows
#> # ℹ 28 more variables: athlete_id <int>, athlete_uid <chr>, athlete_guid <chr>,
#> #   athlete_first_name <chr>, athlete_last_name <chr>, athlete_full_name <chr>,
#> #   athlete_display_name <chr>, athlete_short_name <chr>, athlete_height <chr>,
#> #   athlete_weight <chr>, athlete_position_abbreviation <chr>,
#> #   athlete_position_name <chr>, athlete_headshot_href <chr>, college_id <int>,
#> #   college_name <chr>, college_short_name <chr>, college_abbreviation <chr>, …
# }
```
