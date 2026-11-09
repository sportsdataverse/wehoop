# **Get ESPN WNBA Season Futures (Long Format)**

Returns the full futures-betting board for a WNBA season, in long
format: one row per (market x team). Markets include championship winner
and conference winners. Backed by
`sports.core.api.espn.com/v2/sports/basketball/leagues/wnba/seasons/{season}/futures`.

Note: ESPN does not currently expose a futures endpoint for women's
college basketball.

## Usage

``` r
espn_wnba_futures(season = most_recent_wnba_season(), ...)
```

## Arguments

- season:

  Season year (numeric). Defaults to the most recent WNBA season.

- ...:

  Additional arguments; currently unused.

## Value

A long-format tibble.

|                |           |                                         |
|----------------|-----------|-----------------------------------------|
| col_name       | types     | description                             |
| season         | integer   | Season year.                            |
| league         | character | League slug (`"wnba"`).                 |
| market_id      | character | ESPN futures-market identifier.         |
| market_name    | character | Internal market name.                   |
| market_type    | character | Market type code.                       |
| market_display | character | Human-readable market name.             |
| provider_id    | character | Sportsbook provider identifier.         |
| provider_name  | character | Sportsbook provider name.               |
| team_id        | character | ESPN team id.                           |
| odds_value     | character | American odds for the team.             |
| team_ref       | character | `$ref` to the per-season team resource. |

## See also

[family_espn_wnba](https://wehoop.sportsdataverse.org/reference/family_espn_wnba.md)
lists every function in this family.

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  espn_wnba_futures(season = 2025)
#> ── ESPN WNBA Season Futures ──────────────────────────────────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-09 23:09:19 UTC
#> # A tibble: 145 × 11
#>    season league market_id market_name   market_type market_display provider_id
#>     <int> <chr>      <int> <chr>         <chr>       <chr>          <chr>      
#>  1   2025 wnba        8146 WNBA - Winner NA          WNBA - Winner  58         
#>  2   2025 wnba        8146 WNBA - Winner NA          WNBA - Winner  58         
#>  3   2025 wnba        8146 WNBA - Winner NA          WNBA - Winner  58         
#>  4   2025 wnba        8146 WNBA - Winner NA          WNBA - Winner  58         
#>  5   2025 wnba        8146 WNBA - Winner NA          WNBA - Winner  58         
#>  6   2025 wnba        8146 WNBA - Winner NA          WNBA - Winner  58         
#>  7   2025 wnba        8146 WNBA - Winner NA          WNBA - Winner  58         
#>  8   2025 wnba        8146 WNBA - Winner NA          WNBA - Winner  58         
#>  9   2025 wnba        8146 WNBA - Winner NA          WNBA - Winner  58         
#> 10   2025 wnba        8146 WNBA - Winner NA          WNBA - Winner  58         
#> # ℹ 135 more rows
#> # ℹ 4 more variables: provider_name <chr>, team_id <chr>, odds_value <chr>,
#> #   team_ref <chr>
# }
```
