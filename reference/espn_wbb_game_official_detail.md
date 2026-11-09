# **Get ESPN WBB Event Official Detail (Single Official)**

Returns a single-row tibble for one referee assigned to one WBB event,
with their name, position (Referee / Crew Chief / Umpire), and crew
order. Pair with
[`espn_wbb_game_officials()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_game_broadcasts.md)
to enumerate the crew.

## Usage

``` r
espn_wbb_game_official_detail(event_id, order, ...)
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

[family_espn_wbb](https://wehoop.sportsdataverse.org/reference/family_espn_wbb.md)
lists every function in this family.

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  espn_wbb_game_official_detail(event_id = 401276115, order = 1)
#> ── ESPN WOMENS-COLLEGE-BASKETBALL Event Official Detail ──────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-09 21:09:38 UTC
#> # A tibble: 1 × 10
#>   league        event_id official_id first_name last_name full_name display_name
#>   <chr>         <chr>    <chr>       <chr>      <chr>     <chr>     <chr>       
#> 1 womens-colle… 4012761… 18864       Denise     Brooks    Denise B… Denise Broo…
#> # ℹ 3 more variables: position_id <chr>, position_name <chr>, order <int>
# }
```
