# **Load cleaned WNBA Stats API season rosters from the data repo**

Loads season-level WNBA team rosters scraped from the WNBA Stats API.
One row per athlete-team-season triple. Backed by the
`wehoop-wnba-stats-data` pipeline that reads raw JSONs from
`wehoop-wnba-stats-raw` and publishes parquet/rds artifacts to the
`wnba_stats_rosters` release tag.

Loads season-level WNBA coaching staff data scraped from the WNBA Stats
API. One row per coach-team-season triple. Backed by the
`wehoop-wnba-stats-data` pipeline that reads raw JSONs from
`wehoop-wnba-stats-raw` and publishes parquet/rds artifacts to the
`wnba_stats_coaches` release tag.

**\[deprecated\]** Loads season-level WNBA player statistics.
**Deprecated**: the `wnba_stats_player_season_stats` release tag
(R-scraped, `Base`/`Advanced`/`Misc`/`Scoring`/`Usage`/ `Defense`
measures) is superseded by the `wnba_stats_leaguedash` tag
(Python-scraped parameter cube, same 6 measure types plus `player_bio`
and a wide `player_master` mega). This function reshapes the cube back
into the old stacked-by-`measure_type` contract for compatibility; call
the cube's `player_stats_*` / `player_master` assets directly with
[`load_wnba_stats_leaguedash()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_leaguedash.md)
for the full surface.

**\[deprecated\]** Loads season-level WNBA 5-man lineup statistics
(`leaguedashlineups`-style outputs). **Deprecated**: the
`wnba_stats_lineups` release tag (R-scraped, `Base`/`Advanced` measures,
5-man only) is superseded by the `wnba_stats_leaguedash` tag
(Python-scraped parameter cube: 6 measure types x 2/3/4/5-man). This
function reshapes the cube back into the old 5-man `Base`+`Advanced`
contract for compatibility; call the cube's `lineups_*` /
`lineups_master` assets directly with
[`load_wnba_stats_leaguedash()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_leaguedash.md)
for the full surface.

