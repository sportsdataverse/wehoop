# Shared column schema: espn basketball game officials schema

Columns shared verbatim across: espn_wbb_game_officials,
espn_wnba_game_officials.

## Details

|  |  |  |
|----|----|----|
| col_name | types | description |
| event_id | character | Unique event / game identifier (ESPN). |
| official_id | character | Unique official / referee identifier. |
| full_name | character | Player's full name. |
| display_name | character | Display name. |
| position_id | character | Unique position identifier. |
| position_name | character | Listed roster position ('Guard', 'Forward', 'Center'). |
| position_type | character | Position type. |
| order | integer | Display order within the result set. |
