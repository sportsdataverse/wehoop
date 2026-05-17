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
| E_OFF_RATING | character |  |
| OFF_RATING | character | Offensive rating (points produced per 100 possessions). |
| E_DEF_RATING | character |  |
| DEF_RATING | character | Defensive rating (points allowed per 100 possessions). |
| E_NET_RATING | character |  |
| NET_RATING | character | Net rating (off rating - def rating). |
| AST_PCT | character | Assist percentage (0-1). |
| AST_TOV | character |  |
| AST_RATIO | character | Assist ratio (assists per 100 possessions used). |
| OREB_PCT | character | Offensive rebound percentage (0-1). |
| DREB_PCT | character | Defensive rebound percentage (0-1). |
| REB_PCT | character | Total rebound percentage (0-1). |
| TM_TOV_PCT | character |  |
| EFG_PCT | character | Effective field goal percentage (0-1). |
| TS_PCT | character | True shooting percentage (0-1). |
| USG_PCT | character | Usage percentage (0-1). |
| E_USG_PCT | character |  |
| E_PACE | character |  |
| PACE | character | Possessions per 48 minutes. |
| PACE_PER40 | character | Pace per40. |
| POSS | character |  |
| PIE | character | Player Impact Estimate (0-1). |

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
| E_OFF_RATING | character |  |
| OFF_RATING | character | Offensive rating (points produced per 100 possessions). |
| E_DEF_RATING | character |  |
| DEF_RATING | character | Defensive rating (points allowed per 100 possessions). |
| E_NET_RATING | character |  |
| NET_RATING | character | Net rating (off rating - def rating). |
| AST_PCT | character | Assist percentage (0-1). |
| AST_TOV | character |  |
| AST_RATIO | character | Assist ratio (assists per 100 possessions used). |
| OREB_PCT | character | Offensive rebound percentage (0-1). |
| DREB_PCT | character | Defensive rebound percentage (0-1). |
| REB_PCT | character | Total rebound percentage (0-1). |
| E_TM_TOV_PCT | character |  |
| TM_TOV_PCT | character |  |
| EFG_PCT | character | Effective field goal percentage (0-1). |
| TS_PCT | character | True shooting percentage (0-1). |
| USG_PCT | character | Usage percentage (0-1). |
| E_USG_PCT | character |  |
| E_PACE | character |  |
| PACE | character | Possessions per 48 minutes. |
| PACE_PER40 | character | Pace per40. |
| POSS | character |  |
| PIE | character | Player Impact Estimate (0-1). |

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
