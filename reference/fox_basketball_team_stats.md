# **Get Fox Sports basketball team stat leaders**

**Get Fox Sports (Bifrost) WNBA / women's college basketball (WBB) team
stat leaders.** `fox_wnba_team_stats()` hits the `wnba` slug;
`fox_wbb_team_stats()` hits the `wcbk` slug.

## Usage

``` r
fox_wnba_team_stats(team_id)

fox_wbb_team_stats(team_id)
```

## Arguments

- team_id:

  Fox Bifrost team id.

## Value

A `wehoop_data` tibble: `team_id`, `category`, `stat`,
`stat_abbreviation`, `player`, `value`.

## See also

Other Fox Sports Functions:
[`fox_basketball_boxscore`](https://wehoop.sportsdataverse.org/reference/fox_basketball_boxscore.md),
[`fox_basketball_league_leaders`](https://wehoop.sportsdataverse.org/reference/fox_basketball_league_leaders.md),
[`fox_basketball_odds`](https://wehoop.sportsdataverse.org/reference/fox_basketball_odds.md),
[`fox_basketball_pbp`](https://wehoop.sportsdataverse.org/reference/fox_basketball_pbp.md),
[`fox_basketball_standings`](https://wehoop.sportsdataverse.org/reference/fox_basketball_standings.md),
[`fox_basketball_team_gamelog`](https://wehoop.sportsdataverse.org/reference/fox_basketball_team_gamelog.md),
[`fox_basketball_team_roster`](https://wehoop.sportsdataverse.org/reference/fox_basketball_team_roster.md),
[`fox_basketball_teams`](https://wehoop.sportsdataverse.org/reference/fox_basketball_teams.md),
[`fox_wbb_teams_all()`](https://wehoop.sportsdataverse.org/reference/fox_wbb_teams_all.md)

## Examples

``` r
# \donttest{
  try(fox_wnba_team_stats("1"))
#> ── Fox Sports WNBA team_stats ────────────────────────────────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-06-12 14:53:04 UTC
#> # A tibble: 17 × 6
#>    team_id category     stat       stat_abbreviation player        value
#>    <chr>   <chr>        <chr>      <chr>             <chr>         <chr>
#>  1 1       PLAYER STATS SCORING    PPG               Allisha Gray  19.1 
#>  2 1       PLAYER STATS REBOUNDING RPG               Angel Reese   11.9 
#>  3 1       PLAYER STATS SHOOTING   FG%               Madina Okot   56.1 
#>  4 1       PLAYER STATS ASSISTS    APG               Jordin Canada 6.7  
#>  5 1       PLAYER STATS DEFENSE    STL               Rhyne Howard  35   
#>  6 1       PLAYER STATS DEFENSE    BLK               Angel Reese   11   
#>  7 1       PLAYER STATS MISC       DBL DBL           Angel Reese   8    
#>  8 1       PLAYER STATS ADVANCED   OFF RTG           Rhyne Howard  121.6
#>  9 1       PLAYER STATS ADVANCED   MPG               Rhyne Howard  34.6 
#> 10 1       TEAM STATS   SCORING    PPG               NA            85.8 
#> 11 1       TEAM STATS   REBOUNDING RPG               NA            35.9 
#> 12 1       TEAM STATS   SHOOTING   FG%               NA            43.4 
#> 13 1       TEAM STATS   ASSISTS    APG               NA            19.7 
#> 14 1       TEAM STATS   DEFENSE    STL               NA            114  
#> 15 1       TEAM STATS   DEFENSE    BLK               NA            34   
#> 16 1       TEAM STATS   MISC       DBL DBL           NA            11   
#> 17 1       TEAM STATS   ADVANCED   NET RTG           NA            6.2  
# }
# \donttest{
  try(fox_wbb_team_stats("11"))
#> ── Fox Sports WCBK team_stats ────────────────────────────────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-06-12 14:53:05 UTC
#> # A tibble: 29 × 6
#>    team_id category     stat                      stat_abbreviation player value
#>    <chr>   <chr>        <chr>                     <chr>             <chr>  <chr>
#>  1 11      PLAYER STATS Points Per Game           PPG               Sarah… 18.5 
#>  2 11      PLAYER STATS Three Point Field Goals … 3FGM/G            Azzi … 3.1  
#>  3 11      PLAYER STATS Free Throws Made Per Game FTM/G             Sarah… 1.9  
#>  4 11      PLAYER STATS High Game Points          HIGH              Allie… 34   
#>  5 11      PLAYER STATS Rebounds Per Game         RPG               Sarah… 7.6  
#>  6 11      PLAYER STATS True Shooting Percentage  TS%               Gandy… 100.0
#>  7 11      PLAYER STATS Assists Per Game          APG               KK Ar… 4.8  
#>  8 11      PLAYER STATS Turnovers Per Game        TPG               Blanc… 2.0  
#>  9 11      PLAYER STATS Steals Per Game           SPG               Sarah… 3.4  
#> 10 11      PLAYER STATS Blocks Per Game           BPG               Sarah… 1.6  
#> # ℹ 19 more rows
# }
```
