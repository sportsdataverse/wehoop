# **Get WNBA Stats API Boxscore Traditional V3**

**Get WNBA Stats API Boxscore Traditional V3**

**Get WNBA Stats API Boxscore Traditional V3**

## Usage

``` r
wnba_boxscoretraditionalv3(
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

A list of data frames: home_team_player_traditional,
away_team_player_traditional, home_team_totals_traditional,
away_team_totals_traditional, home_team_starters_totals,
away_team_starters_totals, home_team_bench_totals,
away_team_bench_totals

**home_team_player_traditional**

|                           |           |
|---------------------------|-----------|
| col_name                  | types     |
| game_id                   | character |
| away_team_id              | integer   |
| home_team_id              | integer   |
| team_id                   | integer   |
| team_name                 | character |
| team_city                 | character |
| team_tricode              | character |
| team_slug                 | character |
| person_id                 | integer   |
| first_name                | character |
| family_name               | character |
| name_i                    | character |
| player_slug               | character |
| position                  | character |
| comment                   | character |
| jersey_num                | character |
| minutes                   | character |
| field_goals_made          | integer   |
| field_goals_attempted     | integer   |
| field_goals_percentage    | numeric   |
| three_pointers_made       | integer   |
| three_pointers_attempted  | integer   |
| three_pointers_percentage | numeric   |
| free_throws_made          | integer   |
| free_throws_attempted     | integer   |
| free_throws_percentage    | numeric   |
| rebounds_offensive        | integer   |
| rebounds_defensive        | integer   |
| rebounds_total            | integer   |
| assists                   | integer   |
| steals                    | integer   |
| blocks                    | integer   |
| turnovers                 | integer   |
| fouls_personal            | integer   |
| points                    | integer   |
| plus_minus_points         | numeric   |

**away_team_player_traditional**

|                           |           |
|---------------------------|-----------|
| col_name                  | types     |
| game_id                   | character |
| away_team_id              | integer   |
| home_team_id              | integer   |
| team_id                   | integer   |
| team_name                 | character |
| team_city                 | character |
| team_tricode              | character |
| team_slug                 | character |
| person_id                 | integer   |
| first_name                | character |
| family_name               | character |
| name_i                    | character |
| player_slug               | character |
| position                  | character |
| comment                   | character |
| jersey_num                | character |
| minutes                   | character |
| field_goals_made          | integer   |
| field_goals_attempted     | integer   |
| field_goals_percentage    | numeric   |
| three_pointers_made       | integer   |
| three_pointers_attempted  | integer   |
| three_pointers_percentage | numeric   |
| free_throws_made          | integer   |
| free_throws_attempted     | integer   |
| free_throws_percentage    | numeric   |
| rebounds_offensive        | integer   |
| rebounds_defensive        | integer   |
| rebounds_total            | integer   |
| assists                   | integer   |
| steals                    | integer   |
| blocks                    | integer   |
| turnovers                 | integer   |
| fouls_personal            | integer   |
| points                    | integer   |
| plus_minus_points         | numeric   |

**home_team_totals_traditional**

|                           |           |
|---------------------------|-----------|
| col_name                  | types     |
| game_id                   | character |
| away_team_id              | integer   |
| home_team_id              | integer   |
| team_id                   | integer   |
| team_name                 | character |
| team_city                 | character |
| team_tricode              | character |
| team_slug                 | character |
| minutes                   | character |
| field_goals_made          | integer   |
| field_goals_attempted     | integer   |
| field_goals_percentage    | numeric   |
| three_pointers_made       | integer   |
| three_pointers_attempted  | integer   |
| three_pointers_percentage | numeric   |
| free_throws_made          | integer   |
| free_throws_attempted     | integer   |
| free_throws_percentage    | numeric   |
| rebounds_offensive        | integer   |
| rebounds_defensive        | integer   |
| rebounds_total            | integer   |
| assists                   | integer   |
| steals                    | integer   |
| blocks                    | integer   |
| turnovers                 | integer   |
| fouls_personal            | integer   |
| points                    | integer   |
| plus_minus_points         | numeric   |

**away_team_totals_traditional**

|                           |           |
|---------------------------|-----------|
| col_name                  | types     |
| game_id                   | character |
| away_team_id              | integer   |
| home_team_id              | integer   |
| team_id                   | integer   |
| team_name                 | character |
| team_city                 | character |
| team_tricode              | character |
| team_slug                 | character |
| minutes                   | character |
| field_goals_made          | integer   |
| field_goals_attempted     | integer   |
| field_goals_percentage    | numeric   |
| three_pointers_made       | integer   |
| three_pointers_attempted  | integer   |
| three_pointers_percentage | numeric   |
| free_throws_made          | integer   |
| free_throws_attempted     | integer   |
| free_throws_percentage    | numeric   |
| rebounds_offensive        | integer   |
| rebounds_defensive        | integer   |
| rebounds_total            | integer   |
| assists                   | integer   |
| steals                    | integer   |
| blocks                    | integer   |
| turnovers                 | integer   |
| fouls_personal            | integer   |
| points                    | integer   |
| plus_minus_points         | numeric   |

**home_team_starters_totals**

|                           |           |
|---------------------------|-----------|
| col_name                  | types     |
| game_id                   | character |
| away_team_id              | integer   |
| home_team_id              | integer   |
| team_id                   | integer   |
| team_name                 | character |
| team_city                 | character |
| team_tricode              | character |
| team_slug                 | character |
| minutes                   | character |
| field_goals_made          | integer   |
| field_goals_attempted     | integer   |
| field_goals_percentage    | numeric   |
| three_pointers_made       | integer   |
| three_pointers_attempted  | integer   |
| three_pointers_percentage | numeric   |
| free_throws_made          | integer   |
| free_throws_attempted     | integer   |
| free_throws_percentage    | numeric   |
| rebounds_offensive        | integer   |
| rebounds_defensive        | integer   |
| rebounds_total            | integer   |
| assists                   | integer   |
| steals                    | integer   |
| blocks                    | integer   |
| turnovers                 | integer   |
| fouls_personal            | integer   |
| points                    | integer   |

**away_team_starters_totals**

|                           |           |
|---------------------------|-----------|
| col_name                  | types     |
| game_id                   | character |
| away_team_id              | integer   |
| home_team_id              | integer   |
| team_id                   | integer   |
| team_name                 | character |
| team_city                 | character |
| team_tricode              | character |
| team_slug                 | character |
| minutes                   | character |
| field_goals_made          | integer   |
| field_goals_attempted     | integer   |
| field_goals_percentage    | numeric   |
| three_pointers_made       | integer   |
| three_pointers_attempted  | integer   |
| three_pointers_percentage | numeric   |
| free_throws_made          | integer   |
| free_throws_attempted     | integer   |
| free_throws_percentage    | numeric   |
| rebounds_offensive        | integer   |
| rebounds_defensive        | integer   |
| rebounds_total            | integer   |
| assists                   | integer   |
| steals                    | integer   |
| blocks                    | integer   |
| turnovers                 | integer   |
| fouls_personal            | integer   |
| points                    | integer   |

**home_team_bench_totals**

|                           |           |
|---------------------------|-----------|
| col_name                  | types     |
| game_id                   | character |
| away_team_id              | integer   |
| home_team_id              | integer   |
| team_id                   | integer   |
| team_name                 | character |
| team_city                 | character |
| team_tricode              | character |
| team_slug                 | character |
| minutes                   | character |
| field_goals_made          | integer   |
| field_goals_attempted     | integer   |
| field_goals_percentage    | numeric   |
| three_pointers_made       | integer   |
| three_pointers_attempted  | integer   |
| three_pointers_percentage | numeric   |
| free_throws_made          | integer   |
| free_throws_attempted     | integer   |
| free_throws_percentage    | numeric   |
| rebounds_offensive        | integer   |
| rebounds_defensive        | integer   |
| rebounds_total            | integer   |
| assists                   | integer   |
| steals                    | integer   |
| blocks                    | integer   |
| turnovers                 | integer   |
| fouls_personal            | integer   |
| points                    | integer   |

**away_team_bench_totals**

|                           |           |
|---------------------------|-----------|
| col_name                  | types     |
| game_id                   | character |
| away_team_id              | integer   |
| home_team_id              | integer   |
| team_id                   | integer   |
| team_name                 | character |
| team_city                 | character |
| team_tricode              | character |
| team_slug                 | character |
| minutes                   | character |
| field_goals_made          | integer   |
| field_goals_attempted     | integer   |
| field_goals_percentage    | numeric   |
| three_pointers_made       | integer   |
| three_pointers_attempted  | integer   |
| three_pointers_percentage | numeric   |
| free_throws_made          | integer   |
| free_throws_attempted     | integer   |
| free_throws_percentage    | numeric   |
| rebounds_offensive        | integer   |
| rebounds_defensive        | integer   |
| rebounds_total            | integer   |
| assists                   | integer   |
| steals                    | integer   |
| blocks                    | integer   |
| turnovers                 | integer   |
| fouls_personal            | integer   |
| points                    | integer   |

## Details

     wnba_boxscoretraditionalv3(game_id = "1022200034")

## See also

Other WNBA Boxscore V3 Functions:
[`wnba_boxscoreadvancedv3()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoreadvancedv3.md),
[`wnba_boxscorefourfactorsv3()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscorefourfactorsv3.md),
[`wnba_boxscorehustlev2()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscorehustlev2.md),
[`wnba_boxscoremiscv3()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoremiscv3.md),
[`wnba_boxscoreplayertrackv3()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoreplayertrackv3.md),
[`wnba_boxscorescoringv3()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscorescoringv3.md),
[`wnba_boxscoresummaryv3()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoresummaryv3.md),
[`wnba_boxscoreusagev3()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoreusagev3.md)

## Author

Saiem Gilani
