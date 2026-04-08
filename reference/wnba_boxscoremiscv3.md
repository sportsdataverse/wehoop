# **Get WNBA Stats API Boxscore Misc V3**

**Get WNBA Stats API Boxscore Misc V3**

**Get WNBA Stats API Boxscore Misc V3**

## Usage

``` r
wnba_boxscoremiscv3(
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

A list of data frames: home_team_player_misc, away_team_player_misc,
home_team_totals_misc, away_team_totals_misc

**home_team_player_misc**

|                          |           |
|--------------------------|-----------|
| col_name                 | types     |
| game_id                  | character |
| away_team_id             | integer   |
| home_team_id             | integer   |
| team_id                  | integer   |
| team_name                | character |
| team_city                | character |
| team_tricode             | character |
| team_slug                | character |
| person_id                | integer   |
| first_name               | character |
| family_name              | character |
| name_i                   | character |
| player_slug              | character |
| position                 | character |
| comment                  | character |
| jersey_num               | character |
| minutes                  | character |
| points_off_turnovers     | integer   |
| points_second_chance     | integer   |
| points_fast_break        | integer   |
| points_paint             | integer   |
| opp_points_off_turnovers | integer   |
| opp_points_second_chance | integer   |
| opp_points_fast_break    | integer   |
| opp_points_paint         | integer   |
| blocks                   | integer   |
| blocks_against           | integer   |
| fouls_personal           | integer   |
| fouls_drawn              | integer   |

**away_team_player_misc**

|                          |           |
|--------------------------|-----------|
| col_name                 | types     |
| game_id                  | character |
| away_team_id             | integer   |
| home_team_id             | integer   |
| team_id                  | integer   |
| team_name                | character |
| team_city                | character |
| team_tricode             | character |
| team_slug                | character |
| person_id                | integer   |
| first_name               | character |
| family_name              | character |
| name_i                   | character |
| player_slug              | character |
| position                 | character |
| comment                  | character |
| jersey_num               | character |
| minutes                  | character |
| points_off_turnovers     | integer   |
| points_second_chance     | integer   |
| points_fast_break        | integer   |
| points_paint             | integer   |
| opp_points_off_turnovers | integer   |
| opp_points_second_chance | integer   |
| opp_points_fast_break    | integer   |
| opp_points_paint         | integer   |
| blocks                   | integer   |
| blocks_against           | integer   |
| fouls_personal           | integer   |
| fouls_drawn              | integer   |

**home_team_totals_misc**

|                          |           |
|--------------------------|-----------|
| col_name                 | types     |
| game_id                  | character |
| away_team_id             | integer   |
| home_team_id             | integer   |
| team_id                  | integer   |
| team_name                | character |
| team_city                | character |
| team_tricode             | character |
| team_slug                | character |
| minutes                  | character |
| points_off_turnovers     | integer   |
| points_second_chance     | integer   |
| points_fast_break        | integer   |
| points_paint             | integer   |
| opp_points_off_turnovers | integer   |
| opp_points_second_chance | integer   |
| opp_points_fast_break    | integer   |
| opp_points_paint         | integer   |
| blocks                   | integer   |
| blocks_against           | integer   |
| fouls_personal           | integer   |
| fouls_drawn              | integer   |

**away_team_totals_misc**

|                          |           |
|--------------------------|-----------|
| col_name                 | types     |
| game_id                  | character |
| away_team_id             | integer   |
| home_team_id             | integer   |
| team_id                  | integer   |
| team_name                | character |
| team_city                | character |
| team_tricode             | character |
| team_slug                | character |
| minutes                  | character |
| points_off_turnovers     | integer   |
| points_second_chance     | integer   |
| points_fast_break        | integer   |
| points_paint             | integer   |
| opp_points_off_turnovers | integer   |
| opp_points_second_chance | integer   |
| opp_points_fast_break    | integer   |
| opp_points_paint         | integer   |
| blocks                   | integer   |
| blocks_against           | integer   |
| fouls_personal           | integer   |
| fouls_drawn              | integer   |

## Details

     wnba_boxscoremiscv3(game_id = "1022200034")

## See also

Other WNBA Boxscore V3 Functions:
[`wnba_boxscoreadvancedv3()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoreadvancedv3.md),
[`wnba_boxscorefourfactorsv3()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscorefourfactorsv3.md),
[`wnba_boxscorehustlev2()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscorehustlev2.md),
[`wnba_boxscoreplayertrackv3()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoreplayertrackv3.md),
[`wnba_boxscorescoringv3()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscorescoringv3.md),
[`wnba_boxscoretraditionalv3()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoretraditionalv3.md)

## Author

Saiem Gilani
