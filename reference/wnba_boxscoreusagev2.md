# **Get WNBA Stats API Boxscore Usage V2**

**Get WNBA Stats API Boxscore Usage V2**

**Get WNBA Stats API Boxscore Usage V2**

## Usage

``` r
wnba_boxscoreusagev2(
  game_id,
  start_period = 0,
  end_period = 14,
  start_range = 0,
  end_range = 0,
  range_type = 0,
  ...
)
```

## Arguments

- game_id:

  Game ID

- start_period:

  start_period

- end_period:

  end_period

- start_range:

  start_range

- end_range:

  end_range

- range_type:

  range_type

- ...:

  Additional arguments passed to an underlying function like httr.

## Value

Returns a named list of data frames: sqlPlayersUsage, sqlTeamsUsage

**sqlPlayersUsage**

|                   |           |
|-------------------|-----------|
| col_name          | types     |
| GAME_ID           | character |
| TEAM_ID           | character |
| TEAM_ABBREVIATION | character |
| TEAM_CITY         | character |
| PLAYER_ID         | character |
| PLAYER_NAME       | character |
| NICKNAME          | character |
| START_POSITION    | character |
| COMMENT           | character |
| MIN               | character |
| USG_PCT           | character |
| PCT_FGM           | character |
| PCT_FGA           | character |
| PCT_FG3M          | character |
| PCT_FG3A          | character |
| PCT_FTM           | character |
| PCT_FTA           | character |
| PCT_OREB          | character |
| PCT_DREB          | character |
| PCT_REB           | character |
| PCT_AST           | character |
| PCT_TOV           | character |
| PCT_STL           | character |
| PCT_BLK           | character |
| PCT_BLKA          | character |
| PCT_PF            | character |
| PCT_PFD           | character |
| PCT_PTS           | character |

**sqlTeamsUsage**

|                   |           |
|-------------------|-----------|
| col_name          | types     |
| GAME_ID           | character |
| TEAM_ID           | character |
| TEAM_NAME         | character |
| TEAM_ABBREVIATION | character |
| TEAM_CITY         | character |
| MIN               | character |
| USG_PCT           | character |
| PCT_FGM           | character |
| PCT_FGA           | character |
| PCT_FG3M          | character |
| PCT_FG3A          | character |
| PCT_FTM           | character |
| PCT_FTA           | character |
| PCT_OREB          | character |
| PCT_DREB          | character |
| PCT_REB           | character |
| PCT_AST           | character |
| PCT_TOV           | character |
| PCT_STL           | character |
| PCT_BLK           | character |
| PCT_BLKA          | character |
| PCT_PF            | character |
| PCT_PFD           | character |
| PCT_PTS           | character |

## Details

      wnba_boxscoreusagev2(game_id = "1022200034")

## See also

Other WNBA Boxscore Functions:
[`wnba_boxscoreadvancedv2()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoreadvancedv2.md),
[`wnba_boxscorefourfactorsv2()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscorefourfactorsv2.md),
[`wnba_boxscoremiscv2()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoremiscv2.md),
[`wnba_boxscoreplayertrackv2()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoreplayertrackv2.md),
[`wnba_boxscorescoringv2()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscorescoringv2.md),
[`wnba_boxscoresummaryv2()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoresummaryv2.md),
[`wnba_boxscoretraditionalv2()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoretraditionalv2.md),
[`wnba_gamerotation()`](https://wehoop.sportsdataverse.org/reference/wnba_gamerotation.md),
[`wnba_hustlestatsboxscore()`](https://wehoop.sportsdataverse.org/reference/wnba_hustlestatsboxscore.md)

## Author

Saiem Gilani
