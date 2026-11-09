# **Get W League Player Period Leaders**

Leading scorer, passer and rebounder of each team per period, half and
game (2018-19 on).

Endpoint: `GET https://api.wjbl.01core.app/api/pbp/player-stats`

## Usage

``` r
wjbl_player_period_leaders(play_schedule_id)
```

## Arguments

- play_schedule_id:

  Game id (play_schedule_id in wjbl_schedule): ONE global sequence
  across every league edition and season, e.g. 7987 (2025-26 playoff
  final game 1), 5533 (2018-19), 4243 (2013-14 final, box score only).
  The game must be final.

## Value

A `wehoop_data` tibble, one row per record; the columns are always
these, in this order (sportsdataverse-py `wjbl_player_period_leaders`):

|  |  |  |
|----|----|----|
| col_name | type | description |
| play_schedule_id | integer | Game id play_schedule_id (key space: W League games, ONE global sequence across every league_id and season, e.g. 4243 = 2013-14 final, 7987 = 2025-26 final). The play_schedule_id parameter of every game route and of the site's /schedule_result/detail/\*?play_schedule_id= pages. |
| home_team_id | integer | Home team: Franchise id team_id (key space: W League franchises, STABLE across seasons and sponsor renames: 13 = Toyota Antelopes, 12 = Denso Iris, 8 = ENEOS Sunflowers; all-star sides have their own ids, e.g. 591). The team_id of /team/roster and of the site's /team/roster/?team_id=. Not season_team_id. |
| away_team_id | integer | Away team: Franchise id team_id (key space: W League franchises, STABLE across seasons and sponsor renames: 13 = Toyota Antelopes, 12 = Denso Iris, 8 = ENEOS Sunflowers; all-star sides have their own ids, e.g. 591). The team_id of /team/roster and of the site's /team/roster/?team_id=. Not season_team_id. |
| period_category | integer | The period category again, as an integer (camelCase here, period_category on /pbp/team-stats). |
| period_label | character | Readable period: Q1-Q4 quarters, OT1-OT10 overtimes (period categories 5-14), H1 / H2 halves (15 / 16), OT all overtimes together (17), GAME the whole game (18). |
| home_point_player | character | Home points leader(s) in the period as '#NUMBER NAME' (Japanese); ties are joined with ', '. |
| home_point_value | character | Their points with the counter (Japanese) ((Japanese text)); ties joined with ', ' in the same order. |
| home_assist_player | character | Home assist leader(s), '#NUMBER NAME', ties joined with ', '. |
| home_assist_value | character | Their assists with the counter (Japanese) ((Japanese text)), ', '-joined for ties. |
| home_rebound_player | character | Home rebound leader(s), '#NUMBER NAME', ties joined with ', '. |
| home_rebound_value | character | Their rebounds 'offensive-defensive-total' ('0-3-3'), ', '-joined for ties. |
| away_point_player | character | Away points leader(s) in the period as '#NUMBER NAME' (Japanese); ties are joined with ', '. |
| away_point_value | character | Their points with the counter (Japanese) ((Japanese text)); ties joined with ', ' in the same order. |
| away_assist_player | character | Away assist leader(s), '#NUMBER NAME', ties joined with ', '. |
| away_assist_value | character | Their assists with the counter (Japanese) ((Japanese text)), ', '-joined for ties. |
| away_rebound_player | character | Away rebound leader(s), '#NUMBER NAME', ties joined with ', '. |
| away_rebound_value | character | Their rebounds 'offensive-defensive-total' ('0-3-3'), ', '-joined for ties. |

## Details

Source, terms of use, request pacing, seasons, ids, coverage and error
classes of this family: see the notes in
[`wjbl_leagues()`](https://wehoop.sportsdataverse.org/reference/wjbl_leagues.md).

     wjbl_player_period_leaders(play_schedule_id = 7987)

## See also

[family_wjbl](https://wehoop.sportsdataverse.org/reference/family_wjbl.md)
lists every function in this family.
