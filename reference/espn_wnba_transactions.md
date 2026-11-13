# **Get ESPN WNBA Transactions**

**Get ESPN WNBA Transactions**

**Get ESPN WNBA Transactions**

## Usage

``` r
espn_wnba_transactions(season = most_recent_wnba_season(), limit = 100, ...)
```

## Arguments

- season:

  Season year (numeric, e.g. 2025). Defaults to the most recent WNBA
  season.

- limit:

  Maximum number of transactions to return (integer). Default `100`.

- ...:

  Additional arguments; currently unused but retained for forward
  compatibility. Proxy configuration should use
  `options(wehoop.proxy = ...)`.

## Value

A `wehoop_data` tibble with one row per transaction:

|                |           |                                    |
|----------------|-----------|------------------------------------|
| col_name       | types     | description                        |
| transaction_id | character | Unique identifier for transaction. |
| date           | character | Date in YYYY-MM-DD format.         |
| type           | character | Record type / category.            |
| description    | character | Long-form description text.        |
| team_id        | character | Unique team identifier.            |
| athlete_id     | character | Unique athlete identifier (ESPN).  |
| athlete_name   | character | Athlete display name (ESPN).       |
| from_team_id   | character | Unique identifier for from team.   |
| to_team_id     | character | Unique identifier for to team.     |

## Details

Calls the ESPN site-v2 endpoint
`https://site.api.espn.com/apis/site/v2/sports/basketball/wnba/transactions?season={year}&limit={limit}`.
Releases have a `NULL` `to_team_id`; those are stored as `NA`. Returns
an empty tibble rather than erroring when no transactions are available.

## See also

[family_espn_wnba](https://wehoop.sportsdataverse.org/reference/family_espn_wnba.md)
lists every function in this family.

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  espn_wnba_transactions(season = 2025, limit = 10)
#> ── ESPN WNBA Transactions from ESPN.com ──────────────────────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-13 14:50:37 UTC
#> # A tibble: 10 × 9
#>    transaction_id date         type  description team_id athlete_id athlete_name
#>    <chr>          <chr>        <chr> <chr>       <chr>   <chr>      <chr>       
#>  1 NA             2025-09-18T… NA    Released h… 9       NA         NA          
#>  2 NA             2025-09-06T… NA    Signed G V… 129689  NA         NA          
#>  3 NA             2025-09-06T… NA    Signed F/C… 11      NA         NA          
#>  4 NA             2025-09-06T… NA    Signed C J… 9       NA         NA          
#>  5 NA             2025-09-06T… NA    Signed F E… 6       NA         NA          
#>  6 NA             2025-09-05T… NA    Released G… 3       NA         NA          
#>  7 NA             2025-09-04T… NA    Released G… 5       NA         NA          
#>  8 NA             2025-09-04T… NA    Released C… 3       NA         NA          
#>  9 NA             2025-09-03T… NA    Released C… 129689  NA         NA          
#> 10 NA             2025-09-01T… NA    Released G… 5       NA         NA          
#> # ℹ 2 more variables: from_team_id <chr>, to_team_id <chr>
# }
```
