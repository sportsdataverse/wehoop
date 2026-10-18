# **Get BBL / DBBL Season Players**

Every player registered in a season: the id crosswalk (season_player_id,
real_player_id, season_team_id).

Endpoint: `GET https://api.basketball-bundesliga.de/seasons/{season}`
(DBBL: the same route on `https://api-1.dbbl.scb.world`).

## Usage

``` r
scb_season_players(season, league = "dbbl")
```

## Arguments

- season:

  (required) Season END year (2026 = 2025-26, the sdv key). Sent to the
  API as its START-year seasonId (season - 1).

- league:

  (default `"dbbl"`, the women's DBBL) League: `bbl` (men, easyCredit
  Basketball Bundesliga, api.basketball-bundesliga.de) or `dbbl` (women,
  Toyota Damen-Basketball-Bundesliga, api-1.dbbl.scb.world). The two
  share one API; game ids overlap, so a game is (league, game_id).

## Value

A `wehoop_data` tibble: Every player registered in a season: the id
crosswalk (season_player_id, real_player_id, season_team_id). An empty
valid answer raises `wehoop_no_data`; the columns are always these, in
this order (sdv-py `scb_season_players`):

|  |  |  |
|----|----|----|
| col_name | type | description |
| league | character | League the row belongs to: `bbl` (men) or `dbbl` (women); BBL and DBBL game ids overlap, so a game is (league, game_id). |
| season | integer | Season END year (2026 = 2025-26), the sdv key; the API's `season_id` plus one. |
| season_id | integer | The API's own season key, the START year (2025 = 2025-26); `season` minus one. |
| season_player_id | character | Season-player id: one player's engagement with one club (kept across seasons while he stays, new after a move; see README). Joins to box-score `seasonPlayer.id`, action `seasonPlayerId` and `/season-players/{seasonPlayerId}`. |
| real_player_id | integer | Global person id: the same across clubs and seasons. Joins to `realPlayerId` everywhere. |
| season_team_id | character | Season-team id; equal to the club `teamId` in every sample (BBL 2005-2026, DBBL 2024-2026). |
| first_name | character | Player's given name. |
| last_name | character | Player's family name. |

## Details

- Unofficial use of a public source: these wrappers read the front-end
  API of the German Bundesliga sites (easycredit-bbl.de,
  toyota-dbbl.de), run by SCB; payloads are not redistributed as release
  assets.

- Legal notice: the BBL Impressum forbids storing BBL content
  (`Inhalte`) in an information system without BBL's written permission.
  That is a copyright term, not a robots rule (the API host has no
  robots.txt). The owner reviewed it and accepted the intake (2026-10-12
  ruling); keep requests slow (the runtime waits at least 1 s per host)
  and raise any published data release with the owner. The DBBL host is
  the same operator and API; its site notice was not separately
  reviewed.

- Both hosts need two headers: a constant `x-api-key` and an
  `x-api-secret` that rotates. The runtime derives the secret on first
  use from the key embedded in an easycredit-bbl.de page (reversed, `:`
  turned into `-`) and never logs or returns it. The derivation was
  reverse-engineered from observed requests and responses and has not
  been checked against the site's own front-end code; if the site
  changes how it signs requests, every call fails with
  `wehoop_asset_fetch`.

- Id key spaces: seasonId is the START year (2025 = 2025-26), so a
  wrapper's END-year `season` is sent as `season - 1`. Teams are keyed
  by teamId (seasonTeamId equals it in every sample). seasonPlayerId is
  per player per season and per club (a player traded mid-season has
  two); realPlayerId is the person. playerId is ambiguous (the
  seasonPlayerId in box scores, records and /season-players; the person
  in /transfers). Game ids are strings.

