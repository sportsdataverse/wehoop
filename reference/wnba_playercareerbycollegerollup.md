# **Get WNBA Stats API Player Career By College Rollup**

**Get WNBA Stats API Player Career By College Rollup**

**Get WNBA Stats API Player Career By College Rollup**

## Usage

``` r
wnba_playercareerbycollegerollup(
  league_id = "10",
  per_mode = "Totals",
  season = most_recent_wnba_season() - 1,
  season_type = "Regular Season",
  ...
)
```

## Arguments

- league_id:

  League - default: '00'. Other options include '10': WWNBA, '20':
  G-League

- per_mode:

  Per Mode - PerGame, Totals

- season:

  Season - format 2020-21

- season_type:

  Season Type - Regular Season, Playoffs, All-Star

- ...:

  Additional arguments passed to an underlying function like httr.

## Value

Return a named list of data frames: East, Midwest, South, West

**East**

|          |           |
|----------|-----------|
| col_name | types     |
| REGION   | character |
| SEED     | character |
| COLLEGE  | character |
| PLAYERS  | character |
| GP       | character |
| MIN      | character |
| FGM      | character |
| FGA      | character |
| FG_PCT   | character |
| FG3M     | character |
| FG3A     | character |
| FG3_PCT  | character |
| FTM      | character |
| FTA      | character |
| FT_PCT   | character |
| OREB     | character |
| DREB     | character |
| REB      | character |
| AST      | character |
| STL      | character |
| BLK      | character |
| TOV      | character |
| PF       | character |
| PTS      | character |

**South**

|          |           |
|----------|-----------|
| col_name | types     |
| REGION   | character |
| SEED     | character |
| COLLEGE  | character |
| PLAYERS  | character |
| GP       | character |
| MIN      | character |
| FGM      | character |
| FGA      | character |
| FG_PCT   | character |
| FG3M     | character |
| FG3A     | character |
| FG3_PCT  | character |
| FTM      | character |
| FTA      | character |
| FT_PCT   | character |
| OREB     | character |
| DREB     | character |
| REB      | character |
| AST      | character |
| STL      | character |
| BLK      | character |
| TOV      | character |
| PF       | character |
| PTS      | character |

**Midwest**

|          |           |
|----------|-----------|
| col_name | types     |
| REGION   | character |
| SEED     | character |
| COLLEGE  | character |
| PLAYERS  | character |
| GP       | character |
| MIN      | character |
| FGM      | character |
| FGA      | character |
| FG_PCT   | character |
| FG3M     | character |
| FG3A     | character |
| FG3_PCT  | character |
| FTM      | character |
| FTA      | character |
| FT_PCT   | character |
| OREB     | character |
| DREB     | character |
| REB      | character |
| AST      | character |
| STL      | character |
| BLK      | character |
| TOV      | character |
| PF       | character |
| PTS      | character |

**West**

|          |           |
|----------|-----------|
| col_name | types     |
| REGION   | character |
| SEED     | character |
| COLLEGE  | character |
| PLAYERS  | character |
| GP       | character |
| MIN      | character |
| FGM      | character |
| FGA      | character |
| FG_PCT   | character |
| FG3M     | character |
| FG3A     | character |
| FG3_PCT  | character |
| FTM      | character |
| FTA      | character |
| FT_PCT   | character |
| OREB     | character |
| DREB     | character |
| REB      | character |
| AST      | character |
| STL      | character |
| BLK      | character |
| TOV      | character |
| PF       | character |
| PTS      | character |

## Details

     wnba_playercareerbycollegerollup(per_mode = 'Totals')

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
[`wnba_playerfantasyprofile()`](https://wehoop.sportsdataverse.org/reference/wnba_playerfantasyprofile.md),
[`wnba_playerfantasyprofilebargraph()`](https://wehoop.sportsdataverse.org/reference/wnba_playerfantasyprofilebargraph.md),
[`wnba_playergamelog()`](https://wehoop.sportsdataverse.org/reference/wnba_playergamelog.md),
[`wnba_playergamelogs()`](https://wehoop.sportsdataverse.org/reference/wnba_playergamelogs.md),
[`wnba_playergamestreakfinder()`](https://wehoop.sportsdataverse.org/reference/wnba_playergamestreakfinder.md),
[`wnba_playerheadshot()`](https://wehoop.sportsdataverse.org/reference/wnba_playerheadshot.md),
[`wnba_playerindex()`](https://wehoop.sportsdataverse.org/reference/wnba_playerindex.md),
[`wnba_playernextngames()`](https://wehoop.sportsdataverse.org/reference/wnba_playernextngames.md),
[`wnba_playerprofilev2()`](https://wehoop.sportsdataverse.org/reference/wnba_playerprofilev2.md),
[`wnba_playervsplayer()`](https://wehoop.sportsdataverse.org/reference/wnba_playervsplayer.md)

## Author

Saiem Gilani
