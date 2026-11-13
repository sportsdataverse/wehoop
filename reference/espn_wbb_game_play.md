# **Get ESPN WBB Event Play Detail (Single Play)**

Returns the rich detail block for a single WBB play: sequence, period,
clock, text, scoring/shooting flags, current home/away score, team
`$ref`, and shot coordinates if applicable. Complements the bulk
[`espn_wbb_pbp()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_game_all.md)
output by exposing the canonical core-v2 play record.

## Usage

``` r
espn_wbb_game_play(event_id, play_id, ...)
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

[family_espn_wbb](https://wehoop.sportsdataverse.org/reference/family_espn_wbb.md)
lists every function in this family.

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  espn_wbb_game_play(event_id = 401276115, play_id = 401276115101899901)
#> ✖ 2026-11-13 11:56:17.67641: Failed to retrieve ESPN womens-college-basketball event play detail for event_id=401276115, play_id=401276115101899904
#> ✖ Args: league = "womens-college-basketball", event_id = 401276115, play_id = 401276115101899904
#> ✖ Error: The API returned an error
#> NULL
# }
```
