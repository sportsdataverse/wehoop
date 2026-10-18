# wjbl.R -- W League (Women's Japan Basketball League) wrappers over api.wjbl.01core.app, at parity with
# sdv-py sportsdataverse/basketball/wjbl (origin/main e3d232ebc9). Transport, season mapping and refusals:
# R/wjbl_runtime.R; frames and columns: R/wjbl_parsers.R. Generated once from sdv-py's endpoint YAML and
# manual_column_descriptions.yaml (Japanese folded out: roxygen stays ASCII), then maintained by hand.

#' @title
#' **Get W League Leagues**
#' @description
#' Every competition edition (league_id): the W League seasons back to 1999-2000, all-star games, cups and camps.
#'
#' Endpoint: `GET https://api.wjbl.01core.app/api/leagues`
#' @return
#' A `wehoop_data` tibble, one row per record; the columns are always these, in this order
#'   (sdv-py `wjbl_leagues`):
#'
#' | col_name | type | description |
#' |:---|:---|:---|
#' | league_id | integer | Competition-edition id league_id (key space: W League competitions; sequential, ONE id per season of the league AND per all-star game, cup or camp: 45 = '25-26 W League', 47 = '26-27', 20 = '13-14', 46 = All-Star 2025-26). The league_id parameter of /play-schedules and /play-schedule-months; enumerate with /leagues. The sdv season is the END year of league_title (END = 2000 + the second YY: '25-26' -> 2026, '99-00' -> 2000). |
#' | league_title | character | Competition-edition title in Japanese: '25-26 W League' = 2025-26 W League (sdv END year 2026; END = 2000 + the second YY: '25-26' -> 2026, '99-00' -> 2000); also All-Star game, Autumn Cup, Summer Camp, 'W League SUPERGAMES'. |
#' | season | integer | Season END year (2025-26 = 2026, 1999-2000 = 2000) from league_title ('25-26 W League'); null for an all-star game, cup or camp. |
#' @details
#' * Unofficial and unsupported: these wrappers read the JSON backend of www.wjbl.org (api.wjbl.01core.app),
#'   keyless, found in the site's own JavaScript. The site's terms of use (www.wjbl.org/kiyaku/) forbid
#'   reproducing, republishing or otherwise using site content without permission: a copyright clause, not an
#'   anti-scraping one. The wrappers fetch on the user's behalf; a published data release or a hosted mirror needs
#'   the owner's decision first. The site has no robots.txt (404, checked 2026-10-12), so no Crawl-delay is
#'   published; the runtime waits at least 1 s before every request, retries included. Payloads are not
#'   redistributed as release assets.
#' * Women's league: the W League is Japan's top women's basketball league (the SportsDataverse R counterpart is
#'   wehoop). All text is Japanese (team names, phases, play-by-play actions); the column descriptions translate
#'   the vocabulary.
#' * Seasons are END years (2026 = 2025-26, 2000 = 1999-2000). The API keys a season edition by an opaque league_id
#'   (45 = '25-26 W League'; every all-star game, cup and camp has one too) and the wrappers map the END year with
#'   the live league list (one extra, cached request; END = 2000 + the second YY of league_title). Phases inside an
#'   edition (season_id: 169 = regular season Premier, 170 = Future, 176 = playoff final; two divisions from
#'   2024-25) are native ids, passed as given: wjbl_standing_seasons lists them with their END year.
#' * The schedule is paged by month: wjbl_schedule answers ONE month (game_month, YYYY-MM; omitted = the season's
#'   latest month only). List the months with wjbl_game_months and loop. The game routes take only the global
#'   play_schedule_id and serve final games only: each makes one extra, cached request (the game header) to prove
#'   the game is final and that the answer is the game and the teams asked for.
#' * Errors are HTTP 200: an unknown id answers \[\] (wehoop_no_data) and a missing or non-numeric parameter
#'   answers an error envelope (wehoop_asset_fetch). Coverage: schedules from 1999-2000, box scores from 2013-14,
#'   play-by-play and the period stats from 2018-19 (earlier games answer \[\] on the /pbp routes: wehoop_no_data).
#'   No route carries shot coordinates.
#' * Personal data: the organiser's contact details (phones, e-mail) and the player's blood type are never output,
#'   and phone numbers and e-mail addresses inside free text are replaced by \[redacted-phone\] /
#'   \[redacted-email\]. Do not add them back. Player bio fields and referee names are public and stay.
#' * Errors are classed conditions, all inheriting `wehoop_error`: `wehoop_no_data` (HTTP 404 or the API has
#'   nothing for the request: an empty list, an id it does not know, a game without play-by-play before 2018-19, a
#'   season without months or games), `wehoop_bad_request` (a season that is not the END year of a W League
#'   edition, an id that is not an integer or a game_month that is not YYYY-MM, raised before the request, or the
#'   API's HTTP 400 / 422) and `wehoop_asset_fetch` (any other failure: an error envelope at HTTP 200, any other
#'   non-2xx, an empty or non-JSON body, a game that is not final, a truncated play-by-play, or a body for another
#'   game, league edition, month, team, season phase or player than the one asked for; `transient` is TRUE for 408
#'   / 429 / 5xx and transport failures). HTTP 500 is retried. Wrappers raise; they never warn and return an empty
#'   frame.
#' @examples
#' \donttest{
#'   try(wjbl_leagues())
#' }
#' @export
#' @family WJBL Functions
wjbl_leagues <- function() {
  withr::local_options(list(scipen = 999, stringsAsFactors = FALSE))
  raw <- .wjbl_get("/leagues", list(target = "play_schedule"), call = rlang::current_env())
  .wjbl_out(.wjbl_parse_leagues(raw), "W League Leagues from api.wjbl.01core.app")
}

#' @title
#' **Get W League Game Months**
#' @description
#' Months (YYYY-MM) that have games in a season, newest first; each is one page of wjbl_schedule.
#'
#' Endpoint: `GET https://api.wjbl.01core.app/api/play-schedule-months`
#' @param season Season END year (2026 = 2025-26, 2000 = 1999-2000); the wrapper maps it to the league edition id
#'   (league_id) with the live league list (wjbl_leagues, one extra cached request).
#' @return
#' A `wehoop_data` tibble, one row per record; the columns are always these, in this order
#'   (sdv-py `wjbl_game_months`):
#'
#' | col_name | type | description |
#' |:---|:---|:---|
#' | league_id | integer | Competition edition id league_id, cast to an integer (the API echoes a string here and an integer elsewhere). |
#' | season | integer | Season END year of the request (2026 = 2025-26); the body itself does not carry it. |
#' | game_month | character | Month 'YYYY-MM': the game_month parameter of /play-schedules. |
#' | game_month_jpn | character | The month in Japanese, (Japanese text) (April 2026). |
#' @inherit wjbl_leagues details
#' @examples
#' \donttest{
#'   try(wjbl_game_months(season = 2026))
#' }
#' @export
#' @family WJBL Functions
wjbl_game_months <- function(season) {
  withr::local_options(list(scipen = 999, stringsAsFactors = FALSE))
  raw <- .wjbl_get("/play-schedule-months", list(season = season), call = rlang::current_env())
  .wjbl_out(.wjbl_parse_game_months(raw), "W League Game Months from api.wjbl.01core.app")
}

