# **Get WNBA Stats API Player Next N Games**

**Get WNBA Stats API Player Next N Games**

**Get WNBA Stats API Player Next N Games**

## Usage

``` r
wnba_playernextngames(
  league_id = "10",
  number_of_games = 2147483647,
  player_id = "1628932",
  season = most_recent_wnba_season() - 1,
  season_type = "Regular Season",
  ...
)
```

## Arguments

- league_id:

  League - default: '00'. Other options include '10': WNBA, '20':
  G-League

- number_of_games:

  N in number of games

- player_id:

  Player ID

- season:

  Season - format 2020-21

- season_type:

  Season Type - Regular Season, Playoffs, All-Star

- ...:

  Additional arguments passed to an underlying function like httr.

## Value

Return a named list of data frames: NextNGames

**NextNGames**

|                           |           |                                      |
|---------------------------|-----------|--------------------------------------|
| col_name                  | types     | description                          |
| GAME_ID                   | character | Unique game identifier.              |
| GAME_DATE                 | character | Game date (YYYY-MM-DD).              |
| HOME_TEAM_ID              | character | Unique identifier for the home team. |
| VISITOR_TEAM_ID           | character | Unique identifier for visitor team.  |
| HOME_TEAM_NAME            | character | Home team name.                      |
| VISITOR_TEAM_NAME         | character |                                      |
| HOME_TEAM_ABBREVIATION    | character |                                      |
| VISITOR_TEAM_ABBREVIATION | character |                                      |
| HOME_TEAM_NICKNAME        | character |                                      |
| VISITOR_TEAM_NICKNAME     | character |                                      |
| GAME_TIME                 | character | Game start time.                     |
| HOME_WL                   | character |                                      |
| VISITOR_WL                | character |                                      |

## Details

      wnba_playernextngames(player_id = '1628932', season = most_recent_wnba_season() - 1)

## See also

[family_wnba_player](https://wehoop.sportsdataverse.org/reference/family_wnba_player.md)
lists every function in this family.

## Author

Saiem Gilani
