# **Load wehoop WNBA Stats Draft**

Loads season-level WNBA draft picks scraped from the WNBA Stats API
(`drafthistory`-style outputs). One row per pick. Backed by the
`wehoop-wnba-stats-data` pipeline that reads raw JSONs from
`wehoop-wnba-stats-raw` and publishes parquet/rds artifacts to the
`wnba_stats_draft` release tag.

`load_wnba_stats_draft_manifest()` returns the per-season manifest CSV
(`season`, `row_count`, `generated_at_utc`, `source_endpoint`) for the
WNBA Stats draft release tag without downloading any season's full data.

## Usage

``` r
load_wnba_stats_draft(
  seasons = most_recent_wnba_stats_season(),
  ...,
  dbConnection = NULL,
  tablename = NULL
)

load_wnba_stats_draft_manifest()
```

## Arguments

- seasons:

  A vector of 4-digit years associated with given WNBA draft seasons.
  Published coverage runs 1997 through the most recent season, with no
  gaps. Pass `seasons = TRUE` for every published season. (Min: 1997)

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
| person_id | integer | Unique player identifier (V3 endpoints). |
| player_name | character | Player name. |
| season | integer | Season identifier (4-digit year). |
| round_number | integer | Numeric round. |
| round_pick | integer | Round pick. |
| overall_pick | integer | Overall pick. |
| draft_type | character | Draft type ('Draft', 'Allocation' or 'Elite'). |
| team_id | integer | Unique team identifier. |
| team_city | character | Team city or region (e.g. 'Las Vegas'). |
| team_name | character | Full team display name (e.g. 'Las Vegas Aces'). |
| team_abbreviation | character | Short team abbreviation (e.g. 'LAS'). |
| organization | character | Organization. |
| organization_type | character | Organization type. |
| player_profile_flag | integer | Player profile flag. |

## See also

Other WNBA Stats loader functions:
[`load_wnba_stats_coaches()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_coaches.md),
[`load_wnba_stats_game_rosters()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_game_rosters.md),
[`load_wnba_stats_leaguedash()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_leaguedash.md),
[`load_wnba_stats_lineups()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_lineups.md),
[`load_wnba_stats_officials()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_officials.md),
[`load_wnba_stats_pbp()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_pbp.md),
[`load_wnba_stats_player_game_logs()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_player_game_logs.md),
[`load_wnba_stats_player_stats()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_player_stats.md),
[`load_wnba_stats_possessions()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_possessions.md),
[`load_wnba_stats_rosters()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_rosters.md),
[`load_wnba_stats_schedule()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_schedule.md),
[`load_wnba_stats_shots()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_shots.md),
[`load_wnba_stats_standings()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_standings.md),
[`load_wnba_stats_team_stats()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_team_stats.md)

## Examples

``` r
# \donttest{
  try(load_wnba_stats_draft(seasons = most_recent_wnba_stats_season()))
#> ──────────────────────────────────────────────────────────────── wehoop 3.0.0 ──
#> # A tibble: 45 × 14
#>    person_id player_name  season round_number round_pick overall_pick draft_type
#>        <int> <chr>         <int>        <int>      <int>        <int> <chr>     
#>  1   1643425 Azzi Fudd      2026            1          1            1 Draft     
#>  2   1643426 Olivia Miles   2026            1          2            2 Draft     
#>  3   1643443 Awa Fam        2026            1          3            3 Draft     
#>  4   1643427 Lauren Betts   2026            1          4            4 Draft     
#>  5   1643447 Gabriela Ja…   2026            1          5            5 Draft     
#>  6   1643445 Kiki Rice      2026            1          6            6 Draft     
#>  7   1643446 Iyana Martin   2026            1          7            7 Draft     
#>  8   1643428 Flau'jae Jo…   2026            1          8            8 Draft     
#>  9   1643455 Angela Duga…   2026            1          9            9 Draft     
#> 10   1643433 Raven Johns…   2026            1         10           10 Draft     
#> # ℹ 35 more rows
#> # ℹ 7 more variables: team_id <int>, team_city <chr>, team_name <chr>,
#> #   team_abbreviation <chr>, organization <chr>, organization_type <chr>,
#> #   player_profile_flag <int>
# }
```
