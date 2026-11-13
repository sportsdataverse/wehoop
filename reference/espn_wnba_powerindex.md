# **Get ESPN WNBA Season Power Index (Long Format)**

Returns ESPN's Basketball Power Index (BPI) and related per-team metrics
for one WNBA season, in long format: one row per (team x stat).

## Usage

``` r
espn_wnba_powerindex(
  season = most_recent_wnba_season(),
  season_type = c(2L, 3L),
  ...
)
```

## Arguments

- season:

  Season year (numeric). Defaults to the most recent WNBA season.

- season_type:

  Integer (1=preseason, 2=regular (default), 3=postseason).

- ...:

  Additional arguments; currently unused.

## Value

A long tibble with one row per (team x stat).

|               |           |                                        |
|---------------|-----------|----------------------------------------|
| col_name      | types     | description                            |
| league        | character | League slug (`"wnba"`).                |
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

[family_espn_wnba](https://wehoop.sportsdataverse.org/reference/family_espn_wnba.md)
lists every function in this family.

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  espn_wnba_powerindex(season = 2025)
#> ── ESPN WNBA Season Power Index ──────────────────────────────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-13 11:56:51 UTC
#> # A tibble: 0 × 12
#> # ℹ 12 variables: league <chr>, season <int>, season_type <int>, team_id <chr>,
#> #   stat_name <chr>, abbreviation <chr>, display_name <chr>, description <chr>,
#> #   value <dbl>, display_value <chr>, last_updated <chr>, team_ref <chr>
# }
```
