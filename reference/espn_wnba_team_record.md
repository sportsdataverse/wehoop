# **Get ESPN WNBA Team Record (Per Season Type)**

Returns the long-format record breakdown for a WNBA team in one season
and season-type. Each row is one record category.

## Usage

``` r
espn_wnba_team_record(
  team_id,
  season = most_recent_wnba_season(),
  season_type = c(2L, 3L),
  ...
)
```

## Arguments

- team_id:

  ESPN team identifier.

- season:

  Season year. Defaults to most recent WNBA season.

- season_type:

  Integer (2 = regular season default).

- ...:

  Additional arguments; currently unused.

## Value

A tibble with one row per record category.

|                    |           |                         |
|--------------------|-----------|-------------------------|
| col_name           | types     | description             |
| league             | character | League slug (`"wnba"`). |
| team_id            | character | ESPN team identifier.   |
| season             | integer   | Season year.            |
| season_type        | integer   | Season type (1/2/3).    |
| record_id          | character | Record sub-id.          |
| name               | character | Internal record name.   |
| abbreviation       | character | Abbreviation.           |
| display_name       | character | Display name.           |
| short_display_name | character | Short display.          |
| description        | character | Description.            |
| type               | character | Record type code.       |
| summary            | character | W-L summary.            |
| display_value      | character | Display value.          |
| value              | numeric   | Win percentage (0-1).   |

## See also

[family_espn_wnba](https://wehoop.sportsdataverse.org/reference/family_espn_wnba.md)
lists every function in this family.

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  espn_wnba_team_record(team_id = 17, season = 2025)
#> ── ESPN WNBA Team Record ─────────────────────────────────────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-09 11:37:25 UTC
#> # A tibble: 8 × 14
#>   league team_id season season_type record_id name     abbreviation display_name
#>   <chr>  <chr>    <int>       <int> <chr>     <chr>    <chr>        <chr>       
#> 1 wnba   17        2025           2 0         overall  Total        Overall     
#> 2 wnba   17        2025           2 33        Home     NA           Home        
#> 3 wnba   17        2025           2 34        Road     NA           Road        
#> 4 wnba   17        2025           2 901       Last Te… Last Ten     Last Ten Ga…
#> 5 wnba   17        2025           3 0         overall  Total        Overall     
#> 6 wnba   17        2025           3 33        Home     NA           Home        
#> 7 wnba   17        2025           3 34        Road     NA           Road        
#> 8 wnba   17        2025           3 901       Last Te… Last Ten     Last Ten Ga…
#> # ℹ 6 more variables: short_display_name <chr>, description <chr>, type <chr>,
#> #   summary <chr>, display_value <chr>, value <dbl>
# }
```
