# **Get WNBA Stats API League Dashboard Player Shot Locations**

**Get WNBA Stats API League Dashboard Player Shot Locations**

**Get WNBA Stats API League Dashboard Player Shot Locations**

## Usage

``` r
wnba_leaguedashplayershotlocations(
  college = "",
  conference = "",
  country = "",
  date_from = "",
  date_to = "",
  distance_range = "By Zone",
  division = "",
  draft_pick = "",
  draft_year = "",
  dribble_range = "",
  game_scope = "",
  game_segment = "",
  height = "",
  last_n_games = 0,
  league_id = "10",
  location = "",
  measure_type = "Base",
  month = 0,
  opponent_team_id = 0,
  outcome = "",
  po_round = "",
  pace_adjust = "N",
  per_mode = "Totals",
  period = 0,
  player_experience = "",
  player_position = "",
  plus_minus = "N",
  rank = "N",
  season = most_recent_wnba_season() - 1,
  season_segment = "",
  season_type = "Regular Season",
  shot_clock_range = "",
  starter_bench = "",
  team_id = "",
  vs_conference = "",
  vs_division = "",
  weight = "",
  ...
)
```

## Arguments

- college:

  college

- conference:

  conference

- country:

  country

- date_from:

  date_from

- date_to:

  date_to

- distance_range:

  distance_range

- division:

  division

- draft_pick:

  draft_pick

- draft_year:

  draft_year

- dribble_range:

  dribble_range

- game_scope:

  game_scope

- game_segment:

  game_segment

- height:

  height

- last_n_games:

  last_n_games

- league_id:

  league_id

- location:

  location

- measure_type:

  measure_type

- month:

  month

- opponent_team_id:

  opponent_team_id

- outcome:

  outcome

- po_round:

  po_round

- pace_adjust:

  pace_adjust

- per_mode:

  per_mode

- period:

  period

- player_experience:

  player_experience

- player_position:

  player_position

- plus_minus:

  plus_minus

- rank:

  rank

- season:

  season

- season_segment:

  season_segment

- season_type:

  season_type

- shot_clock_range:

  shot_clock_range

- starter_bench:

  starter_bench

- team_id:

  team_id

- vs_conference:

  vs_conference

- vs_division:

  vs_division

- weight:

  weight

- ...:

  Additional arguments passed to an underlying function like httr.

## Value

Returns a named list of data frames: ShotLocations

**ShotLocations**

|                            |           |                                       |
|----------------------------|-----------|---------------------------------------|
| col_name                   | types     | description                           |
| PLAYER_ID                  | character | Unique player identifier.             |
| PLAYER_NAME                | character | Player name.                          |
| TEAM_ID                    | character | Unique team identifier.               |
| TEAM_ABBREVIATION          | character | Short team abbreviation (e.g. 'LAS'). |
| AGE                        | character | Player age (in years).                |
| NICKNAME                   | character | Team or athlete nickname.             |
| Restricted_Area_FGM        | character |                                       |
| Restricted_Area_FGA        | character |                                       |
| Restricted_Area_FG_PCT     | character |                                       |
| In_The_Paint_Non_RA_FGM    | character |                                       |
| In_The_Paint_Non_RA_FGA    | character |                                       |
| In_The_Paint_Non_RA_FG_PCT | character |                                       |
| Mid_Range_FGM              | character |                                       |
| Mid_Range_FGA              | character |                                       |
| Mid_Range_FG_PCT           | character |                                       |
| Left_Corner_3_FGM          | character |                                       |
| Left_Corner_3_FGA          | character |                                       |
| Left_Corner_3_FG_PCT       | character |                                       |
| Right_Corner_3_FGM         | character |                                       |
| Right_Corner_3_FGA         | character |                                       |
| Right_Corner_3_FG_PCT      | character |                                       |
| Above_the_Break_3_FGM      | character |                                       |
| Above_the_Break_3_FGA      | character |                                       |
| Above_the_Break_3_FG_PCT   | character |                                       |
| Backcourt_FGM              | character |                                       |
| Backcourt_FGA              | character |                                       |
| Backcourt_FG_PCT           | character |                                       |
| Corner_3_FGM               | character |                                       |
| Corner_3_FGA               | character |                                       |
| Corner_3_FG_PCT            | character |                                       |

## Details

      wnba_leaguedashplayershotlocations(league_id = '10', season = most_recent_wnba_season() - 1)

## See also

[family_wnba_player](https://wehoop.sportsdataverse.org/reference/family_wnba_player.md)
lists every function in this family.

Other WNBA League Functions:
[`wnba_leaguedashlineups()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguedashlineups.md),
[`wnba_leaguedashplayerbiostats()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguedashplayerbiostats.md),
[`wnba_leaguedashplayerclutch()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguedashplayerclutch.md),
[`wnba_leaguedashplayerstats()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguedashplayerstats.md),
[`wnba_leaguedashteamclutch()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguedashteamclutch.md),
[`wnba_leaguedashteamshotlocations()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguedashteamshotlocations.md),
[`wnba_leaguedashteamstats()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguedashteamstats.md),
[`wnba_leaguegamefinder()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguegamefinder.md),
[`wnba_leaguegamelog()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguegamelog.md),
[`wnba_leaguelineupviz()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguelineupviz.md),
[`wnba_leagueplayerondetails()`](https://wehoop.sportsdataverse.org/reference/wnba_leagueplayerondetails.md),
[`wnba_leagueseasonmatchups()`](https://wehoop.sportsdataverse.org/reference/wnba_leagueseasonmatchups.md),
[`wnba_leaguestandingsv3()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguestandingsv3.md),
[`wnba_shotchartleaguewide()`](https://wehoop.sportsdataverse.org/reference/wnba_shotchartleaguewide.md)

Other WNBA Shooting Functions:
[`wnba_leaguedashteamshotlocations()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguedashteamshotlocations.md),
[`wnba_playerdashboardbyclutch()`](https://wehoop.sportsdataverse.org/reference/wnba_playerdashboardbyclutch.md),
[`wnba_shotchartdetail()`](https://wehoop.sportsdataverse.org/reference/wnba_shotchartdetail.md),
[`wnba_shotchartleaguewide()`](https://wehoop.sportsdataverse.org/reference/wnba_shotchartleaguewide.md),
[`wnba_shotchartlineupdetail()`](https://wehoop.sportsdataverse.org/reference/wnba_shotchartlineupdetail.md),
[`wnba_teamdashboardbyclutch()`](https://wehoop.sportsdataverse.org/reference/wnba_teamdashboardbyclutch.md)

## Author

Saiem Gilani
