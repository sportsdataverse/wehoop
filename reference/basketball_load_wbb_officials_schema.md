# Shared column schema: basketball load wbb officials schema

Columns shared verbatim across: load_wbb_officials, load_wnba_officials.

## Details

|  |  |  |
|----|----|----|
| col_name | types | description |
| game_id | character | Unique game identifier. |
| season | integer | Season identifier (4-digit year or 'YYYY-YY' string). |
| official_id | character | Unique official / referee identifier. |
| display_name | character | Display name. |
| full_name | character | Player's full name. |
| first_name | character | Player's first name. |
| last_name | character | Player's last name. |
| position | character | Listed roster position (G, F, C, etc.). |
| order | integer | Display order within the result set. |
