# **Get W League Game Info**

Game information of a final game: venue, times, referees, links and the
Japanese game report, one row.

Endpoint: `GET https://api.wjbl.01core.app/api/play-schedule`

## Usage

``` r
wjbl_game_info(play_schedule_id)
```

## Arguments

- play_schedule_id:

  Game id (play_schedule_id in wjbl_schedule): ONE global sequence
  across every league edition and season, e.g. 7987 (2025-26 playoff
  final game 1), 5533 (2018-19), 4243 (2013-14 final, box score only).
  The game must be final.

## Value

A `wehoop_data` tibble, one row per record; the columns are always
these, in this order (sdv-py `wjbl_game_info`):

|  |  |  |
|----|----|----|
| col_name | type | description |
| play_schedule_id | integer | Game id play_schedule_id (key space: W League games, ONE global sequence across every league_id and season, e.g. 4243 = 2013-14 final, 7987 = 2025-26 final). The play_schedule_id parameter of every game route and of the site's /schedule_result/detail/\*?play_schedule_id= pages. |
| league_id | integer | Competition-edition id league_id (key space: W League competitions; sequential, ONE id per season of the league AND per all-star game, cup or camp: 45 = '25-26 W League', 47 = '26-27', 20 = '13-14', 46 = All-Star 2025-26). The league_id parameter of /play-schedules and /play-schedule-months; enumerate with /leagues. The sdv season is the END year of league_title (END = 2000 + the second YY: '25-26' -\> 2026, '99-00' -\> 2000). |
| league_title | character | Competition-edition title in Japanese: '25-26 W League' = 2025-26 W League (sdv END year 2026; END = 2000 + the second YY: '25-26' -\> 2026, '99-00' -\> 2000); also All-Star game, Autumn Cup, Summer Camp, 'W League SUPERGAMES'. |
| season | integer | Season END year (2025-26 = 2026, 1999-2000 = 2000) from league_title ('25-26 W League'); null for an all-star game, cup or camp. |
| season_id | integer | Season-phase id season_id (key space: phases WITHIN a league_id, e.g. 169 = 25-26 regular season Premier, 170 = 25-26 regular season Future, 176 = 25-26 playoff final). Not a year: one league_id has several season_ids. The season_ids parameter of /team-standings and /team-ranking and the season_id of /team/roster. |
| season_title | character | Phase title in Japanese: regular season, (Japanese text) / playoff final, playoff semifinal (the separator varies by era). |
| season_full_name | character | league_title + phase (+ division) in Japanese: 2025-26 regular season, Premier division (Future division, from 2024-25). |
| game_date | character | Game date in Japanese, (Japanese text) (Saturday 4 April 2026). |
| game_day | character | Game date as an ISO date (YYYY-MM-DD, Japan time), built from the game year and the game date. |
| game_start_time | character | Scheduled tip-off 'HH:MM', Japan time (JST, UTC+9). |
| started_at | character | Actual tip-off 'HH:MM', JST, as recorded ('15:01'); junk on 2013-14 games ('05:06' for a 19:00 game, and it CHANGES between requests: 05:06 / 05:16 / 05:25 for game 4243), so ignore it there. |
| opening_time | character | Doors-open time 'HH:MM', JST; empty when not published. |
| venue | character | Arena name, Japanese. |
| game_icon | integer | Icon code shown next to the game: 0 = none, 1 = home-game icon (home.svg), 2 = neutral-site icon (neutral.svg). |
| venue_address | character | Arena postal address, Japanese. |
| venue_others | character | Access directions to the arena (nearest station, walking time), Japanese free text. |
| allow_shoes_on | integer | Outdoor shoes allowed in the arena: 1 = not stated, 2 = yes (o), 3 or 4 = no (x). Integer. |
| allow_shoes_on_others | character | Extra note on outdoor shoes; empty string in every sample. |
| ticket_info | character | Ticket information, Japanese free text with CRLF line breaks and HTML links. |
| ticket_url | character | Ticket sale URL; empty string in every sample. |
| event_info | character | Event-day information (gate times, food, shoes, tip-off), Japanese free text with CRLF line breaks. |
| live_link | character | Live-stream URL; empty when none. |
| vod_link | character | Video-on-demand URL (Basketball LIVE / W-TV); empty when none. |
| bs_url | character | Satellite-TV (BS) broadcast URL; empty string in every sample. |
| cs_url | character | Cable/satellite (CS) broadcast URL; empty string in every sample. |
| ground_url | character | Terrestrial-TV broadcast URL; empty string in every sample. |
| other_url | character | Other broadcast URL; empty string in every sample. |
| cancel_flg | integer | Cancelled flag: 1 = cancelled, 0 = not. |
| delay_flg | integer | Postponed flag: 1 = postponed, 0 = not. |
| game_status | character | Game state: 'fixed' = final (confirmed result), 'scheduled' = not played yet (seen on 26-27 games); the site's JS also handles 'live', 'canceled' and 'delayed'. The capture banks only 'fixed' games. |
| box_flg | integer | Box-score flag (integer). 1 on every sampled game, scheduled ones included, so it does NOT prove a box score exists. |
| pbp_flg | integer | Play-by-play flag: 1 = /pbp/\* routes have data (2018-19 onward), 0 = not (they answer \[\]). |
| referee_name | character | Crew chief, 'SURNAME GIVEN' in Japanese; empty on 2013-14 (names are in comment); placeholder (Japanese text) (= 'referee 01') on game 5533. |
| sub_referee_name1 | character | First umpire, Japanese name; empty when not recorded. |
| sub_referee_name2 | character | Second umpire, Japanese name; empty when not recorded. |
| comment | character | Officials block, Japanese free text: (Japanese text) crew chief, (Japanese text) first umpire, (Japanese text) second umpire, 2013-14 (Japanese text) referee / (Japanese text) umpires / (Japanese text) commissioner; CRLF or `<br>` separated. |
| report | character | Game report (quarter-by-quarter narrative) in Japanese HTML; filled on 2013-14, empty on the newer samples. |
| home_team_id | integer | Home team: Franchise id team_id (key space: W League franchises, STABLE across seasons and sponsor renames: 13 = Toyota Antelopes, 12 = Denso Iris, 8 = ENEOS Sunflowers; all-star sides have their own ids, e.g. 591). The team_id of /team/roster and of the site's /team/roster/?team_id=. Not season_team_id. |
| home_season_team_name | character | Home team name: Team name as registered for the season, in Japanese (company + nickname: Toyota Antelopes). |
| home_season_team_short_name | character | Home team short name: Short team name for that season, Japanese (Toyota). |
| home_team_logo_image | character | Home team logo: Team logo path, relative to https://www.wjbl.org ('/static/images/base_team/...png' or '/assets/img/team/...png'). |
| home_free_text | character | Free-text team label used when the slot has no team (e.g. 'winner of game X'); empty string in every sample. |
| away_team_id | integer | Away team: Franchise id team_id (key space: W League franchises, STABLE across seasons and sponsor renames: 13 = Toyota Antelopes, 12 = Denso Iris, 8 = ENEOS Sunflowers; all-star sides have their own ids, e.g. 591). The team_id of /team/roster and of the site's /team/roster/?team_id=. Not season_team_id. |
| away_season_team_name | character | Away team name: Team name as registered for the season, in Japanese (company + nickname: Toyota Antelopes). |
| away_season_team_short_name | character | Away team short name: Short team name for that season, Japanese (Toyota). |
| away_team_logo_image | character | Away team logo: Team logo path, relative to https://www.wjbl.org ('/static/images/base_team/...png' or '/assets/img/team/...png'). |
| away_free_text | character | Free-text team label used when the slot has no team (e.g. 'winner of game X'); empty string in every sample. |

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
  try(wjbl_game_info(play_schedule_id = 7987))
#> ── W League Game Info from api.wjbl.01core.app ──────────── wehoop 3.0.0.9000 ──
#> ℹ Data updated: 2026-10-18 14:08:12 UTC
#> # A tibble: 1 × 47
#>   play_schedule_id league_id league_title  season season_id season_title        
#>              <int>     <int> <chr>          <int>     <int> <chr>               
#> 1             7987        45 25-26 Wリーグ   2026       176 プレーオフ　ファイナル……
#> # ℹ 41 more variables: season_full_name <chr>, game_date <chr>, game_day <chr>,
#> #   game_start_time <chr>, started_at <chr>, opening_time <chr>, venue <chr>,
#> #   game_icon <int>, venue_address <chr>, venue_others <chr>,
#> #   allow_shoes_on <int>, allow_shoes_on_others <chr>, ticket_info <chr>,
#> #   ticket_url <chr>, event_info <chr>, live_link <chr>, vod_link <chr>,
#> #   bs_url <chr>, cs_url <chr>, ground_url <chr>, other_url <chr>,
#> #   cancel_flg <int>, delay_flg <int>, game_status <chr>, box_flg <int>, …
# }
```
