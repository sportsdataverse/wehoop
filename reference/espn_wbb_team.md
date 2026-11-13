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
| id         | character | Unique play identification number |
| first_name | character | Player's first name.              |
| last_name  | character | Player's last name.               |
| experience | integer   | Years of professional experience. |

A single tibble with one row per athlete.

Columns as documented in the shared
[espn_basketball_team_roster_schema](https://wehoop.sportsdataverse.org/reference/espn_basketball_team_roster_schema.md)
table. ESPN's roster endpoint ignores the season, so a season before the
current one is built from that season's published player box scores
(name, jersey, position and headshot from the athlete's last game; bio
columns `NA`); when none can be read (not published, or offline) it
warns and returns zero rows with these columns.

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

[family_espn_wbb](https://wehoop.sportsdataverse.org/reference/family_espn_wbb.md)
lists every function in this family.

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  espn_wbb_team(team_id = "2509", season = 2025)
#> $Info
#> ── ESPN WOMENS-COLLEGE-BASKETBALL Team Info from ESPN.com ────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-13 13:57:16 UTC
#> # A tibble: 1 × 13
#>   id    uid    slug  abbreviation display_name short_display_name name  nickname
#>   <chr> <chr>  <chr> <chr>        <chr>        <chr>              <chr> <chr>   
#> 1 2509  s:40~… purd… PUR          Purdue Boil… Purdue             Boil… Purdue  
#> # ℹ 5 more variables: location <chr>, color <chr>, alternate_color <chr>,
#> #   logo <chr>, logo_dark <chr>
#> 
#> $Record
#> ── ESPN WOMENS-COLLEGE-BASKETBALL Team Record from ESPN.com ──── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-13 13:57:16 UTC
#> # A tibble: 1 × 4
#>   description    stats         summary type 
#>   <chr>          <list>        <chr>   <chr>
#> 1 Overall Record <df [30 × 2]> 10-19   total
#> 
#> $NextEvent
#> data frame with 0 columns and 0 rows
#> 
#> $StandingSummary
#> ── ESPN WOMENS-COLLEGE-BASKETBALL Team Standing Summary from ESPN.com ──────────
#> ℹ Data updated: 2026-11-13 13:57:16 UTC
#> # A tibble: 1 × 1
#>   standing_summary
#>   <chr>           
#> 1 15th in Big Ten 
#> 
#> $Coaches
#> data frame with 0 columns and 0 rows
#> 
# }
# \donttest{
  espn_wbb_team_roster(team_id = "2509", season = 2025)
#> ── ESPN WOMENS-COLLEGE-BASKETBALL Team Roster from ESPN.com player box scores ──
#> ℹ Data updated: 2026-11-13 13:57:18 UTC
#> # A tibble: 14 × 15
#>    athlete_id full_name jersey position_abbrev position_name height weight age  
#>    <chr>      <chr>     <chr>  <chr>           <chr>         <chr>  <chr>  <chr>
#>  1 4565530    Mila Rey… 15     F               Forward       NA     NA     NA   
#>  2 4595572    Mahri Pe… 7      G               Guard         NA     NA     NA   
#>  3 4597501    Destini … 4      G               Guard         NA     NA     NA   
#>  4 4899061    Jayla Sm… 3      G               Guard         NA     NA     NA   
#>  5 4899611    Reagan B… 34     F               Forward       NA     NA     NA   
#>  6 5107952    Alaina H… 32     F               Forward       NA     NA     NA   
#>  7 5175720    Amiyah R… 1      G               Guard         NA     NA     NA   
#>  8 5175721    Rashunda… 2      G               Guard         NA     NA     NA   
#>  9 5175722    McKenna … 11     G               Guard         NA     NA     NA   
#> 10 5175725    Sophie S… 31     G               Guard         NA     NA     NA   
#> 11 5240038    Jordyn P… 10     G               Guard         NA     NA     NA   
#> 12 5240039    Ella Col… 13     G               Guard         NA     NA     NA   
#> 13 5240040    Kendall … 22     F               Forward       NA     NA     NA   
#> 14 5240041    Lana McC… 35     F               Forward       NA     NA     NA   
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
#> ℹ Data updated: 2026-11-13 13:57:18 UTC
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
