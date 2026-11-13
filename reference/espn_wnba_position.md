# **Get ESPN WNBA Position Detail**

Returns metadata for a single WNBA position. Useful for dereferencing
position `$ref` URLs embedded in athlete records, and for navigating
parent/leaf relationships in the position taxonomy.

## Usage

``` r
espn_wnba_position(position_id, ...)
```

## Arguments

- position_id:

  ESPN position identifier (character or numeric).

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
  espn_wnba_position(position_id = 1)
#> ── ESPN WNBA Position from ESPN.com ──────────────────────────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-13 14:50:26 UTC
#> # A tibble: 1 × 7
#>   position_id name        display_name abbreviation leaf  parent_ref      league
#>   <chr>       <chr>       <chr>        <chr>        <lgl> <chr>           <chr> 
#> 1 1           Point Guard Point Guard  PG           TRUE  http://sports.… wnba  
# }
```
