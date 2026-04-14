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

|               |           |
|---------------|-----------|
| col_name      | types     |
| GAME_ID       | character |
| HUSTLE_STATUS | character |

**PlayerStats**

|                           |           |
|---------------------------|-----------|
| col_name                  | types     |
| GAME_ID                   | character |
| TEAM_ID                   | character |
| TEAM_ABBREVIATION         | character |
| TEAM_CITY                 | character |
| PLAYER_ID                 | character |
| PLAYER_NAME               | character |
| START_POSITION            | character |
| COMMENT                   | character |
| MINUTES                   | character |
| PTS                       | character |
| CONTESTED_SHOTS           | character |
| CONTESTED_SHOTS_2PT       | character |
| CONTESTED_SHOTS_3PT       | character |
| DEFLECTIONS               | character |
| CHARGES_DRAWN             | character |
| SCREEN_ASSISTS            | character |
| SCREEN_AST_PTS            | character |
| OFF_LOOSE_BALLS_RECOVERED | character |
| DEF_LOOSE_BALLS_RECOVERED | character |
| LOOSE_BALLS_RECOVERED     | character |
| OFF_BOXOUTS               | character |
| DEF_BOXOUTS               | character |
| BOX_OUT_PLAYER_TEAM_REBS  | character |
| BOX_OUT_PLAYER_REBS       | character |
| BOX_OUTS                  | character |

**TeamStats**

|                           |           |
|---------------------------|-----------|
| col_name                  | types     |
| GAME_ID                   | character |
| TEAM_ID                   | character |
| TEAM_NAME                 | character |
| TEAM_ABBREVIATION         | character |
| TEAM_CITY                 | character |
| MINUTES                   | character |
| PTS                       | character |
| CONTESTED_SHOTS           | character |
| CONTESTED_SHOTS_2PT       | character |
| CONTESTED_SHOTS_3PT       | character |
| DEFLECTIONS               | character |
| CHARGES_DRAWN             | character |
| SCREEN_ASSISTS            | character |
| SCREEN_AST_PTS            | character |
| OFF_LOOSE_BALLS_RECOVERED | character |
| DEF_LOOSE_BALLS_RECOVERED | character |
| LOOSE_BALLS_RECOVERED     | character |
| OFF_BOXOUTS               | character |
| DEF_BOXOUTS               | character |
| BOX_OUT_PLAYER_TEAM_REBS  | character |
| BOX_OUT_PLAYER_REBS       | character |
| BOX_OUTS                  | character |

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
