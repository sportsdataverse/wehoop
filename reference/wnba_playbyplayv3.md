# **Get WNBA Stats API Play-by-Play V3**

**Get WNBA Stats API Play-by-Play V3**

**Get WNBA Stats API Play-by-Play V3**

## Usage

``` r
wnba_playbyplayv3(game_id, start_period = 0, end_period = 0, ...)
```

## Arguments

- game_id:

  Game ID - 10-digit zero-padded ID (e.g., '1022200034')

- start_period:

  Start period filter (default: 0 = all periods).

- end_period:

  End period filter (default: 0 = all periods).

- ...:

  Additional arguments passed to an underlying function like httr.

## Value

Returns a named list of data frames: PlayByPlay, AvailableVideo

**PlayByPlay**

|  |  |  |
|----|----|----|
| col_name | types | description |
| game_id | character | Unique game identifier. |
| action_number | integer | Sequential action number within a game (V3 PBP). |
| clock | character | Game clock value. |
| period | integer | Period of the game (1-4 quarters; 5+ for OT). |
| team_id | integer | Unique team identifier. |
| team_tricode | character | Three-letter team code (e.g. 'LAS' / 'NYL'). |
| person_id | integer | Unique player identifier (V3 endpoints). |
| player_name | character | Player name. |
| player_name_i | character | Player name i. |
| x_legacy | integer | V2-format X coordinate (preserved for V3-to-V2 compatibility). |
| y_legacy | integer | V2-format Y coordinate (preserved for V3-to-V2 compatibility). |
| shot_distance | numeric | Shot distance from the basket, in feet. |
| shot_result | character | Shot result ('Made' / 'Missed'). |
| is_field_goal | integer | 1 if the action was a field goal; 0 otherwise. |
| score_home | character | Score home. |
| score_away | character | Score away. |
| points_total | integer | Running total of points scored. |
| location | character | Filter results by game location. |
| description | character | Long-form description text. |
| action_type | character | Action type label (e.g. 'Made Shot', 'Substitution'). |
| sub_type | character | Action sub-type label. |
| video_available | integer | Video available. |
| shot_value | integer | Point value of the shot (2 or 3). |
| action_id | integer | Unique action identifier within a game (V3 PBP). |

**AvailableVideo**

|                 |         |                  |
|-----------------|---------|------------------|
| col_name        | types   | description      |
| video_available | integer | Video available. |

## Details

     wnba_playbyplayv3(game_id = "1022200034")

## See also

Other WNBA PBP Functions:
[`wnba_data_pbp()`](https://wehoop.sportsdataverse.org/reference/wnba_data_pbp.md),
[`wnba_live_pbp()`](https://wehoop.sportsdataverse.org/reference/wnba_live_pbp.md),
[`wnba_pbps()`](https://wehoop.sportsdataverse.org/reference/wnba_pbps.md),
[`wnba_pbp()`](https://wehoop.sportsdataverse.org/reference/wnba_pbp.md)

## Author

Saiem Gilani
