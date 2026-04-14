# **Get WNBA Stats API Fantasy Widget**

**Get WNBA Stats API Fantasy Widget**

**Get WNBA Stats API Fantasy Widget**

## Usage

``` r
wnba_fantasywidget(
  active_players = "N",
  date_from = "",
  date_to = "",
  last_n_games = 0,
  league_id = "10",
  location = "",
  month = "",
  opponent_team_id = "",
  po_round = "",
  player_id = "",
  position = "",
  season = most_recent_wnba_season() - 1,
  season_segment = "",
  season_type = "Regular Season",
  team_id = "",
  todays_opponent = 0,
  todays_players = "N",
  vs_conference = "",
  vs_division = "",
  ...
)
```

## Arguments

- active_players:

  active_players

- date_from:

  date_from date_from

- date_to:

  date_to date_to

- last_n_games:

  last_n_games

- league_id:

  league_id

- location:

  location

- month:

  month

- opponent_team_id:

  opponent_team_id

- po_round:

  po_round

- player_id:

  player_id

- position:

  position

- season:

  season

- season_segment:

  season_segment

- season_type:

  season_type

- team_id:

  team_id

- todays_opponent:

  todays_opponent

- todays_players:

  todays_players

- vs_conference:

  vs_conference

- vs_division:

  vs_division

- ...:

  Additional arguments passed to an underlying function like httr.

## Value

Returns a named list of data frames: FantasyWidgetResult

**FantasyWidgetResult**

|                   |           |
|-------------------|-----------|
| col_name          | types     |
| PLAYER_ID         | character |
| PLAYER_NAME       | character |
| PLAYER_POSITION   | character |
| TEAM_ID           | character |
| TEAM_ABBREVIATION | character |
| GP                | character |
| MIN               | character |
| FAN_DUEL_PTS      | character |
| NBA_FANTASY_PTS   | character |
| PTS               | character |
| REB               | character |
| AST               | character |
| BLK               | character |
| STL               | character |
| TOV               | character |
| FG3M              | character |
| FGA               | character |
| FG_PCT            | character |
| FTA               | character |
| FT_PCT            | character |

## Details

     wnba_fantasywidget(league_id = '10', season = most_recent_wnba_season() - 1)

## See also

Other WNBA Fantasy Functions:
[`wnba_infographicfanduelplayer()`](https://wehoop.sportsdataverse.org/reference/wnba_infographicfanduelplayer.md),
[`wnba_playerfantasyprofile()`](https://wehoop.sportsdataverse.org/reference/wnba_playerfantasyprofile.md),
[`wnba_playerfantasyprofilebargraph()`](https://wehoop.sportsdataverse.org/reference/wnba_playerfantasyprofilebargraph.md)

## Author

Saiem Gilani
