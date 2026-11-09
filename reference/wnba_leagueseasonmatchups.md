# **Get WNBA Stats API League Season Matchups**

**Get WNBA Stats API League Season Matchups**

**Get WNBA Stats API League Season Matchups**

## Usage

``` r
wnba_leagueseasonmatchups(
  def_player_id = "",
  def_team_id = "",
  league_id = "10",
  off_player_id = "",
  off_team_id = "",
  per_mode = "Totals",
  season = most_recent_wnba_season() - 1,
  season_type = "Regular Season",
  ...
)
```

## Arguments

- def_player_id:

  def_player_id

- def_team_id:

  def_team_id

- league_id:

  league_id

- off_player_id:

  off_player_id

- off_team_id:

  off_team_id

- per_mode:

  per_mode

- season:

  season

- season_type:

  season_type

- ...:

  Additional arguments passed to an underlying function like httr.

## Value

Returns a named list of data frames: SeasonMatchups

**SeasonMatchups**

|                  |           |                           |
|------------------|-----------|---------------------------|
| col_name         | types     | description               |
| SEASON_ID        | character | Unique season identifier. |
| OFF_PLAYER_ID    | character |                           |
| OFF_PLAYER_NAME  | character |                           |
| DEF_PLAYER_ID    | character |                           |
| DEF_PLAYER_NAME  | character |                           |
| GP               | character | Games played.             |
| MATCHUP_MIN      | character |                           |
| PARTIAL_POSS     | character |                           |
| PLAYER_PTS       | character |                           |
| TEAM_PTS         | character |                           |
| MATCHUP_AST      | character |                           |
| MATCHUP_TOV      | character |                           |
| MATCHUP_BLK      | character |                           |
| MATCHUP_FGM      | character |                           |
| MATCHUP_FGA      | character |                           |
| MATCHUP_FG_PCT   | character |                           |
| MATCHUP_FG3M     | character |                           |
| MATCHUP_FG3A     | character |                           |
| MATCHUP_FG3_PCT  | character |                           |
| HELP_BLK         | character |                           |
| HELP_FGM         | character |                           |
| HELP_FGA         | character |                           |
| HELP_FG_PERC     | character |                           |
| MATCHUP_FTM      | character |                           |
| MATCHUP_FTA      | character |                           |
| SFL              | character |                           |
| MATCHUP_TIME_SEC | character |                           |

## Details

(No Matchups Data for WNBA yet, so defunct)

     wnba_leagueseasonmatchups(league_id = '10', season = most_recent_wnba_season() - 1)

## See also

[family_wnba_player](https://wehoop.sportsdataverse.org/reference/family_wnba_player.md)
lists every function in this family.

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
[`wnba_leaguegamelog()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguegamelog.md),
[`wnba_leaguelineupviz()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguelineupviz.md),
[`wnba_leagueplayerondetails()`](https://wehoop.sportsdataverse.org/reference/wnba_leagueplayerondetails.md),
[`wnba_leaguestandingsv3()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguestandingsv3.md),
[`wnba_shotchartleaguewide()`](https://wehoop.sportsdataverse.org/reference/wnba_shotchartleaguewide.md)

## Author

Saiem Gilani
