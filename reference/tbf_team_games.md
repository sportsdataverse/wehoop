# **TBF Team Games**

Games and results of one team-season, scheduled games included.

Endpoint:
`GET https://miniappapi.tbf.org.tr/webapi-service/api/Team/get-team-detail-matches-by-season-and-league`

## Usage

``` r
tbf_team_games(season, team_process_id, competition = "kbsl")
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

A `wehoop_data` tibble. One row per game of the team (scheduled games
included). Every column below is always present (a zero-row tibble keeps
them and their types); an answer with nothing in it raises
`wehoop_no_data`, as in sportsdataverse-py.

|  |  |  |
|----|----|----|
| col_name | type | description |
| season | integer | Season END year (2027 = the 2026-2027 season), read from the 'YYYY-YYYY' label or the request; the sdv season key. Not the internal TBF season id (season_id). |
| competition | character | TBF league the row belongs to: bsl, tbl or kbsl (the request's competition, or the league prefix the API reports). |
| team_process_id | integer | Team-season id of the request (key space: TBF team registrations). |
| match_id | integer | TBF game id (key space: TBF games, one global sequence). |
| match_code | character | TBF short game code. |
| tipoff | POSIXct | Tip-off as a naive timestamp in Turkey local time (tarih). |
| week | character | Week label (formattedWeek), e.g. '1. Hafta'. |
| city | character | City of the venue (sehir), uppercase Turkish. |
| venue | character | Venue name (salon). |
| home_team_process_id | integer | Home team-season id (takimAId; key space: TBF team registrations). |
| home_team | character | Home team name (takimA). |
| home_score | integer | Home points (skorA); null before the game. |
| away_team_process_id | integer | Away team-season id (takimBId). |
| away_team | character | Away team name (takimB). |
| away_score | integer | Away points (skorB); null before the game. |
| team_is_home | logical | True when the asked team was the home side (isHome). |
| team_won | logical | True when the asked team won (isWin); false for a loss or an unplayed game. |
| is_played | logical | True once the game has been played (isPlayed). |
| status | character | Game status text in Turkish: Oynandi = played, Oynanmadi = not played (durum). |
| status_id | integer | Game status code (durumId): 1 = played, 4 = not played. |
| has_overtime | logical | Overtime flag (uzatma = overtime). Reliability unverified: false on every one of 64 BSL 2025-26 games checked. |

## Details

Source, terms of use, request pacing, seasons, coverage and error
classes of this family: see the notes in
[`tbf_seasons()`](https://wehoop.sportsdataverse.org/reference/tbf_seasons.md).

     tbf_team_games(season = 2027, team_process_id = 265995)

## See also

[family_tbf](https://wehoop.sportsdataverse.org/reference/family_tbf.md)
lists every function in this family.
