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

|                |           |                                                 |
|----------------|-----------|-------------------------------------------------|
| col_name       | types     | description                                     |
| LEAGUE_ID      | character | League identifier ('10' = WNBA).                |
| TEAM_ID        | character | Unique team identifier.                         |
| TEAM_CITY      | character | Team city or region (e.g. 'Las Vegas').         |
| TEAM_NAME      | character | Full team display name (e.g. 'Las Vegas Aces'). |
| START_YEAR     | character |                                                 |
| END_YEAR       | character |                                                 |
| YEARS          | character | Years.                                          |
| GAMES          | character |                                                 |
| WINS           | character | Total wins.                                     |
| LOSSES         | character | Total losses.                                   |
| WIN_PCT        | character | Win percentage (0-1 decimal).                   |
| PO_APPEARANCES | character |                                                 |
| DIV_TITLES     | character |                                                 |
| CONF_TITLES    | character |                                                 |
| LEAGUE_TITLES  | character |                                                 |

**DefunctTeams**

Same columns as the **FranchiseHistory** table above.

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
