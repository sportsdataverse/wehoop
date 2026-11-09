# **Get ESPN WNBA Draft Pick Detail**

Returns a single WNBA draft pick. Defaults to the most recent WNBA
season's \#1 overall pick. For a full draft, use
[`espn_wnba_draft()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_draft.md).

## Usage

``` r
espn_wnba_draft_pick(
  season = most_recent_wnba_season(),
  round = 1L,
  pick = 1L,
  ...
)
```

## Arguments

- season:

  Season year. Defaults to most recent WNBA season.

- round:

  Draft round (default 1).

- pick:

  Pick number within the round (default 1).

- ...:

  Additional arguments; currently unused.

## Value

A single-row tibble.

|             |           |                              |
|-------------|-----------|------------------------------|
| col_name    | types     | description                  |
| league      | character | League slug.                 |
| season      | integer   | Season year of the draft.    |
| round       | integer   | Round number.                |
| pick        | integer   | Pick within the round.       |
| overall     | integer   | Overall pick number.         |
| traded      | logical   | Whether the pick was traded. |
| trade_note  | character | Trade note (if any).         |
| status      | character | Pick status name.            |
| athlete_id  | character | Drafted athlete's ESPN id.   |
| team_id     | character | Drafting team's ESPN id.     |
| athlete_ref | character | `$ref` to athlete.           |
| team_ref    | character | `$ref` to team.              |

## Details

**Get ESPN WNBA Draft Pick Detail**

## See also

[family_espn_wnba](https://wehoop.sportsdataverse.org/reference/family_espn_wnba.md)
lists every function in this family.

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  espn_wnba_draft_pick(season = 2024, round = 1, pick = 1)
#> ── ESPN WNBA Draft Pick Detail ───────────────────────────────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-09 23:09:18 UTC
#> # A tibble: 1 × 12
#>   league season round  pick overall traded trade_note status  athlete_id team_id
#>   <chr>   <int> <int> <int>   <int> <lgl>  <chr>      <chr>   <chr>      <chr>  
#> 1 wnba     2024     1     1       1 FALSE  NA         SELECT… 108565     5      
#> # ℹ 2 more variables: athlete_ref <chr>, team_ref <chr>
# }
```
