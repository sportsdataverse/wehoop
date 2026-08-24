# **Load wehoop WBB Game Rosters**

`load_wbb_game_rosters_manifest()` returns the per-season manifest CSV
(`season`, `row_count`, `generated_at_utc`, `source_endpoint`) for the
game rosters release tag without downloading any season's full data.

Loads per-game rosters scraped from ESPN women's college basketball box
scores. One row per athlete-team-game triple, with athlete identifiers,
jersey, position, starter flag, and DNP status. Backed by the
`wehoop-wbb-data` pipeline that reads raw JSONs from `wehoop-wbb-raw`
and publishes parquet/rds artifacts to the
`espn_womens_college_basketball_game_rosters` release tag.

## Usage

``` r
load_wbb_game_rosters_manifest()

load_wbb_game_rosters(
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

  The name of the game rosters data table within the database

## Value

Returns a `wehoop_data` tibble with one row per athlete-team-game.

|  |  |  |
|----|----|----|
| col_name | types | description |
| game_id | character | Unique game identifier. |
| season | integer | Season identifier (4-digit year or 'YYYY-YY' string). |
| team_id | character | Unique team identifier. |
| athlete_id | character | Unique athlete identifier (ESPN). |
| athlete_display_name | character | Athlete display name (full). |
| athlete_position | character | Athlete position. |
| athlete_jersey | character | Athlete jersey number. |
| starter | logical | TRUE if the player was in the starting lineup; FALSE otherwise. |
| did_not_play | logical | TRUE if the player did not appear in the game. |

## See also

Other WBB loader functions:
[`load_wbb_officials_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wbb_officials.md),
[`load_wbb_player_core()`](https://wehoop.sportsdataverse.org/reference/load_wbb_player_core.md),
[`load_wbb_player_stats_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wbb_player_stats.md),
[`load_wbb_rosters_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wbb_rosters.md),
[`load_wbb_shots_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wbb_shots.md),
[`load_wbb_standings_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wbb_standings.md),
[`load_wbb_team_stats_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wbb_team_stats.md)

## Examples

``` r
# \donttest{
  try(load_wbb_game_rosters(seasons = most_recent_wbb_season()))
#> ──────────────────────────────────────────────────────────────── wehoop 3.0.0 ──
#> # A tibble: 168,228 × 22
#>    season   game_id team_id team_slug        team_abbreviation team_display_name
#>     <int>     <int>   <int> <chr>            <chr>             <chr>            
#>  1   2026 401811123    2253 grand-canyon-lo… GCU               Grand Canyon Lop…
#>  2   2026 401811123    2253 grand-canyon-lo… GCU               Grand Canyon Lop…
#>  3   2026 401811123    2253 grand-canyon-lo… GCU               Grand Canyon Lop…
#>  4   2026 401811123    2253 grand-canyon-lo… GCU               Grand Canyon Lop…
#>  5   2026 401811123    2253 grand-canyon-lo… GCU               Grand Canyon Lop…
#>  6   2026 401811123    2253 grand-canyon-lo… GCU               Grand Canyon Lop…
#>  7   2026 401811123    2253 grand-canyon-lo… GCU               Grand Canyon Lop…
#>  8   2026 401811123    2253 grand-canyon-lo… GCU               Grand Canyon Lop…
#>  9   2026 401811123    2253 grand-canyon-lo… GCU               Grand Canyon Lop…
#> 10   2026 401811123    2253 grand-canyon-lo… GCU               Grand Canyon Lop…
#> # ℹ 168,218 more rows
#> # ℹ 16 more variables: home_away <chr>, athlete_id <int>, athlete_uid <chr>,
#> #   athlete_guid <chr>, athlete_display_name <chr>, athlete_short_name <chr>,
#> #   athlete_first_name <chr>, athlete_last_name <chr>, athlete_jersey <chr>,
#> #   athlete_position <chr>, athlete_headshot <chr>, starter <lgl>,
#> #   did_not_play <lgl>, active <lgl>, ejected <lgl>, reason <chr>
# }
```
