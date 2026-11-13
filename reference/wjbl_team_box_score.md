# **Get W League Team Box Score**

Team line and totals of each side of a final game's box score, with the
shooting percentages.

Endpoint: `GET https://api.wjbl.01core.app/api/boxscore`

## Usage

``` r
wjbl_team_box_score(play_schedule_id)
```

## Arguments

- play_schedule_id:

  Game id (play_schedule_id in wjbl_schedule): ONE global sequence
  across every league edition and season, e.g. 7987 (2025-26 playoff
  final game 1), 5533 (2018-19), 4243 (2013-14 final, box score only).
  The game must be final.

## Value

A `wehoop_data` tibble, one row per record; the columns are always
these, in this order (sportsdataverse-py `wjbl_team_box_score`):

|  |  |  |
|----|----|----|
| col_name | type | description |
| play_schedule_id | integer | Game id play_schedule_id (key space: W League games, ONE global sequence across every league_id and season, e.g. 4243 = 2013-14 final, 7987 = 2025-26 final). The play_schedule_id parameter of every game route and of the site's /schedule_result/detail/\*?play_schedule_id= pages. |
| team_side | character | Which side of the game the row belongs to: home or away (the API's home / away blocks). |
| team_id | integer | Franchise id team_id of the side (stable across seasons and sponsor renames; 13 = Toyota Antelopes). |
| row_type | character | Which line of the side: team (stats credited to the team itself) or total (the whole side). |
| pts | integer | Points scored by the side (the sum of its players' points). |
| p2m | integer | Two-point field goals made. |
| p2a | integer | Two-point field goals attempted. |
| p3m | integer | Three-point field goals made. |
| p3a | integer | Three-point field goals attempted. |
| ftm | integer | Free throws made. |
| fta | integer | Free throws attempted. |
| f | integer | Personal fouls committed. |
| off | integer | Offensive rebounds. |
| def | integer | Defensive rebounds. |
| tot | integer | Total rebounds (offensive plus defensive). |
| ast | integer | Assists credited to the side. |
| stl | integer | Steals credited to the side. |
| blk | integer | Blocked shots credited to the side. |
| to | integer | Turnovers committed by the side. |
| min | character | Minutes: summed minutes 'mmm:ss' on the total row ('200:00' = 5 x 40:00), always '00:00' on the team row. |
| min_seconds | integer | Minutes played in whole seconds, from the 'mm:ss' clock string min (null when it does not parse). |
| p2p | double | Two-point field-goal percentage 0-100 (a string on the wire); total row only. |
| p3p | double | Three-point field-goal percentage 0-100 (a string on the wire); total row only. |
| ftp | double | Free-throw percentage 0-100 (a string on the wire); total row only. |
| fgp | double | Field-goal percentage 0-100, two- and three-pointers together (a string on the wire); total row only. |

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
  try(wjbl_team_box_score(play_schedule_id = 7987))
#> ── W League Team Box Score from api.wjbl.01core.app ──────────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-13 19:08:35 UTC
#> # A tibble: 4 × 25
#>   play_schedule_id team_side team_id row_type   pts   p2m   p2a   p3m   p3a
#>              <int> <chr>       <int> <chr>    <int> <int> <int> <int> <int>
#> 1             7987 home           13 team         0     0     0     0     0
#> 2             7987 home           13 total       66    15    38     9    23
#> 3             7987 away           12 team         0     0     0     0     0
#> 4             7987 away           12 total       75    25    43     3    12
#> # ℹ 16 more variables: ftm <int>, fta <int>, f <int>, off <int>, def <int>,
#> #   tot <int>, ast <int>, stl <int>, blk <int>, to <int>, min <chr>,
#> #   min_seconds <int>, p2p <dbl>, p3p <dbl>, ftp <dbl>, fgp <dbl>
# }
```
