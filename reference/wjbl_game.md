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
these, in this order (sdv-py `wjbl_game`):

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

- Unofficial and unsupported: these wrappers read the JSON backend of
  www.wjbl.org (api.wjbl.01core.app), keyless, found in the site's own
  JavaScript. The site's terms of use (www.wjbl.org/kiyaku/) forbid
  reproducing, republishing or otherwise using site content without
  permission: a copyright clause, not an anti-scraping one. The wrappers
  fetch on the user's behalf; a published data release or a hosted
  mirror needs the owner's decision first. The site has no robots.txt
  (404, checked 2026-10-12), so no Crawl-delay is published; the runtime
  waits at least 1 s before every request, retries included. Payloads
  are not redistributed as release assets.

- Women's league: the W League is Japan's top women's basketball league
  (the SportsDataverse R counterpart is wehoop). All text is Japanese
  (team names, phases, play-by-play actions); the column descriptions
  translate the vocabulary.

- Seasons are END years (2026 = 2025-26, 2000 = 1999-2000). The API keys
  a season edition by an opaque league_id (45 = '25-26 W League'; every
  all-star game, cup and camp has one too) and the wrappers map the END
  year with the live league list (one extra, cached request; END =
  2000 + the second YY of league_title). Phases inside an edition
  (season_id: 169 = regular season Premier, 170 = Future, 176 = playoff
  final; two divisions from 2024-25) are native ids, passed as given:
  wjbl_standing_seasons lists them with their END year.

- The schedule is paged by month: wjbl_schedule answers ONE month
  (game_month, YYYY-MM; omitted = the season's latest month only). List
  the months with wjbl_game_months and loop. The game routes take only
  the global play_schedule_id and serve final games only: each makes one
  extra, cached request (the game header) to prove the game is final and
  that the answer is the game and the teams asked for.

- Errors are HTTP 200: an unknown id answers \[\] (wehoop_no_data) and a
  missing or non-numeric parameter answers an error envelope
  (wehoop_asset_fetch). Coverage: schedules from 1999-2000, box scores
  from 2013-14, play-by-play and the period stats from 2018-19 (earlier
  games answer \[\] on the /pbp routes: wehoop_no_data). No route
  carries shot coordinates.

- Personal data: the organiser's contact details (phones, e-mail) and
  the player's blood type are never output, and phone numbers and e-mail
  addresses inside free text are replaced by \[redacted-phone\] /
  \[redacted-email\]. Do not add them back. Player bio fields and
  referee names are public and stay.

- Errors are classed conditions, all inheriting `wehoop_error`:
  `wehoop_no_data` (HTTP 404 or the API has nothing for the request: an
  empty list, an id it does not know, a game without play-by-play before
  2018-19, a season without months or games), `wehoop_bad_request` (a
  season that is not the END year of a W League edition, an id that is
  not an integer or a game_month that is not YYYY-MM, raised before the
  request, or the API's HTTP 400 / 422) and `wehoop_asset_fetch` (any
  other failure: an error envelope at HTTP 200, any other non-2xx, an
  empty or non-JSON body, a game that is not final, a truncated
  play-by-play, or a body for another game, league edition, month, team,
  season phase or player than the one asked for; `transient` is TRUE for
  408 / 429 / 5xx and transport failures). HTTP 500 is retried. Wrappers
  raise; they never warn and return an empty frame.

## See also

Other WJBL Functions:
[`wjbl_box_score()`](https://wehoop.sportsdataverse.org/reference/wjbl_box_score.md),
[`wjbl_game_info()`](https://wehoop.sportsdataverse.org/reference/wjbl_game_info.md),
[`wjbl_game_months()`](https://wehoop.sportsdataverse.org/reference/wjbl_game_months.md),
[`wjbl_head_to_head()`](https://wehoop.sportsdataverse.org/reference/wjbl_head_to_head.md),
[`wjbl_leagues()`](https://wehoop.sportsdataverse.org/reference/wjbl_leagues.md),
[`wjbl_pbp()`](https://wehoop.sportsdataverse.org/reference/wjbl_pbp.md),
[`wjbl_period_scores()`](https://wehoop.sportsdataverse.org/reference/wjbl_period_scores.md),
[`wjbl_player()`](https://wehoop.sportsdataverse.org/reference/wjbl_player.md),
[`wjbl_player_period_leaders()`](https://wehoop.sportsdataverse.org/reference/wjbl_player_period_leaders.md),
[`wjbl_roster()`](https://wehoop.sportsdataverse.org/reference/wjbl_roster.md),
[`wjbl_schedule()`](https://wehoop.sportsdataverse.org/reference/wjbl_schedule.md),
[`wjbl_staff()`](https://wehoop.sportsdataverse.org/reference/wjbl_staff.md),
[`wjbl_standing_seasons()`](https://wehoop.sportsdataverse.org/reference/wjbl_standing_seasons.md),
[`wjbl_team_box_score()`](https://wehoop.sportsdataverse.org/reference/wjbl_team_box_score.md),
[`wjbl_team_period_stats()`](https://wehoop.sportsdataverse.org/reference/wjbl_team_period_stats.md),
[`wjbl_team_ranking()`](https://wehoop.sportsdataverse.org/reference/wjbl_team_ranking.md),
[`wjbl_team_standings()`](https://wehoop.sportsdataverse.org/reference/wjbl_team_standings.md),
[`wjbl_teams()`](https://wehoop.sportsdataverse.org/reference/wjbl_teams.md)

## Examples

``` r
# \donttest{
  try(wjbl_game(play_schedule_id = 7987))
#> ── W League Game from api.wjbl.01core.app ────────────────────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-10-18 19:25:39 UTC
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
