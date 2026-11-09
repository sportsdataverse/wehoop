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
these, in this order (sportsdataverse-py `wjbl_head_to_head`):

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

Source, terms of use, request pacing, seasons, ids, coverage and error
classes of this family: see the notes in
[`wjbl_leagues()`](https://wehoop.sportsdataverse.org/reference/wjbl_leagues.md).

     wjbl_head_to_head(season_ids = "169")

## See also

[family_wjbl](https://wehoop.sportsdataverse.org/reference/family_wjbl.md)
lists every function in this family.
