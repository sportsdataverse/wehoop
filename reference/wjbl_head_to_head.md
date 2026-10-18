# **Get W League Head-to-Head**

Head-to-head results grid (hoshitori-hyo) of one or more season phases:
one row per game played.

Endpoint: `GET https://api.wjbl.01core.app/api/team-standings`

## Usage

``` r
wjbl_head_to_head(season_ids)
```

## Arguments

- season_ids:

  Season phase id or ids (season_id in wjbl_standing_seasons; a phase
  inside a league edition, not a year): an integer, a list or a comma
  string such as '169,170' (2025-26 regular season Premier and Future
  divisions).

## Value

A `wehoop_data` tibble, one row per record; the columns are always
these, in this order (sdv-py `wjbl_head_to_head`):

|  |  |  |
|----|----|----|
| col_name | type | description |
| season_id | integer | Season phase id of the grid, e.g. 169 (2025-26 regular season, Premier division). |
| team_id | integer | Franchise id team_id of the ROW team (the team whose points are win). |
| opponent_team_id | integer | Franchise id team_id of the opponent in that game. |
| game_number | integer | 1-based order of the game within the pair of teams in the grid (the wire list has no number). |
| win | integer | The ROW team's points in that game (a string on the wire, whatever the result; 56 on a loss). |
| losg | integer | The OPPONENT's points in that game (a string on the wire; the wire key is spelled losg). |
| result | character | 'o 63-56' = row team won, 'x 56-63' = lost (row team's points first); 'o 20-0' is a forfeit win (FIBA forfeit score). |

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
  try(wjbl_head_to_head(season_ids = "169"))
#> ── W League Head-to-Head from api.wjbl.01core.app ───────── wehoop 3.0.0.9000 ──
#> ℹ Data updated: 2026-10-18 14:08:16 UTC
#> # A tibble: 224 × 7
#>    season_id team_id opponent_team_id game_number   win  losg result 
#>        <int>   <int>            <int>       <int> <int> <int> <chr>  
#>  1       169      13               12           1    63    56 ○ 63-56
#>  2       169      13               12           2    66    67 ● 66-67
#>  3       169      13               12           3    46    60 ● 46-60
#>  4       169      13               12           4    76    58 ○ 76-58
#>  5       169      13               30           1    20     0 ○ 20-0 
#>  6       169      13               30           2    20     0 ○ 20-0 
#>  7       169      13               30           3    69    64 ○ 69-64
#>  8       169      13               30           4    75    68 ○ 75-68
#>  9       169      13               31           1    68    46 ○ 68-46
#> 10       169      13               31           2    63    75 ● 63-75
#> # ℹ 214 more rows
# }
```
