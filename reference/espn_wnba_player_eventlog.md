# **Get ESPN WNBA Athlete Overview**

**Get ESPN WNBA Athlete Overview**

**Get ESPN WNBA Athlete Stats**

**Get ESPN WNBA Athlete Gamelog**

**Get ESPN WNBA Athlete Splits**

**Get ESPN WNBA Athlete Eventlog**

**Get ESPN WNBA Athlete Eventlog**

**Get ESPN WNBA Athlete Statisticslog**

## Usage

``` r
espn_wnba_player_overview(athlete_id, season = most_recent_wnba_season(), ...)

espn_wnba_player_stats_v3(athlete_id, season = most_recent_wnba_season(), ...)

espn_wnba_player_gamelog(athlete_id, season = most_recent_wnba_season(), ...)

espn_wnba_player_splits(athlete_id, season = most_recent_wnba_season(), ...)

espn_wnba_player_eventlog(athlete_id, season = most_recent_wnba_season(), ...)

espn_wnba_player_statisticslog(
  athlete_id,
  season = most_recent_wnba_season(),
  ...
)
```

## Arguments

- athlete_id:

  ESPN athlete identifier (character or numeric).

- season:

  Season year (numeric). Defaults to the most recent WNBA season.

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
| team_slug | character | Team slug (e.g. 'phoenix-mercury'). |
| avg\_\* | numeric | Per-game season-average stats (e.g. `avg_avg_points`). |
| tot\_\* | numeric | Season-total stats (e.g. `tot_points`). |
| misc\_\* | numeric | Miscellaneous season totals. |

