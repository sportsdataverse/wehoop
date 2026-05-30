# **Get WNBA Stats API Hustle Stats Boxscore**

**Get WNBA Stats API Hustle Stats Boxscore**

**Get WNBA Stats API Hustle Stats Boxscore**

## Usage

``` r
wnba_hustlestatsboxscore(game_id, ...)
```

## Arguments

- game_id:

  Game ID

- ...:

  Additional arguments passed to an underlying function like httr.

## Value

Returns a named list of data frames: HustleStatsAvailable, PlayerStats,
TeamStats

**HustleStatsAvailable**

|               |           |                         |
|---------------|-----------|-------------------------|
| col_name      | types     | description             |
| GAME_ID       | character | Unique game identifier. |
| HUSTLE_STATUS | character |                         |

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
| START_POSITION | character |  |
| COMMENT | character | Player status / inactive reason (e.g. 'DNP - Coach's Decision', 'Inactive'). |
| MINUTES | character | Minutes played, formatted MM:SS (V3 PT-duration parsed) or decimal minutes (V2). |
| PTS | character | Points scored. |
| CONTESTED_SHOTS | character | Defensively contested shots. |
| CONTESTED_SHOTS_2PT | character | Contested two-point shots. |
| CONTESTED_SHOTS_3PT | character | Contested three-point shots. |
| DEFLECTIONS | character | Defensive deflections. |
| CHARGES_DRAWN | character | Charges drawn. |
| SCREEN_ASSISTS | character | Screen assists (resulting in a basket). |
| SCREEN_AST_PTS | character |  |
| OFF_LOOSE_BALLS_RECOVERED | character |  |
| DEF_LOOSE_BALLS_RECOVERED | character |  |
| LOOSE_BALLS_RECOVERED | character | Loose balls recovered. |
| OFF_BOXOUTS | character |  |
| DEF_BOXOUTS | character |  |
| BOX_OUT_PLAYER_TEAM_REBS | character |  |
| BOX_OUT_PLAYER_REBS | character |  |
| BOX_OUTS | character | Box-outs executed. |

**TeamStats**

|  |  |  |
|----|----|----|
| col_name | types | description |
| GAME_ID | character | Unique game identifier. |
| TEAM_ID | character | Unique team identifier. |
| TEAM_NAME | character | Full team display name (e.g. 'Las Vegas Aces'). |
| TEAM_ABBREVIATION | character | Short team abbreviation (e.g. 'LAS'). |
| TEAM_CITY | character | Team city or region (e.g. 'Las Vegas'). |
| MINUTES | character | Minutes played, formatted MM:SS (V3 PT-duration parsed) or decimal minutes (V2). |
| PTS | character | Points scored. |
| CONTESTED_SHOTS | character | Defensively contested shots. |
| CONTESTED_SHOTS_2PT | character | Contested two-point shots. |
| CONTESTED_SHOTS_3PT | character | Contested three-point shots. |
| DEFLECTIONS | character | Defensive deflections. |
| CHARGES_DRAWN | character | Charges drawn. |
| SCREEN_ASSISTS | character | Screen assists (resulting in a basket). |
| SCREEN_AST_PTS | character |  |
| OFF_LOOSE_BALLS_RECOVERED | character |  |
| DEF_LOOSE_BALLS_RECOVERED | character |  |
| LOOSE_BALLS_RECOVERED | character | Loose balls recovered. |
| OFF_BOXOUTS | character |  |
| DEF_BOXOUTS | character |  |
| BOX_OUT_PLAYER_TEAM_REBS | character |  |
| BOX_OUT_PLAYER_REBS | character |  |
| BOX_OUTS | character | Box-outs executed. |

## Details

      wnba_hustlestatsboxscore(game_id = "1022200034")

## See also

Other WNBA Boxscore Functions:
[`wnba_boxscoreadvancedv2()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoreadvancedv2.md),
[`wnba_boxscorefourfactorsv2()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscorefourfactorsv2.md),
[`wnba_boxscoremiscv2()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoremiscv2.md),
[`wnba_boxscoreplayertrackv2()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoreplayertrackv2.md),
[`wnba_boxscorescoringv2()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscorescoringv2.md),
[`wnba_boxscoresummaryv2()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoresummaryv2.md),
[`wnba_boxscoretraditionalv2()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoretraditionalv2.md),
[`wnba_boxscoreusagev2()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoreusagev2.md),
[`wnba_gamerotation()`](https://wehoop.sportsdataverse.org/reference/wnba_gamerotation.md)

Other WNBA Hustle Functions:
[`wnba_leaguehustlestatsplayer()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguehustlestatsplayer.md),
[`wnba_leaguehustlestatsplayerleaders()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguehustlestatsplayerleaders.md),
[`wnba_leaguehustlestatsteam()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguehustlestatsteam.md),
[`wnba_leaguehustlestatsteamleaders()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguehustlestatsteamleaders.md)

## Author

Saiem Gilani
