# **Get ESPN Women's College Basketball Athlete Overview**

**Get ESPN Women's College Basketball Athlete Overview**

**Get ESPN Women's College Basketball Athlete Stats**

**Get ESPN Women's College Basketball Athlete Gamelog**

**Get ESPN Women's College Basketball Athlete Splits**

**Get ESPN Women's College Basketball Athlete Eventlog**

**Get ESPN Women's College Basketball Athlete Eventlog**

**Get ESPN Women's College Basketball Athlete Statisticslog**

## Usage

``` r
espn_wbb_player_overview(athlete_id, season = most_recent_wbb_season(), ...)

espn_wbb_player_stats_v3(athlete_id, season = most_recent_wbb_season(), ...)

espn_wbb_player_gamelog(athlete_id, season = most_recent_wbb_season(), ...)

espn_wbb_player_splits(athlete_id, season = most_recent_wbb_season(), ...)

espn_wbb_player_eventlog(athlete_id, season = most_recent_wbb_season(), ...)

espn_wbb_player_statisticslog(
  athlete_id,
  season = most_recent_wbb_season(),
  ...
)
```

## Arguments

- athlete_id:

  ESPN athlete identifier (character or numeric).

- season:

  Season year (numeric). Defaults to the most recent WBB season.

- ...:

  Additional arguments; currently unused.

## Value

A named list of data frames: `Statistics`, `NextGame`, `Last5Games`,
`Headlines`, `FantasyOutlook`.

**Statistics**

