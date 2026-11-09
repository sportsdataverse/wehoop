# **Get ESPN Women's College Basketball League Leaders**

**Get ESPN Women's College Basketball League Leaders**

**Get ESPN Women's College Basketball League Leaders**

## Usage

``` r
espn_wbb_leaders(season = most_recent_wbb_season(), season_type = 2, ...)
```

## Arguments

- season:

  Season year (numeric, e.g. 2025). Defaults to the most recent WBB
  season.

- season_type:

  Integer season type: 1 = preseason, 2 = regular (default), 3 =
  postseason.

- ...:

  Additional arguments; currently unused but retained for forward
  compatibility. Proxy configuration should use
  `options(wehoop.proxy = ...)` – see
  [`?wehoop`](https://wehoop.sportsdataverse.org/reference/wehoop-package.md)
  for details.

## Value

A single `wehoop_data` tibble with one row per category-athlete pair.

Columns as documented in the shared
[espn_basketball_leaders_schema](https://wehoop.sportsdataverse.org/reference/espn_basketball_leaders_schema.md)
table.

## See also

[family_espn_wbb](https://wehoop.sportsdataverse.org/reference/family_espn_wbb.md)
lists every function in this family.

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  espn_wbb_leaders(season = 2025, season_type = 2)
#> ── ESPN WOMENS-COLLEGE-BASKETBALL Leaders from ESPN.com ──────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-09 21:09:42 UTC
#> # A tibble: 350 × 11
#>    season season_type category      abbreviation athlete_id athlete_name team_id
#>     <int>       <int> <chr>         <chr>        <chr>      <chr>        <chr>  
#>  1   2025           2 pointsPerGame PTS          5247335    NA           2179   
#>  2   2025           2 pointsPerGame PTS          4903679    NA           3141   
#>  3   2025           2 pointsPerGame PTS          5180981    NA           112702 
#>  4   2025           2 pointsPerGame PTS          5254897    NA           2225   
#>  5   2025           2 pointsPerGame PTS          5188152    NA           2036   
#>  6   2025           2 pointsPerGame PTS          5247503    NA           507    
#>  7   2025           2 pointsPerGame PTS          5247764    NA           2202   
#>  8   2025           2 pointsPerGame PTS          5184789    NA           2161   
#>  9   2025           2 pointsPerGame PTS          5114898    NA           2008   
#> 10   2025           2 pointsPerGame PTS          5117248    NA           2339   
#> # ℹ 340 more rows
#> # ℹ 4 more variables: team_abbrev <chr>, value <dbl>, rank <int>,
#> #   display_value <chr>
# }
```
