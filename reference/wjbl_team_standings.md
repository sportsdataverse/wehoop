# **Get W League Team Standings**

League table of one or more season phases: rank and record of every
team.

Endpoint: `GET https://api.wjbl.01core.app/api/team-standings`

## Usage

``` r
wjbl_team_standings(season_ids)
```

## Arguments

- season_ids:

  Season phase id or ids (season_id in wjbl_standing_seasons; a phase
  inside a league edition, not a year): an integer, a list or a comma
  string such as '169,170' (2025-26 regular season Premier and Future
  divisions).

## Value

A `wehoop_data` tibble, one row per record; the columns are always
these, in this order (sdv-py `wjbl_team_standings`):

|  |  |  |
|----|----|----|
| col_name | type | description |
| season_id | integer | Season-phase id season_id (key space: phases WITHIN a league_id, e.g. 169 = 25-26 regular season Premier, 170 = 25-26 regular season Future, 176 = 25-26 playoff final). Not a year: one league_id has several season_ids. The season_ids parameter of /team-standings and /team-ranking and the season_id of /team/roster. |
| season_title | character | Phase title in Japanese: regular season, (Japanese text) / playoff final, playoff semifinal (the separator varies by era). |
| league_name | character | Division name, Japanese (Premier). |
| season_league_name | character | Phase / division label in Japanese: Premier, Future, group stage, second round, lower league; empty for a single-table phase. |
| season_league_flg | integer | Division layout flag: 1 = one table per division (Premier / Future), 2 = split by season_team_area (East / West, by the site's JS), 0 = cup / group stage. |
| update_date | character | As-of date in Japanese, (Japanese text). |
| team_id | integer | Franchise id team_id (key space: W League franchises, STABLE across seasons and sponsor renames: 13 = Toyota Antelopes, 12 = Denso Iris, 8 = ENEOS Sunflowers; all-star sides have their own ids, e.g. 591). The team_id of /team/roster and of the site's /team/roster/?team_id=. Not season_team_id. |
| season_team_name | character | Team name as registered for the season, in Japanese (company + nickname: Toyota Antelopes). |
| season_team_short_name | character | Short team name for that season, Japanese (Toyota). |
| team_entry_flg | integer | Official-league participant flag: 1 = a W League member team (the site links its roster), 0 = not (guest or all-star side). Integer. |
| position | integer | Rank of the team in the phase (a string on the wire, equal to the map key). |
| season_team_area | character | Unobserved: null in every sample, so no type and no meaning is claimed. (By the site's standings JS: 0 = East, 1 = West conference when season_league_flg = 2.) |
| win_lost | character | Record in Japanese, (Japanese text) (23 wins, 5 losses). |
| wins | integer | Wins in the record, parsed from win_lost (23 wins). |
| losses | integer | Losses in the record, parsed from win_lost (5 losses). |

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
[`wjbl_schedule()`](https://wehoop.sportsdataverse.org/reference/wjbl_schedule.md),
[`wjbl_staff()`](https://wehoop.sportsdataverse.org/reference/wjbl_staff.md),
[`wjbl_standing_seasons()`](https://wehoop.sportsdataverse.org/reference/wjbl_standing_seasons.md),
[`wjbl_team_box_score()`](https://wehoop.sportsdataverse.org/reference/wjbl_team_box_score.md),
[`wjbl_team_period_stats()`](https://wehoop.sportsdataverse.org/reference/wjbl_team_period_stats.md),
[`wjbl_team_ranking()`](https://wehoop.sportsdataverse.org/reference/wjbl_team_ranking.md),
[`wjbl_teams()`](https://wehoop.sportsdataverse.org/reference/wjbl_teams.md)

## Examples

``` r
# \donttest{
  try(wjbl_team_standings(season_ids = "169"))
#> ── W League Team Standings from api.wjbl.01core.app ──────────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-10-18 19:25:55 UTC
#> # A tibble: 8 × 15
#>   season_id season_title       league_name season_league_name season_league_flg
#>       <int> <chr>              <chr>       <chr>                          <int>
#> 1       169 レギュラーシーズン プレミア    プレミア                           1
#> 2       169 レギュラーシーズン プレミア    プレミア                           1
#> 3       169 レギュラーシーズン プレミア    プレミア                           1
#> 4       169 レギュラーシーズン プレミア    プレミア                           1
#> 5       169 レギュラーシーズン プレミア    プレミア                           1
#> 6       169 レギュラーシーズン プレミア    プレミア                           1
#> 7       169 レギュラーシーズン プレミア    プレミア                           1
#> 8       169 レギュラーシーズン プレミア    プレミア                           1
#> # ℹ 10 more variables: update_date <chr>, team_id <int>,
#> #   season_team_name <chr>, season_team_short_name <chr>, team_entry_flg <int>,
#> #   position <int>, season_team_area <chr>, win_lost <chr>, wins <int>,
#> #   losses <int>
# }
```