**\[deprecated\]** Loads season-level team statistics
(`leaguedashteamstats`-style outputs). **Deprecated**: the
`wnba_stats_team_season_stats` release tag (R-scraped, `Base`/
`Advanced`/`Misc`/`Scoring`/`Defense`/`Opponent` measures) is superseded
by the `wnba_stats_leaguedash` tag (Python-scraped parameter cube, same
6 measures plus `Four Factors` and a wide `team_master` mega). This
function reshapes the cube back into the old stacked-by-`measure_type`
contract for compatibility; call the cube's `team_stats_*` /
`team_master` assets directly with
[`load_wnba_stats_leaguedash()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_leaguedash.md)
for the full surface.

**\[deprecated\]** Loads season-level WNBA standings
(`leaguestandingsv3`-style outputs). One row per team-season.
**Deprecated**: the `wnba_stats_standings` release tag (R-scraped) is
superseded by the `wnba_stats_leaguedash` tag's `standings` asset (same
underlying endpoint/params, Python-scraped) — this is close to a pure
passthrough.

Loads season-level WNBA draft picks scraped from the WNBA Stats API
(`drafthistory`-style outputs). One row per pick. Backed by the
`wehoop-wnba-stats-data` pipeline that reads raw JSONs from
`wehoop-wnba-stats-raw` and publishes parquet/rds artifacts to the
`wnba_stats_draft` release tag.

Loads shot events scraped from the WNBA Stats API. One row per shot
attempt with legacy court coordinates, action/sub type, distance, and
made/missed result, carried through from the V3 play-by-play feed (not
`shotchartdetail`). Backed by the `wehoop-wnba-stats-data` pipeline that
reads raw JSONs from `wehoop-wnba-stats-raw` and publishes parquet/rds
artifacts to the `wnba_stats_shots` release tag.

Loads the per-game **inactive player** list scraped from the WNBA Stats
API – the `InactivePlayers` result set of `boxscoresummaryv2`. One row
per inactive athlete-game pair, not a full per-game roster: use
`load_wnba_stats_player_game_logs()` for the athletes who did play.
Backed by the `wehoop-wnba-stats-data` pipeline that reads raw JSONs
from `wehoop-wnba-stats-raw` and publishes parquet/rds artifacts to the
`wnba_stats_game_rosters` release tag.

Coverage is thin by construction because the upstream result set is
thin: stats.wnba.com reports inactives for only a fraction of games, and
most heavily for 2006-2008 and 2021 onward. Season row counts range from
1 (1997) to 610 across 184 games (2026); 2009-2012 carry fewer than 10
rows each. A season with almost no rows is upstream sparsity, not a
download failure.

Loads game-level officials data scraped from the WNBA Stats API
(`boxscoresummaryv2`-style outputs). One row per official-game pair.
Backed by the `wehoop-wnba-stats-data` pipeline that reads raw JSONs
from `wehoop-wnba-stats-raw` and publishes parquet/rds artifacts to the
`wnba_stats_officials` release tag.

Loads per-player per-game logs scraped from
`stats.wnba.com/leaguegamelog?PlayerOrTeam=P` (one row per athlete-game
pair: minutes, shooting splits, rebounds, steals, blocks, turnovers,
personal fouls, plus/minus). Backed by the `wehoop-wnba-stats-data`
pipeline that publishes parquet/rds artifacts to the
`wnba_stats_player_game_logs` release tag.

Loads season-level WNBA schedules scraped from
`stats.wnba.com/leaguegamefinder` (regular season + playoffs combined,
pre-rejoined home/away). Backed by the `wehoop-wnba-stats-data` pipeline
that publishes parquet/rds artifacts to the `wnba_stats_schedules`
release tag.

Loads season-level WNBA play-by-play (V3), supplied by
[`wnba_pbp()`](https://wehoop.sportsdataverse.org/reference/wnba_pbp.md)
in the upstream compile script. Backed by the `wehoop-wnba-stats-data`
pipeline that publishes parquet/rds artifacts to the `wnba_stats_pbp`
release tag.

`load_wnba_stats_rosters_manifest()` returns the per-season manifest CSV
(`season`, `row_count`, `generated_at_utc`, `source_endpoint`) for the
WNBA Stats rosters release tag without downloading any season's full
data.

`load_wnba_stats_coaches_manifest()` returns the per-season manifest CSV
(`season`, `row_count`, `generated_at_utc`, `source_endpoint`) for the
WNBA Stats coaches release tag without downloading any season's full
data.

`load_wnba_stats_player_stats_manifest()` returns the per-season
manifest CSV (`season`, `row_count`, `generated_at_utc`,
`source_endpoint`) for the WNBA Stats player season stats release tag
without downloading any season's full data.

`load_wnba_stats_lineups_manifest()` returns the per-season manifest CSV
(`season`, `row_count`, `generated_at_utc`, `source_endpoint`) for the
WNBA Stats lineups release tag without downloading any season's full
data.

`load_wnba_stats_team_stats_manifest()` returns the per-season manifest
CSV (`season`, `row_count`, `generated_at_utc`, `source_endpoint`) for
the WNBA Stats team season stats release tag without downloading any
season's full data.

`load_wnba_stats_standings_manifest()` returns the per-season manifest
CSV (`season`, `row_count`, `generated_at_utc`, `source_endpoint`) for
the WNBA Stats standings release tag without downloading any season's
full data.

`load_wnba_stats_draft_manifest()` returns the per-season manifest CSV
(`season`, `row_count`, `generated_at_utc`, `source_endpoint`) for the
WNBA Stats draft release tag without downloading any season's full data.

`load_wnba_stats_shots_manifest()` returns the per-season manifest CSV
(`season`, `row_count`, `generated_at_utc`, `source_endpoint`) for the
WNBA Stats shots release tag without downloading any season's full data.

`load_wnba_stats_game_rosters_manifest()` returns the per-season
manifest CSV (`season`, `row_count`, `generated_at_utc`,
`source_endpoint`) for the WNBA Stats game rosters release tag without
downloading any season's full data.

`load_wnba_stats_officials_manifest()` returns the per-season manifest
CSV (`season`, `row_count`, `generated_at_utc`, `source_endpoint`) for
the WNBA Stats officials release tag without downloading any season's
full data.

`load_wnba_stats_player_game_logs_manifest()` returns the per-season
manifest CSV (`season`, `row_count`, `generated_at_utc`,
`source_endpoint`) for the WNBA Stats player game logs release tag
without downloading any season's full data.

`load_wnba_stats_schedule_manifest()` returns the per-season manifest
CSV (`season`, `row_count`, `generated_at_utc`, `source_endpoint`) for
the WNBA Stats schedules release tag without downloading any season's
full data.

`load_wnba_stats_pbp_manifest()` returns the per-season manifest CSV
(`season`, `row_count`, `generated_at_utc`, `source_endpoint`) for the
WNBA Stats play-by-play release tag without downloading any season's
full data.

Loads possession-level data derived from the WNBA Stats API play-by-play
– one row per possession, with the on-court 5-man lineups for both
teams, shooting/rebounding/turnover splits, and the possession start
type. Backed by the `wehoop-wnba-stats-data` pipeline that reads raw
JSONs from `wehoop-wnba-stats-raw` and publishes csv.gz/parquet/rds
artifacts to the `wnba_stats_possessions` release tag.

## Usage

``` r
load_wnba_stats_rosters(
  seasons = most_recent_wnba_stats_season(),
  ...,
  dbConnection = NULL,
  tablename = NULL
)

load_wnba_stats_coaches(
  seasons = most_recent_wnba_stats_season(),
  ...,
  dbConnection = NULL,
  tablename = NULL
)

load_wnba_stats_player_stats(
  seasons = most_recent_wnba_stats_season(),
  ...,
  dbConnection = NULL,
  tablename = NULL
)

load_wnba_stats_lineups(
  seasons = most_recent_wnba_stats_season(),
  ...,
  dbConnection = NULL,
  tablename = NULL
)

load_wnba_stats_team_stats(
  seasons = most_recent_wnba_stats_season(),
  ...,
  dbConnection = NULL,
  tablename = NULL
)

load_wnba_stats_standings(
  seasons = most_recent_wnba_stats_season(),
  ...,
  dbConnection = NULL,
  tablename = NULL
)

load_wnba_stats_draft(
  seasons = most_recent_wnba_stats_season(),
  ...,
  dbConnection = NULL,
  tablename = NULL
)

load_wnba_stats_shots(
  seasons = most_recent_wnba_stats_season(),
  ...,
  dbConnection = NULL,
  tablename = NULL
)

load_wnba_stats_game_rosters(
  seasons = most_recent_wnba_stats_season(),
  ...,
  dbConnection = NULL,
  tablename = NULL
)

load_wnba_stats_officials(
  seasons = most_recent_wnba_stats_season(),
  ...,
  dbConnection = NULL,
  tablename = NULL
)

load_wnba_stats_player_game_logs(
  seasons = most_recent_wnba_stats_season(),
  ...,
  dbConnection = NULL,
  tablename = NULL
)

load_wnba_stats_schedule(
  seasons = most_recent_wnba_stats_season(),
  ...,
  dbConnection = NULL,
  tablename = NULL
)

load_wnba_stats_pbp(
  seasons = most_recent_wnba_stats_season(),
  ...,
  dbConnection = NULL,
  tablename = NULL
)

load_wnba_stats_rosters_manifest()

load_wnba_stats_coaches_manifest()

load_wnba_stats_player_stats_manifest()

load_wnba_stats_lineups_manifest()

load_wnba_stats_team_stats_manifest()

load_wnba_stats_standings_manifest()

load_wnba_stats_draft_manifest()

load_wnba_stats_shots_manifest()

load_wnba_stats_game_rosters_manifest()

load_wnba_stats_officials_manifest()

load_wnba_stats_player_game_logs_manifest()

load_wnba_stats_schedule_manifest()

load_wnba_stats_pbp_manifest()

load_wnba_stats_possessions(
  seasons = most_recent_wnba_stats_season(),
  ...,
  dbConnection = NULL,
  tablename = NULL
)
```

## Arguments

- seasons:

  A vector of 4-digit years associated with given WNBA seasons.
  Published coverage runs 1997 through the most recent season, with no
  gaps. Pass `seasons = TRUE` for every published season. (Min: 1997)

- ...:

  Additional arguments passed to an underlying function that writes the
  season data into a database.

- dbConnection:

  A `DBIConnection` object, as returned by
  [`DBI::dbConnect()`](https://dbi.r-dbi.org/reference/dbConnect.html)

- tablename:

  The name of the data table within the database

## Value

Returns a `wehoop_data` tibble with one row per athlete-team-season.

Returns a `wehoop_data` tibble with one row per coach-team-season.

Returns a `wehoop_data` tibble of player season stats.

Returns a `wehoop_data` tibble of lineup stats.

Returns a `wehoop_data` tibble of team season stats.

|  |  |  |
|----|----|----|
| col_name | types | description |
| season | integer | Season identifier (4-digit year or 'YYYY-YY' string). |
| season_type | character | Season type (1=pre-season, 2=regular season, 3=postseason, 4=off-season for ESPN; or string label for WNBA Stats). |
| team_id | character | Unique team identifier. |
| team_name | character | Full team display name (e.g. 'Las Vegas Aces'). |
| team_abbreviation | character | Short team abbreviation (e.g. 'LAS'). |
| gp | integer | Games played. |
| w | integer | Wins. |
| l | integer | Losses. |
| w_pct | numeric | Wins percentage (0-1 decimal). |
| min | numeric | Minutes played. |
| fgm | numeric | Field goals made. |
| fga | numeric | Field goal attempts. |
| fg_pct | numeric | Field goal percentage (0-1). |
| fg3m | numeric | Three-point field goals made. |
| fg3a | numeric | Three-point field goal attempts. |
| fg3_pct | numeric | Three-point field goal percentage (0-1). |
| ftm | numeric | Free throws made. |
| fta | numeric | Free throw attempts. |
| ft_pct | numeric | Free throw percentage (0-1). |
| oreb | numeric | Offensive rebounds. |
| dreb | numeric | Defensive rebounds. |
| reb | numeric | Total rebounds. |
| ast | numeric | Assists. |
| tov | numeric | Turnovers. |
| stl | numeric | Steals. |
| blk | numeric | Blocks. |
| pf | numeric | Personal fouls. |
| pts | numeric | Points scored. |
| plus_minus | numeric | Plus/minus point differential while on court. |

Returns a `wehoop_data` tibble of team standings.

|  |  |  |
|----|----|----|
| col_name | types | description |
| season | integer | Season identifier (4-digit year or 'YYYY-YY' string). |
| season_id | character | Unique season identifier. |
| team_id | character | Unique team identifier. |
| team_city | character | Team city or region (e.g. 'Las Vegas'). |
| team_name | character | Full team display name (e.g. 'Las Vegas Aces'). |
| conference | character | Filter players or teams by conference. |
| conference_record | character | Conference win-loss record. |
| playoff_rank | integer | League/season rank for playoff. |
| wins | integer | Total wins. |
| losses | integer | Total losses. |
| win_pct | numeric | Win percentage (0-1 decimal). |
| home_record | character | Home win-loss record. |
| road_record | character | Win-loss record for road. |
| l10 | character | L10. |
| strcurrentstreak | character | Strcurrentstreak. |
| points_pg | numeric | Points pg. |
| opp_points_pg | numeric | Opponent points pg. |
| diff_points_pg | numeric | Diff points pg. |

Returns a `wehoop_data` tibble of WNBA draft picks.

|  |  |  |
|----|----|----|
| col_name | types | description |
| person_id | integer | Unique player identifier (V3 endpoints). |
| player_name | character | Player name. |
| season | integer | Season identifier (4-digit year). |
| round_number | integer | Numeric round. |
| round_pick | integer | Round pick. |
| overall_pick | integer | Overall pick. |
| draft_type | character | Draft type ('Draft', 'Allocation' or 'Elite'). |
| team_id | integer | Unique team identifier. |
| team_city | character | Team city or region (e.g. 'Las Vegas'). |
| team_name | character | Full team display name (e.g. 'Las Vegas Aces'). |
| team_abbreviation | character | Short team abbreviation (e.g. 'LAS'). |
| organization | character | Organization. |
| organization_type | character | Organization type. |
| player_profile_flag | integer | Player profile flag. |

Returns a `wehoop_data` tibble with one row per shot attempt.

|  |  |  |
|----|----|----|
| col_name | types | description |
| game_id | character | Unique game identifier. |
| season | integer | Season identifier (4-digit year). |
| period | integer | Period of the game (1-4 quarters; 5+ for OT). |
| clock | character | Game clock remaining in the period (ISO 8601 duration). |
| team_id | integer | Unique team identifier for the shooting team. |
| team_tricode | character | Three-letter team code (e.g. 'LAS' / 'NYL'). |
| person_id | integer | Unique player identifier for the shooter. |
| player_name | character | Shooter's name. |
| action_type | character | Action type label ('Made Shot' or 'Missed Shot'). |
| sub_type | character | Shot sub type (e.g. 'Jump Shot', 'Layup', 'DUNK'). |
| shot_result | character | Shot result, 'Made' or 'Missed'. |
| shot_value | integer | Points the shot was worth (2 or 3). |
| shot_distance | integer | Shot distance from the basket, in feet. |
| x_legacy | integer | Legacy X coordinate on the court (0 = basket center). |
| y_legacy | integer | Legacy Y coordinate on the court (baseline at 0). |
| description | character | Text description of the play. |
| score_home | character | Home team score after the play. |
| score_away | character | Away team score after the play. |

Returns a `wehoop_data` tibble with one row per inactive athlete-game
pair.

|  |  |  |
|----|----|----|
| col_name | types | description |
| player_id | integer | Unique player identifier. |
| first_name | character | Player's first name. |
| last_name | character | Player's last name. |
| jersey_num | character | Jersey number worn by the player. |
| team_id | integer | Unique team identifier. |
| team_city | character | Team city or region (e.g. 'Las Vegas'). |
| team_name | character | Full team display name (e.g. 'Las Vegas Aces'). |
| team_abbreviation | character | Short team abbreviation (e.g. 'LAS'). |
| season | integer | Season identifier (4-digit year). |
| game_id | character | Unique game identifier. |

Returns a `wehoop_data` tibble with one row per official-game pair.

|             |           |                                       |
|-------------|-----------|---------------------------------------|
| col_name    | types     | description                           |
| official_id | integer   | Unique official / referee identifier. |
| first_name  | character | Official's first name.                |
| last_name   | character | Official's last name.                 |
| jersey_num  | character | Jersey number worn by the official.   |
| season      | integer   | Season identifier (4-digit year).     |
| game_id     | character | Unique game identifier.               |

Returns a `wehoop_data` tibble of per-athlete per-game log rows.

Returns a `wehoop_data` tibble of per-season schedules, one row per game
with the home/away sides pre-joined into `home_*` / `away_*` columns.

|  |  |  |
|----|----|----|
| col_name | types | description |
| game_id | character | Unique game identifier. |
| season | integer | Season identifier (4-digit year). |
| season_type | character | Portion of the season: `regular-season` or `playoffs`. |
| game_date | character | Date the game was played, as an ISO `YYYY-MM-DD` string. |
| matchup | character | Matchup string, home side first (e.g. `WAS vs. NYL`). |
| home_team_id | integer | Unique WNBA Stats team identifier for the home team. |
| home_team_abbreviation | character | Home team abbreviation. |
| home_team_name | character | Home team full name. |
| home_pts | integer | Points scored by the home team. |
| home_wl | character | Home team result, `W` or `L`. |
| away_team_id | integer | Unique WNBA Stats team identifier for the away team. |
| away_team_abbreviation | character | Away team abbreviation. |
| away_team_name | character | Away team full name. |
| away_pts | integer | Points scored by the away team. |
| away_wl | character | Away team result, `W` or `L`. |

Returns a `wehoop_data` tibble of per-event play-by-play rows.

Returns a `wehoop_data` tibble with one row per possession.

|  |  |  |
|----|----|----|
| col_name | types | description |
| game_id | character | Unique game identifier. |
| period | integer | Period of the game (1-2 halves pre-2016, 1-4 quarters 2016+). |
| possession_number | integer | Sequential possession number within the game. |
| offense_team_id | integer | Team identifier for the team on offense. |
| defense_team_id | integer | Team identifier for the team on defense. |
| start_order_index | integer | Play-by-play order index at the start of the possession. |
| end_order_index | integer | Play-by-play order index at the end of the possession. |
| start_seconds_remaining | numeric | Seconds remaining in the period at possession start. |
| end_seconds_remaining | numeric | Seconds remaining in the period at possession end. |
| points | integer | Points scored on the possession. |
| is_second_chance | logical | Whether the possession followed an offensive rebound. |
| number_in_period | integer | Sequential possession number within the period. |
| possession_start_type | character | How the possession started (e.g. 'OffDeadball', 'OffRebound'). |
| count_as_possession | logical | Whether the event counts as a scoreable possession. |
| fg2a | integer | 2-point field goal attempts by the lineup. |
| fg2m | integer | 2-point field goals made by the lineup. |
| fg3a | integer | Fg3a. |
| fg3m | integer | Fg3m. |
| fta | integer | Free throw attempts by the lineup. |
| ftm | integer | Free throws made by the lineup. |
| oreb | integer | Offensive rebounds. |
| dreb | integer | Defensive rebounds. |
| tov | integer | Turnovers. |
| off_player_1 | integer | Offensive lineup slot 1 player identifier. |
| off_player_2 | integer | Offensive lineup slot 2 player identifier. |
| off_player_3 | integer | Offensive lineup slot 3 player identifier. |
| off_player_4 | integer | Offensive lineup slot 4 player identifier. |
| off_player_5 | integer | Offensive lineup slot 5 player identifier. |
| def_player_1 | integer | Defensive lineup slot 1 player identifier. |
| def_player_2 | integer | Defensive lineup slot 2 player identifier. |
| def_player_3 | integer | Defensive lineup slot 3 player identifier. |
| def_player_4 | integer | Defensive lineup slot 4 player identifier. |
| def_player_5 | integer | Defensive lineup slot 5 player identifier. |
| season | integer | Season identifier (4-digit year). |

## See also

Other WNBA Stats loader functions:
[`load_wnba_stats_leaguedash()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_leaguedash.md)

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  try(load_wnba_stats_rosters(seasons = most_recent_wnba_stats_season()))
#> ──────────────────────────────────────────────────────────────── wehoop 3.0.0 ──
#> # A tibble: 206 × 18
#>       team_id season league_id player nickname player_slug num   position height
#>         <int>  <int> <chr>     <chr>  <chr>    <chr>       <chr> <chr>    <chr> 
#>  1 1611661313   2026 10        Satou… Satou    satou-saba… 0     F        6-4   
#>  2 1611661313   2026 10        Marin… Marine   marine-fau… 4     G        5-9   
#>  3 1611661313   2026 10        Rebek… Rebekah  rebekah-ga… 7     G        6-1   
#>  4 1611661313   2026 10        Rebec… Rebecca  rebecca-al… 9     F-G      6-2   
#>  5 1611661313   2026 10        Leoni… Leonie   leonie-fie… 13    F        6-4   
#>  6 1611661313   2026 10        Raque… Raquel   raquel-car… 14    C        6-3   
#>  7 1611661313   2026 10        Pauli… Pauline  pauline-as… 18    G        5-11  
#>  8 1611661313   2026 10        Sabri… Sabrina  sabrina-io… 20    G        5-11  
#>  9 1611661313   2026 10        Han Xu Xu       xu-han      21    C        6-11  
#> 10 1611661313   2026 10        Marin… Marine   marine-joh… 23    G        5-10  
#> # ℹ 196 more rows
#> # ℹ 9 more variables: weight <chr>, birth_date <chr>, age <dbl>, exp <chr>,
#> #   school <chr>, player_id <int>, how_acquired <chr>,
#> #   supplemental_status <int>, season_type <chr>
# }
# \donttest{
  try(load_wnba_stats_coaches(seasons = most_recent_wnba_stats_season()))
