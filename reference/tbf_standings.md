# **TBF Standings**

League table of one league-season after a week (default the latest), one
row per team and group.

Endpoint:
`GET https://miniappapi.tbf.org.tr/webapi-service/api/League/get-standings-table`

## Usage

``` r
tbf_standings(season, competition = "kbsl", week = NULL)
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

- week:

  Week (hafta) number as returned by
  [`tbf_weeks()`](https://wehoop.sportsdataverse.org/reference/tbf_weeks.md),
  e.g. 1; playoff rounds continue the numbering (31-33 in 2025-26).
  Default: the latest week for standings, every week for the schedule.

## Value

A `wehoop_data` tibble. One row per team and group. Tie-break detail
rows (`tiedRows`) are not included. Every column below is always present
(a zero-row tibble keeps them and their types); an answer with nothing
in it raises `wehoop_no_data`, as in sportsdataverse-py.

|  |  |  |
|----|----|----|
| col_name | type | description |
| season | integer | Season END year (2027 = the 2026-2027 season), read from the 'YYYY-YYYY' label or the request; the sdv season key. Not the internal TBF season id (season_id). |
| competition | character | TBF league the row belongs to: bsl, tbl or kbsl (the request's competition, or the league prefix the API reports). |
| group | character | Group name (grup); empty for a single-group league. |
| activity_id | integer | Activity id (faaliyet = activity; key space: TBF league-SEASONS, new every season: BSL 2026-27 = 22214, BSL 2025-26 = 20728, TBL 2026-27 = 22215, KBSL 2026-27 = 22209). Cast to an integer from the 22214 / 22214.0 the API sends. |
| team_process_id | integer | Team-season id (teamProcessId = takimIslemId, a team REGISTRATION; key space: TBF team registrations, a NEW id per club per league-season: Tofas = 265995 in BSL 2026-27). The team_process_id argument of the team wrappers; not the stable club_id. |
| team_name | character | Team name as registered for that season, uppercase with Turkish letters (sponsor name: 'PIZZABULLS BORDO BANDIRMA'). |
| week | integer | The week the table is computed after (hafta); equals the week argument, else the latest. |
| rank | integer | League rank (sira) after that week. |
| played | integer | Games played (o = oynanan). |
| won | integer | Games won (g = galibiyet). |
| lost | integer | Games lost (m = maglubiyet). |
| points_for | integer | Points scored (a = atilan). |
| points_against | integer | Points conceded (y = yenilen). |
| points | integer | League points (puan): 2 for a win, 1 for a loss. |
| head_to_head_points | integer | Head-to-head league points among teams tied on points (icP = ic puan). |
| head_to_head_diff | integer | Head-to-head point difference among teams tied on points (icA = ic averaj). |
| total_diff | integer | Total point difference over all games (toA = toplam averaj). |
| excluded | integer | Exclusion marker (ihrac = expulsion); 0 for teams still in the league. |

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
  try(tbf_standings(competition = "bsl", season = 2027))
#> ── TBF Standings ─────────────────────────────────────────────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-09 20:22:02 UTC
#> # A tibble: 16 × 18
#>    season competition group activity_id team_process_id team_name     week  rank
#>     <int> <chr>       <chr>       <int>           <int> <chr>        <int> <int>
#>  1   2027 bsl         NA          22214          266030 TÜRK TELEKOM     7     1
#>  2   2027 bsl         NA          22214          265991 BAHÇEŞEHİR …     7     2
#>  3   2027 bsl         NA          22214          266025 FENERBAHÇE …     7     3
#>  4   2027 bsl         NA          22214          265990 ANADOLU EFES     7     4
#>  5   2027 bsl         NA          22214          266026 GALATASARAY…     7     5
#>  6   2027 bsl         NA          22214          266048 ALİAĞA PETK…     7     6
#>  7   2027 bsl         NA          22214          266029 TRABZONSPOR      7     7
#>  8   2027 bsl         NA          22214          266027 KARŞIYAKA        7     8
#>  9   2027 bsl         NA          22214          266024 ESENLER ERO…     7     9
#> 10   2027 bsl         NA          22214          265992 BEŞİKTAŞ         7    10
#> 11   2027 bsl         NA          22214          265995 TOFAŞ            7    11
#> 12   2027 bsl         NA          22214          268222 BİOTEKNO KÖ…     7    12
#> 13   2027 bsl         NA          22214          265993 PİZZABULLS …     7    13
#> 14   2027 bsl         NA          22214          265994 GLİNT ÇAYIR…     7    14
#> 15   2027 bsl         NA          22214          266028 YUKATEL DEN…     7    15
#> 16   2027 bsl         NA          22214          266176 BURSASPOR B…     7    16
#> # ℹ 10 more variables: played <int>, won <int>, lost <int>, points_for <int>,
#> #   points_against <int>, points <int>, head_to_head_points <int>,
#> #   head_to_head_diff <int>, total_diff <int>, excluded <int>
# }
```
