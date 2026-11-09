# **Get ESPN WNBA League Leaders**

**Get ESPN WNBA League Leaders**

**Get ESPN WNBA League Leaders**

## Usage

``` r
espn_wnba_leaders(season = most_recent_wnba_season(), season_type = 2, ...)
```

## Arguments

- season:

  Season year (numeric, e.g. 2025). Defaults to the most recent WNBA
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

[family_espn_wnba](https://wehoop.sportsdataverse.org/reference/family_espn_wnba.md)
lists every function in this family.

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  espn_wnba_leaders(season = 2024, season_type = 2)
#> ── ESPN WNBA Leaders from ESPN.com ───────────────────────────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-09 21:10:20 UTC
#> # A tibble: 375 × 11
#>    season season_type category      abbreviation athlete_id athlete_name team_id
#>     <int>       <int> <chr>         <chr>        <chr>      <chr>        <chr>  
#>  1   2024           2 pointsPerGame PTS          3149391    NA           17     
#>  2   2024           2 pointsPerGame PTS          3904577    NA           3      
#>  3   2024           2 pointsPerGame PTS          2998938    NA           11     
#>  4   2024           2 pointsPerGame PTS          2998928    NA           9      
#>  5   2024           2 pointsPerGame PTS          3917450    NA           8      
#>  6   2024           2 pointsPerGame PTS          2987869    NA           17     
#>  7   2024           2 pointsPerGame PTS          4433403    NA           5      
#>  8   2024           2 pointsPerGame PTS          3142191    NA           5      
#>  9   2024           2 pointsPerGame PTS          4066533    NA           9      
#> 10   2024           2 pointsPerGame PTS          3065570    NA           11     
#> # ℹ 365 more rows
#> # ℹ 4 more variables: team_abbrev <chr>, value <dbl>, rank <int>,
#> #   display_value <chr>
# }
```
