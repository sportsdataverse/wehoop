# **Get ESPN WNBA Injuries**

**Get ESPN WNBA Injuries**

**Get ESPN WNBA Injuries**

## Usage

``` r
espn_wnba_injuries(season = most_recent_wnba_season(), ...)
```

## Arguments

- season:

  Numeric or character season year (e.g. `2025`). The ESPN injury
  endpoint does not filter by season server-side; the value is attached
  as a constant column on the returned tibble for downstream joins.
  Defaults to
  [`most_recent_wnba_season()`](https://wehoop.sportsdataverse.org/reference/most_recent_wnba_season.md).

- ...:

  Currently unused; reserved for future argument threading.

## Value

Returns a tibble of league-wide WNBA injury records. Returns an empty
tibble (zero rows) when no injuries are reported.

**Injuries**

Columns as documented in the shared
[espn_basketball_injuries_schema](https://wehoop.sportsdataverse.org/reference/espn_basketball_injuries_schema.md)
table.

## See also

[family_espn_wnba](https://wehoop.sportsdataverse.org/reference/family_espn_wnba.md)
lists every function in this family.

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  espn_wnba_injuries()
#> ── ESPN WNBA Injury Information from ESPN.com ────────────────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-09 11:37:15 UTC
#> # A tibble: 14 × 12
#>    team_id athlete_id athlete_name position status date  type  side  returns_at
#>    <chr>   <chr>      <chr>        <chr>    <chr>  <chr> <chr> <chr> <chr>     
#>  1 NA      NA         NA           NA       NA     NA    NA    NA    NA        
#>  2 NA      NA         NA           NA       NA     NA    NA    NA    NA        
#>  3 NA      NA         NA           NA       NA     NA    NA    NA    NA        
#>  4 NA      NA         NA           NA       NA     NA    NA    NA    NA        
#>  5 NA      NA         NA           NA       NA     NA    NA    NA    NA        
#>  6 NA      NA         NA           NA       NA     NA    NA    NA    NA        
#>  7 NA      NA         NA           NA       NA     NA    NA    NA    NA        
#>  8 NA      NA         NA           NA       NA     NA    NA    NA    NA        
#>  9 NA      NA         NA           NA       NA     NA    NA    NA    NA        
#> 10 NA      NA         NA           NA       NA     NA    NA    NA    NA        
#> 11 NA      NA         NA           NA       NA     NA    NA    NA    NA        
#> 12 NA      NA         NA           NA       NA     NA    NA    NA    NA        
#> 13 NA      NA         NA           NA       NA     NA    NA    NA    NA        
#> 14 NA      NA         NA           NA       NA     NA    NA    NA    NA        
#> # ℹ 3 more variables: short_comment <chr>, long_comment <chr>, season <int>
# }
```
