# **Get ESPN WNBA Event Player Box Score (Long Format)**

Returns the long-format per-game box score for a single athlete in one
WNBA event. One row per (category x stat). Same shape as
[`espn_wnba_game_team_statistics()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_team_leaders.md)
but scoped to a single athlete-in-event instead of the full team.
`stat_type` defaults to 0 (regular-season aggregate as ESPN tags it for
finished events).

## Usage

``` r
espn_wnba_game_player_box(event_id, team_id, athlete_id, stat_type = 0L, ...)
```

## Arguments

- event_id:

  ESPN event identifier.

- team_id:

  ESPN team identifier (the competitor the athlete played for).

- athlete_id:

  ESPN athlete identifier.

- stat_type:

  Integer stat-type segment. Defaults to 0 (the only type commonly
  populated for finished events).

- ...:

  Additional arguments; currently unused.

## Value

A long tibble with one row per (category x stat).

## See also

[family_espn_wnba](https://wehoop.sportsdataverse.org/reference/family_espn_wnba.md)
lists every function in this family.

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  espn_wnba_game_player_box(event_id = 401736171, team_id = 17,
                               athlete_id = 3149391)
#> ── ESPN WNBA Event Player Box ────────────────────────────────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-13 13:57:32 UTC
#> # A tibble: 97 × 12
#>    league event_id  team_id athlete_id stat_type category_name category_display
#>    <chr>  <chr>     <chr>   <chr>          <int> <chr>         <chr>           
#>  1 wnba   401736171 17      3149391            0 defensive     Defensive       
#>  2 wnba   401736171 17      3149391            0 defensive     Defensive       
#>  3 wnba   401736171 17      3149391            0 defensive     Defensive       
#>  4 wnba   401736171 17      3149391            0 defensive     Defensive       
#>  5 wnba   401736171 17      3149391            0 defensive     Defensive       
#>  6 wnba   401736171 17      3149391            0 defensive     Defensive       
#>  7 wnba   401736171 17      3149391            0 defensive     Defensive       
#>  8 wnba   401736171 17      3149391            0 defensive     Defensive       
#>  9 wnba   401736171 17      3149391            0 defensive     Defensive       
#> 10 wnba   401736171 17      3149391            0 general       General         
#> # ℹ 87 more rows
#> # ℹ 5 more variables: stat_name <chr>, stat_abbrev <chr>, stat_display <chr>,
#> #   value <dbl>, display_value <chr>
# }
```
