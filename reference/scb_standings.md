# **Get BBL / DBBL Standings**

League table of a season: record, home / away split, streaks and
tie-break detail (2005-06 on).

Endpoint: `GET https://api.basketball-bundesliga.de/standings` (DBBL:
the same route on `https://api-1.dbbl.scb.world`).

## Usage

``` r
scb_standings(league = "dbbl", season = NULL, competition = NULL)
```

## Arguments

- league:

  (default `"dbbl"`, the women's DBBL) League: `bbl` (men, easyCredit
  Basketball Bundesliga, api.basketball-bundesliga.de) or `dbbl` (women,
  Toyota Damen-Basketball-Bundesliga, api-1.dbbl.scb.world). The two
  share one API; game ids overlap, so a game is (league, game_id).

- season:

  (default `NULL`) Season END year (2026 = 2025-26, the sdv key). Sent
  to the API as its START-year seasonId (season - 1). Omitted = the
  season in progress. Seasons before about 2000 answer an empty table.

- competition:

  (default `NULL`) Competition: BBL, BBL_CUP, ALLSTAR, CHAMPIONS_CUP
  (BBL host) or DBBL, DBBL_CUP (DBBL host). BBL_CUP answers an empty
  table.

## Value

A `wehoop_data` tibble: League table of a season: record, home / away
split, streaks and tie-break detail (2005-06 on). An empty valid answer
raises `wehoop_no_data`; the columns are always these, in this order
(sportsdataverse-py `scb_standings`):

