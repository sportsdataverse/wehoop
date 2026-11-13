# **Get ESPN WNBA Event Competitor Linescores (Per-Quarter)**

Returns the per-quarter scoring breakdown for one team in one NBA event.
One row per period (regulation quarters + any overtime periods).

Returns the per-team statistical leaders for one WNBA event in long
format: one row per (category x athlete rank). Categories typically
include points, rebounds, assists, and rating.

Returns the game-day roster index for one team in one WNBA event. Each
row carries the athlete id and the core-v2 `$ref` URL – use the ref to
dereference athlete-game splits or biographical data.

Returns full team-game statistics for one team in one WNBA event in long
format: one row per (category x stat). Covers offensive, defensive, and
general categories with both raw values and display strings.

Returns team records as of the given WNBA event: overall, home, away,
conference, and division breakdowns where available. One row per record
type.

Returns a one-row tibble with one team's final score for one WNBA event:
numeric `value`, display string, `winner` flag, and source metadata.
Quick-lookup wrapper – use `espn_wnba_game_team_linescores()` for
per-period detail.

## Usage

``` r
espn_wnba_game_team_linescores(event_id, team_id, ...)

espn_wnba_game_team_leaders(event_id, team_id, ...)

espn_wnba_game_team_roster(event_id, team_id, ...)

espn_wnba_game_team_statistics(event_id, team_id, ...)

espn_wnba_game_team_records(event_id, team_id, ...)

espn_wnba_game_team_score(event_id, team_id, ...)
```

## Arguments

- event_id:

  ESPN event identifier.

- team_id:

  ESPN team identifier.

- ...:

  Additional arguments; currently unused.

## Value

A tibble with one row per period.

A long tibble with one row per (category x rank).

A tibble with one row per active athlete.

A long tibble with one row per (category x stat).

A tibble with one row per record type.

A single-row tibble.

## See also

