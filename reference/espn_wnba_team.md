# **Get ESPN WNBA Team Detail**

Era-correct team identity for a WNBA franchise in a specific season,
plus the available `$ref` URLs for deeper resources (record, statistics,
leaders, coaches, transactions, etc.). Backed by the core-v2 endpoint
`sports.core.api.espn.com/v2/sports/basketball/leagues/wnba/seasons/{season}/teams/{team_id}`.

Historical depth goes back to **1997** (WNBA founding). Older seasons
return fewer `$ref` keys; missing refs become `NA`.

## Usage

``` r
espn_wnba_team(team_id, season = most_recent_wnba_season(), ...)

espn_wnba_team_roster(team_id, season = most_recent_wnba_season(), ...)

espn_wnba_team_leaders(team_id, season = most_recent_wnba_season(), ...)

espn_wnba_team_season_profile(team_id, season = most_recent_wnba_season(), ...)
```

## Arguments

- team_id:

  ESPN team identifier (character or numeric).

- season:

  Season year (numeric). Defaults to the most recent WNBA season.

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

|                    |           |                                             |
|--------------------|-----------|---------------------------------------------|
| col_name           | types     | description                                 |
| id                 | character | ESPN team identifier.                       |
| guid               | character | Stable cross-league team GUID.              |
| uid                | character | ESPN UID string.                            |
| slug               | character | URL-safe identifier.                        |
| location           | character | Team city/region (e.g. "Indiana").          |
| name               | character | Team name (e.g. "Fever").                   |
| abbreviation       | character | Short abbreviation (e.g. "IND").            |
| display_name       | character | Full display name.                          |
| short_display_name | character | Short display name.                         |
| color              | character | Primary color (hex, no leading '#').        |
| alternate_color    | character | Alternate color (hex, no leading '#').      |
| is_active          | logical   | Whether the team was active in this season. |
| season             | integer   | Season year.                                |
| logo               | character | Primary logo URL.                           |
| logo_dark          | character | Dark-mode logo URL.                         |
| record_ref         | character | `$ref` to team record resource.             |
| statistics_ref     | character | `$ref` to team statistics resource.         |
| leaders_ref        | character | `$ref` to team leaders resource.            |
| coaches_ref        | character | `$ref` to team coaches resource.            |
| transactions_ref   | character | `$ref` to team transactions resource.       |
| franchise_ref      | character | `$ref` to franchise resource.               |

## See also

Other ESPN WNBA Functions:
[`espn_wnba_athletes_index()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_athletes_index.md),
[`espn_wnba_award()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_award.md),
[`espn_wnba_calendar()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_calendar.md),
[`espn_wnba_coach_season()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_coach_season.md),
[`espn_wnba_coaches()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_coaches.md),
[`espn_wnba_conferences()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_conferences.md),
[`espn_wnba_draft()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_draft.md),
[`espn_wnba_draft_athlete_detail()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_draft_athlete_detail.md),
[`espn_wnba_draft_pick()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_draft_pick.md),
[`espn_wnba_draft_rounds()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_draft_athletes.md),
[`espn_wnba_franchise()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_franchise.md),
[`espn_wnba_franchises()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_franchises.md),
[`espn_wnba_freeagents()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_freeagents.md),
[`espn_wnba_futures()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_futures.md),
[`espn_wnba_game_all()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_all.md),
[`espn_wnba_game_odds()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_broadcasts.md),
[`espn_wnba_game_official_detail()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_official_detail.md),
[`espn_wnba_game_play()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_play.md),
[`espn_wnba_game_play_personnel()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_play_personnel.md),
[`espn_wnba_game_player_box()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_player_box.md),
[`espn_wnba_game_probabilities()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_probabilities.md),
[`espn_wnba_game_propbets()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_propbets.md),
[`espn_wnba_game_team_linescores()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_team_leaders.md),
[`espn_wnba_game_team_roster_entry()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_team_roster_entry.md),
[`espn_wnba_injuries()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_injuries.md),
[`espn_wnba_leaders()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_leaders.md),
[`espn_wnba_news()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_news.md),
[`espn_wnba_player_awards()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_player_awards.md),
[`espn_wnba_player_career_stats()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_player_career_stats.md),
[`espn_wnba_player_eventlog_v2()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_player_eventlog_v2.md),
[`espn_wnba_player_info()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_player_info.md),
[`espn_wnba_player_overview()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_player_eventlog.md),
[`espn_wnba_player_seasons()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_player_seasons.md),
[`espn_wnba_player_stats()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_player_stats.md),
[`espn_wnba_position()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_position.md),
[`espn_wnba_positions()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_positions.md),
[`espn_wnba_powerindex()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_powerindex.md),
[`espn_wnba_scoreboard()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_scoreboard.md),
[`espn_wnba_season_awards()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_season_awards.md),
[`espn_wnba_season_group()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_season_group.md),
[`espn_wnba_season_groups()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_season_groups.md),
[`espn_wnba_season_info()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_season_info.md),
[`espn_wnba_season_leaders()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_season_leaders.md),
[`espn_wnba_season_ranking()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_season_ranking.md),
[`espn_wnba_season_rankings()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_season_rankings.md),
[`espn_wnba_season_type()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_season_type.md),
[`espn_wnba_season_types()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_season_types.md),
[`espn_wnba_season_week()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_season_week.md),
[`espn_wnba_season_weeks()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_season_weeks.md),
[`espn_wnba_seasons()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_seasons.md),
[`espn_wnba_standings()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_standings.md),
[`espn_wnba_team_injuries()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team_injuries.md),
[`espn_wnba_team_news()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team_news.md),
[`espn_wnba_team_record()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team_record.md),
[`espn_wnba_team_record_detail()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team_record_detail.md),
[`espn_wnba_team_schedule()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team_schedule.md),
[`espn_wnba_team_season_roster()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team_season_roster.md),
[`espn_wnba_team_season_statistics()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team_season_statistics.md),
[`espn_wnba_team_stats()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team_stats.md),
[`espn_wnba_teams()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_teams.md),
[`espn_wnba_transactions()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_transactions.md),
[`espn_wnba_venues()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_venues.md),
[`espn_wnba_week_ranking()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_week_ranking.md),
[`espn_wnba_week_rankings()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_week_rankings.md)

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  espn_wnba_team(team_id = "17", season = 2025)
#> $Info
#> ── ESPN WNBA Team Info from ESPN.com ─────────────────────────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-08-26 19:55:45 UTC
#> # A tibble: 1 × 12
#>   id    uid    slug  abbreviation display_name short_display_name name  location
#>   <chr> <chr>  <chr> <chr>        <chr>        <chr>              <chr> <chr>   
#> 1 17    s:40~… las-… LV           Las Vegas A… Aces               Aces  Las Veg…
#> # ℹ 4 more variables: color <chr>, alternate_color <chr>, logo <chr>,
#> #   logo_dark <chr>
#> 
#> $Record
#> ── ESPN WNBA Team Record from ESPN.com ───────────────────────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-08-26 19:55:45 UTC
#> # A tibble: 3 × 4
#>   description    type  summary stats        
#>   <chr>          <chr> <chr>   <list>       
#> 1 Overall Record total 26-13   <df [21 × 2]>
#> 2 Home Record    home  12-7    <df [5 × 2]> 
#> 3 Away Record    road  14-6    <df [5 × 2]> 
#> 
#> $NextEvent
#> ── ESPN WNBA Team Next Event from ESPN.com ───────────────────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-08-26 19:55:45 UTC
#> # A tibble: 1 × 4
#>   id        date              name                            short_name
#>   <chr>     <chr>             <chr>                           <chr>     
#> 1 401857182 2026-08-29T02:00Z Toronto Tempo at Las Vegas Aces TOR @ LV  
#> 
#> $StandingSummary
#> ── ESPN WNBA Team Standing Summary from ESPN.com ─────────────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-08-26 19:55:45 UTC
#> # A tibble: 1 × 1
#>   standing_summary                  
#>   <chr>                             
#> 1 3rd in Western Conference Division
#> 
#> $Coaches
#> data frame with 0 columns and 0 rows
#> 
# }
# \donttest{
  espn_wnba_team_roster(team_id = "17", season = 2025)
