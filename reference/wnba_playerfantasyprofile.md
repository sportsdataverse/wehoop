# **Get WNBA Stats API Player Fantasy Profile**

**Get WNBA Stats API Player Fantasy Profile**

**Get WNBA Stats API Player Fantasy Profile**

## Usage

``` r
wnba_playerfantasyprofile(
  league_id = "10",
  measure_type = "Base",
  pace_adjust = "N",
  per_mode = "Totals",
  player_id = "1628932",
  plus_minus = "N",
  rank = "N",
  season = most_recent_wnba_season() - 1,
  season_type = "Regular Season",
  ...
)
```

## Arguments

- league_id:

  League - default: '00'. Other options include '10': WWNBA, '20':
  G-League

- measure_type:

  measure_type

- pace_adjust:

  Pace Adjustment - Y/N

- per_mode:

  Per Mode - PerGame, Totals

- player_id:

  Player ID

- plus_minus:

  Plus Minus - Y/N

- rank:

  Rank - Y/N

- season:

  Season - format 2020-21

- season_type:

  Season Type - Regular Season, Playoffs, All-Star

- ...:

  Additional arguments passed to an underlying function like httr.

## Value

Return a named list of data frames: DaysRestModified, LastNGames,
Location, Opponent, Overall

**Overall**

|                  |           |
|------------------|-----------|
| col_name         | types     |
| GROUP_SET        | character |
| GROUP_VALUE      | character |
| GP               | character |
| W                | character |
| L                | character |
| W_PCT            | character |
| MIN              | character |
| FGM              | character |
| FGA              | character |
| FG_PCT           | character |
| FG3M             | character |
| FG3A             | character |
| FG3_PCT          | character |
| FTM              | character |
| FTA              | character |
| FT_PCT           | character |
| OREB             | character |
| DREB             | character |
| REB              | character |
| AST              | character |
| TOV              | character |
| STL              | character |
| BLK              | character |
| BLKA             | character |
| PF               | character |
| PFD              | character |
| PTS              | character |
| PLUS_MINUS       | character |
| DD2              | character |
| TD3              | character |
| FAN_DUEL_PTS     | character |
| WNBA_FANTASY_PTS | character |

**Location**

|                  |           |
|------------------|-----------|
| col_name         | types     |
| GROUP_SET        | character |
| GROUP_VALUE      | character |
| GP               | character |
| W                | character |
| L                | character |
| W_PCT            | character |
| MIN              | character |
| FGM              | character |
| FGA              | character |
| FG_PCT           | character |
| FG3M             | character |
| FG3A             | character |
| FG3_PCT          | character |
| FTM              | character |
| FTA              | character |
| FT_PCT           | character |
| OREB             | character |
| DREB             | character |
| REB              | character |
| AST              | character |
| TOV              | character |
| STL              | character |
| BLK              | character |
| BLKA             | character |
| PF               | character |
| PFD              | character |
| PTS              | character |
| PLUS_MINUS       | character |
| DD2              | character |
| TD3              | character |
| FAN_DUEL_PTS     | character |
| WNBA_FANTASY_PTS | character |

**LastNGames**

|                  |           |
|------------------|-----------|
| col_name         | types     |
| GROUP_SET        | character |
| GROUP_VALUE      | character |
| GP               | character |
| W                | character |
| L                | character |
| W_PCT            | character |
| MIN              | character |
| FGM              | character |
| FGA              | character |
| FG_PCT           | character |
| FG3M             | character |
| FG3A             | character |
| FG3_PCT          | character |
| FTM              | character |
| FTA              | character |
| FT_PCT           | character |
| OREB             | character |
| DREB             | character |
| REB              | character |
| AST              | character |
| TOV              | character |
| STL              | character |
| BLK              | character |
| BLKA             | character |
| PF               | character |
| PFD              | character |
| PTS              | character |
| PLUS_MINUS       | character |
| DD2              | character |
| TD3              | character |
| FAN_DUEL_PTS     | character |
| WNBA_FANTASY_PTS | character |

**DaysRestModified**

|                  |           |
|------------------|-----------|
| col_name         | types     |
| GROUP_SET        | character |
| GROUP_VALUE      | character |
| SEASON_YEAR      | character |
| GP               | character |
| W                | character |
| L                | character |
| W_PCT            | character |
| MIN              | character |
| FGM              | character |
| FGA              | character |
| FG_PCT           | character |
| FG3M             | character |
| FG3A             | character |
| FG3_PCT          | character |
| FTM              | character |
| FTA              | character |
| FT_PCT           | character |
| OREB             | character |
| DREB             | character |
| REB              | character |
| AST              | character |
| TOV              | character |
| STL              | character |
| BLK              | character |
| BLKA             | character |
| PF               | character |
| PFD              | character |
| PTS              | character |
| PLUS_MINUS       | character |
| DD2              | character |
| TD3              | character |
| FAN_DUEL_PTS     | character |
| WNBA_FANTASY_PTS | character |

**Opponent**

