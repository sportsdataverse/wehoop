# **Get WNBA Stats API League Game Log**

**Get WNBA Stats API League Game Log**

**Get WNBA Stats API League Game Log**

## Usage

``` r
wnba_leaguegamelog(
  counter = 0,
  date_from = "",
  date_to = "",
  direction = "ASC",
  league_id = "10",
  player_or_team = "T",
  season = most_recent_wnba_season() - 1,
  season_type = "Regular Season",
  sorter = "DATE",
  ...
)
```

## Arguments

- counter:

  counter

- date_from:

  date_from

- date_to:

  date_to

- direction:

  direction

- league_id:

  league_id. Default `'10'` (WNBA). Use `'00'` for NBA or `'20'` for
  G-League data on the same endpoint.

- player_or_team:

  player_or_team

- season:

  season

- season_type:

  season_type

- sorter:

  sorter

- ...:

  Additional arguments passed to an underlying function like httr.

## Value

Return a named list of data frames: LeagueGameLog

**LeagueGameLog**

|  |  |  |
|----|----|----|
| col_name | types | description |
| SEASON_ID | character | Unique season identifier. |
| TEAM_ID | character | Unique team identifier. |
| TEAM_ABBREVIATION | character | Short team abbreviation (e.g. 'LAS'). |
| TEAM_NAME | character | Full team display name (e.g. 'Las Vegas Aces'). |
| GAME_ID | character | Unique game identifier. |
| GAME_DATE | character | Game date (YYYY-MM-DD). |
| MATCHUP | character | Matchup. |
| WL | character |  |
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
| STL | character | Steals. |
| BLK | character | Blocks. |
| TOV | character | Turnovers. |
| PF | character | Personal fouls. |
| PTS | character | Points scored. |
| PLUS_MINUS | character | Plus/minus point differential while on court. |
| VIDEO_AVAILABLE | character | Video available. |

## Details

[Player/Team
Boxscores](https://stats.wnba.com/players/boxscores-traditional/)

      wnba_leaguegamelog(league_id = '10', season = most_recent_wnba_season() - 1)

## See also

Other WNBA League Functions:
[`wnba_leaguedashlineups()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguedashlineups.md),
[`wnba_leaguedashplayerbiostats()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguedashplayerbiostats.md),
[`wnba_leaguedashplayerclutch()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguedashplayerclutch.md),
[`wnba_leaguedashplayershotlocations()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguedashplayershotlocations.md),
[`wnba_leaguedashplayerstats()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguedashplayerstats.md),
[`wnba_leaguedashteamclutch()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguedashteamclutch.md),
[`wnba_leaguedashteamshotlocations()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguedashteamshotlocations.md),
[`wnba_leaguedashteamstats()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguedashteamstats.md),
[`wnba_leaguegamefinder()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguegamefinder.md),
[`wnba_leaguelineupviz()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguelineupviz.md),
[`wnba_leagueplayerondetails()`](https://wehoop.sportsdataverse.org/reference/wnba_leagueplayerondetails.md),
[`wnba_leagueseasonmatchups()`](https://wehoop.sportsdataverse.org/reference/wnba_leagueseasonmatchups.md),
[`wnba_leaguestandingsv3()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguestandingsv3.md),
[`wnba_shotchartleaguewide()`](https://wehoop.sportsdataverse.org/reference/wnba_shotchartleaguewide.md)

## Author

Saiem Gilani
