# **TBF Weeks**

The weeks (rounds) of one league-season, playoff rounds included.

Endpoint:
`GET https://miniappapi.tbf.org.tr/webapi-service/api/League/get-league-weeks`

## Usage

``` r
tbf_weeks(season, competition = "kbsl")
```

## Arguments

- season:

  Required. Season END year (2027 = the 2026-2027 season). TBF keys a
  league-season by internal season and activity ids; the runtime reads
  them from the league's season list by the END year of the label. A
  year the list lacks raises `wehoop_no_data`.

- competition:

  TBF league: bsl (Basketbol Super Ligi), tbl (second tier) or kbsl
  (women's Super Ligi). The top flight was named TBL until 2007-08 and
  is listed under bsl. Default `"kbsl"` (the women's Super Ligi).

## Value

A `wehoop_data` tibble. One row per week in play order; `week` is the
value the schedule and standings take. Every column below is always
present (a zero-row tibble keeps them and their types); an answer with
nothing in it raises `wehoop_no_data`, as in sportsdataverse-py.

|  |  |  |
|----|----|----|
| col_name | type | description |
| activity_id | integer | Activity id of the request's league-season (key space: TBF league-seasons). |
| season | integer | Season END year of the request (2027 = 2026-2027). |
| competition | character | TBF league of the request: bsl, tbl or kbsl. |
| week | character | Week number as a string; the value the week argument of tbf_standings and tbf_schedule takes. |
| phase | integer | Phase code (devre = half / phase): 1 = first half of the regular season, 2 = second half, 3 = playoff quarter-final, 4 = semi-final, 5 = final. |
| phase_name | character | Phase name in Turkish on playoff weeks (Playoff Final = final); null on regular-season weeks. |
| label | character | Week label: 'Hafta N' (week N) or the playoff round name. |
| is_current | logical | True on the current (or last played) week; exactly one row. |

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
  try(tbf_weeks(competition = "bsl", season = 2027))
#> ── TBF Weeks ─────────────────────────────────────────────────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-09 23:11:58 UTC
#> # A tibble: 30 × 8
#>    activity_id season competition week  phase phase_name label    is_current
#>          <int>  <int> <chr>       <chr> <int> <chr>      <chr>    <lgl>     
#>  1       22214   2027 bsl         1         1 NA         Hafta 1  FALSE     
#>  2       22214   2027 bsl         2         1 NA         Hafta 2  FALSE     
#>  3       22214   2027 bsl         3         1 NA         Hafta 3  FALSE     
#>  4       22214   2027 bsl         4         1 NA         Hafta 4  FALSE     
#>  5       22214   2027 bsl         5         1 NA         Hafta 5  FALSE     
#>  6       22214   2027 bsl         6         1 NA         Hafta 6  FALSE     
#>  7       22214   2027 bsl         7         1 NA         Hafta 7  TRUE      
#>  8       22214   2027 bsl         8         1 NA         Hafta 8  FALSE     
#>  9       22214   2027 bsl         9         1 NA         Hafta 9  FALSE     
#> 10       22214   2027 bsl         10        1 NA         Hafta 10 FALSE     
#> # ℹ 20 more rows
# }
```
