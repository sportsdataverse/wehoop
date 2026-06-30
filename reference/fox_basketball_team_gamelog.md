# **Get Fox Sports basketball team game log**

**Get Fox Sports (Bifrost) WNBA / women's college basketball (WBB) team
game log.** `fox_wnba_team_gamelog()` hits the `wnba` slug;
`fox_wbb_team_gamelog()` hits the `wcbk` slug.

## Usage

``` r
fox_wnba_team_gamelog(team_id)

fox_wbb_team_gamelog(team_id)
```

## Arguments

- team_id:

  Fox Bifrost team id.

## Value

A `wehoop_data` tibble (long): `team_id`, `season_type`, `category`,
`game_id`, `game_date`, `opponent`, `stat`, `value`.

## See also

Other Fox Sports Functions:
[`fox_basketball_boxscore`](https://wehoop.sportsdataverse.org/reference/fox_basketball_boxscore.md),
[`fox_basketball_league_leaders`](https://wehoop.sportsdataverse.org/reference/fox_basketball_league_leaders.md),
[`fox_basketball_odds`](https://wehoop.sportsdataverse.org/reference/fox_basketball_odds.md),
[`fox_basketball_pbp`](https://wehoop.sportsdataverse.org/reference/fox_basketball_pbp.md),
[`fox_basketball_standings`](https://wehoop.sportsdataverse.org/reference/fox_basketball_standings.md),
[`fox_basketball_team_roster`](https://wehoop.sportsdataverse.org/reference/fox_basketball_team_roster.md),
[`fox_basketball_team_stats`](https://wehoop.sportsdataverse.org/reference/fox_basketball_team_stats.md),
[`fox_basketball_teams`](https://wehoop.sportsdataverse.org/reference/fox_basketball_teams.md),
[`fox_wbb_teams_all()`](https://wehoop.sportsdataverse.org/reference/fox_wbb_teams_all.md)

## Examples

``` r
# \donttest{
  try(fox_wnba_team_gamelog("1"))
#> ── Fox Sports WNBA gamelog ───────────────────────────────────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-06-30 19:33:35 UTC
#> # A tibble: 165 × 8
#>    team_id season_type    category game_id game_date opponent stat         value
#>    <chr>   <chr>          <chr>    <chr>   <chr>     <chr>    <chr>        <chr>
#>  1 1       REGULAR SEASON scoring  2403    6/27      @SEA     fgm          30   
#>  2 1       REGULAR SEASON scoring  2403    6/27      @SEA     fga          70   
#>  3 1       REGULAR SEASON scoring  2403    6/27      @SEA     fg_percent   42.9 
#>  4 1       REGULAR SEASON scoring  2403    6/27      @SEA     ftm          23   
#>  5 1       REGULAR SEASON scoring  2403    6/27      @SEA     fta          26   
#>  6 1       REGULAR SEASON scoring  2403    6/27      @SEA     ft_percent   88.0 
#>  7 1       REGULAR SEASON scoring  2403    6/27      @SEA     x3fgm        7    
#>  8 1       REGULAR SEASON scoring  2403    6/27      @SEA     x3fga        29   
#>  9 1       REGULAR SEASON scoring  2403    6/27      @SEA     x3fg_percent 24.1 
#> 10 1       REGULAR SEASON scoring  2403    6/27      @SEA     pts          90   
#> # ℹ 155 more rows
# }
# \donttest{
  try(fox_wbb_team_gamelog("11"))
#> ── Fox Sports WCBK gamelog ───────────────────────────────────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-06-30 19:33:36 UTC
#> # A tibble: 110 × 8
#>    team_id season_type category game_id game_date opponent stat         value
#>    <chr>   <chr>       <chr>    <chr>   <chr>     <chr>    <chr>        <chr>
#>  1 11      POSTSEASON  scoring  389046  4/3       SCAR     fgm          19   
#>  2 11      POSTSEASON  scoring  389046  4/3       SCAR     fga          61   
#>  3 11      POSTSEASON  scoring  389046  4/3       SCAR     fg_percent   31.1 
#>  4 11      POSTSEASON  scoring  389046  4/3       SCAR     ftm          4    
#>  5 11      POSTSEASON  scoring  389046  4/3       SCAR     fta          6    
#>  6 11      POSTSEASON  scoring  389046  4/3       SCAR     ft_percent   66.7 
#>  7 11      POSTSEASON  scoring  389046  4/3       SCAR     x3fgm        6    
#>  8 11      POSTSEASON  scoring  389046  4/3       SCAR     x3fga        21   
#>  9 11      POSTSEASON  scoring  389046  4/3       SCAR     x3fg_percent 28.6 
#> 10 11      POSTSEASON  scoring  389046  4/3       SCAR     pts          48   
#> # ℹ 100 more rows
# }
```
