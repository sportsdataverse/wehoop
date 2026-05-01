# **Get ESPN women's college basketball game rosters**

**Get ESPN women's college basketball game rosters**

## Usage

``` r
espn_wbb_game_rosters(game_id)
```

## Arguments

- game_id:

  Game ID

## Value

A game rosters data frame

|                          |           |
|--------------------------|-----------|
| col_name                 | types     |
| athlete_id               | integer   |
| athlete_uid              | character |
| athlete_guid             | character |
| athlete_type             | character |
| sdr                      | integer   |
| first_name               | character |
| last_name                | character |
| full_name                | character |
| athlete_display_name     | character |
| short_name               | character |
| height                   | integer   |
| display_height           | character |
| birth_place_city         | character |
| birth_place_state        | character |
| birth_place_country      | character |
| slug                     | character |
| headshot_href            | character |
| headshot_alt             | character |
| jersey                   | character |
| position_id              | integer   |
| position_name            | character |
| position_display_name    | character |
| position_abbreviation    | character |
| position_leaf            | logical   |
| linked                   | logical   |
| experience_years         | integer   |
| experience_display_value | character |
| experience_abbreviation  | character |
| active                   | logical   |
| status_id                | integer   |
| status_name              | character |
| status_type              | character |
| status_abbreviation      | character |
| starter                  | logical   |
| valid                    | logical   |
| did_not_play             | logical   |
| display_name             | character |
| ejected                  | logical   |
| team_id                  | integer   |
| team_guid                | character |
| team_uid                 | character |
| team_sdr                 | integer   |
| team_slug                | character |
| team_location            | character |
| team_name                | character |
| team_nickname            | character |
| team_abbreviation        | character |
| team_display_name        | character |
| team_short_display_name  | character |
| team_color               | character |
| team_alternate_color     | character |
| is_active                | logical   |
| is_all_star              | logical   |
| logo_href                | character |
| logo_dark_href           | character |
| game_id                  | integer   |
| order                    | integer   |
| home_away                | character |
| winner                   | logical   |
| roster_href              | character |
| hand_type                | character |
| hand_abbreviation        | character |
| hand_display_value       | character |
| age                      | integer   |
| date_of_birth            | character |
| weight                   | integer   |
| display_weight           | character |

## See also

Other ESPN WBB Functions:
[`espn_wbb_conferences()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_conferences.md),
[`espn_wbb_game_all()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_game_all.md),
[`espn_wbb_pbp()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_pbp.md),
[`espn_wbb_player_box()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_player_box.md),
[`espn_wbb_player_stats()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_player_stats.md),
[`espn_wbb_rankings()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_rankings.md),
[`espn_wbb_scoreboard()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_scoreboard.md),
[`espn_wbb_standings()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_standings.md),
[`espn_wbb_team_box()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_team_box.md),
[`espn_wbb_team_stats()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_team_stats.md),
[`espn_wbb_teams()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_teams.md)

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  try(espn_wbb_game_rosters(game_id = 401276115))
#> ── ESPN WBB Game Roster Information from ESPN.com ────────────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-05-01 03:08:58 UTC
#> # A tibble: 25 × 147
#>    athlete_id athlete_uid  athlete_guid athlete_type    sdr first_name last_name
#>         <int> <chr>        <chr>        <chr>         <int> <chr>      <chr>    
#>  1    4398583 s:40~l:54~a… 16320b07-a4… basketball   4.40e6 Valencia   Myers    
#>  2    4432862 s:40~l:54~a… 498e8b07-52… basketball   4.43e6 Sammie     Puisis   
#>  3    4398582 s:40~l:54~a… e2777a53-fe… basketball   4.40e6 Kourtney   Weber    
#>  4    4280885 s:40~l:54~a… fcbbd7b4-9e… basketball   4.28e6 Bianca     Jackson  
#>  5    2984250 s:40~l:54~a… 30161e50-1d… basketball   2.98e6 Morgan     Jones    
#>  6    4281175 s:40~l:54~a… d6b318ef-76… basketball   4.28e6 Savannah   Wilkinson
#>  7    4433304 s:40~l:54~a… 246cb20d-9f… basketball   4.43e6 River      Baldwin  
#>  8    4281174 s:40~l:54~a… 9de48c0b-46… basketball   4.28e6 Sayawni    Lassiter 
#>  9    4068155 s:40~l:54~a… b021b84d-e0… basketball   4.07e6 Tiana      England  
#> 10    4398609 s:40~l:54~a… 3d615a46-f3… basketball   4.40e6 Erin       Howard   
#> # ℹ 15 more rows
#> # ℹ 140 more variables: full_name <chr>, athlete_display_name <chr>,
#> #   short_name <chr>, height <int>, display_height <chr>,
#> #   birth_place_city <chr>, birth_place_state <chr>, birth_place_country <chr>,
#> #   birth_country_alternate_id <chr>, birth_country_abbreviation <chr>,
#> #   slug <chr>, headshot_href <chr>, headshot_alt <chr>, jersey_x <chr>,
#> #   flag_href <chr>, flag_alt <chr>, flag_rel <chr>, position_id <int>, …
# }
```
