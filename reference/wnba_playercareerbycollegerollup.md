# **Get WNBA Stats API Player Career By College Rollup**

**Get WNBA Stats API Player Career By College Rollup**

**Get WNBA Stats API Player Career By College Rollup**

## Usage

``` r
wnba_playercareerbycollegerollup(
  league_id = "10",
  per_mode = "Totals",
  season = most_recent_wnba_season() - 1,
  season_type = "Regular Season",
  ...
)
```

## Arguments

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

Return a named list of data frames: East, Midwest, South, West

**East**

|          |           |                                          |
|----------|-----------|------------------------------------------|
| col_name | types     | description                              |
| REGION   | character | Region label.                            |
| SEED     | character | Tournament seed.                         |
| COLLEGE  | character | College or school attended.              |
| PLAYERS  | character |                                          |
| GP       | character | Games played.                            |
| MIN      | character | Minutes played.                          |
| FGM      | character | Field goals made.                        |
| FGA      | character | Field goal attempts.                     |
| FG_PCT   | character | Field goal percentage (0-1).             |
| FG3M     | character | Three-point field goals made.            |
| FG3A     | character | Three-point field goal attempts.         |
| FG3_PCT  | character | Three-point field goal percentage (0-1). |
| FTM      | character | Free throws made.                        |
| FTA      | character | Free throw attempts.                     |
| FT_PCT   | character | Free throw percentage (0-1).             |
| OREB     | character | Offensive rebounds.                      |
| DREB     | character | Defensive rebounds.                      |
| REB      | character | Total rebounds.                          |
| AST      | character | Assists.                                 |
| STL      | character | Steals.                                  |
| BLK      | character | Blocks.                                  |
| TOV      | character | Turnovers.                               |
| PF       | character | Personal fouls.                          |
| PTS      | character | Points scored.                           |

**South**

Same columns as the **East** table above.

**Midwest**

Same columns as the **East** table above.

**West**

Same columns as the **East** table above.

## Details

     wnba_playercareerbycollegerollup(per_mode = 'Totals')

## See also

[family_wnba_player](https://wehoop.sportsdataverse.org/reference/family_wnba_player.md)
lists every function in this family.

## Author

Saiem Gilani
