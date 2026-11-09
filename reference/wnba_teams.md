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

[family_wnba_team](https://wehoop.sportsdataverse.org/reference/family_wnba_team.md)
lists every function in this family.

## Author

Saiem Gilani
