# **Get W League Standing Seasons**

Every season phase (season_id) with its edition name and standings
flags.

Endpoint: `GET https://api.wjbl.01core.app/api/seasons/standings`

## Usage

``` r
wjbl_standing_seasons()
```

## Value

A `wehoop_data` tibble, one row per record; the columns are always
these, in this order (sportsdataverse-py `wjbl_standing_seasons`):

|  |  |  |
|----|----|----|
| col_name | type | description |
| season_id | integer | Season-phase id season_id (key space: phases WITHIN a league_id, e.g. 169 = 25-26 regular season Premier, 170 = 25-26 regular season Future, 176 = 25-26 playoff final). Not a year: one league_id has several season_ids. The season_ids parameter of /team-standings and /team-ranking and the season_id of /team/roster. |
| season_full_name | character | Edition name with the sponsor, Japanese, e.g. (Japanese text) (truncated by the API). |
| season | integer | Season END year (2025-26 = 2026, 1999-2000 = 2000) from league_title ('25-26 W League'); null for an all-star game, cup or camp. Read from the start of season_full_name. |
| season_league_name | character | Phase / division label in Japanese: Premier, Future, group stage, second round, lower league; empty for a single-table phase. |
| team_standings_flg | integer | 1 = the phase has a standings grid (/team-standings), 0 = not (cups, all-star games, phases not started). |
| season_tournament_text_flg | integer | 1 = the phase shows a tournament text instead of a table, 0 = not; 0 in every sample. |
| season_tournament_text | character | Tournament text (HTML) for knockout phases; empty in every sample. |

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
  try(wjbl_standing_seasons())
#> ── W League Standing Seasons from api.wjbl.01core.app ────────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-13 11:59:26 UTC
#> # A tibble: 118 × 7
#>    season_id season_full_name       season season_league_name team_standings_flg
#>        <int> <chr>                   <int> <chr>                           <int>
#>  1       179 26-27 Wリーグ レギュラーシーズン……   2027 "プレミア"                          1
#>  2       180 26-27 Wリーグ レギュラーシーズン……   2027 "フューチャー"                      1
#>  3       181 26-27 Wリーグ 大樹生命 Wリーグ …   2027 "グループステージ"                  0
#>  4       178 Wリーグオールスター2025-26 in …     NA ""                                  0
#>  5       169 25-26 Wリーグ レギュラーシーズン……   2026 "プレミア"                          1
#>  6       170 25-26 Wリーグ レギュラーシーズン……   2026 "フューチャー"                      1
#>  7       175 25-26 Wリーグ プレーオフ セミファ…   2026 ""                                  0
#>  8       176 25-26 Wリーグ プレーオフ　ファイナ…   2026 ""                                  0
#>  9       174 25-26 Wリーグ 入替戦     2026 ""                                  0
#> 10       172 25-26 Wリーグ 大樹生命 Wリーグ …   2026 "グループステージ"                  0
#> # ℹ 108 more rows
#> # ℹ 2 more variables: season_tournament_text_flg <int>,
#> #   season_tournament_text <chr>
# }
```
