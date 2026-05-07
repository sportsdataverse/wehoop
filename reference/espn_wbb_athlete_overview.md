# **Get ESPN Women's College Basketball Athlete Overview**

**Get ESPN Women's College Basketball Athlete Overview**

**Get ESPN Women's College Basketball Athlete Overview**

## Usage

``` r
espn_wbb_athlete_overview(athlete_id, season = most_recent_wbb_season(), ...)
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

|          |           |
|----------|-----------|
| col_name | types     |
| (varies) | character |

**NextGame**

|            |           |
|------------|-----------|
| col_name   | types     |
| id         | character |
| date       | character |
| name       | character |
| short_name | character |

**Last5Games**

|          |           |
|----------|-----------|
| col_name | types     |
| (varies) | character |

**Headlines**

|             |           |
|-------------|-----------|
| col_name    | types     |
| headline    | character |
| description | character |
| published   | character |

**FantasyOutlook**

|          |           |
|----------|-----------|
| col_name | types     |
| (varies) | character |

## See also

Other ESPN WBB Functions:
[`espn_wbb_athlete_awards()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_athlete_awards.md),
[`espn_wbb_athlete_eventlog()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_athlete_eventlog.md),
[`espn_wbb_athlete_gamelog()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_athlete_gamelog.md),
[`espn_wbb_athlete_info()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_athlete_info.md),
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
  espn_wbb_athlete_overview(athlete_id = "4433985", season = 2025)
#> $Statistics
#> ── ESPN WOMENS-COLLEGE-BASKETBALL Athlete Overview Statistics from ESPN.com ────
#> ℹ Data updated: 2026-05-07 18:39:48 UTC
#> # A tibble: 0 × 0
#> 
#> $NextGame
#> ── ESPN WOMENS-COLLEGE-BASKETBALL Athlete Overview NextGame from ESPN.com ──────
#> ℹ Data updated: 2026-05-07 18:39:48 UTC
#> # A tibble: 1 × 4
#>   id    date  name  short_name
#>   <chr> <chr> <chr> <chr>     
#> 1 NA    NA    NA    NA        
#> 
#> $Last5Games
#> ── ESPN WOMENS-COLLEGE-BASKETBALL Athlete Overview Last5Games from ESPN.com ────
#> ℹ Data updated: 2026-05-07 18:39:48 UTC
#> # A tibble: 0 × 0
#> 
#> $Headlines
#> ── ESPN WOMENS-COLLEGE-BASKETBALL Athlete Overview Headlines from ESPN.com ─────
#> ℹ Data updated: 2026-05-07 18:39:48 UTC
#> # A tibble: 26 × 5
#>    headline                                   description published byline type 
#>    <chr>                                      <chr>       <chr>     <chr>  <chr>
#>  1 Kylie Feuerbach hits the shot vs. Illinoi… Kylie Feue… 2026-03-… NA     Media
#>  2 What a shot by Kylie Feuerbach             Kylie Feue… 2026-02-… NA     Media
#>  3 Iowa Hawkeyes vs. Purdue Boilermakers: Ga… Iowa Hawke… 2026-02-… NA     Media
#>  4 What a shot by Kylie Feuerbach             What a sho… 2026-02-… NA     Media
#>  5 Michigan State Spartans vs. Iowa Hawkeyes… Michigan S… 2026-01-… NA     Media
#>  6 Kylie Feuerbach drills basket vs. Michiga… Kylie Feue… 2026-01-… NA     Media
#>  7 Kylie Feuerbach beats the 1st-quarter buz… Kylie Feue… 2025-12-… NA     Media
#>  8 Miami Hurricanes vs. Iowa Hawkeyes: Game … Miami Hurr… 2025-11-… NA     Media
#>  9 Kylie Feuerbach hits a 3 for Iowa          Kylie Feue… 2025-03-… NA     Media
#> 10 Ohio State Buckeyes vs. Iowa Hawkeyes - G… Watch the … 2025-03-… NA     Media
#> # ℹ 16 more rows
#> 
#> $FantasyOutlook
#> ── ESPN WOMENS-COLLEGE-BASKETBALL Athlete Overview FantasyOutlook from ESPN.com 
#> ℹ Data updated: 2026-05-07 18:39:48 UTC
#> # A tibble: 0 × 0
#> 
# }
```
