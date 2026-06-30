# **Get WNBA Stats API League Lineup Visual Data**

**Get WNBA Stats API League Lineup Visual Data**

**Get WNBA Stats API League Lineup Visual Data**

## Usage

``` r
wnba_leaguelineupviz(
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
  minutes_min = 10,
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

- minutes_min:

  minutes_min

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

Returns a named list of data frames: LeagueLineupViz

**LeagueLineupViz**

|  |  |  |
|----|----|----|
| col_name | types | description |
| GROUP_ID | character | Group identifier (e.g. conference group_id). |
| GROUP_NAME | character | Group name. |
| TEAM_ID | character | Unique team identifier. |
| TEAM_ABBREVIATION | character | Short team abbreviation (e.g. 'LAS'). |
| MIN | character | Minutes played. |
| OFF_RATING | character | Offensive rating (points produced per 100 possessions). |
| DEF_RATING | character | Defensive rating (points allowed per 100 possessions). |
| NET_RATING | character | Net rating (off rating - def rating). |
| PACE | character | Possessions per 48 minutes. |
| TS_PCT | character | True shooting percentage (0-1). |
| FTA_RATE | character | Free throw attempt rate (FTA / FGA). |
| TM_AST_PCT | character |  |
| PCT_FGA_2PT | character |  |
| PCT_FGA_3PT | character |  |
| PCT_PTS_2PT_MR | character |  |
| PCT_PTS_FB | character |  |
| PCT_PTS_FT | character |  |
| PCT_PTS_PAINT | character |  |
| PCT_AST_FGM | character |  |
| PCT_UAST_FGM | character |  |
| OPP_FG3_PCT | character |  |
| OPP_EFG_PCT | character |  |
| OPP_FTA_RATE | character |  |
| OPP_TOV_PCT | character |  |

## Details

      wnba_leaguelineupviz(league_id = '10', season = most_recent_wnba_season() - 1)

## See also

Other WNBA League Functions:
[`wnba_leaguedashlineups()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguedashlineups.md),
[`wnba_leaguedashplayerbiostats()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguedashplayerbiostats.md),
[`wnba_leaguedashplayerclutch()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguedashplayerclutch.md),
[`wnba_leaguedashplayershotlocations()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguedashplayershotlocations.md),
[`wnba_leaguedashplayerstats()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguedashplayerstats.md),
[`wnba_leaguedashteamclutch()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguedashteamclutch.md),
[`wnba_leaguedashteamshotlocations()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguedashteamshotlocations.md),
[`wnba_leaguedashteamstats()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguedashteamstats.md),
[`wnba_leaguegamefinder()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguegamefinder.md),
[`wnba_leaguegamelog()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguegamelog.md),
[`wnba_leagueplayerondetails()`](https://wehoop.sportsdataverse.org/reference/wnba_leagueplayerondetails.md),
[`wnba_leagueseasonmatchups()`](https://wehoop.sportsdataverse.org/reference/wnba_leagueseasonmatchups.md),
[`wnba_leaguestandingsv3()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguestandingsv3.md),
[`wnba_shotchartleaguewide()`](https://wehoop.sportsdataverse.org/reference/wnba_shotchartleaguewide.md)

Other WNBA Lineup Functions:
[`wnba_gamerotation()`](https://wehoop.sportsdataverse.org/reference/wnba_gamerotation.md),
[`wnba_leaguedashlineups()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguedashlineups.md),
[`wnba_possession_lineups()`](https://wehoop.sportsdataverse.org/reference/wnba_possession_lineups.md),
[`wnba_rapm()`](https://wehoop.sportsdataverse.org/reference/wnba_rapm.md),
[`wnba_shot_zones()`](https://wehoop.sportsdataverse.org/reference/wnba_shot_zones.md),
[`wnba_shotchartlineupdetail()`](https://wehoop.sportsdataverse.org/reference/wnba_shotchartlineupdetail.md),
[`wnba_teamdashlineups()`](https://wehoop.sportsdataverse.org/reference/wnba_teamdashlineups.md)

## Author

Saiem Gilani
