# **Get W League Box Score**

Box score of a final game (2013-14 on): one row per player of both
teams.

Endpoint: `GET https://api.wjbl.01core.app/api/boxscore`

## Usage

``` r
wjbl_box_score(play_schedule_id)
```

## Arguments

- play_schedule_id:

  Game id (play_schedule_id in wjbl_schedule): ONE global sequence
  across every league edition and season, e.g. 7987 (2025-26 playoff
  final game 1), 5533 (2018-19), 4243 (2013-14 final, box score only).
  The game must be final.

## Value

A `wehoop_data` tibble, one row per record; the columns are always
these, in this order (sportsdataverse-py `wjbl_box_score`):

|  |  |  |
|----|----|----|
| col_name | type | description |
| play_schedule_id | integer | Game id play_schedule_id (key space: W League games, ONE global sequence across every league_id and season, e.g. 4243 = 2013-14 final, 7987 = 2025-26 final). The play_schedule_id parameter of every game route and of the site's /schedule_result/detail/\*?play_schedule_id= pages. |
| team_side | character | Which side of the game the row belongs to: home or away (the API's home / away blocks). |
| team_id | integer | Franchise id team_id of the side (stable across seasons and sponsor renames; 13 = Toyota Antelopes). |
| player_id | integer | Player id player_id (key space: W League persons, STABLE across seasons and teams). The player_id of /player and the pi= of the site's /player/detail?pi=; joins the play-by-play player_id1 / player_id2. |
| player_name | character | Player name in Japanese, 'SURNAME GIVEN' with a space (foreign players in katakana). |
| player_number | character | Shirt number, a string. |
| gs | integer | Game started: 1 = starter, 0 = bench (integer). |
| pts | integer | Points. Integer. |
| p2m | integer | Two-point field goals made. Integer. |
| p2a | integer | Two-point field goals attempted. Integer. |
| p3m | integer | Three-point field goals made. Integer. |
| p3a | integer | Three-point field goals attempted. Integer. |
| ftm | integer | Free throws made. Integer. |
| fta | integer | Free throws attempted. Integer. |
| f | integer | Personal fouls committed. Integer. |
| off | integer | Offensive rebounds. Integer. |
| def | integer | Defensive rebounds. Integer. |
| tot | integer | Total rebounds (off + def). Integer. |
| ast | integer | Assists. Integer. |
| stl | integer | Steals. Integer. |
| blk | integer | Blocked shots (made by this player / team). Integer. |
| to | integer | Turnovers. Integer. |
| min | character | Minutes played 'mm:ss' ('22:19'), a string. |
| min_seconds | integer | Minutes played in whole seconds, from the 'mm:ss' clock string min (null when it does not parse). |

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
  try(wjbl_box_score(play_schedule_id = 7987))
#> ── W League Box Score from api.wjbl.01core.app ───────────────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-13 14:00:22 UTC
#> # A tibble: 27 × 24
#>    play_schedule_id team_side team_id player_id player_name  player_number    gs
#>               <int> <chr>       <int>     <int> <chr>        <chr>         <int>
#>  1             7987 home           13      9799 岡本 美優    11                1
#>  2             7987 home           13     17454 オコンクウォ スーザン… 13                1
#>  3             7987 home           13      3395 平下 愛佳    14                1
#>  4             7987 home           13      1389 安間 志織    15                1
#>  5             7987 home           13      1443 山本 麻衣    23                1
#>  6             7987 home           13     14381 小野寺 佑奈  3                 0
#>  7             7987 home           13      9850 横山 智那美  7                 0
#>  8             7987 home           13      3396 永田 萌絵    20                0
#>  9             7987 home           13     18968 シュック カイリー ア… 24                0
#> 10             7987 home           13      9794 三浦 舞華    30                0
#> # ℹ 17 more rows
#> # ℹ 17 more variables: pts <int>, p2m <int>, p2a <int>, p3m <int>, p3a <int>,
#> #   ftm <int>, fta <int>, f <int>, off <int>, def <int>, tot <int>, ast <int>,
#> #   stl <int>, blk <int>, to <int>, min <chr>, min_seconds <int>
# }
```
