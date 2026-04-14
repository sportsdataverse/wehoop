# **Get WNBA Stats API play-by-play**

**Get WNBA Stats API play-by-play**

**Get WNBA Stats API play-by-play**

## Usage

``` r
wnba_pbp(game_id, on_court = TRUE, version = "v3", p = NULL, ...)
```

## Arguments

- game_id:

  Game ID

- on_court:

  IF TRUE will be added ID of players on court

- version:

  Play-by-play version - `"v3"` (default) or `"v2"`. V3 returns richer
  data with shot coordinates, shot values, and V3 action types. V2 is
  available from 2016-17 onwards.

- p:

  Progress bar

- ...:

  Additional arguments passed to an underlying function like httr.

## Value

Returns a data frame: PlayByPlay

|                           |           |
|---------------------------|-----------|
| col_name                  | types     |
| game_id                   | character |
| event_num                 | character |
| event_type                | character |
| event_action_type         | character |
| period                    | numeric   |
| minute_game               | numeric   |
| time_remaining            | numeric   |
| wc_time_string            | character |
| time_quarter              | character |
| minute_remaining_quarter  | numeric   |
| seconds_remaining_quarter | numeric   |
| home_description          | character |
| neutral_description       | character |
| visitor_description       | character |
| score                     | character |
| away_score                | numeric   |
| home_score                | numeric   |
| score_margin              | character |
| person1type               | character |
| player1_id                | character |
| player1_name              | character |
| player1_team_id           | character |
| player1_team_city         | character |
| player1_team_nickname     | character |
| player1_team_abbreviation | character |
| person2type               | character |
| player2_id                | character |
| player2_name              | character |
| player2_team_id           | character |
| player2_team_city         | character |
| player2_team_nickname     | character |
| player2_team_abbreviation | character |
| person3type               | character |
| player3_id                | character |
| player3_name              | character |
| player3_team_id           | character |
| player3_team_city         | character |
| player3_team_nickname     | character |
| player3_team_abbreviation | character |
| video_available_flag      | character |
| team_leading              | character |

## Details

     wnba_pbp(game_id = "1022200034", on_court = TRUE)

## See also

Other WNBA PBP Functions:
[`wnba_data_pbp()`](https://wehoop.sportsdataverse.org/reference/wnba_data_pbp.md),
[`wnba_live_pbp()`](https://wehoop.sportsdataverse.org/reference/wnba_live_pbp.md),
[`wnba_pbps()`](https://wehoop.sportsdataverse.org/reference/wnba_pbps.md),
[`wnba_playbyplayv3()`](https://wehoop.sportsdataverse.org/reference/wnba_playbyplayv3.md)
