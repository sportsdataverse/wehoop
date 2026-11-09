# **Get ESPN women's college basketball schedule for a specific year**

**Get ESPN women's college basketball schedule for a specific year**

## Usage

``` r
espn_wbb_scoreboard(season)
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

[family_espn_wbb](https://wehoop.sportsdataverse.org/reference/family_espn_wbb.md)
lists every function in this family.

## Examples

``` r

# Get schedule from date 2022-11-15
# \donttest{
  try(espn_wbb_scoreboard (season = "20230225"))
#> ── ESPN WBB Scoreboard Information from ESPN.com ─────────────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-09 11:36:51 UTC
#> # A tibble: 532 × 36
#>    matchup         matchup_short season season_type season_slug game_id game_uid
#>    <chr>           <chr>          <int>       <int> <chr>         <int> <chr>   
#>  1 Stanford Cardi… STAN @ UTAH     2023           2 regular-se…  4.01e8 s:40~l:…
#>  2 UConn Huskies … CONN @ DEP      2023           2 regular-se…  4.01e8 s:40~l:…
#>  3 Texas Longhorn… TEX @ OU        2023           2 regular-se…  4.01e8 s:40~l:…
#>  4 Arizona Wildca… ARIZ @ ORST     2023           2 regular-se…  4.01e8 s:40~l:…
#>  5 Washington Hus… WASH @ UCLA     2023           2 regular-se…  4.01e8 s:40~l:…
#>  6 Gonzaga Bulldo… GONZ @ BYU      2023           2 regular-se…  4.01e8 s:40~l:…
#>  7 TCU Horned Fro… TCU @ ISU       2023           2 regular-se…  4.01e8 s:40~l:…
#>  8 California Gol… CAL @ COLO      2023           2 regular-se…  4.01e8 s:40~l:…
#>  9 San Diego Stat… SDSU @ UNLV     2023           2 regular-se…  4.01e8 s:40~l:…
#> 10 Middle Tenness… MTSU @ LT       2023           2 regular-se…  4.01e8 s:40~l:…
#> # ℹ 522 more rows
#> # ℹ 29 more variables: game_date <date>, attendance <int>,
#> #   play_by_play_available <lgl>, status_name <chr>, broadcast_market <chr>,
#> #   broadcast_name <chr>, start_date <chr>, broadcast <chr>,
#> #   game_date_time <dttm>, home_team_name <chr>, home_team_logo <chr>,
#> #   home_team_abb <chr>, home_team_id <int>, home_team_location <chr>,
#> #   home_team_full_name <chr>, home_team_color <chr>, home_score <int>, …
# }
```
