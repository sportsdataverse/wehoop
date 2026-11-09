# **TBF Leaders**

Season leaders in one statistic per function: the server's top 20 by
season total and by per-game average. The `category` column names the
statistic.

Endpoints
(`GET https://miniappapi.tbf.org.tr/webapi-service/api/Player/<route>`):

- `tbf_leaders_points()`: points, `get-point-leaders`

- `tbf_leaders_assists()`: assists, `get-asist-leaders`

- `tbf_leaders_blocks()`: blocks, `get-blok-leaders`

- `tbf_leaders_rebounds()`: rebounds, `get-ribound-leaders`

- `tbf_leaders_steals()`: steals, `get-top-calma-leaders`

- `tbf_leaders_minutes()`: minutes, `get-duration-leaders`

- `tbf_leaders_threes()`: threes, `get-3Point-leaders`

- `tbf_leaders_turnovers()`: turnovers, `get-top-kaybi-leaders`

- `tbf_leaders_efficiency()`: efficiency, `get-mvp-leaders`

## Usage

``` r
tbf_leaders_points(season, competition = "kbsl")

tbf_leaders_assists(season, competition = "kbsl")

tbf_leaders_blocks(season, competition = "kbsl")

tbf_leaders_rebounds(season, competition = "kbsl")

tbf_leaders_steals(season, competition = "kbsl")

tbf_leaders_minutes(season, competition = "kbsl")

tbf_leaders_threes(season, competition = "kbsl")

tbf_leaders_turnovers(season, competition = "kbsl")

tbf_leaders_efficiency(season, competition = "kbsl")
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

A `wehoop_data` tibble. Up to 20 rows per `kind` (`total` and
`average`), best first. Every column below is always present (a zero-row
tibble keeps them and their types); an answer with nothing in it raises
`wehoop_no_data`, as in sportsdataverse-py.

|  |  |  |
|----|----|----|
| col_name | type | description |
| season | integer | Season END year (2027 = the 2026-2027 season), read from the 'YYYY-YYYY' label or the request; the sdv season key. Not the internal TBF season id (season_id). |
| competition | character | TBF league the row belongs to: bsl, tbl or kbsl (the request's competition, or the league prefix the API reports). |
| category | character | Statistic of the wrapper: points, assists, blocks, rebounds, steals, minutes, threes, turnovers or efficiency. |
| kind | character | total = the server's top 20 by season TOTAL; average = the top 20 by PER-GAME average. |
| rank | integer | Rank in the list, 1 = best (the API's order). |
| person_id | integer | TBF person id (oyuncuKodu, sent as a string; key space: TBF persons). |
| player_name | character | Player name as TBF prints it for that route (title case, Turkish letters kept). |
| team_process_id | integer | Team-season id (takimKodu, sent as a string; key space: TBF team registrations; despite the name NOT the club id). |
| team_name | character | Team name as registered for that season, uppercase with Turkish letters (sponsor name: 'PIZZABULLS BORDO BANDIRMA'). |
| games | integer | Games played (macSayisi, sent as a string). |
| value | double | The ranked statistic: the season total for kind total, the per-game average for kind average (the API names the field grup and sends it as a string). |

## Details

Source, terms of use, request pacing, seasons, coverage and error
classes of this family: see the notes in
[`tbf_seasons()`](https://wehoop.sportsdataverse.org/reference/tbf_seasons.md).

     tbf_leaders_points(competition = "bsl", season = 2027)
     tbf_leaders_assists(competition = "bsl", season = 2027)
     tbf_leaders_blocks(competition = "bsl", season = 2027)
     tbf_leaders_rebounds(competition = "bsl", season = 2027)
     tbf_leaders_steals(competition = "bsl", season = 2027)
     tbf_leaders_minutes(competition = "bsl", season = 2027)
     tbf_leaders_threes(competition = "bsl", season = 2027)
     tbf_leaders_turnovers(competition = "bsl", season = 2027)
     tbf_leaders_efficiency(competition = "bsl", season = 2027)

## See also

[family_tbf](https://wehoop.sportsdataverse.org/reference/family_tbf.md)
lists every function in this family.
