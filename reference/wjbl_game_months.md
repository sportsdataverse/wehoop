# **Get W League Game Months**

Months (YYYY-MM) that have games in a season, newest first; each is one
page of wjbl_schedule.

Endpoint: `GET https://api.wjbl.01core.app/api/play-schedule-months`

## Usage

``` r
wjbl_game_months(season)
```

## Arguments

- season:

  Season END year (2026 = 2025-26, 2000 = 1999-2000); the wrapper maps
  it to the league edition id (league_id) with the live league list
  (wjbl_leagues, one extra cached request).

## Value

A `wehoop_data` tibble, one row per record; the columns are always
these, in this order (sportsdataverse-py `wjbl_game_months`):

|  |  |  |
|----|----|----|
| col_name | type | description |
| league_id | integer | Competition edition id league_id, cast to an integer (the API echoes a string here and an integer elsewhere). |
| season | integer | Season END year of the request (2026 = 2025-26); the body itself does not carry it. |
| game_month | character | Month 'YYYY-MM': the game_month parameter of /play-schedules. |
| game_month_jpn | character | The month in Japanese, (Japanese text) (April 2026). |

## Details

Source, terms of use, request pacing, seasons, ids, coverage and error
classes of this family: see the notes in
[`wjbl_leagues()`](https://wehoop.sportsdataverse.org/reference/wjbl_leagues.md).

## See also

[family_wjbl](https://wehoop.sportsdataverse.org/reference/family_wjbl.md)
lists every function in this family.

## Examples

``` r
# \donttest{
  try(wjbl_game_months(season = 2026))
#> ── W League Game Months from api.wjbl.01core.app ─────────────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-13 19:08:26 UTC
#> # A tibble: 9 × 4
#>   league_id season game_month game_month_jpn
#>       <int>  <int> <chr>      <chr>         
#> 1        45   2026 2026-04    2026年4月     
#> 2        45   2026 2026-03    2026年3月     
#> 3        45   2026 2026-02    2026年2月     
#> 4        45   2026 2026-01    2026年1月     
#> 5        45   2026 2025-12    2025年12月    
#> 6        45   2026 2025-11    2025年11月    
#> 7        45   2026 2025-10    2025年10月    
#> 8        45   2026 2025-09    2025年9月     
#> 9        45   2026 2025-07    2025年7月     
# }
```
