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
| type_id | Unique play type identification number |
| type_text | Play type text description, passed through verbatim from ESPN. Note: ESPN labels the free-throw play TYPE "MadeFreeThrow" for made AND missed free throws; filter makes vs. misses with `scoring_play` (TRUE = made), not `type_text` |
| away_score | Away score after the play. Rebuilt from the scoring plays in feed order when that reaches the official final (score_source 'rebuilt'), otherwise ESPN's per-play value (score_source 'espn') |
| id | Unique play identification number |
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
| coordinate_x | The entire scale is a rectangle of size 25x47, intended as a half-court representation of the basketball court (i.e. on the side of the offense), with each coordinate unit representing a foot. It appears that the basket is roughly represented as the (25, 0) point. This is a nonsensical definition when considering that the basket overhangs the court, with the backboard aligned 48 inches from the baseline, then the center of the hoop being roughly 11 inches from there. This is an idiosyncrasy of either sensor placement or software and data entry. Use your best judgement in making your charts, I think you will find that making some translations will be helpful. |
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
if (FALSE) { # interactive()
# \donttest{
  # A season of this table is a multi-MB download, so the example runs interactively only.
  try(load_wbb_pbp())
# }
}
# \donttest{
  try(load_wbb_team_box())
#> ──────────────────────────────────────────────────────────────── wehoop 3.1.0 ──
#> # A tibble: 838 × 58
#>      game_id season season_type game_date  game_date_time      team_id team_uid 
#>        <int>  <int>       <int> <date>     <dttm>                <int> <chr>    
#>  1 401918841   2027           2 2026-11-07 2026-11-07 20:00:00    2458 s:40~l:5…
#>  2 401918841   2027           2 2026-11-07 2026-11-07 20:00:00     251 s:40~l:5…
#>  3 401918909   2027           2 2026-11-07 2026-11-07 15:00:00     135 s:40~l:5…
#>  4 401918909   2027           2 2026-11-07 2026-11-07 15:00:00     269 s:40~l:5…
#>  5 401927061   2027           2 2026-11-07 2026-11-07 15:00:00    2582 s:40~l:5…
#>  6 401927061   2027           2 2026-11-07 2026-11-07 15:00:00     356 s:40~l:5…
#>  7 401929031   2027           2 2026-11-07 2026-11-07 11:00:00    2309 s:40~l:5…
#>  8 401929031   2027           2 2026-11-07 2026-11-07 11:00:00      94 s:40~l:5…
#>  9 401925621   2027           2 2026-11-07 2026-11-07 12:00:00    2428 s:40~l:5…
#> 10 401925621   2027           2 2026-11-07 2026-11-07 12:00:00     350 s:40~l:5…
#> # ℹ 828 more rows
#> # ℹ 51 more variables: team_slug <chr>, team_location <chr>, team_name <chr>,
#> #   team_abbreviation <chr>, team_display_name <chr>,
#> #   team_short_display_name <chr>, team_color <chr>,
#> #   team_alternate_color <chr>, team_logo <chr>, team_home_away <chr>,
#> #   team_score <int>, team_winner <lgl>, assists <int>, blocks <int>,
#> #   defensive_rebounds <int>, fast_break_points <chr>, field_goal_pct <dbl>, …
# }
if (FALSE) { # interactive()
# \donttest{
  # A season of this table is a multi-MB download, so the example runs interactively only.
  try(load_wbb_player_box())
# }
}
# \donttest{
  try(load_wbb_schedule())
#> ──────────────────────────────────────────────────────────────── wehoop 3.1.0 ──
#> # A tibble: 5,805 × 97
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
#> # ℹ 5,795 more rows
#> # ℹ 90 more variables: recent <lgl>, start_date <chr>, broadcast <chr>,
#> #   notes_type <chr>, notes_headline <chr>, broadcast_market <chr>,
#> #   broadcast_name <chr>, type_id <int>, type_abbreviation <chr>,
#> #   venue_id <int>, venue_full_name <chr>, venue_address_city <chr>,
#> #   venue_address_state <chr>, venue_indoor <lgl>, status_clock <dbl>,
#> #   status_display_clock <chr>, status_period <dbl>, status_type_id <int>, …
# }
# \donttest{
  try(load_wbb_rosters(seasons = most_recent_wbb_season()))
