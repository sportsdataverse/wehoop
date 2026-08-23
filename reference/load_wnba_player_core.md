# **Load cleaned WNBA player core (identity + bio) from the data repo**

Loads ESPN WNBA athlete core records – identity and biographical fields,
one row per athlete who appeared in the season. Backed by the
`wehoop-wnba-data` pipeline that reads raw JSONs from `wehoop-wnba-raw`
and publishes parquet/rds artifacts to the `espn_wnba_player_core`
release tag.

This is the only source of athlete bio in the pipeline: the player
season stats payload carries no identity at all – not even the athlete
id.

Two properties of the source are worth knowing before joining:

- `current_team_id` is the athlete's CURRENT team, not their team in the
  requested season. Season team lives in
  [`load_wnba_player_box()`](https://wehoop.sportsdataverse.org/reference/load_wnba_player_box.md)
  /
  [`load_wnba_player_stats()`](https://wehoop.sportsdataverse.org/reference/load_wnba_player_stats.md).

- Bio (height / weight / jersey) is a current snapshot that ESPN
  overwrites in place; it is not era-correct for a historical season.
  The season dimension here is participation, not the bio's vintage.

Field coverage is era-dependent by nature – headshots exist only for
modern players, while college and date of birth thin out the other way.

## Usage

``` r
load_wnba_player_core(
  seasons = most_recent_wnba_season(),
  ...,
  dbConnection = NULL,
  tablename = NULL
)
```

## Arguments

- seasons:

  A vector of 4-digit years associated with given WNBA seasons. (Min:
  2003)

- ...:

  Additional arguments passed to an underlying function that writes the
  season data into a database.

- dbConnection:

  A `DBIConnection` object, as returned by
  [`DBI::dbConnect()`](https://dbi.r-dbi.org/reference/dbConnect.html)

- tablename:

  The name of the player core table within the database

## Value

Returns a `wehoop_data` tibble of athlete core records.

## See also

Other WNBA loader functions:
[`load_wnba_draft_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wnba_draft.md),
[`load_wnba_game_rosters_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wnba_game_rosters.md),
[`load_wnba_officials_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wnba_officials.md),
[`load_wnba_player_stats_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wnba_player_stats.md),
[`load_wnba_rosters_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wnba_rosters.md),
[`load_wnba_shots_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wnba_shots.md),
[`load_wnba_standings_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wnba_standings.md),
[`load_wnba_team_stats_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wnba_team_stats.md)

## Examples

``` r
# \donttest{
  try(load_wnba_player_core(seasons = most_recent_wnba_season()))
#> ──────────────────────────────────────────────────────────────── wehoop 3.0.0 ──
#> # A tibble: 232 × 36
#>    season athlete_id guid       uid   slug  type  first_name last_name full_name
#>     <int>      <int> <chr>      <chr> <chr> <chr> <chr>      <chr>     <chr>    
#>  1   2026        869 74bfe609-… s:40… dewa… bask… DeWanna    Bonner    DeWanna …
#>  2   2026        887 c74956ad-… s:40… sami… bask… Sami       Whitcomb  Sami Whi…
#>  3   2026        924 09609790-… s:40… alys… bask… Alysha     Clark     Alysha C…
#>  4   2026        981 1d736065-… s:40… cour… bask… Courtney   Vandersl… Courtney…
#>  5   2026       1054 026e19c6-… s:40… tiff… bask… Tiffany    Hayes     Tiffany …
#>  6   2026       1068 759b52cb-… s:40… nnek… bask… Nneka      Ogwumike  Nneka Og…
#>  7   2026       1107 5530f9d2-… s:40… shey… bask… Shey       Peddy     Shey Ped…
#>  8   2026    2284331 3f0f0fd1-… s:40… emma… bask… Emma       Cannon    Emma Can…
#>  9   2026    2327695 cea6f839-… s:40… rebe… bask… Rebekah    Gardner   Rebekah …
#> 10   2026    2490553 40e7dc87-… s:40… brit… bask… Brittney   Griner    Brittney…
#> # ℹ 222 more rows
#> # ℹ 27 more variables: display_name <chr>, short_name <chr>, height <dbl>,
#> #   display_height <chr>, weight <dbl>, display_weight <chr>, age <int>,
#> #   date_of_birth <chr>, birth_city <chr>, birth_state <chr>,
#> #   birth_country <chr>, jersey <chr>, position_id <int>, position_name <chr>,
#> #   position_abbreviation <chr>, position_display_name <chr>, college_id <int>,
#> #   current_team_id <int>, headshot_href <chr>, experience_years <int>, …
# }
```