#' @title
#' **Get W League Schedule**
#' @description
#' Games of a season in ONE month (default: the season's latest month) with teams, venue, status and score.
#'
#' Endpoint: `GET https://api.wjbl.01core.app/api/play-schedules`
#' @param season Season END year (2026 = 2025-26, 2000 = 1999-2000); the wrapper maps it to the league edition id
#'   (league_id) with the live league list (wjbl_leagues, one extra cached request).
#' @param game_month Month to list, 'YYYY-MM' (see wjbl_game_months). Omitted = the season's latest month only, NOT
#'   the whole season: the API pages by month.
#' @param team_id Franchise id (team_id in wjbl_teams): stable across seasons and sponsor renames, e.g. 13 (Toyota
#'   Antelopes). Narrows the month to that team's games.
#' @return
#' A `wehoop_data` tibble, one row per record; the columns are always these, in this order
#'   (sdv-py `wjbl_schedule`):
#'
#' | col_name | type | description |
#' |:---|:---|:---|
#' | league_id | integer | The league_id asked for (integer): Competition-edition id league_id (key space: W League competitions; sequential, ONE id per season of the league AND per all-star game, cup or camp: 45 = '25-26 W League', 47 = '26-27', 20 = '13-14', 46 = All-Star 2025-26). The league_id parameter of /play-schedules and /play-schedule-months; enumerate with /leagues. The sdv season is the END year of league_title (END = 2000 + the second YY: '25-26' -> 2026, '99-00' -> 2000). |
#' | league_title | character | Competition-edition title in Japanese: '25-26 W League' = 2025-26 W League (sdv END year 2026; END = 2000 + the second YY: '25-26' -> 2026, '99-00' -> 2000); also All-Star game, Autumn Cup, Summer Camp, 'W League SUPERGAMES'. |
#' | season | integer | Season END year (2025-26 = 2026, 1999-2000 = 2000) from league_title ('25-26 W League'); null for an all-star game, cup or camp. |
#' | season_id | integer | Season-phase id season_id (key space: phases WITHIN a league_id, e.g. 169 = 25-26 regular season Premier, 170 = 25-26 regular season Future, 176 = 25-26 playoff final). Not a year: one league_id has several season_ids. The season_ids parameter of /team-standings and /team-ranking and the season_id of /team/roster. |
#' | season_title | character | Phase title in Japanese: regular season, (Japanese text) / playoff final, playoff semifinal (the separator varies by era). |
#' | season_full_name | character | league_title + phase (+ division) in Japanese: 2025-26 regular season, Premier division (Future division, from 2024-25). |
#' | play_schedule_id | integer | Game id play_schedule_id (key space: W League games, ONE global sequence across every league_id and season, e.g. 4243 = 2013-14 final, 7987 = 2025-26 final). The play_schedule_id parameter of every game route and of the site's /schedule_result/detail/*?play_schedule_id= pages. |
#' | game_year | integer | Calendar year of the game, 'YYYY' string (not the season); parsed to an integer. |
#' | game_date | character | Game day 'MM.DD' ('04.04'); with game_year it is the date, Japan time. |
#' | game_day | character | Game day 'MM.DD' ('04.04'); with game_year it is the date, Japan time. |
#' | game_date_week_day_name | character | Weekday in Japanese, one character: (Japanese) Mon, (Japanese) Tue, (Japanese) Wed, (Japanese) Thu, (Japanese) Fri, (Japanese) Sat, (Japanese) Sun. |
#' | game_start_time | character | Scheduled tip-off 'HH:MM', Japan time (JST, UTC+9). |
#' | started_at | character | Actual tip-off 'HH:MM', JST, as recorded ('15:01'); junk on 2013-14 games ('05:06' for a 19:00 game, and it CHANGES between requests: 05:06 / 05:16 / 05:25 for game 4243), so ignore it there. |
#' | opening_time | character | Doors-open time 'HH:MM', JST; empty when not published. |
#' | venue | character | Arena name, Japanese. |
#' | venue_address | character | Arena postal address, Japanese. |
#' | game_icon | integer | Icon code shown next to the game: 0 = none, 1 = home-game icon (home.svg), 2 = neutral-site icon (neutral.svg). |
#' | ticket_url | character | Ticket sale URL; empty string in every sample. |
#' | vod_link | character | Video-on-demand URL (Basketball LIVE / W-TV); empty when none. |
#' | live_link | character | Live-stream URL; empty when none. |
#' | game_status | character | Game state: 'fixed' = final (confirmed result), 'scheduled' = not played yet (seen on 26-27 games); the site's JS also handles 'live', 'canceled' and 'delayed'. The capture banks only 'fixed' games. |
#' | box_flg | integer | Box-score flag (integer). 1 on every sampled game, scheduled ones included, so it does NOT prove a box score exists. |
#' | pbp_flg | integer | Play-by-play flag: 1 = /pbp/* routes have data (2018-19 onward), 0 = not (they answer \[\]). |
#' | cancel_flg | integer | Cancelled flag: 1 = cancelled, 0 = not. |
#' | delay_flg | integer | Postponed flag: 1 = postponed, 0 = not. |
#' | ot_flg | integer | Overtime flag: 1 = the game went to overtime, 0 = not. |
#' | home_team_id | integer | Home team: Franchise id team_id (key space: W League franchises, STABLE across seasons and sponsor renames: 13 = Toyota Antelopes, 12 = Denso Iris, 8 = ENEOS Sunflowers; all-star sides have their own ids, e.g. 591). The team_id of /team/roster and of the site's /team/roster/?team_id=. Not season_team_id. |
#' | home_season_team_name | character | Home team name: Team name as registered for the season, in Japanese (company + nickname: Toyota Antelopes). |
#' | home_season_team_short_name | character | Home team short name: Short team name for that season, Japanese (Toyota). |
#' | home_team_logo_image | character | Home team logo: Team logo path, relative to https://www.wjbl.org ('/static/images/base_team/...png' or '/assets/img/team/...png'). |
#' | home_team_free_text | character | Free-text team label used when the slot has no team (e.g. 'winner of game X'); empty string in every sample. |
#' | home_team_score | integer | Home final points (integer). Every sampled game is finished, so null is not in the type; unplayed games (2026-27 'scheduled') carry null. |
#' | home_team_entry_flg | integer | Official-league participant flag: 1 = a W League member team (the site links its roster), 0 = not (guest or all-star side). Integer. |
#' | away_team_id | integer | Away team: Franchise id team_id (key space: W League franchises, STABLE across seasons and sponsor renames: 13 = Toyota Antelopes, 12 = Denso Iris, 8 = ENEOS Sunflowers; all-star sides have their own ids, e.g. 591). The team_id of /team/roster and of the site's /team/roster/?team_id=. Not season_team_id. |
#' | away_season_team_name | character | Away team name: Team name as registered for the season, in Japanese (company + nickname: Toyota Antelopes). |
#' | away_season_team_short_name | character | Away team short name: Short team name for that season, Japanese (Toyota). |
#' | away_team_logo_image | character | Away team logo: Team logo path, relative to https://www.wjbl.org ('/static/images/base_team/...png' or '/assets/img/team/...png'). |
#' | away_team_free_text | character | Free-text team label used when the slot has no team (e.g. 'winner of game X'); empty string in every sample. |
#' | away_team_score | integer | Away final points (integer). Null on unplayed games, as for home_team_score (not in the finished samples). |
#' | away_team_entry_flg | integer | Official-league participant flag: 1 = a W League member team (the site links its roster), 0 = not (guest or all-star side). Integer. |
#' @inherit wjbl_leagues details
#' @examples
#' \donttest{
#'   try(wjbl_schedule(game_month = "2026-04", season = 2026))
#' }
#' @export
#' @family WJBL Functions
wjbl_schedule <- function(season, game_month = NULL, team_id = NULL) {
  withr::local_options(list(scipen = 999, stringsAsFactors = FALSE))
  raw <- .wjbl_get("/play-schedules", list(season = season, game_month = game_month, team_id = team_id), call = rlang::current_env())
  .wjbl_out(.wjbl_parse_schedule(raw), "W League Schedule from api.wjbl.01core.app")
}

#' @title
#' **Get W League Game**
#' @description
#' Game header of a final game: both teams, the result flag and the score by period, one row.
#'
#' Endpoint: `GET https://api.wjbl.01core.app/api/play-schedule/detail`
#' @param play_schedule_id Game id (play_schedule_id in wjbl_schedule): ONE global sequence across every league
#'   edition and season, e.g. 7987 (2025-26 playoff final game 1), 5533 (2018-19), 4243 (2013-14 final, box score
#'   only). The game must be final.
#' @return
#' A `wehoop_data` tibble, one row per record; the columns are always these, in this order
#'   (sdv-py `wjbl_game`):
#'
#' | col_name | type | description |
#' |:---|:---|:---|
#' | play_schedule_id | integer | Game id: ONE global sequence across every league edition and season (7987 = 2025-26 playoff final game 1); the play_schedule_id of the request. |
#' | game_status | character | Game state; always fixed (final) here, the wrapper refuses a game that is not final. |
#' | home_team_id | integer | Home team: Franchise id team_id (key space: W League franchises, STABLE across seasons and sponsor renames: 13 = Toyota Antelopes, 12 = Denso Iris, 8 = ENEOS Sunflowers; all-star sides have their own ids, e.g. 591). The team_id of /team/roster and of the site's /team/roster/?team_id=. Not season_team_id. |
#' | home_season_team_name | character | Home team name: Team name as registered for the season, in Japanese (company + nickname: Toyota Antelopes). |
#' | home_season_team_short_name | character | Home team short name: Short team name for that season, Japanese (Toyota). |
#' | home_team_logo_image | character | Home team logo: Team logo path, relative to https://www.wjbl.org ('/static/images/base_team/...png' or '/assets/img/team/...png'). |
#' | home_team_entry_flg | integer | Official-league participant flag: 1 = a W League member team (the site links its roster), 0 = not (guest or all-star side). Integer. |
#' | home_season_team_area | character | Unobserved: null in every sample, so no type and no meaning is claimed. (By the site's standings JS: 0 = East, 1 = West conference when season_league_flg = 2.) |
#' | home_free_text | character | Free-text team label used when the slot has no team (e.g. 'winner of game X'); empty string in every sample. |
#' | home_winner_flg | integer | Result for this side: 1 = won, -1 = lost (integer; a 0 tie code is unobserved). |
#' | home_score | integer | Home points after the play, parsed from score ('HOME-AWAY'); null on plays that carry no score. |
#' | home_score_p1 | integer | Points scored IN the 1st quarter (not cumulative). |
#' | home_score_p2 | integer | Points scored in the 2nd quarter. |
#' | home_score_p3 | integer | Points scored in the 3rd quarter. |
#' | home_score_p4 | integer | Points scored in the 4th quarter. |
#' | home_score_ot1 | integer | Points scored in the 1st overtime (5 min); null when there was none. |
#' | home_score_ot2 | integer | Unobserved: null in every sample. When filled: Points in the 2nd overtime; null when none. |
#' | home_score_ot3 | integer | Unobserved: null in every sample. When filled: Points in the 3rd overtime; null when none. |
#' | home_score_ot4 | integer | Unobserved: null in every sample. When filled: Points in the 4th overtime; null when none. There is no score_ot5+: overtimes 5-10 appear only as play-by-play period 9-14 and in the /pbp/team-stats and /pbp/player-stats periods maps. |
#' | away_team_id | integer | Away team: Franchise id team_id (key space: W League franchises, STABLE across seasons and sponsor renames: 13 = Toyota Antelopes, 12 = Denso Iris, 8 = ENEOS Sunflowers; all-star sides have their own ids, e.g. 591). The team_id of /team/roster and of the site's /team/roster/?team_id=. Not season_team_id. |
#' | away_season_team_name | character | Away team name: Team name as registered for the season, in Japanese (company + nickname: Toyota Antelopes). |
#' | away_season_team_short_name | character | Away team short name: Short team name for that season, Japanese (Toyota). |
#' | away_team_logo_image | character | Away team logo: Team logo path, relative to https://www.wjbl.org ('/static/images/base_team/...png' or '/assets/img/team/...png'). |
#' | away_team_entry_flg | integer | Official-league participant flag: 1 = a W League member team (the site links its roster), 0 = not (guest or all-star side). Integer. |
#' | away_season_team_area | character | Unobserved: null in every sample, so no type and no meaning is claimed. (By the site's standings JS: 0 = East, 1 = West conference when season_league_flg = 2.) |
#' | away_free_text | character | Free-text team label used when the slot has no team (e.g. 'winner of game X'); empty string in every sample. |
#' | away_winner_flg | integer | Result for this side: 1 = won, -1 = lost (integer; a 0 tie code is unobserved). |
#' | away_score | integer | Away points after the play, parsed from score ('HOME-AWAY'); null on plays that carry no score. |
#' | away_score_p1 | integer | Points scored IN the 1st quarter (not cumulative). |
#' | away_score_p2 | integer | Points scored in the 2nd quarter. |
#' | away_score_p3 | integer | Points scored in the 3rd quarter. |
#' | away_score_p4 | integer | Points scored in the 4th quarter. |
#' | away_score_ot1 | integer | Points scored in the 1st overtime (5 min); null when there was none. |
#' | away_score_ot2 | integer | Unobserved: null in every sample. When filled: Points in the 2nd overtime; null when none. |
#' | away_score_ot3 | integer | Unobserved: null in every sample. When filled: Points in the 3rd overtime; null when none. |
#' | away_score_ot4 | integer | Unobserved: null in every sample. When filled: Points in the 4th overtime; null when none. There is no score_ot5+: overtimes 5-10 appear only as play-by-play period 9-14 and in the /pbp/team-stats and /pbp/player-stats periods maps. |
#' @inherit wjbl_leagues details
#' @examples
#' \donttest{
#'   try(wjbl_game(play_schedule_id = 7987))
#' }
#' @export
#' @family WJBL Functions
wjbl_game <- function(play_schedule_id) {
  withr::local_options(list(scipen = 999, stringsAsFactors = FALSE))
  raw <- .wjbl_get("/play-schedule/detail", list(play_schedule_id = play_schedule_id), call = rlang::current_env())
  .wjbl_out(.wjbl_parse_game(raw), "W League Game from api.wjbl.01core.app")
}

