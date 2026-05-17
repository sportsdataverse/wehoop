# **Get ESPN WNBA Athlete Stats**

**Get ESPN WNBA Athlete Stats**

**Get ESPN WNBA Athlete Stats**

## Usage

``` r
espn_wnba_athlete_stats(athlete_id, season = most_recent_wnba_season(), ...)
```

## Arguments

- athlete_id:

  ESPN athlete identifier (character or numeric).

- season:

  Season year (numeric). Defaults to the most recent WNBA season.

- ...:

  Additional arguments; currently unused.

## Value

A named list of per-category tibbles. Default category names are
`General`, `Offensive`, `Defensive`, `Rebounding`, `Shooting`, `Misc`.
Actual names are driven by the ESPN response; additional categories may
appear. Each tibble has columns depending on the category returned by
ESPN.

## See also

Other ESPN WNBA Functions:
[`espn_wnba_athlete_awards()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_athlete_awards.md),
[`espn_wnba_athlete_eventlog()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_athlete_eventlog.md),
[`espn_wnba_athlete_gamelog()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_athlete_gamelog.md),
[`espn_wnba_athlete_info()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_athlete_info.md),
[`espn_wnba_athlete_overview()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_athlete_overview.md),
[`espn_wnba_athlete_splits()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_athlete_splits.md),
[`espn_wnba_athlete_statisticslog()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_athlete_statisticslog.md),
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
  espn_wnba_athlete_stats(athlete_id = "3149391", season = 2024)
#> $`Regular Season Averages`
#> ── ESPN WNBA Athlete Stats from ESPN.com ─────────────────────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-05-17 15:18:59 UTC
#> # A tibble: 9 × 5
#>   team_id team_slug      season$year $displayName stats      position
#>   <chr>   <chr>                <int> <chr>        <list>     <chr>   
#> 1 17      las-vegas-aces        2018 2018         <chr [18]> C       
#> 2 17      las-vegas-aces        2019 2019         <chr [18]> C       
#> 3 17      las-vegas-aces        2020 2020         <chr [18]> C       
#> 4 17      las-vegas-aces        2021 2021         <chr [18]> C       
#> 5 17      las-vegas-aces        2022 2022         <chr [18]> C       
#> 6 17      las-vegas-aces        2023 2023         <chr [18]> C       
#> 7 17      las-vegas-aces        2024 2024         <chr [18]> C       
#> 8 17      las-vegas-aces        2025 2025         <chr [18]> C       
#> 9 17      las-vegas-aces        2026 2026         <chr [18]> C       
#> 
#> $`Regular Season Totals`
#> ── ESPN WNBA Athlete Stats from ESPN.com ─────────────────────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-05-17 15:18:59 UTC
#> # A tibble: 9 × 5
#>   team_id team_slug      season$year $displayName stats      position
#>   <chr>   <chr>                <int> <chr>        <list>     <chr>   
#> 1 17      las-vegas-aces        2018 2018         <chr [15]> C       
#> 2 17      las-vegas-aces        2019 2019         <chr [15]> C       
#> 3 17      las-vegas-aces        2020 2020         <chr [15]> C       
#> 4 17      las-vegas-aces        2021 2021         <chr [15]> C       
#> 5 17      las-vegas-aces        2022 2022         <chr [15]> C       
#> 6 17      las-vegas-aces        2023 2023         <chr [15]> C       
#> 7 17      las-vegas-aces        2024 2024         <chr [15]> C       
#> 8 17      las-vegas-aces        2025 2025         <chr [15]> C       
#> 9 17      las-vegas-aces        2026 2026         <chr [15]> C       
#> 
#> $`Regular Season Misc Totals`
#> ── ESPN WNBA Athlete Stats from ESPN.com ─────────────────────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-05-17 15:18:59 UTC
#> # A tibble: 9 × 5
#>   team_id team_slug      season$year $displayName stats      position
#>   <chr>   <chr>                <int> <chr>        <list>     <chr>   
#> 1 17      las-vegas-aces        2018 2018         <chr [10]> C       
#> 2 17      las-vegas-aces        2019 2019         <chr [10]> C       
#> 3 17      las-vegas-aces        2020 2020         <chr [10]> C       
#> 4 17      las-vegas-aces        2021 2021         <chr [10]> C       
#> 5 17      las-vegas-aces        2022 2022         <chr [10]> C       
#> 6 17      las-vegas-aces        2023 2023         <chr [10]> C       
#> 7 17      las-vegas-aces        2024 2024         <chr [10]> C       
#> 8 17      las-vegas-aces        2025 2025         <chr [10]> C       
#> 9 17      las-vegas-aces        2026 2026         <chr [10]> C       
#> 
#> $General
#> ── ESPN WNBA Athlete Stats from ESPN.com ─────────────────────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-05-17 15:18:59 UTC
#> # A tibble: 0 × 0
#> 
#> $Offensive
#> ── ESPN WNBA Athlete Stats from ESPN.com ─────────────────────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-05-17 15:18:59 UTC
#> # A tibble: 0 × 0
#> 
#> $Defensive
#> ── ESPN WNBA Athlete Stats from ESPN.com ─────────────────────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-05-17 15:18:59 UTC
#> # A tibble: 0 × 0
#> 
#> $Rebounding
#> ── ESPN WNBA Athlete Stats from ESPN.com ─────────────────────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-05-17 15:18:59 UTC
#> # A tibble: 0 × 0
#> 
#> $Shooting
#> ── ESPN WNBA Athlete Stats from ESPN.com ─────────────────────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-05-17 15:18:59 UTC
#> # A tibble: 0 × 0
#> 
#> $Misc
#> ── ESPN WNBA Athlete Stats from ESPN.com ─────────────────────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-05-17 15:18:59 UTC
#> # A tibble: 0 × 0
#> 
# }
```
