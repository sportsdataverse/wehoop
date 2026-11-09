# **Get ESPN WNBA Event Play Personnel (On-Court Lineup at Play)**

Returns the players on court at a specific WNBA play in long format (one
row per athlete entry across both competitors). Foundation for lineup
analysis. ESPN coverage is sparse – many plays return zero rows; the
wrapper returns a typed empty tibble in that case.

## Usage

``` r
espn_wnba_game_play_personnel(event_id, play_id, ...)
```

## Arguments

- event_id:

  ESPN event identifier.

- play_id:

  ESPN play identifier.

- ...:

  Additional arguments; currently unused.

## Value

A long tibble with one row per on-court athlete.

## See also

[family_espn_wnba](https://wehoop.sportsdataverse.org/reference/family_espn_wnba.md)
lists every function in this family.

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  espn_wnba_game_play_personnel(event_id = 401736171, play_id = 4017361714)
#> ── ESPN WNBA Event Play Personnel ────────────────────────────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-09 21:10:16 UTC
#> # A tibble: 0 × 7
#> # ℹ 7 variables: league <chr>, event_id <chr>, play_id <chr>, team_id <chr>,
#> #   athlete_id <chr>, athlete_ref <chr>, competitor_ref <chr>
# }
```
