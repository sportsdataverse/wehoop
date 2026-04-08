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

|                     |           |
|---------------------|-----------|
| col_name            | types     |
| matchup             | character |
| matchup_short       | character |
| season              | integer   |
| season_type         | integer   |
| season_slug         | character |
| game_id             | integer   |
| game_uid            | character |
| game_date           | Date      |
| attendance          | integer   |
| status_name         | character |
| broadcast_market    | character |
| broadcast_name      | character |
| start_date          | character |
| game_date_time      | POSIXct   |
| home_team_name      | character |
| home_team_logo      | character |
| home_team_abb       | character |
| home_team_id        | integer   |
| home_team_location  | character |
| home_team_full_name | character |
| home_team_color     | character |
| home_score          | integer   |
| home_win            | integer   |
| home_record         | character |
| away_team_name      | character |
| away_team_logo      | character |
| away_team_abb       | character |
| away_team_id        | integer   |
| away_team_location  | character |
| away_team_full_name | character |
| away_team_color     | character |
| away_score          | integer   |
| away_win            | integer   |
| away_record         | character |

## See also

Other ESPN WBB Functions:
[`espn_wbb_conferences()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_conferences.md),
[`espn_wbb_game_all()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_game_all.md),
[`espn_wbb_game_rosters()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_game_rosters.md),
[`espn_wbb_pbp()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_pbp.md),
[`espn_wbb_player_box()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_player_box.md),
[`espn_wbb_player_stats()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_player_stats.md),
[`espn_wbb_rankings()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_rankings.md),
[`espn_wbb_standings()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_standings.md),
[`espn_wbb_team_box()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_team_box.md),
[`espn_wbb_team_stats()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_team_stats.md),
[`espn_wbb_teams()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_teams.md)

## Examples

``` r
# Get schedule from date 2022-11-15
# \donttest{
  try(espn_wbb_scoreboard (season = "20230225"))
#> ── ESPN WBB Scoreboard Information from ESPN.com ─────────────── wehoop 2.1.0 ──
#> ℹ Data updated: 2026-04-08 11:13:42 UTC
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
