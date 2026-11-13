# **Load wehoop WNBA Stats rolling windows**

Loads event-count rolling windows built from the WNBA Stats API shots:
for each player, field-goal and three-point percentage over her last 50
and 200 attempts (`window_unit`, `window_n`), set against the window
before it, her season start and her career baseline. Built with
sportsdataverse-py's `rolling_windows()` and published to the
`wnba_stats_rolling_windows` release tag.

## Usage

``` r
load_wnba_stats_rolling_windows(
  seasons = most_recent_wnba_stats_season(),
  ...,
  dbConnection = NULL,
  tablename = NULL
)
```

## Source

<https://github.com/sportsdataverse/sportsdataverse-data/releases/tag/wnba_stats_rolling_windows>

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

  The name of the rolling windows data table within the database

## Value

Returns a `wehoop_data` tibble with one row per player, metric and
window.

|  |  |  |
|----|----|----|
| col_name | types | description |
| season | integer | Season identifier (4-digit year). |
| entity_type | character | Grain of the row (`player`). |
| entity_id | character | WNBA Stats player id. |
| entity_name | character | Player name. |
| team_id | character | WNBA Stats team id. |
| metric | character | `fg_pct` or `fg3_pct`. |
| window_unit | character | Event the window counts (`fga` or `fg3a`). |
| window_n | integer | Window length in events (50 or 200). |
| cur | numeric | Rate over the most recent window. |
| prev | numeric | Rate over the window before it. |
| season_start | numeric | Rate over the first window of the season. |
| career_baseline | numeric | Career rate through this season. |
| delta_prev | numeric | `cur - prev`. |
| delta_season | numeric | `cur - season_start`. |
| delta_career | numeric | `cur - career_baseline`. |
| delta_prev_rank | integer | Rank of `delta_prev` among qualified players. |
| n | integer | Events in the current window. |
| qualified | logical | Whether the player has a full window. |
| last_event_date | Date | Date of the player's latest event in the window. |
| as_of_date | Date | Date the table was built. |
| id_source | character | Id namespace of `entity_id` / `team_id` (`wnba_stats`). |

## See also

Other WNBA Stats loader functions:
[`load_wnba_stats_game_lineups()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_game_lineups.md),
[`load_wnba_stats_leaguedash()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_leaguedash.md),
[`load_wnba_stats_metric_curves()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_metric_curves.md),
[`load_wnba_stats_player_boxscores()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_player_boxscores.md),
[`load_wnba_stats_rosters()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_coaches.md)

## Examples

``` r
# \donttest{
  try(load_wnba_stats_rolling_windows(seasons = most_recent_wnba_stats_season()))
#> ──────────────────────────────────────────────────────────────── wehoop 3.1.0 ──
#> # A tibble: 916 × 21
#>    season entity_type entity_id entity_name team_id  metric window_unit window_n
#>     <int> <chr>       <chr>     <chr>       <chr>    <chr>  <chr>          <int>
#>  1   2026 player      1627668   Stewart     1611661… fg3_p… fg3a              50
#>  2   2026 player      1627671   Banham      1611661… fg3_p… fg3a              50
#>  3   2026 player      1627673   Jones       1611661… fg3_p… fg3a              50
#>  4   2026 player      1627674   Copper      1611661… fg3_p… fg3a              50
#>  5   2026 player      1627675   Williams    1611661… fg3_p… fg3a              50
#>  6   2026 player      1627700   Allemand    1611661… fg3_p… fg3a              50
#>  7   2026 player      1627701   Fagbenle    1611661… fg3_p… fg3a              50
#>  8   2026 player      1628242   Cannon      1611661… fg3_p… fg3a              50
#>  9   2026 player      1628244   Whitcomb    1611661… fg3_p… fg3a              50
#> 10   2026 player      1628269   Brodie      1611661… fg3_p… fg3a              50
#> # ℹ 906 more rows
#> # ℹ 13 more variables: cur <dbl>, prev <dbl>, season_start <dbl>,
#> #   career_baseline <dbl>, delta_prev <dbl>, delta_season <dbl>,
#> #   delta_career <dbl>, delta_prev_rank <int>, n <int>, qualified <lgl>,
#> #   last_event_date <date>, as_of_date <date>, id_source <chr>
# }
```
