# **Get ESPN WNBA Event Win Probabilities**

**Get ESPN WNBA Event Win Probabilities**

**Get ESPN WNBA Event Win Probabilities**

## Usage

``` r
espn_wnba_game_probabilities(event_id, limit = 200, ...)
```

## Arguments

- event_id:

  ESPN event/game identifier (character or numeric).

- limit:

  integer. Maximum number of probability rows to return. Defaults to
  `200`. Pagination is handled internally.

- ...:

  Additional arguments; currently unused.

## Value

A tibble with one row per play-level win-probability entry.

Columns as documented in the shared
[espn_basketball_game_probabilities_schema](https://wehoop.sportsdataverse.org/reference/espn_basketball_game_probabilities_schema.md)
table.

## See also

[family_espn_wnba](https://wehoop.sportsdataverse.org/reference/family_espn_wnba.md)
lists every function in this family.

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  espn_wnba_game_probabilities(event_id = "401736171", limit = 50)
#> ── ESPN WNBA Event Probabilities (event_id=401736171) from ESPN.com ────────────
#> ℹ Data updated: 2026-11-09 21:10:16 UTC
#> # A tibble: 50 × 10
#>    event_id  sequence_number play_id period clock home_win_percentage
#>    <chr>     <chr>           <chr>    <int> <chr>               <dbl>
#>  1 401736171 4               NA          NA NA                  0.764
#>  2 401736171 7               NA          NA NA                  0.756
#>  3 401736171 9               NA          NA NA                  0.744
#>  4 401736171 10              NA          NA NA                  0.761
#>  5 401736171 11              NA          NA NA                  0.743
#>  6 401736171 12              NA          NA NA                  0.737
#>  7 401736171 13              NA          NA NA                  0.753
#>  8 401736171 14              NA          NA NA                  0.759
#>  9 401736171 15              NA          NA NA                  0.781
#> 10 401736171 17              NA          NA NA                  0.789
#> # ℹ 40 more rows
#> # ℹ 4 more variables: away_win_percentage <dbl>, tie_percentage <dbl>,
#> #   secs_to_end_of_period <dbl>, secs_to_end_of_game <dbl>
# }
```
