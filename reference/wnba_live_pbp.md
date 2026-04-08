# **Get WNBA Stats API Live play-by-play**

**Get WNBA Stats API Live play-by-play**

**Get WNBA Stats API Live play-by-play**

## Usage

``` r
wnba_live_pbp(game_id, ...)
```

## Arguments

- game_id:

  Game ID

- ...:

  Additional arguments passed to an underlying function like httr.

## Value

Returns a data frame: PlayByPlay

|                              |           |
|------------------------------|-----------|
| col_name                     | types     |
| event_num                    | integer   |
| clock                        | character |
| time_actual                  | character |
| period                       | integer   |
| period_type                  | character |
| action_type                  | character |
| sub_type                     | character |
| qualifiers                   | list      |
| player1_id                   | integer   |
| x                            | numeric   |
| y                            | numeric   |
| offense_team_id              | integer   |
| home_score                   | character |
| away_score                   | character |
| edited                       | character |
| order                        | integer   |
| x_legacy                     | integer   |
| y_legacy                     | integer   |
| is_field_goal                | integer   |
| side                         | character |
| description                  | character |
| person_ids_filter            | list      |
| team_id                      | integer   |
| team_tricode                 | character |
| descriptor                   | character |
| jump_ball_recovered_name     | character |
| jump_ball_recoverd_person_id | integer   |
| player_name                  | character |
| player_name_i                | character |
| jump_ball_won_player_name    | character |
| jump_ball_won_person_id      | integer   |
| jump_ball_lost_player_name   | character |
| jump_ball_lost_person_id     | integer   |
| shot_distance                | numeric   |
| shot_result                  | character |
| shot_action_number           | integer   |
| rebound_total                | integer   |
| rebound_defensive_total      | integer   |
| rebound_offensive_total      | integer   |
| turnover_total               | integer   |
| steal_player_name            | character |
| steal_person_id              | integer   |
| points_total                 | integer   |
| assist_player_name_initial   | character |
| assist_person_id             | integer   |
| assist_total                 | integer   |
| official_id                  | integer   |
| foul_personal_total          | integer   |
| foul_technical_total         | integer   |
| foul_drawn_player_name       | character |
| foul_drawn_person_id         | integer   |
| block_player_name            | character |
| block_person_id              | integer   |
| value                        | character |
| player2_id                   | integer   |
| player3_id                   | integer   |

## Details

      wnba_live_pbp(game_id = "1022200034")

## See also

Other WNBA PBP Functions:
[`wnba_data_pbp()`](https://wehoop.sportsdataverse.org/reference/wnba_data_pbp.md),
[`wnba_pbps()`](https://wehoop.sportsdataverse.org/reference/wnba_pbps.md),
[`wnba_pbp()`](https://wehoop.sportsdataverse.org/reference/wnba_pbp.md)

Other WNBA Live Functions:
[`wnba_todays_scoreboard()`](https://wehoop.sportsdataverse.org/reference/wnba_todays_scoreboard.md)

## Author

Saiem Gilani
