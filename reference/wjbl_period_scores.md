# **Get W League Period Scores**

Points of each side in each period played (quarters and overtimes) from
the game header.

Endpoint: `GET https://api.wjbl.01core.app/api/play-schedule/detail`

## Usage

``` r
wjbl_period_scores(play_schedule_id)
```

## Arguments

- play_schedule_id:

  Game id (play_schedule_id in wjbl_schedule): ONE global sequence
  across every league edition and season, e.g. 7987 (2025-26 playoff
  final game 1), 5533 (2018-19), 4243 (2013-14 final, box score only).
  The game must be final.

## Value

A `wehoop_data` tibble, one row per record; the columns are always
these, in this order (sportsdataverse-py `wjbl_period_scores`):

|  |  |  |
|----|----|----|
| col_name | type | description |
| play_schedule_id | integer | Game id play_schedule_id (key space: W League games, ONE global sequence across every league_id and season, e.g. 4243 = 2013-14 final, 7987 = 2025-26 final). The play_schedule_id parameter of every game route and of the site's /schedule_result/detail/\*?play_schedule_id= pages. |
| team_side | character | Which side of the game the row belongs to: home or away (the API's home / away blocks). |
| team_id | integer | Franchise id team_id of the side (stable across seasons and sponsor renames; 13 = Toyota Antelopes). |
| period | integer | Period number: 1-4 are the quarters and 5-8 the first to fourth overtime (score_ot1 to score_ot4). |
| period_label | character | Readable period: Q1-Q4 quarters, OT1-OT10 overtimes (period categories 5-14), H1 / H2 halves (15 / 16), OT all overtimes together (17), GAME the whole game (18). |
| score | integer | Points the side scored in that period (null periods, such as overtimes not played, have no row). |

## Details

Source, terms of use, request pacing, seasons, ids, coverage and error
classes of this family: see the notes in
[`wjbl_leagues()`](https://wehoop.sportsdataverse.org/reference/wjbl_leagues.md).

     wjbl_period_scores(play_schedule_id = 7987)

## See also

[family_wjbl](https://wehoop.sportsdataverse.org/reference/family_wjbl.md)
lists every function in this family.