#> ──────────────────────────────────────────────────────────────── wehoop 3.0.0 ──
#> # A tibble: 89 × 11
#>       team_id season coach_id first_name last_name  coach_name      is_assistant
#>         <int>  <int>    <int> <chr>      <chr>      <chr>                  <int>
#>  1 1611661313   2026  1627666 Chris      DeMarco    Chris DeMarco              1
#>  2 1611661313   2026  1643608 Andrew     Wade       Andrew Wade                2
#>  3 1611661313   2026  1643609 Will       Sheehey    Will Sheehey               2
#>  4 1611661313   2026  1643610 Addi       Walters    Addi Walters               2
#>  5 1611661313   2026   201907 Courtney   Paris      Courtney Paris             2
#>  6 1611661313   2026  1642971 Norielis   Subero     Norielis Subero            3
#>  7 1611661317   2026   202891 Nate       Tibbetts   Nate Tibbetts              1
#>  8 1611661317   2026   201911 Kristi     Toliver    Kristi Toliver             9
#>  9 1611661317   2026   201069 Megan      Vogel      Megan Vogel                2
#> 10 1611661317   2026  1628240 John       McCullough John McCullough            2
#> # ℹ 79 more rows
#> # ℹ 4 more variables: coach_type <chr>, sort_sequence <lgl>,
#> #   sub_sort_sequence <int>, season_type <chr>
# }
# \donttest{
  try(load_wnba_stats_player_stats(seasons = most_recent_wnba_stats_season()))
