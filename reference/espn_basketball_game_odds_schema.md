# Shared column schema: espn basketball game odds schema

Columns shared verbatim across: espn_wbb_game_odds, espn_wnba_game_odds.

## Details

|                      |           |                                        |
|----------------------|-----------|----------------------------------------|
| col_name             | types     | description                            |
| event_id             | character | Unique event / game identifier (ESPN). |
| provider_id          | character | Unique identifier for provider.        |
| provider_name        | character | Provider name.                         |
| details              | character | Details.                               |
| over_under           | numeric   | Over under.                            |
| spread               | numeric   | Spread.                                |
| home_money_line      | integer   | Home team's money line.                |
| away_money_line      | integer   | Away team's money line.                |
| home_team_odds_open  | numeric   | Home team's team odds open.            |
| home_team_odds_close | numeric   | Home team's team odds close.           |
| away_team_odds_open  | numeric   | Away team's team odds open.            |
| away_team_odds_close | numeric   | Away team's team odds close.           |
