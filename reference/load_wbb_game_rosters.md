# **Load cleaned women's college basketball play-by-play from the data repo**

helper that loads multiple seasons from the data repo either into memory
or writes it into a db using some forwarded arguments in the dots

helper that loads multiple seasons from the data repo either into memory
or writes it into a db using some forwarded arguments in the dots

helper that loads multiple seasons from the data repo either into memory
or writes it into a db using some forwarded arguments in the dots

helper that loads multiple seasons from the data repo either into memory
or writes it into a db using some forwarded arguments in the dots

`load_wbb_rosters_manifest()` returns the per-season manifest CSV
(columns: `season`, `row_count`, `generated_at_utc`, `source_endpoint`)
describing which seasons are currently published to the release tag,
without downloading any season's full data.

`load_wbb_player_stats_manifest()` returns the per-season manifest CSV
(`season`, `row_count`, `generated_at_utc`, `source_endpoint`) for the
player season stats release tag without downloading any season's full
data.

`load_wbb_team_stats_manifest()` returns the per-season manifest CSV
(`season`, `row_count`, `generated_at_utc`, `source_endpoint`) for the
team season stats release tag without downloading any season's full
data.

`load_wbb_standings_manifest()` returns the per-season manifest CSV
(`season`, `row_count`, `generated_at_utc`, `source_endpoint`) for the
standings release tag without downloading any season's full data.

`load_wbb_shots_manifest()` returns the per-season manifest CSV
(`season`, `row_count`, `generated_at_utc`, `source_endpoint`) for the
shots release tag without downloading any season's full data.

`load_wbb_game_rosters_manifest()` returns the per-season manifest CSV
(`season`, `row_count`, `generated_at_utc`, `source_endpoint`) for the
game rosters release tag without downloading any season's full data.

`load_wbb_officials_manifest()` returns the per-season manifest CSV
(`season`, `row_count`, `generated_at_utc`, `source_endpoint`) for the
officials release tag without downloading any season's full data.

Loads season-level team rosters scraped from ESPN. One row per
athlete-team-season triple. Backed by the `wehoop-wbb-data` pipeline
that reads raw JSONs from `wehoop-wbb-raw` and publishes parquet/rds
artifacts to the `espn_womens_college_basketball_rosters` release tag.

Loads season-level player statistics scraped from ESPN. One row per
athlete-team-season-statistic-grouping. Backed by the `wehoop-wbb-data`
pipeline that reads raw JSONs from `wehoop-wbb-raw` and publishes
parquet/rds artifacts to the
`espn_womens_college_basketball_player_season_stats` release tag.

Loads season-level team statistics scraped from ESPN. One row per
team-season-statistic-grouping. Backed by the `wehoop-wbb-data` pipeline
that reads raw JSONs from `wehoop-wbb-raw` and publishes parquet/rds
artifacts to the `espn_womens_college_basketball_team_season_stats`
release tag.

Loads season-level conference and overall standings scraped from ESPN.
One row per team-season. Backed by the `wehoop-wbb-data` pipeline that
reads raw JSONs from `wehoop-wbb-raw` and publishes parquet/rds
artifacts to the `espn_womens_college_basketball_standings` release tag.

Loads shot events parsed from ESPN women's college basketball
play-by-play feeds. One row per shot attempt (made or missed), with
court coordinates and shot metadata. Backed by the `wehoop-wbb-data`
pipeline that reads raw JSONs from `wehoop-wbb-raw` and publishes
parquet/rds artifacts to the `espn_womens_college_basketball_shots`
release tag.

Loads per-game rosters scraped from ESPN women's college basketball box
scores. One row per athlete-team-game triple, with athlete identifiers,
jersey, position, starter flag, and DNP status. Backed by the
`wehoop-wbb-data` pipeline that reads raw JSONs from `wehoop-wbb-raw`
and publishes parquet/rds artifacts to the
`espn_womens_college_basketball_game_rosters` release tag.

Loads game-level officials data scraped from ESPN women's college
basketball summary feeds. One row per official-game pair. Backed by the
`wehoop-wbb-data` pipeline that reads raw JSONs from `wehoop-wbb-raw`
and publishes parquet/rds artifacts to the
`espn_womens_college_basketball_officials` release tag.

