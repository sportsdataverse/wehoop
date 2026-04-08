# **Get WNBA Stats API Boxscore Advanced V2**

**Get WNBA Stats API Boxscore Advanced V2**

**Get WNBA Stats API Boxscore Advanced V2**

## Usage

``` r
wnba_boxscoreadvancedv2(
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
| NICKNAME          | character |
| START_POSITION    | character |
| COMMENT           | character |
| MIN               | character |
| E_OFF_RATING      | character |
| OFF_RATING        | character |
| E_DEF_RATING      | character |
| DEF_RATING        | character |
| E_NET_RATING      | character |
| NET_RATING        | character |
| AST_PCT           | character |
| AST_TOV           | character |
| AST_RATIO         | character |
| OREB_PCT          | character |
| DREB_PCT          | character |
| REB_PCT           | character |
| TM_TOV_PCT        | character |
| EFG_PCT           | character |
| TS_PCT            | character |
| USG_PCT           | character |
| E_USG_PCT         | character |
| E_PACE            | character |
| PACE              | character |
| PACE_PER40        | character |
| POSS              | character |
| PIE               | character |

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
| E_OFF_RATING      | character |
| OFF_RATING        | character |
| E_DEF_RATING      | character |
| DEF_RATING        | character |
| E_NET_RATING      | character |
| NET_RATING        | character |
| AST_PCT           | character |
| AST_TOV           | character |
| AST_RATIO         | character |
| OREB_PCT          | character |
| DREB_PCT          | character |
| REB_PCT           | character |
| E_TM_TOV_PCT      | character |
| TM_TOV_PCT        | character |
| EFG_PCT           | character |
| TS_PCT            | character |
| USG_PCT           | character |
| E_USG_PCT         | character |
| E_PACE            | character |
| PACE              | character |
| PACE_PER40        | character |
| POSS              | character |
| PIE               | character |

## Details

      wnba_boxscoreadvancedv2(game_id = "1022200034")

## See also

Other WNBA Boxscore Functions:
[`wnba_boxscorefourfactorsv2()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscorefourfactorsv2.md),
[`wnba_boxscoremiscv2()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoremiscv2.md),
[`wnba_boxscoreplayertrackv2()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoreplayertrackv2.md),
[`wnba_boxscorescoringv2()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscorescoringv2.md),
[`wnba_boxscoresummaryv2()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoresummaryv2.md),
[`wnba_boxscoretraditionalv2()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoretraditionalv2.md),
[`wnba_boxscoreusagev2()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoreusagev2.md),
[`wnba_gamerotation()`](https://wehoop.sportsdataverse.org/reference/wnba_gamerotation.md),
[`wnba_hustlestatsboxscore()`](https://wehoop.sportsdataverse.org/reference/wnba_hustlestatsboxscore.md)

## Author

Saiem Gilani
