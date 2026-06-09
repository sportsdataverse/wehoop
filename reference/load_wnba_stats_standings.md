# **Load wehoop WNBA Stats Standings**

Loads season-level WNBA standings scraped from the WNBA Stats API
(`leaguestandingsv3`-style outputs). One row per team-season. Backed by
the `wehoop-wnba-stats-data` pipeline that reads raw JSONs from
`wehoop-wnba-stats-raw` and publishes parquet/rds artifacts to the
`wnba_stats_standings` release tag.

`load_wnba_stats_standings_manifest()` returns the per-season manifest
CSV (`season`, `row_count`, `generated_at_utc`, `source_endpoint`) for
the WNBA Stats standings release tag without downloading any season's
full data.

## Usage

``` r
load_wnba_stats_standings(
  seasons = most_recent_wnba_stats_season(),
  ...,
  dbConnection = NULL,
  tablename = NULL
)

load_wnba_stats_standings_manifest()
```

## Arguments

- seasons:

  A vector of 4-digit years associated with given WNBA seasons. (Min:
  1997)

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
| season_id | character | Unique season identifier. |
| team_id | character | Unique team identifier. |
| team_city | character | Team city or region (e.g. 'Las Vegas'). |
| team_name | character | Full team display name (e.g. 'Las Vegas Aces'). |
| conference | character | Filter players or teams by conference. |
| conference_record | character | Conference win-loss record. |
| playoff_rank | integer | League/season rank for playoff. |
| wins | integer | Total wins. |
| losses | integer | Total losses. |
| win_pct | numeric | Win percentage (0-1 decimal). |
| home_record | character | Home win-loss record. |
| road_record | character | Win-loss record for road. |
| l10 | character | L10. |
| strcurrentstreak | character | Strcurrentstreak. |
| points_pg | numeric | Points pg. |
| opp_points_pg | numeric | Opponent points pg. |
| diff_points_pg | numeric | Diff points pg. |

## See also

Other WNBA Stats loader functions:
[`load_wnba_stats_coaches()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_coaches.md),
[`load_wnba_stats_draft()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_draft.md),
[`load_wnba_stats_game_rosters()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_game_rosters.md),
[`load_wnba_stats_lineups()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_lineups.md),
[`load_wnba_stats_officials()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_officials.md),
[`load_wnba_stats_pbp()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_pbp.md),
[`load_wnba_stats_player_game_logs()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_player_game_logs.md),
[`load_wnba_stats_player_stats()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_player_stats.md),
[`load_wnba_stats_rosters()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_rosters.md),
[`load_wnba_stats_schedule()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_schedule.md),
[`load_wnba_stats_shots()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_shots.md),
[`load_wnba_stats_team_stats()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_team_stats.md)

## Examples

``` r
# \donttest{
  try(load_wnba_stats_standings(seasons = most_recent_wnba_stats_season()))
#> ──────────────────────────────────────────────────────────────── wehoop 3.0.0 ──
#> # A tibble: 15 × 93
#>    league_id season_id team_id    team_city    team_name team_slug conference
#>    <chr>     <chr>     <chr>      <chr>        <chr>     <chr>     <chr>     
#>  1 10        22026     1611661324 Minnesota    Lynx      lynx      West      
#>  2 10        22026     1611661330 Atlanta      Dream     dream     East      
#>  3 10        22026     1611661319 Las Vegas    Aces      aces      West      
#>  4 10        22026     1611661321 Dallas       Wings     wings     West      
#>  5 10        22026     1611661313 New York     Liberty   liberty   East      
#>  6 10        22026     1611661331 Golden State Valkyries valkyries West      
#>  7 10        22026     1611661332 Toronto      Tempo     tempo     East      
#>  8 10        22026     1611661325 Indiana      Fever     fever     East      
#>  9 10        22026     1611661327 Portland     Fire      fire      West      
#> 10 10        22026     1611661320 Los Angeles  Sparks    sparks    West      
#> 11 10        22026     1611661322 Washington   Mystics   mystics   East      
#> 12 10        22026     1611661329 Chicago      Sky       sky       East      
#> 13 10        22026     1611661317 Phoenix      Mercury   mercury   West      
#> 14 10        22026     1611661328 Seattle      Storm     storm     West      
#> 15 10        22026     1611661323 Connecticut  Sun       sun       East      
#> # ℹ 86 more variables: conference_record <chr>, playoff_rank <chr>,
#> #   clinch_indicator <chr>, division <chr>, division_record <chr>,
#> #   division_rank <chr>, wins <chr>, losses <chr>, win_pct <chr>,
#> #   league_rank <chr>, record <chr>, home <chr>, road <chr>, l10 <chr>,
#> #   last10home <chr>, last10road <chr>, ot <chr>, three_pts_or_less <chr>,
#> #   ten_pts_or_more <chr>, long_home_streak <chr>, str_long_home_streak <chr>,
#> #   long_road_streak <chr>, str_long_road_streak <chr>, …
# }
```
