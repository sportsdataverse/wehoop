# **Get WNBA Stats API Boxscore Scoring V3**

**Get WNBA Stats API Boxscore Scoring V3**

**Get WNBA Stats API Boxscore Scoring V3**

## Usage

``` r
wnba_boxscorescoringv3(
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

A list of data frames: home_team_player_scoring,
away_team_player_scoring, home_team_totals_scoring,
away_team_totals_scoring

**home_team_player_scoring**

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
| percentage_field_goals_attempted2pt | numeric   |
| percentage_field_goals_attempted3pt | numeric   |
| percentage_points2pt                | numeric   |
| percentage_points_midrange2pt       | numeric   |
| percentage_points3pt                | numeric   |
| percentage_points_fast_break        | numeric   |
| percentage_points_free_throw        | numeric   |
| percentage_points_off_turnovers     | numeric   |
| percentage_points_paint             | numeric   |
| percentage_assisted2pt              | numeric   |
| percentage_unassisted2pt            | numeric   |
| percentage_assisted3pt              | numeric   |
| percentage_unassisted3pt            | numeric   |
| percentage_assisted_fgm             | numeric   |
| percentage_unassisted_fgm           | numeric   |

**away_team_player_scoring**

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
| percentage_field_goals_attempted2pt | numeric   |
| percentage_field_goals_attempted3pt | numeric   |
| percentage_points2pt                | numeric   |
| percentage_points_midrange2pt       | numeric   |
| percentage_points3pt                | numeric   |
| percentage_points_fast_break        | numeric   |
| percentage_points_free_throw        | numeric   |
| percentage_points_off_turnovers     | numeric   |
| percentage_points_paint             | numeric   |
| percentage_assisted2pt              | numeric   |
| percentage_unassisted2pt            | numeric   |
| percentage_assisted3pt              | numeric   |
| percentage_unassisted3pt            | numeric   |
| percentage_assisted_fgm             | numeric   |
| percentage_unassisted_fgm           | numeric   |

**home_team_totals_scoring**

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
| percentage_field_goals_attempted2pt | numeric   |
| percentage_field_goals_attempted3pt | numeric   |
| percentage_points2pt                | numeric   |
| percentage_points_midrange2pt       | numeric   |
| percentage_points3pt                | numeric   |
| percentage_points_fast_break        | numeric   |
| percentage_points_free_throw        | numeric   |
| percentage_points_off_turnovers     | numeric   |
| percentage_points_paint             | numeric   |
| percentage_assisted2pt              | numeric   |
| percentage_unassisted2pt            | numeric   |
| percentage_assisted3pt              | numeric   |
| percentage_unassisted3pt            | numeric   |
| percentage_assisted_fgm             | numeric   |
| percentage_unassisted_fgm           | numeric   |

**away_team_totals_scoring**

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
| percentage_field_goals_attempted2pt | numeric   |
| percentage_field_goals_attempted3pt | numeric   |
| percentage_points2pt                | numeric   |
| percentage_points_midrange2pt       | numeric   |
| percentage_points3pt                | numeric   |
| percentage_points_fast_break        | numeric   |
| percentage_points_free_throw        | numeric   |
| percentage_points_off_turnovers     | numeric   |
| percentage_points_paint             | numeric   |
| percentage_assisted2pt              | numeric   |
| percentage_unassisted2pt            | numeric   |
| percentage_assisted3pt              | numeric   |
| percentage_unassisted3pt            | numeric   |
| percentage_assisted_fgm             | numeric   |
| percentage_unassisted_fgm           | numeric   |

## Details

     wnba_boxscorescoringv3(game_id = "1022200034")

## See also

Other WNBA Boxscore V3 Functions:
[`wnba_boxscoreadvancedv3()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoreadvancedv3.md),
[`wnba_boxscorefourfactorsv3()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscorefourfactorsv3.md),
[`wnba_boxscorehustlev2()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscorehustlev2.md),
[`wnba_boxscoremiscv3()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoremiscv3.md),
[`wnba_boxscoreplayertrackv3()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoreplayertrackv3.md),
[`wnba_boxscoretraditionalv3()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoretraditionalv3.md)

## Author

Saiem Gilani
