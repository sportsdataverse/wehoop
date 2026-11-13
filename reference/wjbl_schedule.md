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
these, in this order (sportsdataverse-py `wjbl_schedule`):

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

Source, terms of use, request pacing, seasons, ids, coverage and error
classes of this family: see the notes in
[`wjbl_leagues()`](https://wehoop.sportsdataverse.org/reference/wjbl_leagues.md).

## See also

[family_wjbl](https://wehoop.sportsdataverse.org/reference/family_wjbl.md)
lists every function in this family.

## Examples

``` r
# \donttest{
  try(wjbl_schedule(game_month = "2026-04", season = 2026))
#> ── W League Schedule from api.wjbl.01core.app ────────────────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-13 14:00:31 UTC
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
