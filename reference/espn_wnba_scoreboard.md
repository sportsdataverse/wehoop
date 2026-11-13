# **Get WNBA schedule for a specific year/date from ESPN's API**

**Get WNBA schedule for a specific year/date from ESPN's API**

## Usage

``` r
espn_wnba_scoreboard(season)
```

## Arguments

- season:

  Either numeric or character

## Value

Returns a tibble

Columns as documented in the shared
[espn_basketball_scoreboard_schema](https://wehoop.sportsdataverse.org/reference/espn_basketball_scoreboard_schema.md)
table.

## See also

[family_espn_wnba](https://wehoop.sportsdataverse.org/reference/family_espn_wnba.md)
lists every function in this family.

## Author

Saiem Gilani.

## Examples

``` r
# Get schedule from date 2022-08-31
# \donttest{
  try(espn_wnba_scoreboard (season = "20220831"))
#> ── ESPN WNBA Scoreboard Information from ESPN.com ────────────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-13 14:50:27 UTC
#> # A tibble: 2 × 37
#>   matchup          matchup_short season season_type season_slug game_id game_uid
#>   <chr>            <chr>          <int>       <int> <chr>         <int> <chr>   
#> 1 Connecticut Sun… CON @ CHI       2022           3 post-season  4.01e8 s:40~l:…
#> 2 Seattle Storm a… SEA @ LV        2022           3 post-season  4.01e8 s:40~l:…
#> # ℹ 30 more variables: game_date <date>, attendance <int>,
#> #   play_by_play_available <lgl>, status_name <chr>, broadcast_market <chr>,
#> #   broadcast_name <chr>, start_date <chr>, broadcast <chr>, highlights <lgl>,
#> #   game_date_time <dttm>, home_team_name <chr>, home_team_logo <chr>,
#> #   home_team_abb <chr>, home_team_id <int>, home_team_location <chr>,
#> #   home_team_full_name <chr>, home_team_color <chr>, home_score <int>,
#> #   home_win <int>, home_record <chr>, away_team_name <chr>, …
# }
```