#' @title
#' **Get W League Period Scores**
#' @description
#' Points of each side in each period played (quarters and overtimes) from the game header.
#'
#' Endpoint: `GET https://api.wjbl.01core.app/api/play-schedule/detail`
#' @param play_schedule_id Game id (play_schedule_id in wjbl_schedule): ONE global sequence across every league
#'   edition and season, e.g. 7987 (2025-26 playoff final game 1), 5533 (2018-19), 4243 (2013-14 final, box score
#'   only). The game must be final.
#' @return
#' A `wehoop_data` tibble, one row per record; the columns are always these, in this order
#'   (sdv-py `wjbl_period_scores`):
#'
#' | col_name | type | description |
#' |:---|:---|:---|
#' | play_schedule_id | integer | Game id play_schedule_id (key space: W League games, ONE global sequence across every league_id and season, e.g. 4243 = 2013-14 final, 7987 = 2025-26 final). The play_schedule_id parameter of every game route and of the site's /schedule_result/detail/*?play_schedule_id= pages. |
#' | team_side | character | Which side of the game the row belongs to: home or away (the API's home / away blocks). |
#' | team_id | integer | Franchise id team_id of the side (stable across seasons and sponsor renames; 13 = Toyota Antelopes). |
#' | period | integer | Period number: 1-4 are the quarters and 5-8 the first to fourth overtime (score_ot1 to score_ot4). |
#' | period_label | character | Readable period: Q1-Q4 quarters, OT1-OT10 overtimes (period categories 5-14), H1 / H2 halves (15 / 16), OT all overtimes together (17), GAME the whole game (18). |
#' | score | integer | Points the side scored in that period (null periods, such as overtimes not played, have no row). |
#' @inherit wjbl_leagues details
#' @examples
#' \donttest{
#'   try(wjbl_period_scores(play_schedule_id = 7987))
#' }
#' @export
#' @family WJBL Functions
wjbl_period_scores <- function(play_schedule_id) {
  withr::local_options(list(scipen = 999, stringsAsFactors = FALSE))
  raw <- .wjbl_get("/play-schedule/detail", list(play_schedule_id = play_schedule_id), call = rlang::current_env())
  .wjbl_out(.wjbl_parse_period_scores(raw), "W League Period Scores from api.wjbl.01core.app")
}

#' @title
#' **Get W League Game Info**
#' @description
#' Game information of a final game: venue, times, referees, links and the Japanese game report, one row.
#'
#' Endpoint: `GET https://api.wjbl.01core.app/api/play-schedule`
#' @param play_schedule_id Game id (play_schedule_id in wjbl_schedule): ONE global sequence across every league
#'   edition and season, e.g. 7987 (2025-26 playoff final game 1), 5533 (2018-19), 4243 (2013-14 final, box score
#'   only). The game must be final.
#' @return
#' A `wehoop_data` tibble, one row per record; the columns are always these, in this order
#'   (sdv-py `wjbl_game_info`):
#'
#' | col_name | type | description |
#' |:---|:---|:---|
#' | play_schedule_id | integer | Game id play_schedule_id (key space: W League games, ONE global sequence across every league_id and season, e.g. 4243 = 2013-14 final, 7987 = 2025-26 final). The play_schedule_id parameter of every game route and of the site's /schedule_result/detail/*?play_schedule_id= pages. |
#' | league_id | integer | Competition-edition id league_id (key space: W League competitions; sequential, ONE id per season of the league AND per all-star game, cup or camp: 45 = '25-26 W League', 47 = '26-27', 20 = '13-14', 46 = All-Star 2025-26). The league_id parameter of /play-schedules and /play-schedule-months; enumerate with /leagues. The sdv season is the END year of league_title (END = 2000 + the second YY: '25-26' -> 2026, '99-00' -> 2000). |
#' | league_title | character | Competition-edition title in Japanese: '25-26 W League' = 2025-26 W League (sdv END year 2026; END = 2000 + the second YY: '25-26' -> 2026, '99-00' -> 2000); also All-Star game, Autumn Cup, Summer Camp, 'W League SUPERGAMES'. |
#' | season | integer | Season END year (2025-26 = 2026, 1999-2000 = 2000) from league_title ('25-26 W League'); null for an all-star game, cup or camp. |
#' | season_id | integer | Season-phase id season_id (key space: phases WITHIN a league_id, e.g. 169 = 25-26 regular season Premier, 170 = 25-26 regular season Future, 176 = 25-26 playoff final). Not a year: one league_id has several season_ids. The season_ids parameter of /team-standings and /team-ranking and the season_id of /team/roster. |
#' | season_title | character | Phase title in Japanese: regular season, (Japanese text) / playoff final, playoff semifinal (the separator varies by era). |
#' | season_full_name | character | league_title + phase (+ division) in Japanese: 2025-26 regular season, Premier division (Future division, from 2024-25). |
#' | game_date | character | Game date in Japanese, (Japanese text) (Saturday 4 April 2026). |
#' | game_day | character | Game date as an ISO date (YYYY-MM-DD, Japan time), built from the game year and the game date. |
#' | game_start_time | character | Scheduled tip-off 'HH:MM', Japan time (JST, UTC+9). |
#' | started_at | character | Actual tip-off 'HH:MM', JST, as recorded ('15:01'); junk on 2013-14 games ('05:06' for a 19:00 game, and it CHANGES between requests: 05:06 / 05:16 / 05:25 for game 4243), so ignore it there. |
#' | opening_time | character | Doors-open time 'HH:MM', JST; empty when not published. |
#' | venue | character | Arena name, Japanese. |
#' | game_icon | integer | Icon code shown next to the game: 0 = none, 1 = home-game icon (home.svg), 2 = neutral-site icon (neutral.svg). |
#' | venue_address | character | Arena postal address, Japanese. |
#' | venue_others | character | Access directions to the arena (nearest station, walking time), Japanese free text. |
#' | allow_shoes_on | integer | Outdoor shoes allowed in the arena: 1 = not stated, 2 = yes (o), 3 or 4 = no (x). Integer. |
#' | allow_shoes_on_others | character | Extra note on outdoor shoes; empty string in every sample. |
#' | ticket_info | character | Ticket information, Japanese free text with CRLF line breaks and HTML links. |
#' | ticket_url | character | Ticket sale URL; empty string in every sample. |
#' | event_info | character | Event-day information (gate times, food, shoes, tip-off), Japanese free text with CRLF line breaks. |
#' | live_link | character | Live-stream URL; empty when none. |
#' | vod_link | character | Video-on-demand URL (Basketball LIVE / W-TV); empty when none. |
#' | bs_url | character | Satellite-TV (BS) broadcast URL; empty string in every sample. |
#' | cs_url | character | Cable/satellite (CS) broadcast URL; empty string in every sample. |
#' | ground_url | character | Terrestrial-TV broadcast URL; empty string in every sample. |
#' | other_url | character | Other broadcast URL; empty string in every sample. |
#' | cancel_flg | integer | Cancelled flag: 1 = cancelled, 0 = not. |
#' | delay_flg | integer | Postponed flag: 1 = postponed, 0 = not. |
#' | game_status | character | Game state: 'fixed' = final (confirmed result), 'scheduled' = not played yet (seen on 26-27 games); the site's JS also handles 'live', 'canceled' and 'delayed'. The capture banks only 'fixed' games. |
#' | box_flg | integer | Box-score flag (integer). 1 on every sampled game, scheduled ones included, so it does NOT prove a box score exists. |
#' | pbp_flg | integer | Play-by-play flag: 1 = /pbp/* routes have data (2018-19 onward), 0 = not (they answer \[\]). |
#' | referee_name | character | Crew chief, 'SURNAME GIVEN' in Japanese; empty on 2013-14 (names are in comment); placeholder (Japanese text) (= 'referee 01') on game 5533. |
#' | sub_referee_name1 | character | First umpire, Japanese name; empty when not recorded. |
#' | sub_referee_name2 | character | Second umpire, Japanese name; empty when not recorded. |
#' | comment | character | Officials block, Japanese free text: (Japanese text) crew chief, (Japanese text) first umpire, (Japanese text) second umpire, 2013-14 (Japanese text) referee / (Japanese text) umpires / (Japanese text) commissioner; CRLF or `<br>` separated. |
#' | report | character | Game report (quarter-by-quarter narrative) in Japanese HTML; filled on 2013-14, empty on the newer samples. |
#' | home_team_id | integer | Home team: Franchise id team_id (key space: W League franchises, STABLE across seasons and sponsor renames: 13 = Toyota Antelopes, 12 = Denso Iris, 8 = ENEOS Sunflowers; all-star sides have their own ids, e.g. 591). The team_id of /team/roster and of the site's /team/roster/?team_id=. Not season_team_id. |
#' | home_season_team_name | character | Home team name: Team name as registered for the season, in Japanese (company + nickname: Toyota Antelopes). |
#' | home_season_team_short_name | character | Home team short name: Short team name for that season, Japanese (Toyota). |
#' | home_team_logo_image | character | Home team logo: Team logo path, relative to https://www.wjbl.org ('/static/images/base_team/...png' or '/assets/img/team/...png'). |
#' | home_free_text | character | Free-text team label used when the slot has no team (e.g. 'winner of game X'); empty string in every sample. |
#' | away_team_id | integer | Away team: Franchise id team_id (key space: W League franchises, STABLE across seasons and sponsor renames: 13 = Toyota Antelopes, 12 = Denso Iris, 8 = ENEOS Sunflowers; all-star sides have their own ids, e.g. 591). The team_id of /team/roster and of the site's /team/roster/?team_id=. Not season_team_id. |
#' | away_season_team_name | character | Away team name: Team name as registered for the season, in Japanese (company + nickname: Toyota Antelopes). |
#' | away_season_team_short_name | character | Away team short name: Short team name for that season, Japanese (Toyota). |
#' | away_team_logo_image | character | Away team logo: Team logo path, relative to https://www.wjbl.org ('/static/images/base_team/...png' or '/assets/img/team/...png'). |
#' | away_free_text | character | Free-text team label used when the slot has no team (e.g. 'winner of game X'); empty string in every sample. |
#' @inherit wjbl_leagues details
#' @examples
#' \donttest{
#'   try(wjbl_game_info(play_schedule_id = 7987))
#' }
#' @export
#' @family WJBL Functions
wjbl_game_info <- function(play_schedule_id) {
  withr::local_options(list(scipen = 999, stringsAsFactors = FALSE))
  raw <- .wjbl_get("/play-schedule", list(play_schedule_id = play_schedule_id), call = rlang::current_env())
  .wjbl_out(.wjbl_parse_game_info(raw), "W League Game Info from api.wjbl.01core.app")
}

