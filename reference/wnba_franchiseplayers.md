# **Get WNBA Stats API Franchise Players**

**Get WNBA Stats API Franchise Players**

**Get WNBA Stats API Franchise Players**

## Usage

``` r
wnba_franchiseplayers(
  league_id = "10",
  per_mode = "Totals",
  season_type = "Regular Season",
  team_id = "1611661319",
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

Returns a named list of data frames: FranchisePlayers

**FranchisePlayers**

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

## Details

[Franchise
Players](https://stats.wnba.com/team/1611661319/franchise-leaders/)

     wnba_franchiseplayers(league_id = '10', team_id = '1611661319')
     wnba_franchiseplayers(league_id = '10', season_type = 'Playoffs', team_id = '1611661319')

## See also

Other WNBA Franchise Functions:
[`wnba_franchisehistory()`](https://wehoop.sportsdataverse.org/reference/wnba_franchisehistory.md),
[`wnba_franchiseleaderswrank()`](https://wehoop.sportsdataverse.org/reference/wnba_franchiseleaderswrank.md),
[`wnba_franchiseleaders()`](https://wehoop.sportsdataverse.org/reference/wnba_franchiseleaders.md)

## Author

Saiem Gilani