|  |  |  |
|----|----|----|
| col_name | type | description |
| league | character | League the row belongs to: `bbl` (men) or `dbbl` (women); BBL and DBBL game ids overlap, so a game is (league, game_id). |
| season | integer | Season END year (2026 = 2025-26), the sdv key; the API's `season_id` plus one. |
| standing_id | character | Opaque id of the standings row, a string. |
| season_team_id | character | Season-team id; equal to the club `teamId` in every sample (BBL 2005-2026, DBBL 2024-2026). An integer here. |
| team_id | character | Club id; equal to `seasonTeamId` in every sample. Joins to `/teams/{teamId}`. |
| team_name | character | Team name; null on some rows. |
| team_tlc | character | Three-letter club code. |
| team_name_short | character | Short team name (null on DBBL). |
| has_reached_playoffs | logical | Clinched a playoff place. |
| has_reached_playins | logical | Clinched at least the play-ins. |
| is_relegation_certain | logical | Relegated for certain. |
| season_id | integer | Season, START year (2026 = 2026-27). |
| competition | character | Competition: BBL, BBL_CUP (Pokal), ALLSTAR, CHAMPIONS_CUP on the BBL host; DBBL, DBBL_CUP on the DBBL host. |
| stage | character | Stage: MAIN_ROUND (Hauptrunde, regular season), PLAYINS, FIRST_ROUND, SECOND_ROUND, ROUND_OF_16 (Achtelfinale), ROUND_OF_8 (Viertelfinale), SEMI_FINALS, FINALS, THIRD_PLACE_GAME, QUALIFICATION, GROUP_STAGE. |
| rank | integer | Table position. |
| streak | character | Current streak: W or L; empty when none. |
| streak_count | integer | Length of the current streak. |
| point_corrections | character | Table-point deductions; \[\] in every sample. |
| home_victories | integer | Home games: wins. |
| home_losses | integer | Home games: number of losses in the table. |
| home_victory_percentage | double | Home games: win percentage, 0-100. |
| away_victories | integer | Away games: wins. |
| away_losses | integer | Away games: number of losses in the table. |
| away_victory_percentage | double | Away games: win percentage, 0-100. |
| table_points | integer | Table points scored (2 per win), from the API's `totalPointsMade`; the provider's notes call its 'Points' fields table points. |
| table_points_against | integer | Table points conceded (2 per loss), from the API's `totalPointsAgainst`; per the provider's notes, table points. |
| total_victory_percentage | double | All games: win percentage, 0-100. |
| total_games | integer | Games played in the table (home and away together). |
| total_victories | integer | All games: wins. |
| total_losses | integer | Losses in the table over all games. |
| last10_victories | integer | Wins in the last 10 games. |
| last10_losses | integer | Losses in the last 10 games. |
| last10_percentage | double | Win percentage over the last 10 games, 0-100. |
| last10_outcomes | character | Results of the last games, newest first: W or L. |
| home_last10_victories | integer | Home games: last 10 games, wins. |
| home_last10_losses | integer | Home games: last 10 games, losses. |
| home_last10_victory_percentage | double | Home games: last 10 games, win percentage, 0-100. |
| home_streak | character | Home games: current streak, W or L. |
| home_streak_count | integer | Home games: length of the current streak. |
| away_last10_victories | integer | Away games: last 10 games, wins. |
| away_last10_losses | integer | Away games: last 10 games, losses. |
| away_last10_victory_percentage | double | Away games: last 10 games, win percentage, 0-100. |
| away_streak | character | Away games: current streak, W or L. |
| away_streak_count | integer | Away games: length of the current streak. |
| updated_date | character | Last update of the row, ISO 8601 UTC. |
| ranking_comparison_info | character | Tie-break detail among teams level on record. |
| home_points_for | integer | Home games: basketball points scored (the API's football-style `GoalsMade`). |
| away_points_for | integer | Away games: basketball points scored (the API's football-style `GoalsMade`). |
| total_points_for | integer | All games: basketball points scored (the API's football-style `GoalsMade`). |
| home_points_against | integer | Home games: basketball points allowed (the API's football-style `GoalsAgainst`). |
| away_points_against | integer | Away games: basketball points allowed (the API's football-style `GoalsAgainst`). |
| total_points_against | integer | All games: basketball points allowed (the API's football-style `GoalsAgainst`). |
| home_point_difference | integer | Home games: point differential, scored minus allowed (the API's `GoalDifference`). |
| away_point_difference | integer | Away games: point differential, scored minus allowed (the API's `GoalDifference`). |
| total_point_difference | integer | All games: point differential, scored minus allowed (the API's `GoalDifference`). |

## Details

Source, terms of use, request pacing, seasons, ids, coverage and error
classes of this family: see the notes in
[`scb_seasons()`](https://wehoop.sportsdataverse.org/reference/scb_seasons.md).

## See also

[family_scb](https://wehoop.sportsdataverse.org/reference/family_scb.md)
lists every function in this family.

## Examples

``` r
# \donttest{
  try(scb_standings())
#> ── BBL/DBBL Standings from the SCB API ───────────────────────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-13 19:07:59 UTC
#> # A tibble: 10 × 55
#>    league season standing_id season_team_id team_id team_name           team_tlc
#>    <chr>   <int> <chr>       <chr>          <chr>   <chr>               <chr>   
#>  1 dbbl     2027 4000        107            107     Rutronik Stars Kel… KEL     
#>  2 dbbl     2027 3993        100            100     ALBA BERLIN         ALB     
#>  3 dbbl     2027 3994        101            101     BC Marburg          MAR     
#>  4 dbbl     2027 4002        109            109     halfit LIONS        hfL     
#>  5 dbbl     2027 3997        104            104     GiroLive Panthers … OSN     
#>  6 dbbl     2027 3996        103            103     Eisvögel USC Freib… FRE     
#>  7 dbbl     2027 3998        105            105     Herner TC           HER     
#>  8 dbbl     2027 4001        108            108     Saarlouis Royals    SAR     
#>  9 dbbl     2027 3995        102            102     Eigner Angels Nörd… NÖR     
#> 10 dbbl     2027 4003        110            110     TK Hannover Luchse  HAN     
#> # ℹ 48 more variables: team_name_short <chr>, has_reached_playoffs <lgl>,
#> #   has_reached_playins <lgl>, is_relegation_certain <lgl>, season_id <int>,
#> #   competition <chr>, stage <chr>, rank <int>, streak <chr>,
#> #   streak_count <int>, point_corrections <chr>, home_victories <int>,
#> #   home_losses <int>, home_victory_percentage <dbl>, away_victories <int>,
#> #   away_losses <int>, away_victory_percentage <dbl>, table_points <int>,
#> #   table_points_against <int>, total_victory_percentage <dbl>, …
# }
```
