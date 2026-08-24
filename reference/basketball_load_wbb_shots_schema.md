# Shared column schema: basketball load wbb shots schema

Columns shared verbatim across: load_wbb_shots, load_wnba_shots.

## Details

|  |  |  |
|----|----|----|
| col_name | types | description |
| game_id | character | Unique game identifier. |
| season | integer | Season identifier (4-digit year or 'YYYY-YY' string). |
| period_number | integer | Numeric period (1-4 for quarters; 5+ for OT). |
| clock_display_value | character | Game clock display string (e.g. '8:32'). |
| team_id | character | Unique team identifier. |
| athlete_id_1 | character | Primary athlete identifier (e.g. shooter). |
| athlete_id_2 | character | Secondary athlete identifier (e.g. assister / fouler). |
| type_id | character | Type identifier (numeric). |
| type_text | character | Display text for the type field. |
| scoring_play | logical | TRUE if the play resulted in points scored. |
| score_value | integer | Point value of the play (2 / 3 / 1). |
| coordinate_x | numeric | X coordinate on the court (half-court layout). |
| coordinate_y | numeric | Y coordinate on the court (half-court layout). |
| coordinate_x_raw | numeric | X coordinate as returned by the API before any adjustment. |
| coordinate_y_raw | numeric | Y coordinate as returned by the API before any adjustment. |
