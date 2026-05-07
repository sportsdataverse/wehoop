# **Get ESPN Women's College Basketball Team Detail**

**Get ESPN Women's College Basketball Team Detail**

**Get ESPN Women's College Basketball Team Detail**

## Usage

``` r
espn_wbb_team(team_id, season = most_recent_wbb_season(), ...)
```

## Arguments

- team_id:

  ESPN team identifier (character or numeric).

- season:

  Season year (numeric, e.g. 2025). Defaults to the most recent WBB
  season.

- ...:

  Additional arguments; currently unused but retained for forward
  compatibility. Proxy configuration should use
  `options(wehoop.proxy = ...)` – see `?wehoop` for details.

## Value

A named list of data frames: `Info`, `Record`, `NextEvent`,
`StandingSummary`, `Coaches`.

**Info**

|                    |           |
|--------------------|-----------|
| col_name           | types     |
| id                 | character |
| uid                | character |
| slug               | character |
| abbreviation       | character |
| display_name       | character |
| short_display_name | character |
| name               | character |
| nickname           | character |
| location           | character |
| color              | character |
| alternate_color    | character |
| logo               | character |

**Record**

|          |           |
|----------|-----------|
| col_name | types     |
| type     | character |
| summary  | character |
| stats    | list      |

**NextEvent**

|            |           |
|------------|-----------|
| col_name   | types     |
| id         | character |
| date       | character |
| name       | character |
| short_name | character |

**StandingSummary**

|                  |           |
|------------------|-----------|
| col_name         | types     |
| standing_summary | character |

**Coaches**

|            |           |
|------------|-----------|
| col_name   | types     |
| id         | character |
| first_name | character |
| last_name  | character |
| experience | integer   |

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
[`espn_wbb_pbp()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_pbp.md),
[`espn_wbb_player_box()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_player_box.md),
[`espn_wbb_player_stats()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_player_stats.md),
[`espn_wbb_rankings()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_rankings.md),
[`espn_wbb_scoreboard()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_scoreboard.md),
[`espn_wbb_season_info()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_season_info.md),
[`espn_wbb_seasons()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_seasons.md),
[`espn_wbb_standings()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_standings.md),
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
  espn_wbb_team(team_id = "2509", season = 2025)
#> $Info
#> ── ESPN WOMENS-COLLEGE-BASKETBALL Team Info from ESPN.com ────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-05-07 18:40:07 UTC
#> # A tibble: 1 × 13
#>   id    uid    slug  abbreviation display_name short_display_name name  nickname
#>   <chr> <chr>  <chr> <chr>        <chr>        <chr>              <chr> <chr>   
#> 1 2509  s:40~… purd… PUR          Purdue Boil… Purdue             Boil… Purdue  
#> # ℹ 5 more variables: location <chr>, color <chr>, alternate_color <chr>,
#> #   logo <chr>, logo_dark <chr>
#> 
#> $Record
#> ── ESPN WOMENS-COLLEGE-BASKETBALL Team Record from ESPN.com ──── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-05-07 18:40:07 UTC
#> # A tibble: 3 × 4
#>   description    type  summary stats        
#>   <chr>          <chr> <chr>   <list>       
#> 1 Overall Record total 13-17   <df [20 × 2]>
#> 2 Home Record    home  11-6    <df [20 × 2]>
#> 3 Away Record    road  2-10    <df [20 × 2]>
#> 
#> $NextEvent
#> ── ESPN WOMENS-COLLEGE-BASKETBALL Team Next Event from ESPN.com ────────────────
#> ℹ Data updated: 2026-05-07 18:40:07 UTC
#> # A tibble: 1 × 4
#>   id        date              name                                short_name
#>   <chr>     <chr>             <chr>                               <chr>     
#> 1 401851368 2026-03-05T01:30Z Purdue Boilermakers at Oregon Ducks PUR VS ORE
#> 
#> $StandingSummary
#> ── ESPN WOMENS-COLLEGE-BASKETBALL Team Standing Summary from ESPN.com ──────────
#> ℹ Data updated: 2026-05-07 18:40:07 UTC
#> # A tibble: 1 × 1
#>   standing_summary
#>   <chr>           
#> 1 14th in Big Ten 
#> 
#> $Coaches
#> data frame with 0 columns and 0 rows
#> 
# }
```
