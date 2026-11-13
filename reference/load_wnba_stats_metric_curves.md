# **Load wehoop WNBA Stats metric curves**

Loads metric-by-continuous-axis curves built from the WNBA Stats API
shots: for the league, each team and each player, attempts, makes and
rate in one-foot shot-distance buckets
(`metric = "fg_pct_by_shot_distance"`, bucket `[x_lo, x_hi)`). Built
with sportsdataverse-py's `metric_curves()` and published to the
`wnba_stats_metric_curves` release tag.

## Usage

``` r
load_wnba_stats_metric_curves(
  seasons = most_recent_wnba_stats_season(),
  ...,
  dbConnection = NULL,
  tablename = NULL
)
```

## Source

<https://github.com/sportsdataverse/sportsdataverse-data/releases/tag/wnba_stats_metric_curves>

## Arguments

- seasons:

  A vector of 4-digit years associated with given WNBA seasons.
  Published coverage runs 1997 through the most recent season, with no
  gaps. Pass `seasons = TRUE` for every published season. (Min: 1997)

- ...:

  Additional arguments passed to an underlying function that writes the
  season data into a database.

- dbConnection:

  A `DBIConnection` object, as returned by
  [`DBI::dbConnect()`](https://dbi.r-dbi.org/reference/dbConnect.html)

- tablename:

  The name of the metric curves data table within the database

## Value

Returns a `wehoop_data` tibble with one row per entity, metric and
bucket.

|  |  |  |
|----|----|----|
| col_name | types | description |
| season | integer | Season identifier (4-digit year). |
| entity_type | character | Grain of the row: `league`, `team` or `player`. |
| entity_id | character | WNBA Stats team or player id (`NA` for `league` rows). |
| entity_name | character | Team or player name (`NA` for `league` rows). |
| team_id | character | WNBA Stats team id of a player row. |
| id_source | character | Id namespace of `entity_id` / `team_id` (`wnba_stats`). |
| metric | character | Curve name (`fg_pct_by_shot_distance`). |
| down | integer | Football-only down split; always `NA` here. |
| x_lo | numeric | Lower bound of the bucket (feet, inclusive). |
| x_hi | numeric | Upper bound of the bucket (feet, exclusive). |
| attempts | integer | Field goal attempts in the bucket. |
| successes | integer | Field goals made in the bucket. |
| rate | numeric | `successes / attempts`. |
| epa_per_att | numeric | Football-only EPA per attempt; always `NA` here. |

## See also

Other WNBA Stats loader functions:
[`load_wnba_stats_game_lineups()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_game_lineups.md),
[`load_wnba_stats_leaguedash()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_leaguedash.md),
[`load_wnba_stats_player_boxscores()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_player_boxscores.md),
[`load_wnba_stats_rolling_windows()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_rolling_windows.md),
[`load_wnba_stats_rosters()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_coaches.md)

## Examples

``` r
# \donttest{
  try(load_wnba_stats_metric_curves(seasons = most_recent_wnba_stats_season()))
#> ──────────────────────────────────────────────────────────────── wehoop 3.1.0 ──
#> # A tibble: 5,598 × 14
#>    season entity_type entity_id entity_name team_id id_source metric  down  x_lo
#>     <int> <chr>       <chr>     <chr>       <chr>   <chr>     <chr>  <int> <dbl>
#>  1   2026 league      NA        NA          NA      wnba_sta… fg_pc…    NA     0
#>  2   2026 league      NA        NA          NA      wnba_sta… fg_pc…    NA     1
#>  3   2026 league      NA        NA          NA      wnba_sta… fg_pc…    NA     2
#>  4   2026 league      NA        NA          NA      wnba_sta… fg_pc…    NA     3
#>  5   2026 league      NA        NA          NA      wnba_sta… fg_pc…    NA     4
#>  6   2026 league      NA        NA          NA      wnba_sta… fg_pc…    NA     5
#>  7   2026 league      NA        NA          NA      wnba_sta… fg_pc…    NA     6
#>  8   2026 league      NA        NA          NA      wnba_sta… fg_pc…    NA     7
#>  9   2026 league      NA        NA          NA      wnba_sta… fg_pc…    NA     8
#> 10   2026 league      NA        NA          NA      wnba_sta… fg_pc…    NA     9
#> # ℹ 5,588 more rows
#> # ℹ 5 more variables: x_hi <dbl>, attempts <int>, successes <int>, rate <dbl>,
#> #   epa_per_att <dbl>
# }
```
