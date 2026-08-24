# **Get WNBA Stats API Video Status**

**Get WNBA Stats API Video Status**

**Get WNBA Stats API Video Status**

## Usage

``` r
wnba_videostatus(game_date = "2022-06-10", league_id = "10", ...)
```

## Arguments

- game_date:

  game_date

- league_id:

  league_id

- ...:

  Additional arguments passed to an underlying function like httr.

## Value

Return a list of tibbles: VideoStatus

**VideoStatus**

|  |  |  |
|----|----|----|
| col_name | types | description |
| GAME_ID | character | Unique game identifier. |
| GAME_DATE | character | Game date (YYYY-MM-DD). |
| VISITOR_TEAM_ID | character | Unique identifier for visitor team. |
| VISITOR_TEAM_CITY | character |  |
| VISITOR_TEAM_NAME | character |  |
| VISITOR_TEAM_ABBREVIATION | character |  |
| HOME_TEAM_ID | character | Unique identifier for the home team. |
| HOME_TEAM_CITY | character | Home team city / location. |
| HOME_TEAM_NAME | character | Home team name. |
| HOME_TEAM_ABBREVIATION | character |  |
| GAME_STATUS | character | Game status label. |
| GAME_STATUS_TEXT | character | Game status display text (e.g. 'Final', '4:32 - 4th'). |
| IS_AVAILABLE | character |  |
| PT_XYZ_AVAILABLE | character |  |

## Details

      wnba_videostatus(game_date = '2022-06-10', league_id = '10')

## See also

Other WNBA Video Functions:
[`wnba_videodetailsasset()`](https://wehoop.sportsdataverse.org/reference/wnba_videodetailsasset.md),
[`wnba_videoevents()`](https://wehoop.sportsdataverse.org/reference/wnba_videoevents.md)

## Author

Saiem Gilani
