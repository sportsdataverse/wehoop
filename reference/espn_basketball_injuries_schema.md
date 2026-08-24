# Shared column schema: espn basketball injuries schema

Columns shared verbatim across: espn_wbb_injuries, espn_wnba_injuries.

## Details

|  |  |  |
|----|----|----|
| col_name | types | description |
| team_id | character | Unique team identifier. |
| athlete_id | character | Unique athlete identifier (ESPN). |
| athlete_name | character | Athlete display name (ESPN). |
| position | character | Listed roster position (G, F, C, etc.). |
| status | character | Status label. |
| date | character | Date in YYYY-MM-DD format. |
| type | character | Record type / category. |
| side | character | Side label (e.g. 'home', 'away', or 'overUnder'). |
| returns_at | character | Returns at. |
| short_comment | character | Short comment. |
| long_comment | character | Long-form play / event comment. |
| season | integer | Season identifier (4-digit year or 'YYYY-YY' string). |