#> ──────────────────────────────────────────────────────────────── wehoop 3.1.0 ──
#> # A tibble: 9,879 × 36
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
#> # ℹ 9,869 more rows
#> # ℹ 31 more variables: team_short_display_name <chr>, team_color <chr>,
#> #   team_alternate_color <chr>, team_logo <chr>, athlete_id <int>, uid <chr>,
#> #   guid <chr>, full_name <chr>, display_name <chr>, short_name <chr>,
#> #   first_name <chr>, last_name <chr>, jersey <chr>,
#> #   position_abbreviation <chr>, position_name <chr>, position_id <int>,
#> #   height <chr>, weight <chr>, age <chr>, date_of_birth <chr>, …
# }
# \donttest{
  try(load_wbb_player_stats(seasons = most_recent_wbb_season()))
#> ──────────────────────────────────────────────────────────────── wehoop 3.1.0 ──
#> # A tibble: 35,448 × 16
#>    season athlete_id athlete_display_name athlete_first_name athlete_last_name
#>     <int>      <int> <chr>                <chr>              <chr>            
#>  1   2027    4433418 Kateri Poole         Kateri             Poole            
#>  2   2027    4433418 Kateri Poole         Kateri             Poole            
#>  3   2027    4433418 Kateri Poole         Kateri             Poole            
#>  4   2027    4433418 Kateri Poole         Kateri             Poole            
#>  5   2027    4433418 Kateri Poole         Kateri             Poole            
#>  6   2027    4433418 Kateri Poole         Kateri             Poole            
#>  7   2027    4433418 Kateri Poole         Kateri             Poole            
#>  8   2027    4433418 Kateri Poole         Kateri             Poole            
#>  9   2027    4433418 Kateri Poole         Kateri             Poole            
#> 10   2027    4433418 Kateri Poole         Kateri             Poole            
#> # ℹ 35,438 more rows
#> # ℹ 11 more variables: athlete_position_abbreviation <chr>,
#> #   athlete_jersey <chr>, team_id <int>, team_display_name <chr>,
#> #   category <chr>, stat_label <chr>, stat_name <chr>, stat_display_name <chr>,
#> #   stat_description <chr>, display_value <chr>, value <dbl>
# }
# \donttest{
  try(load_wbb_team_stats(seasons = most_recent_wbb_season()))
#> ──────────────────────────────────────────────────────────────── wehoop 3.1.0 ──
#> # A tibble: 21,870 × 16
#>    season team_id team_slug team_abbreviation team_display_name    
#>     <int>   <int> <chr>     <chr>             <chr>                
#>  1   2027     103 NA        BC                Boston College Eagles
#>  2   2027     103 NA        BC                Boston College Eagles
#>  3   2027     103 NA        BC                Boston College Eagles
#>  4   2027     103 NA        BC                Boston College Eagles
#>  5   2027     103 NA        BC                Boston College Eagles
#>  6   2027     103 NA        BC                Boston College Eagles
#>  7   2027     103 NA        BC                Boston College Eagles
#>  8   2027     103 NA        BC                Boston College Eagles
#>  9   2027     103 NA        BC                Boston College Eagles
#> 10   2027     103 NA        BC                Boston College Eagles
#> # ℹ 21,860 more rows
#> # ℹ 11 more variables: team_short_display_name <chr>, team_color <chr>,
#> #   team_alternate_color <chr>, team_logo <chr>, category <chr>,
#> #   stat_label <chr>, stat_name <chr>, stat_display_name <chr>,
#> #   stat_description <chr>, display_value <chr>, value <dbl>
# }
# \donttest{
  try(load_wbb_standings(seasons = most_recent_wbb_season()))
