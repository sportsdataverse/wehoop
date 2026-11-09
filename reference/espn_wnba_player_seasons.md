# **Get ESPN WNBA Athlete Career Seasons**

Returns the list of seasons an WNBA athlete appeared in. Useful for
bounding follow-up calls to per-season endpoints.

## Usage

``` r
espn_wnba_player_seasons(athlete_id, ...)
```

## Arguments

- athlete_id:

  ESPN athlete identifier (character or numeric).

- ...:

  Additional arguments; currently unused.

## Value

A tibble with one row per career season.

|            |           |                                  |
|------------|-----------|----------------------------------|
| col_name   | types     | description                      |
| league     | character | League slug.                     |
| athlete_id | character | ESPN athlete id.                 |
| season     | integer   | Season year.                     |
| ref        | character | `$ref` URL to the season detail. |

## See also

[family_espn_wnba](https://wehoop.sportsdataverse.org/reference/family_espn_wnba.md)
lists every function in this family.

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  # LeBron James (1966): 23 career seasons
  espn_wnba_player_seasons(athlete_id = 3149391)
#> ── ESPN WNBA Athlete Seasons ─────────────────────────────────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-09 20:19:45 UTC
#> # A tibble: 9 × 4
#>   league athlete_id season ref                                                  
#>   <chr>  <chr>       <int> <chr>                                                
#> 1 wnba   3149391      2026 http://sports.core.api.espn.com/v2/sports/basketball…
#> 2 wnba   3149391      2025 http://sports.core.api.espn.com/v2/sports/basketball…
#> 3 wnba   3149391      2024 http://sports.core.api.espn.com/v2/sports/basketball…
#> 4 wnba   3149391      2023 http://sports.core.api.espn.com/v2/sports/basketball…
#> 5 wnba   3149391      2022 http://sports.core.api.espn.com/v2/sports/basketball…
#> 6 wnba   3149391      2021 http://sports.core.api.espn.com/v2/sports/basketball…
#> 7 wnba   3149391      2020 http://sports.core.api.espn.com/v2/sports/basketball…
#> 8 wnba   3149391      2019 http://sports.core.api.espn.com/v2/sports/basketball…
#> 9 wnba   3149391      2018 http://sports.core.api.espn.com/v2/sports/basketball…
# }
```
