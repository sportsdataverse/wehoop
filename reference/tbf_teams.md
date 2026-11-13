# **TBF Teams**

Every team registered in one league-season with its team-season id
(team_process_id) and club id.

Endpoint:
`GET https://miniappapi.tbf.org.tr/webapi-service/api/Team/get-teams-by-leauge`

## Usage

``` r
tbf_teams(season, competition = "kbsl")
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

A `wehoop_data` tibble. One row per team registration. Every column
below is always present (a zero-row tibble keeps them and their types);
an answer with nothing in it raises `wehoop_no_data`, as in
sportsdataverse-py.

|  |  |  |
|----|----|----|
| col_name | type | description |
| season | integer | Season END year (2027 = the 2026-2027 season), read from the 'YYYY-YYYY' label or the request; the sdv season key. Not the internal TBF season id (season_id). |
| competition | character | TBF league the row belongs to: bsl, tbl or kbsl (the request's competition, or the league prefix the API reports). |
| team_process_id | integer | Team-season id (teamProcessId = takimIslemId, a team REGISTRATION; key space: TBF team registrations, a NEW id per club per league-season: Tofas = 265995 in BSL 2026-27). The team_process_id argument of the team wrappers; not the stable club_id. |
| club_id | integer | Stable club id (takimID / teamId of the team lists; key space: TBF clubs, the same across seasons and leagues: Tofas = 13). Not the team-season id (team_process_id). |
| team_name | character | Team name as registered for that season, uppercase with Turkish letters. |
| city | character | Home city (teamCityName), uppercase Turkish. |
| code | character | Team short code (teamCode). |
| season_id | integer | Internal TBF season id (key space: TBF seasons, global across leagues: 174 = 2026-2027, 172 = 2025-2026; the odd ids are international UA- seasons). Never an sdv key: use season (END year). |
| season_label | character | Season label 'YYYY-YYYY' of the league-season. |

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
  try(tbf_teams(competition = "bsl", season = 2027))
#> ── TBF Teams ─────────────────────────────────────────────────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-13 11:59:04 UTC
#> # A tibble: 16 × 9
#>    season competition team_process_id club_id team_name    city  code  season_id
#>     <int> <chr>                 <int>   <int> <chr>        <chr> <chr>     <int>
#>  1   2027 bsl                  266048    2195 ALİAĞA PETK… İZMİR PTK         174
#>  2   2027 bsl                  265990       2 ANADOLU EFES İSTA… EFS         174
#>  3   2027 bsl                  265991   55636 BAHÇEŞEHİR … İSTA… BSK         174
#>  4   2027 bsl                  265992       1 BEŞİKTAŞ     İSTA… BJK         174
#>  5   2027 bsl                  268222  246463 BİOTEKNO KÖ… KOCA… KÖR         174
#>  6   2027 bsl                  266176  246239 BURSASPOR B… BURSA BUR         174
#>  7   2027 bsl                  266024  184811 ESENLER ERO… İSTA… ERK         174
#>  8   2027 bsl                  266025       3 FENERBAHÇE … İSTA… FBT         174
#>  9   2027 bsl                  266026       4 GALATASARAY… İSTA… GSM         174
#> 10   2027 bsl                  265994  180700 GLİNT ÇAYIR… KOCA… ÇBK         174
#> 11   2027 bsl                  266027       6 KARŞIYAKA    İZMİR KSK         174
#> 12   2027 bsl                  265993  234077 PİZZABULLS … BALI… PBB         174
#> 13   2027 bsl                  265995      13 TOFAŞ        BURSA TOF         174
#> 14   2027 bsl                  266029   47153 TRABZONSPOR  TRAB… TS          174
#> 15   2027 bsl                  266030      12 TÜRK TELEKOM ANKA… TTK         174
#> 16   2027 bsl                  266028  171967 YUKATEL DEN… DENİ… YDB         174
#> # ℹ 1 more variable: season_label <chr>
# }
```
