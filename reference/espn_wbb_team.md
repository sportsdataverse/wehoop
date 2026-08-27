# **Get ESPN Women's College Basketball Team Detail**

Era-correct team identity for a women's college basketball program in a
specific season, plus the available `$ref` URLs for deeper resources
(record, statistics, leaders, athletes/roster, coaches, college, etc.).
Backed by the core-v2 endpoint
`sports.core.api.espn.com/v2/sports/basketball/leagues/womens-college-basketball/seasons/{season}/teams/{team_id}`.

Historical depth goes back to **1982** at ESPN (NCAA-tournament-era
forward). Older seasons return fewer `$ref` keys; missing refs become
`NA`.

## Usage

``` r
espn_wbb_team(team_id, season = most_recent_wbb_season(), ...)

espn_wbb_team_roster(team_id, season = most_recent_wbb_season(), ...)

espn_wbb_team_leaders(team_id, season = most_recent_wbb_season(), ...)

espn_wbb_team_season_profile(team_id, season = most_recent_wbb_season(), ...)
```

## Arguments

- team_id:

  ESPN team identifier (character or numeric).

- season:

  Season year (numeric). Defaults to the most recent WBB season.

- ...:

  Additional arguments; currently unused.

## Value

A named list of data frames: `Info`, `Record`, `NextEvent`,
`StandingSummary`, `Coaches`.

**Info**

