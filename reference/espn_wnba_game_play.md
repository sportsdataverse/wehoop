# **Get ESPN WNBA Event Play Detail (Single Play)**

Returns the rich detail block for a single WNBA play: sequence, period,
clock, text, scoring/shooting flags, current home/away score, team
`$ref`, and shot coordinates if applicable. Complements the bulk
[`espn_wnba_pbp()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_all.md)
output by exposing the canonical core-v2 play record.

## Usage

``` r
espn_wnba_game_play(event_id, play_id, ...)
```

## Arguments

- event_id:

  ESPN event identifier.

- play_id:

  ESPN play identifier (visible in `pbp()` output as `play_id` or
  extractable from `plays[].$ref`).

- ...:

  Additional arguments; currently unused.

## Value

A single-row tibble.

## See also

[family_espn_wnba](https://wehoop.sportsdataverse.org/reference/family_espn_wnba.md)
lists every function in this family.

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  espn_wnba_game_play(event_id = 401736171, play_id = 4017361714)
#> ── ESPN WNBA Event Play Detail ───────────────────────────────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-09 20:19:40 UTC
#> # A tibble: 1 × 19
#>   league event_id  play_id    sequence_number type_id type_text text  short_text
#>   <chr>  <chr>     <chr>      <chr>           <chr>   <chr>     <chr> <chr>     
#> 1 wnba   401736171 4017361714 4               615     Jumpball  Azur… NA        
#> # ℹ 11 more variables: period <int>, clock <chr>, scoring_play <lgl>,
#> #   score_value <dbl>, away_score <int>, home_score <int>, shooting_play <lgl>,
#> #   coordinate_x <dbl>, coordinate_y <dbl>, team_ref <chr>, wallclock <chr>
# }
```
