# **Get WNBA Stats API Player vs Player**

**Get WNBA Stats API Player vs Player**

**Get WNBA Stats API Player vs Player**

## Usage

``` r
wnba_playervsplayer(
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
  player_id = "1628932",
  plus_minus = "N",
  rank = "N",
  season = most_recent_wnba_season() - 1,
  season_segment = "",
  season_type = "Regular Season",
  vs_conference = "",
  vs_division = "",
  vs_player_id = "1629488",
  ...
)
```

## Arguments

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

- player_id:

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

- vs_conference:

  vs_conference

- vs_division:

  vs_division

- vs_player_id:

  vs_player_id

- ...:

  Additional arguments passed to an underlying function like httr.

## Value

Return a named list of data frames: OnOffCourt, Overall, PlayerInfo,
ShotAreaOffCourt, ShotAreaOnCourt, ShotAreaOverall,
ShotDistanceOffCourt, ShotDistanceOnCourt, ShotDistanceOverall,
VsPlayerInfo

**Overall**

|                  |           |                                               |
|------------------|-----------|-----------------------------------------------|
| col_name         | types     | description                                   |
| GROUP_SET        | character |                                               |
| GROUP_VALUE      | character |                                               |
| PLAYER_ID        | character | Unique player identifier.                     |
| PLAYER_NAME      | character | Player name.                                  |
| GP               | character | Games played.                                 |
| W                | character | Wins.                                         |
| L                | character | Losses.                                       |
| W_PCT            | character | Wins percentage (0-1 decimal).                |
| MIN              | character | Minutes played.                               |
| FGM              | character | Field goals made.                             |
| FGA              | character | Field goal attempts.                          |
| FG_PCT           | character | Field goal percentage (0-1).                  |
| FG3M             | character | Three-point field goals made.                 |
| FG3A             | character | Three-point field goal attempts.              |
| FG3_PCT          | character | Three-point field goal percentage (0-1).      |
| FTM              | character | Free throws made.                             |
| FTA              | character | Free throw attempts.                          |
| FT_PCT           | character | Free throw percentage (0-1).                  |
| OREB             | character | Offensive rebounds.                           |
| DREB             | character | Defensive rebounds.                           |
| REB              | character | Total rebounds.                               |
| AST              | character | Assists.                                      |
| TOV              | character | Turnovers.                                    |
| STL              | character | Steals.                                       |
| BLK              | character | Blocks.                                       |
| BLKA             | character |                                               |
| PF               | character | Personal fouls.                               |
| PFD              | character |                                               |
| PTS              | character | Points scored.                                |
| PLUS_MINUS       | character | Plus/minus point differential while on court. |
| WNBA_FANTASY_PTS | character |                                               |

**OnOffCourt**

|                  |           |                                               |
|------------------|-----------|-----------------------------------------------|
| col_name         | types     | description                                   |
| GROUP_SET        | character |                                               |
| PLAYER_ID        | character | Unique player identifier.                     |
| PLAYER_NAME      | character | Player name.                                  |
| VS_PLAYER_ID     | character |                                               |
| VS_PLAYER_NAME   | character |                                               |
| COURT_STATUS     | character |                                               |
| GP               | character | Games played.                                 |
| W                | character | Wins.                                         |
| L                | character | Losses.                                       |
| W_PCT            | character | Wins percentage (0-1 decimal).                |
| MIN              | character | Minutes played.                               |
| FGM              | character | Field goals made.                             |
| FGA              | character | Field goal attempts.                          |
| FG_PCT           | character | Field goal percentage (0-1).                  |
| FG3M             | character | Three-point field goals made.                 |
| FG3A             | character | Three-point field goal attempts.              |
| FG3_PCT          | character | Three-point field goal percentage (0-1).      |
| FTM              | character | Free throws made.                             |
| FTA              | character | Free throw attempts.                          |
| FT_PCT           | character | Free throw percentage (0-1).                  |
| OREB             | character | Offensive rebounds.                           |
| DREB             | character | Defensive rebounds.                           |
| REB              | character | Total rebounds.                               |
| AST              | character | Assists.                                      |
| TOV              | character | Turnovers.                                    |
| STL              | character | Steals.                                       |
| BLK              | character | Blocks.                                       |
| BLKA             | character |                                               |
| PF               | character | Personal fouls.                               |
| PFD              | character |                                               |
| PTS              | character | Points scored.                                |
| PLUS_MINUS       | character | Plus/minus point differential while on court. |
| WNBA_FANTASY_PTS | character |                                               |

**ShotDistanceOverall**

|             |           |                              |
|-------------|-----------|------------------------------|
| col_name    | types     | description                  |
| GROUP_SET   | character |                              |
| GROUP_VALUE | character |                              |
| PLAYER_ID   | character | Unique player identifier.    |
| PLAYER_NAME | character | Player name.                 |
| FGM         | character | Field goals made.            |
| FGA         | character | Field goal attempts.         |
| FG_PCT      | character | Field goal percentage (0-1). |

**ShotDistanceOnCourt**

|                |           |                              |
|----------------|-----------|------------------------------|
| col_name       | types     | description                  |
| GROUP_SET      | character |                              |
| PLAYER_ID      | character | Unique player identifier.    |
| PLAYER_NAME    | character | Player name.                 |
| VS_PLAYER_ID   | character |                              |
| VS_PLAYER_NAME | character |                              |
| COURT_STATUS   | character |                              |
| GROUP_VALUE    | character |                              |
| FGM            | character | Field goals made.            |
| FGA            | character | Field goal attempts.         |
| FG_PCT         | character | Field goal percentage (0-1). |

**ShotDistanceOffCourt**

Same columns as the **ShotDistanceOnCourt** table above.

**ShotAreaOverall**

Same columns as the **ShotDistanceOverall** table above.

**ShotAreaOnCourt**

Same columns as the **ShotDistanceOnCourt** table above.

**ShotAreaOffCourt**

Same columns as the **ShotDistanceOnCourt** table above.

**PlayerInfo**

|  |  |  |
|----|----|----|
| col_name | types | description |
| PERSON_ID | character | Unique player identifier (V3 endpoints). |
| FIRST_NAME | character | Player's first name. |
| LAST_NAME | character | Player's last name. |
| DISPLAY_FIRST_LAST | character |  |
| DISPLAY_LAST_COMMA_FIRST | character |  |
| DISPLAY_FI_LAST | character |  |
| BIRTHDATE | character |  |
| SCHOOL | character | Player's school / college (when distinct from 'college'). |
| COUNTRY | character | Country (full name or code). |
| LAST_AFFILIATION | character |  |

**VsPlayerInfo**

Same columns as the **PlayerInfo** table above.

## Details

     wnba_playervsplayer(player_id = '1628932', vs_player_id = '1629488')

## See also

[family_wnba_player](https://wehoop.sportsdataverse.org/reference/family_wnba_player.md)
lists every function in this family.

## Author

Saiem Gilani
