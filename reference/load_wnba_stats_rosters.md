# **Load wehoop WNBA Stats Rosters**

Loads season-level WNBA team rosters scraped from the WNBA Stats API.
One row per athlete-team-season triple. Backed by the
`wehoop-wnba-stats-data` pipeline that reads raw JSONs from
`wehoop-wnba-stats-raw` and publishes parquet/rds artifacts to the
`wnba_stats_rosters` release tag.

`load_wnba_stats_rosters_manifest()` returns the per-season manifest CSV
(`season`, `row_count`, `generated_at_utc`, `source_endpoint`) for the
WNBA Stats rosters release tag without downloading any season's full
data.

## Usage

``` r
load_wnba_stats_rosters(
  seasons = most_recent_wnba_stats_season(),
  ...,
  dbConnection = NULL,
  tablename = NULL
)

load_wnba_stats_rosters_manifest()
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

  The name of the rosters data table within the database

## Value

Returns a `wehoop_data` tibble with one row per athlete-team-season.

## See also

Other WNBA Stats loader functions:
[`load_wnba_stats_coaches()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_coaches.md),
[`load_wnba_stats_draft()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_draft.md),
[`load_wnba_stats_game_rosters()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_game_rosters.md),
[`load_wnba_stats_lineups()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_lineups.md),
[`load_wnba_stats_officials()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_officials.md),
[`load_wnba_stats_pbp()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_pbp.md),
[`load_wnba_stats_player_game_logs()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_player_game_logs.md),
[`load_wnba_stats_player_stats()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_player_stats.md),
[`load_wnba_stats_schedule()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_schedule.md),
[`load_wnba_stats_shots()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_shots.md),
[`load_wnba_stats_standings()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_standings.md),
[`load_wnba_stats_team_stats()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_team_stats.md)

## Examples

``` r
# \donttest{
  try(load_wnba_stats_rosters(seasons = most_recent_wnba_stats_season()))
#> ──────────────────────────────────────────────────────────────── wehoop 3.0.0 ──
#> # A tibble: 204 × 18
#>    team_id    season league_id player nickname player_slug num   position height
#>    <chr>       <int> <chr>     <chr>  <chr>    <chr>       <chr> <chr>    <chr> 
#>  1 1611661317   2026 10        Noemi… Noemie   noemie-bro… 1     F-G      5-11  
#>  2 1611661317   2026 10        Kahle… Kahleah  kahleah-co… 2     G-F      6-1   
#>  3 1611661317   2026 10        Natas… Natasha  natasha-ma… 4     F-C      6-3   
#>  4 1611661317   2026 10        Moniq… Monique  monique-ak… 8     G        5-10  
#>  5 1611661317   2026 10        Valer… Valeria… valeriane-… 11    F        6-1   
#>  6 1611661317   2026 10        Lexi … Lexi     lexi-held   12    G        5-9   
#>  7 1611661317   2026 10        Quion… Quionche quionche-c… 20    F        5-11  
#>  8 1611661317   2026 10        Kiana… Kiana    kiana-will… 23    G        5-8   
#>  9 1611661317   2026 10        DeWan… DeWanna  dewanna-bo… 24    F-G      6-4   
#> 10 1611661317   2026 10        Alyss… Alyssa   alyssa-tho… 25    F        6-2   
#> # ℹ 194 more rows
#> # ℹ 9 more variables: weight <chr>, birth_date <chr>, age <chr>, exp <chr>,
#> #   school <chr>, player_id <chr>, how_acquired <chr>, season_2 <int>,
#> #   team_id_lookup <int>
# }
```
