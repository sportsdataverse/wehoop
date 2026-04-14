# **Get WNBA Stats API Boxscore Advanced V3**

**Get WNBA Stats API Boxscore Advanced V3**

**Get WNBA Stats API Boxscore Advanced V3**

## Usage

``` r
wnba_boxscoreadvancedv3(
  game_id = "1022200034",
  start_period = 0,
  end_period = 14,
  start_range = 0,
  end_range = 0,
  range_type = 0,
  ...
)
```

## Arguments

- game_id:

  Game ID

- start_period:

  start_period

- end_period:

  end_period

- start_range:

  start_range

- end_range:

  end_range

- range_type:

  range_type

- ...:

  Additional arguments passed to an underlying function like httr.

## Value

A list of data frames: home_team_player_advanced,
away_team_player_advanced, home_team_totals_advanced,
away_team_totals_advanced

**home_team_player_advanced**

|                                 |           |
|---------------------------------|-----------|
| col_name                        | types     |
| game_id                         | character |
| away_team_id                    | integer   |
| home_team_id                    | integer   |
| team_id                         | integer   |
| team_name                       | character |
| team_city                       | character |
| team_tricode                    | character |
| team_slug                       | character |
| person_id                       | integer   |
| first_name                      | character |
| family_name                     | character |
| name_i                          | character |
| player_slug                     | character |
| position                        | character |
| comment                         | character |
| jersey_num                      | character |
| minutes                         | character |
| estimated_offensive_rating      | numeric   |
| offensive_rating                | numeric   |
| estimated_defensive_rating      | numeric   |
| defensive_rating                | numeric   |
| estimated_net_rating            | numeric   |
| net_rating                      | numeric   |
| assist_percentage               | numeric   |
| assist_to_turnover              | numeric   |
| assist_ratio                    | numeric   |
| offensive_rebound_percentage    | numeric   |
| defensive_rebound_percentage    | numeric   |
| rebound_percentage              | numeric   |
| turnover_ratio                  | numeric   |
| effective_field_goal_percentage | numeric   |
| true_shooting_percentage        | numeric   |
| usage_percentage                | numeric   |
| estimated_usage_percentage      | numeric   |
| estimated_pace                  | numeric   |
| pace                            | numeric   |
| pace_per40                      | numeric   |
| possessions                     | numeric   |
| pie                             | numeric   |

**away_team_player_advanced**

|                                 |           |
|---------------------------------|-----------|
| col_name                        | types     |
| game_id                         | character |
| away_team_id                    | integer   |
| home_team_id                    | integer   |
| team_id                         | integer   |
| team_name                       | character |
| team_city                       | character |
| team_tricode                    | character |
| team_slug                       | character |
| person_id                       | integer   |
| first_name                      | character |
| family_name                     | character |
| name_i                          | character |
| player_slug                     | character |
| position                        | character |
| comment                         | character |
| jersey_num                      | character |
| minutes                         | character |
| estimated_offensive_rating      | numeric   |
| offensive_rating                | numeric   |
| estimated_defensive_rating      | numeric   |
| defensive_rating                | numeric   |
| estimated_net_rating            | numeric   |
| net_rating                      | numeric   |
| assist_percentage               | numeric   |
| assist_to_turnover              | numeric   |
| assist_ratio                    | numeric   |
| offensive_rebound_percentage    | numeric   |
| defensive_rebound_percentage    | numeric   |
| rebound_percentage              | numeric   |
| turnover_ratio                  | numeric   |
| effective_field_goal_percentage | numeric   |
| true_shooting_percentage        | numeric   |
| usage_percentage                | numeric   |
| estimated_usage_percentage      | numeric   |
| estimated_pace                  | numeric   |
| pace                            | numeric   |
| pace_per40                      | numeric   |
| possessions                     | numeric   |
| pie                             | numeric   |

**home_team_totals_advanced**

|                                    |           |
|------------------------------------|-----------|
| col_name                           | types     |
| game_id                            | character |
| away_team_id                       | integer   |
| home_team_id                       | integer   |
| team_id                            | integer   |
| team_name                          | character |
| team_city                          | character |
| team_tricode                       | character |
| team_slug                          | character |
| minutes                            | character |
| estimated_offensive_rating         | numeric   |
| offensive_rating                   | numeric   |
| estimated_defensive_rating         | numeric   |
| defensive_rating                   | numeric   |
| estimated_net_rating               | numeric   |
| net_rating                         | numeric   |
| assist_percentage                  | numeric   |
| assist_to_turnover                 | numeric   |
| assist_ratio                       | numeric   |
| offensive_rebound_percentage       | numeric   |
| defensive_rebound_percentage       | numeric   |
| rebound_percentage                 | numeric   |
| estimated_team_turnover_percentage | numeric   |
| turnover_ratio                     | numeric   |
| effective_field_goal_percentage    | numeric   |
| true_shooting_percentage           | numeric   |
| usage_percentage                   | numeric   |
| estimated_usage_percentage         | numeric   |
| estimated_pace                     | numeric   |
| pace                               | numeric   |
| pace_per40                         | numeric   |
| possessions                        | numeric   |
| pie                                | numeric   |

**away_team_totals_advanced**

|                                    |           |
|------------------------------------|-----------|
| col_name                           | types     |
| game_id                            | character |
| away_team_id                       | integer   |
| home_team_id                       | integer   |
| team_id                            | integer   |
| team_name                          | character |
| team_city                          | character |
| team_tricode                       | character |
| team_slug                          | character |
| minutes                            | character |
| estimated_offensive_rating         | numeric   |
| offensive_rating                   | numeric   |
| estimated_defensive_rating         | numeric   |
| defensive_rating                   | numeric   |
| estimated_net_rating               | numeric   |
| net_rating                         | numeric   |
| assist_percentage                  | numeric   |
| assist_to_turnover                 | numeric   |
| assist_ratio                       | numeric   |
| offensive_rebound_percentage       | numeric   |
| defensive_rebound_percentage       | numeric   |
| rebound_percentage                 | numeric   |
| estimated_team_turnover_percentage | numeric   |
| turnover_ratio                     | numeric   |
| effective_field_goal_percentage    | numeric   |
| true_shooting_percentage           | numeric   |
| usage_percentage                   | numeric   |
| estimated_usage_percentage         | numeric   |
| estimated_pace                     | numeric   |
| pace                               | numeric   |
| pace_per40                         | numeric   |
| possessions                        | numeric   |
| pie                                | numeric   |

## Details

     wnba_boxscoreadvancedv3(game_id = "1022200034")

## See also

Other WNBA Boxscore V3 Functions:
[`wnba_boxscorefourfactorsv3()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscorefourfactorsv3.md),
[`wnba_boxscorehustlev2()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscorehustlev2.md),
[`wnba_boxscoremiscv3()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoremiscv3.md),
[`wnba_boxscoreplayertrackv3()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoreplayertrackv3.md),
[`wnba_boxscorescoringv3()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscorescoringv3.md),
[`wnba_boxscoresummaryv3()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoresummaryv3.md),
[`wnba_boxscoretraditionalv3()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoretraditionalv3.md),
[`wnba_boxscoreusagev3()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoreusagev3.md)

## Author

Saiem Gilani
