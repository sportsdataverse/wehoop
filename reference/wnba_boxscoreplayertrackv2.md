# **Get WNBA Stats API Boxscore Player Tracking V2**

**Get WNBA Stats API Boxscore Player Tracking V2**

**Get WNBA Stats API Boxscore Player Tracking V2**

## Usage

``` r
wnba_boxscoreplayertrackv2(game_id, ...)
```

## Arguments

- game_id:

  Game ID

- ...:

  Additional arguments passed to an underlying function like httr.

## Value

Returns a named list of data frames: PlayerStats, TeamStats

**PlayerStats**

|                   |           |
|-------------------|-----------|
| col_name          | types     |
| GAME_ID           | character |
| TEAM_ID           | character |
| TEAM_ABBREVIATION | character |
| TEAM_CITY         | character |
| PLAYER_ID         | character |
| PLAYER_NAME       | character |
| START_POSITION    | character |
| COMMENT           | character |
| MIN               | character |
| SPD               | character |
| DIST              | character |
| ORBC              | character |
| DRBC              | character |
| RBC               | character |
| TCHS              | character |
| SAST              | character |
| FTAST             | character |
| PASS              | character |
| AST               | character |
| CFGM              | character |
| CFGA              | character |
| CFG_PCT           | character |
| UFGM              | character |
| UFGA              | character |
| UFG_PCT           | character |
| FG_PCT            | character |
| DFGM              | character |
| DFGA              | character |
| DFG_PCT           | character |

**TeamStats**

|                   |           |
|-------------------|-----------|
| col_name          | types     |
| GAME_ID           | character |
| TEAM_ID           | character |
| TEAM_NAME         | character |
| TEAM_ABBREVIATION | character |
| TEAM_CITY         | character |
| MIN               | character |
| DIST              | character |
| ORBC              | character |
| DRBC              | character |
| RBC               | character |
| TCHS              | character |
| SAST              | character |
| FTAST             | character |
| PASS              | character |
| AST               | character |
| CFGM              | character |
| CFGA              | character |
| CFG_PCT           | character |
| UFGM              | character |
| UFGA              | character |
| UFG_PCT           | character |
| FG_PCT            | character |
| DFGM              | character |
| DFGA              | character |
| DFG_PCT           | character |

## Details

      wnba_boxscoreplayertrackv2(game_id = "1022200034")

## See also

Other WNBA Boxscore Functions:
[`wnba_boxscoreadvancedv2()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoreadvancedv2.md),
[`wnba_boxscorefourfactorsv2()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscorefourfactorsv2.md),
[`wnba_boxscoremiscv2()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoremiscv2.md),
[`wnba_boxscorescoringv2()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscorescoringv2.md),
[`wnba_boxscoresummaryv2()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoresummaryv2.md),
[`wnba_boxscoretraditionalv2()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoretraditionalv2.md),
[`wnba_boxscoreusagev2()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoreusagev2.md),
[`wnba_gamerotation()`](https://wehoop.sportsdataverse.org/reference/wnba_gamerotation.md),
[`wnba_hustlestatsboxscore()`](https://wehoop.sportsdataverse.org/reference/wnba_hustlestatsboxscore.md)

## Author

Saiem Gilani
