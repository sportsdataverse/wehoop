# **Get ESPN WNBA Athlete Info**

**Get ESPN WNBA Athlete Info**

**Get ESPN WNBA Athlete Info**

## Usage

``` r
espn_wnba_athlete_info(athlete_id, ...)
```

## Arguments

- athlete_id:

  ESPN athlete identifier (character or numeric).

- ...:

  Additional arguments; currently unused but retained for forward
  compatibility. Proxy configuration should use
  `options(wehoop.proxy = ...)` – see `?wehoop` for details.

## Value

A named list of data frames: `Bio`, `Team`, `Position`, `Status`,
`College`, `Draft`.

**Bio**

|               |           |
|---------------|-----------|
| col_name      | types     |
| id            | character |
| full_name     | character |
| display_name  | character |
| jersey        | character |
| age           | character |
| date_of_birth | character |
| headshot_href | character |

**Team**

|              |           |
|--------------|-----------|
| col_name     | types     |
| id           | character |
| abbreviation | character |
| display_name | character |

**Position**

|              |           |
|--------------|-----------|
| col_name     | types     |
| id           | character |
| name         | character |
| abbreviation | character |

**Status**

|          |           |
|----------|-----------|
| col_name | types     |
| id       | character |
| name     | character |
| type     | character |

**College**

|          |           |
|----------|-----------|
| col_name | types     |
| id       | character |
| name     | character |
| mascot   | character |

**Draft**

|           |           |
|-----------|-----------|
| col_name  | types     |
| year      | character |
| round     | character |
| selection | character |

## See also

Other ESPN WNBA Functions:
[`espn_wnba_athlete_awards()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_athlete_awards.md),
[`espn_wnba_athlete_eventlog()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_athlete_eventlog.md),
[`espn_wnba_athlete_gamelog()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_athlete_gamelog.md),
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
  espn_wnba_athlete_info(athlete_id = "3149391")
#> $Bio
#> ── ESPN WNBA Athlete Bio from ESPN.com ───────────────────────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-05-17 05:59:55 UTC
#> # A tibble: 1 × 20
#>   id      uid       guid  first_name last_name full_name display_name short_name
#>   <chr>   <chr>     <chr> <chr>      <chr>     <chr>     <chr>        <chr>     
#> 1 3149391 s:40~l:5… 9d04… A'ja       Wilson    A'ja Wil… A'ja Wilson  A. Wilson 
#> # ℹ 12 more variables: weight <dbl>, display_weight <chr>, height <dbl>,
#> #   display_height <chr>, age <int>, date_of_birth <chr>, jersey <chr>,
#> #   active <lgl>, headshot_href <chr>, birth_city <chr>, birth_state <chr>,
#> #   birth_country <chr>
#> 
#> $Team
#> ── ESPN WNBA Athlete Team from ESPN.com ──────────────────────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-05-17 05:59:55 UTC
#> # A tibble: 1 × 1
#>   x_ref                                                                         
#>   <chr>                                                                         
#> 1 http://sports.core.api.espn.com/v2/sports/basketball/leagues/wnba/seasons/202…
#> 
#> $Position
#> ── ESPN WNBA Athlete Position from ESPN.com ──────────────────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-05-17 05:59:55 UTC
#> # A tibble: 1 × 5
#>   id    name   display_name abbreviation leaf 
#>   <chr> <chr>  <chr>        <chr>        <lgl>
#> 1 9     Center Center       C            FALSE
#> 
#> $Status
#> ── ESPN WNBA Athlete Status from ESPN.com ────────────────────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-05-17 05:59:55 UTC
#> # A tibble: 1 × 4
#>   id    name   type   abbreviation
#>   <chr> <chr>  <chr>  <chr>       
#> 1 1     Active active Active      
#> 
#> $College
#> ── ESPN WNBA Athlete College from ESPN.com ───────────────────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-05-17 05:59:55 UTC
#> # A tibble: 1 × 1
#>   x_ref                                                             
#>   <chr>                                                             
#> 1 http://sports.core.api.espn.com/v2/colleges/2579?lang=en&region=us
#> 
#> $Draft
#> ── ESPN WNBA Athlete Draft from ESPN.com ─────────────────────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-05-17 05:59:55 UTC
#> # A tibble: 1 × 4
#>   year  round selection display_text               
#>   <chr> <chr> <chr>     <chr>                      
#> 1 2018  1     1         Year: 2018 Round: 1 Pick: 1
#> 
# }
```
