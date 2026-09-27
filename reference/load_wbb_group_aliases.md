# **Load conference and division aliases (WBB / WNBA) from the data repo**

Loads every name and id that a source (ESPN, NCAA, WNBA Stats, SDV) uses
for a group, with the seasons each alias is valid for. Use it to map a
source's conference id or name onto an SDV `group_id`.
`load_wbb_group_aliases()` reads the `wbb_groups` release tag and
`load_wnba_group_aliases()` the `wnba_groups` tag.

## Usage

``` r
load_wbb_group_aliases(..., dbConnection = NULL, tablename = NULL)

load_wnba_group_aliases(..., dbConnection = NULL, tablename = NULL)
```

## Arguments

- ...:

  Additional arguments passed to an underlying function that writes the
  data into a database.

- dbConnection:

  A `DBIConnection` object, as returned by
  [`DBI::dbConnect()`](https://dbi.r-dbi.org/reference/dbConnect.html)

- tablename:

  The name of the data table within the database

## Value

Returns a `wehoop_data` tibble with one row per alias.

|  |  |  |
|----|----|----|
| col_name | types | description |
| league | character | League key: `wbb` or `wnba`. |
| group_id | character | SDV group id, `{league}:{slug}`. |
| source | character | Source that uses the alias: `espn`, `ncaa` or `sdv` (WBB); `espn`, `wnba_stats` or `sdv` (WNBA). |
| source_id | character | The source's own id for the group (e.g. ESPN group id, NCAA conference id), when it has one. |
| name_kind | character | Kind of alias: `name`, `short_name`, `abbreviation`, `slug`, or `code`. |
| value | character | The alias itself. |
| valid_from | integer | First season the alias applies, inclusive; `NA` means unbounded. |
| valid_to | integer | Last season the alias applies, inclusive; `NA` means unbounded. |

## See also

Other Conference and Division Group loader functions:
[`load_wbb_group_seasons()`](https://wehoop.sportsdataverse.org/reference/load_wbb_group_seasons.md),
[`load_wbb_groups()`](https://wehoop.sportsdataverse.org/reference/load_wbb_groups.md),
[`load_wbb_team_group_seasons()`](https://wehoop.sportsdataverse.org/reference/load_wbb_team_group_seasons.md)

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  try(load_wbb_group_aliases())
#> ─────────────────────────────────────────────────────────── wehoop 3.0.0.9000 ──
#> # A tibble: 373 × 8
#>    league group_id         source source_id name_kind  value valid_from valid_to
#>    <chr>  <chr>            <chr>  <chr>     <chr>      <chr>      <int>    <int>
#>  1 wbb    wbb:acc          espn   2         abbreviat… acc         2002     2027
#>  2 wbb    wbb:acc          espn   2         name       Atla…       2002     2027
#>  3 wbb    wbb:acc          espn   2         short_name ACC         2002     2027
#>  4 wbb    wbb:acc          espn   2         slug       atla…       2002     2027
#>  5 wbb    wbb:acc          ncaa   821       short_name ACC         2010     2025
#>  6 wbb    wbb:acc          sdv    NA        abbreviat… ACC           NA       NA
#>  7 wbb    wbb:acc          sdv    NA        name       Atla…         NA       NA
#>  8 wbb    wbb:acc          sdv    NA        short_name ACC           NA       NA
#>  9 wbb    wbb:america-east espn   1         abbreviat… aeast       2002     2027
#> 10 wbb    wbb:america-east espn   1         name       Amer…       2002     2027
#> # ℹ 363 more rows
# }
# \donttest{
  try(load_wnba_group_aliases())
#> ─────────────────────────────────────────────────────────── wehoop 3.0.0.9000 ──
#> # A tibble: 17 × 8
#>    league group_id  source     source_id name_kind    value  valid_from valid_to
#>    <chr>  <chr>     <chr>      <chr>     <chr>        <chr>       <int>    <int>
#>  1 wnba   wnba:east espn       1         abbreviation E            1997       NA
#>  2 wnba   wnba:east espn       1         name         Easte…       1997       NA
#>  3 wnba   wnba:east espn       1         slug         easte…       1997       NA
#>  4 wnba   wnba:east sdv        NA        abbreviation EAST         1997       NA
#>  5 wnba   wnba:east sdv        NA        name         Easte…       1997       NA
#>  6 wnba   wnba:east sdv        NA        short_name   East         1997       NA
#>  7 wnba   wnba:east wnba_stats NA        name         East         1997       NA
#>  8 wnba   wnba:west espn       2         abbreviation W            1997       NA
#>  9 wnba   wnba:west espn       2         name         Weste…       1997       NA
#> 10 wnba   wnba:west espn       2         slug         weste…       1997       NA
#> 11 wnba   wnba:west sdv        NA        abbreviation WEST         1997       NA
#> 12 wnba   wnba:west sdv        NA        name         Weste…       1997       NA
#> 13 wnba   wnba:west sdv        NA        short_name   West         1997       NA
#> 14 wnba   wnba:west wnba_stats NA        name         West         1997       NA
#> 15 wnba   wnba:wnba sdv        NA        abbreviation WNBA         1997       NA
#> 16 wnba   wnba:wnba sdv        NA        name         Women…       1997       NA
#> 17 wnba   wnba:wnba sdv        NA        short_name   WNBA         1997       NA
# }
```
