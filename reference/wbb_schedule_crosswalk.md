# **Get the WBB cross-source schedule crosswalk**

Build a wide, one-row-per-game crosswalk linking ESPN and Bart Torvik
(barttorvik.com/ncaaw) game identifiers for a WBB season. Fox Sports and
Yahoo game IDs are NA placeholders. Dates are reduced to Eastern-Time
game dates before joining; Torvik `team1`/`team2` are unordered (the
join uses a sorted team-pair key, so home/away from the Torvik side is
not preserved). Games where either Torvik team name cannot be resolved
to an ESPN id via
[`wbb_team_crosswalk()`](https://wehoop.sportsdataverse.org/reference/wbb_team_crosswalk.md)
are kept as `bart_only` rows.

## Usage

``` r
wbb_schedule_crosswalk(season = most_recent_wbb_season())
```

## Arguments

- season:

  Season year (4-digit, e.g. `2025`). Defaults to
  [`most_recent_wbb_season()`](https://wehoop.sportsdataverse.org/reference/most_recent_wbb_season.md).

## Value

A `wehoop_data` tibble, one row per game:

|                   |           |                                             |
|-------------------|-----------|---------------------------------------------|
| col_name          | types     | description                                 |
| season            | integer   | Season year.                                |
| game_date         | Date      | ET game date.                               |
| home_espn_team_id | integer   | ESPN home team id (NA for bart-only rows).  |
| away_espn_team_id | integer   | ESPN away team id (NA for bart-only rows).  |
| espn_game_id      | character | ESPN game id (NA for bart-only rows).       |
| bart_muid         | character | Torvik muid (NA for espn-only rows).        |
| bart_team1        | character | Torvik team1 name (NA for espn-only rows).  |
| bart_team2        | character | Torvik team2 name (NA for espn-only rows).  |
| bart_winner       | character | Torvik winner name (NA for espn-only rows). |
| fox_game_id       | character | Fox game id (NA placeholder).               |
| yahoo_game_id     | character | Yahoo game id (NA placeholder).             |
| match_method      | character | "both"/"espn_only"/"bart_only".             |
| match_confidence  | numeric   | 1 for matched, NA for unmatched.            |

## See also

Other WBB Crosswalk Functions:
[`load_wbb_player_crosswalk()`](https://wehoop.sportsdataverse.org/reference/load_wbb_player_crosswalk.md),
[`load_wbb_schedule_crosswalk()`](https://wehoop.sportsdataverse.org/reference/load_wbb_schedule_crosswalk.md),
[`load_wbb_team_crosswalk()`](https://wehoop.sportsdataverse.org/reference/load_wbb_team_crosswalk.md),
[`wbb_player_crosswalk()`](https://wehoop.sportsdataverse.org/reference/wbb_player_crosswalk.md),
[`wbb_team_crosswalk()`](https://wehoop.sportsdataverse.org/reference/wbb_team_crosswalk.md)

## Examples

``` r
# \donttest{
  try(wbb_schedule_crosswalk(season = 2025))
#> ── WBB schedule crosswalk (ESPN / Torvik) ────────────────────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-06-12 23:32:48 UTC
#> # A tibble: 24,364 × 13
#>    season game_date  home_espn_team_id away_espn_team_id espn_game_id bart_muid 
#>     <int> <date>                 <int>             <int> <chr>        <chr>     
#>  1   2025 2024-11-04              2579               130 401713576    MichiganS…
#>  2   2025 2024-11-04                30               145 401720643    Mississip…
#>  3   2025 2024-11-04                26                97 401720402    Louisvill…
#>  4   2025 2024-11-04                87              2385 401711562    NA        
#>  5   2025 2024-11-04                99              2198 401713679    Eastern K…
#>  6   2025 2024-11-04                66              2130 401703035    Chicago S…
#>  7   2025 2024-11-04               201              2582 401725988    SouthernO…
#>  8   2025 2024-11-04               150              2515 401702871    RadfordDu…
#>  9   2025 2024-11-04              2306              2739 401714674    Green Bay…
#> 10   2025 2024-11-04               153              2127 401711554    Charlesto…
#> # ℹ 24,354 more rows
#> # ℹ 7 more variables: bart_team1 <chr>, bart_team2 <chr>, bart_winner <chr>,
#> #   fox_game_id <chr>, yahoo_game_id <chr>, match_method <chr>,
#> #   match_confidence <dbl>
# }
```
