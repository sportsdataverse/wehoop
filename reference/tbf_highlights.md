# **TBF Highlights**

Team comparison of a finished game: rebounds, paint points, fast-break
points, lead changes and more.

Endpoint:
`GET https://miniappapi.tbf.org.tr/webapi-service/api/Match/mac-ozet`

## Usage

``` r
tbf_highlights(match_id)
```

## Arguments

- match_id:

  Required. TBF game id (integer), e.g. 346279; match_id in
  [`tbf_schedule()`](https://wehoop.sportsdataverse.org/reference/tbf_schedule.md).
  One global sequence across leagues and seasons. Only a finished game
  is served.

## Value

A `wehoop_data` tibble. One row per statistic with the home and away
value. Every column below is always present (a zero-row tibble keeps
them and their types); an answer with nothing in it raises
`wehoop_no_data`, as in sportsdataverse-py.

|  |  |  |
|----|----|----|
| col_name | type | description |
| match_id | integer | TBF game id (key space: TBF games, ONE global sequence across leagues and seasons: 62552 in 2006-07, 346279 in 2026-27). The match_id argument of every game wrapper; the routes echo it as a string or null, the runtime stamps the integer asked for. |
| title | character | Statistic name in Turkish (Ribaund = rebounds, Asist = assists, Top Kaybi = turnovers). |
| category | character | Statistic code (leaderCategory), e.g. PointsFromPaint, LeadChanges, TimeLeading. |
| home_value | character | Home value exactly as sent (a string: '90', or '28:38' for TimeLeading). |
| away_value | character | Away value exactly as sent (a string: '89', or '8:19' for TimeLeading). |
| home_number | double | Home value as a number; null for a time value such as TimeLeading. |
| away_number | double | Away value as a number; null for a time value such as TimeLeading. |

## Details

Source, terms of use, request pacing, seasons, coverage and error
classes of this family: see the notes in
[`tbf_seasons()`](https://wehoop.sportsdataverse.org/reference/tbf_seasons.md).

     tbf_highlights(match_id = 346279)

## See also

[family_tbf](https://wehoop.sportsdataverse.org/reference/family_tbf.md)
lists every function in this family.