#> Warning: `load_wnba_stats_player_stats()` was deprecated in wehoop 3.0.0.
#> ℹ Backing data moved from the wnba_stats_player_season_stats release tag to the
#>   wnba_stats_leaguedash release tag (a Python-scraped parameter cube). This
#>   call reshapes the cube's
#>   player_stats_{base,advanced,misc,scoring,usage,defense} assets back into the
#>   old stacked-by-measure_type contract.
#> ──────────────────────────────────────────────────────────────── wehoop 3.0.0 ──
#> # A tibble: 1,356 × 211
#>    player_id player_name    nickname team_id team_abbreviation   age    gp     w
#>        <int> <chr>          <chr>      <int> <chr>             <dbl> <int> <int>
#>  1   1628932 A'ja Wilson    A'ja      1.61e9 LVA                  30    31    22
#>  2   1642290 Aaliyah Edwar… Aaliyah   1.61e9 CON                  24    21     7
#>  3   1642801 Aaliyah Nye    Aaliyah   1.61e9 ATL                  23    15     9
#>  4   1642786 Aicha Couliba… Aicha     1.61e9 CHI                  24    23     8
#>  5   1629501 Alanna Smith   Alanna    1.61e9 DAL                  29    26    16
#>  6   1643525 Alex Fowler    Alex      1.61e9 NYL                  25     2     1
#>  7   1642775 Alex Wilson    Alex      1.61e9 WAS                  32     4     2
#>  8   1643644 Alicia Florez  Alicia    1.61e9 WAS                  22    23    14
#>  9   1642293 Alissa Pili    Alissa    1.61e9 LAS                  25     3     2
#> 10   1641648 Aliyah Boston  Aliyah    1.61e9 IND                  24    30    19
#> # ℹ 1,346 more rows
#> # ℹ 203 more variables: l <int>, w_pct <dbl>, min <dbl>, fgm <int>, fga <int>,
#> #   fg_pct <dbl>, fg3_m <int>, fg3_a <int>, fg3_pct <dbl>, ftm <int>,
#> #   fta <int>, ft_pct <dbl>, oreb <int>, dreb <int>, reb <int>, ast <int>,
#> #   tov <int>, stl <int>, blk <int>, blka <int>, pf <int>, pfd <int>,
#> #   pts <int>, plus_minus <int>, nba_fantasy_pts <dbl>, dd2 <int>, td3 <int>,
#> #   wnba_fantasy_pts <dbl>, gp_rank <int>, w_rank <int>, l_rank <int>, …
# }
# \donttest{
  try(load_wnba_stats_lineups(seasons = most_recent_wnba_stats_season()))
