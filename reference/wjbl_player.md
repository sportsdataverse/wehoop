# **Get W League Player**

Player profile: current team, names, bio and career notes, one row.

Endpoint: `GET https://api.wjbl.01core.app/api/player`

## Usage

``` r
wjbl_player(player_id)
```

## Arguments

- player_id:

  Player id (player_id in wjbl_box_score or wjbl_roster): the person,
  stable across seasons, e.g. 9799.

## Value

A `wehoop_data` tibble, one row per record; the columns are always
these, in this order (sdv-py `wjbl_player`):

|  |  |  |
|----|----|----|
| col_name | type | description |
| player_id | integer | Player id player_id (key space: W League persons, STABLE across seasons and teams). The player_id of /player and the pi= of the site's /player/detail?pi=; joins the play-by-play player_id1 / player_id2. |
| player_name | character | Name in Japanese, 'SURNAME GIVEN'. |
| player_name_en | character | Name in romaji, uppercase, 'SURNAME GIVEN' ('OKAMOTO MIYUU'). |
| player_furigana | character | Name reading in hiragana ((Japanese text)). |
| team_id | integer | Current (or last) team: Franchise id team_id (key space: W League franchises, STABLE across seasons and sponsor renames: 13 = Toyota Antelopes, 12 = Denso Iris, 8 = ENEOS Sunflowers; all-star sides have their own ids, e.g. 591). The team_id of /team/roster and of the site's /team/roster/?team_id=. Not season_team_id. |
| season_team_name | character | Team name as registered for the season, in Japanese (company + nickname: Toyota Antelopes). |
| season_team_short_name | character | Short team name for that season, Japanese (Toyota). |
| season_team_player_number | character | Shirt number this season, a string. |
| team_logo_image | character | Team logo path, relative to https://www.wjbl.org ('/static/images/base_team/...png' or '/assets/img/team/...png'). |
| team_url | character | Team's own website URL. |
| player_birthday | character | Date of birth 'YYYY/MM/DD' (public player bio). |
| player_nickname | character | Nickname, Japanese. |
| player_position | character | Playing position code ('PG', 'SG', 'SF', 'PF', 'C'). |
| player_home_town | character | Home prefecture, Japanese (Hokkaido). |
| player_height | character | Height with unit, a string ('179cm'). |
| player_weight | character | Weight with unit, a string ('77kg'). |
| player_height_cm | integer | Height in whole centimetres, parsed from player_height ('179cm'). |
| player_weight_kg | integer | Weight in whole kilograms, parsed from player_weight ('77kg'). |
| player_affiliation_history | character | Career path, Japanese, (Japanese text)-separated (mini-basketball club (Japanese) junior high (Japanese) high school (Japanese) university (Japanese) team). |
| player_independent_flg | integer | Retired flag (the site greys the team and hides the number): 1 = retired / no longer registered, 0 = active. |
| player_national_team | character | National-team history, Japanese free text (Universiade). |
| player_awards | character | Awards and honours, Japanese free text. |
| player_coach_history | character | Coaching history (for players who became coaches); empty string in the sample. |
| player_coach_record | character | Coaching record; empty string in the sample. |
| player_picture | character | Photo path relative to https://www.wjbl.org. |
| player_wjbl_flg | integer | 1 = a W League player (0 presumably for others; unverified). |
| player_rookie | integer | Rookie ((Japanese) icon): 1 = yes, 0 = no. |
| player_early_entry | integer | Early-entry player ((Japanese), a student who joined before graduating): 1 = yes, 0 = no. |
| player_foreign_national_flg | integer | Foreign national ((Japanese) icon): 1 = yes, 0 = no. |
| player_naturalized_flg | integer | Naturalised player ((Japanese) icon): 1 = yes, 0 = no. |
| player_appeal | character | Self-introduction text; empty string in the sample. |
| player_championships | character | Championships text; empty string in the sample. |
| player_url | character | Personal website URL; empty string in the sample. |
| player_facebook_url | character | Facebook URL; empty string in the sample. |
| player_twitter_url | character | X (Twitter) URL; empty string in the sample. |
| player_instagram_url | character | Instagram URL; empty string in the sample. |

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
  try(wjbl_player(player_id = 9799))
#> ── W League Player from api.wjbl.01core.app ─────────────── wehoop 3.0.0.9000 ──
#> ℹ Data updated: 2026-10-18 14:08:23 UTC
#> # A tibble: 1 × 36
#>   player_id player_name player_name_en player_furigana team_id season_team_name 
#>       <int> <chr>       <chr>          <chr>             <int> <chr>            
#> 1      9799 岡本 美優   OKAMOTO MIYUU  おかもと みゆう      13 トヨタ自動車 アンテロープス……
#> # ℹ 30 more variables: season_team_short_name <chr>,
#> #   season_team_player_number <chr>, team_logo_image <chr>, team_url <chr>,
#> #   player_birthday <chr>, player_nickname <chr>, player_position <chr>,
#> #   player_home_town <chr>, player_height <chr>, player_weight <chr>,
#> #   player_height_cm <int>, player_weight_kg <int>,
#> #   player_affiliation_history <chr>, player_independent_flg <int>,
#> #   player_national_team <chr>, player_awards <chr>, …
# }
```
