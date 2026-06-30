# **Get WNBA Possession-Level Stint Matrix**

**Get WNBA Possession-Level Stint Matrix**

**Get WNBA Possession-Level Stint Matrix**

## Usage

``` r
wnba_possession_lineups(game_id, ...)
```

## Arguments

- game_id:

  WNBA Stats game id. 10-character zero-padded string (e.g.,
  `"1022400001"`).

- ...:

  reserved for future use.

## Value

Returns a data frame with one row per possession:

|  |  |  |
|----|----|----|
| col_name | types | description |
| game_id | character | Unique game identifier (10-character WNBA Stats ID). |
| period | integer | Game period (1-4 regular, 5+ overtime). |
| possession_number | integer | Sequential possession counter within the game (1-based). |
| offense_team_id | integer | WNBA Stats team ID of the team on offense for this possession. |
| defense_team_id | integer | WNBA Stats team ID of the team on defense for this possession. |
| points | integer | Points scored by the offense during this possession (0 or positive). |
| second_chance | logical | TRUE if the possession was extended by an offensive rebound (second-chance opportunity). |
| start_event_idx | integer | 1-based row index into the source PBP frame for the first event of this possession. |
| end_event_idx | integer | 1-based row index into the source PBP frame for the last event of this possession. |
| off_player_1 | integer | WNBA Stats person_id for offensive on-court player slot 1. |
| off_player_2 | integer | WNBA Stats person_id for offensive on-court player slot 2. |
| off_player_3 | integer | WNBA Stats person_id for offensive on-court player slot 3. |
| off_player_4 | integer | WNBA Stats person_id for offensive on-court player slot 4. |
| off_player_5 | integer | WNBA Stats person_id for offensive on-court player slot 5. |
| def_player_1 | integer | WNBA Stats person_id for defensive on-court player slot 1. |
| def_player_2 | integer | WNBA Stats person_id for defensive on-court player slot 2. |
| def_player_3 | integer | WNBA Stats person_id for defensive on-court player slot 3. |
| def_player_4 | integer | WNBA Stats person_id for defensive on-court player slot 4. |
| def_player_5 | integer | WNBA Stats person_id for defensive on-court player slot 5. |

## See also

Other WNBA Lineup Functions:
[`wnba_gamerotation()`](https://wehoop.sportsdataverse.org/reference/wnba_gamerotation.md),
[`wnba_leaguedashlineups()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguedashlineups.md),
[`wnba_leaguelineupviz()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguelineupviz.md),
[`wnba_rapm()`](https://wehoop.sportsdataverse.org/reference/wnba_rapm.md),
[`wnba_shot_zones()`](https://wehoop.sportsdataverse.org/reference/wnba_shot_zones.md),
[`wnba_shotchartlineupdetail()`](https://wehoop.sportsdataverse.org/reference/wnba_shotchartlineupdetail.md),
[`wnba_teamdashlineups()`](https://wehoop.sportsdataverse.org/reference/wnba_teamdashlineups.md)

## Author

Saiem Gilani
