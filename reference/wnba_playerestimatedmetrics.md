# **Get WNBA Stats API Player Estimated Metrics**

**Get WNBA Stats API Player Estimated Metrics**

**Get WNBA Stats API Player Estimated Metrics**

## Usage

``` r
wnba_playerestimatedmetrics(
  league_id = "10",
  season = most_recent_wnba_season() - 1,
  season_type = "Regular Season",
  ...
)
```

## Arguments

- league_id:

  League - default: '00'. Other options include '10': WNBA, '20':
  G-League

- season:

  Season - format 2020-21

- season_type:

  Season Type - Regular Season, Playoffs, All-Star

- ...:

  Additional arguments passed to an underlying function like httr.

## Value

Return a named list of data frames: PlayerEstimatedMetrics

**PlayerEstimatedMetrics**

|                   |           |                                |
|-------------------|-----------|--------------------------------|
| col_name          | types     | description                    |
| PLAYER_ID         | character | Unique player identifier.      |
| PLAYER_NAME       | character | Player name.                   |
| GP                | character | Games played.                  |
| W                 | character | Wins.                          |
| L                 | character | Losses.                        |
| W_PCT             | character | Wins percentage (0-1 decimal). |
| MIN               | character | Minutes played.                |
| E_OFF_RATING      | character |                                |
| E_DEF_RATING      | character |                                |
| E_NET_RATING      | character |                                |
| E_AST_RATIO       | character |                                |
| E_OREB_PCT        | character |                                |
| E_DREB_PCT        | character |                                |
| E_REB_PCT         | character |                                |
| E_TOV_PCT         | character |                                |
| E_USG_PCT         | character |                                |
| E_PACE            | character |                                |
| GP_RANK           | character |                                |
| W_RANK            | character |                                |
| L_RANK            | character |                                |
| W_PCT_RANK        | character |                                |
| MIN_RANK          | character |                                |
| E_OFF_RATING_RANK | character |                                |
| E_DEF_RATING_RANK | character |                                |
| E_NET_RATING_RANK | character |                                |
| E_AST_RATIO_RANK  | character |                                |
| E_OREB_PCT_RANK   | character |                                |
| E_DREB_PCT_RANK   | character |                                |
| E_REB_PCT_RANK    | character |                                |
| E_TOV_PCT_RANK    | character |                                |
| E_USG_PCT_RANK    | character |                                |
| E_PACE_RANK       | character |                                |

## Details

      wnba_playerestimatedmetrics()

## See also

[family_wnba_player](https://wehoop.sportsdataverse.org/reference/family_wnba_player.md)
lists every function in this family.

## Author

Saiem Gilani
