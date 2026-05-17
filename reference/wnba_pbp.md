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

|  |  |  |
|----|----|----|
| col_name | types | description |
| game_id | character | Unique game identifier. |
| event_num | character | Sequential event number within the game (V2 PBP). |
| event_type | character | Event / play type code (V2 PBP). |
| event_action_type | character | Numeric event-action-type code (V2 PBP). |
| period | numeric | Period of the game (1-4 quarters; 5+ for OT). |
| minute_game | numeric | Minute game. |
| time_remaining | numeric | Time remaining. |
| wc_time_string | character | Wc time string. |
| time_quarter | character | Time quarter. |
| minute_remaining_quarter | numeric | Minute remaining quarter. |
| seconds_remaining_quarter | numeric | Seconds remaining quarter. |
| home_description | character | Home team's description. |
| neutral_description | character | Neutral description. |
| visitor_description | character | Visitor description. |
| score | character | Final score. |
| away_score | numeric | Away team score at the time of the play. |
| home_score | numeric | Home team score at the time of the play. |
| score_margin | character | Score margin. |
| person1type | character | Person1type. |
| player1_id | character | V2 PBP primary player ID (e.g. shooter / fouler). |
| player1_name | character | V2 PBP primary player name. |
| player1_team_id | character | Team ID of player1. |
| player1_team_city | character | Player1 team city. |
| player1_team_nickname | character | Player1 team nickname. |
| player1_team_abbreviation | character | Player1 team abbreviation. |
| person2type | character | Person2type. |
| player2_id | character | V2 PBP secondary player ID (e.g. assister / fouled-by). |
| player2_name | character | V2 PBP secondary player name. |
| player2_team_id | character | Team ID of player2. |
| player2_team_city | character | Player2 team city. |
| player2_team_nickname | character | Player2 team nickname. |
| player2_team_abbreviation | character | Player2 team abbreviation. |
| person3type | character | Person3type. |
| player3_id | character | V2 PBP tertiary player ID (e.g. blocker). |
| player3_name | character | V2 PBP tertiary player name. |
| player3_team_id | character | Team ID of player3. |
| player3_team_city | character | Player3 team city. |
| player3_team_nickname | character | Player3 team nickname. |
| player3_team_abbreviation | character | Player3 team abbreviation. |
| video_available_flag | character | Video available flag. |
| team_leading | character | Team leading. |

## Details

     wnba_pbp(game_id = "1022200034", on_court = TRUE)

## See also

Other WNBA PBP Functions:
[`wnba_data_pbp()`](https://wehoop.sportsdataverse.org/reference/wnba_data_pbp.md),
[`wnba_live_pbp()`](https://wehoop.sportsdataverse.org/reference/wnba_live_pbp.md),
[`wnba_pbps()`](https://wehoop.sportsdataverse.org/reference/wnba_pbps.md),
[`wnba_playbyplayv3()`](https://wehoop.sportsdataverse.org/reference/wnba_playbyplayv3.md)
