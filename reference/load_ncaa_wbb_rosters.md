# **Load NCAA women's college basketball season rosters from the data repo**

Loads a lightweight season roster for NCAA women's college basketball –
one row per player-team-season with a games-played count. For the fuller
roster (jersey, class, position, height, hometown, high school), use
[`load_ncaa_wbb_team_rosters()`](https://wehoop.sportsdataverse.org/reference/load_ncaa_wbb_team_rosters.md).
Produced by the sdv-py `ncaa_wbb` engine; backed by the
`ncaa-wbb-hoops-data` pipeline, published to the `ncaa_wbb_rosters`
release tag as csv.gz/parquet/rds.

## Usage

``` r
load_ncaa_wbb_rosters(
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

Returns a `wehoop_data` tibble with one row per player-team-season.

|          |           |                                                 |
|----------|-----------|-------------------------------------------------|
| col_name | types     | description                                     |
| season   | integer   | Season identifier (4-digit season-ending year). |
| team     | character | Team name.                                      |
| player   | character | Player name (raw, upper-cased).                 |
| games    | integer   | Games played (season total).                    |

## See also

Other NCAA WBB loader functions:
[`load_ncaa_wbb_lineups()`](https://wehoop.sportsdataverse.org/reference/load_ncaa_wbb_lineups.md),
[`load_ncaa_wbb_matchup_stints()`](https://wehoop.sportsdataverse.org/reference/load_ncaa_wbb_matchup_stints.md),
[`load_ncaa_wbb_pbp()`](https://wehoop.sportsdataverse.org/reference/load_ncaa_wbb_pbp.md),
[`load_ncaa_wbb_player_box()`](https://wehoop.sportsdataverse.org/reference/load_ncaa_wbb_player_box.md),
[`load_ncaa_wbb_possessions()`](https://wehoop.sportsdataverse.org/reference/load_ncaa_wbb_possessions.md),
[`load_ncaa_wbb_rapm_within_team()`](https://wehoop.sportsdataverse.org/reference/load_ncaa_wbb_rapm_within_team.md),
[`load_ncaa_wbb_schedule()`](https://wehoop.sportsdataverse.org/reference/load_ncaa_wbb_schedule.md),
[`load_ncaa_wbb_shots()`](https://wehoop.sportsdataverse.org/reference/load_ncaa_wbb_shots.md),
[`load_ncaa_wbb_team_box()`](https://wehoop.sportsdataverse.org/reference/load_ncaa_wbb_team_box.md),
[`load_ncaa_wbb_team_ids()`](https://wehoop.sportsdataverse.org/reference/load_ncaa_wbb_team_ids.md),
[`load_ncaa_wbb_team_rosters()`](https://wehoop.sportsdataverse.org/reference/load_ncaa_wbb_team_rosters.md)

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  try(load_ncaa_wbb_rosters(seasons = most_recent_wbb_season()))
#> ──────────────────────────────────────────────────────────────── wehoop 3.0.0 ──
#> # A tibble: 8,382 × 4
#>    season team               player              games
#>     <int> <chr>              <chr>               <int>
#>  1   2026 A&M-Corpus Christi ASHA.WALKER            29
#>  2   2026 A&M-Corpus Christi BRUNA.ANGUERA          23
#>  3   2026 A&M-Corpus Christi CHELSEA.WOOTEN         28
#>  4   2026 A&M-Corpus Christi KNARI.HOLLIDAY         27
#>  5   2026 A&M-Corpus Christi MARISSA.SHELTON        29
#>  6   2026 A&M-Corpus Christi RAYNA.WILLIAMS         29
#>  7   2026 A&M-Corpus Christi SAMORA.WATSON          22
#>  8   2026 A&M-Corpus Christi TAMAR.VOOR.DE.POORT    19
#>  9   2026 A&M-Corpus Christi TORIE.SEVIER           29
#> 10   2026 A&M-Corpus Christi TRINITY.SLOCUM         28
#> # ℹ 8,372 more rows
# }
```
