# **Get ESPN Women's College Basketball Injuries**

**Get ESPN Women's College Basketball Injuries**

**Get ESPN Women's College Basketball Injuries**

## Usage

``` r
espn_wbb_injuries(season = most_recent_wbb_season(), ...)
```

## Arguments

- season:

  Numeric or character season year (e.g. `2025`). The ESPN injury
  endpoint does not filter by season server-side; the value is attached
  as a constant column on the returned tibble for downstream joins.
  Defaults to
  [`most_recent_wbb_season()`](https://wehoop.sportsdataverse.org/reference/most_recent_wbb_season.md).

- ...:

  Currently unused; reserved for future argument threading.

## Value

Returns a tibble of league-wide WBB injury records. ESPN's WBB injury
data is typically sparse; the function returns an empty tibble (zero
rows) when no injuries are reported.

**Injuries**

Columns as documented in the shared
[espn_basketball_injuries_schema](https://wehoop.sportsdataverse.org/reference/espn_basketball_injuries_schema.md)
table.

## See also

[family_espn_wbb](https://wehoop.sportsdataverse.org/reference/family_espn_wbb.md)
lists every function in this family.

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  espn_wbb_injuries()
# }
```
