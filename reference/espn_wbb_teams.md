# Get ESPN women's college basketball team names and ids

Get ESPN women's college basketball team names and ids

## Usage

``` r
espn_wbb_teams(year = most_recent_wbb_season())
```

## Arguments

- year:

  Either numeric or character (YYYY)

## Value

Returns a teams infomation data frame

|                       |           |
|-----------------------|-----------|
| col_name              | types     |
| team_id               | integer   |
| abbreviation          | character |
| display_name          | character |
| short_name            | character |
| mascot                | character |
| nickname              | character |
| team                  | character |
| color                 | character |
| alternate_color       | character |
| logo                  | character |
| logo_dark             | character |
| href                  | character |
| conference_url        | character |
| group_id              | integer   |
| conference_short_name | character |
| conference_uid        | character |
| conference_name       | character |
| conference_logo       | character |
| parent_group_id       | integer   |
| conference_id         | integer   |

## See also

Other ESPN WBB Functions:
[`espn_wbb_conferences()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_conferences.md),
[`espn_wbb_game_all()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_game_all.md),
[`espn_wbb_game_rosters()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_game_rosters.md),
[`espn_wbb_pbp()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_pbp.md),
[`espn_wbb_player_box()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_player_box.md),
[`espn_wbb_player_stats()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_player_stats.md),
[`espn_wbb_rankings()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_rankings.md),
[`espn_wbb_scoreboard()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_scoreboard.md),
[`espn_wbb_standings()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_standings.md),
[`espn_wbb_team_box()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_team_box.md),
[`espn_wbb_team_stats()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_team_stats.md)

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  try(espn_wbb_teams())
#> ── ESPN WBB Teams Information from ESPN.com ──────────────────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-04-14 04:27:24 UTC
#> # A tibble: 361 × 32
#>    team_id abbreviation display_name      short_name mascot nickname team  color
#>      <int> <chr>        <chr>             <chr>      <chr>  <chr>    <chr> <chr>
#>  1    2000 ACU          Abilene Christia… Abilene C… Wildc… Abilene… Abil… 592d…
#>  2    2005 AF           Air Force Falcons Air Force  Falco… Air For… Air … 0035…
#>  3    2006 AKR          Akron Zips        Akron      Zips   Akron    Akron 041e…
#>  4    2010 AAMU         Alabama A&M Bull… Alabama A… Bulld… Alabama… Alab… 7900…
#>  5     333 ALA          Alabama Crimson … Alabama    Crims… Alabama  Alab… 9e1b…
#>  6    2011 ALST         Alabama State La… Alabama St Lady … Alabama… Alab… e9a9…
#>  7    2016 ALCN         Alcorn State Lad… Alcorn St  Lady … Alcorn … Alco… 4b00…
#>  8      44 AMER         American Univers… American   Eagles American Amer… c411…
#>  9    2026 APP          App State Mounta… App State  Mount… App Sta… App … 0000…
#> 10       9 ASU          Arizona State Su… Arizona St Sun D… Arizona… Ariz… ffc6…
#> # ℹ 351 more rows
#> # ℹ 24 more variables: alternate_color <chr>, logo <chr>, logo_dark <chr>,
#> #   logos_href_3 <chr>, logos_href_4 <chr>, logos_href_5 <chr>,
#> #   logos_href_6 <chr>, logos_href_7 <chr>, logos_href_8 <chr>,
#> #   logos_href_9 <chr>, logos_href_10 <chr>, logos_href_11 <chr>,
#> #   logos_href_12 <chr>, logos_href_13 <chr>, logos_href_14 <chr>, href <chr>,
#> #   conference_url <chr>, group_id <int>, conference_uid <chr>, …
# }
```
