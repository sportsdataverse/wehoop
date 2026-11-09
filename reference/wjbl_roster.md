# **Get W League Roster**

Players of a team in a season phase, with the head coach.

Endpoint: `GET https://api.wjbl.01core.app/api/team/roster`

## Usage

``` r
wjbl_roster(team_id, season_id = NULL)
```

## Arguments

- team_id:

  Franchise id (team_id in wjbl_teams): stable across seasons and
  sponsor renames, e.g. 13 (Toyota Antelopes).

- season_id:

  Season phase id (season_id in wjbl_standing_seasons), e.g. 169
  (2025-26 regular season, Premier division).

## Value

A `wehoop_data` tibble, one row per record; the columns are always
these, in this order (sportsdataverse-py `wjbl_roster`):

|  |  |  |
|----|----|----|
| col_name | type | description |
| league_id | integer | Competition-edition id league_id (key space: W League competitions; sequential, ONE id per season of the league AND per all-star game, cup or camp: 45 = '25-26 W League', 47 = '26-27', 20 = '13-14', 46 = All-Star 2025-26). The league_id parameter of /play-schedules and /play-schedule-months; enumerate with /leagues. The sdv season is the END year of league_title (END = 2000 + the second YY: '25-26' -\> 2026, '99-00' -\> 2000). |
| league_title | character | Competition-edition title in Japanese: '25-26 W League' = 2025-26 W League (sdv END year 2026; END = 2000 + the second YY: '25-26' -\> 2026, '99-00' -\> 2000); also All-Star game, Autumn Cup, Summer Camp, 'W League SUPERGAMES'. |
| season | integer | Season END year (2025-26 = 2026, 1999-2000 = 2000) from league_title ('25-26 W League'); null for an all-star game, cup or camp. |
| season_id | integer | The season_id asked for: Season-phase id season_id (key space: phases WITHIN a league_id, e.g. 169 = 25-26 regular season Premier, 170 = 25-26 regular season Future, 176 = 25-26 playoff final). Not a year: one league_id has several season_ids. The season_ids parameter of /team-standings and /team-ranking and the season_id of /team/roster. |
| season_full_name | character | league_title + phase (+ division) in Japanese: 2025-26 regular season, Premier division (Future division, from 2024-25). |
| season_team_id | integer | Team-season registration id (key space: one per team per season phase; 1343 = Toyota in season 169). Not team_id. |
| team_id | integer | The team_id asked for: Franchise id team_id (key space: W League franchises, STABLE across seasons and sponsor renames: 13 = Toyota Antelopes, 12 = Denso Iris, 8 = ENEOS Sunflowers; all-star sides have their own ids, e.g. 591). The team_id of /team/roster and of the site's /team/roster/?team_id=. Not season_team_id. |
| coach_id | integer | Head-coach id (key space: W League coaches; the coach_id of /coach and of the site's /coach/?coach_id=). |
| coach_name | character | Head coach name, Japanese. |
| team_comment | character | Free text the league shows with the roster (captains and other notes, HTML with `<br>`), as sent. |
| player_id | integer | Player id player_id (key space: W League persons, STABLE across seasons and teams). The player_id of /player and the pi= of the site's /player/detail?pi=; joins the play-by-play player_id1 / player_id2. |
| player_name | character | Player name, Japanese. |
| player_number | character | Shirt number, a string. |
| captain_flg | integer | Captain: 1 = yes, 0 = no. |
| sub_captain_flg | integer | Vice-captain: 1 = yes, 0 = no. |
| transfer_flg | integer | Transferred in this season ((Japanese) icon): 1 = yes, 0 = no. |
| position | character | Playing position (G / F / C style code); empty in every sampled row. |
| rookie | integer | Rookie ((Japanese) icon): 1 = yes, 0 = no. |
| early_entry | integer | Early-entry player ((Japanese), a student who joined before graduating): 1 = yes, 0 = no. |
| picture | character | Player photo path relative to https://www.wjbl.org. |
| foreign_national_flg | integer | Foreign national ((Japanese) icon): 1 = yes, 0 = no. |
| naturalized_flg | integer | Naturalised player ((Japanese) icon): 1 = yes, 0 = no. |

## Details

Source, terms of use, request pacing, seasons, ids, coverage and error
classes of this family: see the notes in
[`wjbl_leagues()`](https://wehoop.sportsdataverse.org/reference/wjbl_leagues.md).

     wjbl_roster(season_id = 169, team_id = 13)

## See also

[family_wjbl](https://wehoop.sportsdataverse.org/reference/family_wjbl.md)
lists every function in this family.
