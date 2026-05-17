# **Get WNBA Stats API Franchise Leaders**

**Get WNBA Stats API Franchise Leaders**

**Get WNBA Stats API Franchise Leaders**

## Usage

``` r
wnba_franchiseleaders(league_id = "10", team_id = "1611661324", ...)
```

## Arguments

- league_id:

  league_id

- team_id:

  team_id

- ...:

  Additional arguments passed to an underlying function like httr.

## Value

Returns a named list of data frames: FranchiseLeaders

**FranchiseLeaders**

|               |           |                         |
|---------------|-----------|-------------------------|
| col_name      | types     | description             |
| TEAM_ID       | character | Unique team identifier. |
| PTS           | character | Points scored.          |
| PTS_PERSON_ID | character |                         |
| PTS_PLAYER    | character |                         |
| AST           | character | Assists.                |
| AST_PERSON_ID | character |                         |
| AST_PLAYER    | character |                         |
| REB           | character | Total rebounds.         |
| REB_PERSON_ID | character |                         |
| REB_PLAYER    | character |                         |
| BLK           | character | Blocks.                 |
| BLK_PERSON_ID | character |                         |
| BLK_PLAYER    | character |                         |
| STL           | character | Steals.                 |
| STL_PERSON_ID | character |                         |
| STL_PLAYER    | character |                         |

## Details

[Franchise
Leaders](https://stats.wnba.com/team/1611661324/franchise-leaders)

      wnba_franchiseleaders(league_id = '10', team_id = '1611661324')

## See also

Other WNBA Franchise Functions:
[`wnba_franchisehistory()`](https://wehoop.sportsdataverse.org/reference/wnba_franchisehistory.md),
[`wnba_franchiseleaderswrank()`](https://wehoop.sportsdataverse.org/reference/wnba_franchiseleaderswrank.md),
[`wnba_franchiseplayers()`](https://wehoop.sportsdataverse.org/reference/wnba_franchiseplayers.md)

## Author

Saiem Gilani
