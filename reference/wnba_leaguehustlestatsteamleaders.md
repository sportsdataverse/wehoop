# **Get WNBA Stats API League Hustle Stats Team Leaders**

**Get WNBA Stats API League Hustle Stats Team Leaders**

**Get WNBA Stats API League Hustle Stats Team Leaders**

## Usage

``` r
wnba_leaguehustlestatsteamleaders(
  college = "",
  conference = "",
  country = "",
  date_from = "",
  date_to = "",
  division = "",
  draft_pick = "",
  draft_year = "",
  height = "",
  last_n_games = 0,
  league_id = "10",
  location = "",
  month = 0,
  opponent_team_id = 0,
  outcome = "",
  po_round = "",
  per_mode = "Totals",
  player_experience = "",
  player_position = "",
  season = most_recent_wnba_season() - 1,
  season_segment = "",
  season_type = "Regular Season",
  team_id = "",
  vs_conference = "",
  vs_division = "",
  weight = "",
  ...
)
```

## Arguments

- college:

  college

- conference:

  conference

- country:

  country

- date_from:

  date_from

- date_to:

  date_to

- division:

  division

- draft_pick:

  draft_pick

- draft_year:

  draft_year

- height:

  height

- last_n_games:

  last_n_games

- league_id:

  league_id

- location:

  location

- month:

  month

- opponent_team_id:

  opponent_team_id

- outcome:

  outcome

- po_round:

  po_round

- per_mode:

  per_mode

- player_experience:

  player_experience

- player_position:

  player_position

- season:

  season

- season_segment:

  season_segment

- season_type:

  season_type

- team_id:

  team_id

- vs_conference:

  vs_conference

- vs_division:

  vs_division

- weight:

  weight

- ...:

  Additional arguments passed to an underlying function like httr.

## Value

Returns a named list of data frames: Table5, Table6,
TeamChargesDrawnLeaders, TeamContestedShotsLeaders,
TeamDeflectionsLeaders, TeamLooseBallLeaders, TeamScreenAssistLeaders

**TeamContestedShotsLeaders**

|  |  |  |
|----|----|----|
| col_name | types | description |
| TEAM_ID | character | Unique team identifier. |
| TEAM_NAME | character | Full team display name (e.g. 'Las Vegas Aces'). |
| TEAM_ABBREVIATION | character | Short team abbreviation (e.g. 'LAS'). |
| RANK | character | Whether to include statistical ranks in the returned table. |
| CONTESTED_SHOTS | character | Defensively contested shots. |

**TeamChargesDrawnLeaders**

|  |  |  |
|----|----|----|
| col_name | types | description |
| TEAM_ID | character | Unique team identifier. |
| TEAM_NAME | character | Full team display name (e.g. 'Las Vegas Aces'). |
| TEAM_ABBREVIATION | character | Short team abbreviation (e.g. 'LAS'). |
| RANK | character | Whether to include statistical ranks in the returned table. |
| CHARGES_DRAWN | character | Charges drawn. |

**TeamDeflectionsLeaders**

|  |  |  |
|----|----|----|
| col_name | types | description |
| TEAM_ID | character | Unique team identifier. |
| TEAM_NAME | character | Full team display name (e.g. 'Las Vegas Aces'). |
| TEAM_ABBREVIATION | character | Short team abbreviation (e.g. 'LAS'). |
| RANK | character | Whether to include statistical ranks in the returned table. |
| DEFLECTIONS | character | Defensive deflections. |

**TeamLooseBallLeaders**

|  |  |  |
|----|----|----|
| col_name | types | description |
| TEAM_ID | character | Unique team identifier. |
| TEAM_NAME | character | Full team display name (e.g. 'Las Vegas Aces'). |
| TEAM_ABBREVIATION | character | Short team abbreviation (e.g. 'LAS'). |
| RANK | character | Whether to include statistical ranks in the returned table. |
| LOOSE_BALLS_RECOVERED | character | Loose balls recovered. |

**TeamScreenAssistLeaders**

|  |  |  |
|----|----|----|
| col_name | types | description |
| TEAM_ID | character | Unique team identifier. |
| TEAM_NAME | character | Full team display name (e.g. 'Las Vegas Aces'). |
| TEAM_ABBREVIATION | character | Short team abbreviation (e.g. 'LAS'). |
| RANK | character | Whether to include statistical ranks in the returned table. |
| SCREEN_ASSISTS | character | Screen assists (resulting in a basket). |

**Table5**

|  |  |  |
|----|----|----|
| col_name | types | description |
| TEAM_ID | character | Unique team identifier. |
| TEAM_NAME | character | Full team display name (e.g. 'Las Vegas Aces'). |
| TEAM_ABBREVIATION | character | Short team abbreviation (e.g. 'LAS'). |
| RANK | character | Whether to include statistical ranks in the returned table. |
| BOX_OUTS | character | Box-outs executed. |

**Table6**

|  |  |  |
|----|----|----|
| col_name | types | description |
| TEAM_ID | character | Unique team identifier. |
| TEAM_NAME | character | Full team display name (e.g. 'Las Vegas Aces'). |
| TEAM_ABBREVIATION | character | Short team abbreviation (e.g. 'LAS'). |
| RANK | character | Whether to include statistical ranks in the returned table. |
| BOX_OUTS | character | Box-outs executed. |

## Details

      wnba_leaguehustlestatsteamleaders(league_id = '10')

## See also

Other WNBA Hustle Functions:
[`wnba_hustlestatsboxscore()`](https://wehoop.sportsdataverse.org/reference/wnba_hustlestatsboxscore.md),
[`wnba_leaguehustlestatsplayer()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguehustlestatsplayer.md),
[`wnba_leaguehustlestatsplayerleaders()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguehustlestatsplayerleaders.md),
[`wnba_leaguehustlestatsteam()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguehustlestatsteam.md)

## Author

Saiem Gilani
