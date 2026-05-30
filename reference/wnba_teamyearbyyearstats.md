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

|  |  |  |
|----|----|----|
| col_name | types | description |
| TEAM_ID | character | Unique team identifier. |
| TEAM_CITY | character | Team city or region (e.g. 'Las Vegas'). |
| TEAM_NAME | character | Full team display name (e.g. 'Las Vegas Aces'). |
| YEAR | character | 4-digit year. |
| GP | character | Games played. |
| WINS | character | Total wins. |
| LOSSES | character | Total losses. |
| WIN_PCT | character | Win percentage (0-1 decimal). |
| CONF_RANK | character |  |
| DIV_RANK | character |  |
| PO_WINS | character |  |
| PO_LOSSES | character |  |
| CONF_COUNT | character |  |
| DIV_COUNT | character |  |
| NBA_FINALS_APPEARANCE | character |  |
| FGM | character | Field goals made. |
| FGA | character | Field goal attempts. |
| FG_PCT | character | Field goal percentage (0-1). |
| FG3M | character | Three-point field goals made. |
| FG3A | character | Three-point field goal attempts. |
| FG3_PCT | character | Three-point field goal percentage (0-1). |
| FTM | character | Free throws made. |
| FTA | character | Free throw attempts. |
| FT_PCT | character | Free throw percentage (0-1). |
| OREB | character | Offensive rebounds. |
| DREB | character | Defensive rebounds. |
| REB | character | Total rebounds. |
| AST | character | Assists. |
| PF | character | Personal fouls. |
| STL | character | Steals. |
| TOV | character | Turnovers. |
| BLK | character | Blocks. |
| PTS | character | Points scored. |
| PTS_RANK | character |  |

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
[`wnba_teaminfocommon()`](https://wehoop.sportsdataverse.org/reference/wnba_teaminfocommon.md),
[`wnba_teamplayerdashboard()`](https://wehoop.sportsdataverse.org/reference/wnba_teamplayerdashboard.md),
[`wnba_teamplayeronoffdetails()`](https://wehoop.sportsdataverse.org/reference/wnba_teamplayeronoffdetails.md),
[`wnba_teamplayeronoffsummary()`](https://wehoop.sportsdataverse.org/reference/wnba_teamplayeronoffsummary.md),
[`wnba_teams()`](https://wehoop.sportsdataverse.org/reference/wnba_teams.md),
[`wnba_teamvsplayer()`](https://wehoop.sportsdataverse.org/reference/wnba_teamvsplayer.md)

## Author

Saiem Gilani
