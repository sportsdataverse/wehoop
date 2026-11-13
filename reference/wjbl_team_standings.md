# **Get W League Team Standings**

League table of one or more season phases: rank and record of every
team.

Endpoint: `GET https://api.wjbl.01core.app/api/team-standings`

## Usage

``` r
wjbl_team_standings(season_ids)
```

## Arguments

- season_ids:

  Season phase id or ids (season_id in wjbl_standing_seasons; a phase
  inside a league edition, not a year): an integer, a list or a comma
  string such as '169,170' (2025-26 regular season Premier and Future
  divisions).

## Value

A `wehoop_data` tibble, one row per record; the columns are always
these, in this order (sportsdataverse-py `wjbl_team_standings`):

|  |  |  |
|----|----|----|
| col_name | type | description |
| season_id | integer | Season-phase id season_id (key space: phases WITHIN a league_id, e.g. 169 = 25-26 regular season Premier, 170 = 25-26 regular season Future, 176 = 25-26 playoff final). Not a year: one league_id has several season_ids. The season_ids parameter of /team-standings and /team-ranking and the season_id of /team/roster. |
| season_title | character | Phase title in Japanese: regular season, (Japanese text) / playoff final, playoff semifinal (the separator varies by era). |
| league_name | character | Division name, Japanese (Premier). |
| season_league_name | character | Phase / division label in Japanese: Premier, Future, group stage, second round, lower league; empty for a single-table phase. |
| season_league_flg | integer | Division layout flag: 1 = one table per division (Premier / Future), 2 = split by season_team_area (East / West, by the site's JS), 0 = cup / group stage. |
| update_date | character | As-of date in Japanese, (Japanese text). |
| team_id | integer | Franchise id team_id (key space: W League franchises, STABLE across seasons and sponsor renames: 13 = Toyota Antelopes, 12 = Denso Iris, 8 = ENEOS Sunflowers; all-star sides have their own ids, e.g. 591). The team_id of /team/roster and of the site's /team/roster/?team_id=. Not season_team_id. |
| season_team_name | character | Team name as registered for the season, in Japanese (company + nickname: Toyota Antelopes). |
| season_team_short_name | character | Short team name for that season, Japanese (Toyota). |
| team_entry_flg | integer | Official-league participant flag: 1 = a W League member team (the site links its roster), 0 = not (guest or all-star side). Integer. |
| position | integer | Rank of the team in the phase (a string on the wire, equal to the map key). |
| season_team_area | character | Unobserved: null in every sample, so no type and no meaning is claimed. (By the site's standings JS: 0 = East, 1 = West conference when season_league_flg = 2.) |
| win_lost | character | Record in Japanese, (Japanese text) (23 wins, 5 losses). |
| wins | integer | Wins in the record, parsed from win_lost (23 wins). |
| losses | integer | Losses in the record, parsed from win_lost (5 losses). |

## Details

Source, terms of use, request pacing, seasons, ids, coverage and error
classes of this family: see the notes in
[`wjbl_leagues()`](https://wehoop.sportsdataverse.org/reference/wjbl_leagues.md).

## See also

[family_wjbl](https://wehoop.sportsdataverse.org/reference/family_wjbl.md)
lists every function in this family.

## Examples

``` r
# \donttest{
  try(wjbl_team_standings(season_ids = "169"))
#> ── W League Team Standings from api.wjbl.01core.app ──────────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-13 14:00:35 UTC
#> # A tibble: 8 × 15
#>   season_id season_title       league_name season_league_name season_league_flg
#>       <int> <chr>              <chr>       <chr>                          <int>
#> 1       169 レギュラーシーズン プレミア    プレミア                           1
#> 2       169 レギュラーシーズン プレミア    プレミア                           1
#> 3       169 レギュラーシーズン プレミア    プレミア                           1
#> 4       169 レギュラーシーズン プレミア    プレミア                           1
#> 5       169 レギュラーシーズン プレミア    プレミア                           1
#> 6       169 レギュラーシーズン プレミア    プレミア                           1
#> 7       169 レギュラーシーズン プレミア    プレミア                           1
#> 8       169 レギュラーシーズン プレミア    プレミア                           1
#> # ℹ 10 more variables: update_date <chr>, team_id <int>,
#> #   season_team_name <chr>, season_team_short_name <chr>, team_entry_flg <int>,
#> #   position <int>, season_team_area <chr>, win_lost <chr>, wins <int>,
#> #   losses <int>
# }
```