#> ── ESPN WNBA Team Roster from ESPN.com ───────────────────────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-08-26 19:55:45 UTC
#> # A tibble: 13 × 15
#>    athlete_id full_name jersey position_abbrev position_name height weight age  
#>    <chr>      <chr>     <chr>  <chr>           <chr>         <chr>  <chr>  <chr>
#>  1 4433633    Kierstan… 1      F               Forward       "6' 1… 176 l… 26   
#>  2 4281190    Dana Eva… 11     G               Guard         "5' 6… 145 l… 28   
#>  3 2529122    Chelsea … 12     G               Guard         "5' 1… 170 l… 33   
#>  4 4609797    Ta'Niya … 5      G               Guard         "5' 8… NA     22   
#>  5 2987869    Jewell L… 24     G               Guard         "5' 1… 175 l… 32   
#>  6 2529458    Cheyenne… 32     F               Forward       "6' 4… 193 l… 34   
#>  7 4682855    Justine … 13     G               Guard         "6' 4… NA     22   
#>  8 4398776    NaLyssa … 3      F               Forward       "6' 4… 185 l… 26   
#>  9 3099736    Stephani… 7      F               Forward       "6' 2… 192 l… 32   
#> 10 3142086    Brianna … 21     F               Forward       "6' 3… 175 l… 30   
#> 11 3149391    A'ja Wil… 22     C               Center        "6' 4… 195 l… 30   
#> 12 5220104    Mai Yama… 18     G               Guard         "5' 5… 128 l… 26   
#> 13 4065870    Jackie Y… 0      G               Guard         "6' 0… 165 l… 28   
#> # ℹ 7 more variables: birth_date <chr>, birth_place <chr>, headshot <chr>,
#> #   link_web <chr>, status <chr>, team_id <chr>, season <int>
# }
# \donttest{
  espn_wnba_team_leaders(team_id = "17", season = 2025)
#> # A tibble: 0 × 0
# }
# \donttest{
  espn_wnba_team_season_profile(team_id = "17", season = 2025)
#> ── ESPN WNBA Team Season Profile from ESPN.com ───────────────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-08-26 19:55:46 UTC
#> # A tibble: 1 × 35
#>   id    guid       uid   slug  location name  nickname abbreviation display_name
#>   <chr> <chr>      <chr> <chr> <chr>    <chr> <lgl>    <chr>        <chr>       
#> 1 17    c97eb968-… s:40… las-… Las Veg… Aces  NA       LV           Las Vegas A…
#> # ℹ 26 more variables: short_display_name <chr>, color <chr>,
#> #   alternate_color <chr>, is_active <lgl>, is_all_star <lgl>, season <int>,
#> #   logo <chr>, logo_dark <chr>, record_ref <chr>, venue_ref <chr>,
#> #   groups_ref <chr>, ranks_ref <chr>, statistics_ref <chr>, leaders_ref <chr>,
#> #   injuries_ref <chr>, notes_ref <chr>, against_the_spread_records_ref <chr>,
#> #   awards_ref <chr>, franchise_ref <chr>, depth_charts_ref <chr>,
#> #   events_ref <chr>, transactions_ref <chr>, coaches_ref <chr>, …
# }
```
