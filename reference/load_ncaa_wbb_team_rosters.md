# **Load full NCAA women's college basketball team rosters from the data repo**

Loads the full season roster for NCAA women's college basketball – one
row per player-team-season with jersey number, class year, position,
height, hometown, high school, and games played/started. Produced by the
sdv-py `ncaa_wbb` engine; backed by the `ncaa-wbb-hoops-data` pipeline,
published to the `ncaa_wbb_team_rosters` release tag as
csv.gz/parquet/rds.

## Usage

``` r
load_ncaa_wbb_team_rosters(
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

|             |           |                                                 |
|-------------|-----------|-------------------------------------------------|
| col_name    | types     | description                                     |
| season      | integer   | Season identifier (4-digit season-ending year). |
| team_id     | character | Unique team identifier.                         |
| team        | character | Team name.                                      |
| player_id   | character | stats.ncaa.org player identifier.               |
| player      | character | Player name (raw, upper-cased).                 |
| clean_name  | character | Cleaned/title-cased display name.               |
| name        | character | Player full display name.                       |
| jersey      | character | Jersey number.                                  |
| class       | character | Class year (e.g. 'Fr.', 'So.', 'Jr.', 'Sr.').   |
| position    | character | Position abbreviation.                          |
| height      | character | Height as a 'feet-inches' string (e.g. '6-1').  |
| ht_inches   | integer   | Height in total inches.                         |
| hometown    | character | Player hometown (city, state).                  |
| high_school | character | Player high school.                             |
| gp          | character | Games played.                                   |
| gs          | character | Games started.                                  |

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
[`load_ncaa_wbb_team_ids()`](https://wehoop.sportsdataverse.org/reference/load_ncaa_wbb_team_ids.md)

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  try(load_ncaa_wbb_team_rosters(seasons = most_recent_wbb_season()))
#> ──────────────────────────────────────────────────────────────── wehoop 3.0.0 ──
#> # A tibble: 4,969 × 16
#>    season team_id team   player_id player clean_name name  jersey class position
#>     <int> <chr>   <chr>  <chr>     <chr>  <chr>      <chr> <chr>  <chr> <chr>   
#>  1   2026 610016  A&M-C… 10005559  ASHA.… Asha Walk… Asha… 11     Jr.   G       
#>  2   2026 610016  A&M-C… 9341790   BRUNA… Bruna Ang… Brun… 14     Sr.   C       
#>  3   2026 610016  A&M-C… 10005568  CHELS… Chelsea W… Chel… 3      Sr.   G       
#>  4   2026 610016  A&M-C… 10005541  KNARI… K'Nari Ho… K'Na… 32     Sr.   F       
#>  5   2026 610016  A&M-C… 10005553  MARIS… Marissa S… Mari… 4      Sr.   G       
#>  6   2026 610016  A&M-C… 9341797   NAIYA… Naiya Car… Naiy… 0      So.   G       
#>  7   2026 610016  A&M-C… 10005564  RAYNA… Rayna Wil… Rayn… 12     So.   F       
#>  8   2026 610016  A&M-C… 9341791   SAMOR… Samora Wa… Samo… 5      Sr.   G       
#>  9   2026 610016  A&M-C… 10005543  SYDNE… Sydney Pe… Sydn… 21     Jr.   F       
#> 10   2026 610016  A&M-C… 10005549  TAMAR… Tamar voo… Tama… 2      Sr.   G       
#> # ℹ 4,959 more rows
#> # ℹ 6 more variables: height <chr>, ht_inches <int>, hometown <chr>,
#> #   high_school <chr>, gp <chr>, gs <chr>
# }
```
