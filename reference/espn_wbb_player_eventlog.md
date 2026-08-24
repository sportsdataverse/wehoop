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

Other ESPN WBB Functions:
[`espn_wbb_athletes_index()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_athletes_index.md),
[`espn_wbb_award()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_award.md),
[`espn_wbb_calendar()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_calendar.md),
[`espn_wbb_coach()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_coach.md),
[`espn_wbb_coach_record()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_coach_record.md),
[`espn_wbb_coach_season()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_coach_season.md),
[`espn_wbb_coaches()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_coaches.md),
[`espn_wbb_conferences()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_conferences.md),
[`espn_wbb_franchise()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_franchise.md),
[`espn_wbb_franchises()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_franchises.md),
[`espn_wbb_game_all()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_game_all.md),
[`espn_wbb_game_odds()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_game_broadcasts.md),
[`espn_wbb_game_official_detail()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_game_official_detail.md),
[`espn_wbb_game_play()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_game_play.md),
[`espn_wbb_game_play_personnel()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_game_play_personnel.md),
[`espn_wbb_game_player_box()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_game_player_box.md),
[`espn_wbb_game_probabilities()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_game_probabilities.md),
[`espn_wbb_game_propbets()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_game_propbets.md),
[`espn_wbb_game_team_linescores()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_game_team_leaders.md),
[`espn_wbb_game_team_roster_entry()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_game_team_roster_entry.md),
[`espn_wbb_injuries()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_injuries.md),
[`espn_wbb_leaders()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_leaders.md),
[`espn_wbb_news()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_news.md),
[`espn_wbb_player_awards()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_player_awards.md),
[`espn_wbb_player_career_stats()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_player_career_stats.md),
[`espn_wbb_player_eventlog_v2()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_player_eventlog_v2.md),
[`espn_wbb_player_info()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_player_info.md),
[`espn_wbb_player_seasons()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_player_seasons.md),
[`espn_wbb_player_stats()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_player_stats.md),
[`espn_wbb_position()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_position.md),
[`espn_wbb_positions()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_positions.md),
[`espn_wbb_powerindex()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_powerindex.md),
[`espn_wbb_rankings()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_rankings.md),
[`espn_wbb_scoreboard()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_scoreboard.md),
[`espn_wbb_season_awards()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_season_awards.md),
[`espn_wbb_season_group()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_season_group.md),
[`espn_wbb_season_groups()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_season_groups.md),
[`espn_wbb_season_info()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_season_info.md),
[`espn_wbb_season_leaders()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_season_leaders.md),
[`espn_wbb_season_ranking()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_season_ranking.md),
[`espn_wbb_season_rankings()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_season_rankings.md),
[`espn_wbb_season_type()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_season_type.md),
[`espn_wbb_season_types()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_season_types.md),
[`espn_wbb_season_week()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_season_week.md),
[`espn_wbb_season_weeks()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_season_weeks.md),
[`espn_wbb_seasons()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_seasons.md),
[`espn_wbb_standings()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_standings.md),
[`espn_wbb_team()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_team.md),
[`espn_wbb_team_injuries()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_team_injuries.md),
[`espn_wbb_team_news()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_team_news.md),
[`espn_wbb_team_record_detail()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_team_record_detail.md),
[`espn_wbb_team_schedule()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_team_schedule.md),
[`espn_wbb_team_season_roster()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_team_season_roster.md),
[`espn_wbb_team_season_statistics()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_team_season_statistics.md),
[`espn_wbb_team_stats()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_team_stats.md),
[`espn_wbb_teams()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_teams.md),
[`espn_wbb_tournament()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_tournament.md),
[`espn_wbb_tournament_season()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_tournament_season.md),
[`espn_wbb_tournament_seasons()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_tournament_seasons.md),
[`espn_wbb_tournaments()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_tournaments.md),
[`espn_wbb_venues()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_venues.md),
[`espn_wbb_week_ranking()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_week_ranking.md),
[`espn_wbb_week_rankings()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_week_rankings.md)

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  espn_wbb_player_overview(athlete_id = "4433404", season = 2025)
#> $Statistics
#> ── ESPN WOMENS-COLLEGE-BASKETBALL Athlete Overview Statistics from ESPN.com ────
#> ℹ Data updated: 2026-08-24 18:03:35 UTC
#> # A tibble: 0 × 0
#> 
#> $NextGame
#> ── ESPN WOMENS-COLLEGE-BASKETBALL Athlete Overview NextGame from ESPN.com ──────
#> ℹ Data updated: 2026-08-24 18:03:35 UTC
#> # A tibble: 1 × 4
#>   id    date  name  short_name
#>   <chr> <chr> <chr> <chr>     
#> 1 NA    NA    NA    NA        
#> 
#> $Last5Games
#> ── ESPN WOMENS-COLLEGE-BASKETBALL Athlete Overview Last5Games from ESPN.com ────
#> ℹ Data updated: 2026-08-24 18:03:35 UTC
#> # A tibble: 0 × 0
#> 
#> $Headlines
#> ── ESPN WOMENS-COLLEGE-BASKETBALL Athlete Overview Headlines from ESPN.com ─────
#> ℹ Data updated: 2026-08-24 18:03:35 UTC
#> # A tibble: 24 × 5
#>    headline                                   description published byline type 
#>    <chr>                                      <chr>       <chr>     <chr>  <chr>
#>  1 Cameron Brink gets the basket plus the fo… Cameron Br… 2026-08-… NA     Media
#>  2 Cameron Brink drains 3-pointer for the Sp… Cameron Br… 2026-08-… NA     Media
#>  3 Cameron Brink drains triple                Cameron Br… 2026-07-… NA     Media
#>  4 Sparks' Cameron Brink out undetermined ti… Sparks for… 2026-06-… Alexa… Head…
#>  5 Cameron Brink knocks down the shot         Cameron Br… 2026-06-… NA     Media
#>  6 Cameron Brink finishes through contact     Cameron Br… 2026-06-… NA     Media
#>  7 Cameron Brink hits the basket              Cameron Br… 2026-06-… NA     Media
#>  8 Cameron Brink makes the bucket             Cameron Br… 2026-06-… NA     Media
#>  9 WNBA awards: A'ja Wilson a familiar MVP f… Andre Snel… 2026-06-… Andre… Story
#> 10 Cameron Brink drains the shot              Cameron Br… 2026-05-… NA     Media
#> # ℹ 14 more rows
#> 
#> $FantasyOutlook
#> ── ESPN WOMENS-COLLEGE-BASKETBALL Athlete Overview FantasyOutlook from ESPN.com 
#> ℹ Data updated: 2026-08-24 18:03:35 UTC
#> # A tibble: 0 × 0
#> 
# }
# \donttest{
  espn_wbb_player_stats_v3(athlete_id = "4433985", season = 2025)
#> ── ESPN WOMENS-COLLEGE-BASKETBALL Athlete Stats from ESPN.com ── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-08-24 18:03:35 UTC
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
#> ℹ Data updated: 2026-08-24 18:03:35 UTC
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
#> ℹ Data updated: 2026-08-24 18:03:35 UTC
#> # A tibble: 4 × 3
#>   athlete_id season$`$ref`                                            statistics
#>   <chr>      <chr>                                                    <list>    
#> 1 4433404    http://sports.core.api.espn.com/v2/sports/basketball/le… <df>      
#> 2 4433404    http://sports.core.api.espn.com/v2/sports/basketball/le… <df>      
#> 3 4433404    http://sports.core.api.espn.com/v2/sports/basketball/le… <df>      
#> 4 4433404    http://sports.core.api.espn.com/v2/sports/basketball/le… <df>      
# }
```
