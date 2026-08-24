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

  A vector of 4-digit years associated with given WNBA seasons.
  Published coverage runs 1997 through the most recent season, with no
  gaps. Pass `seasons = TRUE` for every published season. (Min: 1997)

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
[`load_wnba_stats_leaguedash()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_leaguedash.md),
[`load_wnba_stats_lineups()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_lineups.md),
[`load_wnba_stats_officials()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_officials.md),
[`load_wnba_stats_pbp()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_pbp.md),
[`load_wnba_stats_player_game_logs()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_player_game_logs.md),
[`load_wnba_stats_player_stats()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_player_stats.md),
[`load_wnba_stats_possessions()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_possessions.md),
[`load_wnba_stats_schedule()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_schedule.md),
[`load_wnba_stats_shots()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_shots.md),
[`load_wnba_stats_standings()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_standings.md),
[`load_wnba_stats_team_stats()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_team_stats.md)

## Examples

``` r
# \donttest{
  try(load_wnba_stats_rosters(seasons = most_recent_wnba_stats_season()))
#> ──────────────────────────────────────────────────────────────── wehoop 3.0.0 ──
#> # A tibble: 206 × 18
#>       team_id season league_id player nickname player_slug num   position height
#>         <int>  <int> <chr>     <chr>  <chr>    <chr>       <chr> <chr>    <chr> 
#>  1 1611661313   2026 10        Satou… Satou    satou-saba… 0     F        6-4   
#>  2 1611661313   2026 10        Marin… Marine   marine-fau… 4     G        5-9   
#>  3 1611661313   2026 10        Rebek… Rebekah  rebekah-ga… 7     G        6-1   
#>  4 1611661313   2026 10        Rebec… Rebecca  rebecca-al… 9     F-G      6-2   
#>  5 1611661313   2026 10        Leoni… Leonie   leonie-fie… 13    F        6-4   
#>  6 1611661313   2026 10        Raque… Raquel   raquel-car… 14    C        6-3   
#>  7 1611661313   2026 10        Pauli… Pauline  pauline-as… 18    G        5-11  
#>  8 1611661313   2026 10        Sabri… Sabrina  sabrina-io… 20    G        5-11  
#>  9 1611661313   2026 10        Han Xu Xu       xu-han      21    C        6-11  
#> 10 1611661313   2026 10        Marin… Marine   marine-joh… 23    G        5-10  
#> # ℹ 196 more rows
#> # ℹ 9 more variables: weight <chr>, birth_date <chr>, age <dbl>, exp <chr>,
#> #   school <chr>, player_id <int>, how_acquired <chr>,
#> #   supplemental_status <int>, season_type <chr>
# }
```
