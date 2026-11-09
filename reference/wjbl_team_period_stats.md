# **Get W League Team Period Stats**

Team stat summary per period, half and game (2018-19 on): percentages,
rebounds, assists, turnovers, lead changes.

Endpoint: `GET https://api.wjbl.01core.app/api/pbp/team-stats`

## Usage

``` r
wjbl_team_period_stats(play_schedule_id)
```

## Arguments

- play_schedule_id:

  Game id (play_schedule_id in wjbl_schedule): ONE global sequence
  across every league edition and season, e.g. 7987 (2025-26 playoff
  final game 1), 5533 (2018-19), 4243 (2013-14 final, box score only).
  The game must be final.

## Value

A `wehoop_data` tibble, one row per record; the columns are always
these, in this order (sportsdataverse-py `wjbl_team_period_stats`):

|  |  |  |
|----|----|----|
| col_name | type | description |
| play_schedule_id | integer | Game id play_schedule_id (key space: W League games, ONE global sequence across every league_id and season, e.g. 4243 = 2013-14 final, 7987 = 2025-26 final). The play_schedule_id parameter of every game route and of the site's /schedule_result/detail/\*?play_schedule_id= pages. |
| home_team_id | integer | Home team: Franchise id team_id (key space: W League franchises, STABLE across seasons and sponsor renames: 13 = Toyota Antelopes, 12 = Denso Iris, 8 = ENEOS Sunflowers; all-star sides have their own ids, e.g. 591). The team_id of /team/roster and of the site's /team/roster/?team_id=. Not season_team_id. |
| away_team_id | integer | Away team: Franchise id team_id (key space: W League franchises, STABLE across seasons and sponsor renames: 13 = Toyota Antelopes, 12 = Denso Iris, 8 = ENEOS Sunflowers; all-star sides have their own ids, e.g. 591). The team_id of /team/roster and of the site's /team/roster/?team_id=. Not season_team_id. |
| period_category | integer | The period category again, as an integer (see periods). |
| period_label | character | Readable period: Q1-Q4 quarters, OT1-OT10 overtimes (period categories 5-14), H1 / H2 halves (15 / 16), OT all overtimes together (17), GAME the whole game (18). |
| home_ptr | double | Home field-goal percentage (2PT + 3PT) in the period, 0-100, a NUMBER with up to one decimal (61.5; whole values come as integers). |
| home_pt2r | double | Home two-point percentage, 0-100, number. |
| home_pt3r | double | Home three-point percentage, 0-100, number. |
| home_ftr | double | Home free-throw percentage, 0-100, number (0 when no attempts). |
| home_rebound_off | integer | Home offensive rebounds in the period, the first number of the wire's 'off-def-total' string. |
| home_rebound_def | integer | Home defensive rebounds in the period, the second number of the wire's 'off-def-total' string. |
| home_rebound_tot | integer | Home total rebounds in the period, the third number of the wire's 'off-def-total' string. |
| home_assist | integer | Home assists (integer). |
| home_turnovers | integer | Home turnovers in the period, from the wire's counted string (6); the wire key is spelled home_trun_over. |
| home_max_difference | integer | Home team's largest lead in the period, in points; the wire key is spelled home_max_differenct. |
| away_ptr | double | Away field-goal percentage (2PT + 3PT) in the period, 0-100, a NUMBER with up to one decimal (61.5; whole values come as integers). |
| away_pt2r | double | Away two-point percentage, 0-100, number. |
| away_pt3r | double | Away three-point percentage, 0-100, number. |
| away_ftr | double | Away free-throw percentage, 0-100, number (0 when no attempts). |
| away_rebound_off | integer | Away offensive rebounds in the period, the first number of the wire's 'off-def-total' string. |
| away_rebound_def | integer | Away defensive rebounds in the period, the second number of the wire's 'off-def-total' string. |
| away_rebound_tot | integer | Away total rebounds in the period, the third number of the wire's 'off-def-total' string. |
| away_assist | integer | Away assists (integer). |
| away_turnovers | integer | Away turnovers in the period, from the wire's counted string (6); the wire key is spelled away_trun_over. |
| away_max_difference | integer | Away team's largest lead in the period, points (integer). |
| lead_count | integer | Lead changes in the period, from the wire's counted string (0 times). |
| tie_count | integer | Times the score was tied in the period, from the wire's counted string (4 times). |

## Details

Source, terms of use, request pacing, seasons, ids, coverage and error
classes of this family: see the notes in
[`wjbl_leagues()`](https://wehoop.sportsdataverse.org/reference/wjbl_leagues.md).

     wjbl_team_period_stats(play_schedule_id = 7987)

## See also

[family_wjbl](https://wehoop.sportsdataverse.org/reference/family_wjbl.md)
lists every function in this family.
