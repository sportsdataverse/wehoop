# **Get ESPN WNBA Season Award Detail**

Returns the name, description, and winners of one WNBA season award.

## Usage

``` r
espn_wnba_award(award_id, season = most_recent_wnba_season(), ...)
```

## Arguments

- award_id:

  ESPN award identifier (character or numeric).

- season:

  Season year (numeric). Defaults to the most recent WNBA season.

- ...:

  Additional arguments; currently unused.

## Value

A tibble with one row per winner.

|             |           |                                                 |
|-------------|-----------|-------------------------------------------------|
| col_name    | types     | description                                     |
| league      | character | League slug (`"wnba"`).                         |
| season      | integer   | Season year.                                    |
| award_id    | character | ESPN award identifier.                          |
| name        | character | Award name.                                     |
| description | character | Award description.                              |
| athlete_id  | character | ESPN athlete id of winner.                      |
| team_id     | character | ESPN team id.                                   |
| athlete_ref | character | `$ref` to winner's per-season athlete resource. |
| team_ref    | character | `$ref` to winner's per-season team resource.    |

## See also

[family_espn_wnba](https://wehoop.sportsdataverse.org/reference/family_espn_wnba.md)
lists every function in this family.

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  espn_wnba_award(award_id = 247, season = 2024)
#> ── ESPN WNBA Season Award Detail from ESPN.com ───────────────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-13 14:50:10 UTC
#> # A tibble: 1 × 9
#>   league season award_id name         description athlete_id team_id athlete_ref
#>   <chr>   <int> <chr>    <chr>        <chr>       <chr>      <chr>   <chr>      
#> 1 wnba     2024 247      Rookie of t… WNBA Rooki… 4433403    5       http://spo…
#> # ℹ 1 more variable: team_ref <chr>
# }
```
