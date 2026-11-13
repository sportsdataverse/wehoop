# **TBF Period Scores**

Points each side scored in each period of a finished game, overtime
included.

Endpoint:
`GET https://miniappapi.tbf.org.tr/webapi-service/api/Match/mac-ozet`

## Usage

``` r
tbf_period_scores(match_id)
```

## Arguments

- match_id:

  Required. TBF game id (integer), e.g. 346279; match_id in
  [`tbf_schedule()`](https://wehoop.sportsdataverse.org/reference/tbf_schedule.md).
  One global sequence across leagues and seasons. Only a finished game
  is served.

## Value

A `wehoop_data` tibble. One row per side and period (home first). Every
column below is always present (a zero-row tibble keeps them and their
types); an answer with nothing in it raises `wehoop_no_data`, as in
sportsdataverse-py.

|  |  |  |
|----|----|----|
| col_name | type | description |
| match_id | integer | TBF game id (key space: TBF games, ONE global sequence across leagues and seasons: 62552 in 2006-07, 346279 in 2026-27). The match_id argument of every game wrapper; the routes echo it as a string or null, the runtime stamps the integer asked for. |
| side | character | Side of the score: home (homeTeamScore) or away (awayTeamScore). |
| period | integer | Period number (quarter): 1-4 regulation; overtime numbering is unverified. |
| period_type | integer | Period type code: 1 = regulation, 2 = overtime (from the app code; no overtime game in the samples). |
| points | integer | Points the side scored IN the period (not cumulative). |

## Details

Source, terms of use, request pacing, seasons, coverage and error
classes of this family: see the notes in
[`tbf_seasons()`](https://wehoop.sportsdataverse.org/reference/tbf_seasons.md).

## See also

[family_tbf](https://wehoop.sportsdataverse.org/reference/family_tbf.md)
lists every function in this family.

## Examples

``` r
# \donttest{
  try(tbf_period_scores(match_id = 346279))
#> ── TBF Period Scores ─────────────────────────────────────────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-13 14:00:00 UTC
#> # A tibble: 8 × 5
#>   match_id side  period period_type points
#>      <int> <chr>  <int>       <int>  <int>
#> 1   346279 home       1           1     27
#> 2   346279 home       2           1     21
#> 3   346279 home       3           1     27
#> 4   346279 home       4           1     15
#> 5   346279 away       1           1     16
#> 6   346279 away       2           1     31
#> 7   346279 away       3           1     21
#> 8   346279 away       4           1     21
# }
```
