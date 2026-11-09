# **Get ESPN WNBA Draft Picks**

**Get ESPN WNBA Draft Picks**

**Get ESPN WNBA Draft Picks**

## Usage

``` r
espn_wnba_draft(season = most_recent_wnba_season(), ...)
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

A `wehoop_data` tibble with one row per draft pick:

|  |  |  |
|----|----|----|
| col_name | types | description |
| season | integer | Season identifier (4-digit year or 'YYYY-YY' string). |
| round | integer | Tournament / playoff round. |
| pick | integer | Pick. |
| overall | integer | Overall. |
| traded | logical | Traded. |
| trade_note | character | Trade note. |
| status | character | Status label. |
| athlete_id | character | Unique athlete identifier (ESPN). |
| athlete_ref | character | Athlete ref. |
| team_id | character | Unique team identifier. |
| team_ref | character | Team ref. |

Athlete and team details (name, position, college, abbreviation) are not
inlined in the draft response; resolve them via
[`espn_wnba_player_info()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_player_info.md)
or
[`espn_wnba_team()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team.md)
using the returned IDs.

## Details

Calls the ESPN core-v2 endpoint
`https://sports.core.api.espn.com/v2/sports/basketball/leagues/wnba/seasons/{year}/draft/rounds`,
which returns each round of the draft with its picks inlined as
`picks: [...]`. For historical seasons with no ESPN draft data the
function returns an empty tibble rather than erroring.

## See also

[family_espn_wnba](https://wehoop.sportsdataverse.org/reference/family_espn_wnba.md)
lists every function in this family.

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  espn_wnba_draft(season = 2024)
#> ── ESPN WNBA Draft Picks from ESPN.com ───────────────────────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-09 20:19:33 UTC
#> # A tibble: 36 × 11
#>    season round  pick overall traded trade_note    status athlete_id athlete_ref
#>     <int> <int> <int>   <int> <lgl>  <chr>         <chr>  <chr>      <chr>      
#>  1   2024     1     1       1 FALSE  NA            SELEC… 108565     http://spo…
#>  2   2024     1     2       2 FALSE  NA            SELEC… 108566     http://spo…
#>  3   2024     1     3       3 TRUE   From PHX      SELEC… 108569     http://spo…
#>  4   2024     1     4       4 TRUE   From SEA      SELEC… 108567     http://spo…
#>  5   2024     1     5       5 TRUE   From CHI      SELEC… 108570     http://spo…
#>  6   2024     1     6       6 FALSE  NA            SELEC… 108568     http://spo…
#>  7   2024     1     7       7 TRUE   From MIN      SELEC… 108572     http://spo…
#>  8   2024     1     8       8 TRUE   From CHI via… SELEC… 108574     http://spo…
#>  9   2024     1     9       9 FALSE  NA            SELEC… 108581     http://spo…
#> 10   2024     1    10      10 FALSE  NA            SELEC… 108577     http://spo…
#> # ℹ 26 more rows
#> # ℹ 2 more variables: team_id <chr>, team_ref <chr>
# }
```
