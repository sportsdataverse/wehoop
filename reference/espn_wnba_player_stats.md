# **Get ESPN WNBA player stats data**

**Get ESPN WNBA player stats data**

## Usage

``` r
espn_wnba_player_stats(
  athlete_id,
  year,
  season_type = "regular",
  total = FALSE
)
```

## Arguments

- athlete_id:

  Athlete ID

- year:

  Year

- season_type:

  (character, default: regular): Season type - regular or postseason

- total:

  (boolean, default: FALSE): Totals

## Value

Returns a tibble with the player stats data

|                                                  |           |
|--------------------------------------------------|-----------|
| col_name                                         | types     |
| athlete_id                                       | integer   |
| athlete_uid                                      | character |
| athlete_guid                                     | character |
| athlete_type                                     | character |
| sdr                                              | integer   |
| first_name                                       | character |
| last_name                                        | character |
| full_name                                        | character |
| display_name                                     | character |
| short_name                                       | character |
| weight                                           | numeric   |
| display_weight                                   | character |
| height                                           | numeric   |
| display_height                                   | character |
| age                                              | integer   |
| date_of_birth                                    | character |
| slug                                             | character |
| headshot_href                                    | character |
| headshot_alt                                     | character |
| position_id                                      | integer   |
| position_name                                    | character |
| position_display_name                            | character |
| position_abbreviation                            | character |
| position_leaf                                    | logical   |
| linked                                           | logical   |
| years                                            | integer   |
| active                                           | logical   |
| status_id                                        | integer   |
| status_name                                      | character |
| status_type                                      | character |
| status_abbreviation                              | character |
| defensive_blocks                                 | numeric   |
| defensive_defensive_rebounds                     | numeric   |
| defensive_steals                                 | numeric   |
| defensive_avg_defensive_rebounds                 | numeric   |
| defensive_avg_blocks                             | numeric   |
| defensive_avg_steals                             | numeric   |
| defensive_avg48defensive_rebounds                | numeric   |
| defensive_avg48blocks                            | numeric   |
| defensive_avg48steals                            | numeric   |
| general_disqualifications                        | numeric   |
| general_flagrant_fouls                           | numeric   |
| general_fouls                                    | numeric   |
| general_ejections                                | numeric   |
| general_technical_fouls                          | numeric   |
| general_rebounds                                 | numeric   |
| general_vorp                                     | numeric   |
| general_minutes                                  | numeric   |
| general_avg_minutes                              | numeric   |
| general_fantasy_rating                           | numeric   |
| general_nba_rating                               | numeric   |
| general_plus_minus                               | numeric   |
| general_avg_rebounds                             | numeric   |
| general_avg_fouls                                | numeric   |
| general_avg_flagrant_fouls                       | numeric   |
| general_avg_technical_fouls                      | numeric   |
| general_avg_ejections                            | numeric   |
| general_avg_disqualifications                    | numeric   |
| general_assist_turnover_ratio                    | numeric   |
| general_steal_foul_ratio                         | numeric   |
| general_block_foul_ratio                         | numeric   |
| general_avg_team_rebounds                        | numeric   |
| general_total_rebounds                           | numeric   |
| general_total_technical_fouls                    | numeric   |
| general_team_assist_turnover_ratio               | numeric   |
| general_steal_turnover_ratio                     | numeric   |
| general_avg48rebounds                            | numeric   |
| general_avg48fouls                               | numeric   |
| general_avg48flagrant_fouls                      | numeric   |
| general_avg48technical_fouls                     | numeric   |
| general_avg48ejections                           | numeric   |
| general_avg48disqualifications                   | numeric   |
| general_games_played                             | numeric   |
| general_games_started                            | numeric   |
| general_double_double                            | numeric   |
| general_triple_double                            | numeric   |
| offensive_assists                                | numeric   |
| offensive_field_goals                            | numeric   |
| offensive_field_goals_attempted                  | numeric   |
| offensive_field_goals_made                       | numeric   |
| offensive_field_goal_pct                         | numeric   |
| offensive_free_throws                            | numeric   |
| offensive_free_throw_pct                         | numeric   |
| offensive_free_throws_attempted                  | numeric   |
| offensive_free_throws_made                       | numeric   |
| offensive_offensive_rebounds                     | numeric   |
| offensive_points                                 | numeric   |
| offensive_turnovers                              | numeric   |
| offensive_three_point_pct                        | numeric   |
| offensive_three_point_field_goals_attempted      | numeric   |
| offensive_three_point_field_goals_made           | numeric   |
| offensive_total_turnovers                        | numeric   |
| offensive_points_in_paint                        | numeric   |
| offensive_brick_index                            | numeric   |
| offensive_avg_field_goals_made                   | numeric   |
| offensive_avg_field_goals_attempted              | numeric   |
| offensive_avg_three_point_field_goals_made       | numeric   |
| offensive_avg_three_point_field_goals_attempted  | numeric   |
| offensive_avg_free_throws_made                   | numeric   |
| offensive_avg_free_throws_attempted              | numeric   |
| offensive_avg_points                             | numeric   |
| offensive_avg_offensive_rebounds                 | numeric   |
| offensive_avg_assists                            | numeric   |
| offensive_avg_turnovers                          | numeric   |
| offensive_offensive_rebound_pct                  | numeric   |
| offensive_estimated_possessions                  | numeric   |
| offensive_avg_estimated_possessions              | numeric   |
| offensive_points_per_estimated_possessions       | numeric   |
| offensive_avg_team_turnovers                     | numeric   |
| offensive_avg_total_turnovers                    | numeric   |
| offensive_three_point_field_goal_pct             | numeric   |
| offensive_two_point_field_goals_made             | numeric   |
| offensive_two_point_field_goals_attempted        | numeric   |
| offensive_avg_two_point_field_goals_made         | numeric   |
| offensive_avg_two_point_field_goals_attempted    | numeric   |
| offensive_two_point_field_goal_pct               | numeric   |
| offensive_shooting_efficiency                    | numeric   |
| offensive_scoring_efficiency                     | numeric   |
| offensive_avg48field_goals_made                  | numeric   |
| offensive_avg48field_goals_attempted             | numeric   |
| offensive_avg48three_point_field_goals_made      | numeric   |
| offensive_avg48three_point_field_goals_attempted | numeric   |
| offensive_avg48free_throws_made                  | numeric   |
| offensive_avg48free_throws_attempted             | numeric   |
| offensive_avg48points                            | numeric   |
| offensive_avg48offensive_rebounds                | numeric   |
| offensive_avg48assists                           | numeric   |
| offensive_avg48turnovers                         | numeric   |
| team_id                                          | integer   |
| team_guid                                        | character |
| team_uid                                         | character |
| team_sdr                                         | integer   |
| team_slug                                        | character |
| team_location                                    | character |
| team_name                                        | character |
| team_abbreviation                                | character |
| team_display_name                                | character |
| team_short_display_name                          | character |
| team_color                                       | character |
| team_alternate_color                             | character |
| team_is_active                                   | logical   |
| team_is_all_star                                 | logical   |
| logo_href                                        | character |
| logo_dark_href                                   | character |

