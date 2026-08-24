# Shared column schema: espn basketball team leaders schema

Columns shared verbatim across: espn_wbb_team_leaders,
espn_wnba_team_leaders.

## Details

|  |  |  |
|----|----|----|
| col_name | types | description |
| team_id | character | Unique team identifier. |
| season | integer | Season identifier (4-digit year or 'YYYY-YY' string). |
| category | character | Category label. |
| display_name | character | Display name. |
| athlete_id | character | Unique athlete identifier (ESPN). |
| athlete_name | character | Athlete display name (ESPN). |
| value | numeric | Numeric or string value field. |
| rank | integer | Whether to include statistical ranks in the returned table. |
