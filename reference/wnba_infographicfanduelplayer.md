# **Get WNBA Stats API FanDuel Player Infographic**

**Get WNBA Stats API FanDuel Player Infographic**

**Get WNBA Stats API FanDuel Player Infographic**

## Usage

``` r
wnba_infographicfanduelplayer(game_id, ...)
```

## Arguments

- game_id:

  game_id

- ...:

  Additional arguments passed to an underlying function like httr.

## Value

Return a named list of data frames: FanDuelPlayer

**FanDuelPlayer**

|  |  |  |
|----|----|----|
| col_name | types | description |
| PLAYER_ID | character | Unique player identifier. |
| PLAYER_NAME | character | Player name. |
| TEAM_ID | character | Unique team identifier. |
| TEAM_NAME | character | Full team display name (e.g. 'Las Vegas Aces'). |
| TEAM_ABBREVIATION | character | Short team abbreviation (e.g. 'LAS'). |
| JERSEY_NUM | character | Jersey number worn by the player. |
| PLAYER_POSITION | character |  |
| LOCATION | character | Filter results by game location. |
| FAN_DUEL_PTS | character |  |
| WNBA_FANTASY_PTS | character |  |
| USG_PCT | character | Usage percentage (0-1). |
| MIN | character | Minutes played. |
| FGM | character | Field goals made. |
| FGA | character | Field goal attempts. |
| FG_PCT | character | Field goal percentage (0-1). |
| FG3M | character | Three-point field goals made. |
| FG3A | character | Three-point field goal attempts. |
| FG3_PCT | character | Three-point field goal percentage (0-1). |
| FTM | character | Free throws made. |
| FTA | character | Free throw attempts. |
| FT_PCT | character | Free throw percentage (0-1). |
| OREB | character | Offensive rebounds. |
| DREB | character | Defensive rebounds. |
| REB | character | Total rebounds. |
| AST | character | Assists. |
| TOV | character | Turnovers. |
| STL | character | Steals. |
| BLK | character | Blocks. |
| BLKA | character |  |
| PF | character | Personal fouls. |
| PFD | character |  |
| PTS | character | Points scored. |
| PLUS_MINUS | character | Plus/minus point differential while on court. |

## Details

     wnba_infographicfanduelplayer(game_id = "1022200034")

## See also

[family_wnba_player](https://wehoop.sportsdataverse.org/reference/family_wnba_player.md)
lists every function in this family.

Other WNBA Fantasy Functions:
[`wnba_fantasywidget()`](https://wehoop.sportsdataverse.org/reference/wnba_fantasywidget.md),
[`wnba_playerfantasyprofile()`](https://wehoop.sportsdataverse.org/reference/wnba_playerfantasyprofile.md),
[`wnba_playerfantasyprofilebargraph()`](https://wehoop.sportsdataverse.org/reference/wnba_playerfantasyprofilebargraph.md)

## Author

Saiem Gilani
