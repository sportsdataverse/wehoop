# **TBF Player Career**

One player's career: a row per season and competition with totals (birth
date is not returned).

Endpoint:
`GET https://miniappapi.tbf.org.tr/webapi-service/api/Player/get-player-detail-profile-and-career-info/{player_id}`

## Usage

``` r
tbf_player_career(player_id)
```

## Arguments

- player_id:

  Required. TBF person id, e.g. 196413; person_id in
  [`tbf_players()`](https://wehoop.sportsdataverse.org/reference/tbf_players.md)
  and the box score.

## Value

A `wehoop_data` tibble. One row per career season and competition.
Totals and averages rows are not included. Every column below is always
present (a zero-row tibble keeps them and their types); an answer with
nothing in it raises `wehoop_no_data`, as in sportsdataverse-py.

|  |  |  |
|----|----|----|
| col_name | type | description |
| person_id | integer | TBF person id of the player asked for (the player_id argument). |
| player_name | character | Player's full name from the profile (the same on every row). |
| nationality | character | Nationality as a TURKISH country name from the profile (country). |
| height_cm | integer | Height in centimetres from the profile; null when TBF has none. |
| season_label | character | Career season as TBF writes it (seasonCode), e.g. 2025-2026. |
| season | integer | Career season END year, read from the season label. |
| team_name | character | Team the player represented that season, uppercase with Turkish letters (teamName). |
| activity_name | character | League-season name (activityName), e.g. 'BSL 2025-2026'. |
| activity_type_id | integer | Competition type id (faaliyetTuruId): 1 = BSL, 4 = TBL, 79 = BGL. |
| activity_id | integer | Activity id of the league-season (faaliyetAltAlaniId; key space: TBF league-seasons). |
| games | integer | Games played (macSayisi = game count). |
| seconds_played | integer | Total time on court that season in seconds (formattedTotalSeconds 'hh:mm:ss'). |
| points | integer | Points scored in the game (or season) the row covers. |
| assists | integer | Assists in that season and competition. |
| fg_made | integer | Field goals made (fieldGoalsMade), 2PT + 3PT. |
| fg_attempted | integer | Field goals attempted (fieldGoalsAttempted), 2PT + 3PT. |
| fg3_made | integer | Three-point field goals made (threePointsMade). |
| fg3_attempted | integer | Three-point field goals attempted (threePointsAttempted). |
| ft_made | integer | Free throws made (the API spells the field freeThows). |
| ft_attempted | integer | Free throws attempted (freeThowsAttempted). |
| off_rebounds | integer | Offensive rebounds in that season and competition. |
| def_rebounds | integer | Defensive rebounds in that season and competition. |
| rebounds | integer | Total rebounds in that season and competition. |
| steals | integer | Steals in that season and competition. |
| turnovers | integer | Turnovers (the API spells the field tournovers). |
| blocks | integer | Blocks in that season and competition. |
| fouls | integer | Personal fouls (the API spells the field fauls). |
| efficiency | integer | Efficiency rating total (playerEfficiency, PIR) for that season and competition. |
| fouls_drawn | integer | Fouls drawn (yapilanFaul). |
| blocks_received | integer | Own shots blocked by an opponent (yenilenBlok). |

## Details

Source, terms of use, request pacing, seasons, coverage and error
classes of this family: see the notes in
[`tbf_seasons()`](https://wehoop.sportsdataverse.org/reference/tbf_seasons.md).

     tbf_player_career(player_id = 196413)

## See also

[family_tbf](https://wehoop.sportsdataverse.org/reference/family_tbf.md)
lists every function in this family.