Columns as documented in the shared
[espn_basketball_player_overview_statistics_schema](https://wehoop.sportsdataverse.org/reference/espn_basketball_player_overview_statistics_schema.md)
table.

**NextGame**

Columns as documented in the shared
[espn_basketball_player_overview_next_game_schema](https://wehoop.sportsdataverse.org/reference/espn_basketball_player_overview_next_game_schema.md)
table.

**Last5Games**

Columns as documented in the shared
[espn_basketball_player_overview_statistics_schema](https://wehoop.sportsdataverse.org/reference/espn_basketball_player_overview_statistics_schema.md)
table.

**Headlines**

|             |           |                                   |
|-------------|-----------|-----------------------------------|
| col_name    | types     | description                       |
| headline    | character | News headline.                    |
| description | character | Long-form description text.       |
| published   | character | Publication timestamp (ISO 8601). |

**FantasyOutlook**

Columns as documented in the shared
[espn_basketball_player_overview_statistics_schema](https://wehoop.sportsdataverse.org/reference/espn_basketball_player_overview_statistics_schema.md)
table.

A wide `wehoop_data` tibble, one row per athlete-season-team, with the
ESPN stat categories spread across prefixed columns:

|  |  |  |
|----|----|----|
| col_name | types | description |
| athlete_id | character | ESPN athlete identifier (echoed input). |
| season | integer | Season year for the stat line. |
| team_id | character | ESPN team identifier for that season. |
| team_slug | character | Team slug (e.g. 'iowa-hawkeyes'). |
| avg\_\* | numeric | Per-game season-average stats (e.g. `avg_avg_points`). |
| tot\_\* | numeric | Season-total stats (e.g. `tot_points`). |
| misc\_\* | numeric | Miscellaneous season totals. |

Stat column names come from ESPN's positional `names` array per
category, cleaned via
[`janitor::make_clean_names()`](https://sfirke.github.io/janitor/reference/make_clean_names.html);
the exact set varies by league and season.

A single tibble with one row per game. Column names reflect the stat
labels returned by ESPN and will vary by season and player.

A single long-format tibble. When data are present, columns include at
minimum `category` and `split_name`, plus per-stat columns driven by
ESPN labels.

A single tibble. Per-event `statistics.$ref` URLs from the ESPN core-v2
API are returned as the character column `statistics_ref` and are NOT
resolved. Similarly, `event_ref`, `competition_ref`, and `team_ref` are
returned as character columns.

|                 |           |                                          |
|-----------------|-----------|------------------------------------------|
| col_name        | types     | description                              |
| event_ref       | character | Reference link to the originating event. |
| competition_ref | character | Competition ref.                         |
| team_ref        | character | Team ref.                                |
| statistics_ref  | character | Statistics ref.                          |

A single tibble. When resolved, each row corresponds to one statistical
entry in the core-v2 statistics log, with `event_ref` and
`statistics_ref` character columns pointing to resolvable ESPN
endpoints.

|                |           |                                          |
|----------------|-----------|------------------------------------------|
| col_name       | types     | description                              |
| event_ref      | character | Reference link to the originating event. |
| statistics_ref | character | Statistics ref.                          |

## See also

[family_espn_wbb](https://wehoop.sportsdataverse.org/reference/family_espn_wbb.md)
lists every function in this family.

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  espn_wbb_player_overview(athlete_id = "4433404", season = 2025)
#> $Statistics
#> ── ESPN WOMENS-COLLEGE-BASKETBALL Athlete Overview Statistics from ESPN.com ────
#> ℹ Data updated: 2026-11-09 21:09:43 UTC
#> # A tibble: 0 × 0
#> 
#> $NextGame
#> ── ESPN WOMENS-COLLEGE-BASKETBALL Athlete Overview NextGame from ESPN.com ──────
#> ℹ Data updated: 2026-11-09 21:09:43 UTC
#> # A tibble: 1 × 4
#>   id    date  name  short_name
#>   <chr> <chr> <chr> <chr>     
#> 1 NA    NA    NA    NA        
#> 
#> $Last5Games
#> ── ESPN WOMENS-COLLEGE-BASKETBALL Athlete Overview Last5Games from ESPN.com ────
#> ℹ Data updated: 2026-11-09 21:09:43 UTC
#> # A tibble: 0 × 0
#> 
#> $Headlines
#> ── ESPN WOMENS-COLLEGE-BASKETBALL Athlete Overview Headlines from ESPN.com ─────
#> ℹ Data updated: 2026-11-09 21:09:43 UTC
#> # A tibble: 24 × 5
#>    headline                                   description published byline type 
#>    <chr>                                      <chr>       <chr>     <chr>  <chr>
#>  1 Cameron Brink somehow gets the and-1 to f… Cameron Br… 2026-08-… NA     Media
#>  2 Cameron Brink hits the basket              Cameron Br… 2026-08-… NA     Media
#>  3 Cameron Brink gets the basket plus the fo… Cameron Br… 2026-08-… NA     Media
#>  4 Cameron Brink drains 3-pointer for the Sp… Cameron Br… 2026-08-… NA     Media
#>  5 Cameron Brink drains triple                Cameron Br… 2026-07-… NA     Media
#>  6 Sparks' Cameron Brink out undetermined ti… Sparks for… 2026-06-… Alexa… Head…
#>  7 Cameron Brink knocks down the shot         Cameron Br… 2026-06-… NA     Media
#>  8 Cameron Brink finishes through contact     Cameron Br… 2026-06-… NA     Media
#>  9 Cameron Brink hits the basket              Cameron Br… 2026-06-… NA     Media
#> 10 Cameron Brink makes the bucket             Cameron Br… 2026-06-… NA     Media
#> # ℹ 14 more rows
#> 
#> $FantasyOutlook
#> ── ESPN WOMENS-COLLEGE-BASKETBALL Athlete Overview FantasyOutlook from ESPN.com 
#> ℹ Data updated: 2026-11-09 21:09:43 UTC
#> # A tibble: 0 × 0
#> 
# }
# \donttest{
  espn_wbb_player_stats_v3(athlete_id = "4433985", season = 2025)
#> ── ESPN WOMENS-COLLEGE-BASKETBALL Athlete Stats from ESPN.com ── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-09 21:09:44 UTC
#> # A tibble: 5 × 46
#>   athlete_id season team_id team_slug         avg_games_played avg_games_started
#>   <chr>       <int> <chr>   <chr>                        <dbl>             <dbl>
#> 1 4433985      2021 66      iowa-state-cyclo…               28                24
#> 2 4433985      2022 2294    iowa-hawkeyes                   32                 2
#> 3 4433985      2024 2294    iowa-hawkeyes                   39                 0
#> 4 4433985      2025 2294    iowa-hawkeyes                   34                34
#> 5 4433985      2026 2294    iowa-hawkeyes                   31                30
#> # ℹ 40 more variables: avg_avg_minutes <dbl>, avg_avg_points <dbl>,
#> #   avg_avg_rebounds <dbl>, avg_avg_assists <dbl>, avg_avg_steals <dbl>,
#> #   avg_avg_blocks <dbl>, avg_avg_turnovers <dbl>,
#> #   avg_avg_field_goals_made_avg_field_goals_attempted <dbl>,
#> #   avg_field_goal_pct <dbl>,
#> #   avg_avg_three_point_field_goals_made_avg_three_point_field_goals_attempted <dbl>,
#> #   avg_three_point_field_goal_pct <dbl>, …
# }
# \donttest{
  espn_wbb_player_gamelog(athlete_id = "4433404", season = 2025)
#> # A tibble: 0 × 0
# }
# \donttest{
  espn_wbb_player_splits(athlete_id = "4433404", season = 2025)
#> ── ESPN WOMENS-COLLEGE-BASKETBALL Athlete Splits from ESPN.com ─────────────────
#> ℹ Data updated: 2026-11-09 21:09:44 UTC
#> # A tibble: 1 × 4
#>   athlete_id season name  display_name
#>   <chr>       <dbl> <chr> <chr>       
#> 1 4433404      2025 split split       
# }
# \donttest{
  espn_wbb_player_eventlog(athlete_id = "4433404", season = 2025)
#> # A tibble: 0 × 0
# }
# \donttest{
  espn_wbb_player_statisticslog(athlete_id = "4433404", season = 2025)
#> ── ESPN WOMENS-COLLEGE-BASKETBALL Athlete Statisticslog from ESPN.com ──────────
#> ℹ Data updated: 2026-11-09 21:09:44 UTC
#> # A tibble: 4 × 3
#>   athlete_id season$`$ref`                                            statistics
#>   <chr>      <chr>                                                    <list>    
#> 1 4433404    http://sports.core.api.espn.com/v2/sports/basketball/le… <df>      
#> 2 4433404    http://sports.core.api.espn.com/v2/sports/basketball/le… <df>      
#> 3 4433404    http://sports.core.api.espn.com/v2/sports/basketball/le… <df>      
#> 4 4433404    http://sports.core.api.espn.com/v2/sports/basketball/le… <df>      
# }
```
