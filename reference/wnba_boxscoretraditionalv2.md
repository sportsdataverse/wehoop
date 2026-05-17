# **Get WNBA Stats API Boxscore Traditional V2**

**Get WNBA Stats API Boxscore Traditional V2**

**Get WNBA Stats API Boxscore Traditional V2**

## Usage

``` r
wnba_boxscoretraditionalv2(
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

A list of data frames: PlayerStats, TeamStarterBenchStats, TeamStats

**PlayerStats**

|  |  |  |
|----|----|----|
| col_name | types | description |
| GAME_ID | character | Unique game identifier. |
| TEAM_ID | character | Unique team identifier. |
| TEAM_ABBREVIATION | character | Short team abbreviation (e.g. 'LAS'). |
| TEAM_CITY | character | Team city or region (e.g. 'Las Vegas'). |
| PLAYER_ID | character | Unique player identifier. |
| PLAYER_NAME | character | Player name. |
| NICKNAME | character | Team or athlete nickname. |
| START_POSITION | character |  |
| COMMENT | character | Player status / inactive reason (e.g. 'DNP - Coach's Decision', 'Inactive'). |
| MIN | character | Minutes played. |
| FGM | character | Field goals made. |
| FGA | character | Field goal attempts. |
| FG_PCT | character | Field goal percentage (0-1). |
| FG3M | character | Three-point field goals made. |
| FG3A | character | Three-point field goal attempts. |
| FG3_PCT | character | Three-point field goal percentage (0-1). |
| FTM | character | Free throws made. |
| FTA | character | Free throw attempts. |
| FT_PCT | character | Free throw percentage (0-1). |
| OREB | character | Offensive rebounds. |
| DREB | character | Defensive rebounds. |
| REB | character | Total rebounds. |
| AST | character | Assists. |
| STL | character | Steals. |
| BLK | character | Blocks. |
| TO | character |  |
| PF | character | Personal fouls. |
| PTS | character | Points scored. |
| PLUS_MINUS | character | Plus/minus point differential while on court. |

**TeamStats**

|  |  |  |
|----|----|----|
| col_name | types | description |
| GAME_ID | character | Unique game identifier. |
| TEAM_ID | character | Unique team identifier. |
| TEAM_NAME | character | Full team display name (e.g. 'Las Vegas Aces'). |
| TEAM_ABBREVIATION | character | Short team abbreviation (e.g. 'LAS'). |
| TEAM_CITY | character | Team city or region (e.g. 'Las Vegas'). |
| MIN | character | Minutes played. |
| FGM | character | Field goals made. |
| FGA | character | Field goal attempts. |
| FG_PCT | character | Field goal percentage (0-1). |
| FG3M | character | Three-point field goals made. |
| FG3A | character | Three-point field goal attempts. |
| FG3_PCT | character | Three-point field goal percentage (0-1). |
| FTM | character | Free throws made. |
| FTA | character | Free throw attempts. |
| FT_PCT | character | Free throw percentage (0-1). |
| OREB | character | Offensive rebounds. |
| DREB | character | Defensive rebounds. |
| REB | character | Total rebounds. |
| AST | character | Assists. |
| STL | character | Steals. |
| BLK | character | Blocks. |
| TO | character |  |
| PF | character | Personal fouls. |
| PTS | character | Points scored. |
| PLUS_MINUS | character | Plus/minus point differential while on court. |

**TeamStarterBenchStats**

|  |  |  |
|----|----|----|
| col_name | types | description |
| GAME_ID | character | Unique game identifier. |
| TEAM_ID | character | Unique team identifier. |
| TEAM_NAME | character | Full team display name (e.g. 'Las Vegas Aces'). |
| TEAM_ABBREVIATION | character | Short team abbreviation (e.g. 'LAS'). |
| TEAM_CITY | character | Team city or region (e.g. 'Las Vegas'). |
| STARTERS_BENCH | character |  |
| MIN | character | Minutes played. |
| FGM | character | Field goals made. |
| FGA | character | Field goal attempts. |
| FG_PCT | character | Field goal percentage (0-1). |
| FG3M | character | Three-point field goals made. |
| FG3A | character | Three-point field goal attempts. |
| FG3_PCT | character | Three-point field goal percentage (0-1). |
| FTM | character | Free throws made. |
| FTA | character | Free throw attempts. |
| FT_PCT | character | Free throw percentage (0-1). |
| OREB | character | Offensive rebounds. |
| DREB | character | Defensive rebounds. |
| REB | character | Total rebounds. |
| AST | character | Assists. |
| STL | character | Steals. |
| BLK | character | Blocks. |
| TO | character |  |
| PF | character | Personal fouls. |
| PTS | character | Points scored. |

## Details

      wnba_boxscoretraditionalv2(game_id = "1022200034")

## See also

Other WNBA Boxscore Functions:
[`wnba_boxscoreadvancedv2()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoreadvancedv2.md),
[`wnba_boxscorefourfactorsv2()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscorefourfactorsv2.md),
[`wnba_boxscoremiscv2()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoremiscv2.md),
[`wnba_boxscoreplayertrackv2()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoreplayertrackv2.md),
[`wnba_boxscorescoringv2()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscorescoringv2.md),
[`wnba_boxscoresummaryv2()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoresummaryv2.md),
[`wnba_boxscoreusagev2()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoreusagev2.md),
[`wnba_gamerotation()`](https://wehoop.sportsdataverse.org/reference/wnba_gamerotation.md),
[`wnba_hustlestatsboxscore()`](https://wehoop.sportsdataverse.org/reference/wnba_hustlestatsboxscore.md)

## Author

Saiem Gilani