#> Warning: `load_wnba_stats_lineups()` was deprecated in wehoop 3.0.0.
#> ℹ Backing data moved from the wnba_stats_lineups release tag (5-man
#>   Base+Advanced only) to the wnba_stats_leaguedash release tag (a
#>   Python-scraped parameter cube covering 2/3/4/5-man x 6 measure types). This
#>   call filters the cube's lineups_{base,advanced} assets down to group_quantity
#>   == 5 to match the old contract.
#> ──────────────────────────────────────────────────────────────── wehoop 3.0.0 ──
#> # A tibble: 4,000 × 98
#>    group_set group_id     group_name team_id team_abbreviation    gp     w     l
#>    <chr>     <chr>        <chr>        <int> <chr>             <int> <int> <int>
#>  1 Lineups   -1628277-16… A. Gray -…  1.61e9 ATL                  29    20     9
#>  2 Lineups   -203825-203… K. McBrid…  1.61e9 MIN                  27    21     6
#>  3 Lineups   -203014-204… N. Ogwumi…  1.61e9 LAS                  24     8    16
#>  4 Lineups   -203833-203… C. Gray -…  1.61e9 LVA                  30    21     9
#>  5 Lineups   -203866-204… K. Thornt…  1.61e9 GSV                  25    19     6
#>  6 Lineups   -1629484-16… M. DiLeo …  1.61e9 PDX                  18     7    11
#>  7 Lineups   -1629481-16… A. Ogunbo…  1.61e9 DAL                  21    15     6
#>  8 Lineups   -203833-204… C. Gray -…  1.61e9 LVA                  28    19     9
#>  9 Lineups   -1630446-16… M. Onyenw…  1.61e9 WAS                  22    13     9
#> 10 Lineups   -1628881-16… M. Billin…  1.61e9 IND                  25    15    10
#> # ℹ 3,990 more rows
#> # ℹ 90 more variables: w_pct <dbl>, min <dbl>, fgm <int>, fga <int>,
#> #   fg_pct <dbl>, fg3_m <int>, fg3_a <int>, fg3_pct <dbl>, ftm <int>,
#> #   fta <int>, ft_pct <dbl>, oreb <int>, dreb <int>, reb <int>, ast <int>,
#> #   tov <dbl>, stl <int>, blk <int>, blka <int>, pf <int>, pfd <int>,
#> #   pts <int>, plus_minus <dbl>, gp_rank <int>, w_rank <int>, l_rank <int>,
#> #   w_pct_rank <int>, min_rank <int>, fgm_rank <int>, fga_rank <int>, …
# }
# \donttest{
  try(load_wnba_stats_team_stats(seasons = most_recent_wnba_stats_season()))
