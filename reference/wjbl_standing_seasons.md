# **Get W League Standing Seasons**

Every season phase (season_id) with its edition name and standings
flags.

Endpoint: `GET https://api.wjbl.01core.app/api/seasons/standings`

## Usage

``` r
wjbl_standing_seasons()
```

## Value

A `wehoop_data` tibble, one row per record; the columns are always
these, in this order (sdv-py `wjbl_standing_seasons`):

|  |  |  |
|----|----|----|
| col_name | type | description |
| season_id | integer | Season-phase id season_id (key space: phases WITHIN a league_id, e.g. 169 = 25-26 regular season Premier, 170 = 25-26 regular season Future, 176 = 25-26 playoff final). Not a year: one league_id has several season_ids. The season_ids parameter of /team-standings and /team-ranking and the season_id of /team/roster. |
| season_full_name | character | Edition name with the sponsor, Japanese, e.g. (Japanese text) (truncated by the API). |
| season | integer | Season END year (2025-26 = 2026, 1999-2000 = 2000) from league_title ('25-26 W League'); null for an all-star game, cup or camp. Read from the start of season_full_name. |
| season_league_name | character | Phase / division label in Japanese: Premier, Future, group stage, second round, lower league; empty for a single-table phase. |
| team_standings_flg | integer | 1 = the phase has a standings grid (/team-standings), 0 = not (cups, all-star games, phases not started). |
| season_tournament_text_flg | integer | 1 = the phase shows a tournament text instead of a table, 0 = not; 0 in every sample. |
| season_tournament_text | character | Tournament text (HTML) for knockout phases; empty in every sample. |

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
[`wjbl_team_box_score()`](https://wehoop.sportsdataverse.org/reference/wjbl_team_box_score.md),
[`wjbl_team_period_stats()`](https://wehoop.sportsdataverse.org/reference/wjbl_team_period_stats.md),
[`wjbl_team_ranking()`](https://wehoop.sportsdataverse.org/reference/wjbl_team_ranking.md),
[`wjbl_team_standings()`](https://wehoop.sportsdataverse.org/reference/wjbl_team_standings.md),
[`wjbl_teams()`](https://wehoop.sportsdataverse.org/reference/wjbl_teams.md)

## Examples

``` r
# \donttest{
  try(wjbl_standing_seasons())
#> ── W League Standing Seasons from api.wjbl.01core.app ────────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-10-18 19:25:51 UTC
#> # A tibble: 89 × 7
#>    season_id season_full_name       season season_league_name team_standings_flg
#>        <int> <chr>                   <int> <chr>                           <int>
#>  1       181 26-27 Wリーグ 大樹生命 Wリーグ …   2027 "グループステージ"                  0
#>  2       179 26-27 Wリーグ レギュラーシーズン……   2027 "プレミア"                          0
#>  3       180 26-27 Wリーグ レギュラーシーズン……   2027 "フューチャー"                      0
#>  4       178 Wリーグオールスター2025-26 in …     NA ""                                  0
#>  5       175 25-26 Wリーグ プレーオフ セミファ…   2026 ""                                  0
#>  6       174 25-26 Wリーグ 入替戦     2026 ""                                  0
#>  7       169 25-26 Wリーグ レギュラーシーズン……   2026 "プレミア"                          1
#>  8       170 25-26 Wリーグ レギュラーシーズン……   2026 "フューチャー"                      1
#>  9       172 25-26 Wリーグ 大樹生命 Wリーグ …   2026 "グループステージ"                  0
#> 10       173 25-26 Wリーグ 大樹生命 Wリーグ …   2026 "ファイナルステージ"……                  0
#> # ℹ 79 more rows
#> # ℹ 2 more variables: season_tournament_text_flg <int>,
#> #   season_tournament_text <chr>
# }
```
