# **Get ESPN WNBA Season Info**

**Get ESPN WNBA Season Info**

**Get ESPN WNBA Season Info**

## Usage

``` r
espn_wnba_season_info(season = most_recent_wnba_season(), ...)
```

## Arguments

- season:

  Season year (numeric, e.g. 2025). Defaults to the most recent WNBA
  season.

- ...:

  Additional arguments; currently unused but retained for forward
  compatibility. Proxy configuration should use
  `options(wehoop.proxy = ...)` – see
  [`?wehoop`](https://wehoop.sportsdataverse.org/reference/wehoop-package.md)
  for details.

## Value

A named list of `wehoop_data` tibbles: `Info`, `Types`, `Athletes`,
`Coaches`, `Teams`, `Awards`. `$ref` URL components are returned as
character columns and are NOT auto-resolved – use targeted endpoint
functions for details.

**Info**

|              |           |                            |
|--------------|-----------|----------------------------|
| col_name     | types     | description                |
| year         | integer   | 4-digit year.              |
| start_date   | character | Start date (YYYY-MM-DD).   |
| end_date     | character | End date (YYYY-MM-DD).     |
| display_name | character | Display name.              |
| type_id      | character | Type identifier (numeric). |
| type_name    | character | Type name.                 |

**Types / Athletes / Coaches / Teams / Awards**

|          |           |                 |
|----------|-----------|-----------------|
| col_name | types     | description     |
| count    | integer   | Count of count. |
| ref      | character | Ref.            |

## See also

[family_espn_wnba](https://wehoop.sportsdataverse.org/reference/family_espn_wnba.md)
lists every function in this family.

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  espn_wnba_season_info(season = 2025)
#> $Info
#> ── ESPN WNBA Season Info from ESPN.com ───────────────────────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-09 23:09:34 UTC
#> # A tibble: 1 × 6
#>    year start_date        end_date          display_name type_id type_name     
#>   <int> <chr>             <chr>             <chr>        <chr>   <chr>         
#> 1  2025 2025-04-14T07:00Z 2025-10-20T06:59Z 2025         2       Regular Season
#> 
#> $Types
#> ── ESPN WNBA Season Types from ESPN.com ──────────────────────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-09 23:09:34 UTC
#> # A tibble: 1 × 2
#>   count ref                                                                     
#>   <int> <chr>                                                                   
#> 1     4 http://sports.core.api.espn.com/v2/sports/basketball/leagues/wnba/seaso…
#> 
#> $Athletes
#> ── ESPN WNBA Season Athletes from ESPN.com ───────────────────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-09 23:09:34 UTC
#> # A tibble: 0 × 0
#> 
#> $Coaches
#> ── ESPN WNBA Season Coaches from ESPN.com ────────────────────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-09 23:09:34 UTC
#> # A tibble: 0 × 0
#> 
#> $Teams
#> ── ESPN WNBA Season Teams from ESPN.com ──────────────────────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-09 23:09:34 UTC
#> # A tibble: 0 × 0
#> 
#> $Awards
#> ── ESPN WNBA Season Awards from ESPN.com ─────────────────────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-09 23:09:34 UTC
#> # A tibble: 1 × 2
#>   count ref                                                                     
#>   <int> <chr>                                                                   
#> 1    NA http://sports.core.api.espn.com/v2/sports/basketball/leagues/wnba/seaso…
#> 
# }
```
