# **Get WNBA Stats API Boxscore Summary V3**

**Get WNBA Stats API Boxscore Summary V3**

**Get WNBA Stats API Boxscore Summary V3**

## Usage

``` r
wnba_boxscoresummaryv3(game_id = "1022200034", ...)
```

## Arguments

- game_id:

  Game ID - 10-digit zero-padded ID (e.g., '1022200034')

- ...:

  Additional arguments passed to an underlying function like httr.

## Value

Returns a named list of data frames: game_summary, game_info,
arena_info, officials, line_score, inactive_players, last_five_meetings,
other_stats, available_video

**game_summary**

|                                  |           |
|----------------------------------|-----------|
| col_name                         | types     |
| game_date                        | character |
| game_sequence                    | integer   |
| game_id                          | character |
| game_status_id                   | integer   |
| game_status_text                 | character |
| gamecode                         | character |
| home_team_id                     | integer   |
| visitor_team_id                  | integer   |
| season                           | character |
| live_period                      | integer   |
| live_pc_time                     | character |
| natl_tv_broadcaster_abbreviation | character |
| home_tv_broadcaster_abbreviation | character |
| away_tv_broadcaster_abbreviation | character |
| live_period_time_bcast           | character |
| arena_name                       | character |
| wh_status                        | integer   |

**line_score**

|                   |           |
|-------------------|-----------|
| col_name          | types     |
| game_date_est     | character |
| game_sequence     | integer   |
| game_id           | character |
| team_id           | integer   |
| team_abbreviation | character |
| team_city_name    | character |
| team_name         | character |
| team_wins_losses  | character |
| pts_qtr1          | integer   |
| pts_qtr2          | integer   |
| pts_qtr3          | integer   |
| pts_qtr4          | integer   |
| pts_ot1           | integer   |
| pts               | integer   |

## Details

     wnba_boxscoresummaryv3(game_id = "1022200034")

## See also

Other WNBA Boxscore V3 Functions:
[`wnba_boxscoreadvancedv3()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoreadvancedv3.md),
[`wnba_boxscorefourfactorsv3()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscorefourfactorsv3.md),
[`wnba_boxscorehustlev2()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscorehustlev2.md),
[`wnba_boxscoremiscv3()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoremiscv3.md),
[`wnba_boxscoreplayertrackv3()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoreplayertrackv3.md),
[`wnba_boxscorescoringv3()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscorescoringv3.md),
[`wnba_boxscoretraditionalv3()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoretraditionalv3.md),
[`wnba_boxscoreusagev3()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoreusagev3.md)

## Author

Saiem Gilani
