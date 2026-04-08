# **Get WNBA Stats API Boxscore Player Tracking V3**

**Get WNBA Stats API Boxscore Player Tracking V3**

**Get WNBA Stats API Boxscore Player Tracking V3**

## Usage

``` r
wnba_boxscoreplayertrackv3(
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

A list of data frames: home_team_player_player_track,
away_team_player_player_track, home_team_totals_player_track,
away_team_totals_player_track

**home_team_player_player_track**

|                                       |           |
|---------------------------------------|-----------|
| col_name                              | types     |
| game_id                               | character |
| away_team_id                          | integer   |
| home_team_id                          | integer   |
| team_id                               | integer   |
| team_name                             | character |
| team_city                             | character |
| team_tricode                          | character |
| team_slug                             | character |
| person_id                             | integer   |
| first_name                            | character |
| family_name                           | character |
| name_i                                | character |
| player_slug                           | character |
| position                              | character |
| comment                               | character |
| jersey_num                            | character |
| minutes                               | character |
| speed                                 | numeric   |
| distance                              | numeric   |
| rebound_chances_offensive             | integer   |
| rebound_chances_defensive             | integer   |
| rebound_chances_total                 | integer   |
| touches                               | integer   |
| secondary_assists                     | integer   |
| free_throw_assists                    | integer   |
| passes                                | integer   |
| assists                               | integer   |
| contested_field_goals_made            | integer   |
| contested_field_goals_attempted       | integer   |
| contested_field_goal_percentage       | numeric   |
| uncontested_field_goals_made          | integer   |
| uncontested_field_goals_attempted     | integer   |
| uncontested_field_goals_percentage    | numeric   |
| field_goal_percentage                 | numeric   |
| defended_at_rim_field_goals_made      | integer   |
| defended_at_rim_field_goals_attempted | integer   |
| defended_at_rim_field_goal_percentage | numeric   |

**away_team_player_player_track**

|                                       |           |
|---------------------------------------|-----------|
| col_name                              | types     |
| game_id                               | character |
| away_team_id                          | integer   |
| home_team_id                          | integer   |
| team_id                               | integer   |
| team_name                             | character |
| team_city                             | character |
| team_tricode                          | character |
| team_slug                             | character |
| person_id                             | integer   |
| first_name                            | character |
| family_name                           | character |
| name_i                                | character |
| player_slug                           | character |
| position                              | character |
| comment                               | character |
| jersey_num                            | character |
| minutes                               | character |
| speed                                 | numeric   |
| distance                              | numeric   |
| rebound_chances_offensive             | integer   |
| rebound_chances_defensive             | integer   |
| rebound_chances_total                 | integer   |
| touches                               | integer   |
| secondary_assists                     | integer   |
| free_throw_assists                    | integer   |
| passes                                | integer   |
| assists                               | integer   |
| contested_field_goals_made            | integer   |
| contested_field_goals_attempted       | integer   |
| contested_field_goal_percentage       | numeric   |
| uncontested_field_goals_made          | integer   |
| uncontested_field_goals_attempted     | integer   |
| uncontested_field_goals_percentage    | numeric   |
| field_goal_percentage                 | numeric   |
| defended_at_rim_field_goals_made      | integer   |
| defended_at_rim_field_goals_attempted | integer   |
| defended_at_rim_field_goal_percentage | numeric   |

**home_team_totals_player_track**

|                                       |           |
|---------------------------------------|-----------|
| col_name                              | types     |
| game_id                               | character |
| away_team_id                          | integer   |
| home_team_id                          | integer   |
| team_id                               | integer   |
| team_name                             | character |
| team_city                             | character |
| team_tricode                          | character |
| team_slug                             | character |
| minutes                               | character |
| distance                              | numeric   |
| rebound_chances_offensive             | integer   |
| rebound_chances_defensive             | integer   |
| rebound_chances_total                 | integer   |
| touches                               | integer   |
| secondary_assists                     | integer   |
| free_throw_assists                    | integer   |
| passes                                | integer   |
| assists                               | integer   |
| contested_field_goals_made            | integer   |
| contested_field_goals_attempted       | integer   |
| contested_field_goal_percentage       | numeric   |
| uncontested_field_goals_made          | integer   |
| uncontested_field_goals_attempted     | integer   |
| uncontested_field_goals_percentage    | numeric   |
| field_goal_percentage                 | numeric   |
| defended_at_rim_field_goals_made      | integer   |
| defended_at_rim_field_goals_attempted | integer   |
| defended_at_rim_field_goal_percentage | numeric   |

**away_team_totals_player_track**

|                                       |           |
|---------------------------------------|-----------|
| col_name                              | types     |
| game_id                               | character |
| away_team_id                          | integer   |
| home_team_id                          | integer   |
| team_id                               | integer   |
| team_name                             | character |
| team_city                             | character |
| team_tricode                          | character |
| team_slug                             | character |
| minutes                               | character |
| distance                              | numeric   |
| rebound_chances_offensive             | integer   |
| rebound_chances_defensive             | integer   |
| rebound_chances_total                 | integer   |
| touches                               | integer   |
| secondary_assists                     | integer   |
| free_throw_assists                    | integer   |
| passes                                | integer   |
| assists                               | integer   |
| contested_field_goals_made            | integer   |
| contested_field_goals_attempted       | integer   |
| contested_field_goal_percentage       | numeric   |
| uncontested_field_goals_made          | integer   |
| uncontested_field_goals_attempted     | integer   |
| uncontested_field_goals_percentage    | numeric   |
| field_goal_percentage                 | numeric   |
| defended_at_rim_field_goals_made      | integer   |
| defended_at_rim_field_goals_attempted | integer   |
| defended_at_rim_field_goal_percentage | numeric   |

## Details

     wnba_boxscoreplayertrackv3(game_id = "1022200034")

## See also

Other WNBA Boxscore V3 Functions:
[`wnba_boxscoreadvancedv3()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoreadvancedv3.md),
[`wnba_boxscorefourfactorsv3()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscorefourfactorsv3.md),
[`wnba_boxscorehustlev2()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscorehustlev2.md),
[`wnba_boxscoremiscv3()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoremiscv3.md),
[`wnba_boxscorescoringv3()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscorescoringv3.md),
[`wnba_boxscoretraditionalv3()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoretraditionalv3.md)

## Author

Saiem Gilani