#' @title
#' **Get W League Box Score**
#' @description
#' Box score of a final game (2013-14 on): one row per player of both teams.
#'
#' Endpoint: `GET https://api.wjbl.01core.app/api/boxscore`
#' @param play_schedule_id Game id (play_schedule_id in wjbl_schedule): ONE global sequence across every league
#'   edition and season, e.g. 7987 (2025-26 playoff final game 1), 5533 (2018-19), 4243 (2013-14 final, box score
#'   only). The game must be final.
#' @return
#' A `wehoop_data` tibble, one row per record; the columns are always these, in this order
#'   (sdv-py `wjbl_box_score`):
#'
#' | col_name | type | description |
#' |:---|:---|:---|
#' | play_schedule_id | integer | Game id play_schedule_id (key space: W League games, ONE global sequence across every league_id and season, e.g. 4243 = 2013-14 final, 7987 = 2025-26 final). The play_schedule_id parameter of every game route and of the site's /schedule_result/detail/*?play_schedule_id= pages. |
#' | team_side | character | Which side of the game the row belongs to: home or away (the API's home / away blocks). |
#' | team_id | integer | Franchise id team_id of the side (stable across seasons and sponsor renames; 13 = Toyota Antelopes). |
#' | player_id | integer | Player id player_id (key space: W League persons, STABLE across seasons and teams). The player_id of /player and the pi= of the site's /player/detail?pi=; joins the play-by-play player_id1 / player_id2. |
#' | player_name | character | Player name in Japanese, 'SURNAME GIVEN' with a space (foreign players in katakana). |
#' | player_number | character | Shirt number, a string. |
#' | gs | integer | Game started: 1 = starter, 0 = bench (integer). |
#' | pts | integer | Points. Integer. |
#' | p2m | integer | Two-point field goals made. Integer. |
#' | p2a | integer | Two-point field goals attempted. Integer. |
#' | p3m | integer | Three-point field goals made. Integer. |
#' | p3a | integer | Three-point field goals attempted. Integer. |
#' | ftm | integer | Free throws made. Integer. |
#' | fta | integer | Free throws attempted. Integer. |
#' | f | integer | Personal fouls committed. Integer. |
#' | off | integer | Offensive rebounds. Integer. |
#' | def | integer | Defensive rebounds. Integer. |
#' | tot | integer | Total rebounds (off + def). Integer. |
#' | ast | integer | Assists. Integer. |
#' | stl | integer | Steals. Integer. |
#' | blk | integer | Blocked shots (made by this player / team). Integer. |
#' | to | integer | Turnovers. Integer. |
#' | min | character | Minutes played 'mm:ss' ('22:19'), a string. |
#' | min_seconds | integer | Minutes played in whole seconds, from the 'mm:ss' clock string min (null when it does not parse). |
#' @inherit wjbl_leagues details
#' @examples
#' \donttest{
#'   try(wjbl_box_score(play_schedule_id = 7987))
#' }
#' @export
#' @family WJBL Functions
wjbl_box_score <- function(play_schedule_id) {
  withr::local_options(list(scipen = 999, stringsAsFactors = FALSE))
  raw <- .wjbl_get("/boxscore", list(play_schedule_id = play_schedule_id), call = rlang::current_env())
  .wjbl_out(.wjbl_parse_box_score(raw), "W League Box Score from api.wjbl.01core.app")
}

#' @title
#' **Get W League Team Box Score**
#' @description
#' Team line and totals of each side of a final game's box score, with the shooting percentages.
#'
#' Endpoint: `GET https://api.wjbl.01core.app/api/boxscore`
#' @param play_schedule_id Game id (play_schedule_id in wjbl_schedule): ONE global sequence across every league
#'   edition and season, e.g. 7987 (2025-26 playoff final game 1), 5533 (2018-19), 4243 (2013-14 final, box score
#'   only). The game must be final.
#' @return
#' A `wehoop_data` tibble, one row per record; the columns are always these, in this order
#'   (sdv-py `wjbl_team_box_score`):
#'
#' | col_name | type | description |
#' |:---|:---|:---|
#' | play_schedule_id | integer | Game id play_schedule_id (key space: W League games, ONE global sequence across every league_id and season, e.g. 4243 = 2013-14 final, 7987 = 2025-26 final). The play_schedule_id parameter of every game route and of the site's /schedule_result/detail/*?play_schedule_id= pages. |
#' | team_side | character | Which side of the game the row belongs to: home or away (the API's home / away blocks). |
#' | team_id | integer | Franchise id team_id of the side (stable across seasons and sponsor renames; 13 = Toyota Antelopes). |
#' | row_type | character | Which line of the side: team (stats credited to the team itself) or total (the whole side). |
#' | pts | integer | Points scored by the side (the sum of its players' points). |
#' | p2m | integer | Two-point field goals made. |
#' | p2a | integer | Two-point field goals attempted. |
#' | p3m | integer | Three-point field goals made. |
#' | p3a | integer | Three-point field goals attempted. |
#' | ftm | integer | Free throws made. |
#' | fta | integer | Free throws attempted. |
#' | f | integer | Personal fouls committed. |
#' | off | integer | Offensive rebounds. |
#' | def | integer | Defensive rebounds. |
#' | tot | integer | Total rebounds (offensive plus defensive). |
#' | ast | integer | Assists credited to the side. |
#' | stl | integer | Steals credited to the side. |
#' | blk | integer | Blocked shots credited to the side. |
#' | to | integer | Turnovers committed by the side. |
#' | min | character | Minutes: summed minutes 'mmm:ss' on the total row ('200:00' = 5 x 40:00), always '00:00' on the team row. |
#' | min_seconds | integer | Minutes played in whole seconds, from the 'mm:ss' clock string min (null when it does not parse). |
#' | p2p | double | Two-point field-goal percentage 0-100 (a string on the wire); total row only. |
#' | p3p | double | Three-point field-goal percentage 0-100 (a string on the wire); total row only. |
#' | ftp | double | Free-throw percentage 0-100 (a string on the wire); total row only. |
#' | fgp | double | Field-goal percentage 0-100, two- and three-pointers together (a string on the wire); total row only. |
#' @inherit wjbl_leagues details
#' @examples
#' \donttest{
#'   try(wjbl_team_box_score(play_schedule_id = 7987))
#' }
#' @export
#' @family WJBL Functions
wjbl_team_box_score <- function(play_schedule_id) {
  withr::local_options(list(scipen = 999, stringsAsFactors = FALSE))
  raw <- .wjbl_get("/boxscore", list(play_schedule_id = play_schedule_id), call = rlang::current_env())
  .wjbl_out(.wjbl_parse_team_box_score(raw), "W League Team Box Score from api.wjbl.01core.app")
}

