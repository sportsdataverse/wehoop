# Get women's college basketball conferences

Get women's college basketball conferences

## Usage

``` r
espn_wbb_conferences()
```

## Value

Returns a tibble

|                       |           |
|-----------------------|-----------|
| col_name              | types     |
| group_id              | integer   |
| conference_short_name | character |
| conference_uid        | character |
| conference_name       | character |
| conference_logo       | character |
| parent_group_id       | integer   |
| conference_id         | integer   |

## See also

Other ESPN WBB Functions:
[`espn_wbb_game_all()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_game_all.md),
[`espn_wbb_game_rosters()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_game_rosters.md),
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
  try(espn_wbb_conferences())
#> ── ESPN WBB Conferences Information from ESPN.com ────────────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-04-14 04:27:07 UTC
#> # A tibble: 31 × 7
#>    conference_uid group_id conference_name conference_short_name conference_logo
#>    <chr>             <int> <chr>           <chr>                 <chr>          
#>  1 s:40~l:54~g:3         3 Atlantic 10 Co… A-10                  https://a.espn…
#>  2 s:40~l:54~g:2         2 Atlantic Coast… ACC                   https://a.espn…
#>  3 s:40~l:54~g:1         1 America East C… Am. East              https://a.espn…
#>  4 s:40~l:54~g:62       62 American Confe… American              NA             
#>  5 s:40~l:54~g:46       46 ASUN Conference ASUN                  NA             
#>  6 s:40~l:54~g:8         8 Big 12 Confere… Big 12                https://a.espn…
#>  7 s:40~l:54~g:4         4 Big East Confe… Big East              https://a.espn…
#>  8 s:40~l:54~g:5         5 Big Sky Confer… Big Sky               https://a.espn…
#>  9 s:40~l:54~g:6         6 Big South Conf… Big South             https://a.espn…
#> 10 s:40~l:54~g:7         7 Big Ten Confer… Big Ten               https://a.espn…
#> # ℹ 21 more rows
#> # ℹ 2 more variables: parent_group_id <int>, conference_id <int>
# }
```
