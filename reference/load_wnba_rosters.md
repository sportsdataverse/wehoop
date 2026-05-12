# **Load wehoop WNBA Rosters**

`load_wnba_rosters_manifest()` returns the per-season manifest CSV
(`season`, `row_count`, `generated_at_utc`, `source_endpoint`) for the
rosters release tag without downloading any season's full data.

Loads season-level WNBA team rosters scraped from ESPN. One row per
athlete-team-season triple. Backed by the `wehoop-wnba-data` pipeline
that reads raw JSONs from `wehoop-wnba-raw` and publishes parquet/rds
artifacts to the `espn_wnba_rosters` release tag.

## Usage

``` r
load_wnba_rosters_manifest()

load_wnba_rosters(
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

  The name of the rosters data table within the database

## Value

Returns a `wehoop_data` tibble with one row per athlete-team-season.

## See also

Other WNBA loader functions:
[`load_wnba_draft_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wnba_draft.md),
[`load_wnba_game_rosters_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wnba_game_rosters.md),
[`load_wnba_officials_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wnba_officials.md),
[`load_wnba_player_stats_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wnba_player_stats.md),
[`load_wnba_shots_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wnba_shots.md),
[`load_wnba_standings_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wnba_standings.md),
[`load_wnba_team_stats_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wnba_team_stats.md)

## Examples

``` r
# \donttest{
  try(load_wnba_rosters(seasons = most_recent_wnba_season()))
#> ──────────────────────────────────────────────────────────────── wehoop 3.0.0 ──
#> # A tibble: 208 × 36
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
#> # ℹ 198 more rows
#> # ℹ 31 more variables: team_short_display_name <chr>, team_color <chr>,
#> #   team_alternate_color <chr>, team_logo <chr>, athlete_id <chr>, uid <chr>,
#> #   guid <chr>, full_name <chr>, display_name <chr>, short_name <chr>,
#> #   first_name <chr>, last_name <chr>, jersey <chr>,
#> #   position_abbreviation <chr>, position_name <chr>, position_id <chr>,
#> #   height <chr>, weight <chr>, age <chr>, date_of_birth <chr>, …
# }
```
