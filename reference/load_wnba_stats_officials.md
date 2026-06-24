# **Load wehoop WNBA Stats Officials**

Loads game-level officials data scraped from the WNBA Stats API
(`boxscoresummaryv2`-style outputs). One row per official-game pair.
Backed by the `wehoop-wnba-stats-data` pipeline that reads raw JSONs
from `wehoop-wnba-stats-raw` and publishes parquet/rds artifacts to the
`wnba_stats_officials` release tag.

`load_wnba_stats_officials_manifest()` returns the per-season manifest
CSV (`season`, `row_count`, `generated_at_utc`, `source_endpoint`) for
the WNBA Stats officials release tag without downloading any season's
full data.

## Usage

``` r
load_wnba_stats_officials(
  seasons = most_recent_wnba_stats_season(),
  ...,
  dbConnection = NULL,
  tablename = NULL
)

load_wnba_stats_officials_manifest()
```

## Arguments

- seasons:

  A vector of 4-digit years associated with given WNBA seasons. (Min:
  1997)

- ...:

  Additional arguments passed to an underlying function that writes the
  season data into a database.

- dbConnection:

  A `DBIConnection` object, as returned by
  [`DBI::dbConnect()`](https://dbi.r-dbi.org/reference/dbConnect.html)

- tablename:

  The name of the officials data table within the database

## Value

Returns a `wehoop_data` tibble with one row per official-game pair.

|  |  |  |
|----|----|----|
| col_name | types | description |
| season | integer | Season identifier (4-digit year or 'YYYY-YY' string). |
| game_id | character | Unique game identifier. |
| official_id | character | Unique official / referee identifier. |
| display_name | character | Display name. |
| first_name | character | Player's first name. |
| last_name | character | Player's last name. |
| jersey_num | character | Jersey number worn by the player. |

## See also

Other WNBA Stats loader functions:
[`load_wnba_stats_coaches()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_coaches.md),
[`load_wnba_stats_draft()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_draft.md),
[`load_wnba_stats_game_rosters()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_game_rosters.md),
[`load_wnba_stats_lineups()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_lineups.md),
[`load_wnba_stats_pbp()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_pbp.md),
[`load_wnba_stats_player_game_logs()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_player_game_logs.md),
[`load_wnba_stats_player_stats()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_player_stats.md),
[`load_wnba_stats_rosters()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_rosters.md),
[`load_wnba_stats_schedule()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_schedule.md),
[`load_wnba_stats_shots()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_shots.md),
[`load_wnba_stats_standings()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_standings.md),
[`load_wnba_stats_team_stats()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_team_stats.md)

## Examples

``` r
# \donttest{
  try(load_wnba_stats_officials(seasons = most_recent_wnba_stats_season()))
#> ──────────────────────────────────────────────────────────────── wehoop 3.0.0 ──
#> # A tibble: 378 × 6
#>    official_id first_name last_name        jersey_num game_id    season
#>    <chr>       <chr>      <chr>            <chr>      <chr>       <int>
#>  1 202764      Charles    Watson           "6   "     1022600002   2026
#>  2 203891      Fatou      Cissoko-Stephens "15  "     1022600002   2026
#>  3 1629422     Clare      Simmons          "28  "     1022600002   2026
#>  4 100274      Roy        Gulbeyan         "42  "     1022600001   2026
#>  5 1628169     Ryan       Sassano          "3   "     1022600001   2026
#>  6 1628482     Tyler      Mirkovich        "27  "     1022600001   2026
#>  7 200667      Angelica   Suffren          "7   "     1022600003   2026
#>  8 1641525     Sarah      Williams         "44  "     1022600003   2026
#>  9 1642142     Josh       Reed             "46  "     1022600003   2026
#> 10 201538      Maj        Forsberg         "34  "     1022600005   2026
#> # ℹ 368 more rows
# }
```
