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

|  |  |  |
|----|----|----|
| col_name | types | description |
| game_date | character | Game date (YYYY-MM-DD). |
| game_sequence | integer | Game sequence. |
| game_id | character | Unique game identifier. |
| game_status_id | integer | Numeric game status identifier. |
| game_status_text | character | Game status display text (e.g. 'Final', '4:32 - 4th'). |
| gamecode | character | Gamecode. |
| home_team_id | integer | Unique identifier for the home team. |
| visitor_team_id | integer | Unique identifier for visitor team. |
| season | character | Season identifier (4-digit year or 'YYYY-YY' string). |
| live_period | integer | Live period. |
| live_pc_time | character | Time / clock value. |
| natl_tv_broadcaster_abbreviation | character | Natl tv broadcaster abbreviation. |
| home_tv_broadcaster_abbreviation | character | Home team's tv broadcaster abbreviation. |
| away_tv_broadcaster_abbreviation | character | Away team's tv broadcaster abbreviation. |
| live_period_time_bcast | character | Live period time bcast. |
| arena_name | character | Arena name. |
| wh_status | integer | Wh status. |

**line_score**

|  |  |  |
|----|----|----|
| col_name | types | description |
| game_date_est | character | Game date est. |
| game_sequence | integer | Game sequence. |
| game_id | character | Unique game identifier. |
| team_id | integer | Unique team identifier. |
| team_abbreviation | character | Short team abbreviation (e.g. 'LAS'). |
| team_city_name | character | Team city name. |
| team_name | character | Full team display name (e.g. 'Las Vegas Aces'). |
| team_wins_losses | character | Team wins losses. |
| pts_qtr1 | integer | Pts qtr1. |
| pts_qtr2 | integer | Pts qtr2. |
| pts_qtr3 | integer | Pts qtr3. |
| pts_qtr4 | integer | Pts qtr4. |
| pts_ot1 | integer | Pts ot1. |
| pts | integer | Points scored. |

## Details

     wnba_boxscoresummaryv3(game_id = "1022200034")

## See also

Other WNBA Boxscore V3 Functions:
[`wnba_boxscorehustlev2()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscorehustlev2.md),
[`wnba_boxscoretraditionalv3()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoretraditionalv3.md)

## Author

Saiem Gilani
