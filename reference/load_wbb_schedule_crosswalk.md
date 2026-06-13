# **Load cached WBB schedule crosswalk**

Loads cached schedule-crosswalk snapshots that map ESPN game identifiers
to Bart Torvik game identifiers for Women's College Basketball. One row
per game-season. Backed by the `wbb_crosswalk` release tag in
`sportsdataverse-data`.

## Usage

``` r
load_wbb_schedule_crosswalk(seasons = most_recent_wbb_season())
```

## Arguments

- seasons:

  A vector of 4-digit years associated with given WBB seasons. (Min:
  2014)

## Value

A `wehoop_data` tibble of cached WBB schedule-crosswalk rows.

## See also

Other WBB Crosswalk Functions:
[`load_wbb_player_crosswalk()`](https://wehoop.sportsdataverse.org/reference/load_wbb_player_crosswalk.md),
[`load_wbb_team_crosswalk()`](https://wehoop.sportsdataverse.org/reference/load_wbb_team_crosswalk.md),
[`wbb_player_crosswalk()`](https://wehoop.sportsdataverse.org/reference/wbb_player_crosswalk.md),
[`wbb_schedule_crosswalk()`](https://wehoop.sportsdataverse.org/reference/wbb_schedule_crosswalk.md),
[`wbb_team_crosswalk()`](https://wehoop.sportsdataverse.org/reference/wbb_team_crosswalk.md)

## Examples

``` r
# \donttest{
  try(load_wbb_schedule_crosswalk(seasons = most_recent_wbb_season()))
#> ──────────────────────────────────────────────────────────────── wehoop 3.0.0 ──
#> # A tibble: 6,521 × 13
#>    season game_date  home_espn_team_id away_espn_team_id espn_game_id bart_muid 
#>     <int> <date>                 <int>             <int> <chr>        <chr>     
#>  1   2026 2025-11-03              2579              2253 401811123    Grand Can…
#>  2   2026 2025-11-03                21                26 401822217    San Diego…
#>  3   2026 2025-11-03               251              2916 401809048    Incarnate…
#>  4   2026 2025-11-03               201              2057 401827851    BelmontOk…
#>  5   2026 2025-11-03               239               150 401817556    BaylorDuk…
#>  6   2026 2025-11-03               120              2352 401818636    Loyola MD…
#>  7   2026 2025-11-03               153              2428 401807516    North Car…
#>  8   2026 2025-11-03               145              2450 401827820    Norfolk S…
#>  9   2026 2025-11-03                66              2900 401819923    St. Thoma…
#> 10   2026 2025-11-03               238                25 401817548    Californi…
#> # ℹ 6,511 more rows
#> # ℹ 7 more variables: bart_team1 <chr>, bart_team2 <chr>, bart_winner <chr>,
#> #   fox_game_id <chr>, yahoo_game_id <chr>, match_method <chr>,
#> #   match_confidence <dbl>
# }
```