#' @title
#' **Get W League Play-by-Play**
#' @description
#' Play-by-play of a final game (2018-19 on): one row per play, Japanese action vocabulary, no shot x/y.
#'
#' Endpoint: `GET https://api.wjbl.01core.app/api/pbp/play-by-play`
#' @param play_schedule_id Game id (play_schedule_id in wjbl_schedule): ONE global sequence across every league
#'   edition and season, e.g. 7987 (2025-26 playoff final game 1), 5533 (2018-19), 4243 (2013-14 final, box score
#'   only). The game must be final.
#' @return
#' A `wehoop_data` tibble, one row per record; the columns are always these, in this order
#'   (sdv-py `wjbl_pbp`):
#'
#' | col_name | type | description |
#' |:---|:---|:---|
#' | play_schedule_id | integer | Game id play_schedule_id (key space: W League games, ONE global sequence across every league_id and season, e.g. 4243 = 2013-14 final, 7987 = 2025-26 final). The play_schedule_id parameter of every game route and of the site's /schedule_result/detail/*?play_schedule_id= pages. |
#' | no | integer | Play sequence number, ascending, 1 = first; numbers can skip (deleted plays: 443 numbers for 439 rows on 7987). |
#' | period | integer | Period: 1-4 = quarters, 5-14 = overtime 1-10 (the site's tab map). Integer. |
#' | rest_time | character | Game clock REMAINING in the period, 'm:ss' without a leading zero ('9:38'; '10:00' at the start, 5:00 in overtime). |
#' | seconds_remaining | integer | Seconds remaining in the period, from the 'm:ss' clock string rest_time. |
#' | team_id | integer | Acting team: franchise id team_id; null on period and game-end lines. |
#' | team_name | character | Acting team name, Japanese (may contain a full-width space and differ from the box score's spelling); empty on period/game-end lines. |
#' | team_side | character | Side of the acting team, home or away (from home_away: 1 home, 2 away); null on period and game-end lines. |
#' | player_number1 | character | Shirt number of the first actor (the player going OUT on a substitution), a string; '' on team and period lines. |
#' | player_number2 | character | Shirt number of the second actor (the player coming IN on a substitution), a string; '' otherwise. |
#' | player_name1 | character | Name of the first actor, Japanese; '' on team and period lines. |
#' | player_name2 | character | Name of the second actor (substitution in), Japanese; '' otherwise. |
#' | player_id1 | integer | First actor (the player going OUT on a substitution): Player id (key space: W League persons, STABLE across seasons and teams). Joins /boxscore home/away.players\[\].player_id and the player_id of /player (the pi= of the site's /player/detail?pi=). Null on team and period lines. |
#' | player_id2 | integer | Second actor, filled on substitutions only (the player coming IN; verified 89/89 on game 7987): Player id (key space: W League persons, STABLE across seasons and teams). Joins /boxscore home/away.players\[\].player_id and the player_id of /player (the pi= of the site's /player/detail?pi=). Null otherwise. |
#' | play_text | character | Display text in Japanese: (Japanese text). Bracketed running counts: shots the player's points so far, assists/steals/blocks/turnovers count so far, rebounds '(o-d-t)' = the player's offensive-defensive-total so far, fouls '(a-b:c)' = a the player's personal fouls, b the team's fouls in the period, c free throws awarded (verified on 7987), substitution A out, B in. Empty on period and game-end lines. |
#' | score | character | Score 'HOME-AWAY' after the play ('4-3'); filled on scoring plays and period/game-end lines, '' otherwise. |
#' | home_score | integer | Home points after the play, parsed from score ('HOME-AWAY'); null on plays that carry no score. |
#' | away_score | integer | Away points after the play, parsed from score ('HOME-AWAY'); null on plays that carry no score. |
#' | end_period_flg | integer | End-of-period flag (integer); 0 on every observed row, the period end is the (Japanese text) action instead. |
#' | end_game_flg | integer | End-of-game flag: 1 on the final (Japanese text) line only (the site skips that row), else 0. |
#' | action1 | character | Action in Japanese (vocabulary of 8 full games, 2018-19 to 2025-26): player in (the starting five at the start of the game), substitution (player_id1 OUT, player_id2 IN), (Japanese text) / 'x' = two-point shot outside the paint made / missed ((Japanese text) inside-the-paint is not in the sample games), (Japanese text) / 'x' = three-point shot made / missed, (Japanese text) / 'x' = free throw made / missed, assist, offensive rebound, defensive rebound, (Japanese text) / team offensive / defensive rebound, steal, blocked shot, turnover, team turnover, personal foul, offensive foul, unsportsmanlike foul, timeout, end of period (quarter or overtime), end of game. o = made, x = missed. |
#' | action2 | character | Sub-action in Japanese: jump shot (on field-goal attempts), free throws awarded on this foul, N = 0-3; '' otherwise. |
#' | action3 | character | Second qualifier in Japanese: shooting foul; '' otherwise. |
#' | home_away | integer | Side of the acting team: 1 = home, 2 = away; null on period/game-end lines. |
#' @inherit wjbl_leagues details
#' @examples
#' \donttest{
#'   try(wjbl_pbp(play_schedule_id = 7987))
#' }
#' @export
#' @family WJBL Functions
wjbl_pbp <- function(play_schedule_id) {
  withr::local_options(list(scipen = 999, stringsAsFactors = FALSE))
  raw <- .wjbl_get("/pbp/play-by-play", list(play_schedule_id = play_schedule_id), call = rlang::current_env())
  .wjbl_out(.wjbl_parse_pbp(raw), "W League Play-by-Play from api.wjbl.01core.app")
}

#' @title
#' **Get W League Team Period Stats**
#' @description
#' Team stat summary per period, half and game (2018-19 on): percentages, rebounds, assists, turnovers, lead
#'   changes.
#'
#' Endpoint: `GET https://api.wjbl.01core.app/api/pbp/team-stats`
#' @param play_schedule_id Game id (play_schedule_id in wjbl_schedule): ONE global sequence across every league
#'   edition and season, e.g. 7987 (2025-26 playoff final game 1), 5533 (2018-19), 4243 (2013-14 final, box score
#'   only). The game must be final.
#' @return
#' A `wehoop_data` tibble, one row per record; the columns are always these, in this order
#'   (sdv-py `wjbl_team_period_stats`):
#'
#' | col_name | type | description |
#' |:---|:---|:---|
#' | play_schedule_id | integer | Game id play_schedule_id (key space: W League games, ONE global sequence across every league_id and season, e.g. 4243 = 2013-14 final, 7987 = 2025-26 final). The play_schedule_id parameter of every game route and of the site's /schedule_result/detail/*?play_schedule_id= pages. |
#' | home_team_id | integer | Home team: Franchise id team_id (key space: W League franchises, STABLE across seasons and sponsor renames: 13 = Toyota Antelopes, 12 = Denso Iris, 8 = ENEOS Sunflowers; all-star sides have their own ids, e.g. 591). The team_id of /team/roster and of the site's /team/roster/?team_id=. Not season_team_id. |
#' | away_team_id | integer | Away team: Franchise id team_id (key space: W League franchises, STABLE across seasons and sponsor renames: 13 = Toyota Antelopes, 12 = Denso Iris, 8 = ENEOS Sunflowers; all-star sides have their own ids, e.g. 591). The team_id of /team/roster and of the site's /team/roster/?team_id=. Not season_team_id. |
#' | period_category | integer | The period category again, as an integer (see periods). |
#' | period_label | character | Readable period: Q1-Q4 quarters, OT1-OT10 overtimes (period categories 5-14), H1 / H2 halves (15 / 16), OT all overtimes together (17), GAME the whole game (18). |
#' | home_ptr | double | Home field-goal percentage (2PT + 3PT) in the period, 0-100, a NUMBER with up to one decimal (61.5; whole values come as integers). |
#' | home_pt2r | double | Home two-point percentage, 0-100, number. |
#' | home_pt3r | double | Home three-point percentage, 0-100, number. |
#' | home_ftr | double | Home free-throw percentage, 0-100, number (0 when no attempts). |
#' | home_rebound_off | integer | Home offensive rebounds in the period, the first number of the wire's 'off-def-total' string. |
#' | home_rebound_def | integer | Home defensive rebounds in the period, the second number of the wire's 'off-def-total' string. |
#' | home_rebound_tot | integer | Home total rebounds in the period, the third number of the wire's 'off-def-total' string. |
#' | home_assist | integer | Home assists (integer). |
#' | home_turnovers | integer | Home turnovers in the period, from the wire's counted string (6); the wire key is spelled home_trun_over. |
#' | home_max_difference | integer | Home team's largest lead in the period, in points; the wire key is spelled home_max_differenct. |
#' | away_ptr | double | Away field-goal percentage (2PT + 3PT) in the period, 0-100, a NUMBER with up to one decimal (61.5; whole values come as integers). |
#' | away_pt2r | double | Away two-point percentage, 0-100, number. |
#' | away_pt3r | double | Away three-point percentage, 0-100, number. |
#' | away_ftr | double | Away free-throw percentage, 0-100, number (0 when no attempts). |
#' | away_rebound_off | integer | Away offensive rebounds in the period, the first number of the wire's 'off-def-total' string. |
#' | away_rebound_def | integer | Away defensive rebounds in the period, the second number of the wire's 'off-def-total' string. |
#' | away_rebound_tot | integer | Away total rebounds in the period, the third number of the wire's 'off-def-total' string. |
#' | away_assist | integer | Away assists (integer). |
#' | away_turnovers | integer | Away turnovers in the period, from the wire's counted string (6); the wire key is spelled away_trun_over. |
#' | away_max_difference | integer | Away team's largest lead in the period, points (integer). |
#' | lead_count | integer | Lead changes in the period, from the wire's counted string (0 times). |
#' | tie_count | integer | Times the score was tied in the period, from the wire's counted string (4 times). |
#' @inherit wjbl_leagues details
#' @examples
#' \donttest{
#'   try(wjbl_team_period_stats(play_schedule_id = 7987))
#' }
#' @export
#' @family WJBL Functions
wjbl_team_period_stats <- function(play_schedule_id) {
  withr::local_options(list(scipen = 999, stringsAsFactors = FALSE))
  raw <- .wjbl_get("/pbp/team-stats", list(play_schedule_id = play_schedule_id), call = rlang::current_env())
  .wjbl_out(.wjbl_parse_team_period_stats(raw), "W League Team Period Stats from api.wjbl.01core.app")
}

