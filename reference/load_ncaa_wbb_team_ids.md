# **Load the NCAA women's college basketball team-id crosswalk from the data repo**

Loads the season-level stats.ncaa.org team-id / conference crosswalk for
NCAA women's college basketball – one row per team-season. Useful for
joining `ncaa_team_id` columns on the other `ncaa_wbb_*` datasets back
to a team name and conference. Produced by the sdv-py `ncaa_wbb` engine;
backed by the `ncaa-wbb-hoops-data` pipeline, published to the
`ncaa_wbb_team_ids` release tag as csv.gz/parquet/rds.

## Usage

``` r
load_ncaa_wbb_team_ids(
  seasons = most_recent_wbb_season(),
  ...,
  dbConnection = NULL,
  tablename = NULL
)
```

## Arguments

- seasons:

  A vector of 4-digit season-ending years for NCAA women's college
  basketball (e.g. `2024` for the 2023-24 season). Published coverage
  runs 2010 through the most recent season, with no gaps. Pass
  `seasons = TRUE` for every published season. (Min: 2010)

- ...:

  Additional arguments passed to an underlying function that writes the
  season data into a database.

- dbConnection:

  A `DBIConnection` object, as returned by
  [`DBI::dbConnect()`](https://dbi.r-dbi.org/reference/dbConnect.html)

- tablename:

  The name of the data table within the database

## Value

Returns a `wehoop_data` tibble with one row per team-season.

|            |           |                                                 |
|------------|-----------|-------------------------------------------------|
| col_name   | types     | description                                     |
| team       | character | Team name.                                      |
| conference | character | Conference affiliation.                         |
| id         | character | stats.ncaa.org team identifier.                 |
| season     | integer   | Season identifier (4-digit season-ending year). |

## See also

Other NCAA WBB loader functions:
[`load_ncaa_wbb_lineups()`](https://wehoop.sportsdataverse.org/reference/load_ncaa_wbb_lineups.md),
[`load_ncaa_wbb_matchup_stints()`](https://wehoop.sportsdataverse.org/reference/load_ncaa_wbb_matchup_stints.md),
[`load_ncaa_wbb_pbp()`](https://wehoop.sportsdataverse.org/reference/load_ncaa_wbb_pbp.md),
[`load_ncaa_wbb_player_box()`](https://wehoop.sportsdataverse.org/reference/load_ncaa_wbb_player_box.md),
[`load_ncaa_wbb_possessions()`](https://wehoop.sportsdataverse.org/reference/load_ncaa_wbb_possessions.md),
[`load_ncaa_wbb_rapm()`](https://wehoop.sportsdataverse.org/reference/load_ncaa_wbb_rapm.md),
[`load_ncaa_wbb_rapm_within_team()`](https://wehoop.sportsdataverse.org/reference/load_ncaa_wbb_rapm_within_team.md),
[`load_ncaa_wbb_rosters()`](https://wehoop.sportsdataverse.org/reference/load_ncaa_wbb_rosters.md),
[`load_ncaa_wbb_schedule()`](https://wehoop.sportsdataverse.org/reference/load_ncaa_wbb_schedule.md),
[`load_ncaa_wbb_shots()`](https://wehoop.sportsdataverse.org/reference/load_ncaa_wbb_shots.md),
[`load_ncaa_wbb_team_box()`](https://wehoop.sportsdataverse.org/reference/load_ncaa_wbb_team_box.md),
[`load_ncaa_wbb_team_rosters()`](https://wehoop.sportsdataverse.org/reference/load_ncaa_wbb_team_rosters.md)

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  try(load_ncaa_wbb_team_ids(seasons = most_recent_wbb_season()))
#> ──────────────────────────────────────────────────────────────── wehoop 3.0.0 ──
#> # A tibble: 359 × 4
#>    team               conference id     season
#>    <chr>              <chr>      <chr>   <int>
#>  1 A&M-Corpus Christi Southland  610016   2026
#>  2 Abilene Christian  WAC        610128   2026
#>  3 Air Force          MWC        609930   2026
#>  4 Akron              MAC        610133   2026
#>  5 Alabama            SEC        610143   2026
#>  6 Alabama A&M        SWAC       610135   2026
#>  7 Alabama St.        SWAC       610138   2026
#>  8 Alcorn             SWAC       610153   2026
#>  9 American           Patriot    610157   2026
#> 10 App State          Sun Belt   610159   2026
#> # ℹ 349 more rows
# }
```
