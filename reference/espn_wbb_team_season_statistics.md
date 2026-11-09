# **Get ESPN WBB Team Season Statistics (Long Format with Rank)**

Returns the full team-season-type statistics sheet for one WBB team in
long format: one row per (category x stat). Each row carries the team's
league rank for that stat where ESPN provides it (`rank` +
`rank_display_value`). Complements W-L records (not directly wrapped for
WBB) with the full stat package.

## Usage

``` r
espn_wbb_team_season_statistics(
  team_id,
  season = most_recent_wbb_season(),
  season_type = 2L,
  ...
)
```

## Arguments

- team_id:

  ESPN team identifier.

- season:

  Season year (numeric). Defaults to the most recent WBB season.

- season_type:

  Integer season type: 1 = preseason, 2 = regular (default), 3 =
  postseason.

- ...:

  Additional arguments; currently unused.

## Value

A long tibble with one row per (category x stat).

## See also

[family_espn_wbb](https://wehoop.sportsdataverse.org/reference/family_espn_wbb.md)
lists every function in this family.

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  espn_wbb_team_season_statistics(team_id = 2509, season = 2024)
#> ── ESPN WOMENS-COLLEGE-BASKETBALL Team Season Statistics ─────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-09 11:37:01 UTC
#> # A tibble: 77 × 13
#>    league    season season_type team_id category_name category_display stat_name
#>    <chr>      <int>       <int> <chr>   <chr>         <chr>            <chr>    
#>  1 womens-c…   2024           2 2509    defensive     Defensive        blocks   
#>  2 womens-c…   2024           2 2509    defensive     Defensive        defensiv…
#>  3 womens-c…   2024           2 2509    defensive     Defensive        steals   
#>  4 womens-c…   2024           2 2509    defensive     Defensive        turnover…
#>  5 womens-c…   2024           2 2509    defensive     Defensive        avgDefen…
#>  6 womens-c…   2024           2 2509    defensive     Defensive        avgBlocks
#>  7 womens-c…   2024           2 2509    defensive     Defensive        avgSteals
#>  8 womens-c…   2024           2 2509    general       General          disquali…
#>  9 womens-c…   2024           2 2509    general       General          flagrant…
#> 10 womens-c…   2024           2 2509    general       General          fouls    
#> # ℹ 67 more rows
#> # ℹ 6 more variables: stat_abbrev <chr>, stat_display <chr>, value <dbl>,
#> #   display_value <chr>, rank <int>, rank_display_value <chr>
# }
```
