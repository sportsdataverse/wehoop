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

[family_espn_wnba](https://wehoop.sportsdataverse.org/reference/family_espn_wnba.md)
lists every function in this family.

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  espn_wnba_team(team_id = "17", season = 2025)
#> $Info
#> ── ESPN WNBA Team Info from ESPN.com ─────────────────────────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-13 18:16:53 UTC
#> # A tibble: 1 × 12
#>   id    uid    slug  abbreviation display_name short_display_name name  location
#>   <chr> <chr>  <chr> <chr>        <chr>        <chr>              <chr> <chr>   
#> 1 17    s:40~… las-… LV           Las Vegas A… Aces               Aces  Las Veg…
#> # ℹ 4 more variables: color <chr>, alternate_color <chr>, logo <chr>,
#> #   logo_dark <chr>
#> 
#> $Record
#> ── ESPN WNBA Team Record from ESPN.com ───────────────────────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-13 18:16:53 UTC
#> # A tibble: 3 × 4
#>   description    stats         summary type 
#>   <chr>          <list>        <chr>   <chr>
#> 1 Overall Record <df [20 × 2]> 30-14   total
#> 2 Home Record    <df [5 × 2]>  17-5    home 
#> 3 Away Record    <df [5 × 2]>  13-9    road 
#> 
#> $NextEvent
#> data frame with 0 columns and 0 rows
#> 
#> $StandingSummary
#> ── ESPN WNBA Team Standing Summary from ESPN.com ─────────────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-13 18:16:53 UTC
#> # A tibble: 1 × 1
#>   standing_summary                  
#>   <chr>                             
#> 1 2nd in Western Conference Division
#> 
#> $Coaches
#> data frame with 0 columns and 0 rows
#> 
# }
# \donttest{
  espn_wnba_team_roster(team_id = "17", season = 2025)
#> ── ESPN WNBA Team Roster from ESPN.com player box scores ─────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-13 18:16:54 UTC
#> # A tibble: 15 × 15
#>    athlete_id full_name jersey position_abbrev position_name height weight age  
#>    <chr>      <chr>     <chr>  <chr>           <chr>         <chr>  <chr>  <chr>
#>  1 2529122    Chelsea … 12     G               Guard         NA     NA     NA   
#>  2 2529458    Cheyenne… 32     F               Forward       NA     NA     NA   
#>  3 2590093    Kiah Sto… 41     C               Center        NA     NA     NA   
#>  4 2591976    Crystal … 8      F               Forward       NA     NA     NA   
#>  5 2984741    Tiffany … 3      G               Guard         NA     NA     NA   
#>  6 2987869    Jewell L… 24     G               Guard         NA     NA     NA   
#>  7 3149391    A'ja Wil… 22     C               Center        NA     NA     NA   
#>  8 3934218    Megan Gu… 17     C               Center        NA     NA     NA   
#>  9 4065870    Jackie Y… 0      G               Guard         NA     NA     NA   
#> 10 4068161    Joyner H… 8      F               Forward       NA     NA     NA   
#> 11 4281190    Dana Eva… 11     G               Guard         NA     NA     NA   
#> 12 4398776    NaLyssa … 3      F               Forward       NA     NA     NA   
#> 13 4433309    Elizabet… 33     C               Center        NA     NA     NA   
#> 14 4433633    Kierstan… 1      F               Forward       NA     NA     NA   
#> 15 4597509    Aaliyah … 13     G               Guard         NA     NA     NA   
#> # ℹ 7 more variables: birth_date <chr>, birth_place <chr>, headshot <chr>,
#> #   link_web <chr>, status <chr>, team_id <chr>, season <int>
# }
# \donttest{
  espn_wnba_team_leaders(team_id = "17", season = 2025)
#> # A tibble: 0 × 0
# }
# \donttest{
  espn_wnba_team_season_profile(team_id = "17", season = 2025)
#> ── ESPN WNBA Team Season Profile from ESPN.com ───────────────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-13 18:16:54 UTC
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