Columns as documented in the shared
[espn_basketball_team_info_schema](https://wehoop.sportsdataverse.org/reference/espn_basketball_team_info_schema.md)
table.

**Record**

|          |           |                         |
|----------|-----------|-------------------------|
| col_name | types     | description             |
| type     | character | Record type / category. |
| summary  | character | Summary.                |
| stats    | list      | Stats.                  |

**NextEvent**

Columns as documented in the shared
[espn_basketball_player_overview_next_game_schema](https://wehoop.sportsdataverse.org/reference/espn_basketball_player_overview_next_game_schema.md)
table.

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

A single tibble with one row per athlete.

Columns as documented in the shared
[espn_basketball_team_roster_schema](https://wehoop.sportsdataverse.org/reference/espn_basketball_team_roster_schema.md)
table.

A single long-format tibble (one row per category-rank-athlete).

Columns as documented in the shared
[espn_basketball_team_leaders_schema](https://wehoop.sportsdataverse.org/reference/espn_basketball_team_leaders_schema.md)
table.

A single-row tibble with team identity scalars and `_ref` URL columns.
Selected columns:

|  |  |  |
|----|----|----|
| col_name | types | description |
| id | character | ESPN team identifier. |
| guid | character | Stable cross-league team GUID. |
| uid | character | ESPN UID string. |
| slug | character | URL-safe identifier. |
| location | character | School/program location (e.g. "UConn"). |
| name | character | Team name (e.g. "Huskies"). |
| nickname | character | Common nickname (often same as location). |
| abbreviation | character | Short abbreviation (e.g. "CONN"). |
| display_name | character | Full display name. |
| short_display_name | character | Short display name. |
| color | character | Primary color (hex, no leading '#'). |
| alternate_color | character | Alternate color (hex, no leading '#'). |
| is_active | logical | Whether the team was active in this season. |
| season | integer | Season year. |
| logo | character | Primary logo URL. |
| logo_dark | character | Dark-mode logo URL. |
| record_ref | character | `$ref` to team record resource. |
| statistics_ref | character | `$ref` to team statistics resource. |
| athletes_ref | character | `$ref` to team roster resource (college-only). |
| college_ref | character | `$ref` to college (institution) resource. |
| coaches_ref | character | `$ref` to team coaches resource. |
| franchise_ref | character | `$ref` to franchise resource. |

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
[`espn_wbb_game_odds()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_game_broadcasts.md),
[`espn_wbb_game_official_detail()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_game_official_detail.md),
[`espn_wbb_game_play()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_game_play.md),
[`espn_wbb_game_play_personnel()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_game_play_personnel.md),
[`espn_wbb_game_player_box()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_game_player_box.md),
[`espn_wbb_game_probabilities()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_game_probabilities.md),
[`espn_wbb_game_propbets()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_game_propbets.md),
[`espn_wbb_game_team_linescores()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_game_team_leaders.md),
[`espn_wbb_game_team_roster_entry()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_game_team_roster_entry.md),
[`espn_wbb_injuries()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_injuries.md),
[`espn_wbb_leaders()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_leaders.md),
[`espn_wbb_news()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_news.md),
[`espn_wbb_player_awards()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_player_awards.md),
[`espn_wbb_player_career_stats()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_player_career_stats.md),
[`espn_wbb_player_eventlog_v2()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_player_eventlog_v2.md),
[`espn_wbb_player_info()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_player_info.md),
[`espn_wbb_player_overview()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_player_eventlog.md),
[`espn_wbb_player_seasons()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_player_seasons.md),
[`espn_wbb_player_stats()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_player_stats.md),
[`espn_wbb_position()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_position.md),
[`espn_wbb_positions()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_positions.md),
[`espn_wbb_powerindex()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_powerindex.md),
[`espn_wbb_rankings()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_rankings.md),
[`espn_wbb_scoreboard()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_scoreboard.md),
[`espn_wbb_season_awards()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_season_awards.md),
[`espn_wbb_season_group()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_season_group.md),
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
[`espn_wbb_team_injuries()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_team_injuries.md),
[`espn_wbb_team_news()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_team_news.md),
[`espn_wbb_team_record_detail()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_team_record_detail.md),
[`espn_wbb_team_schedule()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_team_schedule.md),
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
#> ℹ Data updated: 2026-08-27 11:02:01 UTC
#> # A tibble: 1 × 13
#>   id    uid    slug  abbreviation display_name short_display_name name  nickname
#>   <chr> <chr>  <chr> <chr>        <chr>        <chr>              <chr> <chr>   
#> 1 2509  s:40~… purd… PUR          Purdue Boil… Purdue             Boil… Purdue  
#> # ℹ 5 more variables: location <chr>, color <chr>, alternate_color <chr>,
#> #   logo <chr>, logo_dark <chr>
#> 
#> $Record
#> data frame with 0 columns and 0 rows
#> 
#> $NextEvent
#> ── ESPN WOMENS-COLLEGE-BASKETBALL Team Next Event from ESPN.com ────────────────
#> ℹ Data updated: 2026-08-27 11:02:01 UTC
#> # A tibble: 1 × 4
#>   id        date              name                                    short_name
#>   <chr>     <chr>             <chr>                                   <chr>     
#> 1 401913709 2026-11-19T16:00Z Purdue Boilermakers at Florida State S… PUR VS FSU
#> 
#> $StandingSummary
#> ── ESPN WOMENS-COLLEGE-BASKETBALL Team Standing Summary from ESPN.com ──────────
#> ℹ Data updated: 2026-08-27 11:02:01 UTC
#> # A tibble: 1 × 1
#>   standing_summary
#>   <chr>           
#> 1 14th in Big Ten 
#> 
#> $Coaches
#> data frame with 0 columns and 0 rows
#> 
# }
# \donttest{
  espn_wbb_team_roster(team_id = "2509", season = 2025)
#> ── ESPN WOMENS-COLLEGE-BASKETBALL Team Roster from ESPN.com ──── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-08-27 11:02:01 UTC
#> # A tibble: 13 × 15
#>    athlete_id full_name jersey position_abbrev position_name height weight age  
#>    <chr>      <chr>     <chr>  <chr>           <chr>         <chr>  <chr>  <chr>
#>  1 5311737    Carley B… 24     G               Guard         "5' 7… NA     NA   
#>  2 5106182    Tara Daye 44     G               Guard         "5' 1… NA     NA   
#>  3 5107710    Taylor F… 5      G               Guard         "5' 8… NA     NA   
#>  4 5311739    Avery Go… 55     F               Forward       "6' 7… NA     NA   
#>  5 5108895    Taylor H… 2      G               Guard         "5' 1… NA     NA   
#>  6 5311736    Hila Kar… 8      G               Guard         "5' 8… NA     NA   
#>  7 5175722    McKenna … 11     G               Guard         "6' 2… NA     NA   
#>  8 4433438    Madison … 33     G               Guard         "6' 1… NA     NA   
#>  9 5240041    Lana McC… 35     F               Forward       "6' 4… NA     NA   
#> 10 5240040    Kendall … 22     F               Forward       "6' 3… NA     NA   
#> 11 5239064    Kiki Smi… 23     G               Guard         "5' 7… NA     NA   
#> 12 5243531    Nya Smith 3      G               Guard         "5' 9… NA     NA   
#> 13 5178283    Saige St… 13     F               Forward       "6' 1… NA     NA   
#> # ℹ 7 more variables: birth_date <chr>, birth_place <chr>, headshot <chr>,
#> #   link_web <chr>, status <chr>, team_id <chr>, season <int>
# }
# \donttest{
  espn_wbb_team_leaders(team_id = "2509", season = 2025)
#> # A tibble: 0 × 0
# }
# \donttest{
  espn_wbb_team_season_profile(team_id = "2509", season = 2025)
#> ── ESPN WOMENS-COLLEGE-BASKETBALL Team Season Profile from ESPN.com ────────────
#> ℹ Data updated: 2026-08-27 11:02:01 UTC
#> # A tibble: 1 × 35
#>   id    guid       uid   slug  location name  nickname abbreviation display_name
#>   <chr> <chr>      <chr> <chr> <chr>    <chr> <chr>    <chr>        <chr>       
#> 1 2509  2fe4080d-… s:40… purd… Purdue   Boil… Purdue   PUR          Purdue Boil…
#> # ℹ 26 more variables: short_display_name <chr>, color <chr>,
#> #   alternate_color <chr>, is_active <lgl>, is_all_star <lgl>, season <int>,
#> #   logo <chr>, logo_dark <chr>, record_ref <chr>, venue_ref <chr>,
#> #   groups_ref <chr>, ranks_ref <chr>, statistics_ref <chr>, leaders_ref <chr>,
#> #   injuries_ref <chr>, notes_ref <chr>, against_the_spread_records_ref <chr>,
#> #   awards_ref <chr>, franchise_ref <chr>, depth_charts_ref <chr>,
#> #   events_ref <chr>, transactions_ref <chr>, coaches_ref <chr>, …
# }
```
