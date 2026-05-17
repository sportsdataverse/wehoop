# **Get ESPN WNBA Athlete Overview**

**Get ESPN WNBA Athlete Overview**

**Get ESPN WNBA Athlete Overview**

## Usage

``` r
espn_wnba_athlete_overview(athlete_id, season = most_recent_wnba_season(), ...)
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

Other ESPN WNBA Functions:
[`espn_wnba_athlete_awards()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_athlete_awards.md),
[`espn_wnba_athlete_eventlog()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_athlete_eventlog.md),
[`espn_wnba_athlete_gamelog()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_athlete_gamelog.md),
[`espn_wnba_athlete_info()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_athlete_info.md),
[`espn_wnba_athlete_splits()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_athlete_splits.md),
[`espn_wnba_athlete_statisticslog()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_athlete_statisticslog.md),
[`espn_wnba_athlete_stats()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_athlete_stats.md),
[`espn_wnba_athletes_index()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_athletes_index.md),
[`espn_wnba_calendar()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_calendar.md),
[`espn_wnba_coaches()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_coaches.md),
[`espn_wnba_conferences()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_conferences.md),
[`espn_wnba_draft()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_draft.md),
[`espn_wnba_event_broadcasts()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_event_broadcasts.md),
[`espn_wnba_event_odds()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_event_odds.md),
[`espn_wnba_event_officials()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_event_officials.md),
[`espn_wnba_event_probabilities()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_event_probabilities.md),
[`espn_wnba_freeagents()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_freeagents.md),
[`espn_wnba_game_all()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_all.md),
[`espn_wnba_game_rosters()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_rosters.md),
[`espn_wnba_injuries()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_injuries.md),
[`espn_wnba_leaders()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_leaders.md),
[`espn_wnba_news()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_news.md),
[`espn_wnba_pbp()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_pbp.md),
[`espn_wnba_player_box()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_player_box.md),
[`espn_wnba_player_stats()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_player_stats.md),
[`espn_wnba_scoreboard()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_scoreboard.md),
[`espn_wnba_season_info()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_season_info.md),
[`espn_wnba_seasons()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_seasons.md),
[`espn_wnba_standings()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_standings.md),
[`espn_wnba_team()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team.md),
[`espn_wnba_team_box()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team_box.md),
[`espn_wnba_team_injuries()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team_injuries.md),
[`espn_wnba_team_leaders()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team_leaders.md),
[`espn_wnba_team_news()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team_news.md),
[`espn_wnba_team_roster()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team_roster.md),
[`espn_wnba_team_schedule()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team_schedule.md),
[`espn_wnba_team_stats()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team_stats.md),
[`espn_wnba_teams()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_teams.md),
[`espn_wnba_transactions()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_transactions.md),
[`espn_wnba_venues()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_venues.md)

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  espn_wnba_athlete_overview(athlete_id = "3149391", season = 2024)
#> $Statistics
#> ── ESPN WNBA Athlete Overview Statistics from ESPN.com ───────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-05-17 05:59:56 UTC
#> # A tibble: 0 × 0
#> 
#> $NextGame
#> ── ESPN WNBA Athlete Overview NextGame from ESPN.com ─────────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-05-17 05:59:56 UTC
#> # A tibble: 1 × 4
#>   id    date  name  short_name
#>   <chr> <chr> <chr> <chr>     
#> 1 NA    NA    NA    NA        
#> 
#> $Last5Games
#> ── ESPN WNBA Athlete Overview Last5Games from ESPN.com ───────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-05-17 05:59:56 UTC
#> # A tibble: 0 × 0
#> 
#> $Headlines
#> ── ESPN WNBA Athlete Overview Headlines from ESPN.com ────────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-05-17 05:59:56 UTC
#> # A tibble: 21 × 5
#>    headline                                   description published byline type 
#>    <chr>                                      <chr>       <chr>     <chr>  <chr>
#>  1 A'ja Wilson puts up 45 to power Aces past… A'ja Wilso… 2026-05-… NA     Media
#>  2 A'ja Wilson torches Sun for 45 as Aces ro… A'ja Wilso… 2026-05-… NA     Head…
#>  3 Connecticut Sun vs. Las Vegas Aces - Game… Watch the … 2026-05-… NA     Media
#>  4 What a shot by A'ja Wilson                 What a sho… 2026-05-… NA     Media
#>  5 A'ja Wilson makes the bucket               A'ja Wilso… 2026-05-… NA     Media
#>  6 A'ja Wilson knocks down the shot           A'ja Wilso… 2026-05-… NA     Media
#>  7 A'ja Wilson drains the shot                A'ja Wilso… 2026-05-… NA     Media
#>  8 Are A'ja Wilson and WNBA champion Aces re… What keeps… 2026-05-… Micha… Story
#>  9 A'ja Wilson hits the basket                A'ja Wilso… 2026-05-… NA     Media
#> 10 A'ja Wilson drains the shot                A'ja Wilso… 2026-05-… NA     Media
#> # ℹ 11 more rows
#> 
#> $FantasyOutlook
#> ── ESPN WNBA Athlete Overview FantasyOutlook from ESPN.com ───── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-05-17 05:59:56 UTC
#> # A tibble: 1 × 1
#>   outlook
#>   <chr>  
#> 1 NA     
#> 
# }
```