|                 |           |
|-----------------|-----------|
| col_name        | types     |
| GROUP_SET       | character |
| GROUP_VALUE     | character |
| GP              | character |
| W               | character |
| L               | character |
| W_PCT           | character |
| MIN             | character |
| FGM             | character |
| FGA             | character |
| FG_PCT          | character |
| FG3M            | character |
| FG3A            | character |
| FG3_PCT         | character |
| FTM             | character |
| FTA             | character |
| FT_PCT          | character |
| OREB            | character |
| DREB            | character |
| REB             | character |
| AST             | character |
| TOV             | character |
| STL             | character |
| BLK             | character |
| BLKA            | character |
| PF              | character |
| PFD             | character |
| PTS             | character |
| PLUS_MINUS      | character |
| DD2             | character |
| TD3             | character |
| FAN_DUEL_PTS    | character |
| NBA_FANTASY_PTS | character |

## Details

     wnba_playerfantasyprofile(player_id = '1628932')

## See also

Other WNBA Player Functions:
[`wnba_infographicfanduelplayer()`](https://wehoop.sportsdataverse.org/reference/wnba_infographicfanduelplayer.md),
[`wnba_leaguedashplayerbiostats()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguedashplayerbiostats.md),
[`wnba_leaguedashplayerclutch()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguedashplayerclutch.md),
[`wnba_leaguedashplayershotlocations()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguedashplayershotlocations.md),
[`wnba_leaguedashplayerstats()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguedashplayerstats.md),
[`wnba_leagueplayerondetails()`](https://wehoop.sportsdataverse.org/reference/wnba_leagueplayerondetails.md),
[`wnba_leagueseasonmatchups()`](https://wehoop.sportsdataverse.org/reference/wnba_leagueseasonmatchups.md),
[`wnba_playerawards()`](https://wehoop.sportsdataverse.org/reference/wnba_playerawards.md),
[`wnba_playercareerbycollege()`](https://wehoop.sportsdataverse.org/reference/wnba_playercareerbycollege.md),
[`wnba_playercareerbycollegerollup()`](https://wehoop.sportsdataverse.org/reference/wnba_playercareerbycollegerollup.md),
[`wnba_playercareerstats()`](https://wehoop.sportsdataverse.org/reference/wnba_playercareerstats.md),
[`wnba_playercompare()`](https://wehoop.sportsdataverse.org/reference/wnba_playercompare.md),
[`wnba_playerdashboardbyclutch()`](https://wehoop.sportsdataverse.org/reference/wnba_playerdashboardbyclutch.md),
[`wnba_playerdashboardbygamesplits()`](https://wehoop.sportsdataverse.org/reference/wnba_playerdashboardbygamesplits.md),
[`wnba_playerdashboardbygeneralsplits()`](https://wehoop.sportsdataverse.org/reference/wnba_playerdashboardbygeneralsplits.md),
[`wnba_playerdashboardbylastngames()`](https://wehoop.sportsdataverse.org/reference/wnba_playerdashboardbylastngames.md),
[`wnba_playerdashboardbyopponent()`](https://wehoop.sportsdataverse.org/reference/wnba_playerdashboardbyopponent.md),
[`wnba_playerdashboardbyshootingsplits()`](https://wehoop.sportsdataverse.org/reference/wnba_playerdashboardbyshootingsplits.md),
[`wnba_playerdashboardbyteamperformance()`](https://wehoop.sportsdataverse.org/reference/wnba_playerdashboardbyteamperformance.md),
[`wnba_playerdashboardbyyearoveryear()`](https://wehoop.sportsdataverse.org/reference/wnba_playerdashboardbyyearoveryear.md),
[`wnba_playerestimatedmetrics()`](https://wehoop.sportsdataverse.org/reference/wnba_playerestimatedmetrics.md),
[`wnba_playerfantasyprofilebargraph()`](https://wehoop.sportsdataverse.org/reference/wnba_playerfantasyprofilebargraph.md),
[`wnba_playergamelog()`](https://wehoop.sportsdataverse.org/reference/wnba_playergamelog.md),
[`wnba_playergamelogs()`](https://wehoop.sportsdataverse.org/reference/wnba_playergamelogs.md),
[`wnba_playergamestreakfinder()`](https://wehoop.sportsdataverse.org/reference/wnba_playergamestreakfinder.md),
[`wnba_playerheadshot()`](https://wehoop.sportsdataverse.org/reference/wnba_playerheadshot.md),
[`wnba_playerindex()`](https://wehoop.sportsdataverse.org/reference/wnba_playerindex.md),
[`wnba_playernextngames()`](https://wehoop.sportsdataverse.org/reference/wnba_playernextngames.md),
[`wnba_playerprofilev2()`](https://wehoop.sportsdataverse.org/reference/wnba_playerprofilev2.md),
[`wnba_playervsplayer()`](https://wehoop.sportsdataverse.org/reference/wnba_playervsplayer.md)

Other WNBA Fantasy Functions:
[`wnba_fantasywidget()`](https://wehoop.sportsdataverse.org/reference/wnba_fantasywidget.md),
[`wnba_infographicfanduelplayer()`](https://wehoop.sportsdataverse.org/reference/wnba_infographicfanduelplayer.md),
[`wnba_playerfantasyprofilebargraph()`](https://wehoop.sportsdataverse.org/reference/wnba_playerfantasyprofilebargraph.md)

## Author

Saiem Gilani
