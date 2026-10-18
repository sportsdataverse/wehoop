# **Get W League Box Score**

Box score of a final game (2013-14 on): one row per player of both
teams.

Endpoint: `GET https://api.wjbl.01core.app/api/boxscore`

## Usage

``` r
wjbl_box_score(play_schedule_id)
```

## Arguments

- play_schedule_id:

  Game id (play_schedule_id in wjbl_schedule): ONE global sequence
  across every league edition and season, e.g. 7987 (2025-26 playoff
  final game 1), 5533 (2018-19), 4243 (2013-14 final, box score only).
  The game must be final.

## Value

A `wehoop_data` tibble, one row per record; the columns are always
these, in this order (sdv-py `wjbl_box_score`):

|  |  |  |
|----|----|----|
| col_name | type | description |
| play_schedule_id | integer | Game id play_schedule_id (key space: W League games, ONE global sequence across every league_id and season, e.g. 4243 = 2013-14 final, 7987 = 2025-26 final). The play_schedule_id parameter of every game route and of the site's /schedule_result/detail/\*?play_schedule_id= pages. |
| team_side | character | Which side of the game the row belongs to: home or away (the API's home / away blocks). |
| team_id | integer | Franchise id team_id of the side (stable across seasons and sponsor renames; 13 = Toyota Antelopes). |
| player_id | integer | Player id player_id (key space: W League persons, STABLE across seasons and teams). The player_id of /player and the pi= of the site's /player/detail?pi=; joins the play-by-play player_id1 / player_id2. |
| player_name | character | Player name in Japanese, 'SURNAME GIVEN' with a space (foreign players in katakana). |
| player_number | character | Shirt number, a string. |
| gs | integer | Game started: 1 = starter, 0 = bench (integer). |
| pts | integer | Points. Integer. |
| p2m | integer | Two-point field goals made. Integer. |
| p2a | integer | Two-point field goals attempted. Integer. |
| p3m | integer | Three-point field goals made. Integer. |
| p3a | integer | Three-point field goals attempted. Integer. |
| ftm | integer | Free throws made. Integer. |
| fta | integer | Free throws attempted. Integer. |
| f | integer | Personal fouls committed. Integer. |
| off | integer | Offensive rebounds. Integer. |
| def | integer | Defensive rebounds. Integer. |
| tot | integer | Total rebounds (off + def). Integer. |
| ast | integer | Assists. Integer. |
| stl | integer | Steals. Integer. |
| blk | integer | Blocked shots (made by this player / team). Integer. |
| to | integer | Turnovers. Integer. |
| min | character | Minutes played 'mm:ss' ('22:19'), a string. |
| min_seconds | integer | Minutes played in whole seconds, from the 'mm:ss' clock string min (null when it does not parse). |

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
[`wjbl_game()`](https://wehoop.sportsdataverse.org/reference/wjbl_game.md),
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
  try(wjbl_box_score(play_schedule_id = 7987))
#> ── W League Box Score from api.wjbl.01core.app ──────────── wehoop 3.0.0.9000 ──
#> ℹ Data updated: 2026-10-18 14:08:10 UTC
#> # A tibble: 27 × 24
#>    play_schedule_id team_side team_id player_id player_name  player_number    gs
#>               <int> <chr>       <int>     <int> <chr>        <chr>         <int>
#>  1             7987 home           13      9799 岡本 美優    11                1
#>  2             7987 home           13     17454 オコンクウォ スーザン… 13                1
#>  3             7987 home           13      3395 平下 愛佳    14                1
#>  4             7987 home           13      1389 安間 志織    15                1
#>  5             7987 home           13      1443 山本 麻衣    23                1
#>  6             7987 home           13     14381 小野寺 佑奈  3                 0
#>  7             7987 home           13      9850 横山 智那美  7                 0
#>  8             7987 home           13      3396 永田 萌絵    20                0
#>  9             7987 home           13     18968 シュック カイリー ア… 24                0
#> 10             7987 home           13      9794 三浦 舞華    30                0
#> # ℹ 17 more rows
#> # ℹ 17 more variables: pts <int>, p2m <int>, p2a <int>, p3m <int>, p3a <int>,
#> #   ftm <int>, fta <int>, f <int>, off <int>, def <int>, tot <int>, ast <int>,
#> #   stl <int>, blk <int>, to <int>, min <chr>, min_seconds <int>
# }
```
