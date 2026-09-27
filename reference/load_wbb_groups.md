# **Load conference and division lineages (WBB / WNBA) from the data repo**

Loads one row per group lineage – the league or subdivision, each
conference, and each division – with the first and last season each had
at least one member. A lineage keeps one `group_id` across renames that
keep continuity (American Athletic to American stays `wbb:american`); a
new body gets a new id. `load_wbb_groups()` reads the `wbb_groups`
release tag and `load_wnba_groups()` the `wnba_groups` tag.

See
[`load_wbb_group_seasons()`](https://wehoop.sportsdataverse.org/reference/load_wbb_group_seasons.md)
for per-season names and parents,
[`load_wbb_group_aliases()`](https://wehoop.sportsdataverse.org/reference/load_wbb_group_aliases.md)
for the names and ids other sources use, and
[`load_wbb_team_group_seasons()`](https://wehoop.sportsdataverse.org/reference/load_wbb_team_group_seasons.md)
for team membership.

## Usage

``` r
load_wbb_groups(..., dbConnection = NULL, tablename = NULL)

load_wnba_groups(..., dbConnection = NULL, tablename = NULL)
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

Returns a `wehoop_data` tibble with one row per group lineage.

|  |  |  |
|----|----|----|
| col_name | types | description |
| league | character | League key: `wbb` or `wnba`. |
| group_id | character | SDV group id, `{league}:{slug}` (e.g. `wbb:big-east`, `wnba:east`); one id per lineage across renames. |
| level | character | Group level: `league` (WNBA), `subdivision` (WBB Division I), `conference`, or `division`. |
| first_season | integer | First season with at least one member (WBB: ending year; WNBA: calendar year). |
| last_season | integer | Last season with at least one member (WBB: ending year; WNBA: calendar year). |
| notes | character | Lineage decisions and source caveats. |

## See also

Other Conference and Division Group loader functions:
[`load_wbb_group_aliases()`](https://wehoop.sportsdataverse.org/reference/load_wbb_group_aliases.md),
[`load_wbb_group_seasons()`](https://wehoop.sportsdataverse.org/reference/load_wbb_group_seasons.md),
[`load_wbb_team_group_seasons()`](https://wehoop.sportsdataverse.org/reference/load_wbb_team_group_seasons.md)

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  try(load_wbb_groups())
#> ─────────────────────────────────────────────────────────── wehoop 3.0.0.9000 ──
#> # A tibble: 50 × 6
#>    league group_id         level      first_season last_season notes            
#>    <chr>  <chr>            <chr>             <int>       <int> <chr>            
#>  1 wbb    wbb:acc          conference         2002        2027 NA               
#>  2 wbb    wbb:america-east conference         2002        2027 NA               
#>  3 wbb    wbb:american     conference         2014        2027 New body in 2013…
#>  4 wbb    wbb:asun         conference         2002        2027 Trans America At…
#>  5 wbb    wbb:asun-east    division           2022        2022 ESPN division 76…
#>  6 wbb    wbb:asun-west    division           2022        2022 ESPN division 77…
#>  7 wbb    wbb:atlantic-10  conference         2002        2027 NA               
#>  8 wbb    wbb:big-12       conference         2002        2027 NA               
#>  9 wbb    wbb:big-east     conference         2002        2027 Lineage follows …
#> 10 wbb    wbb:big-sky      conference         2002        2027 NA               
#> # ℹ 40 more rows
# }
# \donttest{
  try(load_wnba_groups())
#> ─────────────────────────────────────────────────────────── wehoop 3.0.0.9000 ──
#> # A tibble: 3 × 6
#>   league group_id  level      first_season last_season notes                    
#>   <chr>  <chr>     <chr>             <int>       <int> <chr>                    
#> 1 wnba   wnba:east conference         1997        2026 One lineage 1997 onward …
#> 2 wnba   wnba:west conference         1997        2026 One lineage 1997 onward …
#> 3 wnba   wnba:wnba league             1997        2026 Inaugural season 1997; c…
# }
```
