# **Load provider team id and name aliases (WBB / WNBA) from the data repo**

Loads every team id and name another source uses for an ESPN team, with
the seasons the source shows it on that team. Use it to map a Fox,
Yahoo, 247Sports, On3, Torvik, NCAA or WNBA Stats team id or name onto
the ESPN `team_id`. A source id means something only within its source
(Fox 25 is not ESPN 25), so always join on `source` as well.
`load_wbb_team_aliases()` reads the `wbb_groups` release tag and
`load_wnba_team_aliases()` the `wnba_groups` tag.

See
[`load_wbb_player_aliases()`](https://wehoop.sportsdataverse.org/reference/load_wbb_player_aliases.md)
for player ids and
[`load_wbb_group_aliases()`](https://wehoop.sportsdataverse.org/reference/load_wbb_group_aliases.md)
for conference and division aliases.

## Usage

``` r
load_wbb_team_aliases(..., dbConnection = NULL, tablename = NULL)

load_wnba_team_aliases(..., dbConnection = NULL, tablename = NULL)
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

Returns a `wehoop_data` tibble with one row per team alias, or `NULL`
after appending the rows to `tablename` when `dbConnection` and
`tablename` are both given.

|  |  |  |
|----|----|----|
| col_name | types | description |
| league | character | League key: `wbb` or `wnba`. |
| team_id | character | ESPN team id. |
| team_id_source | character | Id system of `team_id`: `espn`. |
| source | character | Source that uses the alias: `fox`, `yahoo`, `torvik`, `ncaa`, `sports247` (247Sports) or `on3` (WBB); `fox`, `yahoo` or `wnba_stats` (WNBA). |
| source_id | character | The source's own team id (e.g. `25`, `wnba.t.6`; Yahoo's WNBA number is not the ESPN id); `NA` for a name-only source (Torvik). |
| id_kind | character | `team` (the source's id for this sport's team) or `school` (one id for every sport of a school: the stats.ncaa.org org id, 247Sports `institutionKey`, On3 `orgKey`). |
| name_kind | character | `name` or `abbreviation` when the source gives its own spelling, else `NA`. An id with a name and an abbreviation is two rows. |
| value | character | The source's own spelling of the name or abbreviation; `NA` when `name_kind` is `NA`. |
| valid_from | integer | First season (WBB: ending year; WNBA: calendar year) the source shows this id or name on the team, inclusive. |
| valid_to | integer | Last season (WBB: ending year; WNBA: calendar year) the source shows this id or name on the team, inclusive; a gap in the source splits the window into two rows. |
| match_method | character | How the row was matched: `deterministic` (a formula or shared key), `crosswalk` (carried from a published crosswalk), `curated` (a cited hand-made map); for a captured team directory, `alias`, `exact_name` (normalized name) or `dict` (curated name dictionary). |
| evidence | character | The asset or file the row came from. |

## See also

Other Conference and Division Group loader functions:
[`load_wbb_group_aliases()`](https://wehoop.sportsdataverse.org/reference/load_wbb_group_aliases.md),
[`load_wbb_group_seasons()`](https://wehoop.sportsdataverse.org/reference/load_wbb_group_seasons.md),
[`load_wbb_groups()`](https://wehoop.sportsdataverse.org/reference/load_wbb_groups.md),
[`load_wbb_player_aliases()`](https://wehoop.sportsdataverse.org/reference/load_wbb_player_aliases.md),
[`load_wbb_team_group_seasons()`](https://wehoop.sportsdataverse.org/reference/load_wbb_team_group_seasons.md)

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  try(load_wbb_team_aliases())
#> ──────────────────────────────────────────────────────────────── wehoop 3.1.0 ──
#> # A tibble: 2,486 × 12
#>    league team_id team_id_source source    source_id  id_kind name_kind value   
#>    <chr>  <chr>   <chr>          <chr>     <chr>      <chr>   <chr>     <chr>   
#>  1 wbb    103     espn           fox       36         team    name      Boston …
#>  2 wbb    103     espn           ncaa      67         school  NA        NA      
#>  3 wbb    103     espn           on3       20485      school  name      Boston …
#>  4 wbb    103     espn           sports247 24007      school  name      Boston …
#>  5 wbb    103     espn           torvik    NA         team    name      Boston …
#>  6 wbb    103     espn           yahoo     ncaaw.t.58 team    name      Boston …
#>  7 wbb    103     espn           yahoo     ncaaw.t.58 team    name      Boston …
#>  8 wbb    104     espn           fox       259        team    name      Boston …
#>  9 wbb    104     espn           ncaa      68         school  NA        NA      
#> 10 wbb    104     espn           on3       20481      school  name      Boston …
#> # ℹ 2,476 more rows
#> # ℹ 4 more variables: valid_from <int>, valid_to <int>, match_method <chr>,
#> #   evidence <chr>
# }
# \donttest{
  try(load_wnba_team_aliases())
#> ──────────────────────────────────────────────────────────────── wehoop 3.1.0 ──
#> # A tibble: 68 × 12
#>    league team_id team_id_source source     source_id  id_kind name_kind   value
#>    <chr>  <chr>   <chr>          <chr>      <chr>      <chr>   <chr>       <chr>
#>  1 wnba   1       espn           wnba_stats 1611661314 team    NA          NA   
#>  2 wnba   10      espn           wnba_stats 1611661323 team    NA          NA   
#>  3 wnba   11      espn           fox        10         team    name        Phoe…
#>  4 wnba   11      espn           wnba_stats 1611661317 team    NA          NA   
#>  5 wnba   11      espn           yahoo      wnba.t.6   team    abbreviati… PHX  
#>  6 wnba   11      espn           yahoo      wnba.t.6   team    name        Phoe…
#>  7 wnba   129689  espn           fox        23         team    name        Gold…
#>  8 wnba   129689  espn           wnba_stats 1611661331 team    NA          NA   
#>  9 wnba   129689  espn           yahoo      wnba.t.19  team    abbreviati… GSV  
#> 10 wnba   129689  espn           yahoo      wnba.t.19  team    name        Gold…
#> # ℹ 58 more rows
#> # ℹ 4 more variables: valid_from <int>, valid_to <int>, match_method <chr>,
#> #   evidence <chr>
# }
```
