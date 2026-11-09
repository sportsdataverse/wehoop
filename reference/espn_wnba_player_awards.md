# **Get ESPN WNBA Athlete Awards**

**Get ESPN WNBA Athlete Awards**

**Get ESPN WNBA Athlete Awards**

## Usage

``` r
espn_wnba_player_awards(athlete_id, ...)
```

## Arguments

- athlete_id:

  ESPN athlete identifier (character or numeric).

- ...:

  Additional arguments; currently unused.

## Value

A single tibble. This endpoint is sparse; many athletes have no award
data, in which case an empty tibble with canonical columns is returned.

Columns as documented in the shared
[espn_basketball_player_awards_schema](https://wehoop.sportsdataverse.org/reference/espn_basketball_player_awards_schema.md)
table.

## See also

[family_espn_wnba](https://wehoop.sportsdataverse.org/reference/family_espn_wnba.md)
lists every function in this family.

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  espn_wnba_player_awards(athlete_id = "3149391")
#> ── ESPN WNBA Athlete Awards from ESPN.com ────────────────────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-09 20:19:44 UTC
#> # A tibble: 25 × 7
#>    season award_id name  description date  type  ref_url                        
#>    <chr>  <chr>    <chr> <chr>       <chr> <chr> <chr>                          
#>  1 NA     NA       NA    NA          NA    NA    http://sports.core.api.espn.co…
#>  2 NA     NA       NA    NA          NA    NA    http://sports.core.api.espn.co…
#>  3 NA     NA       NA    NA          NA    NA    http://sports.core.api.espn.co…
#>  4 NA     NA       NA    NA          NA    NA    http://sports.core.api.espn.co…
#>  5 NA     NA       NA    NA          NA    NA    http://sports.core.api.espn.co…
#>  6 NA     NA       NA    NA          NA    NA    http://sports.core.api.espn.co…
#>  7 NA     NA       NA    NA          NA    NA    http://sports.core.api.espn.co…
#>  8 NA     NA       NA    NA          NA    NA    http://sports.core.api.espn.co…
#>  9 NA     NA       NA    NA          NA    NA    http://sports.core.api.espn.co…
#> 10 NA     NA       NA    NA          NA    NA    http://sports.core.api.espn.co…
#> # ℹ 15 more rows
# }
```
