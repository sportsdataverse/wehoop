# **Get WNBA Stats API League Dashboard Lineups**

**Get WNBA Stats API League Dashboard Lineups**

**Get WNBA Stats API League Dashboard Lineups**

## Usage

``` r
wnba_leaguedashlineups(
  conference = "",
  date_from = "",
  date_to = "",
  division = "",
  game_segment = "",
  group_quantity = 5,
  last_n_games = 0,
  league_id = "10",
  location = "",
  measure_type = "Base",
  month = 0,
  opponent_team_id = 0,
  outcome = "",
  po_round = "",
  pace_adjust = "N",
  per_mode = "Totals",
  period = 0,
  plus_minus = "N",
  rank = "N",
  season = most_recent_wnba_season() - 1,
  season_segment = "",
  season_type = "Regular Season",
  shot_clock_range = "",
  team_id = "",
  vs_conference = "",
  vs_division = "",
  ...
)
```

## Arguments

- conference:

  conference

- date_from:

  date_from

- date_to:

  date_to

- division:

  division

- game_segment:

  game_segment

- group_quantity:

  group_quantity

- last_n_games:

  last_n_games

- league_id:

  league_id

- location:

  location

- measure_type:

  measure_type

- month:

  month

- opponent_team_id:

  opponent_team_id

- outcome:

  outcome

- po_round:

  po_round

- pace_adjust:

  pace_adjust

- per_mode:

  per_mode

- period:

  period

- plus_minus:

  plus_minus

- rank:

  rank

- season:

  season

- season_segment:

  season_segment

- season_type:

  season_type

- shot_clock_range:

  shot_clock_range

- team_id:

  team_id

- vs_conference:

  vs_conference

- vs_division:

  vs_division

- ...:

  Additional arguments passed to an underlying function like httr.

## Value

Returns a named list of data frames: Lineups

**Lineups**

|                   |           |                                               |
|-------------------|-----------|-----------------------------------------------|
| col_name          | types     | description                                   |
| GROUP_SET         | character |                                               |
| GROUP_ID          | character | Group identifier (e.g. conference group_id).  |
| GROUP_NAME        | character | Group name.                                   |
| TEAM_ID           | character | Unique team identifier.                       |
| TEAM_ABBREVIATION | character | Short team abbreviation (e.g. 'LAS').         |
| GP                | character | Games played.                                 |
| W                 | character | Wins.                                         |
| L                 | character | Losses.                                       |
| W_PCT             | character | Wins percentage (0-1 decimal).                |
| MIN               | character | Minutes played.                               |
| FGM               | character | Field goals made.                             |
| FGA               | character | Field goal attempts.                          |
| FG_PCT            | character | Field goal percentage (0-1).                  |
| FG3M              | character | Three-point field goals made.                 |
| FG3A              | character | Three-point field goal attempts.              |
| FG3_PCT           | character | Three-point field goal percentage (0-1).      |
| FTM               | character | Free throws made.                             |
| FTA               | character | Free throw attempts.                          |
| FT_PCT            | character | Free throw percentage (0-1).                  |
| OREB              | character | Offensive rebounds.                           |
| DREB              | character | Defensive rebounds.                           |
| REB               | character | Total rebounds.                               |
| AST               | character | Assists.                                      |
| TOV               | character | Turnovers.                                    |
| STL               | character | Steals.                                       |
| BLK               | character | Blocks.                                       |
| BLKA              | character |                                               |
| PF                | character | Personal fouls.                               |
| PFD               | character |                                               |
| PTS               | character | Points scored.                                |
| PLUS_MINUS        | character | Plus/minus point differential while on court. |
| GP_RANK           | character |                                               |
| W_RANK            | character |                                               |
| L_RANK            | character |                                               |
| W_PCT_RANK        | character |                                               |
| MIN_RANK          | character |                                               |
| FGM_RANK          | character |                                               |
| FGA_RANK          | character |                                               |
| FG_PCT_RANK       | character |                                               |
| FG3M_RANK         | character |                                               |
| FG3A_RANK         | character |                                               |
| FG3_PCT_RANK      | character |                                               |
| FTM_RANK          | character |                                               |
| FTA_RANK          | character |                                               |
| FT_PCT_RANK       | character |                                               |
| OREB_RANK         | character |                                               |
| DREB_RANK         | character |                                               |
| REB_RANK          | character |                                               |
| AST_RANK          | character |                                               |
| TOV_RANK          | character |                                               |
| STL_RANK          | character |                                               |
| BLK_RANK          | character |                                               |
| BLKA_RANK         | character |                                               |
| PF_RANK           | character |                                               |
| PFD_RANK          | character |                                               |
| PTS_RANK          | character |                                               |
| PLUS_MINUS_RANK   | character |                                               |

## Details

     wnba_leaguedashlineups(league_id = '10', season = most_recent_wnba_season() - 1)

## See also

Other WNBA League Functions:
[`wnba_leaguedashplayerbiostats()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguedashplayerbiostats.md),
[`wnba_leaguedashplayerclutch()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguedashplayerclutch.md),
[`wnba_leaguedashplayershotlocations()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguedashplayershotlocations.md),
[`wnba_leaguedashplayerstats()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguedashplayerstats.md),
[`wnba_leaguedashteamclutch()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguedashteamclutch.md),
[`wnba_leaguedashteamshotlocations()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguedashteamshotlocations.md),
[`wnba_leaguedashteamstats()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguedashteamstats.md),
[`wnba_leaguegamefinder()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguegamefinder.md),
[`wnba_leaguegamelog()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguegamelog.md),
[`wnba_leaguelineupviz()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguelineupviz.md),
[`wnba_leagueplayerondetails()`](https://wehoop.sportsdataverse.org/reference/wnba_leagueplayerondetails.md),
[`wnba_leagueseasonmatchups()`](https://wehoop.sportsdataverse.org/reference/wnba_leagueseasonmatchups.md),
[`wnba_leaguestandingsv3()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguestandingsv3.md),
[`wnba_shotchartleaguewide()`](https://wehoop.sportsdataverse.org/reference/wnba_shotchartleaguewide.md)

Other WNBA Lineup Functions:
[`wnba_gamerotation()`](https://wehoop.sportsdataverse.org/reference/wnba_gamerotation.md),
[`wnba_leaguelineupviz()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguelineupviz.md),
[`wnba_shotchartlineupdetail()`](https://wehoop.sportsdataverse.org/reference/wnba_shotchartlineupdetail.md),
[`wnba_teamdashlineups()`](https://wehoop.sportsdataverse.org/reference/wnba_teamdashlineups.md)

## Author

Saiem Gilani
