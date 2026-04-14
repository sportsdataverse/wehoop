# **Get WNBA Stats API Cumulative Team Stats**

**Get WNBA Stats API Cumulative Team Stats**

**Get WNBA Stats API Cumulative Team Stats**

## Usage

``` r
wnba_cumestatsteam(
  game_ids = "1022200018",
  league_id = "10",
  season = "2021-22",
  season_type = "Regular Season",
  team_id = "1611661317",
  ...
)
```

## Arguments

- game_ids:

  game_ids

- league_id:

  league_id

- season:

  season

- season_type:

  season_type

- team_id:

  team_id

- ...:

  Additional arguments passed to an underlying function like httr.

## Value

Returns a named list of data frames: GameByGameStats, TotalTeamStats

**GameByGameStats**

|                    |           |
|--------------------|-----------|
| col_name           | types     |
| JERSEY_NUM         | character |
| PLAYER             | character |
| PERSON_ID          | character |
| TEAM_ID            | character |
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
| MAX_BLKP           | character |
| MAX_PTS            | character |
| AVG_ACTUAL_MINUTES | character |
| AVG_ACTUAL_SECONDS | character |
| AVG_REB            | character |
| AVG_AST            | character |
| AVG_STL            | character |
| AVG_TURNOVERS      | character |
| AVG_BLKP           | character |
| AVG_PTS            | character |
| PER_MIN_REB        | character |
| PER_MIN_AST        | character |
| PER_MIN_STL        | character |
| PER_MIN_TURNOVERS  | character |
| PER_MIN_BLK        | character |
| PER_MIN_PTS        | character |

**TotalTeamStats**

|                 |           |
|-----------------|-----------|
| col_name        | types     |
| CITY            | character |
| NICKNAME        | character |
| TEAM_ID         | character |
| W               | character |
| L               | character |
| W_HOME          | character |
| L_HOME          | character |
| W_ROAD          | character |
| L_ROAD          | character |
| TEAM_TURNOVERS  | character |
| TEAM_REBOUNDS   | character |
| GP              | character |
| GS              | character |
| ACTUAL_MINUTES  | character |
| ACTUAL_SECONDS  | character |
| FG              | character |
| FGA             | character |
| FG_PCT          | character |
| FG3             | character |
| FG3A            | character |
| FG3_PCT         | character |
| FT              | character |
| FTA             | character |
| FT_PCT          | character |
| OFF_REB         | character |
| DEF_REB         | character |
| TOT_REB         | character |
| AST             | character |
| PF              | character |
| STL             | character |
| TOTAL_TURNOVERS | character |
| BLK             | character |
| PTS             | character |
| AVG_REB         | character |
| AVG_PTS         | character |
| DQ              | character |

## Details

      wnba_cumestatsteam(game_ids = "1022200018", season = "2021-22", team_id = "1611661317")

## See also

Other WNBA Cume Functions:
[`wnba_cumestatsplayer()`](https://wehoop.sportsdataverse.org/reference/wnba_cumestatsplayer.md),
[`wnba_cumestatsplayergames()`](https://wehoop.sportsdataverse.org/reference/wnba_cumestatsplayergames.md),
[`wnba_cumestatsteamgames()`](https://wehoop.sportsdataverse.org/reference/wnba_cumestatsteamgames.md)

## Author

Saiem Gilani
