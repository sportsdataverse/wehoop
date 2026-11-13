# **Get ESPN WBB Event Play Personnel (On-Court Lineup at Play)**

Returns the players on court at a specific WBB play in long format (one
row per athlete entry across both competitors). Foundation for lineup
analysis. ESPN coverage is sparse – many plays return zero rows; the
wrapper returns a typed empty tibble in that case.

## Usage

``` r
espn_wbb_game_play_personnel(event_id, play_id, ...)
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

[family_espn_wbb](https://wehoop.sportsdataverse.org/reference/family_espn_wbb.md)
lists every function in this family.

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  espn_wbb_game_play_personnel(event_id = 401276115, play_id = 401276115101899901)
#> ✖ 2026-11-13 19:05:11.05708: Failed to retrieve ESPN womens-college-basketball play personnel for event_id=401276115, play_id=401276115101899904
#> ✖ Args: league = "womens-college-basketball", event_id = 401276115, play_id = 401276115101899904
#> ✖ Error: The API returned an error
#> NULL
# }
```