Loads ESPN WBB athlete core records – identity and biographical fields,
one row per athlete who appeared in the season. Backed by the
`wehoop-wbb-data` pipeline that reads raw JSONs from `wehoop-wbb-raw`
and publishes parquet/rds artifacts to the
`espn_womens_college_basketball_player_core` release tag.

This is the only source of athlete bio in the pipeline: the player
season stats payload carries no identity at all – not even the athlete
id.

Two properties of the source are worth knowing before joining:

- `current_team_id` is the athlete's CURRENT team, not their team in the
  requested season. Season team lives in `load_wbb_player_box()` /
  `load_wbb_player_stats()`.

- Bio (height / weight / jersey) is a current snapshot that ESPN
  overwrites in place; it is not era-correct for a historical season.
  The season dimension here is participation, not the bio's vintage.

Field coverage is era-dependent by nature – headshots exist only for
modern players, while college and date of birth thin out the other way.

## Usage

``` r
load_wbb_pbp(
  seasons = most_recent_wbb_season(),
  ...,
  dbConnection = NULL,
  tablename = NULL
)

load_wbb_team_box(
  seasons = most_recent_wbb_season(),
  ...,
  dbConnection = NULL,
  tablename = NULL
)

load_wbb_player_box(
  seasons = most_recent_wbb_season(),
  ...,
  dbConnection = NULL,
  tablename = NULL
)

load_wbb_schedule(
  seasons = most_recent_wbb_season(),
  ...,
  dbConnection = NULL,
  tablename = NULL
)

load_wbb_rosters_manifest()

load_wbb_player_stats_manifest()

load_wbb_team_stats_manifest()

load_wbb_standings_manifest()

load_wbb_shots_manifest()

load_wbb_game_rosters_manifest()

load_wbb_officials_manifest()

load_wbb_rosters(
  seasons = most_recent_wbb_season(),
  ...,
  dbConnection = NULL,
  tablename = NULL
)

load_wbb_player_stats(
  seasons = most_recent_wbb_season(),
  ...,
  dbConnection = NULL,
  tablename = NULL
)

load_wbb_team_stats(
  seasons = most_recent_wbb_season(),
  ...,
  dbConnection = NULL,
  tablename = NULL
)

load_wbb_standings(
  seasons = most_recent_wbb_season(),
  ...,
  dbConnection = NULL,
  tablename = NULL
)

load_wbb_shots(
  seasons = most_recent_wbb_season(),
  ...,
  dbConnection = NULL,
  tablename = NULL
)

load_wbb_game_rosters(
  seasons = most_recent_wbb_season(),
  ...,
  dbConnection = NULL,
  tablename = NULL
)

load_wbb_officials(
  seasons = most_recent_wbb_season(),
  ...,
  dbConnection = NULL,
  tablename = NULL
)

load_wbb_player_core(
  seasons = most_recent_wbb_season(),
  ...,
  dbConnection = NULL,
  tablename = NULL
)
```

## Arguments

