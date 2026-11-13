# **Get W League Game**

Game header of a final game: both teams, the result flag and the score
by period, one row.

Endpoint: `GET https://api.wjbl.01core.app/api/play-schedule/detail`

## Usage

``` r
wjbl_game(play_schedule_id)
```

## Arguments

- play_schedule_id:

  Game id (play_schedule_id in wjbl_schedule): ONE global sequence
  across every league edition and season, e.g. 7987 (2025-26 playoff
  final game 1), 5533 (2018-19), 4243 (2013-14 final, box score only).
  The game must be final.

## Value

A `wehoop_data` tibble, one row per record; the columns are always
these, in this order (sportsdataverse-py `wjbl_game`):

|  |  |  |
|----|----|----|
| col_name | type | description |
| play_schedule_id | integer | Game id: ONE global sequence across every league edition and season (7987 = 2025-26 playoff final game 1); the play_schedule_id of the request. |
| game_status | character | Game state; always fixed (final) here, the wrapper refuses a game that is not final. |
| home_team_id | integer | Home team: Franchise id team_id (key space: W League franchises, STABLE across seasons and sponsor renames: 13 = Toyota Antelopes, 12 = Denso Iris, 8 = ENEOS Sunflowers; all-star sides have their own ids, e.g. 591). The team_id of /team/roster and of the site's /team/roster/?team_id=. Not season_team_id. |
| home_season_team_name | character | Home team name: Team name as registered for the season, in Japanese (company + nickname: Toyota Antelopes). |
| home_season_team_short_name | character | Home team short name: Short team name for that season, Japanese (Toyota). |
| home_team_logo_image | character | Home team logo: Team logo path, relative to https://www.wjbl.org ('/static/images/base_team/...png' or '/assets/img/team/...png'). |
| home_team_entry_flg | integer | Official-league participant flag: 1 = a W League member team (the site links its roster), 0 = not (guest or all-star side). Integer. |
| home_season_team_area | character | Unobserved: null in every sample, so no type and no meaning is claimed. (By the site's standings JS: 0 = East, 1 = West conference when season_league_flg = 2.) |
| home_free_text | character | Free-text team label used when the slot has no team (e.g. 'winner of game X'); empty string in every sample. |
| home_winner_flg | integer | Result for this side: 1 = won, -1 = lost (integer; a 0 tie code is unobserved). |
| home_score | integer | Home points after the play, parsed from score ('HOME-AWAY'); null on plays that carry no score. |
| home_score_p1 | integer | Points scored IN the 1st quarter (not cumulative). |
| home_score_p2 | integer | Points scored in the 2nd quarter. |
| home_score_p3 | integer | Points scored in the 3rd quarter. |
| home_score_p4 | integer | Points scored in the 4th quarter. |
| home_score_ot1 | integer | Points scored in the 1st overtime (5 min); null when there was none. |
| home_score_ot2 | integer | Unobserved: null in every sample. When filled: Points in the 2nd overtime; null when none. |
| home_score_ot3 | integer | Unobserved: null in every sample. When filled: Points in the 3rd overtime; null when none. |
| home_score_ot4 | integer | Unobserved: null in every sample. When filled: Points in the 4th overtime; null when none. There is no score_ot5+: overtimes 5-10 appear only as play-by-play period 9-14 and in the /pbp/team-stats and /pbp/player-stats periods maps. |
| away_team_id | integer | Away team: Franchise id team_id (key space: W League franchises, STABLE across seasons and sponsor renames: 13 = Toyota Antelopes, 12 = Denso Iris, 8 = ENEOS Sunflowers; all-star sides have their own ids, e.g. 591). The team_id of /team/roster and of the site's /team/roster/?team_id=. Not season_team_id. |
| away_season_team_name | character | Away team name: Team name as registered for the season, in Japanese (company + nickname: Toyota Antelopes). |
| away_season_team_short_name | character | Away team short name: Short team name for that season, Japanese (Toyota). |
| away_team_logo_image | character | Away team logo: Team logo path, relative to https://www.wjbl.org ('/static/images/base_team/...png' or '/assets/img/team/...png'). |
| away_team_entry_flg | integer | Official-league participant flag: 1 = a W League member team (the site links its roster), 0 = not (guest or all-star side). Integer. |
| away_season_team_area | character | Unobserved: null in every sample, so no type and no meaning is claimed. (By the site's standings JS: 0 = East, 1 = West conference when season_league_flg = 2.) |
| away_free_text | character | Free-text team label used when the slot has no team (e.g. 'winner of game X'); empty string in every sample. |
| away_winner_flg | integer | Result for this side: 1 = won, -1 = lost (integer; a 0 tie code is unobserved). |
| away_score | integer | Away points after the play, parsed from score ('HOME-AWAY'); null on plays that carry no score. |
| away_score_p1 | integer | Points scored IN the 1st quarter (not cumulative). |
| away_score_p2 | integer | Points scored in the 2nd quarter. |
| away_score_p3 | integer | Points scored in the 3rd quarter. |
| away_score_p4 | integer | Points scored in the 4th quarter. |
| away_score_ot1 | integer | Points scored in the 1st overtime (5 min); null when there was none. |
| away_score_ot2 | integer | Unobserved: null in every sample. When filled: Points in the 2nd overtime; null when none. |
| away_score_ot3 | integer | Unobserved: null in every sample. When filled: Points in the 3rd overtime; null when none. |
| away_score_ot4 | integer | Unobserved: null in every sample. When filled: Points in the 4th overtime; null when none. There is no score_ot5+: overtimes 5-10 appear only as play-by-play period 9-14 and in the /pbp/team-stats and /pbp/player-stats periods maps. |

## Details

Source, terms of use, request pacing, seasons, ids, coverage and error
classes of this family: see the notes in
[`wjbl_leagues()`](https://wehoop.sportsdataverse.org/reference/wjbl_leagues.md).

## See also

[family_wjbl](https://wehoop.sportsdataverse.org/reference/family_wjbl.md)
lists every function in this family.

## Examples

``` r
# \donttest{
  try(wjbl_game(play_schedule_id = 7987))
#> ── W League Game from api.wjbl.01core.app ────────────────────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-13 23:25:14 UTC
#> # A tibble: 1 × 36
#>   play_schedule_id game_status home_team_id home_season_team_name      
#>              <int> <chr>              <int> <chr>                      
#> 1             7987 fixed                 13 トヨタ自動車 アンテロープス
#> # ℹ 32 more variables: home_season_team_short_name <chr>,
#> #   home_team_logo_image <chr>, home_team_entry_flg <int>,
#> #   home_season_team_area <chr>, home_free_text <chr>, home_winner_flg <int>,
#> #   home_score <int>, home_score_p1 <int>, home_score_p2 <int>,
#> #   home_score_p3 <int>, home_score_p4 <int>, home_score_ot1 <int>,
#> #   home_score_ot2 <int>, home_score_ot3 <int>, home_score_ot4 <int>,
#> #   away_team_id <int>, away_season_team_name <chr>, …
# }
```
