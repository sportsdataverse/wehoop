# **Get WNBA Stats API Player Awards**

**Get WNBA Stats API Player Awards**

**Get WNBA Stats API Player Awards**

## Usage

``` r
wnba_playerawards(player_id, ...)
```

## Arguments

- player_id:

  Player ID

- ...:

  Additional arguments passed to an underlying function like httr.

## Value

Return a named list of data frames: PlayerAwards

**PlayerAwards**

|  |  |  |
|----|----|----|
| col_name | types | description |
| PERSON_ID | character | Unique player identifier (V3 endpoints). |
| FIRST_NAME | character | Player's first name. |
| LAST_NAME | character | Player's last name. |
| TEAM | character | Team-side label or team identifier. |
| DESCRIPTION | character | Long-form description text. |
| ALL_WNBA_TEAM_NUMBER | character |  |
| SEASON | character | Season identifier (4-digit year or 'YYYY-YY' string). |
| MONTH | character | Month number. |
| WEEK | character | Week number within the season. |
| CONFERENCE | character | Filter players or teams by conference. |
| TYPE | character | Record type / category. |
| SUBTYPE1 | character |  |
| SUBTYPE2 | character |  |
| SUBTYPE3 | character |  |

## Details

Player Awards page on stats.wnba.com:
`stats.wnba.com/player/1628932/career/`

     wnba_playerawards(player_id = '1628932')

## See also

[family_wnba_player](https://wehoop.sportsdataverse.org/reference/family_wnba_player.md)
lists every function in this family.

## Author

Saiem Gilani
