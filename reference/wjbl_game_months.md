# **Get W League Game Months**

Months (YYYY-MM) that have games in a season, newest first; each is one
page of wjbl_schedule.

Endpoint: `GET https://api.wjbl.01core.app/api/play-schedule-months`

## Usage

``` r
wjbl_game_months(season)
```

## Arguments

- season:

  Season END year (2026 = 2025-26, 2000 = 1999-2000); the wrapper maps
  it to the league edition id (league_id) with the live league list
  (wjbl_leagues, one extra cached request).

## Value

A `wehoop_data` tibble, one row per record; the columns are always
these, in this order (sdv-py `wjbl_game_months`):

|  |  |  |
|----|----|----|
| col_name | type | description |
| league_id | integer | Competition edition id league_id, cast to an integer (the API echoes a string here and an integer elsewhere). |
| season | integer | Season END year of the request (2026 = 2025-26); the body itself does not carry it. |
| game_month | character | Month 'YYYY-MM': the game_month parameter of /play-schedules. |
| game_month_jpn | character | The month in Japanese, (Japanese text) (April 2026). |

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
[`wjbl_game()`](https://wehoop.sportsdataverse.org/reference/wjbl_game.md),
[`wjbl_game_info()`](https://wehoop.sportsdataverse.org/reference/wjbl_game_info.md),
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
  try(wjbl_game_months(season = 2026))
#> ── W League Game Months from api.wjbl.01core.app ─────────────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-10-18 20:10:51 UTC
#> # A tibble: 9 × 4
#>   league_id season game_month game_month_jpn
#>       <int>  <int> <chr>      <chr>         
#> 1        45   2026 2026-04    2026年4月     
#> 2        45   2026 2026-03    2026年3月     
#> 3        45   2026 2026-02    2026年2月     
#> 4        45   2026 2026-01    2026年1月     
#> 5        45   2026 2025-12    2025年12月    
#> 6        45   2026 2025-11    2025年11月    
#> 7        45   2026 2025-10    2025年10月    
#> 8        45   2026 2025-09    2025年9月     
#> 9        45   2026 2025-07    2025年7月     
# }
```
