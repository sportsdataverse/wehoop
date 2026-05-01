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

Other ESPN WNBA Functions:
[`espn_wnba_game_all()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_all.md),
[`espn_wnba_game_rosters()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_rosters.md),
[`espn_wnba_pbp()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_pbp.md),
[`espn_wnba_player_box()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_player_box.md),
[`espn_wnba_player_stats()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_player_stats.md),
[`espn_wnba_standings()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_standings.md),
[`espn_wnba_team_box()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team_box.md),
[`espn_wnba_team_stats()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team_stats.md),
[`espn_wnba_teams()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_teams.md)

## Author

Saiem Gilani.

## Examples

``` r
# Get schedule from date 2022-08-31
# \donttest{
  try(espn_wnba_scoreboard (season = "20220831"))
#> ── ESPN WNBA Scoreboard Information from ESPN.com ────────────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-05-01 03:09:10 UTC
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
