# **Get WNBA Stats API Draft Board**

**Get WNBA Stats API Draft Board**

**Get WNBA Stats API Draft Board**

## Usage

``` r
wnba_draftboard(season = most_recent_wnba_season(), ...)
```

## Arguments

- season:

  Draft year as numeric or character (e.g. `2026`).

- ...:

  Additional arguments passed to an underlying function like httr.

## Value

Returns a named list of tibbles: `board`, `picks`.

**board**

|  |  |  |
|----|----|----|
| col_name | types | description |
| draft_id | integer | Unique identifier for draft. |
| title | character | Title or label for the record. |
| season | integer | Season identifier (4-digit year or 'YYYY-YY' string). |
| status | character | Status label. |
| on_the_clock | character | On the clock. |
| draft_date | character | Date in YYYY-MM-DD format. |
| modified | character | Modified. |

**picks**

|                  |           |                                                 |
|------------------|-----------|-------------------------------------------------|
| col_name         | types     | description                                     |
| round            | integer   | Tournament / playoff round.                     |
| pick             | integer   | Pick.                                           |
| team_id          | integer   | Unique team identifier.                         |
| team_external_id | integer   | Unique identifier for team external.            |
| team_name        | character | Full team display name (e.g. 'Las Vegas Aces'). |
| prospect_id      | integer   | Unique identifier for prospect.                 |
| first_name       | character | Player's first name.                            |
| last_name        | character | Player's last name.                             |
| position         | character | Listed roster position (G, F, C, etc.).         |
| country          | character | Country (full name or code).                    |
| college          | character | College or school attended.                     |
| ppg              | character | Points per game.                                |
| rpg              | character | Rebounds per game.                              |
| apg              | character | Assists per game.                               |
| spg              | character | Steals per game.                                |
| bpg              | character | Blocks per game.                                |
| fg_pct           | character | Field goal percentage (0-1).                    |
| description      | character | Long-form description text.                     |
| headshot_url     | character | URL for headshot.                               |

## Details

      wnba_draftboard(season = most_recent_wnba_season())

## See also

Other WNBA Draft Functions:
[`wnba_draftcombinestats()`](https://wehoop.sportsdataverse.org/reference/wnba_draftcombinestats.md),
[`wnba_drafthistory()`](https://wehoop.sportsdataverse.org/reference/wnba_drafthistory.md)

## Author

Saiem Gilani
