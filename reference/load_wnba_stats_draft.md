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
  (Min: 1997)

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
| person_id | character | Unique player identifier (V3 endpoints). |
| player_name | character | Player name. |
| round_number | integer | Numeric round. |
| round_pick | integer | Round pick. |
| overall_pick | integer | Overall pick. |
| team_id | character | Unique team identifier. |
| team_city | character | Team city or region (e.g. 'Las Vegas'). |
| team_name | character | Full team display name (e.g. 'Las Vegas Aces'). |
| team_abbreviation | character | Short team abbreviation (e.g. 'LAS'). |
| organization | character | Organization. |
| organization_type | character | Organization type. |
| player_profile_flag | character | Player profile flag. |

## See also

Other WNBA Stats loader functions:
[`load_wnba_stats_coaches()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_coaches.md),
[`load_wnba_stats_game_rosters()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_game_rosters.md),
[`load_wnba_stats_lineups()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_lineups.md),
[`load_wnba_stats_officials()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_officials.md),
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
  try(load_wnba_stats_draft(seasons = most_recent_wnba_stats_season()))
#> ──────────────────────────────────────────────────────────────── wehoop 3.0.0 ──
#> # A tibble: 45 × 15
#>    person_id player_name  season round_number round_pick overall_pick draft_type
#>    <chr>     <chr>         <int> <chr>        <chr>      <chr>        <chr>     
#>  1 257829    Azzi Fudd      2026 1            1          1            Draft     
#>  2 257831    Olivia Miles   2026 1            2          2            Draft     
#>  3 257826    Awa Fam Thi…   2026 1            3          3            Draft     
#>  4 257833    Lauren Betts   2026 1            4          4            Draft     
#>  5 257920    Gabriela Ja…   2026 1            5          5            Draft     
#>  6 257922    Kiki Rice      2026 1            6          6            Draft     
#>  7 257918    Iyana Martí…   2026 1            7          7            Draft     
#>  8 257840    Flau'jae Jo…   2026 1            8          8            Draft     
#>  9 257964    Angela Duga…   2026 1            9          9            Draft     
#> 10 257844    Raven Johns…   2026 1            10         10           Draft     
#> # ℹ 35 more rows
#> # ℹ 8 more variables: team_id <chr>, team_city <chr>, team_name <chr>,
#> #   team_abbreviation <chr>, organization <chr>, organization_type <chr>,
#> #   player_profile_flag <chr>, season_2 <int>
# }
```
