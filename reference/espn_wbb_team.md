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
[`espn_wbb_game_broadcasts()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_game_broadcasts.md),
[`espn_wbb_game_odds()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_game_odds.md),
[`espn_wbb_game_official_detail()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_game_official_detail.md),
[`espn_wbb_game_officials()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_game_officials.md),
[`espn_wbb_game_play()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_game_play.md),
[`espn_wbb_game_play_personnel()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_game_play_personnel.md),
[`espn_wbb_game_player_box()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_game_player_box.md),
[`espn_wbb_game_powerindex()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_game_powerindex.md),
[`espn_wbb_game_predictor()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_game_predictor.md),
[`espn_wbb_game_probabilities()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_game_probabilities.md),
[`espn_wbb_game_propbets()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_game_propbets.md),
[`espn_wbb_game_rosters()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_game_rosters.md),
[`espn_wbb_game_situation()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_game_situation.md),
[`espn_wbb_game_team_leaders()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_game_team_leaders.md),
[`espn_wbb_game_team_linescores()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_game_team_linescores.md),
[`espn_wbb_game_team_records()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_game_team_records.md),
[`espn_wbb_game_team_roster()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_game_team_roster.md),
[`espn_wbb_game_team_roster_entry()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_game_team_roster_entry.md),
[`espn_wbb_game_team_score()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_game_team_score.md),
[`espn_wbb_game_team_statistics()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_game_team_statistics.md),
[`espn_wbb_injuries()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_injuries.md),
[`espn_wbb_leaders()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_leaders.md),
[`espn_wbb_news()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_news.md),
[`espn_wbb_pbp()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_pbp.md),
[`espn_wbb_player_awards()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_player_awards.md),
[`espn_wbb_player_box()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_player_box.md),
[`espn_wbb_player_career_stats()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_player_career_stats.md),
[`espn_wbb_player_eventlog()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_player_eventlog.md),
[`espn_wbb_player_eventlog_v2()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_player_eventlog_v2.md),
[`espn_wbb_player_gamelog()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_player_gamelog.md),
[`espn_wbb_player_info()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_player_info.md),
[`espn_wbb_player_overview()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_player_overview.md),
[`espn_wbb_player_seasons()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_player_seasons.md),
[`espn_wbb_player_splits()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_player_splits.md),
[`espn_wbb_player_statisticslog()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_player_statisticslog.md),
[`espn_wbb_player_stats()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_player_stats.md),
[`espn_wbb_player_stats_v3()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_player_stats_v3.md),
[`espn_wbb_position()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_position.md),
[`espn_wbb_positions()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_positions.md),
[`espn_wbb_powerindex()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_powerindex.md),
[`espn_wbb_rankings()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_rankings.md),
[`espn_wbb_scoreboard()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_scoreboard.md),
[`espn_wbb_season_awards()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_season_awards.md),
[`espn_wbb_season_group()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_season_group.md),
[`espn_wbb_season_group_children()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_season_group_children.md),
[`espn_wbb_season_group_teams()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_season_group_teams.md),
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
[`espn_wbb_team_box()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_team_box.md),
[`espn_wbb_team_injuries()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_team_injuries.md),
[`espn_wbb_team_leaders()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_team_leaders.md),
[`espn_wbb_team_news()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_team_news.md),
[`espn_wbb_team_record_detail()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_team_record_detail.md),
[`espn_wbb_team_roster()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_team_roster.md),
[`espn_wbb_team_schedule()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_team_schedule.md),
[`espn_wbb_team_season_profile()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_team_season_profile.md),
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
  espn_wbb_team(team_id = "2509", season = 2025)
#> $Info
#> ── ESPN WOMENS-COLLEGE-BASKETBALL Team Info from ESPN.com ────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-06-09 22:48:25 UTC
#> # A tibble: 1 × 13
#>   id    uid    slug  abbreviation display_name short_display_name name  nickname
#>   <chr> <chr>  <chr> <chr>        <chr>        <chr>              <chr> <chr>   
#> 1 2509  s:40~… purd… PUR          Purdue Boil… Purdue             Boil… Purdue  
#> # ℹ 5 more variables: location <chr>, color <chr>, alternate_color <chr>,
#> #   logo <chr>, logo_dark <chr>
#> 
#> $Record
#> ── ESPN WOMENS-COLLEGE-BASKETBALL Team Record from ESPN.com ──── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-06-09 22:48:25 UTC
#> # A tibble: 3 × 4
#>   description    type  summary stats        
#>   <chr>          <chr> <chr>   <list>       
#> 1 Overall Record total 13-17   <df [20 × 2]>
#> 2 Home Record    home  11-6    <df [20 × 2]>
#> 3 Away Record    road  2-10    <df [20 × 2]>
#> 
#> $NextEvent
#> ── ESPN WOMENS-COLLEGE-BASKETBALL Team Next Event from ESPN.com ────────────────
#> ℹ Data updated: 2026-06-09 22:48:25 UTC
#> # A tibble: 1 × 4
#>   id        date              name                                short_name
#>   <chr>     <chr>             <chr>                               <chr>     
#> 1 401851368 2026-03-05T01:30Z Purdue Boilermakers at Oregon Ducks PUR VS ORE
#> 
#> $StandingSummary
#> ── ESPN WOMENS-COLLEGE-BASKETBALL Team Standing Summary from ESPN.com ──────────
#> ℹ Data updated: 2026-06-09 22:48:26 UTC
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
