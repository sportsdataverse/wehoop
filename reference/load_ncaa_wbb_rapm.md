# **Load NCAA women's college basketball league-wide RAPM ratings from the data repo**

Loads league-wide regularized adjusted plus-minus (RAPM) ratings for
NCAA women's college basketball – one row per player-season, fit against
lineup variation across all Division I stints for that season (not a
within-team RAPM). Produced by the sdv-py `ncaa_wbb` engine's
league-wide stint-ridge RAPM solver (Torvik-gated to Division I teams)
on top of the reconstructed lineup/possession data; backed by the
`ncaa-wbb-hoops-data` pipeline, published to the `ncaa_wbb_rapm` release
tag as csv.gz/parquet/rds.

## Usage

``` r
load_ncaa_wbb_rapm(
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
  runs 2011 through the most recent season, with no gaps. Pass
  `seasons = TRUE` for every published season. (Min: 2011)

- ...:

  Additional arguments passed to an underlying function that writes the
  season data into a database.

- dbConnection:

  A `DBIConnection` object, as returned by
  [`DBI::dbConnect()`](https://dbi.r-dbi.org/reference/dbConnect.html)

- tablename:

  The name of the data table within the database

## Value

Returns a `wehoop_data` tibble with one row per player-season.

|  |  |  |
|----|----|----|
| col_name | types | description |
| season | integer | Season identifier (4-digit season-ending year). |
| player_id | character | stats.ncaa.org player identifier. |
| person_id | character | Internal person identifier used to join across seasons/teams. |
| player | character | Player display name ('LAST.FIRST' format). |
| team | character | Team name. |
| orapm | numeric | League-wide offensive regularized adjusted plus-minus. |
| drapm | numeric | League-wide defensive regularized adjusted plus-minus. |
| rapm_net | numeric | League-wide net regularized adjusted plus-minus (orapm + drapm). |
| off_poss | integer | Offensive possessions used in the RAPM fit. |
| def_poss | integer | Defensive possessions used in the RAPM fit. |
| estimand | character | Estimand tag for the RAPM fit (e.g. 'league' for the Division I stint solve). |

## Details

League-wide regularized adjusted plus-minus – a single ridge fit over
all Division I stints per season, distinct from
[`load_ncaa_wbb_rapm_within_team()`](https://wehoop.sportsdataverse.org/reference/load_ncaa_wbb_rapm_within_team.md)'s
within-team fit. Published coverage runs seasons 2011 through 2026.

## See also

Other NCAA WBB loader functions:
[`load_ncaa_wbb_lineups()`](https://wehoop.sportsdataverse.org/reference/load_ncaa_wbb_lineups.md),
[`load_ncaa_wbb_matchup_stints()`](https://wehoop.sportsdataverse.org/reference/load_ncaa_wbb_matchup_stints.md),
[`load_ncaa_wbb_pbp()`](https://wehoop.sportsdataverse.org/reference/load_ncaa_wbb_pbp.md),
[`load_ncaa_wbb_player_box()`](https://wehoop.sportsdataverse.org/reference/load_ncaa_wbb_player_box.md),
[`load_ncaa_wbb_possessions()`](https://wehoop.sportsdataverse.org/reference/load_ncaa_wbb_possessions.md),
[`load_ncaa_wbb_rapm_within_team()`](https://wehoop.sportsdataverse.org/reference/load_ncaa_wbb_rapm_within_team.md),
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
  try(load_ncaa_wbb_rapm(seasons = most_recent_wbb_season()))
#> ──────────────────────────────────────────────────────────────── wehoop 3.0.0 ──
#> # A tibble: 4,596 × 11
#>    season player_id person_id     player     team  orapm drapm rapm_net off_poss
#>     <int> <chr>     <chr>         <chr>      <chr> <dbl> <dbl>    <dbl>    <int>
#>  1   2026 9341835   pedde933d1164 SARAH.STR… UConn 11.2   8.44     19.7     1954
#>  2   2026 9342055   p04aec3b0b845 MADISON.B… Texas  8.53  9.21     17.7     2328
#>  3   2026 10809355  pa5aeb0eead4a AZZI.FUDD  UConn  8.04  8.95     17.0     2088
#>  4   2026 9342023   p664f8ed3b328 JOYCE.EDW… Sout…  8.33  7.52     15.9     2270
#>  5   2026 9343365   pab59a68757fa GABRIELA.… UCLA   8.72  6.03     14.8     1998
#>  6   2026 9341960   p3950ead3c152 HANNAH.HI… Notr…  6.84  7.68     14.5     2316
#>  7   2026 10802884  p1b97dafd99e9 MADINA.OK… Sout…  8.93  4.96     13.9     1678
#>  8   2026 9342060   p81f1d7261d79 JORDAN.LEE Texas  8.86  4.61     13.5     2260
#>  9   2026 10011276  p0e80e1c24e79 MILAYSIA.… LSU    6.47  6.95     13.4     1567
#> 10   2026 9341828   p797f514500dc ASHLYNN.S… UConn  4.69  8.40     13.1     1934
#> # ℹ 4,586 more rows
#> # ℹ 2 more variables: def_poss <int>, estimand <chr>
# }
```
