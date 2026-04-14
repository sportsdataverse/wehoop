# **Get WNBA Stats API Boxscore Hustle V2**

**Get WNBA Stats API Boxscore Hustle V2**

**Get WNBA Stats API Boxscore Hustle V2**

## Usage

``` r
wnba_boxscorehustlev2(game_id = "1022200034", ...)
```

## Arguments

- game_id:

  Game ID

- ...:

  Additional arguments passed to an underlying function like httr.

## Value

Returns a named list of data frames: home_team_player_hustle,
away_team_player_hustle, home_team_hustle_totals,
away_team_hustle_totals

**home_team_player_hustle**

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
| points                          | integer   |
| contested_shots                 | integer   |
| contested_shots2pt              | integer   |
| contested_shots3pt              | integer   |
| deflections                     | integer   |
| charges_drawn                   | integer   |
| screen_assists                  | integer   |
| screen_assist_points            | integer   |
| loose_balls_recovered_offensive | integer   |
| loose_balls_recovered_defensive | integer   |
| loose_balls_recovered_total     | integer   |
| offensive_box_outs              | integer   |
| defensive_box_outs              | integer   |
| box_out_player_team_rebounds    | integer   |
| box_out_player_rebounds         | integer   |
| box_outs                        | integer   |

**away_team_player_hustle**

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
| points                          | integer   |
| contested_shots                 | integer   |
| contested_shots2pt              | integer   |
| contested_shots3pt              | integer   |
| deflections                     | integer   |
| charges_drawn                   | integer   |
| screen_assists                  | integer   |
| screen_assist_points            | integer   |
| loose_balls_recovered_offensive | integer   |
| loose_balls_recovered_defensive | integer   |
| loose_balls_recovered_total     | integer   |
| offensive_box_outs              | integer   |
| defensive_box_outs              | integer   |
| box_out_player_team_rebounds    | integer   |
| box_out_player_rebounds         | integer   |
| box_outs                        | integer   |

**home_team_totals_hustle**

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
| minutes                         | character |
| points                          | integer   |
| contested_shots                 | integer   |
| contested_shots2pt              | integer   |
| contested_shots3pt              | integer   |
| deflections                     | integer   |
| charges_drawn                   | integer   |
| screen_assists                  | integer   |
| screen_assist_points            | integer   |
| loose_balls_recovered_offensive | integer   |
| loose_balls_recovered_defensive | integer   |
| loose_balls_recovered_total     | integer   |
| offensive_box_outs              | integer   |
| defensive_box_outs              | integer   |
| box_out_player_team_rebounds    | integer   |
| box_out_player_rebounds         | integer   |
| box_outs                        | integer   |

**away_team_totals_hustle**

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
| minutes                         | character |
| points                          | integer   |
| contested_shots                 | integer   |
| contested_shots2pt              | integer   |
| contested_shots3pt              | integer   |
| deflections                     | integer   |
| charges_drawn                   | integer   |
| screen_assists                  | integer   |
| screen_assist_points            | integer   |
| loose_balls_recovered_offensive | integer   |
| loose_balls_recovered_defensive | integer   |
| loose_balls_recovered_total     | integer   |
| offensive_box_outs              | integer   |
| defensive_box_outs              | integer   |
| box_out_player_team_rebounds    | integer   |
| box_out_player_rebounds         | integer   |
| box_outs                        | integer   |

## Details

      wnba_boxscorehustlev2(game_id = "1022200034")

## See also

Other WNBA Boxscore V3 Functions:
[`wnba_boxscoreadvancedv3()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoreadvancedv3.md),
[`wnba_boxscorefourfactorsv3()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscorefourfactorsv3.md),
[`wnba_boxscoremiscv3()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoremiscv3.md),
[`wnba_boxscoreplayertrackv3()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoreplayertrackv3.md),
[`wnba_boxscorescoringv3()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscorescoringv3.md),
[`wnba_boxscoresummaryv3()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoresummaryv3.md),
[`wnba_boxscoretraditionalv3()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoretraditionalv3.md),
[`wnba_boxscoreusagev3()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoreusagev3.md)

## Author

Saiem Gilani
