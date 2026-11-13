# **Get ESPN WBB Season Power Index (Long Format)**

Returns ESPN's Basketball Power Index (BPI) and related per-team metrics
for one WBB season, in long format: one row per (team x stat).

## Usage

``` r
espn_wbb_powerindex(
  season = most_recent_wbb_season(),
  season_type = c(2L, 3L),
  ...
)
```

## Arguments

- season:

  Season year (numeric). Defaults to the most recent WBB season.

- season_type:

  Integer (1=preseason, 2=regular (default), 3=postseason).

- ...:

  Additional arguments; currently unused.

## Value

A long tibble with one row per (team x stat).

|               |           |                                        |
|---------------|-----------|----------------------------------------|
| col_name      | types     | description                            |
| league        | character | League slug.                           |
| season        | integer   | Season year.                           |
| season_type   | integer   | 1=preseason, 2=regular, 3=postseason.  |
| team_id       | character | ESPN team id.                          |
| stat_name     | character | Internal stat key.                     |
| abbreviation  | character | Short stat abbreviation.               |
| display_name  | character | Human-readable stat name.              |
| description   | character | Stat description.                      |
| value         | numeric   | Stat value.                            |
| display_value | character | Display-formatted value.               |
| last_updated  | character | Last-updated timestamp.                |
| team_ref      | character | `$ref` to the team-in-season resource. |

## See also

[family_espn_wbb](https://wehoop.sportsdataverse.org/reference/family_espn_wbb.md)
lists every function in this family.

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  espn_wbb_powerindex(season = 2025)
#> ── ESPN WOMENS-COLLEGE-BASKETBALL Season Power Index ─────────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-13 13:57:08 UTC
#> # A tibble: 1,475 × 12
#>    league         season season_type team_id stat_name abbreviation display_name
#>    <chr>           <int>       <int> <chr>   <chr>     <chr>        <chr>       
#>  1 womens-colleg…   2025          NA 41      bpi       NA           BPI         
#>  2 womens-colleg…   2025          NA 41      bpirank   NA           BPI RK      
#>  3 womens-colleg…   2025          NA 41      rpirank   NA           RPI RK      
#>  4 womens-colleg…   2025          NA 41      sor       NA           SOR         
#>  5 womens-colleg…   2025          NA 41      sorrank   NA           SOR RK      
#>  6 womens-colleg…   2025          NA 41      sospast   NA           SOS         
#>  7 womens-colleg…   2025          NA 41      sospastr… NA           SOS RK      
#>  8 womens-colleg…   2025          NA 41      wins      NA           W           
#>  9 womens-colleg…   2025          NA 41      losses    NA           L           
#> 10 womens-colleg…   2025          NA 41      winpct    NA           W-L         
#> # ℹ 1,465 more rows
#> # ℹ 5 more variables: description <chr>, value <dbl>, display_value <chr>,
#> #   last_updated <chr>, team_ref <chr>
# }
```
