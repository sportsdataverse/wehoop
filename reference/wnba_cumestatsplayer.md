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

|                |           |
|----------------|-----------|
| col_name       | types     |
| DATE_EST       | character |
| VISITOR_TEAM   | character |
| HOME_TEAM      | character |
| GP             | character |
| GS             | character |
| ACTUAL_MINUTES | character |
| ACTUAL_SECONDS | character |
| FG             | character |
| FGA            | character |
| FG_PCT         | character |
| FG3            | character |
| FG3A           | character |
| FG3_PCT        | character |
| FT             | character |
| FTA            | character |
| FT_PCT         | character |
| OFF_REB        | character |
| DEF_REB        | character |
| TOT_REB        | character |
| AVG_TOT_REB    | character |
| AST            | character |
| PF             | character |
| DQ             | character |
| STL            | character |
| TURNOVERS      | character |
| BLK            | character |
| PTS            | character |
| AVG_PTS        | character |

**TotalPlayerStats**

|                    |           |
|--------------------|-----------|
| col_name           | types     |
| DISPLAY_FI_LAST    | character |
| PERSON_ID          | character |
| JERSEY_NUM         | character |
| GP                 | character |
| GS                 | character |
| ACTUAL_MINUTES     | character |
| ACTUAL_SECONDS     | character |
| FG                 | character |
| FGA                | character |
| FG_PCT             | character |
| FG3                | character |
| FG3A               | character |
| FG3_PCT            | character |
| FT                 | character |
| FTA                | character |
| FT_PCT             | character |
| OFF_REB            | character |
| DEF_REB            | character |
| TOT_REB            | character |
| AST                | character |
| PF                 | character |
| DQ                 | character |
| STL                | character |
| TURNOVERS          | character |
| BLK                | character |
| PTS                | character |
| MAX_ACTUAL_MINUTES | character |
| MAX_ACTUAL_SECONDS | character |
| MAX_REB            | character |
| MAX_AST            | character |
| MAX_STL            | character |
| MAX_TURNOVERS      | character |
| MAX_BLK            | character |
| MAX_PTS            | character |
| AVG_ACTUAL_MINUTES | character |
| AVG_ACTUAL_SECONDS | character |
| AVG_TOT_REB        | character |
| AVG_AST            | character |
| AVG_STL            | character |
| AVG_TURNOVERS      | character |
| AVG_BLK            | character |
| AVG_PTS            | character |
| PER_MIN_TOT_REB    | character |
| PER_MIN_AST        | character |
| PER_MIN_STL        | character |
| PER_MIN_TURNOVERS  | character |
| PER_MIN_BLK        | character |
| PER_MIN_PTS        | character |

## Details

      wnba_cumestatsplayer(game_ids = "1022200018", player_id = "204319", season = "2021-22")

## See also

Other WNBA Cume Functions:
[`wnba_cumestatsplayergames()`](https://wehoop.sportsdataverse.org/reference/wnba_cumestatsplayergames.md),
[`wnba_cumestatsteam()`](https://wehoop.sportsdataverse.org/reference/wnba_cumestatsteam.md),
[`wnba_cumestatsteamgames()`](https://wehoop.sportsdataverse.org/reference/wnba_cumestatsteamgames.md)

## Author

Saiem Gilani
