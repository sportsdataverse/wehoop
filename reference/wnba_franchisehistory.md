# **Get WNBA Stats API Franchise History**

**Get WNBA Stats API Franchise History**

**Get WNBA Stats API Franchise History**

## Usage

``` r
wnba_franchisehistory(league_id = "10", ...)
```

## Arguments

- league_id:

  league_id

- ...:

  Additional arguments passed to an underlying function like httr.

## Value

Returns a named list of data frames: DefunctTeams, FranchiseHistory

**FranchiseHistory**

|                |           |
|----------------|-----------|
| col_name       | types     |
| LEAGUE_ID      | character |
| TEAM_ID        | character |
| TEAM_CITY      | character |
| TEAM_NAME      | character |
| START_YEAR     | character |
| END_YEAR       | character |
| YEARS          | character |
| GAMES          | character |
| WINS           | character |
| LOSSES         | character |
| WIN_PCT        | character |
| PO_APPEARANCES | character |
| DIV_TITLES     | character |
| CONF_TITLES    | character |
| LEAGUE_TITLES  | character |

**DefunctTeams**

|                |           |
|----------------|-----------|
| col_name       | types     |
| LEAGUE_ID      | character |
| TEAM_ID        | character |
| TEAM_CITY      | character |
| TEAM_NAME      | character |
| START_YEAR     | character |
| END_YEAR       | character |
| YEARS          | character |
| GAMES          | character |
| WINS           | character |
| LOSSES         | character |
| WIN_PCT        | character |
| PO_APPEARANCES | character |
| DIV_TITLES     | character |
| CONF_TITLES    | character |
| LEAGUE_TITLES  | character |

## Details

[Franchise History](https://stats.wnba.com/history/)

      wnba_franchisehistory(league_id = '10')

## See also

Other WNBA Franchise Functions:
[`wnba_franchiseleaders()`](https://wehoop.sportsdataverse.org/reference/wnba_franchiseleaders.md),
[`wnba_franchiseleaderswrank()`](https://wehoop.sportsdataverse.org/reference/wnba_franchiseleaderswrank.md),
[`wnba_franchiseplayers()`](https://wehoop.sportsdataverse.org/reference/wnba_franchiseplayers.md)

## Author

Saiem Gilani
