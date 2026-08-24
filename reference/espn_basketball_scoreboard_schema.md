# Shared column schema: espn basketball scoreboard schema

Columns shared verbatim across: espn_wbb_scoreboard,
espn_wnba_scoreboard.

## Details

|  |  |  |
|----|----|----|
| col_name | types | description |
| matchup | character | Matchup. |
| matchup_short | character | Matchup short. |
| season | integer | Season identifier (4-digit year or 'YYYY-YY' string). |
| season_type | integer | Season type (1=pre-season, 2=regular season, 3=postseason, 4=off-season for ESPN; or string label for WNBA Stats). |
| season_slug | character | Season slug. |
| game_id | integer | Unique game identifier. |
| game_uid | character | Game uid. |
| game_date | Date | Game date (YYYY-MM-DD). |
| attendance | integer | Reported attendance. |
| status_name | character | Status label. |
| broadcast_market | character | Broadcast market label (e.g. 'national', 'home'). |
| broadcast_name | character | Broadcast name. |
| start_date | character | Start date (YYYY-MM-DD). |
| game_date_time | POSIXct | Game start date/time (ISO 8601). |
| home_team_name | character | Home team name. |
| home_team_logo | character | Home team logo URL. |
| home_team_abb | character | Home team's team abb. |
| home_team_id | integer | Unique identifier for the home team. |
| home_team_location | character | Home team's team location. |
| home_team_full_name | character | Full home team name (e.g. 'Las Vegas Aces'). |
| home_team_color | character | Home team primary color (hex). |
| home_score | integer | Home team score at the time of the play. |
| home_win | integer | Home team's win. |
| home_record | character | Home win-loss record. |
| away_team_name | character | Away team name. |
| away_team_logo | character | Away team logo URL. |
| away_team_abb | character | Away team's team abb. |
| away_team_id | integer | Unique identifier for the away team. |
| away_team_location | character | Away team's team location. |
| away_team_full_name | character | Full away team name (e.g. 'Las Vegas Aces'). |
| away_team_color | character | Away team primary color (hex). |
| away_score | integer | Away team score at the time of the play. |
| away_win | integer | Away team's win. |
| away_record | character | Away win-loss record. |
