# Shared column schema: basketball load wbb team stats schema

Columns shared verbatim across: load_wbb_team_stats,
load_wnba_team_stats.

## Details

|  |  |  |
|----|----|----|
| col_name | types | description |
| season | integer | Season identifier (4-digit year or 'YYYY-YY' string). |
| season_type | integer | Season type (1=pre-season, 2=regular season, 3=postseason, 4=off-season for ESPN; or string label for WNBA Stats). |
| team_id | character | Unique team identifier. |
| team_slug | character | URL-safe team identifier (e.g. 'lasvegas-aces' / 'aces'). |
| team_location | character | Team city or location string. |
| team_name | character | Full team display name (e.g. 'Las Vegas Aces'). |
| team_abbreviation | character | Short team abbreviation (e.g. 'LAS'). |
| team_display_name | character | Full team display name. |
| category | character | Category label. |
| stat_name | character | Stat name. |
| stat_display_name | character | Stat display name. |
| stat_value | numeric | Stat value. |
| stat_display_value | character | Stat display value. |
| stat_rank | integer | League/season rank for stat. |
