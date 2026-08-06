# **Load cleaned WBB player core (identity + bio) from the data repo**

Loads ESPN WBB athlete core records – identity and biographical fields,
one row per athlete who appeared in the season. Backed by the
`wehoop-wbb-data` pipeline that reads raw JSONs from `wehoop-wbb-raw`
and publishes parquet/rds artifacts to the
`espn_womens_college_basketball_player_core` release tag.

This is the only source of athlete bio in the pipeline: the player
season stats payload carries no identity at all – not even the athlete
id.

Two properties of the source are worth knowing before joining:

- `current_team_id` is the athlete's CURRENT team, not their team in the
  requested season. Season team lives in
  [`load_wbb_player_box()`](https://wehoop.sportsdataverse.org/reference/load_wbb_player_box.md)
  /
  [`load_wbb_player_stats()`](https://wehoop.sportsdataverse.org/reference/load_wbb_player_stats.md).

- Bio (height / weight / jersey) is a current snapshot that ESPN
  overwrites in place; it is not era-correct for a historical season.
  The season dimension here is participation, not the bio's vintage.

Field coverage is era-dependent by nature – headshots exist only for
modern players, while college and date of birth thin out the other way.

## Usage

``` r
load_wbb_player_core(
  seasons = most_recent_wbb_season(),
  ...,
  dbConnection = NULL,
  tablename = NULL
)
```

## Arguments

- seasons:

  A vector of 4-digit years associated with given WBB seasons. (Min:
  2004)

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

Other WBB loader functions:
[`load_wbb_game_rosters_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wbb_game_rosters.md),
[`load_wbb_officials_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wbb_officials.md),
[`load_wbb_player_stats_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wbb_player_stats.md),
[`load_wbb_rosters_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wbb_rosters.md),
[`load_wbb_shots_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wbb_shots.md),
[`load_wbb_standings_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wbb_standings.md),
[`load_wbb_team_stats_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wbb_team_stats.md)

## Examples

``` r
# \donttest{
  try(load_wbb_player_core(seasons = most_recent_wbb_season()))
#> ──────────────────────────────────────────────────────────────── wehoop 3.0.0 ──
#> # A tibble: 9,870 × 36
#>    season athlete_id guid       uid   slug  type  first_name last_name full_name
#>     <int>      <int> <chr>      <chr> <chr> <chr> <chr>      <chr>     <chr>    
#>  1   2026    4399380 d9bbe65d-… s:40… anna… bask… Anna       Newman    Anna New…
#>  2   2026    4400108 9b59dd9e-… s:40… nia-… bask… Nia        Johnson   Nia John…
#>  3   2026    4433051 3b330bd4-… s:40… cici… bask… Cici       Ellington Cici Ell…
#>  4   2026    4433140 63cd2572-… s:40… chan… bask… Chandler   Prater    Chandler…
#>  5   2026    4433141 a2557943-… s:40… morg… bask… Morgan     Robinson… Morgan R…
#>  6   2026    4433290 3ee4fc06-… s:40… mose… bask… Moses      Davenport Moses Da…
#>  7   2026    4433411 3a83740b-… s:40… ange… bask… Angela     Dugalic   Angela D…
#>  8   2026    4433418 279c890e-… s:40… kate… bask… Kateri     Poole     Kateri P…
#>  9   2026    4433419 1a4334d5-… s:40… alli… bask… Alli       Campbell  Alli Cam…
#> 10   2026    4433420 e518ce77-… s:40… madd… bask… Maddie     Scherr    Maddie S…
#> # ℹ 9,860 more rows
#> # ℹ 27 more variables: display_name <chr>, short_name <chr>, height <dbl>,
#> #   display_height <chr>, weight <dbl>, display_weight <chr>, age <int>,
#> #   date_of_birth <chr>, birth_city <chr>, birth_state <chr>,
#> #   birth_country <chr>, jersey <chr>, position_id <int>, position_name <chr>,
#> #   position_abbreviation <chr>, position_display_name <chr>, college_id <int>,
#> #   current_team_id <int>, headshot_href <chr>, experience_years <int>, …
# }
```
