# **Load NCAA women's college basketball within-team RAPM ratings from the data repo**

Loads within-team regularized adjusted plus-minus (RAPM) ratings for
NCAA women's college basketball – one row per player-team-season, fit
against teammate lineup variation within that team's own possessions
(not a cross-team national RAPM). Produced by the sdv-py `ncaa_wbb`
engine's RAPM model on top of the reconstructed lineup/possession data;
backed by the `ncaa-wbb-hoops-data` pipeline, published to the
`ncaa_wbb_rapm_within_team` release tag as csv.gz/parquet/rds.

## Usage

``` r
load_ncaa_wbb_rapm_within_team(
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

|  |  |  |
|----|----|----|
| col_name | types | description |
| team | character | Team name. |
| player_code | character | Player display name as 'Last, First' used as the RAPM join key. |
| rapm_off | numeric | Within-team offensive regularized adjusted plus-minus. |
| rapm_def | numeric | Within-team defensive regularized adjusted plus-minus. |
| team_off_poss | numeric | Team offensive possessions used in the RAPM fit. |
| num_players | integer | Number of teammates included in the within-team RAPM fit. |
| rapm_net | numeric | Within-team net regularized adjusted plus-minus (rapm_off + rapm_def). |
| season | integer | Season identifier (4-digit season-ending year). |
| player_id | character | stats.ncaa.org player identifier. |
| team_id | character | Unique team identifier. |
| person_id | character | Internal person identifier used to join across seasons/teams. |

## See also

Other NCAA WBB loader functions:
[`load_ncaa_wbb_lineups()`](https://wehoop.sportsdataverse.org/reference/load_ncaa_wbb_lineups.md),
[`load_ncaa_wbb_matchup_stints()`](https://wehoop.sportsdataverse.org/reference/load_ncaa_wbb_matchup_stints.md),
[`load_ncaa_wbb_pbp()`](https://wehoop.sportsdataverse.org/reference/load_ncaa_wbb_pbp.md),
[`load_ncaa_wbb_player_box()`](https://wehoop.sportsdataverse.org/reference/load_ncaa_wbb_player_box.md),
[`load_ncaa_wbb_possessions()`](https://wehoop.sportsdataverse.org/reference/load_ncaa_wbb_possessions.md),
[`load_ncaa_wbb_rapm()`](https://wehoop.sportsdataverse.org/reference/load_ncaa_wbb_rapm.md),
[`load_ncaa_wbb_rosters()`](https://wehoop.sportsdataverse.org/reference/load_ncaa_wbb_rosters.md),
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
  try(load_ncaa_wbb_rapm_within_team(seasons = most_recent_wbb_season()))
#> ──────────────────────────────────────────────────────────────── wehoop 3.0.0 ──
#> # A tibble: 4,118 × 11
#>    team  player_code rapm_off rapm_def team_off_poss num_players rapm_net season
#>    <chr> <chr>          <dbl>    <dbl>         <dbl>       <int>    <dbl>  <int>
#>  1 A&M-… Shelton, M…   -1.90     2.36           1862           9    -4.26   2026
#>  2 A&M-… Walker, As…   -2.05     2.22           1862           9    -4.27   2026
#>  3 A&M-… Slocum, Tr…   -2.71    -0.310          1862           9    -2.40   2026
#>  4 A&M-… Wooten, Ch…   -3.07     2.35           1862           9    -5.42   2026
#>  5 A&M-… Sevier, To…   -2.27    -0.119          1862           9    -2.15   2026
#>  6 A&M-… Holliday, …   -0.962    0.345          1862           9    -1.31   2026
#>  7 A&M-… Williams, …   -1.44     1.35           1862           9    -2.79   2026
#>  8 A&M-… Watson, Sa…   -1.13     2.46           1862           9    -3.59   2026
#>  9 A&M-… Anguera, B…   -2.57     0.988          1862           9    -3.56   2026
#> 10 Abil… Davis, Bre…    1.87    -0.929          2168          12     2.80   2026
#> # ℹ 4,108 more rows
#> # ℹ 3 more variables: player_id <chr>, team_id <chr>, person_id <chr>
# }
```
