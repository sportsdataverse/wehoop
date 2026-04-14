# **Get ESPN women's college basketball team stats data**

**Get ESPN women's college basketball team stats data**

## Usage

``` r
espn_wbb_team_stats(team_id, year, season_type = "regular", total = FALSE)
```

## Arguments

- team_id:

  Team ID

- year:

  Year

- season_type:

  (character, default: regular): Season type - regular or postseason

- total:

  (boolean, default: FALSE): Totals

## Value

Returns a tibble with the team stats data

|                                                 |           |
|-------------------------------------------------|-----------|
| col_name                                        | types     |
| team_id                                         | integer   |
| team_guid                                       | character |
| team_uid                                        | character |
| team_sdr                                        | integer   |
| team_slug                                       | character |
| team_location                                   | character |
| team_name                                       | character |
| team_nickname                                   | character |
| team_abbreviation                               | character |
| team_display_name                               | character |
| team_short_display_name                         | character |
| team_color                                      | character |
| team_alternate_color                            | character |
| team_is_active                                  | logical   |
| team_is_all_star                                | logical   |
| logo_href                                       | character |
| logo_dark_href                                  | character |
| defensive_blocks                                | numeric   |
| defensive_defensive_rebounds                    | numeric   |
| defensive_steals                                | numeric   |
| defensive_turnover_points                       | numeric   |
| defensive_avg_defensive_rebounds                | numeric   |
| defensive_avg_blocks                            | numeric   |
| defensive_avg_steals                            | numeric   |
| general_disqualifications                       | numeric   |
| general_flagrant_fouls                          | numeric   |
| general_fouls                                   | numeric   |
| general_ejections                               | numeric   |
| general_technical_fouls                         | numeric   |
| general_rebounds                                | numeric   |
| general_minutes                                 | numeric   |
| general_avg_minutes                             | numeric   |
| general_fantasy_rating                          | numeric   |
| general_avg_rebounds                            | numeric   |
| general_avg_fouls                               | numeric   |
| general_avg_flagrant_fouls                      | numeric   |
| general_avg_technical_fouls                     | numeric   |
| general_avg_ejections                           | numeric   |
| general_avg_disqualifications                   | numeric   |
| general_assist_turnover_ratio                   | numeric   |
| general_steal_foul_ratio                        | numeric   |
| general_block_foul_ratio                        | numeric   |
| general_avg_team_rebounds                       | numeric   |
| general_total_rebounds                          | numeric   |
| general_total_technical_fouls                   | numeric   |
| general_team_assist_turnover_ratio              | numeric   |
| general_team_rebounds                           | numeric   |
| general_steal_turnover_ratio                    | numeric   |
| general_games_played                            | numeric   |
| general_games_started                           | numeric   |
| general_double_double                           | numeric   |
| general_triple_double                           | numeric   |
| offensive_assists                               | numeric   |
| offensive_field_goals                           | numeric   |
| offensive_field_goals_attempted                 | numeric   |
| offensive_field_goals_made                      | numeric   |
| offensive_field_goal_pct                        | numeric   |
| offensive_free_throws                           | numeric   |
| offensive_free_throw_pct                        | numeric   |
| offensive_free_throws_attempted                 | numeric   |
| offensive_free_throws_made                      | numeric   |
| offensive_offensive_rebounds                    | numeric   |
| offensive_points                                | numeric   |
| offensive_turnovers                             | numeric   |
| offensive_three_point_field_goals_attempted     | numeric   |
| offensive_three_point_field_goals_made          | numeric   |
| offensive_team_turnovers                        | numeric   |
| offensive_total_turnovers                       | numeric   |
| offensive_fast_break_points                     | numeric   |
| offensive_avg_field_goals_made                  | numeric   |
| offensive_avg_field_goals_attempted             | numeric   |
| offensive_avg_three_point_field_goals_made      | numeric   |
| offensive_avg_three_point_field_goals_attempted | numeric   |
| offensive_avg_free_throws_made                  | numeric   |
| offensive_avg_free_throws_attempted             | numeric   |
| offensive_avg_points                            | numeric   |
| offensive_avg_offensive_rebounds                | numeric   |
| offensive_avg_assists                           | numeric   |
| offensive_avg_turnovers                         | numeric   |
| offensive_offensive_rebound_pct                 | numeric   |
| offensive_estimated_possessions                 | numeric   |
| offensive_avg_estimated_possessions             | numeric   |
| offensive_points_per_estimated_possessions      | numeric   |
| offensive_avg_team_turnovers                    | numeric   |
| offensive_avg_total_turnovers                   | numeric   |
| offensive_three_point_field_goal_pct            | numeric   |
| offensive_two_point_field_goals_made            | numeric   |
| offensive_two_point_field_goals_attempted       | numeric   |
| offensive_avg_two_point_field_goals_made        | numeric   |
| offensive_avg_two_point_field_goals_attempted   | numeric   |
| offensive_two_point_field_goal_pct              | numeric   |
| offensive_shooting_efficiency                   | numeric   |
| offensive_scoring_efficiency                    | numeric   |

## See also

Other ESPN WBB Functions:
[`espn_wbb_conferences()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_conferences.md),
[`espn_wbb_game_all()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_game_all.md),
[`espn_wbb_game_rosters()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_game_rosters.md),
[`espn_wbb_pbp()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_pbp.md),
[`espn_wbb_player_box()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_player_box.md),
[`espn_wbb_player_stats()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_player_stats.md),
[`espn_wbb_rankings()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_rankings.md),
[`espn_wbb_scoreboard()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_scoreboard.md),
[`espn_wbb_standings()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_standings.md),
[`espn_wbb_team_box()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_team_box.md),
[`espn_wbb_teams()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_teams.md)

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  try(espn_wbb_team_stats(team_id = 52, year = 2020))
#> ── ESPN WBB Team Season Stats from ESPN.com ──────────────────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-04-14 04:27:20 UTC
#> # A tibble: 1 × 179
#>   team_x_ref_3       team_id team_guid team_uid team_sdr team_slug team_location
#>   <chr>                <int> <chr>     <chr>       <int> <chr>     <chr>        
#> 1 http://sports.cor…      52 686a0ce2… s:40~l:…     5994 florida-… Florida State
#> # ℹ 172 more variables: team_name <chr>, team_nickname <chr>,
#> #   team_abbreviation <chr>, team_display_name <chr>,
#> #   team_short_display_name <chr>, team_color <chr>,
#> #   team_alternate_color <chr>, team_is_active <lgl>, is_all_star <lgl>,
#> #   logo_href <chr>, logo_dark_href <chr>, logos_href_2 <chr>,
#> #   logos_width_2 <int>, logos_height_2 <int>, logos_alt_2 <chr>,
#> #   logos_rel_full_2 <chr>, logos_rel_primary_logo_on_white_color <chr>, …
# }
```
