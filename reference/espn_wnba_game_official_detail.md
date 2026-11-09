# **Get ESPN WNBA Event Official Detail (Single Official)**

Returns a single-row tibble for one referee assigned to one WNBA event,
with their name, position (Referee / Crew Chief / Umpire), and crew
order. Pair with
[`espn_wnba_game_officials()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_broadcasts.md)
to enumerate the crew.

## Usage

``` r
espn_wnba_game_official_detail(event_id, order, ...)
```

## Arguments

- event_id:

  ESPN event identifier.

- order:

  Crew order index (1 = first official). Pair with the `order` column
  from event_officials().

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
  espn_wnba_game_official_detail(event_id = 401736171, order = 1)
#> ── ESPN WNBA Event Official Detail ───────────────────────────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-09 23:09:24 UTC
#> # A tibble: 1 × 10
#>   league event_id  official_id first_name last_name full_name     display_name 
#>   <chr>  <chr>     <chr>       <chr>      <chr>     <chr>         <chr>        
#> 1 wnba   401736171 7671        Michael    Price     Michael Price Michael Price
#> # ℹ 3 more variables: position_id <chr>, position_name <chr>, order <int>
# }
```