- Errors are classed conditions: `wehoop_no_data` (404, 204, a 400 "not
  a valid" id, no rows, a box score of a game not yet started),
  `wehoop_bad_request` (a bad argument, another 400 / 422) and
  `wehoop_asset_fetch` (a refused secret after one re-derive, any other
  non-2xx, an HTML / non-JSON / error-shaped body, a truncated page, a
  body for another game, season, club or league, a box score still in
  play), all inheriting `wehoop_error`. Wrappers raise; they never
  return an empty frame.

## See also

Other SCB Functions:
[`scb_game()`](https://wehoop.sportsdataverse.org/reference/scb_game.md),
[`scb_game_actions()`](https://wehoop.sportsdataverse.org/reference/scb_game_actions.md),
[`scb_game_players()`](https://wehoop.sportsdataverse.org/reference/scb_game_players.md),
[`scb_game_teams()`](https://wehoop.sportsdataverse.org/reference/scb_game_teams.md),
[`scb_games()`](https://wehoop.sportsdataverse.org/reference/scb_games.md),
[`scb_games_recent()`](https://wehoop.sportsdataverse.org/reference/scb_games_recent.md),
[`scb_player_statistics()`](https://wehoop.sportsdataverse.org/reference/scb_player_statistics.md),
[`scb_playoff_games()`](https://wehoop.sportsdataverse.org/reference/scb_playoff_games.md),
[`scb_playoff_series()`](https://wehoop.sportsdataverse.org/reference/scb_playoff_series.md),
[`scb_records_per_game()`](https://wehoop.sportsdataverse.org/reference/scb_records_per_game.md),
[`scb_records_season_averages()`](https://wehoop.sportsdataverse.org/reference/scb_records_season_averages.md),
[`scb_referees()`](https://wehoop.sportsdataverse.org/reference/scb_referees.md),
[`scb_season_player()`](https://wehoop.sportsdataverse.org/reference/scb_season_player.md),
[`scb_season_teams()`](https://wehoop.sportsdataverse.org/reference/scb_season_teams.md),
[`scb_seasons()`](https://wehoop.sportsdataverse.org/reference/scb_seasons.md),
[`scb_standings()`](https://wehoop.sportsdataverse.org/reference/scb_standings.md),
[`scb_team()`](https://wehoop.sportsdataverse.org/reference/scb_team.md),
[`scb_team_rosters()`](https://wehoop.sportsdataverse.org/reference/scb_team_rosters.md),
[`scb_team_seasons()`](https://wehoop.sportsdataverse.org/reference/scb_team_seasons.md),
[`scb_team_statistics()`](https://wehoop.sportsdataverse.org/reference/scb_team_statistics.md),
[`scb_transfers()`](https://wehoop.sportsdataverse.org/reference/scb_transfers.md),
[`scb_transfers_teams()`](https://wehoop.sportsdataverse.org/reference/scb_transfers_teams.md)

## Examples

``` r
# \donttest{
  try(scb_season_players(season = 2026))
#> ── BBL/DBBL Season Players from the SCB API ──────────────────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-10-18 20:10:20 UTC
#> # A tibble: 124 × 8
#>    league season season_id season_player_id real_player_id season_team_id
#>    <chr>   <int>     <int> <chr>                     <int> <chr>         
#>  1 dbbl     2026      2025 20565                     10527 102           
#>  2 dbbl     2026      2025 20633                     10403 109           
#>  3 dbbl     2026      2025 20347                     10336 100           
#>  4 dbbl     2026      2025 20348                     10337 100           
#>  5 dbbl     2026      2025 20349                     10338 100           
#>  6 dbbl     2026      2025 20353                     10342 100           
#>  7 dbbl     2026      2025 20354                     10343 100           
#>  8 dbbl     2026      2025 20357                     10346 100           
#>  9 dbbl     2026      2025 20358                     10347 100           
#> 10 dbbl     2026      2025 20360                     10349 100           
#> # ℹ 114 more rows
#> # ℹ 2 more variables: first_name <chr>, last_name <chr>
# }
```
