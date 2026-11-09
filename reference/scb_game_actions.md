# **Get BBL / DBBL Game Play-by-Play**

Play-by-play of a finished game with shot x/y (BBL 2008-09 on, DBBL
2024-25 on).

Endpoint:
`GET https://api.basketball-bundesliga.de/games/{game_id}/stats` (DBBL:
the same route on `https://api-1.dbbl.scb.world`).

## Usage

``` r
scb_game_actions(game_id, league = "dbbl")
```

## Arguments

- game_id:

  (required) Game id (`game_id` in `scb_games`), e.g. 2006920 (BBL) or
  10130 (DBBL). One sequence per league.

- league:

  (default `"dbbl"`, the women's DBBL) League: `bbl` (men, easyCredit
  Basketball Bundesliga, api.basketball-bundesliga.de) or `dbbl` (women,
  Toyota Damen-Basketball-Bundesliga, api-1.dbbl.scb.world). The two
  share one API; game ids overlap, so a game is (league, game_id).

## Value

A `wehoop_data` tibble: Play-by-play of a finished game with shot x/y
(BBL 2008-09 on, DBBL 2024-25 on). An empty valid answer raises
`wehoop_no_data`; the columns are always these, in this order
(sportsdataverse-py `scb_game_actions`):

|  |  |  |
|----|----|----|
| col_name | type | description |
| league | character | League the row belongs to: `bbl` (men) or `dbbl` (women); BBL and DBBL game ids overlap, so a game is (league, game_id). |
| game_id | character | Game id, a string; unique within a league only (BBL and DBBL overlap), and not chronological. |
| action_id | integer | Action id, an integer unique across games of a league. |
| order_id | integer | Chronological sequence of the action within the game. |
| action_identifier | character | Provider action key `<n>:<seq>` (opaque; the first part is not the period). |
| period | integer | Period: 1-4 quarters, 5+ overtimes. |
| game_time | character | Game clock as HH:MM:SS: in an action, the time LEFT in the period (00:10:00 at the start of a 10-minute quarter); in a game header, 00:00:00 in every sample. |
| seconds_left | integer | Seconds left in the period at the action: `game_time` as seconds. |
| real_time | character | Wall-clock time of the action, ISO 8601 UTC. Pre-2011 games carry a placeholder: local midnight of the game day (23:00 UTC the day before) on every row. |
| type | character | Action type; see the action-type table. Records and videos use their own `type` (see those routes). |
| qualifiers | character | Action qualifiers (shot kind, rebound side, foul kind, turnover kind); see the qualifier table. |
| is_successful | logical | Made / successful (shots, free throws); for other types see the action-type table. |
| season_team_id | character | Season-team id; equal to the club `teamId` in every sample (BBL 2005-2026, DBBL 2024-2026). |
| side | character | `home` or `guest` (the away side), for the team the row belongs to. |
| season_player_id | character | Season-player id: one player's engagement with one club (kept across seasons while he stays, new after a move; see README). Joins to box-score `seasonPlayer.id`, action `seasonPlayerId` and `/season-players/{seasonPlayerId}`. Null on team and period rows. |
| assisting_season_player_id | character | Season-player id of the assisting player; only on assisted made shots. Joins to box-score `seasonPlayer.id` and action `seasonPlayerId`. |
| shot_x | integer | Shot x on the site's half-court chart (0-280 across, 140 through the rim); null without a location. Scale and orientation unverified. |
| shot_y | integer | Shot y along the court from behind the baseline (rim near 45, arc top near 147); null without a location. Scale and orientation unverified. |
| home_team_points | integer | Home score after this action; only on scoring actions. |
| guest_team_points | integer | Guest score after this action; only on scoring actions. |

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
  try(scb_game_actions(game_id = "2006920"))
#> Error in scb_game_actions(game_id = "2006920") : 
#>   api-1.dbbl.scb.world/games/2006920/stats answered HTTP 204: no content
#> for this id.
# }
```
