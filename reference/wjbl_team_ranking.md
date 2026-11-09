# **Get W League Team Ranking**

League table with per-game team averages (points, shooting, rebounds,
assists) of one or more season phases.

Endpoint: `GET https://api.wjbl.01core.app/api/team-ranking`

## Usage

``` r
wjbl_team_ranking(season_ids)
```

## Arguments

- season_ids:

  Season phase id or ids (season_id in wjbl_standing_seasons; a phase
  inside a league edition, not a year): an integer, a list or a comma
  string such as '169,170' (2025-26 regular season Premier and Future
  divisions).

## Value

A `wehoop_data` tibble, one row per record; the columns are always
these, in this order (sportsdataverse-py `wjbl_team_ranking`):

|  |  |  |
|----|----|----|
| col_name | type | description |
| league_id | integer | Competition-edition id league_id (key space: W League competitions; sequential, ONE id per season of the league AND per all-star game, cup or camp: 45 = '25-26 W League', 47 = '26-27', 20 = '13-14', 46 = All-Star 2025-26). The league_id parameter of /play-schedules and /play-schedule-months; enumerate with /leagues. The sdv season is the END year of league_title (END = 2000 + the second YY: '25-26' -\> 2026, '99-00' -\> 2000). |
| league_title | character | Competition-edition title in Japanese: '25-26 W League' = 2025-26 W League (sdv END year 2026; END = 2000 + the second YY: '25-26' -\> 2026, '99-00' -\> 2000); also All-Star game, Autumn Cup, Summer Camp, 'W League SUPERGAMES'. |
| season | integer | Season END year (2025-26 = 2026, 1999-2000 = 2000) from league_title ('25-26 W League'); null for an all-star game, cup or camp. |
| season_id | integer | Season-phase id season_id (key space: phases WITHIN a league_id, e.g. 169 = 25-26 regular season Premier, 170 = 25-26 regular season Future, 176 = 25-26 playoff final). Not a year: one league_id has several season_ids. The season_ids parameter of /team-standings and /team-ranking and the season_id of /team/roster. |
| season_title | character | Phase title in Japanese: regular season, (Japanese text) / playoff final, playoff semifinal (the separator varies by era). |
| season_full_name | character | league_title + phase (+ division) in Japanese: 2025-26 regular season, Premier division (Future division, from 2024-25). |
| season_league_name | character | Phase / division label in Japanese: Premier, Future, group stage, second round, lower league; empty for a single-table phase. |
| season_league_flg | integer | Division layout flag: 1 = one table per division (Premier / Future), 2 = split by season_team_area (East / West, by the site's JS), 0 = cup / group stage. |
| season_league_img | character | Division badge image path relative to https://www.wjbl.org. |
| season_tournament_text | character | Tournament text (HTML); empty in every sample. |
| update_info | character | As-of note in Japanese, (Japanese text) (as of 8 Feb 2026). |
| team_id | integer | Franchise id team_id (key space: W League franchises, STABLE across seasons and sponsor renames: 13 = Toyota Antelopes, 12 = Denso Iris, 8 = ENEOS Sunflowers; all-star sides have their own ids, e.g. 591). The team_id of /team/roster and of the site's /team/roster/?team_id=. Not season_team_id. |
| season_team_name | character | Team name as registered for the season, in Japanese (company + nickname: Toyota Antelopes). |
| season_team_short_name | character | Short team name for that season, Japanese (Toyota). |
| team_entry_flg | integer | Official-league participant flag: 1 = a W League member team (the site links its roster), 0 = not (guest or all-star side). Integer. |
| position | integer | Rank of the team in the phase (a string on the wire). |
| season_team_area | character | Unobserved: null in every sample, so no type and no meaning is claimed. (By the site's standings JS: 0 = East, 1 = West conference when season_league_flg = 2.) |
| win | integer | Wins, integer. |
| lost | integer | Losses, integer. |
| winning_rate | double | Winning percentage as a FRACTION 0-1 with three decimals, a string ('0.821'); parsed to a number. |
| ppg | double | Points per game, a string with two decimals; parsed to a number. |
| opp | double | Opponent points per game (OPP), a string with two decimals; parsed to a number. |
| fg | double | Field-goal percentage 0-100 with a '%' sign, a string ('41.99%'); parsed to a number. |
| opp_fg | double | Opponents' field-goal percentage 0-100 with '%', a string; parsed to a number. |
| p3pg | double | Three-pointers made per game (3PPG), a string; parsed to a number. |
| rpg | double | Rebounds per game, a string; parsed to a number. |
| apg | double | Assists per game, a string; parsed to a number. |
| spg | double | Steals per game, a string; parsed to a number. |
| bpg | double | Blocks per game, a string; parsed to a number. |
| tpg | double | Turnovers per game, a string; parsed to a number. |
| gpd | double | Point differential summed over the season (GPD), NOT per game: (ppg - opp) x games ('193.00'), a string; parsed to a number. |
| win_point | character | Unobserved: null in every sample, so no type and no meaning is claimed. (By the site's JS: league points, a column shown only when filled.) |
| unsatisfied | character | Unobserved: null in every sample, so no type and no meaning is claimed. (By the site's JS: a column shown only when filled; meaning unverified.) |

## Details

Source, terms of use, request pacing, seasons, ids, coverage and error
classes of this family: see the notes in
[`wjbl_leagues()`](https://wehoop.sportsdataverse.org/reference/wjbl_leagues.md).

     wjbl_team_ranking(season_ids = "169,170")

## See also

[family_wjbl](https://wehoop.sportsdataverse.org/reference/family_wjbl.md)
lists every function in this family.
