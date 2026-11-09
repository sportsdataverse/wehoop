# **Get WNBA Stats API Team Historical Leaders**

**Get WNBA Stats API Team Historical Leaders**

**Get WNBA Stats API Team Historical Leaders**

## Usage

``` r
wnba_teamhistoricalleaders(
  league_id = "10",
  season_id = "22022",
  team_id = "1611661328",
  ...
)
```

## Arguments

- league_id:

  league_id

- season_id:

  season_id

- team_id:

  team_id

- ...:

  Additional arguments passed to an underlying function like httr.

## Value

Return a named list of data frames: CareerLeadersByTeam

**CareerLeadersByTeam**

|               |           |                                        |
|---------------|-----------|----------------------------------------|
| col_name      | types     | description                            |
| TEAM_ID       | character | Unique team identifier.                |
| PTS           | character | Points scored.                         |
| PTS_PERSON_ID | character |                                        |
| PTS_PLAYER    | character |                                        |
| AST           | character | Assists.                               |
| AST_PERSON_ID | character |                                        |
| AST_PLAYER    | character |                                        |
| REB           | character | Total rebounds.                        |
| REB_PERSON_ID | character |                                        |
| REB_PLAYER    | character |                                        |
| BLK           | character | Blocks.                                |
| BLK_PERSON_ID | character |                                        |
| BLK_PLAYER    | character |                                        |
| STL           | character | Steals.                                |
| STL_PERSON_ID | character |                                        |
| STL_PLAYER    | character |                                        |
| SEASON_YEAR   | character | Season year string ('YYYY-YY' format). |

## Details

      wnba_teamhistoricalleaders(team_id = '1611661328')

## See also

[family_wnba_team](https://wehoop.sportsdataverse.org/reference/family_wnba_team.md)
lists every function in this family.

## Author

Saiem Gilani
