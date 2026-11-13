# **TBF Players**

Every player registered in one league-season (birth dates are not
returned).

Endpoint:
`GET https://miniappapi.tbf.org.tr/webapi-service/api/Player/get-player-list`

## Usage

``` r
tbf_players(season, competition = "kbsl")
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

A `wehoop_data` tibble. One row per registered player. Birth dates are
not returned. Every column below is always present (a zero-row tibble
keeps them and their types); an answer with nothing in it raises
`wehoop_no_data`, as in sportsdataverse-py.

|  |  |  |
|----|----|----|
| col_name | type | description |
| season | integer | Season END year of the request. |
| competition | character | League prefix the row reports (bsl, tbl or kbsl); equals the request's competition. |
| person_id | integer | TBF person id (kisiID; key space: TBF persons, stable across seasons and clubs). |
| player_name | character | Player name as TBF prints it for that route (title case, Turkish letters kept). |
| nationality | character | Nationality as a TURKISH country name (ABD = United States); see the nationality_code. |
| nationality_code | character | Nationality code (tabiyetKisa), ISO 3166-1 alpha-3 except GB for the United Kingdom. |
| club_id | integer | Stable club id (takimID / teamId of the team lists; key space: TBF clubs, the same across seasons and leagues: Tofas = 13). Not the team-season id (team_process_id). |
| team_name | character | Team name for that season, uppercase with Turkish letters. |
| jersey_number | character | Shirt number as a string, so '0' and '00' stay distinct. |
| prefix | character | League prefix of the row (bsl, tbl, kbsl); the runtime refuses any other than the request's. |
| season_id | integer | Internal TBF season id (key space: TBF seasons, global across leagues: 174 = 2026-2027, 172 = 2025-2026; the odd ids are international UA- seasons). Never an sdv key: use season (END year). |

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
  try(tbf_players(competition = "bsl", season = 2027))
#> ── TBF Players ───────────────────────────────────────────────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-13 19:08:08 UTC
#> # A tibble: 266 × 11
#>    season competition person_id player_name nationality nationality_code club_id
#>     <int> <chr>           <int> <chr>       <chr>       <chr>              <int>
#>  1   2027 bsl            443749 Ahmet Aldi… TÜRKİYE     TUR               246239
#>  2   2027 bsl            445703 Ahmet Keri… TÜRKİYE     TUR                 2195
#>  3   2027 bsl            159631 Akın Kande… TÜRKİYE     TUR               234077
#>  4   2027 bsl            512899 Akwasi Yeb… BÜYÜK BRİT… GB                 47153
#>  5   2027 bsl            776935 Aleksa Avr… SIRBİSTAN   SRB                55636
#>  6   2027 bsl            502492 Aleksej Ni… SLOVENYA    SVN                    4
#>  7   2027 bsl            779278 Alen Smail… SIRBİSTAN   SRB                    4
#>  8   2027 bsl            441857 Alex Perez  ABD         USA               234077
#>  9   2027 bsl            778182 Alex Reese  ABD         USA               246463
#> 10   2027 bsl            393217 Ali Yiğit … TÜRKİYE     TUR                    3
#> # ℹ 256 more rows
#> # ℹ 4 more variables: team_name <chr>, jersey_number <chr>, prefix <chr>,
#> #   season_id <int>
# }
```
