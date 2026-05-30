# **Load wehoop WNBA Stats Coaches**

Loads season-level WNBA coaching staff data scraped from the WNBA Stats
API. One row per coach-team-season triple. Backed by the
`wehoop-wnba-stats-data` pipeline that reads raw JSONs from
`wehoop-wnba-stats-raw` and publishes parquet/rds artifacts to the
`wnba_stats_coaches` release tag.

`load_wnba_stats_coaches_manifest()` returns the per-season manifest CSV
(`season`, `row_count`, `generated_at_utc`, `source_endpoint`) for the
WNBA Stats coaches release tag without downloading any season's full
data.

## Usage

``` r
load_wnba_stats_coaches(
  seasons = most_recent_wnba_stats_season(),
  ...,
  dbConnection = NULL,
  tablename = NULL
)

load_wnba_stats_coaches_manifest()
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

  The name of the coaches data table within the database

## Value

Returns a `wehoop_data` tibble with one row per coach-team-season.

## See also

Other WNBA Stats loader functions:
[`load_wnba_stats_draft()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_draft.md),
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
  try(load_wnba_stats_coaches(seasons = most_recent_wnba_stats_season()))
#> ──────────────────────────────────────────────────────────────── wehoop 3.0.0 ──
#> # A tibble: 91 × 12
#>    team_id    season coach_id first_name last_name   coach_name     is_assistant
#>    <chr>       <int> <chr>    <chr>      <chr>       <chr>          <chr>       
#>  1 1611661317   2026 202891   Nate       Tibbetts    Nate Tibbetts  1           
#>  2 1611661317   2026 201911   Kristi     Toliver     Kristi Toliver 9           
#>  3 1611661317   2026 201069   Megan      Vogel       Megan Vogel    2           
#>  4 1611661317   2026 1628240  John       McCullough  John McCullou… 2           
#>  5 1611661317   2026 1643602  TC         Swirsky     TC Swirsky     2           
#>  6 1611661317   2026 1643603  Chevelle   Saunsoci    Chevelle Saun… 2           
#>  7 1611661317   2026 1643607  Tangela    Smith       Tangela Smith  2           
#>  8 1611661317   2026 1630682  Hannah     Wengertsman Hannah Wenger… 3           
#>  9 1611661332   2026 101168   Sandy      Brondello   Sandy Brondel… 1           
#> 10 1611661332   2026 201117   Olaf       Lange       Olaf Lange     9           
#> # ℹ 81 more rows
#> # ℹ 5 more variables: coach_type <chr>, sort_sequence <chr>,
#> #   sub_sort_sequence <chr>, season_2 <int>, team_id_lookup <int>
# }
```
