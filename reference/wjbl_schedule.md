# **Get W League Schedule**

Games of a season in ONE month (default: the season's latest month) with
teams, venue, status and score.

Endpoint: `GET https://api.wjbl.01core.app/api/play-schedules`

## Usage

``` r
wjbl_schedule(season, game_month = NULL, team_id = NULL)
```

## Arguments

- season:

  Season END year (2026 = 2025-26, 2000 = 1999-2000); the wrapper maps
  it to the league edition id (league_id) with the live league list
  (wjbl_leagues, one extra cached request).

- game_month:

  Month to list, 'YYYY-MM' (see wjbl_game_months). Omitted = the
  season's latest month only, NOT the whole season: the API pages by
  month.

- team_id:

  Franchise id (team_id in wjbl_teams): stable across seasons and
  sponsor renames, e.g. 13 (Toyota Antelopes). Narrows the month to that
  team's games.

## Value

A `wehoop_data` tibble, one row per record; the columns are always
these, in this order (sdv-py `wjbl_schedule`):

|  |  |  |
|----|----|----|
| col_name | type | description |
| league_id | integer | The league_id asked for (integer): Competition-edition id league_id (key space: W League competitions; sequential, ONE id per season of the league AND per all-star game, cup or camp: 45 = '25-26 W League', 47 = '26-27', 20 = '13-14', 46 = All-Star 2025-26). The league_id parameter of /play-schedules and /play-schedule-months; enumerate with /leagues. The sdv season is the END year of league_title (END = 2000 + the second YY: '25-26' -\> 2026, '99-00' -\> 2000). |
| league_title | character | Competition-edition title in Japanese: '25-26 W League' = 2025-26 W League (sdv END year 2026; END = 2000 + the second YY: '25-26' -\> 2026, '99-00' -\> 2000); also All-Star game, Autumn Cup, Summer Camp, 'W League SUPERGAMES'. |
| season | integer | Season END year (2025-26 = 2026, 1999-2000 = 2000) from league_title ('25-26 W League'); null for an all-star game, cup or camp. |
| season_id | integer | Season-phase id season_id (key space: phases WITHIN a league_id, e.g. 169 = 25-26 regular season Premier, 170 = 25-26 regular season Future, 176 = 25-26 playoff final). Not a year: one league_id has several season_ids. The season_ids parameter of /team-standings and /team-ranking and the season_id of /team/roster. |
| season_title | character | Phase title in Japanese: regular season, (Japanese text) / playoff final, playoff semifinal (the separator varies by era). |
| season_full_name | character | league_title + phase (+ division) in Japanese: 2025-26 regular season, Premier division (Future division, from 2024-25). |
| play_schedule_id | integer | Game id play_schedule_id (key space: W League games, ONE global sequence across every league_id and season, e.g. 4243 = 2013-14 final, 7987 = 2025-26 final). The play_schedule_id parameter of every game route and of the site's /schedule_result/detail/\*?play_schedule_id= pages. |
| game_year | integer | Calendar year of the game, 'YYYY' string (not the season); parsed to an integer. |
| game_date | character | Game day 'MM.DD' ('04.04'); with game_year it is the date, Japan time. |
| game_day | character | Game day 'MM.DD' ('04.04'); with game_year it is the date, Japan time. |
| game_date_week_day_name | character | Weekday in Japanese, one character: (Japanese) Mon, (Japanese) Tue, (Japanese) Wed, (Japanese) Thu, (Japanese) Fri, (Japanese) Sat, (Japanese) Sun. |
| game_start_time | character | Scheduled tip-off 'HH:MM', Japan time (JST, UTC+9). |
| started_at | character | Actual tip-off 'HH:MM', JST, as recorded ('15:01'); junk on 2013-14 games ('05:06' for a 19:00 game, and it CHANGES between requests: 05:06 / 05:16 / 05:25 for game 4243), so ignore it there. |
| opening_time | character | Doors-open time 'HH:MM', JST; empty when not published. |
| venue | character | Arena name, Japanese. |
| venue_address | character | Arena postal address, Japanese. |
| game_icon | integer | Icon code shown next to the game: 0 = none, 1 = home-game icon (home.svg), 2 = neutral-site icon (neutral.svg). |
| ticket_url | character | Ticket sale URL; empty string in every sample. |
| vod_link | character | Video-on-demand URL (Basketball LIVE / W-TV); empty when none. |
| live_link | character | Live-stream URL; empty when none. |
| game_status | character | Game state: 'fixed' = final (confirmed result), 'scheduled' = not played yet (seen on 26-27 games); the site's JS also handles 'live', 'canceled' and 'delayed'. The capture banks only 'fixed' games. |
| box_flg | integer | Box-score flag (integer). 1 on every sampled game, scheduled ones included, so it does NOT prove a box score exists. |
| pbp_flg | integer | Play-by-play flag: 1 = /pbp/\* routes have data (2018-19 onward), 0 = not (they answer \[\]). |
| cancel_flg | integer | Cancelled flag: 1 = cancelled, 0 = not. |
| delay_flg | integer | Postponed flag: 1 = postponed, 0 = not. |
| ot_flg | integer | Overtime flag: 1 = the game went to overtime, 0 = not. |
| home_team_id | integer | Home team: Franchise id team_id (key space: W League franchises, STABLE across seasons and sponsor renames: 13 = Toyota Antelopes, 12 = Denso Iris, 8 = ENEOS Sunflowers; all-star sides have their own ids, e.g. 591). The team_id of /team/roster and of the site's /team/roster/?team_id=. Not season_team_id. |
| home_season_team_name | character | Home team name: Team name as registered for the season, in Japanese (company + nickname: Toyota Antelopes). |
| home_season_team_short_name | character | Home team short name: Short team name for that season, Japanese (Toyota). |
| home_team_logo_image | character | Home team logo: Team logo path, relative to https://www.wjbl.org ('/static/images/base_team/...png' or '/assets/img/team/...png'). |
| home_team_free_text | character | Free-text team label used when the slot has no team (e.g. 'winner of game X'); empty string in every sample. |
| home_team_score | integer | Home final points (integer). Every sampled game is finished, so null is not in the type; unplayed games (2026-27 'scheduled') carry null. |
| home_team_entry_flg | integer | Official-league participant flag: 1 = a W League member team (the site links its roster), 0 = not (guest or all-star side). Integer. |
| away_team_id | integer | Away team: Franchise id team_id (key space: W League franchises, STABLE across seasons and sponsor renames: 13 = Toyota Antelopes, 12 = Denso Iris, 8 = ENEOS Sunflowers; all-star sides have their own ids, e.g. 591). The team_id of /team/roster and of the site's /team/roster/?team_id=. Not season_team_id. |
| away_season_team_name | character | Away team name: Team name as registered for the season, in Japanese (company + nickname: Toyota Antelopes). |
| away_season_team_short_name | character | Away team short name: Short team name for that season, Japanese (Toyota). |
| away_team_logo_image | character | Away team logo: Team logo path, relative to https://www.wjbl.org ('/static/images/base_team/...png' or '/assets/img/team/...png'). |
| away_team_free_text | character | Free-text team label used when the slot has no team (e.g. 'winner of game X'); empty string in every sample. |
| away_team_score | integer | Away final points (integer). Null on unplayed games, as for home_team_score (not in the finished samples). |
| away_team_entry_flg | integer | Official-league participant flag: 1 = a W League member team (the site links its roster), 0 = not (guest or all-star side). Integer. |

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
[`wjbl_game_months()`](https://wehoop.sportsdataverse.org/reference/wjbl_game_months.md),
[`wjbl_head_to_head()`](https://wehoop.sportsdataverse.org/reference/wjbl_head_to_head.md),
[`wjbl_leagues()`](https://wehoop.sportsdataverse.org/reference/wjbl_leagues.md),
[`wjbl_pbp()`](https://wehoop.sportsdataverse.org/reference/wjbl_pbp.md),
[`wjbl_period_scores()`](https://wehoop.sportsdataverse.org/reference/wjbl_period_scores.md),
[`wjbl_player()`](https://wehoop.sportsdataverse.org/reference/wjbl_player.md),
[`wjbl_player_period_leaders()`](https://wehoop.sportsdataverse.org/reference/wjbl_player_period_leaders.md),
[`wjbl_roster()`](https://wehoop.sportsdataverse.org/reference/wjbl_roster.md),
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
  try(wjbl_schedule(game_month = "2026-04", season = 2026))
#> ── W League Schedule from api.wjbl.01core.app ────────────────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-10-18 20:10:58 UTC
#> # A tibble: 4 × 40
#>   league_id league_title  season season_id season_title         season_full_name
#>       <int> <chr>          <int>     <int> <chr>                <chr>           
#> 1        45 25-26 Wリーグ   2026       176 プレーオフ　ファイナル…… 25-26 Wリーグ プレーオ…
#> 2        45 25-26 Wリーグ   2026       176 プレーオフ　ファイナル…… 25-26 Wリーグ プレーオ…
#> 3        45 25-26 Wリーグ   2026       176 プレーオフ　ファイナル…… 25-26 Wリーグ プレーオ…
#> 4        45 25-26 Wリーグ   2026       176 プレーオフ　ファイナル…… 25-26 Wリーグ プレーオ…
#> # ℹ 34 more variables: play_schedule_id <int>, game_year <int>,
#> #   game_date <chr>, game_day <chr>, game_date_week_day_name <chr>,
#> #   game_start_time <chr>, started_at <chr>, opening_time <chr>, venue <chr>,
#> #   venue_address <chr>, game_icon <int>, ticket_url <chr>, vod_link <chr>,
#> #   live_link <chr>, game_status <chr>, box_flg <int>, pbp_flg <int>,
#> #   cancel_flg <int>, delay_flg <int>, ot_flg <int>, home_team_id <int>,
#> #   home_season_team_name <chr>, home_season_team_short_name <chr>, …
# }
```
