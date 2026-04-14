# Get ESPN's WNBA player box data

Get ESPN's WNBA player box data

## Usage

``` r
espn_wnba_player_box(game_id)
```

## Arguments

- game_id:

  Game ID

## Value

Returns a player boxscore data frame

**Player**

|                                   |           |
|-----------------------------------|-----------|
| col_name                          | types     |
| game_id                           | integer   |
| season                            | integer   |
| season_type                       | integer   |
| game_date                         | Date      |
| game_date_time                    | POSIXct   |
| athlete_id                        | integer   |
| athlete_display_name              | character |
| team_id                           | integer   |
| team_name                         | character |
| team_location                     | character |
| team_short_display_name           | character |
| minutes                           | numeric   |
| field_goals_made                  | integer   |
| field_goals_attempted             | integer   |
| three_point_field_goals_made      | integer   |
| three_point_field_goals_attempted | integer   |
| free_throws_made                  | integer   |
| free_throws_attempted             | integer   |
| offensive_rebounds                | integer   |
| defensive_rebounds                | integer   |
| rebounds                          | integer   |
| assists                           | integer   |
| steals                            | integer   |
| blocks                            | integer   |
| turnovers                         | integer   |
| fouls                             | integer   |
| plus_minus                        | character |
| points                            | integer   |
| starter                           | logical   |
| ejected                           | logical   |
| did_not_play                      | logical   |
| reason                            | character |
| active                            | logical   |
| athlete_jersey                    | character |
| athlete_short_name                | character |
| athlete_headshot_href             | character |
| athlete_position_name             | character |
| athlete_position_abbreviation     | character |
| team_display_name                 | character |
| team_uid                          | character |
| team_slug                         | character |
| team_logo                         | character |
| team_abbreviation                 | character |
| team_color                        | character |
| team_alternate_color              | character |
| home_away                         | character |
| team_winner                       | logical   |
| team_score                        | integer   |
| opponent_team_id                  | integer   |
| opponent_team_name                | character |
| opponent_team_location            | character |
| opponent_team_display_name        | character |
| opponent_team_abbreviation        | character |
| opponent_team_logo                | character |
| opponent_team_color               | character |
| opponent_team_alternate_color     | character |
| opponent_team_score               | integer   |

## See also

Other ESPN WNBA Functions:
[`espn_wnba_game_all()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_all.md),
[`espn_wnba_game_rosters()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_rosters.md),
[`espn_wnba_pbp()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_pbp.md),
[`espn_wnba_player_stats()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_player_stats.md),
[`espn_wnba_scoreboard()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_scoreboard.md),
[`espn_wnba_standings()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_standings.md),
[`espn_wnba_team_box()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team_box.md),
[`espn_wnba_team_stats()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team_stats.md),
[`espn_wnba_teams()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_teams.md)

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  try(espn_wnba_player_box(game_id = 401244185))
#> ── ESPN WNBA Player Box Information from ESPN.com ────────────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-04-14 04:27:30 UTC
#> # A tibble: 25 × 57
#>      game_id season season_type game_date  game_date_time      athlete_id
#>        <int>  <int>       <int> <date>     <dttm>                   <int>
#>  1 401244185   2020           3 2020-10-06 2020-10-06 19:00:00        872
#>  2 401244185   2020           3 2020-10-06 2020-10-06 19:00:00        982
#>  3 401244185   2020           3 2020-10-06 2020-10-06 19:00:00    3149391
#>  4 401244185   2020           3 2020-10-06 2020-10-06 19:00:00       1014
#>  5 401244185   2020           3 2020-10-06 2020-10-06 19:00:00    2529205
#>  6 401244185   2020           3 2020-10-06 2020-10-06 19:00:00    2284331
#>  7 401244185   2020           3 2020-10-06 2020-10-06 19:00:00    2566452
#>  8 401244185   2020           3 2020-10-06 2020-10-06 19:00:00    2491197
#>  9 401244185   2020           3 2020-10-06 2020-10-06 19:00:00    3058908
#> 10 401244185   2020           3 2020-10-06 2020-10-06 19:00:00    4065870
#> # ℹ 15 more rows
#> # ℹ 51 more variables: athlete_display_name <chr>, team_id <int>,
#> #   team_name <chr>, team_location <chr>, team_short_display_name <chr>,
#> #   minutes <dbl>, field_goals_made <int>, field_goals_attempted <int>,
#> #   three_point_field_goals_made <int>,
#> #   three_point_field_goals_attempted <int>, free_throws_made <int>,
#> #   free_throws_attempted <int>, offensive_rebounds <int>, …
# }
```
