# **Get WNBA Stats API Boxscore Misc V2**

**Get WNBA Stats API Boxscore Misc V2**

**Get WNBA Stats API Boxscore Misc V2**

## Usage

``` r
wnba_boxscoremiscv2(
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

Returns a named list of data frames: sqlPlayersMisc, sqlTeamsMisc

**sqlPlayersMisc**

|                    |           |
|--------------------|-----------|
| col_name           | types     |
| GAME_ID            | character |
| TEAM_ID            | character |
| TEAM_ABBREVIATION  | character |
| TEAM_CITY          | character |
| PLAYER_ID          | character |
| PLAYER_NAME        | character |
| NICKNAME           | character |
| START_POSITION     | character |
| COMMENT            | character |
| MIN                | character |
| PTS_OFF_TOV        | character |
| PTS_2ND_CHANCE     | character |
| PTS_FB             | character |
| PTS_PAINT          | character |
| OPP_PTS_OFF_TOV    | character |
| OPP_PTS_2ND_CHANCE | character |
| OPP_PTS_FB         | character |
| OPP_PTS_PAINT      | character |
| BLK                | character |
| BLKA               | character |
| PF                 | character |
| PFD                | character |

**sqlTeamsMisc**

|                    |           |
|--------------------|-----------|
| col_name           | types     |
| GAME_ID            | character |
| TEAM_ID            | character |
| TEAM_NAME          | character |
| TEAM_ABBREVIATION  | character |
| TEAM_CITY          | character |
| MIN                | character |
| PTS_OFF_TOV        | character |
| PTS_2ND_CHANCE     | character |
| PTS_FB             | character |
| PTS_PAINT          | character |
| OPP_PTS_OFF_TOV    | character |
| OPP_PTS_2ND_CHANCE | character |
| OPP_PTS_FB         | character |
| OPP_PTS_PAINT      | character |
| BLK                | character |
| BLKA               | character |
| PF                 | character |
| PFD                | character |

## Details

      wnba_boxscoremiscv2(game_id = "1022200034")

## See also

Other WNBA Boxscore Functions:
[`wnba_boxscoreadvancedv2()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoreadvancedv2.md),
[`wnba_boxscorefourfactorsv2()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscorefourfactorsv2.md),
[`wnba_boxscoreplayertrackv2()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoreplayertrackv2.md),
[`wnba_boxscorescoringv2()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscorescoringv2.md),
[`wnba_boxscoresummaryv2()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoresummaryv2.md),
[`wnba_boxscoretraditionalv2()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoretraditionalv2.md),
[`wnba_boxscoreusagev2()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoreusagev2.md),
[`wnba_gamerotation()`](https://wehoop.sportsdataverse.org/reference/wnba_gamerotation.md),
[`wnba_hustlestatsboxscore()`](https://wehoop.sportsdataverse.org/reference/wnba_hustlestatsboxscore.md)

## Author

Saiem Gilani
