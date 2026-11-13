# **TBF Play-by-Play**

Play-by-play of a finished game (2025-26 onward), in game order, with
the running score and an English gloss.

Endpoint:
`GET https://miniappapi.tbf.org.tr/webapi-service/api/Match/game-flow`

## Usage

``` r
tbf_pbp(match_id)
```

## Arguments

- match_id:

  Required. TBF game id (integer), e.g. 346279; match_id in
  [`tbf_schedule()`](https://wehoop.sportsdataverse.org/reference/tbf_schedule.md).
  One global sequence across leagues and seasons. Only a finished game
  is served.

## Value

A `wehoop_data` tibble. One row per event. Games before 2025-26 raise
`wehoop_no_data`. The feed has no player id. Every column below is
always present (a zero-row tibble keeps them and their types); an answer
with nothing in it raises `wehoop_no_data`, as in sportsdataverse-py.

|  |  |  |
|----|----|----|
| col_name | type | description |
| match_id | integer | TBF game id (key space: TBF games, ONE global sequence across leagues and seasons: 62552 in 2006-07, 346279 in 2026-27). The match_id argument of every game wrapper; the routes echo it as a string or null, the runtime stamps the integer asked for. |
| action_number | integer | Play sequence number (actionNumber); gaps are deleted or hidden actions. Rows are in the API's game order, and a period-end line can carry a LOWER number than the last play of the period (884 after 885 in the sample), so sort by period and clock, not by this number. |
| period | integer | Period number (quarterNumber): 1-4; overtime numbering is unverified. |
| period_type | integer | Period type code: 1 = regulation, 2 = overtime (from the app code; no overtime game in the samples). |
| clock | character | Game clock REMAINING in the period as 'mm:ss' (counts down from 10:00). |
| seconds_remaining | integer | Game clock remaining in the period, in seconds. |
| home_score | integer | Running home score after the play (the home half of the 'home-away' score text). |
| away_score | integer | Running away score after the play (the away half of the score text). |
| side | character | Side of the acting team (isHome); null on game events (period start / end, game end). |
| player_name | character | Acting player's name; null on game events. The feed carries no player id. |
| jersey_number | character | Shirt number as a string, so '0' and '00' stay distinct. |
| action | character | Play type in Turkish exactly as TBF sends it (77 values seen). |
| action_en | character | English gloss of the Turkish action, from the refs action vocabulary; null for an action not in it. |

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
  try(tbf_pbp(match_id = 346279))
#> ── TBF Play-by-Play ──────────────────────────────────────────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-13 14:52:44 UTC
#> # A tibble: 639 × 13
#>    match_id action_number period period_type clock seconds_remaining home_score
#>       <int>         <int>  <int>       <int> <chr>             <int>      <int>
#>  1   346279             1      1           1 10:00               600          0
#>  2   346279             2      1           1 10:00               600          0
#>  3   346279             5      1           1 09:59               599          0
#>  4   346279             6      1           1 09:59               599          0
#>  5   346279             7      1           1 09:43               583          0
#>  6   346279             8      1           1 09:43               583          0
#>  7   346279             9      1           1 09:32               572          0
#>  8   346279            10      1           1 09:29               569          0
#>  9   346279            11      1           1 09:21               561          2
#> 10   346279            13      1           1 08:54               534          2
#> # ℹ 629 more rows
#> # ℹ 6 more variables: away_score <int>, side <chr>, player_name <chr>,
#> #   jersey_number <chr>, action <chr>, action_en <chr>
# }
```
