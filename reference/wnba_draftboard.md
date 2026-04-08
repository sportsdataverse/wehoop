# **Get WNBA Stats API Draft Board**

**Get WNBA Stats API Draft Board**

**Get WNBA Stats API Draft Board**

## Usage

``` r
wnba_draftboard(season = most_recent_wnba_season() - 1, ...)
```

## Arguments

- season:

  season

- ...:

  Additional arguments passed to an underlying function like httr.

## Value

Returns a named list of data frames: teams,draft_info, picks

**teams**

|               |           |
|---------------|-----------|
| col_name      | types     |
| id            | integer   |
| external-id   | character |
| slug          | character |
| name          | character |
| city          | character |
| state         | character |
| url           | character |
| primarycolor  | character |
| seconarycolor | character |

**draft_info**

|                       |           |
|-----------------------|-----------|
| col_name              | types     |
| draft_status          | character |
| draft_modified        | integer   |
| draft_title           | character |
| draft_show_players    | character |
| draft_id              | integer   |
| draft_url             | character |
| draft_location        | character |
| sponsor_logo          | character |
| header_image          | character |
| sponsor_link          | character |
| draft_date            | character |
| draft_time_hh         | character |
| draft_time_mm         | character |
| draft_time_am         | character |
| draft_time_tz         | character |
| draft_round_1_channel | character |
| draft_round_2_channel | character |
| draft_round_3_channel | character |
| draft_interval        | character |

**picks**

|                 |           |
|-----------------|-----------|
| col_name        | types     |
| team            | character |
| details         | character |
| player_name     | character |
| player_id       | integer   |
| player_college  | character |
| player_position | character |
| player_ppg      | character |
| player_rpg      | character |
| player_apg      | character |
| player_fg       | character |
| player_headshot | character |
| player_url      | character |
| round           | integer   |

## Details

      wnba_draftboard(season = most_recent_wnba_season() - 1)

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
