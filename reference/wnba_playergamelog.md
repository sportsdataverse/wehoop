# **Get WNBA Stats API Player Game Log**

**Get WNBA Stats API Player Game Log**

**Get WNBA Stats API Player Game Log**

## Usage

``` r
wnba_playergamelog(
  date_from = "",
  date_to = "",
  league_id = "10",
  player_id = "1628932",
  season = most_recent_wnba_season() - 1,
  season_type = "Regular Season",
  ...
)
```

## Arguments

- date_from:

  date_from

- date_to:

  date_to

- league_id:

  League - default: '00'. Other options include '10': WNBA, '20':
  G-League

- player_id:

  Player ID

- season:

  Season - format 2020-21

- season_type:

  Season Type - Regular Season, Playoffs, All-Star

- ...:

  Additional arguments passed to an underlying function like httr.

## Value

Return a named list of data frames: PlayerGameLog

**PlayerGameLog**

|                 |           |                                               |
|-----------------|-----------|-----------------------------------------------|
| col_name        | types     | description                                   |
| SEASON_ID       | character | Unique season identifier.                     |
| Player_ID       | character | Unique player identifier.                     |
| Game_ID         | character | Unique game identifier.                       |
| GAME_DATE       | character | Game date (YYYY-MM-DD).                       |
| MATCHUP         | character | Matchup.                                      |
| WL              | character |                                               |
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
| STL             | character | Steals.                                       |
| BLK             | character | Blocks.                                       |
| TOV             | character | Turnovers.                                    |
| PF              | character | Personal fouls.                               |
| PTS             | character | Points scored.                                |
| PLUS_MINUS      | character | Plus/minus point differential while on court. |
| VIDEO_AVAILABLE | character | Video available.                              |

## Details

      wnba_playergamelog(player_id = '1628932')

## See also

[family_wnba_player](https://wehoop.sportsdataverse.org/reference/family_wnba_player.md)
lists every function in this family.

## Author

Saiem Gilani
