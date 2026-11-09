# **Get ESPN WBB Tournament Detail**

Returns metadata for a single WBB tournament plus the `$ref` URL for the
tournament's seasons list. Tournament IDs of interest include the NCAA
Tournament and WNIT (resolve via
[`espn_wbb_tournaments()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_tournaments.md)).

## Usage

``` r
espn_wbb_tournament(tournament_id, ...)
```

## Arguments

- tournament_id:

  ESPN tournament identifier.

- ...:

  Additional arguments; currently unused.

## Value

A single-row tibble.

|               |           |                                      |
|---------------|-----------|--------------------------------------|
| col_name      | types     | description                          |
| tournament_id | character | ESPN tournament identifier.          |
| display_name  | character | Human-readable tournament name.      |
| seasons_ref   | character | `$ref` to the seasons-list endpoint. |
| league        | character | League slug.                         |

## See also

[family_espn_wbb](https://wehoop.sportsdataverse.org/reference/family_espn_wbb.md)
lists every function in this family.

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  espn_wbb_tournament(tournament_id = 3)
#> ── ESPN WOMENS-COLLEGE-BASKETBALL Tournament Detail ──────────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-09 21:10:03 UTC
#> # A tibble: 1 × 4
#>   tournament_id display_name                   seasons_ref                league
#>   <chr>         <chr>                          <chr>                      <chr> 
#> 1 3             Atlantic Coast Conf Tournament http://sports.core.api.es… women…
# }
```
