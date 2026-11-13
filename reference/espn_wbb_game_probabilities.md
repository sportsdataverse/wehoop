# **Get ESPN Women's College Basketball Event Win Probabilities**

**Get ESPN Women's College Basketball Event Win Probabilities**

**Get ESPN Women's College Basketball Event Win Probabilities**

## Usage

``` r
espn_wbb_game_probabilities(event_id, limit = 200, ...)
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

[family_espn_wbb](https://wehoop.sportsdataverse.org/reference/family_espn_wbb.md)
lists every function in this family.

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  espn_wbb_game_probabilities(event_id = "401276115", limit = 50)
#> ── ESPN WOMENS-COLLEGE-BASKETBALL Event Probabilities (event_id=401276115) from 
#> ℹ Data updated: 2026-11-13 23:21:33 UTC
#> # A tibble: 50 × 10
#>    event_id  sequence_number play_id period clock home_win_percentage
#>    <chr>     <chr>           <chr>    <int> <chr>               <dbl>
#>  1 401276115 101899901       NA          NA NA                  0.26 
#>  2 401276115 101904901       NA          NA NA                  0.283
#>  3 401276115 101907701       NA          NA NA                  0.241
#>  4 401276115 101914901       NA          NA NA                  0.233
#>  5 401276115 101914902       NA          NA NA                  0.243
#>  6 401276115 101915701       NA          NA NA                  0.29 
#>  7 401276115 101919001       NA          NA NA                  0.307
#>  8 401276115 101919002       NA          NA NA                  0.294
#>  9 401276115 101919501       NA          NA NA                  0.27 
#> 10 401276115 101924601       NA          NA NA                  0.255
#> # ℹ 40 more rows
#> # ℹ 4 more variables: away_win_percentage <dbl>, tie_percentage <dbl>,
#> #   secs_to_end_of_period <dbl>, secs_to_end_of_game <dbl>
# }
```
