# **Get ESPN WBB Position Detail**

Returns metadata for a single WBB position. Useful for dereferencing
position `$ref` URLs embedded in athlete records, and for navigating
parent/leaf relationships in the position taxonomy.

## Usage

``` r
espn_wbb_position(position_id, ...)
```

## Arguments

- position_id:

  ESPN position identifier (character or numeric).

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
  espn_wbb_position(position_id = 1)
#> ── ESPN WOMENS-COLLEGE-BASKETBALL Position from ESPN.com ─────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-09 11:36:49 UTC
#> # A tibble: 1 × 7
#>   position_id name   display_name abbreviation leaf  parent_ref league          
#>   <chr>       <chr>  <chr>        <chr>        <lgl> <chr>      <chr>           
#> 1 1           Center Center       C            FALSE NA         womens-college-…
# }
```
