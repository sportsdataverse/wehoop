# **Load provider player id aliases (WBB / WNBA) from the data repo**

Loads every player id another source uses for an ESPN athlete, with the
ESPN team the athlete was on and the seasons the id held. Use it to map
an NCAA (stats.ncaa.org), Fox, Yahoo or WNBA Stats player id onto the
ESPN `athlete_id`. stats.ncaa.org roster ids are new every season, so an
NCAA player has one row per season. Unmatched provider ids are not
included. `load_wbb_player_aliases()` reads the `wbb_groups` release tag
and `load_wnba_player_aliases()` the `wnba_groups` tag.

See
[`load_wbb_team_aliases()`](https://wehoop.sportsdataverse.org/reference/load_wbb_team_aliases.md)
for team ids and names.

## Usage

``` r
load_wbb_player_aliases(..., dbConnection = NULL, tablename = NULL)

load_wnba_player_aliases(..., dbConnection = NULL, tablename = NULL)
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

Returns a `wehoop_data` tibble with one row per player alias, or `NULL`
after appending the rows to `tablename` when `dbConnection` and
`tablename` are both given.

|  |  |  |
|----|----|----|
| col_name | types | description |
| league | character | League key: `wbb` or `wnba`. |
| athlete_id | character | ESPN athlete id. |
| athlete_id_source | character | Id system of `athlete_id`: `espn`. |
| source | character | Source of the player id: `ncaa`, `fox` or `yahoo` (WBB); `wnba_stats`, `fox` or `yahoo` (WNBA). |
| source_player_id | character | The source's own player id (e.g. `202270`, `76284`). |
| team_id | character | ESPN team id of the team the athlete was on when matched. |
| source_team_id | character | The source's own team id when it gives one (the season's stats.ncaa.org team id), else `NA`. |
| valid_from | integer | First season (WBB: ending year; WNBA: calendar year) the id is on that team, inclusive. |
| valid_to | integer | Last season (WBB: ending year; WNBA: calendar year) the id is on that team, inclusive; a gap or a change of match method splits the window into two rows. |
| match_method | character | How the id was matched: the source leg's own method (`exact_name`, `fuzzy_jw`; NCAA `name_jersey`, `name`, `last_jersey`, `jaro_winkler`), `crosswalk` (a leg that names none), `propagated` (carried from the same id's match in another season) or `override` (a hand-verified fix). |
| match_confidence | numeric | The leg's own confidence where it gives one (the lowest in the window; NCAA tiers score 1, 0.95, 0.9 and 0.85), else `NA`. |
| evidence | character | The asset or file the row came from. |

## See also

Other Conference and Division Group loader functions:
[`load_wbb_group_aliases()`](https://wehoop.sportsdataverse.org/reference/load_wbb_group_aliases.md),
[`load_wbb_group_seasons()`](https://wehoop.sportsdataverse.org/reference/load_wbb_group_seasons.md),
[`load_wbb_groups()`](https://wehoop.sportsdataverse.org/reference/load_wbb_groups.md),
[`load_wbb_team_aliases()`](https://wehoop.sportsdataverse.org/reference/load_wbb_team_aliases.md),
[`load_wbb_team_group_seasons()`](https://wehoop.sportsdataverse.org/reference/load_wbb_team_group_seasons.md)

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  try(load_wbb_player_aliases())
#> ──────────────────────────────────────────────────────────────── wehoop 3.1.0 ──
#> # A tibble: 76,968 × 12
#>    league athlete_id athlete_id_source source source_player_id team_id
#>    <chr>  <chr>      <chr>             <chr>  <chr>            <chr>  
#>  1 wbb    10002      espn              ncaa   3564815          58     
#>  2 wbb    10020      espn              ncaa   3320179          2439   
#>  3 wbb    10022      espn              ncaa   3740564          2320   
#>  4 wbb    10026      espn              ncaa   3568132          2535   
#>  5 wbb    10026      espn              ncaa   3736731          2535   
#>  6 wbb    10027      espn              ncaa   3328801          99     
#>  7 wbb    10027      espn              ncaa   3566167          99     
#>  8 wbb    10028      espn              ncaa   3576633          2670   
#>  9 wbb    10029      espn              ncaa   3727937          166    
#> 10 wbb    10035      espn              ncaa   3288173          2427   
#> # ℹ 76,958 more rows
#> # ℹ 6 more variables: source_team_id <chr>, valid_from <int>, valid_to <int>,
#> #   match_method <chr>, match_confidence <dbl>, evidence <chr>
# }
# \donttest{
  try(load_wnba_player_aliases())
#> ──────────────────────────────────────────────────────────────── wehoop 3.1.0 ──
#> # A tibble: 3,512 × 12
#>    league athlete_id athlete_id_source source     source_player_id team_id
#>    <chr>  <chr>      <chr>             <chr>      <chr>            <chr>  
#>  1 wnba   1          espn              wnba_stats 100027           6      
#>  2 wnba   1          espn              wnba_stats 100027           16     
#>  3 wnba   1          espn              wnba_stats 100027           4      
#>  4 wnba   10         espn              wnba_stats 100724           6      
#>  5 wnba   10         espn              wnba_stats 100724           16     
#>  6 wnba   10         espn              wnba_stats 100724           20     
#>  7 wnba   10         espn              wnba_stats 100724           3      
#>  8 wnba   1001       espn              wnba_stats 202270           14     
#>  9 wnba   1001       espn              wnba_stats 202657           11     
#> 10 wnba   1002       espn              fox        80               20     
#> # ℹ 3,502 more rows
#> # ℹ 6 more variables: source_team_id <chr>, valid_from <int>, valid_to <int>,
#> #   match_method <chr>, match_confidence <dbl>, evidence <chr>
# }
```
