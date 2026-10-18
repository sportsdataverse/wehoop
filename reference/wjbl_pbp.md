# **Get W League Play-by-Play**

Play-by-play of a final game (2018-19 on): one row per play, Japanese
action vocabulary, no shot x/y.

Endpoint: `GET https://api.wjbl.01core.app/api/pbp/play-by-play`

## Usage

``` r
wjbl_pbp(play_schedule_id)
```

## Arguments

- play_schedule_id:

  Game id (play_schedule_id in wjbl_schedule): ONE global sequence
  across every league edition and season, e.g. 7987 (2025-26 playoff
  final game 1), 5533 (2018-19), 4243 (2013-14 final, box score only).
  The game must be final.

## Value

A `wehoop_data` tibble, one row per record; the columns are always
these, in this order (sdv-py `wjbl_pbp`):

|  |  |  |
|----|----|----|
| col_name | type | description |
| play_schedule_id | integer | Game id play_schedule_id (key space: W League games, ONE global sequence across every league_id and season, e.g. 4243 = 2013-14 final, 7987 = 2025-26 final). The play_schedule_id parameter of every game route and of the site's /schedule_result/detail/\*?play_schedule_id= pages. |
| no | integer | Play sequence number, ascending, 1 = first; numbers can skip (deleted plays: 443 numbers for 439 rows on 7987). |
| period | integer | Period: 1-4 = quarters, 5-14 = overtime 1-10 (the site's tab map). Integer. |
| rest_time | character | Game clock REMAINING in the period, 'm:ss' without a leading zero ('9:38'; '10:00' at the start, 5:00 in overtime). |
| seconds_remaining | integer | Seconds remaining in the period, from the 'm:ss' clock string rest_time. |
| team_id | integer | Acting team: franchise id team_id; null on period and game-end lines. |
| team_name | character | Acting team name, Japanese (may contain a full-width space and differ from the box score's spelling); empty on period/game-end lines. |
| team_side | character | Side of the acting team, home or away (from home_away: 1 home, 2 away); null on period and game-end lines. |
| player_number1 | character | Shirt number of the first actor (the player going OUT on a substitution), a string; ” on team and period lines. |
| player_number2 | character | Shirt number of the second actor (the player coming IN on a substitution), a string; ” otherwise. |
| player_name1 | character | Name of the first actor, Japanese; ” on team and period lines. |
| player_name2 | character | Name of the second actor (substitution in), Japanese; ” otherwise. |
| player_id1 | integer | First actor (the player going OUT on a substitution): Player id (key space: W League persons, STABLE across seasons and teams). Joins /boxscore home/away.players\[\].player_id and the player_id of /player (the pi= of the site's /player/detail?pi=). Null on team and period lines. |
| player_id2 | integer | Second actor, filled on substitutions only (the player coming IN; verified 89/89 on game 7987): Player id (key space: W League persons, STABLE across seasons and teams). Joins /boxscore home/away.players\[\].player_id and the player_id of /player (the pi= of the site's /player/detail?pi=). Null otherwise. |
| play_text | character | Display text in Japanese: (Japanese text). Bracketed running counts: shots the player's points so far, assists/steals/blocks/turnovers count so far, rebounds '(o-d-t)' = the player's offensive-defensive-total so far, fouls '(a-b:c)' = a the player's personal fouls, b the team's fouls in the period, c free throws awarded (verified on 7987), substitution A out, B in. Empty on period and game-end lines. |
| score | character | Score 'HOME-AWAY' after the play ('4-3'); filled on scoring plays and period/game-end lines, ” otherwise. |
| home_score | integer | Home points after the play, parsed from score ('HOME-AWAY'); null on plays that carry no score. |
| away_score | integer | Away points after the play, parsed from score ('HOME-AWAY'); null on plays that carry no score. |
| end_period_flg | integer | End-of-period flag (integer); 0 on every observed row, the period end is the (Japanese text) action instead. |
| end_game_flg | integer | End-of-game flag: 1 on the final (Japanese text) line only (the site skips that row), else 0. |
| action1 | character | Action in Japanese (vocabulary of 8 full games, 2018-19 to 2025-26): player in (the starting five at the start of the game), substitution (player_id1 OUT, player_id2 IN), (Japanese text) / 'x' = two-point shot outside the paint made / missed ((Japanese text) inside-the-paint is not in the sample games), (Japanese text) / 'x' = three-point shot made / missed, (Japanese text) / 'x' = free throw made / missed, assist, offensive rebound, defensive rebound, (Japanese text) / team offensive / defensive rebound, steal, blocked shot, turnover, team turnover, personal foul, offensive foul, unsportsmanlike foul, timeout, end of period (quarter or overtime), end of game. o = made, x = missed. |
| action2 | character | Sub-action in Japanese: jump shot (on field-goal attempts), free throws awarded on this foul, N = 0-3; ” otherwise. |
| action3 | character | Second qualifier in Japanese: shooting foul; ” otherwise. |
| home_away | integer | Side of the acting team: 1 = home, 2 = away; null on period/game-end lines. |

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
  try(wjbl_pbp(play_schedule_id = 7987))
#> ── W League Play-by-Play from api.wjbl.01core.app ────────────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-10-18 20:10:57 UTC
#> # A tibble: 439 × 24
#>    play_schedule_id    no period rest_time seconds_remaining team_id team_name  
#>               <int> <int>  <int> <chr>                 <int>   <int> <chr>      
#>  1             7987     1      1 10:00                   600      13 トヨタ自動車　アンテ…
#>  2             7987     2      1 10:00                   600      13 トヨタ自動車　アンテ…
#>  3             7987     3      1 10:00                   600      13 トヨタ自動車　アンテ…
#>  4             7987     4      1 10:00                   600      13 トヨタ自動車　アンテ…
#>  5             7987     5      1 10:00                   600      13 トヨタ自動車　アンテ…
#>  6             7987     6      1 10:00                   600      12 デンソーアイリス……
#>  7             7987     7      1 10:00                   600      12 デンソーアイリス……
#>  8             7987     8      1 10:00                   600      12 デンソーアイリス……
#>  9             7987     9      1 10:00                   600      12 デンソーアイリス……
#> 10             7987    10      1 10:00                   600      12 デンソーアイリス……
#> # ℹ 429 more rows
#> # ℹ 17 more variables: team_side <chr>, player_number1 <chr>,
#> #   player_number2 <chr>, player_name1 <chr>, player_name2 <chr>,
#> #   player_id1 <int>, player_id2 <int>, play_text <chr>, score <chr>,
#> #   home_score <int>, away_score <int>, end_period_flg <int>,
#> #   end_game_flg <int>, action1 <chr>, action2 <chr>, action3 <chr>,
#> #   home_away <int>
# }
```
