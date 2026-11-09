# **Get ESPN WNBA Free Agents**

**Get ESPN WNBA Free Agents**

**Get ESPN WNBA Free Agents**

## Usage

``` r
espn_wnba_freeagents(season = most_recent_wnba_season(), ...)
```

## Arguments

- season:

  Season year (numeric, e.g. 2025). Defaults to the most recent WNBA
  season.

- ...:

  Additional arguments; currently unused but retained for forward
  compatibility. Proxy configuration should use
  `options(wehoop.proxy = ...)`.

## Value

A `wehoop_data` tibble with one row per free agent:

|  |  |  |
|----|----|----|
| col_name | types | description |
| season | integer | Season identifier (4-digit year or 'YYYY-YY' string). |
| athlete_id | character | Unique athlete identifier (ESPN). |
| athlete_name | character | Athlete display name (ESPN). |
| position | character | Listed roster position (G, F, C, etc.). |
| prior_team_id | character | Unique identifier for prior team. |
| status | character | Status label. |
| signed_team_id | character | Unique identifier for signed team. |
| signed_date | character | Date in YYYY-MM-DD format. |
| contract_value | character | Contract value. |
| contract_term_years | character | Contract term years. |

## Details

Calls the ESPN core-v2 endpoint
`https://sports.core.api.espn.com/v2/sports/basketball/leagues/wnba/seasons/{year}/freeagents`.
As of 2026-05, this endpoint returns HTTP 500 for every season tested
and there is no documented replacement; the function consequently
returns an empty tibble and emits a CLI error message. It is retained so
that downstream code does not break if ESPN restores the endpoint, but
should not be relied on in the meantime.

## See also

[family_espn_wnba](https://wehoop.sportsdataverse.org/reference/family_espn_wnba.md)
lists every function in this family.

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  espn_wnba_freeagents(season = 2025)
#> ✖ 2026-11-09 23:09:19.472984: Failed to retrieve ESPN WNBA free agents for season 2025
#> ✖ Args: season = 2025
#> ✖ Error: The API returned an error
#> data frame with 0 columns and 0 rows
# }
```
