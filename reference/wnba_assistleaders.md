# **Get WNBA Stats API Assist Leaders**

**Get WNBA Stats API Assist Leaders**

**Get WNBA Stats API Assist Leaders**

## Usage

``` r
wnba_assistleaders(
  league_id = "10",
  per_mode = "PerGame",
  player_or_team = "Team",
  season = most_recent_wnba_season() - 1,
  season_type = "Regular Season",
  ...
)
```

## Arguments

- league_id:

  League - default: '00'. Other options include '10': WWNBA, '20':
  G-League

- per_mode:

  Per Mode - PerGame, Totals

- player_or_team:

  Player or Team

- season:

  Season - format 2020-21

- season_type:

  Season Type - Regular Season, Playoffs, All-Star

- ...:

  Additional arguments passed to an underlying function like httr.

## Value

Returns a named list of data frames: AssistLeaders

**AssistLeaders**

|  |  |  |
|----|----|----|
| col_name | types | description |
| RANK | character | Whether to include statistical ranks in the returned table. |
| PLAYER_ID | character | Unique player identifier. |
| PLAYER | character |  |
| TEAM_ID | character | Unique team identifier. |
| TEAM_ABBREVIATION | character | Short team abbreviation (e.g. 'LAS'). |
| TEAM_NAME | character | Full team display name (e.g. 'Las Vegas Aces'). |
| JERSEY_NUM | character | Jersey number worn by the player. |
| PLAYER_POSITION | character |  |
| AST | character | Assists. |

## Details

     wnba_assistleaders(league_id = '10', player_or_team = "Player")
     wnba_assistleaders(league_id = '10', player_or_team = "Team")

## See also

Other WNBA Leaders Functions:
[`wnba_alltimeleadersgrids()`](https://wehoop.sportsdataverse.org/reference/wnba_alltimeleadersgrids.md),
[`wnba_assisttracker()`](https://wehoop.sportsdataverse.org/reference/wnba_assisttracker.md),
[`wnba_homepagewidget()`](https://wehoop.sportsdataverse.org/reference/wnba_homepagewidget.md),
[`wnba_leagueleaders()`](https://wehoop.sportsdataverse.org/reference/wnba_leagueleaders.md)

## Author

Saiem Gilani
