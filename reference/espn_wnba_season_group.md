# **Get ESPN WNBA Season Group Detail**

Returns metadata for one group (conference or division) in one (WNBA
season x season-type), plus `$ref` URLs to its parent group, children
groups, member teams, and standings.

Returns the list of child groups (e.g. divisions within a conference)
for one (WNBA season x season-type x parent-group).

Returns the list of team IDs that belong to one group (conference or
division) for one (WNBA season x season-type).

## Usage

``` r
espn_wnba_season_group(
  group_id,
  season = most_recent_wnba_season(),
  season_type = 2L,
  ...
)

espn_wnba_season_group_children(
  group_id,
  season = most_recent_wnba_season(),
  season_type = 2L,
  ...
)

espn_wnba_season_group_teams(
  group_id,
  season = most_recent_wnba_season(),
  season_type = 2L,
  ...
)
```

## Arguments

- group_id:

  ESPN group identifier.

- season:

  Season year. Defaults to most recent WNBA season.

- season_type:

  Season-type id (2 = regular (default)).

- ...:

  Additional arguments; currently unused.

## Value

A single-row tibble.

Columns as documented in the shared
[espn_basketball_season_group_schema](https://wehoop.sportsdataverse.org/reference/espn_basketball_season_group_schema.md)
table.

A tibble with one row per child group.

|                 |           |                               |
|-----------------|-----------|-------------------------------|
| col_name        | types     | description                   |
| league          | character | League slug.                  |
| season          | integer   | Season year.                  |
| season_type     | integer   | Season-type id.               |
| parent_group_id | character | Parent group id (queried).    |
| child_group_id  | character | Child group id.               |
| ref             | character | `$ref` to child group detail. |

A tibble with one row per team in the group.

|             |           |                                         |
|-------------|-----------|-----------------------------------------|
| col_name    | types     | description                             |
| league      | character | League slug.                            |
| season      | integer   | Season year.                            |
| season_type | integer   | Season-type id.                         |
| group_id    | character | ESPN group id.                          |
| team_id     | character | ESPN team id.                           |
| ref         | character | `$ref` URL to the team-in-season entry. |

## Details

**Get ESPN WNBA Season Group Detail**

**Get ESPN WNBA Season Group Children Index**

**Get ESPN WNBA Season Group Teams Index**

## See also

[family_espn_wnba](https://wehoop.sportsdataverse.org/reference/family_espn_wnba.md)
lists every function in this family.

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  espn_wnba_season_group(group_id = 5, season = 2025)
#> ── ESPN WNBA Season Group Detail ─────────────────────────────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-09 21:10:24 UTC
#> # A tibble: 1 × 15
#>   league season season_type group_id uid           name  abbreviation short_name
#>   <chr>   <int>       <int> <chr>    <chr>         <chr> <chr>        <chr>     
#> 1 wnba     2025           2 5        s:40~l:59~g:5 Inte… INTL         NA        
#> # ℹ 7 more variables: midsize_name <chr>, is_conference <lgl>, slug <chr>,
#> #   parent_ref <chr>, children_ref <chr>, teams_ref <chr>, standings_ref <chr>
# }
# \donttest{
  espn_wnba_season_group_children(group_id = 5, season = 2025)
#> ── ESPN WNBA Season Group Children Index ─────────────────────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-09 21:10:24 UTC
#> # A tibble: 0 × 6
#> # ℹ 6 variables: league <chr>, season <int>, season_type <int>,
#> #   parent_group_id <chr>, child_group_id <chr>, ref <chr>
# }
# \donttest{
  espn_wnba_season_group_teams(group_id = 5, season = 2025)
#> ── ESPN WNBA Season Group Teams Index ────────────────────────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-09 21:10:24 UTC
#> # A tibble: 1 × 6
#>   league season season_type group_id team_id ref                                
#>   <chr>   <int>       <int> <chr>    <chr>   <chr>                              
#> 1 wnba     2025           2 5        17473   http://sports.core.api.espn.com/v2…
# }
```
