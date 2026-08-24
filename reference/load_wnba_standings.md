# **Load wehoop WNBA Standings**

`load_wnba_standings_manifest()` returns the per-season manifest CSV
(`season`, `row_count`, `generated_at_utc`, `source_endpoint`) for the
standings release tag without downloading any season's full data.

Loads season-level WNBA standings scraped from ESPN. One row per
team-season. Backed by the `wehoop-wnba-data` pipeline that reads raw
JSONs from `wehoop-wnba-raw` and publishes parquet/rds artifacts to the
`espn_wnba_standings` release tag.

## Usage

``` r
load_wnba_standings_manifest()

load_wnba_standings(
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

  The name of the standings data table within the database

## Value

Returns a `wehoop_data` tibble of team standings.

Columns as documented in the shared
[basketball_load_wbb_standings_schema](https://wehoop.sportsdataverse.org/reference/basketball_load_wbb_standings_schema.md)
table.

## See also

Other WNBA loader functions:
[`load_wnba_draft_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wnba_draft.md),
[`load_wnba_game_rosters_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wnba_game_rosters.md),
[`load_wnba_officials_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wnba_officials.md),
[`load_wnba_player_core()`](https://wehoop.sportsdataverse.org/reference/load_wnba_player_core.md),
[`load_wnba_player_stats_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wnba_player_stats.md),
[`load_wnba_rosters_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wnba_rosters.md),
[`load_wnba_shots_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wnba_shots.md),
[`load_wnba_team_stats_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wnba_team_stats.md)

## Examples

``` r
# \donttest{
  try(load_wnba_standings(seasons = most_recent_wnba_season()))
#> ──────────────────────────────────────────────────────────────── wehoop 3.0.0 ──
#> # A tibble: 343 × 24
#>    season group_id group_name        group_abbreviation group_short_name team_id
#>     <int> <chr>    <chr>             <chr>              <chr>              <int>
#>  1   2026 1        Eastern Conferen… E                  NA                    20
#>  2   2026 1        Eastern Conferen… E                  NA                    20
#>  3   2026 1        Eastern Conferen… E                  NA                    20
#>  4   2026 1        Eastern Conferen… E                  NA                    20
#>  5   2026 1        Eastern Conferen… E                  NA                    20
#>  6   2026 1        Eastern Conferen… E                  NA                    20
#>  7   2026 1        Eastern Conferen… E                  NA                    20
#>  8   2026 1        Eastern Conferen… E                  NA                    20
#>  9   2026 1        Eastern Conferen… E                  NA                    20
#> 10   2026 1        Eastern Conferen… E                  NA                    20
#> # ℹ 333 more rows
#> # ℹ 18 more variables: team_uid <chr>, team_slug <chr>, team_location <chr>,
#> #   team_name <chr>, team_abbreviation <chr>, team_display_name <chr>,
#> #   team_short_display_name <chr>, team_color <chr>,
#> #   team_alternate_color <chr>, team_logo <chr>, stat_name <chr>,
#> #   stat_display_name <chr>, stat_short_display_name <chr>,
#> #   stat_description <chr>, stat_abbreviation <chr>, stat_type <chr>, …
# }
```