#> Warning: `load_wnba_stats_team_stats()` was deprecated in wehoop 3.0.0.
#> ℹ Backing data moved from the wnba_stats_team_season_stats release tag to the
#>   wnba_stats_leaguedash release tag (a Python-scraped parameter cube). This
#>   call reshapes the cube's
#>   team_stats_{base,advanced,misc,scoring,defense,opponent} assets back into the
#>   old stacked-by-measure_type contract.
#> ──────────────────────────────────────────────────────────────── wehoop 3.0.0 ──
#> # A tibble: 90 × 179
#>       team_id team_name      gp     w     l w_pct   min   fgm   fga fg_pct fg3_m
#>         <int> <chr>       <int> <int> <int> <dbl> <dbl> <int> <int>  <dbl> <int>
#>  1 1611661330 Atlanta Dr…    32    20    12 0.625 1280.   992  2270  0.437   266
#>  2 1611661329 Chicago Sky    34    12    22 0.353 1370   1056  2369  0.446   254
#>  3 1611661323 Connecticu…    31     8    23 0.258 1245    915  2109  0.434   172
#>  4 1611661321 Dallas Win…    34    20    14 0.588 1370   1130  2436  0.464   279
#>  5 1611661331 Golden Sta…    33    24     9 0.727 1320    955  2235  0.427   356
#>  6 1611661325 Indiana Fe…    33    21    12 0.636 1335   1105  2270  0.487   343
#>  7 1611661319 Las Vegas …    34    23    11 0.676 1370   1132  2325  0.487   285
#>  8 1611661320 Los Angele…    32    12    20 0.375 1285   1031  2215  0.465   285
#>  9 1611661324 Minnesota …    35    28     7 0.8   1400   1211  2501  0.484   325
#> 10 1611661313 New York L…    34    20    14 0.588 1370   1061  2281  0.465   350
#> # ℹ 80 more rows
#> # ℹ 168 more variables: fg3_a <int>, fg3_pct <dbl>, ftm <int>, fta <int>,
#> #   ft_pct <dbl>, oreb <int>, dreb <int>, reb <int>, ast <int>, tov <dbl>,
#> #   stl <int>, blk <int>, blka <int>, pf <int>, pfd <int>, pts <int>,
#> #   plus_minus <dbl>, gp_rank <int>, w_rank <int>, l_rank <int>,
#> #   w_pct_rank <int>, min_rank <int>, fgm_rank <int>, fga_rank <int>,
#> #   fg_pct_rank <int>, fg3_m_rank <int>, fg3_a_rank <int>, …
# }
# \donttest{
  try(load_wnba_stats_standings(seasons = most_recent_wnba_stats_season()))
#> Warning: `load_wnba_stats_standings()` was deprecated in wehoop 3.0.0.
#> ℹ Backing data moved from the wnba_stats_standings release tag to the
#>   wnba_stats_leaguedash release tag's standings_{season}.parquet asset (same
#>   underlying leaguestandingsv3 endpoint/params, Python-scraped).
#> ──────────────────────────────────────────────────────────────── wehoop 3.0.0 ──
#> # A tibble: 15 × 94
#>    league_id season_id    team_id team_city    team_name team_slug conference
#>    <chr>     <chr>          <int> <chr>        <chr>     <chr>     <chr>     
#>  1 10        22026     1611661324 Minnesota    Lynx      lynx      West      
#>  2 10        22026     1611661331 Golden State Valkyries valkyries West      
#>  3 10        22026     1611661319 Las Vegas    Aces      aces      West      
#>  4 10        22026     1611661325 Indiana      Fever     fever     East      
#>  5 10        22026     1611661330 Atlanta      Dream     dream     East      
#>  6 10        22026     1611661322 Washington   Mystics   mystics   East      
#>  7 10        22026     1611661321 Dallas       Wings     wings     West      
#>  8 10        22026     1611661313 New York     Liberty   liberty   East      
#>  9 10        22026     1611661327 Portland     Fire      fire      West      
#> 10 10        22026     1611661320 Los Angeles  Sparks    sparks    West      
#> 11 10        22026     1611661317 Phoenix      Mercury   mercury   West      
#> 12 10        22026     1611661329 Chicago      Sky       sky       East      
#> 13 10        22026     1611661332 Toronto      Tempo     tempo     East      
#> 14 10        22026     1611661323 Connecticut  Sun       sun       East      
#> 15 10        22026     1611661328 Seattle      Storm     storm     West      
#> # ℹ 87 more variables: conference_record <chr>, playoff_rank <int>,
#> #   clinch_indicator <chr>, division <???>, division_record <chr>,
#> #   division_rank <int>, wins <int>, losses <int>, win_pct <dbl>,
#> #   league_rank <int>, record <chr>, home <chr>, road <chr>, l10 <chr>,
#> #   last10_home <chr>, last10_road <chr>, ot <chr>, three_pts_or_less <chr>,
#> #   ten_pts_or_more <chr>, long_home_streak <int>, str_long_home_streak <chr>,
#> #   long_road_streak <int>, str_long_road_streak <chr>, …
# }
# \donttest{
  try(load_wnba_stats_draft(seasons = most_recent_wnba_stats_season()))
#> ──────────────────────────────────────────────────────────────── wehoop 3.0.0 ──
#> # A tibble: 45 × 14
#>    person_id player_name  season round_number round_pick overall_pick draft_type
#>        <int> <chr>         <int>        <int>      <int>        <int> <chr>     
#>  1   1643425 Azzi Fudd      2026            1          1            1 Draft     
#>  2   1643426 Olivia Miles   2026            1          2            2 Draft     
#>  3   1643443 Awa Fam        2026            1          3            3 Draft     
#>  4   1643427 Lauren Betts   2026            1          4            4 Draft     
#>  5   1643447 Gabriela Ja…   2026            1          5            5 Draft     
#>  6   1643445 Kiki Rice      2026            1          6            6 Draft     
#>  7   1643446 Iyana Martin   2026            1          7            7 Draft     
#>  8   1643428 Flau'jae Jo…   2026            1          8            8 Draft     
#>  9   1643455 Angela Duga…   2026            1          9            9 Draft     
#> 10   1643433 Raven Johns…   2026            1         10           10 Draft     
#> # ℹ 35 more rows
#> # ℹ 7 more variables: team_id <int>, team_city <chr>, team_name <chr>,
#> #   team_abbreviation <chr>, organization <chr>, organization_type <chr>,
#> #   player_profile_flag <int>
# }
# \donttest{
  try(load_wnba_stats_shots(seasons = most_recent_wnba_stats_season()))
