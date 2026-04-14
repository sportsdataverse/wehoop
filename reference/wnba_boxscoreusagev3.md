# **Get WNBA Stats API Boxscore Usage V3**

**Get WNBA Stats API Boxscore Usage V3**

**Get WNBA Stats API Boxscore Usage V3**

## Usage

``` r
wnba_boxscoreusagev3(
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

  Game ID - 10-digit zero-padded ID (e.g., '1022200034')

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

Returns a named list of data frames: home_team_player_usage,
away_team_player_usage, home_team_totals_usage, away_team_totals_usage

**home_team_player_usage**

|                                     |           |
|-------------------------------------|-----------|
| col_name                            | types     |
| game_id                             | character |
| away_team_id                        | integer   |
| home_team_id                        | integer   |
| team_id                             | integer   |
| team_name                           | character |
| team_city                           | character |
| team_tricode                        | character |
| team_slug                           | character |
| person_id                           | integer   |
| first_name                          | character |
| family_name                         | character |
| name_i                              | character |
| player_slug                         | character |
| position                            | character |
| comment                             | character |
| jersey_num                          | character |
| minutes                             | character |
| usage_percentage                    | numeric   |
| percentage_field_goals_made         | numeric   |
| percentage_field_goals_attempted    | numeric   |
| percentage_three_pointers_made      | numeric   |
| percentage_three_pointers_attempted | numeric   |
| percentage_free_throws_made         | numeric   |
| percentage_free_throws_attempted    | numeric   |
| percentage_rebounds_offensive       | numeric   |
| percentage_rebounds_defensive       | numeric   |
| percentage_rebounds_total           | numeric   |
| percentage_assists                  | numeric   |
| percentage_turnovers                | numeric   |
| percentage_steals                   | numeric   |
| percentage_blocks                   | numeric   |
| percentage_blocks_allowed           | numeric   |
| percentage_personal_fouls           | numeric   |
| percentage_personal_fouls_drawn     | numeric   |
| percentage_points                   | numeric   |

**away_team_player_usage**

|                                     |           |
|-------------------------------------|-----------|
| col_name                            | types     |
| game_id                             | character |
| away_team_id                        | integer   |
| home_team_id                        | integer   |
| team_id                             | integer   |
| team_name                           | character |
| team_city                           | character |
| team_tricode                        | character |
| team_slug                           | character |
| person_id                           | integer   |
| first_name                          | character |
| family_name                         | character |
| name_i                              | character |
| player_slug                         | character |
| position                            | character |
| comment                             | character |
| jersey_num                          | character |
| minutes                             | character |
| usage_percentage                    | numeric   |
| percentage_field_goals_made         | numeric   |
| percentage_field_goals_attempted    | numeric   |
| percentage_three_pointers_made      | numeric   |
| percentage_three_pointers_attempted | numeric   |
| percentage_free_throws_made         | numeric   |
| percentage_free_throws_attempted    | numeric   |
| percentage_rebounds_offensive       | numeric   |
| percentage_rebounds_defensive       | numeric   |
| percentage_rebounds_total           | numeric   |
| percentage_assists                  | numeric   |
| percentage_turnovers                | numeric   |
| percentage_steals                   | numeric   |
| percentage_blocks                   | numeric   |
| percentage_blocks_allowed           | numeric   |
| percentage_personal_fouls           | numeric   |
| percentage_personal_fouls_drawn     | numeric   |
| percentage_points                   | numeric   |

**home_team_totals_usage**

|                                     |           |
|-------------------------------------|-----------|
| col_name                            | types     |
| game_id                             | character |
| away_team_id                        | integer   |
| home_team_id                        | integer   |
| team_id                             | integer   |
| team_name                           | character |
| team_city                           | character |
| team_tricode                        | character |
| team_slug                           | character |
| minutes                             | character |
| usage_percentage                    | numeric   |
| percentage_field_goals_made         | numeric   |
| percentage_field_goals_attempted    | numeric   |
| percentage_three_pointers_made      | numeric   |
| percentage_three_pointers_attempted | numeric   |
| percentage_free_throws_made         | numeric   |
| percentage_free_throws_attempted    | numeric   |
| percentage_rebounds_offensive       | numeric   |
| percentage_rebounds_defensive       | numeric   |
| percentage_rebounds_total           | numeric   |
| percentage_assists                  | numeric   |
| percentage_turnovers                | numeric   |
| percentage_steals                   | numeric   |
| percentage_blocks                   | numeric   |
| percentage_blocks_allowed           | numeric   |
| percentage_personal_fouls           | numeric   |
| percentage_personal_fouls_drawn     | numeric   |
| percentage_points                   | numeric   |

**away_team_totals_usage**

|                                     |           |
|-------------------------------------|-----------|
| col_name                            | types     |
| game_id                             | character |
| away_team_id                        | integer   |
| home_team_id                        | integer   |
| team_id                             | integer   |
| team_name                           | character |
| team_city                           | character |
| team_tricode                        | character |
| team_slug                           | character |
| minutes                             | character |
| usage_percentage                    | numeric   |
| percentage_field_goals_made         | numeric   |
| percentage_field_goals_attempted    | numeric   |
| percentage_three_pointers_made      | numeric   |
| percentage_three_pointers_attempted | numeric   |
| percentage_free_throws_made         | numeric   |
| percentage_free_throws_attempted    | numeric   |
| percentage_rebounds_offensive       | numeric   |
| percentage_rebounds_defensive       | numeric   |
| percentage_rebounds_total           | numeric   |
| percentage_assists                  | numeric   |
| percentage_turnovers                | numeric   |
| percentage_steals                   | numeric   |
| percentage_blocks                   | numeric   |
| percentage_blocks_allowed           | numeric   |
| percentage_personal_fouls           | numeric   |
| percentage_personal_fouls_drawn     | numeric   |
| percentage_points                   | numeric   |

## Details

     wnba_boxscoreusagev3(game_id = "1022200034")

## See also

Other WNBA Boxscore V3 Functions:
[`wnba_boxscoreadvancedv3()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoreadvancedv3.md),
[`wnba_boxscorefourfactorsv3()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscorefourfactorsv3.md),
[`wnba_boxscorehustlev2()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscorehustlev2.md),
[`wnba_boxscoremiscv3()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoremiscv3.md),
[`wnba_boxscoreplayertrackv3()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoreplayertrackv3.md),
[`wnba_boxscorescoringv3()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscorescoringv3.md),
[`wnba_boxscoresummaryv3()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoresummaryv3.md),
[`wnba_boxscoretraditionalv3()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoretraditionalv3.md)

## Author

Saiem Gilani