Stat column names come from ESPN's positional `names` array per
category, cleaned via
[`janitor::make_clean_names()`](https://sfirke.github.io/janitor/reference/make_clean_names.html);
the exact set varies by season.

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

Other ESPN WNBA Functions:
[`espn_wnba_athletes_index()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_athletes_index.md),
[`espn_wnba_award()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_award.md),
[`espn_wnba_calendar()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_calendar.md),
[`espn_wnba_coach_season()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_coach_season.md),
[`espn_wnba_coaches()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_coaches.md),
[`espn_wnba_conferences()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_conferences.md),
[`espn_wnba_draft()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_draft.md),
[`espn_wnba_draft_athlete_detail()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_draft_athlete_detail.md),
[`espn_wnba_draft_pick()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_draft_pick.md),
[`espn_wnba_draft_rounds()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_draft_athletes.md),
[`espn_wnba_franchise()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_franchise.md),
[`espn_wnba_franchises()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_franchises.md),
[`espn_wnba_freeagents()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_freeagents.md),
[`espn_wnba_futures()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_futures.md),
[`espn_wnba_game_all()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_all.md),
[`espn_wnba_game_odds()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_broadcasts.md),
[`espn_wnba_game_official_detail()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_official_detail.md),
[`espn_wnba_game_play()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_play.md),
[`espn_wnba_game_play_personnel()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_play_personnel.md),
[`espn_wnba_game_player_box()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_player_box.md),
[`espn_wnba_game_probabilities()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_probabilities.md),
[`espn_wnba_game_propbets()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_propbets.md),
[`espn_wnba_game_team_linescores()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_team_leaders.md),
[`espn_wnba_game_team_roster_entry()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_team_roster_entry.md),
[`espn_wnba_injuries()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_injuries.md),
[`espn_wnba_leaders()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_leaders.md),
[`espn_wnba_news()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_news.md),
[`espn_wnba_player_awards()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_player_awards.md),
[`espn_wnba_player_career_stats()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_player_career_stats.md),
[`espn_wnba_player_eventlog_v2()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_player_eventlog_v2.md),
[`espn_wnba_player_info()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_player_info.md),
[`espn_wnba_player_seasons()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_player_seasons.md),
[`espn_wnba_player_stats()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_player_stats.md),
[`espn_wnba_position()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_position.md),
[`espn_wnba_positions()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_positions.md),
[`espn_wnba_powerindex()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_powerindex.md),
[`espn_wnba_scoreboard()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_scoreboard.md),
[`espn_wnba_season_awards()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_season_awards.md),
[`espn_wnba_season_group()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_season_group.md),
[`espn_wnba_season_groups()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_season_groups.md),
[`espn_wnba_season_info()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_season_info.md),
[`espn_wnba_season_leaders()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_season_leaders.md),
[`espn_wnba_season_ranking()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_season_ranking.md),
[`espn_wnba_season_rankings()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_season_rankings.md),
[`espn_wnba_season_type()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_season_type.md),
[`espn_wnba_season_types()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_season_types.md),
[`espn_wnba_season_week()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_season_week.md),
[`espn_wnba_season_weeks()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_season_weeks.md),
[`espn_wnba_seasons()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_seasons.md),
[`espn_wnba_standings()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_standings.md),
[`espn_wnba_team()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team.md),
[`espn_wnba_team_injuries()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team_injuries.md),
[`espn_wnba_team_news()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team_news.md),
[`espn_wnba_team_record()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team_record.md),
[`espn_wnba_team_record_detail()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team_record_detail.md),
[`espn_wnba_team_schedule()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team_schedule.md),
[`espn_wnba_team_season_roster()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team_season_roster.md),
[`espn_wnba_team_season_statistics()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team_season_statistics.md),
[`espn_wnba_team_stats()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team_stats.md),
[`espn_wnba_teams()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_teams.md),
[`espn_wnba_transactions()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_transactions.md),
[`espn_wnba_venues()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_venues.md),
[`espn_wnba_week_ranking()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_week_ranking.md),
[`espn_wnba_week_rankings()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_week_rankings.md)

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  espn_wnba_player_overview(athlete_id = "3149391", season = 2024)
#> $Statistics
#> ── ESPN WNBA Athlete Overview Statistics from ESPN.com ───────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-08-27 11:02:25 UTC
#> # A tibble: 0 × 0
#> 
#> $NextGame
#> ── ESPN WNBA Athlete Overview NextGame from ESPN.com ─────────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-08-27 11:02:25 UTC
#> # A tibble: 1 × 4
#>   id    date  name  short_name
#>   <chr> <chr> <chr> <chr>     
#> 1 NA    NA    NA    NA        
#> 
#> $Last5Games
#> ── ESPN WNBA Athlete Overview Last5Games from ESPN.com ───────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-08-27 11:02:25 UTC
#> # A tibble: 0 × 0
#> 
#> $Headlines
#> ── ESPN WNBA Athlete Overview Headlines from ESPN.com ────────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-08-27 11:02:25 UTC
#> # A tibble: 22 × 5
#>    headline                                   description published byline type 
#>    <chr>                                      <chr>       <chr>     <chr>  <chr>
#>  1 WNBA Power Rankings: Valkyries make state… Golden Sta… 2026-08-… Micha… Story
#>  2 Toronto Tempo vs. Las Vegas Aces - Game H… Watch the … 2026-08-… NA     Media
#>  3 Las Vegas Aces vs. Connecticut Sun - Game… Watch the … 2026-08-… NA     Media
#>  4 A'ja Wilson gets the hoop and the harm     A'ja Wilso… 2026-08-… NA     Media
#>  5 Las Vegas Aces vs. Atlanta Dream - Game H… Watch the … 2026-08-… NA     Media
#>  6 A'ja Wilson gets the basket and the foul   A'ja Wilso… 2026-08-… NA     Media
#>  7 A'ja Wilson elevates for a tough block     A'ja Wilso… 2026-08-… NA     Media
#>  8 WNBA Power Rankings: Can Liberty find way… New York, … 2026-08-… Micha… Story
#>  9 Las Vegas Aces vs. Minnesota Lynx - Game … Watch the … 2026-08-… NA     Media
#> 10 A'ja Wilson somehow gets the and-1 to fall A'ja Wilso… 2026-08-… NA     Media
#> # ℹ 12 more rows
#> 
#> $FantasyOutlook
#> ── ESPN WNBA Athlete Overview FantasyOutlook from ESPN.com ───── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-08-27 11:02:25 UTC
#> # A tibble: 1 × 1
#>   outlook
#>   <chr>  
#> 1 NA     
#> 
# }
# \donttest{
  espn_wnba_player_stats_v3(athlete_id = "4068159", season = 2024)
#> ── ESPN WNBA Athlete Stats from ESPN.com ─────────────────────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-08-27 11:02:25 UTC
#> # A tibble: 9 × 47
#>   athlete_id season team_id team_slug         avg_games_played avg_games_started
#>   <chr>       <int> <chr>   <chr>                        <dbl>             <dbl>
#> 1 4068159      2020 16      washington-mysti…               12                 0
#> 2 4068159      2023 11      phoenix-mercury                 40                12
#> 3 4068159      2024 11      phoenix-mercury                 22                 0
#> 4 4068159      2024 16      washington-mysti…                7                 0
#> 5 4068159      2024 NA      2024 Totals                     29                 0
#> 6 4068159      2025 16      washington-mysti…               43                43
#> 7 4068159      2026 132052  portland-fire                    3                 2
#> 8 4068159      2026 3       dallas-wings                    21                 0
#> 9 4068159      2026 NA      2026 Totals                     24                 2
#> # ℹ 41 more variables: avg_avg_minutes <dbl>, avg_avg_points <dbl>,
#> #   avg_avg_offensive_rebounds <dbl>, avg_avg_defensive_rebounds <dbl>,
#> #   avg_avg_rebounds <dbl>, avg_avg_assists <dbl>, avg_avg_steals <dbl>,
#> #   avg_avg_blocks <dbl>, avg_avg_turnovers <dbl>,
#> #   avg_avg_field_goals_made_avg_field_goals_attempted <dbl>,
#> #   avg_field_goal_pct <dbl>,
#> #   avg_avg_three_point_field_goals_made_avg_three_point_field_goals_attempted <dbl>, …
# }
# \donttest{
  espn_wnba_player_gamelog(athlete_id = "3149391", season = 2024)
#> ── ESPN WNBA Athlete Gamelog from ESPN.com ───────────────────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-08-27 11:02:25 UTC
#> # A tibble: 46 × 26
#>    athlete_id season id        at_vs game_date   score home_team_id away_team_id
#>    <chr>       <dbl> <chr>     <chr> <chr>       <chr> <chr>        <chr>       
#>  1 3149391      2024 401724941 vs    2024-10-06… 76-62 17           9           
#>  2 3149391      2024 401724940 vs    2024-10-05… 95-81 17           9           
#>  3 3149391      2024 401724939 @     2024-10-01… 88-84 9            17          
#>  4 3149391      2024 401724938 @     2024-09-29… 87-77 9            17          
#>  5 3149391      2024 401721262 vs    2024-09-25… 83-76 17           14          
#>  6 3149391      2024 401721256 vs    2024-09-23… 78-67 17           14          
#>  7 3149391      2024 401620451 @     2024-09-18… 85-72 14           17          
#>  8 3149391      2024 401620445 vs    2024-09-15… 84-71 17           18          
#>  9 3149391      2024 401620437 @     2024-09-13… 78-74 5            17          
#> 10 3149391      2024 401620432 @     2024-09-11… 86-75 5            17          
#> # ℹ 36 more rows
#> # ℹ 18 more variables: home_team_score <chr>, away_team_score <chr>,
#> #   game_result <chr>, league_name <chr>, league_abbreviation <chr>,
#> #   league_short_name <chr>, event_note <chr>, team_id <chr>, team_uid <chr>,
#> #   team_abbreviation <chr>, team_logo <chr>, team_is_all_star <chr>,
#> #   opponent_id <chr>, opponent_uid <chr>, opponent_display_name <chr>,
#> #   opponent_abbreviation <chr>, opponent_logo <chr>, event_id <chr>
# }
# \donttest{
  espn_wnba_player_splits(athlete_id = "3149391", season = 2024)
#> ── ESPN WNBA Athlete Splits from ESPN.com ────────────────────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-08-27 11:02:25 UTC
#> # A tibble: 7 × 5
#>   athlete_id season name       display_name splits       
#>   <chr>       <dbl> <chr>      <chr>        <list>       
#> 1 3149391      2024 split      split        <df [1 × 3]> 
#> 2 3149391      2024 byMonth    Month        <NULL>       
#> 3 3149391      2024 byResult   Result       <NULL>       
#> 4 3149391      2024 byPosition Position     <NULL>       
#> 5 3149391      2024 byDay      Day          <NULL>       
#> 6 3149391      2024 byOpponent Opponent     <df [19 × 3]>
#> 7 3149391      2024 byArena    Arena        <df [31 × 3]>
# }
# \donttest{
  espn_wnba_player_eventlog(athlete_id = "3149391", season = 2024)
#> ── ESPN WNBA Athlete Eventlog from ESPN.com ──────────────────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-08-27 11:02:25 UTC
#> # A tibble: 25 × 8
#>    athlete_id season event_ref   competition_ref team_ref statistics_ref team_id
#>    <chr>       <dbl> <chr>       <chr>           <chr>    <chr>          <chr>  
#>  1 3149391      2024 http://spo… http://sports.… NA       http://sports… 17     
#>  2 3149391      2024 http://spo… http://sports.… NA       http://sports… 17     
#>  3 3149391      2024 http://spo… http://sports.… NA       http://sports… 17     
#>  4 3149391      2024 http://spo… http://sports.… NA       http://sports… 17     
#>  5 3149391      2024 http://spo… http://sports.… NA       http://sports… 17     
#>  6 3149391      2024 http://spo… http://sports.… NA       http://sports… 17     
#>  7 3149391      2024 http://spo… http://sports.… NA       http://sports… 17     
#>  8 3149391      2024 http://spo… http://sports.… NA       http://sports… 17     
#>  9 3149391      2024 http://spo… http://sports.… NA       http://sports… 17     
#> 10 3149391      2024 http://spo… http://sports.… NA       http://sports… 17     
#> # ℹ 15 more rows
#> # ℹ 1 more variable: played <lgl>
# }
# \donttest{
  espn_wnba_player_statisticslog(athlete_id = "3149391", season = 2024)
#> ── ESPN WNBA Athlete Statisticslog from ESPN.com ─────────────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-08-27 11:02:26 UTC
#> # A tibble: 9 × 3
#>   athlete_id season$`$ref`                                            statistics
#>   <chr>      <chr>                                                    <list>    
#> 1 3149391    http://sports.core.api.espn.com/v2/sports/basketball/le… <df>      
#> 2 3149391    http://sports.core.api.espn.com/v2/sports/basketball/le… <df>      
#> 3 3149391    http://sports.core.api.espn.com/v2/sports/basketball/le… <df>      
#> 4 3149391    http://sports.core.api.espn.com/v2/sports/basketball/le… <df>      
#> 5 3149391    http://sports.core.api.espn.com/v2/sports/basketball/le… <df>      
#> 6 3149391    http://sports.core.api.espn.com/v2/sports/basketball/le… <df>      
#> 7 3149391    http://sports.core.api.espn.com/v2/sports/basketball/le… <df>      
#> 8 3149391    http://sports.core.api.espn.com/v2/sports/basketball/le… <df>      
#> 9 3149391    http://sports.core.api.espn.com/v2/sports/basketball/le… <df>      
# }
```