#> ──────────────────────────────────────────────────────────────── wehoop 3.0.0 ──
#> # A tibble: 27,606 × 18
#>    game_id    season period clock     team_id team_tricode person_id player_name
#>    <chr>       <int>  <int> <chr>       <int> <chr>            <int> <chr>      
#>  1 1022600001   2026      1 PT09M44.…  1.61e9 CON            1642800 Morrow     
#>  2 1022600001   2026      1 PT09M25.…  1.61e9 NYL            1627668 Stewart    
#>  3 1022600001   2026      1 PT09M17.…  1.61e9 CON            1641649 Miller     
#>  4 1022600001   2026      1 PT08M34.…  1.61e9 NYL            1629546 Johannes   
#>  5 1022600001   2026      1 PT08M21.…  1.61e9 CON             203398 Griner     
#>  6 1022600001   2026      1 PT08M15.…  1.61e9 NYL            1631136 Astier     
#>  7 1022600001   2026      1 PT07M56.…  1.61e9 NYL            1631136 Astier     
#>  8 1022600001   2026      1 PT07M36.…  1.61e9 CON             203398 Griner     
#>  9 1022600001   2026      1 PT07M20.…  1.61e9 NYL            1629546 Johannes   
#> 10 1022600001   2026      1 PT07M06.…  1.61e9 NYL             204335 Laney-Hami…
#> # ℹ 27,596 more rows
#> # ℹ 10 more variables: action_type <chr>, sub_type <chr>, shot_result <chr>,
#> #   shot_value <int>, shot_distance <int>, x_legacy <int>, y_legacy <int>,
#> #   description <chr>, score_home <chr>, score_away <chr>
# }
# \donttest{
  try(load_wnba_stats_game_rosters(seasons = most_recent_wnba_stats_season()))
#> ──────────────────────────────────────────────────────────────── wehoop 3.0.0 ──
#> # A tibble: 610 × 10
#>    player_id first_name last_name        jersey_num  team_id team_city team_name
#>        <int> <chr>      <chr>            <chr>         <int> <chr>     <chr>    
#>  1   1630469 Marine     Fauthoux         "4   "       1.61e9 New York  Liberty  
#>  2   1630446 Michaela   Onyenwere        "12  "       1.61e9 Washingt… Mystics  
#>  3   1643430 Cotie      McMahon          "23  "       1.61e9 Washingt… Mystics  
#>  4   1643440 Darianna   Littlepage-Buggs "5   "       1.61e9 Washingt… Mystics  
#>  5   1643644 Alicia     Florez Getino    "2   "       1.61e9 Washingt… Mystics  
#>  6    204330 Isabelle   Harrison         "21  "       1.61e9 Toronto   Tempo    
#>  7   1643495 Justine    Pissott          "13  "       1.61e9 Indiana   Fever    
#>  8   1643424 Costanza   Verona           "6   "       1.61e9 Dallas    Wings    
#>  9   1630389 Dana       Evans            "11  "       1.61e9 Las Vegas Aces     
#> 10   1643434 Janiah     Barker           "2   "       1.61e9 Las Vegas Aces     
#> # ℹ 600 more rows
#> # ℹ 3 more variables: team_abbreviation <chr>, season <int>, game_id <chr>
# }
# \donttest{
  try(load_wnba_stats_officials(seasons = most_recent_wnba_stats_season()))
#> ──────────────────────────────────────────────────────────────── wehoop 3.0.0 ──
#> # A tibble: 606 × 6
#>    official_id first_name last_name        jersey_num season game_id   
#>          <int> <chr>      <chr>            <chr>       <int> <chr>     
#>  1      100274 Roy        Gulbeyan         "42  "       2026 1022600001
#>  2     1628169 Ryan       Sassano          "3   "       2026 1022600001
#>  3     1628482 Tyler      Mirkovich        "27  "       2026 1022600001
#>  4      202764 Charles    Watson           "6   "       2026 1022600002
#>  5      203891 Fatou      Cissoko-Stephens "15  "       2026 1022600002
#>  6     1629422 Clare      Simmons          "28  "       2026 1022600002
#>  7      200667 Angelica   Suffren          "7   "       2026 1022600003
#>  8     1641525 Sarah      Williams         "44  "       2026 1022600003
#>  9     1642142 Josh       Reed             "46  "       2026 1022600003
#> 10      202297 Tim        Greene           "9   "       2026 1022600004
#> # ℹ 596 more rows
# }
# \donttest{
  try(load_wnba_stats_player_game_logs(seasons = most_recent_wnba_stats_season()))
