# **Get WNBA Stats API Draft History**

**Get WNBA Stats API Draft History**

## Usage

``` r
wnba_drafthistory(
  league_id = "10",
  college = "",
  overall_pick = "",
  round_pick = "",
  round_num = "",
  season = most_recent_wnba_season() - 1,
  team_id = "",
  top_x = "",
  ...
)
```

## Arguments

- league_id:

  league_id

- college:

  college

- overall_pick:

  overall_pick

- round_pick:

  round_pick

- round_num:

  round_num

- season:

  season

- team_id:

  team_id

- top_x:

  top_x

- ...:

  Additional arguments passed to an underlying function like httr.

## Value

Returns a named list of data frames: DraftHistory

**DraftHistory**

|                     |           |
|---------------------|-----------|
| col_name            | types     |
| PERSON_ID           | character |
| PLAYER_NAME         | character |
| SEASON              | character |
| ROUND_NUMBER        | character |
| ROUND_PICK          | character |
| OVERALL_PICK        | character |
| DRAFT_TYPE          | character |
| TEAM_ID             | character |
| TEAM_CITY           | character |
| TEAM_NAME           | character |
| TEAM_ABBREVIATION   | character |
| ORGANIZATION        | character |
| ORGANIZATION_TYPE   | character |
| PLAYER_PROFILE_FLAG | character |

## Details

     wnba_drafthistory(season = most_recent_wnba_season() - 1)

## See also

Other WNBA Draft Functions:
[`wnba_draftboard()`](https://wehoop.sportsdataverse.org/reference/wnba_draftboard.md),
[`wnba_draftcombinedrillresults()`](https://wehoop.sportsdataverse.org/reference/wnba_draftcombinedrillresults.md),
[`wnba_draftcombinenonstationaryshooting()`](https://wehoop.sportsdataverse.org/reference/wnba_draftcombinenonstationaryshooting.md),
[`wnba_draftcombineplayeranthro()`](https://wehoop.sportsdataverse.org/reference/wnba_draftcombineplayeranthro.md),
[`wnba_draftcombinespotshooting()`](https://wehoop.sportsdataverse.org/reference/wnba_draftcombinespotshooting.md),
[`wnba_draftcombinestats()`](https://wehoop.sportsdataverse.org/reference/wnba_draftcombinestats.md)

## Author

Saiem Gilani
