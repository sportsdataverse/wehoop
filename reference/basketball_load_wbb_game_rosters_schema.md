# Shared column schema: basketball load wbb game rosters schema

Columns shared verbatim across: load_wbb_game_rosters,
load_wnba_game_rosters.

## Details

|  |  |  |
|----|----|----|
| col_name | types | description |
| game_id | character | Unique game identifier. |
| season | integer | Season identifier (4-digit year or 'YYYY-YY' string). |
| team_id | character | Unique team identifier. |
| athlete_id | character | Unique athlete identifier (ESPN). |
| athlete_display_name | character | Athlete display name (full). |
| athlete_position | character | Athlete position. |
| athlete_jersey | character | Athlete jersey number. |
| starter | logical | TRUE if the player was in the starting lineup; FALSE otherwise. |
| did_not_play | logical | TRUE if the player did not appear in the game. |
