# **Get WNBA Stats API Franchise Leaders with Rank**

**Get WNBA Stats API Franchise Leaders with Rank**

**Get WNBA Stats API Franchise Leaders with Rank**

## Usage

``` r
wnba_franchiseleaderswrank(
  league_id = "10",
  per_mode = "Totals",
  season_type = "Regular Season",
  team_id = "1611661324",
  ...
)
```

## Arguments

- league_id:

  league_id

- per_mode:

  per_mode

- season_type:

  season_type

- team_id:

  team_id

- ...:

  Additional arguments passed to an underlying function like httr.

## Value

Returns a named list of data frames: FranchiseLeaderswRank

**FranchiseLeaderswRank**

|                  |           |
|------------------|-----------|
| col_name         | types     |
| LEAGUE_ID        | character |
| TEAM_ID          | character |
| TEAM             | character |
| PERSON_ID        | character |
| PLAYER           | character |
| SEASON_TYPE      | character |
| ACTIVE_WITH_TEAM | character |
| GP               | character |
| MINUTES          | character |
| FGM              | character |
| FGA              | character |
| FG_PCT           | character |
| FG3M             | character |
| FG3A             | character |
| FG3_PCT          | character |
| FTM              | character |
| FTA              | character |
| FT_PCT           | character |
| OREB             | character |
| DREB             | character |
| REB              | character |
| AST              | character |
| PF               | character |
| STL              | character |
| TOV              | character |
| BLK              | character |
| PTS              | character |
| F_RANK_GP        | character |
| F_RANK_MINUTES   | character |
| F_RANK_FGM       | character |
| F_RANK_FGA       | character |
| F_RANK_FG_PCT    | character |
| F_RANK_FG3M      | character |
| F_RANK_FG3A      | character |
| F_RANK_FG3_PCT   | character |
| F_RANK_FTM       | character |
| F_RANK_FTA       | character |
| F_RANK_FT_PCT    | character |
| F_RANK_OREB      | character |
| F_RANK_DREB      | character |
| F_RANK_REB       | character |
| F_RANK_AST       | character |
| F_RANK_PF        | character |
| F_RANK_STL       | character |
| F_RANK_TOV       | character |
| F_RANK_BLK       | character |
| F_RANK_PTS       | character |

## Details

[Franchise
Leaders](https://stats.wnba.com/team/1611661324/franchise-leaders)

     wnba_franchiseleaderswrank(league_id = '10', team_id = '1611661324')

## See also

Other WNBA Franchise Functions:
[`wnba_franchisehistory()`](https://wehoop.sportsdataverse.org/reference/wnba_franchisehistory.md),
[`wnba_franchiseleaders()`](https://wehoop.sportsdataverse.org/reference/wnba_franchiseleaders.md),
[`wnba_franchiseplayers()`](https://wehoop.sportsdataverse.org/reference/wnba_franchiseplayers.md)

## Author

Saiem Gilani
