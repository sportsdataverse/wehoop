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

|              |           |
|--------------|-----------|
| col_name     | types     |
| draft_id     | integer   |
| title        | character |
| season       | integer   |
| status       | character |
| on_the_clock | character |
| draft_date   | character |
| modified     | character |

**picks**

|                  |           |
|------------------|-----------|
| col_name         | types     |
| round            | integer   |
| pick             | integer   |
| team_id          | integer   |
| team_external_id | integer   |
| team_name        | character |
| prospect_id      | integer   |
| first_name       | character |
| last_name        | character |
| position         | character |
| country          | character |
| college          | character |
| ppg              | character |
| rpg              | character |
| apg              | character |
| spg              | character |
| bpg              | character |
| fg_pct           | character |
| description      | character |
| headshot_url     | character |

## Details

      wnba_draftboard(season = most_recent_wnba_season())

## See also

Other WNBA Draft Functions:
[`wnba_draftcombinedrillresults()`](https://wehoop.sportsdataverse.org/reference/wnba_draftcombinedrillresults.md),
[`wnba_draftcombinenonstationaryshooting()`](https://wehoop.sportsdataverse.org/reference/wnba_draftcombinenonstationaryshooting.md),
[`wnba_draftcombineplayeranthro()`](https://wehoop.sportsdataverse.org/reference/wnba_draftcombineplayeranthro.md),
[`wnba_draftcombinespotshooting()`](https://wehoop.sportsdataverse.org/reference/wnba_draftcombinespotshooting.md),
[`wnba_draftcombinestats()`](https://wehoop.sportsdataverse.org/reference/wnba_draftcombinestats.md),
[`wnba_drafthistory()`](https://wehoop.sportsdataverse.org/reference/wnba_drafthistory.md)

## Author

Saiem Gilani
