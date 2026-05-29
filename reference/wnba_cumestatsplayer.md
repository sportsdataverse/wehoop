# **Get WNBA Stats API Cumulative Player Stats**

**Get WNBA Stats API Cumulative Player Stats**

**Get WNBA Stats API Cumulative Player Stats**

## Usage

``` r
wnba_cumestatsplayer(
  game_ids = "1022200018",
  league_id = "10",
  player_id = "204319",
  season = "2021-22",
  season_type = "Regular Season",
  team_id = "",
  ...
)
```

## Arguments

- game_ids:

  game_ids

- league_id:

  league_id

- player_id:

  player_id

- season:

  season

- season_type:

  season_type

- team_id:

  team_id

- ...:

  Additional arguments passed to an underlying function like httr.

## Value

Return a named list of data frames: GameByGameStats, TotalPlayerStats

**GameByGameStats**

|                |           |                                          |
|----------------|-----------|------------------------------------------|
| col_name       | types     | description                              |
| DATE_EST       | character |                                          |
| VISITOR_TEAM   | character |                                          |
| HOME_TEAM      | character |                                          |
| GP             | character | Games played.                            |
| GS             | character | Games started.                           |
| ACTUAL_MINUTES | character |                                          |
| ACTUAL_SECONDS | character |                                          |
| FG             | character | Field goals made.                        |
| FGA            | character | Field goal attempts.                     |
| FG_PCT         | character | Field goal percentage (0-1).             |
| FG3            | character |                                          |
| FG3A           | character | Three-point field goal attempts.         |
| FG3_PCT        | character | Three-point field goal percentage (0-1). |
| FT             | character |                                          |
| FTA            | character | Free throw attempts.                     |
| FT_PCT         | character | Free throw percentage (0-1).             |
| OFF_REB        | character |                                          |
| DEF_REB        | character |                                          |
| TOT_REB        | character |                                          |
| AVG_TOT_REB    | character |                                          |
| AST            | character | Assists.                                 |
| PF             | character | Personal fouls.                          |
| DQ             | character |                                          |
| STL            | character | Steals.                                  |
| TURNOVERS      | character | Total turnovers.                         |
| BLK            | character | Blocks.                                  |
| PTS            | character | Points scored.                           |
| AVG_PTS        | character |                                          |

**TotalPlayerStats**

|                    |           |                                           |
|--------------------|-----------|-------------------------------------------|
| col_name           | types     | description                               |
| DISPLAY_FI_LAST    | character |                                           |
| PERSON_ID          | character | Unique player identifier (V3 endpoints).  |
| JERSEY_NUM         | character | Jersey number worn by the player.         |
| GP                 | character | Games played.                             |
| GS                 | character | Games started.                            |
| ACTUAL_MINUTES     | character |                                           |
| ACTUAL_SECONDS     | character |                                           |
| FG                 | character | Field goals made.                         |
| FGA                | character | Field goal attempts.                      |
| FG_PCT             | character | Field goal percentage (0-1).              |
| FG3                | character |                                           |
| FG3A               | character | Three-point field goal attempts.          |
| FG3_PCT            | character | Three-point field goal percentage (0-1).  |
| FT                 | character |                                           |
| FTA                | character | Free throw attempts.                      |
| FT_PCT             | character | Free throw percentage (0-1).              |
| OFF_REB            | character |                                           |
| DEF_REB            | character |                                           |
| TOT_REB            | character |                                           |
| AST                | character | Assists.                                  |
| PF                 | character | Personal fouls.                           |
| DQ                 | character |                                           |
| STL                | character | Steals.                                   |
| TURNOVERS          | character | Total turnovers.                          |
| BLK                | character | Blocks.                                   |
| PTS                | character | Points scored.                            |
| MAX_ACTUAL_MINUTES | character |                                           |
| MAX_ACTUAL_SECONDS | character |                                           |
| MAX_REB            | character |                                           |
| MAX_AST            | character |                                           |
| MAX_STL            | character |                                           |
| MAX_TURNOVERS      | character |                                           |
| MAX_BLK            | character |                                           |
| MAX_PTS            | character |                                           |
| AVG_ACTUAL_MINUTES | character |                                           |
| AVG_ACTUAL_SECONDS | character |                                           |
| AVG_TOT_REB        | character |                                           |
| AVG_AST            | character |                                           |
| AVG_STL            | character |                                           |
| AVG_TURNOVERS      | character | The average turnovers committed per game. |
| AVG_BLK            | character |                                           |
| AVG_PTS            | character |                                           |
| PER_MIN_TOT_REB    | character |                                           |
| PER_MIN_AST        | character |                                           |
| PER_MIN_STL        | character |                                           |
| PER_MIN_TURNOVERS  | character |                                           |
| PER_MIN_BLK        | character |                                           |
| PER_MIN_PTS        | character |                                           |

## Details

      wnba_cumestatsplayer(game_ids = "1022200018", player_id = "204319", season = "2021-22")

## See also

Other WNBA Cume Functions:
[`wnba_cumestatsplayergames()`](https://wehoop.sportsdataverse.org/reference/wnba_cumestatsplayergames.md),
[`wnba_cumestatsteamgames()`](https://wehoop.sportsdataverse.org/reference/wnba_cumestatsteamgames.md),
[`wnba_cumestatsteam()`](https://wehoop.sportsdataverse.org/reference/wnba_cumestatsteam.md)

## Author

Saiem Gilani