#' @title
#' **Get W League Player Period Leaders**
#' @description
#' Leading scorer, passer and rebounder of each team per period, half and game (2018-19 on).
#'
#' Endpoint: `GET https://api.wjbl.01core.app/api/pbp/player-stats`
#' @param play_schedule_id Game id (play_schedule_id in wjbl_schedule): ONE global sequence across every league
#'   edition and season, e.g. 7987 (2025-26 playoff final game 1), 5533 (2018-19), 4243 (2013-14 final, box score
#'   only). The game must be final.
#' @return
#' A `wehoop_data` tibble, one row per record; the columns are always these, in this order
#'   (sdv-py `wjbl_player_period_leaders`):
#'
#' | col_name | type | description |
#' |:---|:---|:---|
#' | play_schedule_id | integer | Game id play_schedule_id (key space: W League games, ONE global sequence across every league_id and season, e.g. 4243 = 2013-14 final, 7987 = 2025-26 final). The play_schedule_id parameter of every game route and of the site's /schedule_result/detail/*?play_schedule_id= pages. |
#' | home_team_id | integer | Home team: Franchise id team_id (key space: W League franchises, STABLE across seasons and sponsor renames: 13 = Toyota Antelopes, 12 = Denso Iris, 8 = ENEOS Sunflowers; all-star sides have their own ids, e.g. 591). The team_id of /team/roster and of the site's /team/roster/?team_id=. Not season_team_id. |
#' | away_team_id | integer | Away team: Franchise id team_id (key space: W League franchises, STABLE across seasons and sponsor renames: 13 = Toyota Antelopes, 12 = Denso Iris, 8 = ENEOS Sunflowers; all-star sides have their own ids, e.g. 591). The team_id of /team/roster and of the site's /team/roster/?team_id=. Not season_team_id. |
#' | period_category | integer | The period category again, as an integer (camelCase here, period_category on /pbp/team-stats). |
#' | period_label | character | Readable period: Q1-Q4 quarters, OT1-OT10 overtimes (period categories 5-14), H1 / H2 halves (15 / 16), OT all overtimes together (17), GAME the whole game (18). |
#' | home_point_player | character | Home points leader(s) in the period as '#NUMBER NAME' (Japanese); ties are joined with ', '. |
#' | home_point_value | character | Their points with the counter (Japanese) ((Japanese text)); ties joined with ', ' in the same order. |
#' | home_assist_player | character | Home assist leader(s), '#NUMBER NAME', ties joined with ', '. |
#' | home_assist_value | character | Their assists with the counter (Japanese) ((Japanese text)), ', '-joined for ties. |
#' | home_rebound_player | character | Home rebound leader(s), '#NUMBER NAME', ties joined with ', '. |
#' | home_rebound_value | character | Their rebounds 'offensive-defensive-total' ('0-3-3'), ', '-joined for ties. |
#' | away_point_player | character | Away points leader(s) in the period as '#NUMBER NAME' (Japanese); ties are joined with ', '. |
#' | away_point_value | character | Their points with the counter (Japanese) ((Japanese text)); ties joined with ', ' in the same order. |
#' | away_assist_player | character | Away assist leader(s), '#NUMBER NAME', ties joined with ', '. |
#' | away_assist_value | character | Their assists with the counter (Japanese) ((Japanese text)), ', '-joined for ties. |
#' | away_rebound_player | character | Away rebound leader(s), '#NUMBER NAME', ties joined with ', '. |
#' | away_rebound_value | character | Their rebounds 'offensive-defensive-total' ('0-3-3'), ', '-joined for ties. |
#' @inherit wjbl_leagues details
#' @examples
#' \donttest{
#'   try(wjbl_player_period_leaders(play_schedule_id = 7987))
#' }
#' @export
#' @family WJBL Functions
wjbl_player_period_leaders <- function(play_schedule_id) {
  withr::local_options(list(scipen = 999, stringsAsFactors = FALSE))
  raw <- .wjbl_get("/pbp/player-stats", list(play_schedule_id = play_schedule_id), call = rlang::current_env())
  .wjbl_out(.wjbl_parse_player_period_leaders(raw), "W League Player Period Leaders from api.wjbl.01core.app")
}

#' @title
#' **Get W League Standing Seasons**
#' @description
#' Every season phase (season_id) with its edition name and standings flags.
#'
#' Endpoint: `GET https://api.wjbl.01core.app/api/seasons/standings`
#' @return
#' A `wehoop_data` tibble, one row per record; the columns are always these, in this order
#'   (sdv-py `wjbl_standing_seasons`):
#'
#' | col_name | type | description |
#' |:---|:---|:---|
#' | season_id | integer | Season-phase id season_id (key space: phases WITHIN a league_id, e.g. 169 = 25-26 regular season Premier, 170 = 25-26 regular season Future, 176 = 25-26 playoff final). Not a year: one league_id has several season_ids. The season_ids parameter of /team-standings and /team-ranking and the season_id of /team/roster. |
#' | season_full_name | character | Edition name with the sponsor, Japanese, e.g. (Japanese text) (truncated by the API). |
#' | season | integer | Season END year (2025-26 = 2026, 1999-2000 = 2000) from league_title ('25-26 W League'); null for an all-star game, cup or camp. Read from the start of season_full_name. |
#' | season_league_name | character | Phase / division label in Japanese: Premier, Future, group stage, second round, lower league; empty for a single-table phase. |
#' | team_standings_flg | integer | 1 = the phase has a standings grid (/team-standings), 0 = not (cups, all-star games, phases not started). |
#' | season_tournament_text_flg | integer | 1 = the phase shows a tournament text instead of a table, 0 = not; 0 in every sample. |
#' | season_tournament_text | character | Tournament text (HTML) for knockout phases; empty in every sample. |
#' @inherit wjbl_leagues details
#' @examples
#' \donttest{
#'   try(wjbl_standing_seasons())
#' }
#' @export
#' @family WJBL Functions
wjbl_standing_seasons <- function() {
  withr::local_options(list(scipen = 999, stringsAsFactors = FALSE))
  raw <- .wjbl_get("/seasons/standings", list(), call = rlang::current_env())
  .wjbl_out(.wjbl_parse_standing_seasons(raw), "W League Standing Seasons from api.wjbl.01core.app")
}

#' @title
#' **Get W League Team Standings**
#' @description
#' League table of one or more season phases: rank and record of every team.
#'
#' Endpoint: `GET https://api.wjbl.01core.app/api/team-standings`
#' @param season_ids Season phase id or ids (season_id in wjbl_standing_seasons; a phase inside a league edition,
#'   not a year): an integer, a list or a comma string such as '169,170' (2025-26 regular season Premier and Future
#'   divisions).
#' @return
#' A `wehoop_data` tibble, one row per record; the columns are always these, in this order
#'   (sdv-py `wjbl_team_standings`):
#'
#' | col_name | type | description |
#' |:---|:---|:---|
#' | season_id | integer | Season-phase id season_id (key space: phases WITHIN a league_id, e.g. 169 = 25-26 regular season Premier, 170 = 25-26 regular season Future, 176 = 25-26 playoff final). Not a year: one league_id has several season_ids. The season_ids parameter of /team-standings and /team-ranking and the season_id of /team/roster. |
#' | season_title | character | Phase title in Japanese: regular season, (Japanese text) / playoff final, playoff semifinal (the separator varies by era). |
#' | league_name | character | Division name, Japanese (Premier). |
#' | season_league_name | character | Phase / division label in Japanese: Premier, Future, group stage, second round, lower league; empty for a single-table phase. |
#' | season_league_flg | integer | Division layout flag: 1 = one table per division (Premier / Future), 2 = split by season_team_area (East / West, by the site's JS), 0 = cup / group stage. |
#' | update_date | character | As-of date in Japanese, (Japanese text). |
#' | team_id | integer | Franchise id team_id (key space: W League franchises, STABLE across seasons and sponsor renames: 13 = Toyota Antelopes, 12 = Denso Iris, 8 = ENEOS Sunflowers; all-star sides have their own ids, e.g. 591). The team_id of /team/roster and of the site's /team/roster/?team_id=. Not season_team_id. |
#' | season_team_name | character | Team name as registered for the season, in Japanese (company + nickname: Toyota Antelopes). |
#' | season_team_short_name | character | Short team name for that season, Japanese (Toyota). |
#' | team_entry_flg | integer | Official-league participant flag: 1 = a W League member team (the site links its roster), 0 = not (guest or all-star side). Integer. |
#' | position | integer | Rank of the team in the phase (a string on the wire, equal to the map key). |
#' | season_team_area | character | Unobserved: null in every sample, so no type and no meaning is claimed. (By the site's standings JS: 0 = East, 1 = West conference when season_league_flg = 2.) |
#' | win_lost | character | Record in Japanese, (Japanese text) (23 wins, 5 losses). |
#' | wins | integer | Wins in the record, parsed from win_lost (23 wins). |
#' | losses | integer | Losses in the record, parsed from win_lost (5 losses). |
#' @inherit wjbl_leagues details
#' @examples
#' \donttest{
#'   try(wjbl_team_standings(season_ids = "169"))
#' }
#' @export
#' @family WJBL Functions
wjbl_team_standings <- function(season_ids) {
  withr::local_options(list(scipen = 999, stringsAsFactors = FALSE))
  raw <- .wjbl_get("/team-standings", list(season_ids = season_ids), call = rlang::current_env())
  .wjbl_out(.wjbl_parse_team_standings(raw), "W League Team Standings from api.wjbl.01core.app")
}

#' @title
#' **Get W League Head-to-Head**
#' @description
#' Head-to-head results grid (hoshitori-hyo) of one or more season phases: one row per game played.
#'
#' Endpoint: `GET https://api.wjbl.01core.app/api/team-standings`
#' @param season_ids Season phase id or ids (season_id in wjbl_standing_seasons; a phase inside a league edition,
#'   not a year): an integer, a list or a comma string such as '169,170' (2025-26 regular season Premier and Future
#'   divisions).
#' @return
#' A `wehoop_data` tibble, one row per record; the columns are always these, in this order
#'   (sdv-py `wjbl_head_to_head`):
#'
#' | col_name | type | description |
#' |:---|:---|:---|
#' | season_id | integer | Season phase id of the grid, e.g. 169 (2025-26 regular season, Premier division). |
#' | team_id | integer | Franchise id team_id of the ROW team (the team whose points are win). |
#' | opponent_team_id | integer | Franchise id team_id of the opponent in that game. |
#' | game_number | integer | 1-based order of the game within the pair of teams in the grid (the wire list has no number). |
#' | win | integer | The ROW team's points in that game (a string on the wire, whatever the result; 56 on a loss). |
#' | losg | integer | The OPPONENT's points in that game (a string on the wire; the wire key is spelled losg). |
#' | result | character | 'o 63-56' = row team won, 'x 56-63' = lost (row team's points first); 'o 20-0' is a forfeit win (FIBA forfeit score). |
#' @inherit wjbl_leagues details
#' @examples
#' \donttest{
#'   try(wjbl_head_to_head(season_ids = "169"))
#' }
#' @export
#' @family WJBL Functions
wjbl_head_to_head <- function(season_ids) {
  withr::local_options(list(scipen = 999, stringsAsFactors = FALSE))
  raw <- .wjbl_get("/team-standings", list(season_ids = season_ids), call = rlang::current_env())
  .wjbl_out(.wjbl_parse_head_to_head(raw), "W League Head-to-Head from api.wjbl.01core.app")
}

