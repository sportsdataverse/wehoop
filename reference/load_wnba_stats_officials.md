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

  A vector of 4-digit years associated with given WNBA seasons.
  Published coverage runs 2004 through the most recent season, with no
  gaps. 2004 is an enforced floor: `boxscoresummaryv2` does return an
  `Officials` block for a handful of pre-2004 games, but only 1-2 games
  per season are covered (e.g. 2/158 games in one season), so those
  fragments are deliberately not published. Pass `seasons = TRUE` for
  every published season. (Min: 2004)

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

|             |           |                                       |
|-------------|-----------|---------------------------------------|
| col_name    | types     | description                           |
| official_id | integer   | Unique official / referee identifier. |
| first_name  | character | Official's first name.                |
| last_name   | character | Official's last name.                 |
| jersey_num  | character | Jersey number worn by the official.   |
| season      | integer   | Season identifier (4-digit year).     |
| game_id     | character | Unique game identifier.               |

## See also

Other WNBA Stats loader functions:
[`load_wnba_stats_coaches()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_coaches.md),
[`load_wnba_stats_draft()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_draft.md),
[`load_wnba_stats_game_rosters()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_game_rosters.md),
[`load_wnba_stats_leaguedash()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_leaguedash.md),
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
#> # A tibble: 606 × 6
#>    official_id first_name last_name        jersey_num season game_id   
#>          <int> <chr>      <chr>            <chr>       <int> <chr>     
#>  1      100274 Roy        Gulbeyan         "42  "       2026 1022600001
#>  2     1628169 Ryan       Sassano          "3   "       2026 1022600001
#>  3     1628482 Tyler      Mirkovich        "27  "       2026 1022600001
#>  4      202764 Charles    Watson           "6   "       2026 1022600002
#>  5      203891 Fatou      Cissoko-Stephens "15  "       2026 1022600002
#>  6     1629422 Clare      Simmons          "28  "       2026 1022600002
#>  7      200667 Angelica   Suffren          "7   "       2026 1022600003
#>  8     1641525 Sarah      Williams         "44  "       2026 1022600003
#>  9     1642142 Josh       Reed             "46  "       2026 1022600003
#> 10      202297 Tim        Greene           "9   "       2026 1022600004
#> # ℹ 596 more rows
# }
```
