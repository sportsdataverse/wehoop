# Get ESPN women's college basketball play by play data

Get ESPN women's college basketball play by play data

## Usage

``` r
espn_wbb_pbp(game_id)
```

## Arguments

- game_id:

  Game ID

## Value

Returns a play-by-play data frame

**Plays**

|                           |           |
|---------------------------|-----------|
| col_name                  | types     |
| id                        | character |
| sequence_number           | character |
| text                      | character |
| away_score                | integer   |
| home_score                | integer   |
| scoring_play              | logical   |
| score_value               | integer   |
| wallclock                 | character |
| shooting_play             | logical   |
| type_id                   | integer   |
| type_text                 | character |
| period_number             | integer   |
| period_display_value      | character |
| clock_display_value       | character |
| team_id                   | integer   |
| coordinate_x_raw          | numeric   |
| coordinate_y_raw          | numeric   |
| coordinate_x              | numeric   |
| coordinate_y              | numeric   |
| play_id                   | character |
| athlete_id_1              | integer   |
| athlete_id_2              | integer   |
| home_team_id              | integer   |
| home_team_mascot          | character |
| home_team_name            | character |
| home_team_abbrev          | character |
| home_team_logo            | character |
| home_team_logo_dark       | character |
| home_team_full_name       | character |
| home_team_color           | character |
| home_team_alternate_color | character |
| home_team_score           | integer   |
| home_team_winner          | logical   |
| home_team_record          | character |
| away_team_id              | integer   |
| away_team_mascot          | character |
| away_team_name            | character |
| away_team_abbrev          | character |
| away_team_logo            | character |
| away_team_logo_dark       | character |
| away_team_full_name       | character |
| away_team_color           | character |
| away_team_alternate_color | character |
| away_team_score           | integer   |
| away_team_winner          | logical   |
| away_team_record          | character |
| game_id                   | integer   |
| season                    | integer   |
| season_type               | integer   |
| game_date                 | Date      |
| game_date_time            | POSIXct   |

## See also

Other ESPN WBB Functions:
[`espn_wbb_athlete_awards()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_athlete_awards.md),
[`espn_wbb_athlete_eventlog()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_athlete_eventlog.md),
[`espn_wbb_athlete_gamelog()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_athlete_gamelog.md),
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
  try(espn_wbb_pbp(game_id = 401498717))
#> ── ESPN WBB Play-by-Play Information from ESPN.com ───────────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-05-06 01:43:38 UTC
#> # A tibble: 369 × 49
#>    id       sequence_number text  away_score home_score scoring_play score_value
#>    <chr>    <chr>           <chr>      <int>      <int> <lgl>              <int>
#>  1 4014987… 101905701       Agne…          0          0 FALSE                  3
#>  2 4014987… 101906001       Isab…          0          0 FALSE                  0
#>  3 4014987… 101907101       Alis…          0          0 FALSE                  2
#>  4 4014987… 101907301       Came…          0          0 FALSE                  0
#>  5 4014987… 101908001       Hale…          0          0 FALSE                  2
#>  6 4014987… 101908201       Kenn…          0          0 FALSE                  0
#>  7 4014987… 101909401       Jenn…          0          0 FALSE                  2
#>  8 4014987… 101909402       Hale…          0          0 FALSE                  0
#>  9 4014987… 101909801       Hale…          0          0 FALSE                  0
#> 10 4014987… 101914101       Agne…          3          0 TRUE                   3
#> # ℹ 359 more rows
#> # ℹ 42 more variables: wallclock <chr>, shooting_play <lgl>,
#> #   points_attempted <int>, short_description <chr>, type_id <int>,
#> #   type_text <chr>, period_number <int>, period_display_value <chr>,
#> #   clock_display_value <chr>, team_id <int>, play_id <chr>,
#> #   athlete_id_1 <int>, athlete_id_2 <int>, home_team_id <int>,
#> #   home_team_mascot <chr>, home_team_name <chr>, home_team_abbrev <chr>, …
# }
```
