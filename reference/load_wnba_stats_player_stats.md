# **Load wehoop WNBA Stats Player Season Stats**

Loads season-level WNBA player statistics scraped from the WNBA Stats
API. Backed by the `wehoop-wnba-stats-data` pipeline that reads raw
JSONs from `wehoop-wnba-stats-raw` and publishes parquet/rds artifacts
to the `wnba_stats_player_season_stats` release tag.

`load_wnba_stats_player_stats_manifest()` returns the per-season
manifest CSV (`season`, `row_count`, `generated_at_utc`,
`source_endpoint`) for the WNBA Stats player season stats release tag
without downloading any season's full data.

## Usage

``` r
load_wnba_stats_player_stats(
  seasons = most_recent_wnba_stats_season(),
  ...,
  dbConnection = NULL,
  tablename = NULL
)

load_wnba_stats_player_stats_manifest()
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

  The name of the player season stats table within the database

## Value

Returns a `wehoop_data` tibble of player season stats.

## See also

Other WNBA Stats loader functions:
[`load_wnba_stats_coaches()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_coaches.md),
[`load_wnba_stats_draft()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_draft.md),
[`load_wnba_stats_game_rosters()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_game_rosters.md),
[`load_wnba_stats_lineups()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_lineups.md),
[`load_wnba_stats_officials()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_officials.md),
[`load_wnba_stats_pbp()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_pbp.md),
[`load_wnba_stats_player_game_logs()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_player_game_logs.md),
[`load_wnba_stats_rosters()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_rosters.md),
[`load_wnba_stats_schedule()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_schedule.md),
[`load_wnba_stats_shots()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_shots.md),
[`load_wnba_stats_standings()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_standings.md),
[`load_wnba_stats_team_stats()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_team_stats.md)

## Examples

``` r
# \donttest{
  try(load_wnba_stats_player_stats(seasons = most_recent_wnba_stats_season()))
#> ──────────────────────────────────────────────────────────────── wehoop 3.0.0 ──
#> # A tibble: 591 × 121
#>    player_id player_name    nickname team_id team_abbreviation age   gp    w    
#>    <chr>     <chr>          <chr>    <chr>   <chr>             <chr> <chr> <chr>
#>  1 1628932   A'ja Wilson    A'ja     161166… LVA               29    9     6    
#>  2 1642290   Aaliyah Edwar… Aaliyah  161166… CON               23    6     1    
#>  3 1642801   Aaliyah Nye    Aaliyah  161166… ATL               23    7     4    
#>  4 1642786   Aicha Couliba… Aicha    161166… CHI               24    6     2    
#>  5 1629501   Alanna Smith   Alanna   161166… DAL               29    9     6    
#>  6 1643525   Alex Fowler    Alex     161166… NYL               24    2     1    
#>  7 1642775   Alex Wilson    Alex     161166… WAS               32    4     2    
#>  8 1643644   Alicia Florez  Alicia   161166… WAS               22    3     2    
#>  9 1641648   Aliyah Boston  Aliyah   161166… IND               24    8     4    
#> 10 1628277   Allisha Gray   Allisha  161166… ATL               31    9     6    
#> # ℹ 581 more rows
#> # ℹ 113 more variables: l <chr>, w_pct <chr>, min <chr>, e_off_rating <chr>,
#> #   off_rating <chr>, sp_work_off_rating <chr>, e_def_rating <chr>,
#> #   def_rating <chr>, sp_work_def_rating <chr>, e_net_rating <chr>,
#> #   net_rating <chr>, sp_work_net_rating <chr>, ast_pct <chr>, ast_to <chr>,
#> #   ast_ratio <chr>, oreb_pct <chr>, dreb_pct <chr>, reb_pct <chr>,
#> #   tm_tov_pct <chr>, e_tov_pct <chr>, efg_pct <chr>, ts_pct <chr>, …
# }
```