#> ──────────────────────────────────────────────────────────────── wehoop 3.1.0 ──
#> # A tibble: 30,492 × 24
#>    season group_id group_name        group_abbreviation group_short_name team_id
#>     <int>    <int> <chr>             <chr>              <chr>              <int>
#>  1   2027        1 America East Con… aeast              Am. East            2803
#>  2   2027        1 America East Con… aeast              Am. East            2803
#>  3   2027        1 America East Con… aeast              Am. East            2803
#>  4   2027        1 America East Con… aeast              Am. East            2803
#>  5   2027        1 America East Con… aeast              Am. East            2803
#>  6   2027        1 America East Con… aeast              Am. East            2803
#>  7   2027        1 America East Con… aeast              Am. East            2803
#>  8   2027        1 America East Con… aeast              Am. East            2803
#>  9   2027        1 America East Con… aeast              Am. East            2803
#> 10   2027        1 America East Con… aeast              Am. East            2803
#> # ℹ 30,482 more rows
#> # ℹ 18 more variables: team_uid <chr>, team_slug <chr>, team_location <chr>,
#> #   team_name <chr>, team_abbreviation <chr>, team_display_name <chr>,
#> #   team_short_display_name <chr>, team_color <chr>,
#> #   team_alternate_color <chr>, team_logo <chr>, stat_name <chr>,
#> #   stat_display_name <chr>, stat_short_display_name <chr>,
#> #   stat_description <chr>, stat_abbreviation <chr>, stat_type <chr>, …
# }
if (FALSE) { # interactive()
# \donttest{
  # A season of this table is a multi-MB download, so the example runs interactively only.
  try(load_wbb_shots(seasons = most_recent_wbb_season()))
# }
}
if (FALSE) { # interactive()
# \donttest{
  # A season of this table is a multi-MB download, so the example runs interactively only.
  try(load_wbb_game_rosters(seasons = most_recent_wbb_season()))
# }
}
# \donttest{
  try(load_wbb_officials(seasons = most_recent_wbb_season()))
#> ──────────────────────────────────────────────────────────────── wehoop 3.1.0 ──
#> # A tibble: 1,178 × 11
#>    season   game_id official_id official_uid official_full_name
#>     <int>     <int>       <int> <chr>        <chr>             
#>  1   2027 401920983       18906 NA           Joseph Vaszily    
#>  2   2027 401920983       18960 NA           Karen Preato      
#>  3   2027 401920983       18864 NA           Denise Brooks     
#>  4   2027 401918849       19003 NA           Brian Garland     
#>  5   2027 401918849     3016292 NA           Kristen Bell      
#>  6   2027 401918849     3951517 NA           Natasha Camy      
#>  7   2027 401911736     2616125 NA           Michael DoCouto   
#>  8   2027 401911736     4316357 NA           Blanca Burns      
#>  9   2027 401911736     4605516 NA           Cori Chambers     
#> 10   2027 401920491       18971 NA           Michol Murray     
#> # ℹ 1,168 more rows
#> # ℹ 6 more variables: official_display_name <chr>, official_first_name <chr>,
#> #   official_last_name <chr>, official_order <int>, position_name <chr>,
#> #   position_display_name <chr>
# }
# \donttest{
  try(load_wbb_player_core(seasons = most_recent_wbb_season()))
#> ──────────────────────────────────────────────────────────────── wehoop 3.1.0 ──
#> # A tibble: 6,870 × 36
#>    season athlete_id guid       uid   slug  type  first_name last_name full_name
#>     <int>      <int> <chr>      <chr> <chr> <chr> <chr>      <chr>     <chr>    
#>  1   2027    4433418 279c890e-… s:40… kate… bask… Kateri     Poole     Kateri P…
#>  2   2027    4433552 8559dce2-… s:40… vale… bask… Valencia   Fontenel… Valencia…
#>  3   2027    4433794 d0bcecd5-… s:40… aali… bask… Aaliyah    Moore     Aaliyah …
#>  4   2027    4433806 81a5f623-… s:40… kynd… bask… Kyndall    Hunter    Kyndall …
#>  5   2027    4565508 58679854-… s:40… kk-b… bask… KK         Bransford KK Brans…
#>  6   2027    4565512 2db5e562-… s:40… zyan… bask… Zyanna     Walker    Zyanna W…
#>  7   2027    4565516 422bd6d6-… s:40… ashl… bask… Ashlyn     Watkins   Ashlyn W…
#>  8   2027    4565520 1f430e41-… s:40… samy… bask… Sa'Myah    Smith     Sa'Myah …
#>  9   2027    4565525 e2153da0-… s:40… amiy… bask… Amiya      Joyner    Amiya Jo…
#> 10   2027    4565530 594f7378-… s:40… mila… bask… Mila       Reynolds  Mila Rey…
#> # ℹ 6,860 more rows
#> # ℹ 27 more variables: display_name <chr>, short_name <chr>, height <dbl>,
#> #   display_height <chr>, weight <dbl>, display_weight <chr>, age <int>,
#> #   date_of_birth <chr>, birth_city <chr>, birth_state <chr>,
#> #   birth_country <chr>, jersey <chr>, position_id <int>, position_name <chr>,
#> #   position_abbreviation <chr>, position_display_name <chr>, college_id <int>,
#> #   current_team_id <int>, headshot_href <chr>, experience_years <int>, …
# }
```
