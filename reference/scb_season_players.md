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
this order (sportsdataverse-py `scb_season_players`):

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

Source, terms of use, request pacing, seasons, ids, coverage and error
classes of this family: see the notes in
[`scb_seasons()`](https://wehoop.sportsdataverse.org/reference/scb_seasons.md).

## See also

[family_scb](https://wehoop.sportsdataverse.org/reference/family_scb.md)
lists every function in this family.

## Examples

``` r
# \donttest{
  try(scb_season_players(season = 2026))
#> ── BBL/DBBL Season Players from the SCB API ──────────────────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-09 11:39:04 UTC
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
