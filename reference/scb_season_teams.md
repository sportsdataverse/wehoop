# **Get BBL / DBBL Season Teams**

Every team of a season: club id, season-team id, name and three-letter
code.

Endpoint: `GET https://api.basketball-bundesliga.de/seasons/{season}`
(DBBL: the same route on `https://api-1.dbbl.scb.world`).

## Usage

``` r
scb_season_teams(season, league = "dbbl")
```

## Arguments

- season:

  (required) Season END year (2026 = 2025-26, the sdv key). Sent to the
  API as its START-year seasonId (season - 1).

- league:

  (default `"dbbl"`, the women's DBBL) League: `bbl` (men, easyCredit
  Basketball Bundesliga, api.basketball-bundesliga.de) or `dbbl` (women,
  Toyota Damen-Basketball-Bundesliga, api-1.dbbl.scb.world). The two
  share one API; game ids overlap, so a game is (league, game_id).

## Value

A `wehoop_data` tibble: Every team of a season: club id, season-team id,
name and three-letter code. An empty valid answer raises
`wehoop_no_data`; the columns are always these, in this order
(sportsdataverse-py `scb_season_teams`):

|  |  |  |
|----|----|----|
| col_name | type | description |
| league | character | League the row belongs to: `bbl` (men) or `dbbl` (women); BBL and DBBL game ids overlap, so a game is (league, game_id). |
| season | integer | Season END year (2026 = 2025-26), the sdv key; the API's `season_id` plus one. |
| season_id | integer | The API's own season key, the START year (2025 = 2025-26); `season` minus one. |
| team_id | character | Club id; equal to `seasonTeamId` in every sample. Joins to `/teams/{teamId}`. |
| season_team_id | character | Season-team id; equal to the club `teamId` in every sample (BBL 2005-2026, DBBL 2024-2026). |
| team_name | character | Team name as listed that season (sponsor names included). |
| tlc | character | Three-letter club code. |
| logo_url | character | Logo image URL (per season). |

## Details

Source, terms of use, request pacing, seasons, ids, coverage and error
classes of this family: see the notes in
[`scb_seasons()`](https://wehoop.sportsdataverse.org/reference/scb_seasons.md).

## See also

[family_scb](https://wehoop.sportsdataverse.org/reference/family_scb.md)
lists every function in this family.

## Examples

``` r
# \donttest{
  try(scb_season_teams(season = 2026))
#> ── BBL/DBBL Season Teams from the SCB API ────────────────────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-13 11:58:45 UTC
#> # A tibble: 10 × 8
#>    league season season_id team_id season_team_id team_name       tlc   logo_url
#>    <chr>   <int>     <int> <chr>   <chr>          <chr>           <chr> <chr>   
#>  1 dbbl     2026      2025 108     108            Saarlouis Roya… SAR   https:/…
#>  2 dbbl     2026      2025 104     104            GiroLive Panth… OSN   https:/…
#>  3 dbbl     2026      2025 101     101            BC Marburg      MAR   https:/…
#>  4 dbbl     2026      2025 110     110            TK Hannover Lu… HAN   https:/…
#>  5 dbbl     2026      2025 107     107            Rutronik Stars… KEL   https:/…
#>  6 dbbl     2026      2025 103     103            Eisvögel USC F… FRE   https:/…
#>  7 dbbl     2026      2025 100     100            ALBA BERLIN     ALB   https:/…
#>  8 dbbl     2026      2025 109     109            SYNTAINICS MBC  MBC   https:/…
#>  9 dbbl     2026      2025 105     105            Herner TC       HER   https:/…
#> 10 dbbl     2026      2025 102     102            Eigner Angels … NÖR   https:/…
# }
```
