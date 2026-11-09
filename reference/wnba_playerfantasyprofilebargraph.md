# **Get WNBA Stats API Player Fantasy Profile Bar Graph**

**Get WNBA Stats API Player Fantasy Profile Bar Graph**

**Get WNBA Stats API Player Fantasy Profile Bar Graph**

## Usage

``` r
wnba_playerfantasyprofilebargraph(
  league_id = "10",
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

- player_id:

  Player ID

- season:

  Season - format 2020-21

- season_type:

  Season Type - Regular Season, Playoffs, All-Star

- ...:

  Additional arguments passed to an underlying function like httr.

## Value

Return a named list of data frames: LastFiveGamesAvg, SeasonAvg

**SeasonAvg**

|                   |           |                                       |
|-------------------|-----------|---------------------------------------|
| col_name          | types     | description                           |
| PLAYER_ID         | character | Unique player identifier.             |
| PLAYER_NAME       | character | Player name.                          |
| TEAM_ID           | character | Unique team identifier.               |
| TEAM_ABBREVIATION | character | Short team abbreviation (e.g. 'LAS'). |
| FAN_DUEL_PTS      | character |                                       |
| NBA_FANTASY_PTS   | character |                                       |
| PTS               | character | Points scored.                        |
| REB               | character | Total rebounds.                       |
| AST               | character | Assists.                              |
| FG3M              | character | Three-point field goals made.         |
| FT_PCT            | character | Free throw percentage (0-1).          |
| STL               | character | Steals.                               |
| BLK               | character | Blocks.                               |
| TOV               | character | Turnovers.                            |
| FG_PCT            | character | Field goal percentage (0-1).          |

**LastFiveGamesAvg**

Same columns as the **SeasonAvg** table above.

## Details

      wnba_playerfantasyprofilebargraph(player_id = '1628932')

## See also

[family_wnba_player](https://wehoop.sportsdataverse.org/reference/family_wnba_player.md)
lists every function in this family.

Other WNBA Fantasy Functions:
[`wnba_fantasywidget()`](https://wehoop.sportsdataverse.org/reference/wnba_fantasywidget.md),
[`wnba_infographicfanduelplayer()`](https://wehoop.sportsdataverse.org/reference/wnba_infographicfanduelplayer.md),
[`wnba_playerfantasyprofile()`](https://wehoop.sportsdataverse.org/reference/wnba_playerfantasyprofile.md)

## Author

Saiem Gilani
