# **Load team conference membership by season (WBB / WNBA) from the data repo**

Loads one row per team per season with the team's subdivision,
conference, and division that season, taken from the most reliable
per-season source and cross-checked against a second source where one
exists. Membership is never back-filled from today's alignment.
`load_wbb_team_group_seasons()` reads the `wbb_groups` release tag and
`load_wnba_team_group_seasons()` the `wnba_groups` tag.

## Usage

``` r
load_wbb_team_group_seasons(
  seasons = most_recent_wbb_season(),
  ...,
  dbConnection = NULL,
  tablename = NULL
)

load_wnba_team_group_seasons(
  seasons = most_recent_wnba_season(),
  ...,
  dbConnection = NULL,
  tablename = NULL
)
```

## Arguments

- seasons:

  A vector of 4-digit seasons: season-ending years for WBB (2025 =
  2024-25), calendar years for the WNBA. Published coverage runs from
  2002 (WBB) or 1997 (WNBA) through the most recent season. Pass
  `seasons = TRUE` to read every published season from one file. (Min:
  2002 for WBB, 1997 for WNBA)

- ...:

  Additional arguments passed to an underlying function that writes the
  data into a database.

- dbConnection:

  A `DBIConnection` object, as returned by
  [`DBI::dbConnect()`](https://dbi.r-dbi.org/reference/dbConnect.html)

- tablename:

  The name of the data table within the database

## Value

Returns a `wehoop_data` tibble with one row per team-season.

|  |  |  |
|----|----|----|
| col_name | types | description |
| league | character | League key: `wbb` or `wnba`. |
| season | integer | Season (WBB: ending year, 2025 = 2024-25; WNBA: calendar year). |
| team_id | character | ESPN team id. |
| team_id_source | character | Id system of `team_id`: `espn`. |
| team_name | character | Team name as of that season. |
| subdivision_id | character | SDV group id of the subdivision (`wbb:d1`); `NA` for the WNBA. |
| conference_id | character | SDV group id of the conference. |
| division_id | character | SDV group id of the division; `NA` where the league or conference had none. |
| source | character | Source the membership came from: `espn_standings`, `espn_core_groups`, `ncaa` or `curated` (WBB); `wnba_stats` or `curated` (WNBA). |
| sources_agree | logical | Whether a second source agrees; `NA` when only one source covers the season. |
| notes | character | Membership caveats. |

## See also

Other Conference and Division Group loader functions:
[`load_wbb_group_aliases()`](https://wehoop.sportsdataverse.org/reference/load_wbb_group_aliases.md),
[`load_wbb_group_seasons()`](https://wehoop.sportsdataverse.org/reference/load_wbb_group_seasons.md),
[`load_wbb_groups()`](https://wehoop.sportsdataverse.org/reference/load_wbb_groups.md)

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  try(load_wbb_team_group_seasons(seasons = most_recent_wbb_season()))
#> ─────────────────────────────────────────────────────────── wehoop 3.0.0.9000 ──
#> # A tibble: 363 × 11
#>    league season team_id team_id_source team_name   subdivision_id conference_id
#>    <chr>   <int> <chr>   <chr>          <chr>       <chr>          <chr>        
#>  1 wbb      2027 103     espn           Boston Col… wbb:d1         wbb:acc      
#>  2 wbb      2027 104     espn           Boston Uni… wbb:d1         wbb:patriot  
#>  3 wbb      2027 107     espn           Holy Cross… wbb:d1         wbb:patriot  
#>  4 wbb      2027 108     espn           Harvard Cr… wbb:d1         wbb:ivy      
#>  5 wbb      2027 111     espn           Northeaste… wbb:d1         wbb:caa      
#>  6 wbb      2027 112358  espn           Long Islan… wbb:d1         wbb:nec      
#>  7 wbb      2027 113     espn           Massachuse… wbb:d1         wbb:mac      
#>  8 wbb      2027 116     espn           Mount St. … wbb:d1         wbb:maac     
#>  9 wbb      2027 119     espn           Towson Tig… wbb:d1         wbb:caa      
#> 10 wbb      2027 12      espn           Arizona Wi… wbb:d1         wbb:big-12   
#> # ℹ 353 more rows
#> # ℹ 4 more variables: division_id <chr>, source <chr>, sources_agree <lgl>,
#> #   notes <chr>
# }
# \donttest{
  try(load_wnba_team_group_seasons(seasons = most_recent_wnba_season()))
#> ─────────────────────────────────────────────────────────── wehoop 3.0.0.9000 ──
#> # A tibble: 15 × 11
#>    league season team_id team_id_source team_name   subdivision_id conference_id
#>    <chr>   <int> <chr>   <chr>          <chr>       <chr>          <chr>        
#>  1 wnba     2026 11      espn           Phoenix Me… NA             wnba:west    
#>  2 wnba     2026 129689  espn           Golden Sta… NA             wnba:west    
#>  3 wnba     2026 131935  espn           Toronto Te… NA             wnba:east    
#>  4 wnba     2026 132052  espn           Portland F… NA             wnba:west    
#>  5 wnba     2026 14      espn           Seattle St… NA             wnba:west    
#>  6 wnba     2026 16      espn           Washington… NA             wnba:east    
#>  7 wnba     2026 17      espn           Las Vegas … NA             wnba:west    
#>  8 wnba     2026 18      espn           Connecticu… NA             wnba:east    
#>  9 wnba     2026 19      espn           Chicago Sky NA             wnba:east    
#> 10 wnba     2026 20      espn           Atlanta Dr… NA             wnba:east    
#> 11 wnba     2026 3       espn           Dallas Win… NA             wnba:west    
#> 12 wnba     2026 5       espn           Indiana Fe… NA             wnba:east    
#> 13 wnba     2026 6       espn           Los Angele… NA             wnba:west    
#> 14 wnba     2026 8       espn           Minnesota … NA             wnba:west    
#> 15 wnba     2026 9       espn           New York L… NA             wnba:east    
#> # ℹ 4 more variables: division_id <chr>, source <chr>, sources_agree <lgl>,
#> #   notes <chr>
# }
```