## See also

Other ESPN WNBA Functions:
[`espn_wnba_game_all()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_all.md),
[`espn_wnba_game_rosters()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_rosters.md),
[`espn_wnba_pbp()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_pbp.md),
[`espn_wnba_player_box()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_player_box.md),
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
  try(espn_wnba_player_stats(athlete_id = 2529130, year = 2022))
#> ── ESPN WNBA Player Season Stats from ESPN.com ───────────────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-05-01 03:09:10 UTC
#> # A tibble: 1 × 232
#>   athlete_id athlete_uid   athlete_guid athlete_type    sdr first_name last_name
#>        <int> <chr>         <chr>        <chr>         <int> <chr>      <chr>    
#> 1    2529130 s:40~l:59~a:… 2e32f80f-85… basketball   2.53e6 Natasha    Howard   
#> # ℹ 225 more variables: full_name <chr>, display_name <chr>, short_name <chr>,
#> #   weight <dbl>, display_weight <chr>, height <dbl>, display_height <chr>,
#> #   age <int>, date_of_birth <chr>, slug <chr>, headshot_href <chr>,
#> #   headshot_alt <chr>, jersey <chr>, hand_type <chr>, hand_abbreviation <chr>,
#> #   hand_display_value <chr>, position_id <int>, position_name <chr>,
#> #   position_display_name <chr>, position_abbreviation <chr>,
#> #   position_leaf <lgl>, linked <lgl>, years <int>, active <lgl>, …
# }
```
