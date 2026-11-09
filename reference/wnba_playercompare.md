# **Get WNBA Stats API Player Compare**

**Get WNBA Stats API Player Compare**

**Get WNBA Stats API Player Compare**

## Usage

``` r
wnba_playercompare(
  conference = "",
  date_from = "",
  date_to = "",
  game_segment = "",
  last_n_games = 0,
  league_id = "10",
  location = "",
  measure_type = "Base",
  month = 0,
  opponent_team_id = 0,
  outcome = "",
  pace_adjust = "N",
  per_mode = "Totals",
  period = 0,
  player_id_list = "100720,202250,204319,1627668,1628931",
  plus_minus = "N",
  rank = "N",
  season = most_recent_wnba_season() - 1,
  season_segment = "",
  season_type = "Regular Season",
  shot_clock_range = "",
  vs_conference = "",
  vs_division = "",
  vs_player_id_list = "202252,203399,1631022,1628878,204333",
  ...
)
```

## Arguments

- conference:

  conference

- date_from:

  date_from

- date_to:

  date_to

- game_segment:

  game_segment

- last_n_games:

  last_n_games

- league_id:

  League - default: '00'. Other options include '10': WNBA, '20':
  G-League

- location:

  location

- measure_type:

  measure_type

- month:

  month

- opponent_team_id:

  opponent_team_id

- outcome:

  outcome

- pace_adjust:

  pace_adjust

- per_mode:

  per_mode

- period:

  period

- player_id_list:

  Player ID

- plus_minus:

  plus_minus

- rank:

  rank

- season:

  Season - format 2020-21

- season_segment:

  season_segment

- season_type:

  Season Type - Regular Season, Playoffs, All-Star

- shot_clock_range:

  shot_clock_range

- vs_conference:

  vs_conference

- vs_division:

  vs_division

- vs_player_id_list:

  vs_player_id_list

- ...:

  Additional arguments passed to an underlying function like httr.

## Value

Return a named list of data frames: Individual, OverallCompare

**OverallCompare**

|             |           |                                               |
|-------------|-----------|-----------------------------------------------|
| col_name    | types     | description                                   |
| GROUP_SET   | character |                                               |
| DESCRIPTION | character | Long-form description text.                   |
| MIN         | character | Minutes played.                               |
| FGM         | character | Field goals made.                             |
| FGA         | character | Field goal attempts.                          |
| FG_PCT      | character | Field goal percentage (0-1).                  |
| FG3M        | character | Three-point field goals made.                 |
| FG3A        | character | Three-point field goal attempts.              |
| FG3_PCT     | character | Three-point field goal percentage (0-1).      |
| FTM         | character | Free throws made.                             |
| FTA         | character | Free throw attempts.                          |
| FT_PCT      | character | Free throw percentage (0-1).                  |
| OREB        | character | Offensive rebounds.                           |
| DREB        | character | Defensive rebounds.                           |
| REB         | character | Total rebounds.                               |
| AST         | character | Assists.                                      |
| TOV         | character | Turnovers.                                    |
| STL         | character | Steals.                                       |
| BLK         | character | Blocks.                                       |
| BLKA        | character |                                               |
| PF          | character | Personal fouls.                               |
| PFD         | character |                                               |
| PTS         | character | Points scored.                                |
| PLUS_MINUS  | character | Plus/minus point differential while on court. |

**Individual**

Same columns as the **OverallCompare** table above.

## Details

     wnba_playercompare(player_id_list = '100720,202250,204319,1627668,1628931', vs_player_id_list = '202252,203399,1631022,1628878,204333')

## See also

[family_wnba_player](https://wehoop.sportsdataverse.org/reference/family_wnba_player.md)
lists every function in this family.

## Author

Saiem Gilani
