# **Get ESPN WNBA Team Season Statistics (Long Format with Rank)**

Returns the full team-season-type statistics sheet for one WNBA team in
long format: one row per (category x stat). Each row carries the team's
league rank for that stat where ESPN provides it (`rank` +
`rank_display_value`). Complements
[`espn_wnba_team_record()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team_record.md)
(W-L only) with the full stat package.

## Usage

``` r
espn_wnba_team_season_statistics(
  team_id,
  season = most_recent_wnba_season(),
  season_type = 2L,
  ...
)
```

## Arguments

- team_id:

  ESPN team identifier.

- season:

  Season year (numeric). Defaults to the most recent WNBA season.

- season_type:

  Integer season type: 1 = preseason, 2 = regular (default), 3 =
  postseason.

- ...:

  Additional arguments; currently unused.

## Value

A long tibble with one row per (category x stat).

## See also

[family_espn_wnba](https://wehoop.sportsdataverse.org/reference/family_espn_wnba.md)
lists every function in this family.

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  espn_wnba_team_season_statistics(team_id = 17, season = 2024)
#> ── ESPN WNBA Team Season Statistics ──────────────────────────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-13 23:22:24 UTC
#> # A tibble: 98 × 13
#>    league season season_type team_id category_name category_display stat_name   
#>    <chr>   <int>       <int> <chr>   <chr>         <chr>            <chr>       
#>  1 wnba     2024           2 17      defensive     Defensive        blocks      
#>  2 wnba     2024           2 17      defensive     Defensive        defensiveRe…
#>  3 wnba     2024           2 17      defensive     Defensive        steals      
#>  4 wnba     2024           2 17      defensive     Defensive        avgDefensiv…
#>  5 wnba     2024           2 17      defensive     Defensive        avgBlocks   
#>  6 wnba     2024           2 17      defensive     Defensive        avgSteals   
#>  7 wnba     2024           2 17      defensive     Defensive        avg48Defens…
#>  8 wnba     2024           2 17      defensive     Defensive        avg48Blocks 
#>  9 wnba     2024           2 17      defensive     Defensive        avg48Steals 
#> 10 wnba     2024           2 17      general       General          disqualific…
#> # ℹ 88 more rows
#> # ℹ 6 more variables: stat_abbrev <chr>, stat_display <chr>, value <dbl>,
#> #   display_value <chr>, rank <int>, rank_display_value <chr>
# }
```
