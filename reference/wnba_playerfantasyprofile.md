# **Get WNBA Stats API Player Fantasy Profile**

**Get WNBA Stats API Player Fantasy Profile**

**Get WNBA Stats API Player Fantasy Profile**

## Usage

``` r
wnba_playerfantasyprofile(
  league_id = "10",
  measure_type = "Base",
  pace_adjust = "N",
  per_mode = "Totals",
  player_id = "1628932",
  plus_minus = "N",
  rank = "N",
  season = most_recent_wnba_season() - 1,
  season_type = "Regular Season",
  ...
)
```

## Arguments

- league_id:

  League - default: '00'. Other options include '10': WNBA, '20':
  G-League

- measure_type:

  measure_type

- pace_adjust:

  Pace Adjustment - Y/N

- per_mode:

  Per Mode - PerGame, Totals

- player_id:

  Player ID

- plus_minus:

  Plus Minus - Y/N

- rank:

  Rank - Y/N

- season:

  Season - format 2020-21

- season_type:

  Season Type - Regular Season, Playoffs, All-Star

- ...:

  Additional arguments passed to an underlying function like httr.

## Value

Return a named list of data frames: DaysRestModified, LastNGames,
Location, Opponent, Overall

**Overall**

|                  |           |                                               |
|------------------|-----------|-----------------------------------------------|
| col_name         | types     | description                                   |
| GROUP_SET        | character |                                               |
| GROUP_VALUE      | character |                                               |
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
| DD2              | character |                                               |
| TD3              | character |                                               |
| FAN_DUEL_PTS     | character |                                               |
| WNBA_FANTASY_PTS | character |                                               |

**Location**

Same columns as the **Overall** table above.

**LastNGames**

Same columns as the **Overall** table above.

**DaysRestModified**

|                  |           |                                               |
|------------------|-----------|-----------------------------------------------|
| col_name         | types     | description                                   |
| GROUP_SET        | character |                                               |
| GROUP_VALUE      | character |                                               |
| SEASON_YEAR      | character | Season year string ('YYYY-YY' format).        |
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
| DD2              | character |                                               |
| TD3              | character |                                               |
| FAN_DUEL_PTS     | character |                                               |
| WNBA_FANTASY_PTS | character |                                               |

**Opponent**

|                 |           |                                               |
|-----------------|-----------|-----------------------------------------------|
| col_name        | types     | description                                   |
| GROUP_SET       | character |                                               |
| GROUP_VALUE     | character |                                               |
| GP              | character | Games played.                                 |
| W               | character | Wins.                                         |
| L               | character | Losses.                                       |
| W_PCT           | character | Wins percentage (0-1 decimal).                |
| MIN             | character | Minutes played.                               |
| FGM             | character | Field goals made.                             |
| FGA             | character | Field goal attempts.                          |
| FG_PCT          | character | Field goal percentage (0-1).                  |
| FG3M            | character | Three-point field goals made.                 |
| FG3A            | character | Three-point field goal attempts.              |
| FG3_PCT         | character | Three-point field goal percentage (0-1).      |
| FTM             | character | Free throws made.                             |
| FTA             | character | Free throw attempts.                          |
| FT_PCT          | character | Free throw percentage (0-1).                  |
| OREB            | character | Offensive rebounds.                           |
| DREB            | character | Defensive rebounds.                           |
| REB             | character | Total rebounds.                               |
| AST             | character | Assists.                                      |
| TOV             | character | Turnovers.                                    |
| STL             | character | Steals.                                       |
| BLK             | character | Blocks.                                       |
| BLKA            | character |                                               |
| PF              | character | Personal fouls.                               |
| PFD             | character |                                               |
| PTS             | character | Points scored.                                |
| PLUS_MINUS      | character | Plus/minus point differential while on court. |
| DD2             | character |                                               |
| TD3             | character |                                               |
| FAN_DUEL_PTS    | character |                                               |
| NBA_FANTASY_PTS | character |                                               |

## Details

     wnba_playerfantasyprofile(player_id = '1628932')

## See also

[family_wnba_player](https://wehoop.sportsdataverse.org/reference/family_wnba_player.md)
lists every function in this family.

Other WNBA Fantasy Functions:
[`wnba_fantasywidget()`](https://wehoop.sportsdataverse.org/reference/wnba_fantasywidget.md),
[`wnba_infographicfanduelplayer()`](https://wehoop.sportsdataverse.org/reference/wnba_infographicfanduelplayer.md),
[`wnba_playerfantasyprofilebargraph()`](https://wehoop.sportsdataverse.org/reference/wnba_playerfantasyprofilebargraph.md)

## Author

Saiem Gilani
