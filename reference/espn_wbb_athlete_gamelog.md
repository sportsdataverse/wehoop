# **Get ESPN Women's College Basketball Athlete Gamelog**

**Get ESPN Women's College Basketball Athlete Gamelog**

**Get ESPN Women's College Basketball Athlete Gamelog**

## Usage

``` r
espn_wbb_athlete_gamelog(athlete_id, season = most_recent_wbb_season(), ...)
```

## Arguments

- athlete_id:

  ESPN athlete identifier (character or numeric).

- season:

  Season year (numeric). Defaults to the most recent WBB season.

- ...:

  Additional arguments; currently unused.

## Value

A single tibble with one row per game. Column names reflect the stat
labels returned by ESPN and will vary by season and player.

## See also

Other ESPN WBB Functions:
[`espn_wbb_athlete_awards()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_athlete_awards.md),
[`espn_wbb_athlete_eventlog()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_athlete_eventlog.md),
[`espn_wbb_athlete_info()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_athlete_info.md),
[`espn_wbb_athlete_overview()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_athlete_overview.md),
[`espn_wbb_athlete_splits()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_athlete_splits.md),
[`espn_wbb_athlete_statisticslog()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_athlete_statisticslog.md),
[`espn_wbb_athlete_stats()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_athlete_stats.md),
[`espn_wbb_athletes_index()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_athletes_index.md),
[`espn_wbb_calendar()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_calendar.md),
[`espn_wbb_coaches()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_coaches.md),
[`espn_wbb_conferences()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_conferences.md),
[`espn_wbb_event_broadcasts()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_event_broadcasts.md),
[`espn_wbb_event_odds()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_event_odds.md),
[`espn_wbb_event_officials()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_event_officials.md),
[`espn_wbb_event_probabilities()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_event_probabilities.md),
[`espn_wbb_game_all()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_game_all.md),
[`espn_wbb_game_rosters()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_game_rosters.md),
[`espn_wbb_injuries()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_injuries.md),
[`espn_wbb_leaders()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_leaders.md),
[`espn_wbb_news()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_news.md),
[`espn_wbb_pbp()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_pbp.md),
[`espn_wbb_player_box()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_player_box.md),
[`espn_wbb_player_stats()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_player_stats.md),
[`espn_wbb_rankings()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_rankings.md),
[`espn_wbb_scoreboard()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_scoreboard.md),
[`espn_wbb_season_info()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_season_info.md),
[`espn_wbb_seasons()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_seasons.md),
[`espn_wbb_standings()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_standings.md),
[`espn_wbb_team()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_team.md),
[`espn_wbb_team_box()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_team_box.md),
[`espn_wbb_team_injuries()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_team_injuries.md),
[`espn_wbb_team_leaders()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_team_leaders.md),
[`espn_wbb_team_news()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_team_news.md),
[`espn_wbb_team_roster()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_team_roster.md),
[`espn_wbb_team_schedule()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_team_schedule.md),
[`espn_wbb_team_stats()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_team_stats.md),
[`espn_wbb_teams()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_teams.md),
[`espn_wbb_venues()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_venues.md)

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  espn_wbb_athlete_gamelog(athlete_id = "4433985", season = 2025)
#> ── ESPN WOMENS-COLLEGE-BASKETBALL Athlete Gamelog from ESPN.com ────────────────
#> ℹ Data updated: 2026-05-17 13:51:14 UTC
#> # A tibble: 34 × 26
#>    id      week  at_vs game_date score home_team_id away_team_id home_team_score
#>    <chr>   <chr> <chr> <chr>     <chr> <chr>        <chr>        <chr>          
#>  1 401746… 2     @     2025-03-… 96-62 201          2294         96             
#>  2 401746… 1     vs    2025-03-… 92-57 2294         93           92             
#>  3 401743… 18    vs    2025-03-… 60-59 194          2294         60             
#>  4 401743… 18    vs    2025-03-… 74-61 127          2294         61             
#>  5 401743… 18    vs    2025-03-… 81-54 2294         275          81             
#>  6 401721… 17    vs    2025-03-… 81-66 2294         275          81             
#>  7 401721… 17    @     2025-02-… 79-66 130          2294         66             
#>  8 401721… 16    vs    2025-02-… 67-65 2294         26           65             
#>  9 401721… 16    @     2025-02-… 86-7… 194          2294         86             
#> 10 401721… 15    vs    2025-02-… 55-43 2294         164          55             
#> # ℹ 24 more rows
#> # ℹ 18 more variables: away_team_score <chr>, game_result <chr>,
#> #   league_name <chr>, league_abbreviation <chr>, league_short_name <chr>,
#> #   event_note <chr>, team_id <chr>, team_uid <chr>, team_abbreviation <chr>,
#> #   team_logo <chr>, team_is_all_star <chr>, opponent_id <chr>,
#> #   opponent_uid <chr>, opponent_display_name <chr>,
#> #   opponent_abbreviation <chr>, opponent_logo <chr>, opponent_rank <chr>, …
# }
```
