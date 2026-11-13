# **TBF League Seasons**

Every season of one TBF league (bsl back to 1966-67) with its activity
and season ids.

Endpoint:
`GET https://miniappapi.tbf.org.tr/webapi-service/api/League/get-leagues-and-seasons-by-prefix`

## Usage

``` r
tbf_league_seasons(competition = "kbsl")
```

## Arguments

- competition:

  TBF league: bsl (Basketbol Super Ligi), tbl (second tier) or kbsl
  (women's Super Ligi). The top flight was named TBL until 2007-08 and
  is listed under bsl. Default `"kbsl"` (the women's Super Ligi).

## Value

A `wehoop_data` tibble. One row per season of the league, newest first.
Every column below is always present (a zero-row tibble keeps them and
their types); an answer with nothing in it raises `wehoop_no_data`, as
in sportsdataverse-py.

|  |  |  |
|----|----|----|
| col_name | type | description |
| activity_id | integer | Activity id (faaliyet = activity; key space: TBF league-SEASONS, new every season: BSL 2026-27 = 22214, BSL 2025-26 = 20728, TBL 2026-27 = 22215, KBSL 2026-27 = 22209). Cast to an integer from the 22214 / 22214.0 the API sends. |
| activity_name | character | League-season name as TBF prints it ('BSL 2026-2027'; the top flight reads 'TBL 2006-2007' until 2007-08). |
| url | character | League-season slug, '`<prefix>`-`<YYYY>`-`<YYYY>`' (bsl-2026-2027). |
| season_id | integer | Internal TBF season id (key space: TBF seasons, global across leagues: 174 = 2026-2027, 172 = 2025-2026; the odd ids are international UA- seasons). Never an sdv key: use season (END year). |
| season_label | character | Season label as TBF writes it, 'YYYY-YYYY' (start and end year). |
| season | integer | Season END year (2027 = the 2026-2027 season), read from the 'YYYY-YYYY' label or the request; the sdv season key. Not the internal TBF season id (season_id). |
| competition | character | TBF league the row belongs to: bsl, tbl or kbsl (the request's competition, or the league prefix the API reports). |

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
  try(tbf_league_seasons(competition = "bsl"))
#> ── TBF League Seasons ────────────────────────────────────────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-13 11:58:51 UTC
#> # A tibble: 61 × 7
#>    activity_id activity_name     url   season_id season_label season competition
#>          <int> <chr>             <chr>     <int> <chr>         <int> <chr>      
#>  1       22214 BSL 2026-2027     bsl-…       174 2026-2027      2027 bsl        
#>  2       20728 BSL 2025-2026     bsl-…       172 2025-2026      2026 bsl        
#>  3       19284 BSL 2024-2025     bsl-…       170 2024-2025      2025 bsl        
#>  4       17820 Türkiye Sigorta … bsl-…       168 2023-2024      2024 bsl        
#>  5       16354 BSL 2022-2023     bsl-…       166 2022-2023      2023 bsl        
#>  6       14919 ING BSL 2021-2022 bsl-…       164 2021-2022      2022 bsl        
#>  7       13559 ING BSL 2020-2021 bsl-…       162 2020-2021      2021 bsl        
#>  8       13310 ING BSL 2019-2020 bsl-…       160 2019-2020      2020 bsl        
#>  9       10986 TAHİNCİOĞLU BSL … bsl-…       158 2018-2019      2019 bsl        
#> 10        8791 TAHİNCİOĞLU BSL … bsl-…       156 2017-2018      2018 bsl        
#> # ℹ 51 more rows
# }
```
