# **Get WNBA Stats API Team Estimated Metrics**

**Get WNBA Stats API Team Estimated Metrics**

**Get WNBA Stats API Team Estimated Metrics**

## Usage

``` r
wnba_teamestimatedmetrics(
  league_id = "10",
  season = most_recent_wnba_season(),
  season_type = "Regular Season",
  ...
)
```

## Arguments

- league_id:

  League - default: '00'. Other options include '10': WNBA, '20':
  G-League

- season:

  Season - format 2020-21

- season_type:

  Season Type - Regular Season, Playoffs, All-Star

- ...:

  Additional arguments passed to an underlying function like httr.

## Value

Return a named list of data frames: TeamEstimatedMetrics

**TeamEstimatedMetrics**

|  |  |  |
|----|----|----|
| col_name | types | description |
| TEAM_NAME | character | Full team display name (e.g. 'Las Vegas Aces'). |
| TEAM_ID | character | Unique team identifier. |
| GP | character | Games played. |
| W | character | Wins. |
| L | character | Losses. |
| W_PCT | character | Wins percentage (0-1 decimal). |
| MIN | character | Minutes played. |
| E_OFF_RATING | character |  |
| E_DEF_RATING | character |  |
| E_NET_RATING | character |  |
| E_PACE | character |  |
| E_AST_RATIO | character |  |
| E_OREB_PCT | character |  |
| E_DREB_PCT | character |  |
| E_REB_PCT | character |  |
| E_TM_TOV_PCT | character |  |
| GP_RANK | character |  |
| W_RANK | character |  |
| L_RANK | character |  |
| W_PCT_RANK | character |  |
| MIN_RANK | character |  |
| E_OFF_RATING_RANK | character |  |
| E_DEF_RATING_RANK | character |  |
| E_NET_RATING_RANK | character |  |
| E_AST_RATIO_RANK | character |  |
| E_OREB_PCT_RANK | character |  |
| E_DREB_PCT_RANK | character |  |
| E_REB_PCT_RANK | character |  |
| E_TM_TOV_PCT_RANK | character |  |
| E_PACE_RANK | character |  |

## Details

     wnba_teamestimatedmetrics()

## See also

Other WNBA Team Functions:
[`wnba_leaguedashteamstats()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguedashteamstats.md),
[`wnba_teamdashboardbyclutch()`](https://wehoop.sportsdataverse.org/reference/wnba_teamdashboardbyclutch.md),
[`wnba_teamdashlineups()`](https://wehoop.sportsdataverse.org/reference/wnba_teamdashlineups.md),
[`wnba_teamdetails()`](https://wehoop.sportsdataverse.org/reference/wnba_teamdetails.md),
[`wnba_teamgamelog()`](https://wehoop.sportsdataverse.org/reference/wnba_teamgamelog.md),
[`wnba_teamgamelogs()`](https://wehoop.sportsdataverse.org/reference/wnba_teamgamelogs.md),
[`wnba_teamgamestreakfinder()`](https://wehoop.sportsdataverse.org/reference/wnba_teamgamestreakfinder.md),
[`wnba_teamhistoricalleaders()`](https://wehoop.sportsdataverse.org/reference/wnba_teamhistoricalleaders.md),
[`wnba_teaminfocommon()`](https://wehoop.sportsdataverse.org/reference/wnba_teaminfocommon.md),
[`wnba_teamplayeronoffdetails()`](https://wehoop.sportsdataverse.org/reference/wnba_teamplayerdashboard.md),
[`wnba_teams()`](https://wehoop.sportsdataverse.org/reference/wnba_teams.md),
[`wnba_teamvsplayer()`](https://wehoop.sportsdataverse.org/reference/wnba_teamvsplayer.md),
[`wnba_teamyearbyyearstats()`](https://wehoop.sportsdataverse.org/reference/wnba_teamyearbyyearstats.md)

## Author

Saiem Gilani
