# **Get WNBA Stats API Player Career By College**

**Get WNBA Stats API Player Career By College**

**Get WNBA Stats API Player Career By College**

## Usage

``` r
wnba_playercareerbycollege(
  college = "Florida State",
  league_id = "10",
  per_mode = "Totals",
  season = most_recent_wnba_season() - 1,
  season_type = "Regular Season",
  ...
)
```

## Arguments

- college:

  College Name

- league_id:

  League - default: '00'. Other options include '10': WNBA, '20':
  G-League

- per_mode:

  Per Mode - PerGame, Totals

- season:

  Season - format 2020-21

- season_type:

  Season Type - Regular Season, Playoffs, All-Star

- ...:

  Additional arguments passed to an underlying function like httr.

## Value

Return a named list of data frames: PlayerCareerByCollege

**PlayerCareerByCollege**

|             |           |                                          |
|-------------|-----------|------------------------------------------|
| col_name    | types     | description                              |
| PLAYER_ID   | character | Unique player identifier.                |
| PLAYER_NAME | character | Player name.                             |
| COLLEGE     | character | College or school attended.              |
| GP          | character | Games played.                            |
| MIN         | character | Minutes played.                          |
| FGM         | character | Field goals made.                        |
| FGA         | character | Field goal attempts.                     |
| FG_PCT      | character | Field goal percentage (0-1).             |
| FG3M        | character | Three-point field goals made.            |
| FG3A        | character | Three-point field goal attempts.         |
| FG3_PCT     | character | Three-point field goal percentage (0-1). |
| FTM         | character | Free throws made.                        |
| FTA         | character | Free throw attempts.                     |
| FT_PCT      | character | Free throw percentage (0-1).             |
| OREB        | character | Offensive rebounds.                      |
| DREB        | character | Defensive rebounds.                      |
| REB         | character | Total rebounds.                          |
| AST         | character | Assists.                                 |
| TOV         | character | Turnovers.                               |
| STL         | character | Steals.                                  |
| BLK         | character | Blocks.                                  |
| PF          | character | Personal fouls.                          |
| PTS         | character | Points scored.                           |

## Details

      wnba_playercareerbycollege(college = 'Florida State', per_mode = 'PerGame')

## See also

[family_wnba_player](https://wehoop.sportsdataverse.org/reference/family_wnba_player.md)
lists every function in this family.

## Author

Saiem Gilani
