# **TBF Team Staff**

Coaching and club staff of one team-season.

Endpoint:
`GET https://miniappapi.tbf.org.tr/webapi-service/api/Team/get-team-detail-team-staff-by-season-and-league`

## Usage

``` r
tbf_team_staff(season, team_process_id, competition = "kbsl")
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

A `wehoop_data` tibble. One row per staff member. Every column below is
always present (a zero-row tibble keeps them and their types); an answer
with nothing in it raises `wehoop_no_data`, as in sportsdataverse-py.

|  |  |  |
|----|----|----|
| col_name | type | description |
| season | integer | Season END year (2027 = the 2026-2027 season), read from the 'YYYY-YYYY' label or the request; the sdv season key. Not the internal TBF season id (season_id). |
| competition | character | TBF league the row belongs to: bsl, tbl or kbsl (the request's competition, or the league prefix the API reports). |
| team_process_id | integer | Team-season id of the request (key space: TBF team registrations). |
| person_id | integer | TBF person id of the staff member (code; staff are TBF persons too). |
| first_name | character | Given name(s) as registered with TBF, uppercase ('MEVLUT TULGA'). |
| last_name | character | Family name as registered with TBF, uppercase ('ONGOREN'). |
| role | character | Staff role in Turkish as sent (job), e.g. Antrenor = head coach. |
| role_code | integer | Staff sub-role code (subRolesCode). |

## Details

Source, terms of use, request pacing, seasons, coverage and error
classes of this family: see the notes in
[`tbf_seasons()`](https://wehoop.sportsdataverse.org/reference/tbf_seasons.md).

     tbf_team_staff(season = 2027, team_process_id = 265995)

## See also

[family_tbf](https://wehoop.sportsdataverse.org/reference/family_tbf.md)
lists every function in this family.