[family_espn_wnba](https://wehoop.sportsdataverse.org/reference/family_espn_wnba.md)
lists every function in this family.

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  espn_wnba_game_team_linescores(event_id = 401736171, team_id = 17)
#> ── ESPN WNBA Competitor Linescores ───────────────────────────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-13 11:56:47 UTC
#> # A tibble: 8 × 7
#>   league event_id  team_id period value display_value source      
#>   <chr>  <chr>     <chr>    <int> <dbl> <chr>         <chr>       
#> 1 wnba   401736171 17           1    17 17            1           
#> 2 wnba   401736171 17           1    17 17            Basic/Manual
#> 3 wnba   401736171 17           2    24 24            1           
#> 4 wnba   401736171 17           2    24 24            Basic/Manual
#> 5 wnba   401736171 17           3    24 24            1           
#> 6 wnba   401736171 17           3    24 24            Basic/Manual
#> 7 wnba   401736171 17           4    24 24            1           
#> 8 wnba   401736171 17           4    24 24            Basic/Manual
# }
# \donttest{
  espn_wnba_game_team_leaders(event_id = 401736171, team_id = 17)
#> ── ESPN WNBA Competitor Leaders ──────────────────────────────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-13 11:56:47 UTC
#> # A tibble: 28 × 11
#>    league event_id  team_id category_name category_display category_abbrev  rank
#>    <chr>  <chr>     <chr>   <chr>         <chr>            <chr>           <int>
#>  1 wnba   401736171 17      points        Points           Pts                 1
#>  2 wnba   401736171 17      points        Points           Pts                 2
#>  3 wnba   401736171 17      points        Points           Pts                 3
#>  4 wnba   401736171 17      points        Points           Pts                 4
#>  5 wnba   401736171 17      points        Points           Pts                 5
#>  6 wnba   401736171 17      points        Points           Pts                 6
#>  7 wnba   401736171 17      assists       Assists          Ast                 1
#>  8 wnba   401736171 17      assists       Assists          Ast                 2
#>  9 wnba   401736171 17      assists       Assists          Ast                 3
#> 10 wnba   401736171 17      assists       Assists          Ast                 4
#> # ℹ 18 more rows
#> # ℹ 4 more variables: athlete_id <chr>, display_value <chr>, value <dbl>,
#> #   athlete_ref <chr>
# }
# \donttest{
  espn_wnba_game_team_roster(event_id = 401736171, team_id = 17)
#> ── ESPN WNBA Competitor Roster ───────────────────────────────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-13 11:56:47 UTC
#> # A tibble: 11 × 12
#>    league event_id  team_id athlete_id ref    display_name jersey starter active
#>    <chr>  <chr>     <chr>   <chr>      <chr>  <chr>        <chr>  <lgl>   <lgl> 
#>  1 wnba   401736171 17      2590093    https… Stokes       41     TRUE    TRUE  
#>  2 wnba   401736171 17      3149391    https… Wilson       22     TRUE    FALSE 
#>  3 wnba   401736171 17      2529122    https… Gray         12     TRUE    TRUE  
#>  4 wnba   401736171 17      2987869    https… Loyd         24     TRUE    TRUE  
#>  5 wnba   401736171 17      4065870    https… Young        0      TRUE    TRUE  
#>  6 wnba   401736171 17      4433309    https… Kitley       33     FALSE   FALSE 
#>  7 wnba   401736171 17      2984741    https… Mitchell     3      FALSE   FALSE 
#>  8 wnba   401736171 17      4281190    https… Evans        11     FALSE   FALSE 
#>  9 wnba   401736171 17      4597509    https… Nye          13     FALSE   TRUE  
#> 10 wnba   401736171 17      4068161    https… Holmes       4      FALSE   FALSE 
#> 11 wnba   401736171 17      4433633    https… Bell         1      FALSE   FALSE 
#> # ℹ 3 more variables: did_not_play <lgl>, ejected <lgl>, reason <chr>
# }
# \donttest{
  espn_wnba_game_team_statistics(event_id = 401736171, team_id = 17)
#> ── ESPN WNBA Competitor Statistics ───────────────────────────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-13 11:56:47 UTC
#> # A tibble: 99 × 10
#>    league event_id  team_id category_name category_display stat_name stat_abbrev
#>    <chr>  <chr>     <chr>   <chr>         <chr>            <chr>     <chr>      
#>  1 wnba   401736171 17      defensive     Defensive        blocks    BLK        
#>  2 wnba   401736171 17      defensive     Defensive        defensiv… DR         
#>  3 wnba   401736171 17      defensive     Defensive        steals    STL        
#>  4 wnba   401736171 17      defensive     Defensive        turnover… Points Con…
#>  5 wnba   401736171 17      defensive     Defensive        avgDefen… DR         
#>  6 wnba   401736171 17      defensive     Defensive        avgBlocks BLK        
#>  7 wnba   401736171 17      defensive     Defensive        avgSteals STL        
#>  8 wnba   401736171 17      defensive     Defensive        avg48Def… DR         
#>  9 wnba   401736171 17      defensive     Defensive        avg48Blo… BLK        
#> 10 wnba   401736171 17      defensive     Defensive        avg48Ste… STL        
#> # ℹ 89 more rows
#> # ℹ 3 more variables: stat_display <chr>, value <dbl>, display_value <chr>
# }
# \donttest{
  espn_wnba_game_team_records(event_id = 401736171, team_id = 17)
#> ── ESPN WNBA Competitor Records ──────────────────────────────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-13 11:56:47 UTC
#> # A tibble: 3 × 11
#>   league event_id  team_id record_id name    abbreviation display_name       
#>   <chr>  <chr>     <chr>   <chr>     <chr>   <chr>        <chr>              
#> 1 wnba   401736171 17      900       overall Game         Record Year To Date
#> 2 wnba   401736171 17      33        Home    NA           Home               
#> 3 wnba   401736171 17      34        Road    NA           Road               
#> # ℹ 4 more variables: short_display_name <chr>, type <chr>, summary <chr>,
#> #   value <dbl>
# }
# \donttest{
  espn_wnba_game_team_score(event_id = 401736171, team_id = 17)
#> ── ESPN WNBA Event Competitor Score ──────────────────────────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-13 11:56:47 UTC
#> # A tibble: 1 × 8
#>   league event_id  team_id value display_value winner source_id
#>   <chr>  <chr>     <chr>   <dbl> <chr>         <lgl>  <chr>    
#> 1 wnba   401736171 17         89 89            FALSE  1        
#> # ℹ 1 more variable: source_description <chr>
# }
```
