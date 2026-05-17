# **Get WNBA Stats API Playoff Series**

**Get WNBA Stats API Playoff Series**

**Get WNBA Stats API Playoff Series**

## Usage

``` r
wnba_commonplayoffseries(
  league_id = "10",
  season = most_recent_wnba_season() - 2,
  series_id = "",
  ...
)
```

## Arguments

- league_id:

  league_id

- season:

  season

- series_id:

  series_id

- ...:

  Additional arguments passed to an underlying function like httr.

## Value

Return a named list of data frames: PlayoffSeries

**PlayoffSeries**

|                 |           |                                      |
|-----------------|-----------|--------------------------------------|
| col_name        | types     | description                          |
| GAME_ID         | character | Unique game identifier.              |
| HOME_TEAM_ID    | character | Unique identifier for the home team. |
| VISITOR_TEAM_ID | character | Unique identifier for visitor team.  |
| SERIES_ID       | character |                                      |
| GAME_NUM        | character |                                      |

## Details

     wnba_commonplayoffseries(league_id = '10', season = most_recent_wnba_season() - 2)

## Author

Saiem Gilani
