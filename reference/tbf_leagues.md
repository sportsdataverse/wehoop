# **TBF Leagues**

The featured leagues (league-season activities) of one TBF season: BSL,
TBL, KBSL and the others.

Endpoint:
`GET https://miniappapi.tbf.org.tr/webapi-service/api/League/get-leagues-for-filter`

## Usage

``` r
tbf_leagues(season)
```

## Arguments

- season:

  Required. Season END year (2027 = the 2026-2027 season). TBF keys a
  league-season by internal season and activity ids; the runtime reads
  them from the league's season list by the END year of the label. A
  year the list lacks raises `wehoop_no_data`.

## Value

A `wehoop_data` tibble. One row per league: BSL, TBL, KBSL, TKBL, TB2L
and the youth leagues with their `activity_id`. Every column below is
always present (a zero-row tibble keeps them and their types); an answer
with nothing in it raises `wehoop_no_data`, as in sportsdataverse-py.

|  |  |  |
|----|----|----|
| col_name | type | description |
| activity_id | integer | Activity id (faaliyet = activity; key space: TBF league-SEASONS, new every season: BSL 2026-27 = 22214, BSL 2025-26 = 20728, TBL 2026-27 = 22215, KBSL 2026-27 = 22209). Cast to an integer from the 22214 / 22214.0 the API sends. |
| name | character | Activity name '`<LEAGUE>` YYYY-YYYY' ('BSL 2026-2027'). |
| display_name | character | League short name ('BSL', 'KBSL', 'TBL', 'TKBL', 'TB2L', 'BGL', 'BGLK', 'KBBL'). |
| competition | character | TBF league the row belongs to: bsl, tbl or kbsl (the request's competition, or the league prefix the API reports). |
| gender | character | Gender in Turkish: 'Erkek' = men, 'Kadin' = women. |
| season_id | integer | Internal TBF season id (key space: TBF seasons, global across leagues: 174 = 2026-2027, 172 = 2025-2026; the odd ids are international UA- seasons). Never an sdv key: use season (END year). |
| season_label | character | Season label as TBF writes it, 'YYYY-YYYY' (start and end year). |
| season | integer | Season END year (2027 = the 2026-2027 season), read from the 'YYYY-YYYY' label or the request; the sdv season key. Not the internal TBF season id (season_id). |
| sort | integer | Display order in the app (integer, 1 = first: BSL). |

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
  try(tbf_leagues(season = 2027))
#> ── TBF Leagues ───────────────────────────────────────────────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-13 19:08:03 UTC
#> # A tibble: 8 × 9
#>   activity_id name        display_name competition gender season_id season_label
#>         <int> <chr>       <chr>        <chr>       <chr>      <int> <chr>       
#> 1       22214 BSL 2026-2… BSL          BSL         Erkek        174 2026-2027   
#> 2       22209 KBSL 2026-… KBSL         KBSL        Kadın        174 2026-2027   
#> 3       22215 TBL 2026-2… TBL          TBL         Erkek        174 2026-2027   
#> 4       22210 TKBL 2026-… TKBL         TKBL        Kadın        174 2026-2027   
#> 5       22223 TB2L 2026-… TB2L         TB2L        Erkek        174 2026-2027   
#> 6       23540 BGL 2026-2… BGL          BGL         Erkek        174 2026-2027   
#> 7       23541 BGLK 2026-… BGLK         BGLK        Kadın        174 2026-2027   
#> 8       23539 KBBL 2026-… KBBL         KBBL        Kadın        174 2026-2027   
#> # ℹ 2 more variables: season <int>, sort <int>
# }
```