#' @title
#' **Get W League Team Ranking**
#' @description
#' League table with per-game team averages (points, shooting, rebounds, assists) of one or more season phases.
#'
#' Endpoint: `GET https://api.wjbl.01core.app/api/team-ranking`
#' @param season_ids Season phase id or ids (season_id in wjbl_standing_seasons; a phase inside a league edition,
#'   not a year): an integer, a list or a comma string such as '169,170' (2025-26 regular season Premier and Future
#'   divisions).
#' @return
#' A `wehoop_data` tibble, one row per record; the columns are always these, in this order
#'   (sdv-py `wjbl_team_ranking`):
#'
#' | col_name | type | description |
#' |:---|:---|:---|
#' | league_id | integer | Competition-edition id league_id (key space: W League competitions; sequential, ONE id per season of the league AND per all-star game, cup or camp: 45 = '25-26 W League', 47 = '26-27', 20 = '13-14', 46 = All-Star 2025-26). The league_id parameter of /play-schedules and /play-schedule-months; enumerate with /leagues. The sdv season is the END year of league_title (END = 2000 + the second YY: '25-26' -> 2026, '99-00' -> 2000). |
#' | league_title | character | Competition-edition title in Japanese: '25-26 W League' = 2025-26 W League (sdv END year 2026; END = 2000 + the second YY: '25-26' -> 2026, '99-00' -> 2000); also All-Star game, Autumn Cup, Summer Camp, 'W League SUPERGAMES'. |
#' | season | integer | Season END year (2025-26 = 2026, 1999-2000 = 2000) from league_title ('25-26 W League'); null for an all-star game, cup or camp. |
#' | season_id | integer | Season-phase id season_id (key space: phases WITHIN a league_id, e.g. 169 = 25-26 regular season Premier, 170 = 25-26 regular season Future, 176 = 25-26 playoff final). Not a year: one league_id has several season_ids. The season_ids parameter of /team-standings and /team-ranking and the season_id of /team/roster. |
#' | season_title | character | Phase title in Japanese: regular season, (Japanese text) / playoff final, playoff semifinal (the separator varies by era). |
#' | season_full_name | character | league_title + phase (+ division) in Japanese: 2025-26 regular season, Premier division (Future division, from 2024-25). |
#' | season_league_name | character | Phase / division label in Japanese: Premier, Future, group stage, second round, lower league; empty for a single-table phase. |
#' | season_league_flg | integer | Division layout flag: 1 = one table per division (Premier / Future), 2 = split by season_team_area (East / West, by the site's JS), 0 = cup / group stage. |
#' | season_league_img | character | Division badge image path relative to https://www.wjbl.org. |
#' | season_tournament_text | character | Tournament text (HTML); empty in every sample. |
#' | update_info | character | As-of note in Japanese, (Japanese text) (as of 8 Feb 2026). |
#' | team_id | integer | Franchise id team_id (key space: W League franchises, STABLE across seasons and sponsor renames: 13 = Toyota Antelopes, 12 = Denso Iris, 8 = ENEOS Sunflowers; all-star sides have their own ids, e.g. 591). The team_id of /team/roster and of the site's /team/roster/?team_id=. Not season_team_id. |
#' | season_team_name | character | Team name as registered for the season, in Japanese (company + nickname: Toyota Antelopes). |
#' | season_team_short_name | character | Short team name for that season, Japanese (Toyota). |
#' | team_entry_flg | integer | Official-league participant flag: 1 = a W League member team (the site links its roster), 0 = not (guest or all-star side). Integer. |
#' | position | integer | Rank of the team in the phase (a string on the wire). |
#' | season_team_area | character | Unobserved: null in every sample, so no type and no meaning is claimed. (By the site's standings JS: 0 = East, 1 = West conference when season_league_flg = 2.) |
#' | win | integer | Wins, integer. |
#' | lost | integer | Losses, integer. |
#' | winning_rate | double | Winning percentage as a FRACTION 0-1 with three decimals, a string ('0.821'); parsed to a number. |
#' | ppg | double | Points per game, a string with two decimals; parsed to a number. |
#' | opp | double | Opponent points per game (OPP), a string with two decimals; parsed to a number. |
#' | fg | double | Field-goal percentage 0-100 with a '%' sign, a string ('41.99%'); parsed to a number. |
#' | opp_fg | double | Opponents' field-goal percentage 0-100 with '%', a string; parsed to a number. |
#' | p3pg | double | Three-pointers made per game (3PPG), a string; parsed to a number. |
#' | rpg | double | Rebounds per game, a string; parsed to a number. |
#' | apg | double | Assists per game, a string; parsed to a number. |
#' | spg | double | Steals per game, a string; parsed to a number. |
#' | bpg | double | Blocks per game, a string; parsed to a number. |
#' | tpg | double | Turnovers per game, a string; parsed to a number. |
#' | gpd | double | Point differential summed over the season (GPD), NOT per game: (ppg - opp) x games ('193.00'), a string; parsed to a number. |
#' | win_point | character | Unobserved: null in every sample, so no type and no meaning is claimed. (By the site's JS: league points, a column shown only when filled.) |
#' | unsatisfied | character | Unobserved: null in every sample, so no type and no meaning is claimed. (By the site's JS: a column shown only when filled; meaning unverified.) |
#' @inherit wjbl_leagues details
#' @examples
#' \donttest{
#'   try(wjbl_team_ranking(season_ids = "169,170"))
#' }
#' @export
#' @family WJBL Functions
wjbl_team_ranking <- function(season_ids) {
  withr::local_options(list(scipen = 999, stringsAsFactors = FALSE))
  raw <- .wjbl_get("/team-ranking", list(season_ids = season_ids), call = rlang::current_env())
  .wjbl_out(.wjbl_parse_team_ranking(raw), "W League Team Ranking from api.wjbl.01core.app")
}

#' @title
#' **Get W League Teams**
#' @description
#' Every franchise (team_id) the site knows, all-star sides included.
#'
#' Endpoint: `GET https://api.wjbl.01core.app/api/teams/base`
#' @return
#' A `wehoop_data` tibble, one row per record; the columns are always these, in this order
#'   (sdv-py `wjbl_teams`):
#'
#' | col_name | type | description |
#' |:---|:---|:---|
#' | team_id | integer | Franchise id team_id (key space: W League franchises, STABLE across seasons and sponsor renames: 13 = Toyota Antelopes, 12 = Denso Iris, 8 = ENEOS Sunflowers; all-star sides have their own ids, e.g. 591). The team_id of /team/roster and of the site's /team/roster/?team_id=. Not season_team_id. |
#' | team_name | character | Franchise name, Japanese or English (Fujitsu Red Wave; all-star side Team Sirius). |
#' @inherit wjbl_leagues details
#' @examples
#' \donttest{
#'   try(wjbl_teams())
#' }
#' @export
#' @family WJBL Functions
wjbl_teams <- function() {
  withr::local_options(list(scipen = 999, stringsAsFactors = FALSE))
  raw <- .wjbl_get("/teams/base", list(), call = rlang::current_env())
  .wjbl_out(.wjbl_parse_teams(raw), "W League Teams from api.wjbl.01core.app")
}

#' @title
#' **Get W League Roster**
#' @description
#' Players of a team in a season phase, with the head coach.
#'
#' Endpoint: `GET https://api.wjbl.01core.app/api/team/roster`
#' @param team_id Franchise id (team_id in wjbl_teams): stable across seasons and sponsor renames, e.g. 13 (Toyota
#'   Antelopes).
#' @param season_id Season phase id (season_id in wjbl_standing_seasons), e.g. 169 (2025-26 regular season, Premier
#'   division).
#' @return
#' A `wehoop_data` tibble, one row per record; the columns are always these, in this order
#'   (sdv-py `wjbl_roster`):
#'
#' | col_name | type | description |
#' |:---|:---|:---|
#' | league_id | integer | Competition-edition id league_id (key space: W League competitions; sequential, ONE id per season of the league AND per all-star game, cup or camp: 45 = '25-26 W League', 47 = '26-27', 20 = '13-14', 46 = All-Star 2025-26). The league_id parameter of /play-schedules and /play-schedule-months; enumerate with /leagues. The sdv season is the END year of league_title (END = 2000 + the second YY: '25-26' -> 2026, '99-00' -> 2000). |
#' | league_title | character | Competition-edition title in Japanese: '25-26 W League' = 2025-26 W League (sdv END year 2026; END = 2000 + the second YY: '25-26' -> 2026, '99-00' -> 2000); also All-Star game, Autumn Cup, Summer Camp, 'W League SUPERGAMES'. |
#' | season | integer | Season END year (2025-26 = 2026, 1999-2000 = 2000) from league_title ('25-26 W League'); null for an all-star game, cup or camp. |
#' | season_id | integer | The season_id asked for: Season-phase id season_id (key space: phases WITHIN a league_id, e.g. 169 = 25-26 regular season Premier, 170 = 25-26 regular season Future, 176 = 25-26 playoff final). Not a year: one league_id has several season_ids. The season_ids parameter of /team-standings and /team-ranking and the season_id of /team/roster. |
#' | season_full_name | character | league_title + phase (+ division) in Japanese: 2025-26 regular season, Premier division (Future division, from 2024-25). |
#' | season_team_id | integer | Team-season registration id (key space: one per team per season phase; 1343 = Toyota in season 169). Not team_id. |
#' | team_id | integer | The team_id asked for: Franchise id team_id (key space: W League franchises, STABLE across seasons and sponsor renames: 13 = Toyota Antelopes, 12 = Denso Iris, 8 = ENEOS Sunflowers; all-star sides have their own ids, e.g. 591). The team_id of /team/roster and of the site's /team/roster/?team_id=. Not season_team_id. |
#' | coach_id | integer | Head-coach id (key space: W League coaches; the coach_id of /coach and of the site's /coach/?coach_id=). |
#' | coach_name | character | Head coach name, Japanese. |
#' | team_comment | character | Free text the league shows with the roster (captains and other notes, HTML with `<br>`), as sent. |
#' | player_id | integer | Player id player_id (key space: W League persons, STABLE across seasons and teams). The player_id of /player and the pi= of the site's /player/detail?pi=; joins the play-by-play player_id1 / player_id2. |
#' | player_name | character | Player name, Japanese. |
#' | player_number | character | Shirt number, a string. |
#' | captain_flg | integer | Captain: 1 = yes, 0 = no. |
#' | sub_captain_flg | integer | Vice-captain: 1 = yes, 0 = no. |
#' | transfer_flg | integer | Transferred in this season ((Japanese) icon): 1 = yes, 0 = no. |
#' | position | character | Playing position (G / F / C style code); empty in every sampled row. |
#' | rookie | integer | Rookie ((Japanese) icon): 1 = yes, 0 = no. |
#' | early_entry | integer | Early-entry player ((Japanese), a student who joined before graduating): 1 = yes, 0 = no. |
#' | picture | character | Player photo path relative to https://www.wjbl.org. |
#' | foreign_national_flg | integer | Foreign national ((Japanese) icon): 1 = yes, 0 = no. |
#' | naturalized_flg | integer | Naturalised player ((Japanese) icon): 1 = yes, 0 = no. |
#' @inherit wjbl_leagues details
#' @examples
#' \donttest{
#'   try(wjbl_roster(season_id = 169, team_id = 13))
#' }
#' @export
#' @family WJBL Functions
wjbl_roster <- function(team_id, season_id = NULL) {
  withr::local_options(list(scipen = 999, stringsAsFactors = FALSE))
  raw <- .wjbl_get("/team/roster", list(team_id = team_id, season_id = season_id), call = rlang::current_env())
  .wjbl_out(.wjbl_parse_roster(raw), "W League Roster from api.wjbl.01core.app")
}

