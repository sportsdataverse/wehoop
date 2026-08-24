# **Get WNBA Stats API Teams**

**Get WNBA Stats API Teams**

**Get WNBA Stats API Teams**

## Usage

``` r
wnba_teams(...)
```

## Arguments

- ...:

  Additional arguments passed to an underlying function like httr.

## Value

Return a data frame with the following columns:

|  |  |  |
|----|----|----|
| col_name | types | description |
| league_id | character | League identifier ('10' = WNBA). |
| season_id | character | Unique season identifier. |
| team_id | character | Unique team identifier. |
| team_city | character | Team city or region (e.g. 'Las Vegas'). |
| team_name | character | Full team display name (e.g. 'Las Vegas Aces'). |
| team_slug | character | URL-safe team identifier (e.g. 'lasvegas-aces' / 'aces'). |
| conference | character | Filter players or teams by conference. |
| division | character | Team division. |
| team_abbreviation | character | Short team abbreviation (e.g. 'LAS'). |
| team_name_full | character | Team name full. |
| season | character | Season identifier (4-digit year or 'YYYY-YY' string). |
| espn_team_id | integer | Unique identifier for espn team. |
| team | character | Team-side label or team identifier. |
| mascot | character | Team mascot. |
| display_name | character | Display name. |
| abbreviation | character | Short abbreviation. |
| color | character | Primary color (hex without leading '#'). |
| alternate_color | character | Alternate color (hex without leading '#'). |
| logo | character | Team or league logo URL. |
| logo_dark | character | Logo dark. |
| wnba_logo_svg | character | Wnba logo svg. |

## Details

     wnba_teams()

## See also

Other WNBA Team Functions:
[`wnba_leaguedashteamstats()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguedashteamstats.md),
[`wnba_teamdashboardbyclutch()`](https://wehoop.sportsdataverse.org/reference/wnba_teamdashboardbyclutch.md),
[`wnba_teamdashlineups()`](https://wehoop.sportsdataverse.org/reference/wnba_teamdashlineups.md),
[`wnba_teamdetails()`](https://wehoop.sportsdataverse.org/reference/wnba_teamdetails.md),
[`wnba_teamestimatedmetrics()`](https://wehoop.sportsdataverse.org/reference/wnba_teamestimatedmetrics.md),
[`wnba_teamgamelog()`](https://wehoop.sportsdataverse.org/reference/wnba_teamgamelog.md),
[`wnba_teamgamelogs()`](https://wehoop.sportsdataverse.org/reference/wnba_teamgamelogs.md),
[`wnba_teamgamestreakfinder()`](https://wehoop.sportsdataverse.org/reference/wnba_teamgamestreakfinder.md),
[`wnba_teamhistoricalleaders()`](https://wehoop.sportsdataverse.org/reference/wnba_teamhistoricalleaders.md),
[`wnba_teaminfocommon()`](https://wehoop.sportsdataverse.org/reference/wnba_teaminfocommon.md),
[`wnba_teamplayeronoffdetails()`](https://wehoop.sportsdataverse.org/reference/wnba_teamplayerdashboard.md),
[`wnba_teamvsplayer()`](https://wehoop.sportsdataverse.org/reference/wnba_teamvsplayer.md),
[`wnba_teamyearbyyearstats()`](https://wehoop.sportsdataverse.org/reference/wnba_teamyearbyyearstats.md)

## Author

Saiem Gilani
