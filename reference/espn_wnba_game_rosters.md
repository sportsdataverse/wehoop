# **Get ESPN WNBA game rosters**

**Get ESPN WNBA game rosters**

## Usage

``` r
espn_wnba_game_rosters(game_id)
```

## Arguments

- game_id:

  Game ID

## Value

A game rosters data frame

|                         |           |
|-------------------------|-----------|
| col_name                | types     |
| athlete_id              | integer   |
| athlete_uid             | character |
| athlete_guid            | character |
| athlete_type            | character |
| sdr                     | integer   |
| first_name              | character |
| last_name               | character |
| full_name               | character |
| athlete_display_name    | character |
| short_name              | character |
| weight                  | numeric   |
| display_weight          | character |
| height                  | numeric   |
| display_height          | character |
| age                     | integer   |
| date_of_birth           | character |
| slug                    | character |
| headshot_href           | character |
| headshot_alt            | character |
| jersey                  | character |
| position_id             | integer   |
| position_name           | character |
| position_display_name   | character |
| position_abbreviation   | character |
| position_leaf           | logical   |
| linked                  | logical   |
| years                   | integer   |
| active                  | logical   |
| status_id               | integer   |
| status_name             | character |
| status_type             | character |
| status_abbreviation     | character |
| birth_place_city        | character |
| birth_place_state       | character |
| birth_place_country     | character |
| starter                 | logical   |
| valid                   | logical   |
| did_not_play            | logical   |
| display_name            | character |
| reason                  | character |
| ejected                 | logical   |
| team_id                 | integer   |
| team_guid               | character |
| team_uid                | character |
| team_sdr                | integer   |
| team_slug               | character |
| team_location           | character |
| team_name               | character |
| team_abbreviation       | character |
| team_display_name       | character |
| team_short_display_name | character |
| team_color              | character |
| team_alternate_color    | character |
| team_is_active          | logical   |
| is_all_star             | logical   |
| logo_href               | character |
| logo_dark_href          | character |
| logos_href_2            | character |
| logos_href_3            | character |
| game_id                 | integer   |
| order                   | integer   |
| home_away               | character |
| winner                  | logical   |
| draft_display_text      | character |
| draft_round             | integer   |
| draft_year              | integer   |
| draft_selection         | integer   |
| hand_type               | character |
| hand_abbreviation       | character |
| hand_display_value      | character |
| citizenship             | character |

## See also

Other ESPN WNBA Functions:
[`espn_wnba_game_all()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_all.md),
[`espn_wnba_pbp()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_pbp.md),
[`espn_wnba_player_box()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_player_box.md),
[`espn_wnba_player_stats()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_player_stats.md),
[`espn_wnba_scoreboard()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_scoreboard.md),
[`espn_wnba_standings()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_standings.md),
[`espn_wnba_team_box()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team_box.md),
[`espn_wnba_team_stats()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team_stats.md),
[`espn_wnba_teams()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_teams.md)

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  try(espn_wnba_game_rosters(game_id = 401244185))
#> ── ESPN WNBA Game Roster Information from ESPN.com ───────────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-05-01 03:09:08 UTC
#> # A tibble: 24 × 156
#>    athlete_id athlete_uid  athlete_guid athlete_type    sdr first_name last_name
#>         <int> <chr>        <chr>        <chr>         <int> <chr>      <chr>    
#>  1        924 s:40~l:59~a… 09609790-79… basketball   2.24e6 Alysha     Clark    
#>  2    2998928 s:40~l:59~a… 4d83d500-2f… basketball   3.00e6 Breanna    Stewart  
#>  3         91 s:40~l:59~a… e28a886c-1b… basketball   2.09e6 Sue        Bird     
#>  4    2987869 s:40~l:59~a… 6268520f-7d… basketball   2.99e6 Jewell     Loyd     
#>  5        805 s:40~l:59~a… 54d95e90-71… basketball   2.17e6 Crystal    Langhorne
#>  6    2998929 s:40~l:59~a… 2d61e8fa-19… basketball   3.00e6 Morgan     Tuck     
#>  7    4420318 s:40~l:59~a… 1a2b36a5-ad… basketball   4.42e6 Ezi        Magbegor 
#>  8    3056672 s:40~l:59~a… fc7acd4e-21… basketball   3.06e6 Mercedes   Russell  
#>  9        882 s:40~l:59~a… 0230e8a4-7b… basketball   2.28e6 Epiphanny  Prince   
#> 10    3142250 s:40~l:59~a… 6e517eae-e6… basketball   3.14e6 Jordin     Canada   
#> # ℹ 14 more rows
#> # ℹ 149 more variables: full_name <chr>, athlete_display_name <chr>,
#> #   short_name <chr>, weight <dbl>, display_weight <chr>, height <dbl>,
#> #   display_height <chr>, age <int>, date_of_birth <chr>, slug <chr>,
#> #   headshot_href <chr>, headshot_alt <chr>, jersey_x <chr>, position_id <int>,
#> #   position_name <chr>, position_display_name <chr>,
#> #   position_abbreviation <chr>, position_leaf <lgl>, linked <lgl>, …
# }
```
