# **Get ESPN WNBA Team Detail**

**Get ESPN WNBA Team Detail**

**Get ESPN WNBA Team Detail**

## Usage

``` r
espn_wnba_team(team_id, season = most_recent_wnba_season(), ...)
```

## Arguments

- team_id:

  ESPN team identifier (character or numeric).

- season:

  Season year (numeric, e.g. 2025). Defaults to the most recent WNBA
  season.

- ...:

  Additional arguments; currently unused but retained for forward
  compatibility. Proxy configuration should use
  `options(wehoop.proxy = ...)` – see `?wehoop` for details.

## Value

A named list of data frames: `Info`, `Record`, `NextEvent`,
`StandingSummary`, `Coaches`.

**Info**

|                    |           |                                            |
|--------------------|-----------|--------------------------------------------|
| col_name           | types     | description                                |
| id                 | character | Unique play identifcation number           |
| uid                | character | ESPN UID string (universal identifier).    |
| slug               | character | URL-safe identifier.                       |
| abbreviation       | character | Short abbreviation.                        |
| display_name       | character | Display name.                              |
| short_display_name | character | Short display name.                        |
| name               | character | Display name.                              |
| nickname           | character | Team or athlete nickname.                  |
| location           | character | Filter results by game location.           |
| color              | character | Primary color (hex without leading '#').   |
| alternate_color    | character | Alternate color (hex without leading '#'). |
| logo               | character | Team or league logo URL.                   |

**Record**

|          |           |                         |
|----------|-----------|-------------------------|
| col_name | types     | description             |
| type     | character | Record type / category. |
| summary  | character | Summary.                |
| stats    | list      | Stats.                  |

**NextEvent**

|            |           |                                  |
|------------|-----------|----------------------------------|
| col_name   | types     | description                      |
| id         | character | Unique play identifcation number |
| date       | character | Date in YYYY-MM-DD format.       |
| name       | character | Display name.                    |
| short_name | character | Short display name.              |

**StandingSummary**

|                  |           |                   |
|------------------|-----------|-------------------|
| col_name         | types     | description       |
| standing_summary | character | Standing summary. |

**Coaches**

|            |           |                                   |
|------------|-----------|-----------------------------------|
| col_name   | types     | description                       |
| id         | character | Unique play identifcation number  |
| first_name | character | Player's first name.              |
| last_name  | character | Player's last name.               |
| experience | integer   | Years of professional experience. |

## See also

Other ESPN WNBA Functions:
[`espn_wnba_athlete_awards()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_athlete_awards.md),
[`espn_wnba_athlete_eventlog()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_athlete_eventlog.md),
[`espn_wnba_athlete_gamelog()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_athlete_gamelog.md),
[`espn_wnba_athlete_info()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_athlete_info.md),
[`espn_wnba_athlete_overview()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_athlete_overview.md),
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
  espn_wnba_team(team_id = "17", season = 2025)
#> $Info
#> ── ESPN WNBA Team Info from ESPN.com ─────────────────────────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-05-17 15:19:10 UTC
#> # A tibble: 1 × 12
#>   id    uid    slug  abbreviation display_name short_display_name name  location
#>   <chr> <chr>  <chr> <chr>        <chr>        <chr>              <chr> <chr>   
#> 1 17    s:40~… las-… LV           Las Vegas A… Aces               Aces  Las Veg…
#> # ℹ 4 more variables: color <chr>, alternate_color <chr>, logo <chr>,
#> #   logo_dark <chr>
#> 
#> $Record
#> ── ESPN WNBA Team Record from ESPN.com ───────────────────────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-05-17 15:19:10 UTC
#> # A tibble: 3 × 4
#>   description    type  summary stats        
#>   <chr>          <chr> <chr>   <list>       
#> 1 Overall Record total 3-1     <df [20 × 2]>
#> 2 Home Record    home  0-1     <df [5 × 2]> 
#> 3 Away Record    road  3-0     <df [5 × 2]> 
#> 
#> $NextEvent
#> ── ESPN WNBA Team Next Event from ESPN.com ───────────────────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-05-17 15:19:10 UTC
#> # A tibble: 1 × 4
#>   id        date              name                            short_name
#>   <chr>     <chr>             <chr>                           <chr>     
#> 1 401856915 2026-05-17T17:30Z Las Vegas Aces at Atlanta Dream LV @ ATL  
#> 
#> $StandingSummary
#> ── ESPN WNBA Team Standing Summary from ESPN.com ─────────────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-05-17 15:19:10 UTC
#> # A tibble: 1 × 1
#>   standing_summary                  
#>   <chr>                             
#> 1 1st in Western Conference Division
#> 
#> $Coaches
#> data frame with 0 columns and 0 rows
#> 
# }
```
