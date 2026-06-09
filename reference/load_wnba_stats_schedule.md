# **Load wehoop WNBA Stats Schedules**

Loads season-level WNBA schedules scraped from
`stats.wnba.com/leaguegamefinder` (regular season + playoffs combined,
pre-rejoined home/away). Backed by the `wehoop-wnba-stats-data` pipeline
that publishes parquet/rds artifacts to the `wnba_stats_schedules`
release tag.

`load_wnba_stats_schedule_manifest()` returns the per-season manifest
CSV (`season`, `row_count`, `generated_at_utc`, `source_endpoint`) for
the WNBA Stats schedules release tag without downloading any season's
full data.

## Usage

``` r
load_wnba_stats_schedule(
  seasons = most_recent_wnba_stats_season(),
  ...,
  dbConnection = NULL,
  tablename = NULL
)

load_wnba_stats_schedule_manifest()
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

  The name of the schedules data table within the database

## Value

Returns a `wehoop_data` tibble of per-season schedules.

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
[`load_wnba_stats_rosters()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_rosters.md),
[`load_wnba_stats_shots()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_shots.md),
[`load_wnba_stats_standings()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_standings.md),
[`load_wnba_stats_team_stats()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_team_stats.md)

## Examples

``` r
# \donttest{
  try(load_wnba_stats_schedule(seasons = most_recent_wnba_stats_season()))
#> ──────────────────────────────────────────────────────────────── wehoop 3.0.0 ──
#> # A tibble: 164 × 29
#>    SEASON_ID TEAM_ID TEAM_ABBREVIATION TEAM_NAME GAME_ID GAME_DATE MATCHUP WL   
#>    <chr>     <chr>   <chr>             <chr>     <chr>   <chr>     <chr>   <chr>
#>  1 22026     161166… CHI               Chicago … 102260… 2026-06-… CHI @ … L    
#>  2 22026     161166… PDX               Portland… 102260… 2026-06-… PDX @ … L    
#>  3 22026     161166… TOR               Toronto … 102260… 2026-06-… TOR vs… W    
#>  4 22026     161166… LAS               Los Ange… 102260… 2026-06-… LAS vs… W    
#>  5 22026     161166… MIN               Minnesot… 102260… 2026-06-… MIN vs… W    
#>  6 22026     161166… LVA               Las Vega… 102260… 2026-06-… LVA vs… W    
#>  7 22026     161166… WAS               Washingt… 102260… 2026-06-… WAS @ … L    
#>  8 22026     161166… IND               Indiana … 102260… 2026-06-… IND @ … L    
#>  9 22026     161166… GSV               Golden S… 102260… 2026-06-… GSV @ … L    
#> 10 22026     161166… ATL               Atlanta … 102260… 2026-06-… ATL vs… W    
#> # ℹ 154 more rows
#> # ℹ 21 more variables: MIN <chr>, PTS <chr>, FGM <chr>, FGA <chr>,
#> #   FG_PCT <chr>, FG3M <chr>, FG3A <chr>, FG3_PCT <chr>, FTM <chr>, FTA <chr>,
#> #   FT_PCT <chr>, OREB <chr>, DREB <chr>, REB <chr>, AST <chr>, STL <chr>,
#> #   BLK <chr>, TOV <chr>, PF <chr>, PLUS_MINUS <chr>, season <int>
# }
```
