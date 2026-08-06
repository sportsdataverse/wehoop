# **Load wehoop WBB Standings**

`load_wbb_standings_manifest()` returns the per-season manifest CSV
(`season`, `row_count`, `generated_at_utc`, `source_endpoint`) for the
standings release tag without downloading any season's full data.

Loads season-level conference and overall standings scraped from ESPN.
One row per team-season. Backed by the `wehoop-wbb-data` pipeline that
reads raw JSONs from `wehoop-wbb-raw` and publishes parquet/rds
artifacts to the `espn_womens_college_basketball_standings` release tag.

## Usage

``` r
load_wbb_standings_manifest()

load_wbb_standings(
  seasons = most_recent_wbb_season(),
  ...,
  dbConnection = NULL,
  tablename = NULL
)
```

## Arguments

- seasons:

  A vector of 4-digit years associated with given women's college
  basketball seasons. (Min: 2002)

- ...:

  Additional arguments passed to an underlying function that writes the
  season data into a database.

- dbConnection:

  A `DBIConnection` object, as returned by
  [`DBI::dbConnect()`](https://dbi.r-dbi.org/reference/dbConnect.html)

- tablename:

  The name of the standings data table within the database

## Value

Returns a `wehoop_data` tibble of team standings.

|  |  |  |
|----|----|----|
| col_name | types | description |
| season | integer | Season identifier (4-digit year or 'YYYY-YY' string). |
| season_type | integer | Season type (1=pre-season, 2=regular season, 3=postseason, 4=off-season for ESPN; or string label for WNBA Stats). |
| team_id | character | Unique team identifier. |
| team_slug | character | URL-safe team identifier (e.g. 'lasvegas-aces' / 'aces'). |
| team_location | character | Team city or location string. |
| team_name | character | Full team display name (e.g. 'Las Vegas Aces'). |
| team_abbreviation | character | Short team abbreviation (e.g. 'LAS'). |
| team_display_name | character | Full team display name. |
| conference_id | character | Conference identifier. |
| conference_name | character | Full conference name. |
| wins | integer | Total wins. |
| losses | integer | Total losses. |
| win_percent | numeric | Win percent. |
| games_played | integer | Games played. |
| points_for | numeric | Points for. |
| points_against | numeric | Points allowed. |
| point_differential | numeric | Point differential. |
| streak | character | Current streak (e.g. 'W3' for three-game win streak). |

## See also

Other WBB loader functions:
[`load_wbb_game_rosters_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wbb_game_rosters.md),
[`load_wbb_officials_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wbb_officials.md),
[`load_wbb_player_core()`](https://wehoop.sportsdataverse.org/reference/load_wbb_player_core.md),
[`load_wbb_player_stats_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wbb_player_stats.md),
[`load_wbb_rosters_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wbb_rosters.md),
[`load_wbb_shots_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wbb_shots.md),
[`load_wbb_team_stats_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wbb_team_stats.md)

## Examples

``` r
# \donttest{
  try(load_wbb_standings(seasons = most_recent_wbb_season()))
#> ──────────────────────────────────────────────────────────────── wehoop 3.0.0 ──
#> # A tibble: 30,492 × 24
#>    season group_id group_name        group_abbreviation group_short_name team_id
#>     <int> <chr>    <chr>             <chr>              <chr>              <int>
#>  1   2026 1        America East Con… aeast              Am. East            2349
#>  2   2026 1        America East Con… aeast              Am. East            2349
#>  3   2026 1        America East Con… aeast              Am. East            2349
#>  4   2026 1        America East Con… aeast              Am. East            2349
#>  5   2026 1        America East Con… aeast              Am. East            2349
#>  6   2026 1        America East Con… aeast              Am. East            2349
#>  7   2026 1        America East Con… aeast              Am. East            2349
#>  8   2026 1        America East Con… aeast              Am. East            2349
#>  9   2026 1        America East Con… aeast              Am. East            2349
#> 10   2026 1        America East Con… aeast              Am. East            2349
#> # ℹ 30,482 more rows
#> # ℹ 18 more variables: team_uid <chr>, team_slug <chr>, team_location <chr>,
#> #   team_name <chr>, team_abbreviation <chr>, team_display_name <chr>,
#> #   team_short_display_name <chr>, team_color <chr>,
#> #   team_alternate_color <chr>, team_logo <chr>, stat_name <chr>,
#> #   stat_display_name <chr>, stat_short_display_name <chr>,
#> #   stat_description <chr>, stat_abbreviation <chr>, stat_type <chr>, …
# }
```
