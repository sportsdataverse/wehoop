# **Get the full Fox Sports women's college basketball team directory**

**Enumerate every WBB team in the Fox Sports (Bifrost) directory.** A
single
[`fox_wbb_teams()`](https://wehoop.sportsdataverse.org/reference/fox_basketball_standings.md)
call only returns the seed team's conference, so this walks unseen team
ids (calling one seed per conference) and unions the results.

## Usage

``` r
fox_wbb_teams_all(max_id = 500, max_calls = 60)
```

## Arguments

- max_id:

  Highest Fox team id to probe as a seed (default `500`).

- max_calls:

  Safety cap on the number of standings calls (default `60`).

## Value

A `wehoop_data` tibble, one row per team: `fox_team_id`,
`fox_team_name`, `fox_section`.

## See also

Other Fox Sports Functions:
[`fox_basketball_league_leaders`](https://wehoop.sportsdataverse.org/reference/fox_basketball_league_leaders.md),
[`fox_wnba_pbp()`](https://wehoop.sportsdataverse.org/reference/fox_basketball_boxscore.md),
[`fox_wnba_team_roster()`](https://wehoop.sportsdataverse.org/reference/fox_basketball_standings.md)

## Examples

``` r
# \donttest{
  # max_calls = 5 probes five seed team ids (up to five conferences).
  try(fox_wbb_teams_all(max_calls = 5))
#> ✖ 2026-11-09 10:03:47.944736: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "3", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ── Fox Sports WBB full team directory ────────────────────────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-09 10:03:48 UTC
#> # A tibble: 49 × 3
#>    fox_team_id fox_team_name                    fox_section                 
#>    <chr>       <chr>                            <chr>                       
#>  1 223         Bryant Bulldogs                  America East                
#>  2 55          Njit Highlanders                 America East                
#>  3 1           University At Albany Great Danes America East                
#>  4 8           Umbc Retrievers                  America East                
#>  5 4           Maine Black Bears                America East                
#>  6 6           New Hampshire Wildcats           America East                
#>  7 5           Umass Lowell River Hawks         America East                
#>  8 9           Vermont Catamounts               America East                
#>  9 2           Binghamton Bearcats              America East                
#> 10 124         Charleston Cougars               Coastal Athletic Association
#> # ℹ 39 more rows
# }
```
