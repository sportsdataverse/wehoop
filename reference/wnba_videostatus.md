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

|                           |           |
|---------------------------|-----------|
| col_name                  | types     |
| GAME_ID                   | character |
| GAME_DATE                 | character |
| VISITOR_TEAM_ID           | character |
| VISITOR_TEAM_CITY         | character |
| VISITOR_TEAM_NAME         | character |
| VISITOR_TEAM_ABBREVIATION | character |
| HOME_TEAM_ID              | character |
| HOME_TEAM_CITY            | character |
| HOME_TEAM_NAME            | character |
| HOME_TEAM_ABBREVIATION    | character |
| GAME_STATUS               | character |
| GAME_STATUS_TEXT          | character |
| IS_AVAILABLE              | character |
| PT_XYZ_AVAILABLE          | character |

## Details

      wnba_videostatus(game_date = '2022-06-10', league_id = '10')

## See also

Other WNBA Video Functions:
[`wnba_videodetailsasset()`](https://wehoop.sportsdataverse.org/reference/wnba_videodetailsasset.md),
[`wnba_videodetails()`](https://wehoop.sportsdataverse.org/reference/wnba_videodetails.md),
[`wnba_videoevents()`](https://wehoop.sportsdataverse.org/reference/wnba_videoevents.md)

## Author

Saiem Gilani