- seasons:

  A vector of 4-digit years associated with given women's college
  basketball seasons, or `TRUE` for every published season. Each loader
  accepts only the seasons its release tag publishes (any other season
  is an error):

  - `load_wbb_pbp()`, `load_wbb_shots()`, `load_wbb_game_rosters()`:
    2004 onward.

  - `load_wbb_team_box()`, `load_wbb_player_box()`: 2004 onward.

  - `load_wbb_player_core()`: 2004 and 2006 onward (2005 was never
    published).

  - `load_wbb_schedule()`: 2001 onward.

  - `load_wbb_standings()`: 2003-2023 and 2026 onward.

  - `load_wbb_player_stats()`: 2006-2023 and 2026 onward.

  - `load_wbb_team_stats()`: 2010-2023 and 2026 onward.

  - `load_wbb_officials()`: 2014-2023 and 2026 onward.

  - `load_wbb_rosters()`: 2026 onward.

  2024 and 2025 were never published for the season stats, standings and
  officials. A few seasons are published as `.parquet` only (2005 box
  scores, 2023 season stats, standings and officials, 2023-2025 game
  rosters); those need the arrow package. The upper bound is
  [`most_recent_wbb_season()`](https://wehoop.sportsdataverse.org/reference/most_recent_wbb_season.md).
  When `seasons` is left at its default and that season's file is not
  published yet, the loader reads the newest published season instead,
  with a message. An explicit request for an unpublished season is kept
  as asked: the read warns and returns an empty frame. ESPN join ids are
  integer: `game_id` in `load_wbb_game_rosters()` and
  `load_wbb_officials()`, `athlete_id` in `load_wbb_rosters()`.

- ...:

  Additional arguments passed to an underlying function that writes the
  season data into a database.

- dbConnection:

  A `DBIConnection` object, as returned by
  [`DBI::dbConnect()`](https://dbi.r-dbi.org/reference/dbConnect.html)

- tablename:

  The name of the player core table within the database

## Value

A dataframe of play-by-play events with the columns documented below:

|  |  |
|----|----|
| col_name | description |
| shooting_play | Logical value (TRUE/FALSE) indicating whether the play was a shooting play |
| sequence_number | Sequence number is supposed to represent a shot-possession, examine the last two numbers to see if there are multiple events that occur within the same shot-possession. A shot-possession is basically any sequence of plays until there is a shot, change in possession, and probably things like technical fouls and the like. So as soon as a shot goes up, a new sequence starts regardless, even if the shooting team retains possession via offensive or deadball rebound. The first portion of the number is usually time related (i.e. the numeric representation of when the sequence started, from a seconds remaining in the period perspective or so) |
| period_display_value | Long form of period (1st quarter, 2nd Quarter, OT, etc.) |
| period_number | The numeric period of play in the game |
| home_score | Home score after the play. Rebuilt from the scoring plays in feed order when that reaches the official final (score_source 'rebuilt'), otherwise ESPN's per-play value (score_source 'espn') |
| scoring_play | Logical value (TRUE/FALSE) indicating whether the play was a play on which the offense scored |
| clock_display_value | Time left within the period |
| team_id | Unique team identification number for the offensive team |
| type_id | Unique play type identifcation number |
| type_text | Play type text description, passed through verbatim from ESPN. Note: ESPN labels the free-throw play TYPE "MadeFreeThrow" for made AND missed free throws; filter makes vs. misses with `scoring_play` (TRUE = made), not `type_text` |
| away_score | Away score after the play. Rebuilt from the scoring plays in feed order when that reaches the official final (score_source 'rebuilt'), otherwise ESPN's per-play value (score_source 'espn') |
| id | Unique play identifcation number |
| text | Text description of the play |
| score_value | The points value of the shot taken (1 / 2 / 3). Set to the attempt's value even on misses (a missed free throw still carries 1); use `scoring_play` to identify points actually scored |
| participants_0_athlete_id | Unique player identification number |
| participants_1_athlete_id | Unique player identification number |
| season | Season of the game |
| season_type | Season type of the game, 1 is pre-season, 2 is regular season, 3 is post-season, 4 is off-season |
| away_team_id | Unique away team identification number |
| away_team_name | Away team name |
| away_team_mascot | Away team mascot |
| away_team_abbrev | Text abbreviation for the away team |
| away_team_name_alt | Alternate versions of the away team abbreviation |
| home_team_id | Unique home team identification number |
| home_team_name | home team name |
| home_team_mascot | home team mascot |
| home_team_abbrev | Text abbreviation for the home team |
| home_team_name_alt | Alternate versions of the home team abbreviation |
| home_team_spread | The game spread with respect to the home team |
| game_spread | Game spread in (-X Team) format |
| home_favorite | Logical (TRUE/FALSE) indicating whether the home team is favored |
| game_spread_available | Logical (TRUE/FALSE) indicating whether the spread was available from ESPN. Basically, I would just not recommend using any of the spread information, I think I defaulted a lot of them to -2.5 for the home team. Most games probably do not have spread information. This column should really be listed first |
| game_id | Unique identifier for the game event |
| qtr | Quarter of the game |
| time | Time left within the period |
| clock_minutes | Clock minutes split from seconds for developer convenience |
| clock_seconds | Clock seconds split from minutes for developer convenience |
| half | Half of the game |
| game_half | Half of the game |
| lag_qtr | A lag column on the quarter |
| lead_qtr | A lead column on the quarter |
| lag_game_half | A lag column on the half |
| lead_game_half | A lead column on the half |
| start_quarter_seconds_remaining | Quarter seconds remaining at the start of the play (these are more or less code artifacts from other sports, but may eventually be used more seriously) |
| start_half_seconds_remaining | Game half seconds remaining at the start of the play (these are more or less code artifacts from other sports, but may eventually be used more seriously) |
| start_game_seconds_remaining | Game seconds remaining at the start of the play (”') |
| game_play_number | Game play number |
| end_quarter_seconds_remaining | Quarter seconds remaining at the end of the play (”') |
| end_half_seconds_remaining | Game half seconds remaining at the end of the play (”') |
| end_game_seconds_remaining | Game seconds remaining at the end of the play (”') |
| period | Period of the game |
| coordinate_x | The entire scale is a rectangle of size 25x47, intended as a half-court representation of the basketball court (i.e. on the side of the offense), with each coordinate unit representing a foot. It appears that the basket is roughly represented as the (25, 0) point. This is a nonsensical definition when considering that the basket overhangs the court, with the backboard aligned 48 inches from the baseline, then the center of the hoop being roughly 11 inches from there. This is an idiosyncracy of either sensor placement or software and data entry. Use your best judgement in making your charts, I think you will find that making some translations will be helpful. |
| coordinate_y |  |
| week | Apparently there are weeks |
| media_id | Where did you come from |
| pregame_home_prob | Pre-game win probability for the home team, constant across every play of the game |
| home_win_prob | Home team's win probability at this play, updated play-by-play |
| score_source | Where this game's home_score/away_score come from: 'rebuilt' (summed from the scoring plays and equal to the official final on the last play) or 'espn' (ESPN's per-play values, kept when the rebuild misses the final or the game has no final). Absent from seasons published before the repair |

Returns a tibble

Returns a tibble

Returns a tibble

Returns a `wehoop_data` tibble with one row per athlete-team-season.

Returns a `wehoop_data` tibble of player season stats.

Returns a `wehoop_data` tibble of team season stats.

Columns as documented in the shared
[basketball_load_wbb_team_stats_schema](https://wehoop.sportsdataverse.org/reference/basketball_load_wbb_team_stats_schema.md)
table.

Returns a `wehoop_data` tibble of team standings.

Columns as documented in the shared
[basketball_load_wbb_standings_schema](https://wehoop.sportsdataverse.org/reference/basketball_load_wbb_standings_schema.md)
table.

Returns a `wehoop_data` tibble with one row per shot attempt.

Columns as documented in the shared
[basketball_load_wbb_shots_schema](https://wehoop.sportsdataverse.org/reference/basketball_load_wbb_shots_schema.md)
table.

Returns a `wehoop_data` tibble with one row per athlete-team-game.

Columns as documented in the shared
[basketball_load_wbb_game_rosters_schema](https://wehoop.sportsdataverse.org/reference/basketball_load_wbb_game_rosters_schema.md)
table.

Returns a `wehoop_data` tibble with one row per official-game pair.

Columns as documented in the shared
[basketball_load_wbb_officials_schema](https://wehoop.sportsdataverse.org/reference/basketball_load_wbb_officials_schema.md)
table.

Returns a `wehoop_data` tibble of athlete core records.

## Examples

``` r
# \donttest{
  try(load_wbb_pbp())
#> ℹ `load_wbb_pbp()`: season 2027 is not published yet; loading 2026 instead.
#> ──────────────────────────────────────────────────────────────── wehoop 3.1.0 ──
#> # A tibble: 2,824,090 × 71
#>    game_play_number      id sequence_number type_id type_text   text  away_score
#>               <int>   <dbl>           <int>   <int> <chr>       <chr>      <int>
#>  1                1 4.02e17       115103884     615 Jumpball    Star…          0
#>  2                2 4.02e17       115103886     615 Jumpball    Jump…          0
#>  3                3 4.02e17       115103888     615 Jumpball    Jump…          0
#>  4                4 4.02e17       115103895     558 JumpShot    Tana…          0
#>  5                5 4.02e17       115103896     587 Defensive … Amar…          0
#>  6                6 4.02e17       115103913     598 Lost Ball … Hale…          0
#>  7                7 4.02e17       115103914     607 Steal       Iman…          0
#>  8                8 4.02e17       115103922     558 JumpShot    Iman…          0
#>  9                9 4.02e17       115103924     587 Defensive … Mica…          0
#> 10               10 4.02e17       115103936     558 JumpShot    Mica…          3
#> # ℹ 2,824,080 more rows
#> # ℹ 64 more variables: home_score <int>, period_number <int>,
#> #   period_display_value <chr>, clock_display_value <chr>, scoring_play <lgl>,
#> #   score_value <int>, wallclock <chr>, shooting_play <lgl>,
#> #   coordinate_x_raw <dbl>, coordinate_y_raw <dbl>, points_attempted <int>,
#> #   short_description <chr>, team_id <int>, athlete_id_1 <int>,
#> #   athlete_id_2 <int>, game_id <int>, season <int>, season_type <int>, …
# }
# \donttest{
  try(load_wbb_team_box())
#> ℹ `load_wbb_team_box()`: season 2027 is not published yet; loading 2026
#>   instead.
#> ──────────────────────────────────────────────────────────────── wehoop 3.1.0 ──
#> # A tibble: 12,058 × 58
#>      game_id season season_type game_date  game_date_time      team_id team_uid 
#>        <int>  <int>       <int> <date>     <dttm>                <int> <chr>    
#>  1 401856590   2026           3 2026-04-05 2026-04-05 15:30:00    2579 s:40~l:5…
#>  2 401856590   2026           3 2026-04-05 2026-04-05 15:30:00      26 s:40~l:5…
#>  3 401865139   2026           3 2026-04-04 2026-04-04 15:00:00    2287 s:40~l:5…
#>  4 401865139   2026           3 2026-04-04 2026-04-04 15:00:00     276 s:40~l:5…
#>  5 401856588   2026           3 2026-04-03 2026-04-03 19:00:00    2579 s:40~l:5…
#>  6 401856588   2026           3 2026-04-03 2026-04-03 19:00:00      41 s:40~l:5…
#>  7 401856589   2026           3 2026-04-03 2026-04-03 21:40:00     251 s:40~l:5…
#>  8 401856589   2026           3 2026-04-03 2026-04-03 21:40:00      26 s:40~l:5…
#>  9 401858323   2026           3 2026-04-01 2026-04-01 19:00:00     171 s:40~l:5…
#> 10 401858323   2026           3 2026-04-01 2026-04-01 19:00:00     252 s:40~l:5…
#> # ℹ 12,048 more rows
#> # ℹ 51 more variables: team_slug <chr>, team_location <chr>, team_name <chr>,
#> #   team_abbreviation <chr>, team_display_name <chr>,
#> #   team_short_display_name <chr>, team_color <chr>,
#> #   team_alternate_color <chr>, team_logo <chr>, team_home_away <chr>,
#> #   team_score <int>, team_winner <lgl>, assists <int>, blocks <int>,
#> #   defensive_rebounds <int>, fast_break_points <chr>, field_goal_pct <dbl>, …
# }
# \donttest{
  try(load_wbb_player_box())
#> ℹ `load_wbb_player_box()`: season 2027 is not published yet; loading 2026
#>   instead.
#> ──────────────────────────────────────────────────────────────── wehoop 3.1.0 ──
#> # A tibble: 168,228 × 55
#>      game_id season season_type game_date  game_date_time      athlete_id
#>        <int>  <int>       <int> <date>     <dttm>                   <int>
#>  1 401856590   2026           3 2026-04-05 2026-04-05 15:30:00    5239100
#>  2 401856590   2026           3 2026-04-05 2026-04-05 15:30:00    5108587
#>  3 401856590   2026           3 2026-04-05 2026-04-05 15:30:00    5174284
#>  4 401856590   2026           3 2026-04-05 2026-04-05 15:30:00    4609797
#>  5 401856590   2026           3 2026-04-05 2026-04-05 15:30:00    4433797
#>  6 401856590   2026           3 2026-04-05 2026-04-05 15:30:00    5329673
#>  7 401856590   2026           3 2026-04-05 2026-04-05 15:30:00    4434019
#>  8 401856590   2026           3 2026-04-05 2026-04-05 15:30:00    5311577
#>  9 401856590   2026           3 2026-04-05 2026-04-05 15:30:00    5311576
#> 10 401856590   2026           3 2026-04-05 2026-04-05 15:30:00    5239099
#> # ℹ 168,218 more rows
#> # ℹ 49 more variables: athlete_display_name <chr>, team_id <int>,
#> #   team_name <chr>, team_location <chr>, team_short_display_name <chr>,
#> #   minutes <dbl>, field_goals_made <int>, field_goals_attempted <int>,
#> #   three_point_field_goals_made <int>,
#> #   three_point_field_goals_attempted <int>, free_throws_made <int>,
#> #   free_throws_attempted <int>, offensive_rebounds <int>, …
# }
# \donttest{
  try(load_wbb_schedule())
#> ──────────────────────────────────────────────────────────────── wehoop 3.1.0 ──
#> # A tibble: 5,814 × 98
#>         id uid   date  attendance time_valid neutral_site play_by_play_available
#>      <int> <chr> <chr>      <dbl> <lgl>      <lgl>        <lgl>                 
#>  1  4.02e8 s:40… 2027…          0 TRUE       FALSE        FALSE                 
#>  2  4.02e8 s:40… 2027…          0 TRUE       FALSE        FALSE                 
#>  3  4.02e8 s:40… 2027…          0 TRUE       FALSE        FALSE                 
#>  4  4.02e8 s:40… 2027…          0 TRUE       FALSE        FALSE                 
#>  5  4.02e8 s:40… 2027…          0 TRUE       FALSE        FALSE                 
#>  6  4.02e8 s:40… 2027…          0 TRUE       FALSE        FALSE                 
#>  7  4.02e8 s:40… 2027…          0 TRUE       FALSE        FALSE                 
#>  8  4.02e8 s:40… 2027…          0 TRUE       FALSE        FALSE                 
#>  9  4.02e8 s:40… 2027…          0 TRUE       FALSE        FALSE                 
#> 10  4.02e8 s:40… 2027…          0 TRUE       FALSE        FALSE                 
#> # ℹ 5,804 more rows
#> # ℹ 91 more variables: recent <lgl>, start_date <chr>, broadcast <chr>,
#> #   notes_type <chr>, notes_headline <chr>, broadcast_market <chr>,
#> #   broadcast_name <chr>, type_id <int>, type_abbreviation <chr>,
#> #   venue_id <int>, venue_full_name <chr>, venue_address_city <chr>,
#> #   venue_address_state <chr>, venue_indoor <lgl>, status_clock <dbl>,
#> #   status_display_clock <chr>, status_period <dbl>, status_type_id <int>, …
# }
# \donttest{
  try(load_wbb_rosters(seasons = most_recent_wbb_season()))
#> ──────────────────────────────────────────────────────────────── wehoop 3.1.0 ──
#> # A tibble: 9,680 × 36
#>    season team_id team_slug team_abbreviation team_display_name         
#>     <int>   <int> <chr>     <chr>             <chr>                     
#>  1   2027       1 NA        UAA               Alaska Anchorage Seawolves
#>  2   2027       1 NA        UAA               Alaska Anchorage Seawolves
#>  3   2027       1 NA        UAA               Alaska Anchorage Seawolves
#>  4   2027       1 NA        UAA               Alaska Anchorage Seawolves
#>  5   2027       1 NA        UAA               Alaska Anchorage Seawolves
#>  6   2027       1 NA        UAA               Alaska Anchorage Seawolves
#>  7   2027       1 NA        UAA               Alaska Anchorage Seawolves
#>  8   2027       1 NA        UAA               Alaska Anchorage Seawolves
#>  9   2027       1 NA        UAA               Alaska Anchorage Seawolves
#> 10   2027       1 NA        UAA               Alaska Anchorage Seawolves
#> # ℹ 9,670 more rows
#> # ℹ 31 more variables: team_short_display_name <chr>, team_color <chr>,
#> #   team_alternate_color <chr>, team_logo <chr>, athlete_id <int>, uid <chr>,
#> #   guid <chr>, full_name <chr>, display_name <chr>, short_name <chr>,
#> #   first_name <chr>, last_name <chr>, jersey <chr>,
#> #   position_abbreviation <chr>, position_name <chr>, position_id <int>,
#> #   height <chr>, weight <chr>, age <chr>, date_of_birth <chr>, …
# }
# \donttest{
  try(load_wbb_player_stats(seasons = most_recent_wbb_season()))
#> Warning: Failed to read <https://github.com/sportsdataverse/sportsdataverse-data/releases/download/espn_womens_college_basketball_player_season_stats/player_season_stats_2027.rds> (or its .parquet sibling)
#> ──────────────────────────────────────────────────────────────── wehoop 3.1.0 ──
#> # A tibble: 0 × 0
# }
# \donttest{
  try(load_wbb_team_stats(seasons = most_recent_wbb_season()))
#> Warning: Failed to read <https://github.com/sportsdataverse/sportsdataverse-data/releases/download/espn_womens_college_basketball_team_season_stats/team_season_stats_2027.rds> (or its .parquet sibling)
#> ──────────────────────────────────────────────────────────────── wehoop 3.1.0 ──
#> # A tibble: 0 × 0
# }
# \donttest{
  try(load_wbb_standings(seasons = most_recent_wbb_season()))
#> ──────────────────────────────────────────────────────────────── wehoop 3.1.0 ──
#> # A tibble: 30,492 × 24
#>    season group_id group_name        group_abbreviation group_short_name team_id
#>     <int>    <int> <chr>             <chr>              <chr>              <int>
#>  1   2027        1 America East Con… aeast              Am. East            2066
#>  2   2027        1 America East Con… aeast              Am. East            2066
#>  3   2027        1 America East Con… aeast              Am. East            2066
#>  4   2027        1 America East Con… aeast              Am. East            2066
#>  5   2027        1 America East Con… aeast              Am. East            2066
#>  6   2027        1 America East Con… aeast              Am. East            2066
#>  7   2027        1 America East Con… aeast              Am. East            2066
#>  8   2027        1 America East Con… aeast              Am. East            2066
#>  9   2027        1 America East Con… aeast              Am. East            2066
#> 10   2027        1 America East Con… aeast              Am. East            2066
#> # ℹ 30,482 more rows
#> # ℹ 18 more variables: team_uid <chr>, team_slug <chr>, team_location <chr>,
#> #   team_name <chr>, team_abbreviation <chr>, team_display_name <chr>,
#> #   team_short_display_name <chr>, team_color <chr>,
#> #   team_alternate_color <chr>, team_logo <chr>, stat_name <chr>,
#> #   stat_display_name <chr>, stat_short_display_name <chr>,
#> #   stat_description <chr>, stat_abbreviation <chr>, stat_type <chr>, …
# }
# \donttest{
  try(load_wbb_shots(seasons = most_recent_wbb_season()))
#> Warning: cannot open URL 'https://github.com/sportsdataverse/sportsdataverse-data/releases/download/espn_womens_college_basketball_shots/shots_2027.rds': HTTP status was '404 Not Found'
#> Warning: Failed to readRDS from <https://github.com/sportsdataverse/sportsdataverse-data/releases/download/espn_womens_college_basketball_shots/shots_2027.rds>
#> ──────────────────────────────────────────────────────────────── wehoop 3.1.0 ──
#> # A tibble: 0 × 0
# }
# \donttest{
  try(load_wbb_game_rosters(seasons = most_recent_wbb_season()))
#> Warning: Failed to read <https://github.com/sportsdataverse/sportsdataverse-data/releases/download/espn_womens_college_basketball_game_rosters/game_rosters_2027.rds> (or its .parquet sibling)
#> ──────────────────────────────────────────────────────────────── wehoop 3.1.0 ──
#> # A tibble: 0 × 0
# }
# \donttest{
  try(load_wbb_officials(seasons = most_recent_wbb_season()))
#> Warning: Failed to read <https://github.com/sportsdataverse/sportsdataverse-data/releases/download/espn_womens_college_basketball_officials/officials_2027.rds> (or its .parquet sibling)
#> ──────────────────────────────────────────────────────────────── wehoop 3.1.0 ──
#> # A tibble: 0 × 0
# }
# \donttest{
  try(load_wbb_player_core(seasons = most_recent_wbb_season()))
#> Warning: cannot open URL 'https://github.com/sportsdataverse/sportsdataverse-data/releases/download/espn_womens_college_basketball_player_core/player_core_2027.rds': HTTP status was '404 Not Found'
#> Warning: Failed to readRDS from <https://github.com/sportsdataverse/sportsdataverse-data/releases/download/espn_womens_college_basketball_player_core/player_core_2027.rds>
#> ──────────────────────────────────────────────────────────────── wehoop 3.1.0 ──
#> # A tibble: 0 × 0
# }
```
