# **Get WNBA Stats API Player Career Stats**

**Get WNBA Stats API Player Career Stats**

**Get WNBA Stats API Player Career Stats**

## Usage

``` r
wnba_playercareerstats(
  league_id = "10",
  per_mode = "Totals",
  player_id = "1628932",
  ...
)
```

## Arguments

- league_id:

  League - default: '00'. Other options include '10': WNBA, '20':
  G-League

- per_mode:

  Per Mode - PerGame, Totals

- player_id:

  Player ID

- ...:

  Additional arguments passed to an underlying function like httr.

## Value

Return a named list of data frames: CareerTotalsAllStarSeason,
CareerTotalsCollegeSeason, CareerTotalsPostSeason,
CareerTotalsRegularSeason, SeasonRankingsPostSeason,
SeasonRankingsRegularSeason, SeasonTotalsAllStarSeason,
SeasonTotalsCollegeSeason, SeasonTotalsPostSeason,
SeasonTotalsRegularSeason

**SeasonTotalsRegularSeason**

Columns as documented in the shared
[wnba_playercareerstats_season_totals_schema](https://wehoop.sportsdataverse.org/reference/wnba_playercareerstats_season_totals_schema.md)
table.

**CareerTotalsRegularSeason**

|           |           |                                          |
|-----------|-----------|------------------------------------------|
| col_name  | types     | description                              |
| PLAYER_ID | character | Unique player identifier.                |
| LEAGUE_ID | character | League identifier ('10' = WNBA).         |
| Team_ID   | character | Unique team identifier.                  |
| GP        | character | Games played.                            |
| GS        | character | Games started.                           |
| MIN       | character | Minutes played.                          |
| FGM       | character | Field goals made.                        |
| FGA       | character | Field goal attempts.                     |
| FG_PCT    | character | Field goal percentage (0-1).             |
| FG3M      | character | Three-point field goals made.            |
| FG3A      | character | Three-point field goal attempts.         |
| FG3_PCT   | character | Three-point field goal percentage (0-1). |
| FTM       | character | Free throws made.                        |
| FTA       | character | Free throw attempts.                     |
| FT_PCT    | character | Free throw percentage (0-1).             |
| OREB      | character | Offensive rebounds.                      |
| DREB      | character | Defensive rebounds.                      |
| REB       | character | Total rebounds.                          |
| AST       | character | Assists.                                 |
| STL       | character | Steals.                                  |
| BLK       | character | Blocks.                                  |
| TOV       | character | Turnovers.                               |
| PF        | character | Personal fouls.                          |
| PTS       | character | Points scored.                           |

**SeasonTotalsPostSeason**

Columns as documented in the shared
[wnba_playercareerstats_season_totals_schema](https://wehoop.sportsdataverse.org/reference/wnba_playercareerstats_season_totals_schema.md)
table.

**CareerTotalsPostSeason**

Same columns as the **CareerTotalsRegularSeason** table above.

**SeasonTotalsAllStarSeason**

Columns as documented in the shared
[wnba_playercareerstats_season_totals_schema](https://wehoop.sportsdataverse.org/reference/wnba_playercareerstats_season_totals_schema.md)
table.

**CareerTotalsAllStarSeason**

Same columns as the **CareerTotalsRegularSeason** table above.

**SeasonTotalsCollegeSeason**

**CareerTotalsCollegeSeason**

**SeasonTotalsShowcaseSeason**

**CareerTotalsShowcaseSeason**

**SeasonRankingsRegularSeason**

Columns as documented in the shared
[wnba_playercareerstats_season_rankings_schema](https://wehoop.sportsdataverse.org/reference/wnba_playercareerstats_season_rankings_schema.md)
table.

**SeasonRankingsPostSeason**

Columns as documented in the shared
[wnba_playercareerstats_season_rankings_schema](https://wehoop.sportsdataverse.org/reference/wnba_playercareerstats_season_rankings_schema.md)
table.

## Details

      wnba_playercareerstats(player_id = '1628932')

## See also

[family_wnba_player](https://wehoop.sportsdataverse.org/reference/family_wnba_player.md)
lists every function in this family.

## Author

Saiem Gilani
