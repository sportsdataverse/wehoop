# **Get ESPN Women's College Basketball Athlete Awards**

**Get ESPN Women's College Basketball Athlete Awards**

**Get ESPN Women's College Basketball Athlete Awards**

## Usage

``` r
espn_wbb_player_awards(athlete_id, ...)
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

[family_espn_wbb](https://wehoop.sportsdataverse.org/reference/family_espn_wbb.md)
lists every function in this family.

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  espn_wbb_player_awards(athlete_id = "4433404")
#> ── ESPN WOMENS-COLLEGE-BASKETBALL Athlete Awards from ESPN.com ─────────────────
#> ℹ Data updated: 2026-11-13 19:05:13 UTC
#> # A tibble: 2 × 7
#>   season award_id name  description date  type  ref_url                         
#>   <chr>  <chr>    <chr> <chr>       <chr> <chr> <chr>                           
#> 1 NA     NA       NA    NA          NA    NA    http://sports.core.api.espn.com…
#> 2 NA     NA       NA    NA          NA    NA    http://sports.core.api.espn.com…
# }
```