#' @title
#' **Get W League Staff**
#' @description
#' Staff of a team in a season phase (general manager, assistant coaches, support staff).
#'
#' Endpoint: `GET https://api.wjbl.01core.app/api/team/roster`
#' @param team_id Franchise id (team_id in wjbl_teams): stable across seasons and sponsor renames, e.g. 13 (Toyota
#'   Antelopes).
#' @param season_id Season phase id (season_id in wjbl_standing_seasons), e.g. 169 (2025-26 regular season, Premier
#'   division).
#' @return
#' A `wehoop_data` tibble, one row per record; the columns are always these, in this order
#'   (sdv-py `wjbl_staff`):
#'
#' | col_name | type | description |
#' |:---|:---|:---|
#' | league_id | integer | Competition-edition id league_id (key space: W League competitions; sequential, ONE id per season of the league AND per all-star game, cup or camp: 45 = '25-26 W League', 47 = '26-27', 20 = '13-14', 46 = All-Star 2025-26). The league_id parameter of /play-schedules and /play-schedule-months; enumerate with /leagues. The sdv season is the END year of league_title (END = 2000 + the second YY: '25-26' -> 2026, '99-00' -> 2000). |
#' | league_title | character | Competition-edition title in Japanese: '25-26 W League' = 2025-26 W League (sdv END year 2026; END = 2000 + the second YY: '25-26' -> 2026, '99-00' -> 2000); also All-Star game, Autumn Cup, Summer Camp, 'W League SUPERGAMES'. |
#' | season | integer | Season END year (2025-26 = 2026, 1999-2000 = 2000) from league_title ('25-26 W League'); null for an all-star game, cup or camp. |
#' | season_id | integer | The season_id asked for: Season-phase id season_id (key space: phases WITHIN a league_id, e.g. 169 = 25-26 regular season Premier, 170 = 25-26 regular season Future, 176 = 25-26 playoff final). Not a year: one league_id has several season_ids. The season_ids parameter of /team-standings and /team-ranking and the season_id of /team/roster. |
#' | season_full_name | character | league_title + phase (+ division) in Japanese: 2025-26 regular season, Premier division (Future division, from 2024-25). |
#' | season_team_id | integer | Team-season registration id (key space: one per team per season phase; 1343 = Toyota in season 169). Not team_id. |
#' | team_id | integer | The team_id asked for: Franchise id team_id (key space: W League franchises, STABLE across seasons and sponsor renames: 13 = Toyota Antelopes, 12 = Denso Iris, 8 = ENEOS Sunflowers; all-star sides have their own ids, e.g. 591). The team_id of /team/roster and of the site's /team/roster/?team_id=. Not season_team_id. |
#' | staff_name | character | Staff member name, Japanese. |
#' | position | character | Staff role, Japanese: (Japanese) associate head coach, (Japanese) assistant coach, (Japanese) general manager, (Japanese) team director, (Japanese) support staff. |
#' | url | character | Link attached to the staff entry; empty in most rows. |
#' @inherit wjbl_leagues details
#' @examples
#' \donttest{
#'   try(wjbl_staff(season_id = 169, team_id = 13))
#' }
#' @export
#' @family WJBL Functions
wjbl_staff <- function(team_id, season_id = NULL) {
  withr::local_options(list(scipen = 999, stringsAsFactors = FALSE))
  raw <- .wjbl_get("/team/roster", list(team_id = team_id, season_id = season_id), call = rlang::current_env())
  .wjbl_out(.wjbl_parse_staff(raw), "W League Staff from api.wjbl.01core.app")
}

#' @title
#' **Get W League Player**
#' @description
#' Player profile: current team, names, bio and career notes, one row.
#'
#' Endpoint: `GET https://api.wjbl.01core.app/api/player`
#' @param player_id Player id (player_id in wjbl_box_score or wjbl_roster): the person, stable across seasons, e.g.
#'   9799.
#' @return
#' A `wehoop_data` tibble, one row per record; the columns are always these, in this order
#'   (sdv-py `wjbl_player`):
#'
#' | col_name | type | description |
#' |:---|:---|:---|
#' | player_id | integer | Player id player_id (key space: W League persons, STABLE across seasons and teams). The player_id of /player and the pi= of the site's /player/detail?pi=; joins the play-by-play player_id1 / player_id2. |
#' | player_name | character | Name in Japanese, 'SURNAME GIVEN'. |
#' | player_name_en | character | Name in romaji, uppercase, 'SURNAME GIVEN' ('OKAMOTO MIYUU'). |
#' | player_furigana | character | Name reading in hiragana ((Japanese text)). |
#' | team_id | integer | Current (or last) team: Franchise id team_id (key space: W League franchises, STABLE across seasons and sponsor renames: 13 = Toyota Antelopes, 12 = Denso Iris, 8 = ENEOS Sunflowers; all-star sides have their own ids, e.g. 591). The team_id of /team/roster and of the site's /team/roster/?team_id=. Not season_team_id. |
#' | season_team_name | character | Team name as registered for the season, in Japanese (company + nickname: Toyota Antelopes). |
#' | season_team_short_name | character | Short team name for that season, Japanese (Toyota). |
#' | season_team_player_number | character | Shirt number this season, a string. |
#' | team_logo_image | character | Team logo path, relative to https://www.wjbl.org ('/static/images/base_team/...png' or '/assets/img/team/...png'). |
#' | team_url | character | Team's own website URL. |
#' | player_birthday | character | Date of birth 'YYYY/MM/DD' (public player bio). |
#' | player_nickname | character | Nickname, Japanese. |
#' | player_position | character | Playing position code ('PG', 'SG', 'SF', 'PF', 'C'). |
#' | player_home_town | character | Home prefecture, Japanese (Hokkaido). |
#' | player_height | character | Height with unit, a string ('179cm'). |
#' | player_weight | character | Weight with unit, a string ('77kg'). |
#' | player_height_cm | integer | Height in whole centimetres, parsed from player_height ('179cm'). |
#' | player_weight_kg | integer | Weight in whole kilograms, parsed from player_weight ('77kg'). |
#' | player_affiliation_history | character | Career path, Japanese, (Japanese text)-separated (mini-basketball club (Japanese) junior high (Japanese) high school (Japanese) university (Japanese) team). |
#' | player_independent_flg | integer | Retired flag (the site greys the team and hides the number): 1 = retired / no longer registered, 0 = active. |
#' | player_national_team | character | National-team history, Japanese free text (Universiade). |
#' | player_awards | character | Awards and honours, Japanese free text. |
#' | player_coach_history | character | Coaching history (for players who became coaches); empty string in the sample. |
#' | player_coach_record | character | Coaching record; empty string in the sample. |
#' | player_picture | character | Photo path relative to https://www.wjbl.org. |
#' | player_wjbl_flg | integer | 1 = a W League player (0 presumably for others; unverified). |
#' | player_rookie | integer | Rookie ((Japanese) icon): 1 = yes, 0 = no. |
#' | player_early_entry | integer | Early-entry player ((Japanese), a student who joined before graduating): 1 = yes, 0 = no. |
#' | player_foreign_national_flg | integer | Foreign national ((Japanese) icon): 1 = yes, 0 = no. |
#' | player_naturalized_flg | integer | Naturalised player ((Japanese) icon): 1 = yes, 0 = no. |
#' | player_appeal | character | Self-introduction text; empty string in the sample. |
#' | player_championships | character | Championships text; empty string in the sample. |
#' | player_url | character | Personal website URL; empty string in the sample. |
#' | player_facebook_url | character | Facebook URL; empty string in the sample. |
#' | player_twitter_url | character | X (Twitter) URL; empty string in the sample. |
#' | player_instagram_url | character | Instagram URL; empty string in the sample. |
#' @inherit wjbl_leagues details
#' @examples
#' \donttest{
#'   try(wjbl_player(player_id = 9799))
#' }
#' @export
#' @family WJBL Functions
wjbl_player <- function(player_id) {
  withr::local_options(list(scipen = 999, stringsAsFactors = FALSE))
  raw <- .wjbl_get("/player", list(player_id = player_id), call = rlang::current_env())
  .wjbl_out(.wjbl_parse_player(raw), "W League Player from api.wjbl.01core.app")
}
