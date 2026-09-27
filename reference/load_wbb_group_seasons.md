# **Load conference and division names by season (WBB / WNBA) from the data repo**

Loads one row per group per season it existed, with the group's name,
short name, abbreviation, and parent group **as of that season** rather
than today's labels, plus its member count. `load_wbb_group_seasons()`
reads the `wbb_groups` release tag and `load_wnba_group_seasons()` the
`wnba_groups` tag.

## Usage

``` r
load_wbb_group_seasons(..., dbConnection = NULL, tablename = NULL)

load_wnba_group_seasons(..., dbConnection = NULL, tablename = NULL)
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

Returns a `wehoop_data` tibble with one row per group-season.

|  |  |  |
|----|----|----|
| col_name | types | description |
| league | character | League key: `wbb` or `wnba`. |
| group_id | character | SDV group id, `{league}:{slug}`. |
| season | integer | Season (WBB: ending year, 2025 = 2024-25; WNBA: calendar year). |
| level | character | Group level: `league`, `subdivision`, `conference`, or `division`. |
| name | character | Group name as of that season. |
| short_name | character | Group short name as of that season. |
| abbreviation | character | Group abbreviation as of that season. |
| parent_group_id | character | Parent group id as of that season (division to conference to subdivision or league). |
| n_teams | integer | Number of member teams that season. |

## See also

Other Conference and Division Group loader functions:
[`load_wbb_group_aliases()`](https://wehoop.sportsdataverse.org/reference/load_wbb_group_aliases.md),
[`load_wbb_groups()`](https://wehoop.sportsdataverse.org/reference/load_wbb_groups.md),
[`load_wbb_team_group_seasons()`](https://wehoop.sportsdataverse.org/reference/load_wbb_team_group_seasons.md)

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  try(load_wbb_group_seasons())
#> ─────────────────────────────────────────────────────────── wehoop 3.0.0.9000 ──
#> # A tibble: 937 × 9
#>    league group_id season level    name  short_name abbreviation parent_group_id
#>    <chr>  <chr>     <int> <chr>    <chr> <chr>      <chr>        <chr>          
#>  1 wbb    wbb:acc    2002 confere… Atla… ACC        ACC          wbb:d1         
#>  2 wbb    wbb:acc    2003 confere… Atla… ACC        ACC          wbb:d1         
#>  3 wbb    wbb:acc    2004 confere… Atla… ACC        ACC          wbb:d1         
#>  4 wbb    wbb:acc    2005 confere… Atla… ACC        ACC          wbb:d1         
#>  5 wbb    wbb:acc    2006 confere… Atla… ACC        ACC          wbb:d1         
#>  6 wbb    wbb:acc    2007 confere… Atla… ACC        ACC          wbb:d1         
#>  7 wbb    wbb:acc    2008 confere… Atla… ACC        ACC          wbb:d1         
#>  8 wbb    wbb:acc    2009 confere… Atla… ACC        ACC          wbb:d1         
#>  9 wbb    wbb:acc    2010 confere… Atla… ACC        ACC          wbb:d1         
#> 10 wbb    wbb:acc    2011 confere… Atla… ACC        ACC          wbb:d1         
#> # ℹ 927 more rows
#> # ℹ 1 more variable: n_teams <int>
# }
# \donttest{
  try(load_wnba_group_seasons())
#> ─────────────────────────────────────────────────────────── wehoop 3.0.0.9000 ──
#> # A tibble: 90 × 9
#>    league group_id  season level   name  short_name abbreviation parent_group_id
#>    <chr>  <chr>      <int> <chr>   <chr> <chr>      <chr>        <chr>          
#>  1 wnba   wnba:east   1997 confer… East… East       EAST         wnba:wnba      
#>  2 wnba   wnba:east   1998 confer… East… East       EAST         wnba:wnba      
#>  3 wnba   wnba:east   1999 confer… East… East       EAST         wnba:wnba      
#>  4 wnba   wnba:east   2000 confer… East… East       EAST         wnba:wnba      
#>  5 wnba   wnba:east   2001 confer… East… East       EAST         wnba:wnba      
#>  6 wnba   wnba:east   2002 confer… East… East       EAST         wnba:wnba      
#>  7 wnba   wnba:east   2003 confer… East… East       EAST         wnba:wnba      
#>  8 wnba   wnba:east   2004 confer… East… East       EAST         wnba:wnba      
#>  9 wnba   wnba:east   2005 confer… East… East       EAST         wnba:wnba      
#> 10 wnba   wnba:east   2006 confer… East… East       EAST         wnba:wnba      
#> # ℹ 80 more rows
#> # ℹ 1 more variable: n_teams <int>
# }
```
