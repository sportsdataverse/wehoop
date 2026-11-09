# **TBF Team Roster**

Roster of one team-season with games, minutes and per-game points and
efficiency (birth dates dropped).

Endpoint:
`GET https://miniappapi.tbf.org.tr/webapi-service/api/Team/get-team-active-player-list-by-season-and-league`

## Usage

``` r
tbf_team_roster(season, team_process_id, competition = "kbsl")
```

## Arguments

- season:

  Required. Season END year (2027 = the 2026-2027 season). TBF keys a
  league-season by internal season and activity ids; the runtime reads
  them from the league's season list by the END year of the label. A
  year the list lacks raises `wehoop_no_data`.

- team_process_id:

  Required. Team-season id (team registration), e.g. 265995 = Tofas in
  BSL 2026-27; team_process_id in
  [`tbf_teams()`](https://wehoop.sportsdataverse.org/reference/tbf_teams.md)
  and
  [`tbf_schedule()`](https://wehoop.sportsdataverse.org/reference/tbf_schedule.md).
  New for every club in every league-season; not the stable club_id.

- competition:

  TBF league: bsl (Basketbol Super Ligi), tbl (second tier) or kbsl
  (women's Super Ligi). The top flight was named TBL until 2007-08 and
  is listed under bsl. Default `"kbsl"` (the women's Super Ligi).

## Value

A `wehoop_data` tibble. One row per rostered person. Birth dates are not
returned. Every column below is always present (a zero-row tibble keeps
them and their types); an answer with nothing in it raises
`wehoop_no_data`, as in sportsdataverse-py.

|  |  |  |
|----|----|----|
| col_name | type | description |
| season | integer | Season END year (2027 = the 2026-2027 season), read from the 'YYYY-YYYY' label or the request; the sdv season key. Not the internal TBF season id (season_id). |
| competition | character | TBF league the row belongs to: bsl, tbl or kbsl (the request's competition, or the league prefix the API reports). |
| team_process_id | integer | Team-season id of the request (key space: TBF team registrations). |
| person_id | integer | TBF person id (personId; key space: TBF persons). |
| first_name | character | Given name as registered with TBF, mixed case ('Yigitcan'). |
| last_name | character | Family name as registered with TBF, mixed case ('Saybir'). |
| nationality | character | Nationality as a TURKISH country name (country); there is no code on this route. |
| height_cm | integer | Height in centimetres; null when TBF has none. |
| jersey_number | character | Shirt number as a string, so '0' and '00' stay distinct. |
| games | integer | Games played (macSayisi = game count). |
| seconds_played | integer | Season time on court in seconds (sure 'hh:mm:ss'). |
| points_per_game | double | Points per game (sayi). |
| efficiency_per_game | double | Efficiency rating per game (verimlilikPuani). |

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
  try(tbf_team_roster(season = 2027, team_process_id = 265995))
#> Error in tbf_team_roster(season = 2027, team_process_id = 265995) : 
#>   
#> miniappapi.tbf.org.tr/webapi-service/api/Team/get-team-active-player-list-by-season-and-league:
#> no rows for this team-season.
# }
```
