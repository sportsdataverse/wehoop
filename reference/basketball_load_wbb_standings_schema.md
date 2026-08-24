# Shared column schema: basketball load wbb standings schema

Columns shared verbatim across: load_wbb_standings, load_wnba_standings.

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
| conference_id | character | Conference identifier. |
| conference_name | character | Full conference name. |
| wins | integer | Total wins. |
| losses | integer | Total losses. |
| win_percent | numeric | Win percent. |
| games_played | integer | Games played. |
| points_for | numeric | Points for. |
| points_against | numeric | Points allowed. |
| point_differential | numeric | Point differential. |
| streak | character | Current streak (e.g. 'W3' for three-game win streak). |
