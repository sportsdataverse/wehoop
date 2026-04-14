# **Get WNBA Stats API Team Year by Year Stats**

**Get WNBA Stats API Team Year by Year Stats**

**Get WNBA Stats API Team Year by Year Stats**

## Usage

``` r
wnba_teamyearbyyearstats(
  league_id = "10",
  per_mode = "Totals",
  season_type = "Regular Season",
  team_id = "1611661328",
  ...
)
```

## Arguments

- league_id:

  League - default: '00'. Other options include '10': WNBA, '20':
  G-League

- per_mode:

  Per Mode

- season_type:

  Season Type - Regular Season, Playoffs, All-Star

- team_id:

  Team ID

- ...:

  Additional arguments passed to an underlying function like httr.

## Value

Return a named list of data frames: TeamStats

**TeamStats**

|                       |           |
|-----------------------|-----------|
| col_name              | types     |
| TEAM_ID               | character |
| TEAM_CITY             | character |
| TEAM_NAME             | character |
| YEAR                  | character |
| GP                    | character |
| WINS                  | character |
| LOSSES                | character |
| WIN_PCT               | character |
| CONF_RANK             | character |
| DIV_RANK              | character |
| PO_WINS               | character |
| PO_LOSSES             | character |
| CONF_COUNT            | character |
| DIV_COUNT             | character |
| NBA_FINALS_APPEARANCE | character |
| FGM                   | character |
| FGA                   | character |
| FG_PCT                | character |
| FG3M                  | character |
| FG3A                  | character |
| FG3_PCT               | character |
| FTM                   | character |
| FTA                   | character |
| FT_PCT                | character |
| OREB                  | character |
| DREB                  | character |
| REB                   | character |
| AST                   | character |
| PF                    | character |
| STL                   | character |
| TOV                   | character |
| BLK                   | character |
| PTS                   | character |
| PTS_RANK              | character |

## Details

     wnba_teamyearbyyearstats(team_id = '1611661328')

## See also

Other WNBA Team Functions:
[`wnba_leaguedashteamstats()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguedashteamstats.md),
[`wnba_teamdashboardbyclutch()`](https://wehoop.sportsdataverse.org/reference/wnba_teamdashboardbyclutch.md),
[`wnba_teamdashboardbygamesplits()`](https://wehoop.sportsdataverse.org/reference/wnba_teamdashboardbygamesplits.md),
[`wnba_teamdashboardbygeneralsplits()`](https://wehoop.sportsdataverse.org/reference/wnba_teamdashboardbygeneralsplits.md),
[`wnba_teamdashboardbylastngames()`](https://wehoop.sportsdataverse.org/reference/wnba_teamdashboardbylastngames.md),
[`wnba_teamdashboardbyopponent()`](https://wehoop.sportsdataverse.org/reference/wnba_teamdashboardbyopponent.md),
[`wnba_teamdashboardbyshootingsplits()`](https://wehoop.sportsdataverse.org/reference/wnba_teamdashboardbyshootingsplits.md),
[`wnba_teamdashboardbyteamperformance()`](https://wehoop.sportsdataverse.org/reference/wnba_teamdashboardbyteamperformance.md),
[`wnba_teamdashboardbyyearoveryear()`](https://wehoop.sportsdataverse.org/reference/wnba_teamdashboardbyyearoveryear.md),
[`wnba_teamdashlineups()`](https://wehoop.sportsdataverse.org/reference/wnba_teamdashlineups.md),
[`wnba_teamdetails()`](https://wehoop.sportsdataverse.org/reference/wnba_teamdetails.md),
[`wnba_teamestimatedmetrics()`](https://wehoop.sportsdataverse.org/reference/wnba_teamestimatedmetrics.md),
[`wnba_teamgamelog()`](https://wehoop.sportsdataverse.org/reference/wnba_teamgamelog.md),
[`wnba_teamgamelogs()`](https://wehoop.sportsdataverse.org/reference/wnba_teamgamelogs.md),
[`wnba_teamgamestreakfinder()`](https://wehoop.sportsdataverse.org/reference/wnba_teamgamestreakfinder.md),
[`wnba_teamhistoricalleaders()`](https://wehoop.sportsdataverse.org/reference/wnba_teamhistoricalleaders.md),
[`wnba_teamplayerdashboard()`](https://wehoop.sportsdataverse.org/reference/wnba_teamplayerdashboard.md),
[`wnba_teamplayeronoffdetails()`](https://wehoop.sportsdataverse.org/reference/wnba_teamplayeronoffdetails.md),
[`wnba_teamplayeronoffsummary()`](https://wehoop.sportsdataverse.org/reference/wnba_teamplayeronoffsummary.md),
[`wnba_teams()`](https://wehoop.sportsdataverse.org/reference/wnba_teams.md),
[`wnba_teamvsplayer()`](https://wehoop.sportsdataverse.org/reference/wnba_teamvsplayer.md)

## Author

Saiem Gilani