#> ──────────────────────────────────────────────────────────────── wehoop 3.0.0 ──
#> # A tibble: 4,415 × 35
#>    season_id team_id team_abbreviation team_name game_id game_date matchup wl   
#>    <chr>       <int> <chr>             <chr>     <chr>   <chr>     <chr>   <chr>
#>  1 22026      1.61e9 CON               Connecti… 102260… 2026-05-… CON @ … L    
#>  2 22026      1.61e9 TOR               Toronto … 102260… 2026-05-… TOR vs… L    
#>  3 22026      1.61e9 NYL               New York… 102260… 2026-05-… NYL vs… W    
#>  4 22026      1.61e9 GSV               Golden S… 102260… 2026-05-… GSV @ … W    
#>  5 22026      1.61e9 SEA               Seattle … 102260… 2026-05-… SEA vs… L    
#>  6 22026      1.61e9 WAS               Washingt… 102260… 2026-05-… WAS @ … W    
#>  7 22026      1.61e9 IND               Indiana … 102260… 2026-05-… IND vs… L    
#>  8 22026      1.61e9 ATL               Atlanta … 102260… 2026-05-… ATL @ … W    
#>  9 22026      1.61e9 DAL               Dallas W… 102260… 2026-05-… DAL @ … W    
#> 10 22026      1.61e9 CHI               Chicago … 102260… 2026-05-… CHI @ … W    
#> # ℹ 4,405 more rows
#> # ℹ 27 more variables: min <int>, fgm <int>, fga <int>, fg_pct <dbl>,
#> #   fg3m <int>, fg3a <int>, fg3_pct <dbl>, ftm <int>, fta <int>, ft_pct <dbl>,
#> #   oreb <int>, dreb <int>, reb <int>, ast <int>, stl <int>, blk <int>,
#> #   tov <int>, pf <int>, pts <int>, plus_minus <int>, video_available <int>,
#> #   season <int>, season_type <chr>, player_id <int>, player_name <chr>,
#> #   fantasy_pts <dbl>, measure_type <chr>
# }
# \donttest{
  try(load_wnba_stats_schedule(seasons = most_recent_wnba_stats_season()))
#> ──────────────────────────────────────────────────────────────── wehoop 3.0.0 ──
#> # A tibble: 202 × 15
#>    game_id    season season_type    game_date  matchup     home_team_id
#>    <chr>       <int> <chr>          <chr>      <chr>              <int>
#>  1 1022600001   2026 regular-season 2026-05-08 NYL vs. CON   1611661313
#>  2 1022600002   2026 regular-season 2026-05-08 TOR vs. WAS   1611661332
#>  3 1022600003   2026 regular-season 2026-05-08 SEA vs. GSV   1611661328
#>  4 1022600004   2026 regular-season 2026-05-09 IND vs. DAL   1611661325
#>  5 1022600005   2026 regular-season 2026-05-09 LVA vs. PHX   1611661319
#>  6 1022600006   2026 regular-season 2026-05-09 PDX vs. CHI   1611661327
#>  7 1022600007   2026 regular-season 2026-05-10 CON vs. SEA   1611661323
#>  8 1022600008   2026 regular-season 2026-05-10 WAS vs. NYL   1611661322
#>  9 1022600009   2026 regular-season 2026-05-10 LAS vs. LVA   1611661320
#> 10 1022600010   2026 regular-season 2026-05-09 MIN vs. ATL   1611661324
#> # ℹ 192 more rows
#> # ℹ 9 more variables: home_team_abbreviation <chr>, home_team_name <chr>,
#> #   home_pts <int>, home_wl <chr>, away_team_id <int>,
#> #   away_team_abbreviation <chr>, away_team_name <chr>, away_pts <int>,
#> #   away_wl <chr>
# }
# \donttest{
  try(load_wnba_stats_pbp(seasons = most_recent_wnba_stats_season()))
#> ──────────────────────────────────────────────────────────────── wehoop 3.0.0 ──
#> # A tibble: 86,784 × 38
#>    order_index action_number clock       period   team_id team_tricode person_id
#>          <int>         <int> <chr>        <int>     <int> <chr>            <int>
#>  1           0             2 PT10M00.00S      1    0      ""              0     
#>  2           1             4 PT10M00.00S      1    1.61e9 "NYL"           1.63e6
#>  3           2             7 PT09M44.00S      1    1.61e9 "CON"           1.64e6
#>  4           3             8 PT09M39.00S      1    1.61e9 "NYL"           1.63e6
#>  5           4             9 PT09M25.00S      1    1.61e9 "NYL"           1.63e6
#>  6           5            11 PT09M17.00S      1    1.61e9 "CON"           1.64e6
#>  7           6            13 PT09M06.00S      1    1.61e9 "NYL"           1.63e6
#>  8           7            15 PT08M50.00S      1    1.61e9 "CON"           2.03e5
#>  9           8            16 PT08M50.00S      1    0      ""              1.61e9
#> 10           9            17 PT08M34.00S      1    1.61e9 "NYL"           1.63e6
#> # ℹ 86,774 more rows
#> # ℹ 31 more variables: player_name <chr>, player_name_i <chr>, x_legacy <int>,
#> #   y_legacy <int>, shot_distance <int>, shot_result <chr>,
#> #   is_field_goal <int>, score_home <chr>, score_away <chr>,
#> #   points_total <int>, location <chr>, description <chr>, action_type <chr>,
#> #   sub_type <chr>, video_available <int>, shot_value <int>, action_id <int>,
#> #   game_id <chr>, seconds_remaining <dbl>, event_type <chr>, …
# }
# \donttest{
  try(load_wnba_stats_possessions(seasons = most_recent_wnba_stats_season()))
#> ──────────────────────────────────────────────────────────────── wehoop 3.0.0 ──
#> # A tibble: 32,265 × 34
#>    game_id    period possession_number offense_team_id defense_team_id
#>    <chr>       <int>             <int>           <int>           <int>
#>  1 1022600001      1                 1      1611661323      1611661313
#>  2 1022600001      1                 2      1611661313      1611661323
#>  3 1022600001      1                 3      1611661323      1611661313
#>  4 1022600001      1                 4      1611661313      1611661323
#>  5 1022600001      1                 5      1611661323      1611661313
#>  6 1022600001      1                 6      1611661313      1611661323
#>  7 1022600001      1                 7      1611661323      1611661313
#>  8 1022600001      1                 8      1611661313      1611661323
#>  9 1022600001      1                 9      1611661323      1611661313
#> 10 1022600001      1                10      1611661313      1611661323
#> # ℹ 32,255 more rows
#> # ℹ 29 more variables: start_order_index <int>, end_order_index <int>,
#> #   start_seconds_remaining <dbl>, end_seconds_remaining <dbl>, points <int>,
#> #   is_second_chance <lgl>, number_in_period <int>,
#> #   possession_start_type <chr>, count_as_possession <lgl>, fg2a <int>,
#> #   fg2m <int>, fg3a <int>, fg3m <int>, fta <int>, ftm <int>, oreb <int>,
#> #   dreb <int>, tov <int>, off_player_1 <int>, off_player_2 <int>, …
# }
```
