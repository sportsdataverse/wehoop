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

  A vector of 4-digit years associated with given WBB seasons. (Min:
  2004)

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
| home_score | Home score at the time of the play |
| scoring_play | Logical value (TRUE/FALSE) indicating whether the play was a play on which the offense scored |
| clock_display_value | Time left within the period |
| team_id | Unique team identification number for the offensive team |
| type_id | Unique play type identifcation number |
| type_text | Play type text description, passed through verbatim from ESPN. Note: ESPN labels the free-throw play TYPE "MadeFreeThrow" for made AND missed free throws; filter makes vs. misses with `scoring_play` (TRUE = made), not `type_text` |
| away_score | Away score at the time of the play |
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
#> ──────────────────────────────────────────────────────────────── wehoop 3.0.0 ──
#> # A tibble: 2,824,090 × 70
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
#> # ℹ 63 more variables: home_score <int>, period_number <int>,
#> #   period_display_value <chr>, clock_display_value <chr>, scoring_play <lgl>,
#> #   score_value <int>, wallclock <chr>, shooting_play <lgl>,
#> #   coordinate_x_raw <dbl>, coordinate_y_raw <dbl>, points_attempted <int>,
#> #   short_description <chr>, team_id <int>, athlete_id_1 <int>,
#> #   athlete_id_2 <int>, game_id <int>, season <int>, season_type <int>, …
# }
# \donttest{
  try(load_wbb_team_box())
#> ──────────────────────────────────────────────────────────────── wehoop 3.0.0 ──
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
#> ──────────────────────────────────────────────────────────────── wehoop 3.0.0 ──
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
#> ──────────────────────────────────────────────────────────────── wehoop 3.0.0 ──
#> # A tibble: 6,054 × 86
#>         id uid   date  attendance time_valid neutral_site conference_competition
#>      <int> <chr> <chr>      <dbl> <lgl>      <lgl>        <lgl>                 
#>  1  4.02e8 s:40… 2026…      15856 TRUE       TRUE         FALSE                 
#>  2  4.02e8 s:40… 2026…       5475 TRUE       FALSE        FALSE                 
#>  3  4.02e8 s:40… 2026…      15856 TRUE       TRUE         FALSE                 
#>  4  4.02e8 s:40… 2026…      15856 TRUE       TRUE         FALSE                 
#>  5  4.02e8 s:40… 2026…       2683 TRUE       FALSE        FALSE                 
#>  6  4.02e8 s:40… 2026…       3002 TRUE       FALSE        FALSE                 
#>  7  4.02e8 s:40… 2026…       1871 TRUE       TRUE         FALSE                 
#>  8  4.02e8 s:40… 2026…       8558 TRUE       TRUE         FALSE                 
#>  9  4.02e8 s:40… 2026…       2258 TRUE       FALSE        FALSE                 
#> 10  4.02e8 s:40… 2026…       1706 TRUE       FALSE        FALSE                 
#> # ℹ 6,044 more rows
#> # ℹ 79 more variables: play_by_play_available <lgl>, recent <lgl>,
#> #   start_date <chr>, broadcast <chr>, highlights <chr>, notes_type <chr>,
#> #   notes_headline <chr>, broadcast_market <chr>, broadcast_name <chr>,
#> #   type_id <int>, type_abbreviation <chr>, venue_id <int>,
#> #   venue_full_name <chr>, venue_address_city <chr>, venue_address_state <chr>,
#> #   venue_indoor <lgl>, status_clock <dbl>, status_display_clock <chr>, …
# }
# \donttest{
  try(load_wbb_rosters(seasons = most_recent_wbb_season()))
#> ──────────────────────────────────────────────────────────────── wehoop 3.0.0 ──
#> # A tibble: 9,778 × 36
#>    season team_id team_slug team_abbreviation team_display_name         
#>     <int>   <int> <chr>     <chr>             <chr>                     
#>  1   2026       1 NA        UAA               Alaska Anchorage Seawolves
#>  2   2026       1 NA        UAA               Alaska Anchorage Seawolves
#>  3   2026       1 NA        UAA               Alaska Anchorage Seawolves
#>  4   2026       1 NA        UAA               Alaska Anchorage Seawolves
#>  5   2026       1 NA        UAA               Alaska Anchorage Seawolves
#>  6   2026       1 NA        UAA               Alaska Anchorage Seawolves
#>  7   2026       1 NA        UAA               Alaska Anchorage Seawolves
#>  8   2026       1 NA        UAA               Alaska Anchorage Seawolves
#>  9   2026       1 NA        UAA               Alaska Anchorage Seawolves
#> 10   2026       1 NA        UAA               Alaska Anchorage Seawolves
#> # ℹ 9,768 more rows
#> # ℹ 31 more variables: team_short_display_name <chr>, team_color <chr>,
#> #   team_alternate_color <chr>, team_logo <chr>, athlete_id <int>, uid <chr>,
#> #   guid <chr>, full_name <chr>, display_name <chr>, short_name <chr>,
#> #   first_name <chr>, last_name <chr>, jersey <chr>,
#> #   position_abbreviation <chr>, position_name <chr>, position_id <int>,
#> #   height <chr>, weight <chr>, age <chr>, date_of_birth <chr>, …
# }
# \donttest{
  try(load_wbb_player_stats(seasons = most_recent_wbb_season()))
#> ──────────────────────────────────────────────────────────────── wehoop 3.0.0 ──
#> # A tibble: 41,919 × 16
#>    season athlete_id athlete_display_name athlete_first_name athlete_last_name
#>     <int>      <int> <chr>                <chr>              <chr>            
#>  1   2026    4399380 Anna Newman          Anna               Newman           
#>  2   2026    4399380 Anna Newman          Anna               Newman           
#>  3   2026    4399380 Anna Newman          Anna               Newman           
#>  4   2026    4399380 Anna Newman          Anna               Newman           
#>  5   2026    4399380 Anna Newman          Anna               Newman           
#>  6   2026    4399380 Anna Newman          Anna               Newman           
#>  7   2026    4399380 Anna Newman          Anna               Newman           
#>  8   2026    4399380 Anna Newman          Anna               Newman           
#>  9   2026    4399380 Anna Newman          Anna               Newman           
#> 10   2026    4399380 Anna Newman          Anna               Newman           
#> # ℹ 41,909 more rows
#> # ℹ 11 more variables: athlete_position_abbreviation <chr>,
#> #   athlete_jersey <chr>, team_id <int>, team_display_name <chr>,
#> #   category <chr>, stat_label <chr>, stat_name <chr>, stat_display_name <chr>,
#> #   stat_description <chr>, display_value <chr>, value <dbl>
# }
# \donttest{
  try(load_wbb_team_stats(seasons = most_recent_wbb_season()))
#> ──────────────────────────────────────────────────────────────── wehoop 3.0.0 ──
#> # A tibble: 25,740 × 16
#>    season team_id team_slug team_abbreviation team_display_name         
#>     <int>   <int> <chr>     <chr>             <chr>                     
#>  1   2026       1 NA        UAA               Alaska Anchorage Seawolves
#>  2   2026       1 NA        UAA               Alaska Anchorage Seawolves
#>  3   2026       1 NA        UAA               Alaska Anchorage Seawolves
#>  4   2026       1 NA        UAA               Alaska Anchorage Seawolves
#>  5   2026       1 NA        UAA               Alaska Anchorage Seawolves
#>  6   2026       1 NA        UAA               Alaska Anchorage Seawolves
#>  7   2026       1 NA        UAA               Alaska Anchorage Seawolves
#>  8   2026       1 NA        UAA               Alaska Anchorage Seawolves
#>  9   2026       1 NA        UAA               Alaska Anchorage Seawolves
#> 10   2026       1 NA        UAA               Alaska Anchorage Seawolves
#> # ℹ 25,730 more rows
#> # ℹ 11 more variables: team_short_display_name <chr>, team_color <chr>,
#> #   team_alternate_color <chr>, team_logo <chr>, category <chr>,
#> #   stat_label <chr>, stat_name <chr>, stat_display_name <chr>,
#> #   stat_description <chr>, display_value <chr>, value <dbl>
# }
# \donttest{
  try(load_wbb_standings(seasons = most_recent_wbb_season()))
#> ──────────────────────────────────────────────────────────────── wehoop 3.0.0 ──
#> # A tibble: 30,492 × 24
#>    season group_id group_name        group_abbreviation group_short_name team_id
#>     <int>    <int> <chr>             <chr>              <chr>              <int>
#>  1   2026        1 America East Con… aeast              Am. East            2349
#>  2   2026        1 America East Con… aeast              Am. East            2349
#>  3   2026        1 America East Con… aeast              Am. East            2349
#>  4   2026        1 America East Con… aeast              Am. East            2349
#>  5   2026        1 America East Con… aeast              Am. East            2349
#>  6   2026        1 America East Con… aeast              Am. East            2349
#>  7   2026        1 America East Con… aeast              Am. East            2349
#>  8   2026        1 America East Con… aeast              Am. East            2349
#>  9   2026        1 America East Con… aeast              Am. East            2349
#> 10   2026        1 America East Con… aeast              Am. East            2349
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
#> ──────────────────────────────────────────────────────────────── wehoop 3.0.0 ──
#> # A tibble: 907,805 × 20
#>      game_id season period_number clock_display_value team_id athlete_id_1
#>        <int>  <int>         <int> <chr>                 <int>        <int>
#>  1 401856590   2026             1 9:43                     26      5105737
#>  2 401856590   2026             1 9:20                   2579      5108587
#>  3 401856590   2026             1 9:14                   2579      5174284
#>  4 401856590   2026             1 9:08                   2579      5108587
#>  5 401856590   2026             1 8:43                   2579      5239100
#>  6 401856590   2026             1 8:28                     26      4703609
#>  7 401856590   2026             1 8:11                   2579      5108587
#>  8 401856590   2026             1 7:52                     26      5105737
#>  9 401856590   2026             1 7:29                   2579      4609797
#> 10 401856590   2026             1 7:29                   2579      4609797
#> # ℹ 907,795 more rows
#> # ℹ 14 more variables: athlete_id_2 <int>, type_id <int>, type_text <chr>,
#> #   scoring_play <lgl>, score_value <int>, coordinate_x <dbl>,
#> #   coordinate_y <dbl>, coordinate_x_raw <dbl>, coordinate_y_raw <dbl>,
#> #   athlete_name_1 <chr>, athlete_name_2 <chr>, team_name <chr>,
#> #   team_mascot <chr>, team_abbrev <chr>
# }
# \donttest{
  try(load_wbb_game_rosters(seasons = most_recent_wbb_season()))
#> ──────────────────────────────────────────────────────────────── wehoop 3.0.0 ──
#> # A tibble: 168,228 × 22
#>    season   game_id team_id team_slug        team_abbreviation team_display_name
#>     <int>     <int>   <int> <chr>            <chr>             <chr>            
#>  1   2026 401811123    2253 grand-canyon-lo… GCU               Grand Canyon Lop…
#>  2   2026 401811123    2253 grand-canyon-lo… GCU               Grand Canyon Lop…
#>  3   2026 401811123    2253 grand-canyon-lo… GCU               Grand Canyon Lop…
#>  4   2026 401811123    2253 grand-canyon-lo… GCU               Grand Canyon Lop…
#>  5   2026 401811123    2253 grand-canyon-lo… GCU               Grand Canyon Lop…
#>  6   2026 401811123    2253 grand-canyon-lo… GCU               Grand Canyon Lop…
#>  7   2026 401811123    2253 grand-canyon-lo… GCU               Grand Canyon Lop…
#>  8   2026 401811123    2253 grand-canyon-lo… GCU               Grand Canyon Lop…
#>  9   2026 401811123    2253 grand-canyon-lo… GCU               Grand Canyon Lop…
#> 10   2026 401811123    2253 grand-canyon-lo… GCU               Grand Canyon Lop…
#> # ℹ 168,218 more rows
#> # ℹ 16 more variables: home_away <chr>, athlete_id <int>, athlete_uid <chr>,
#> #   athlete_guid <chr>, athlete_display_name <chr>, athlete_short_name <chr>,
#> #   athlete_first_name <chr>, athlete_last_name <chr>, athlete_jersey <chr>,
#> #   athlete_position <chr>, athlete_headshot <chr>, starter <lgl>,
#> #   did_not_play <lgl>, active <lgl>, ejected <lgl>, reason <chr>
# }
# \donttest{
  try(load_wbb_officials(seasons = most_recent_wbb_season()))
#> ──────────────────────────────────────────────────────────────── wehoop 3.0.0 ──
#> # A tibble: 17,458 × 11
#>    season   game_id official_id official_uid official_full_name
#>     <int>     <int>       <int> <chr>        <chr>             
#>  1   2026 401811123       18886 NA           Tiffany Bird      
#>  2   2026 401811123     4078084 NA           Tommi Paris       
#>  3   2026 401811123     5123944 NA           Gina Cantanzariti 
#>  4   2026 401822217       19038 NA           Chuck Gonzalez    
#>  5   2026 401822217     4286788 NA           Nicole Leon       
#>  6   2026 401822217     4291736 NA           Erica Parker      
#>  7   2026 401809048       19777 NA           Charles Watson    
#>  8   2026 401809048     3986420 NA           Angel Kent        
#>  9   2026 401809048     4602668 NA           Ashley Olsen      
#> 10   2026 401827851       19126 NA           Kevin Pethtel     
#> # ℹ 17,448 more rows
#> # ℹ 6 more variables: official_display_name <chr>, official_first_name <chr>,
#> #   official_last_name <chr>, official_order <int>, position_name <chr>,
#> #   position_display_name <chr>
# }
# \donttest{
  try(load_wbb_player_core(seasons = most_recent_wbb_season()))
#> ──────────────────────────────────────────────────────────────── wehoop 3.0.0 ──
#> # A tibble: 9,870 × 36
#>    season athlete_id guid       uid   slug  type  first_name last_name full_name
#>     <int>      <int> <chr>      <chr> <chr> <chr> <chr>      <chr>     <chr>    
#>  1   2026    4399380 d9bbe65d-… s:40… anna… bask… Anna       Newman    Anna New…
#>  2   2026    4400108 9b59dd9e-… s:40… nia-… bask… Nia        Johnson   Nia John…
#>  3   2026    4433051 3b330bd4-… s:40… cici… bask… Cici       Ellington Cici Ell…
#>  4   2026    4433140 63cd2572-… s:40… chan… bask… Chandler   Prater    Chandler…
#>  5   2026    4433141 a2557943-… s:40… morg… bask… Morgan     Robinson… Morgan R…
#>  6   2026    4433290 3ee4fc06-… s:40… mose… bask… Moses      Davenport Moses Da…
#>  7   2026    4433411 3a83740b-… s:40… ange… bask… Angela     Dugalic   Angela D…
#>  8   2026    4433418 279c890e-… s:40… kate… bask… Kateri     Poole     Kateri P…
#>  9   2026    4433419 1a4334d5-… s:40… alli… bask… Alli       Campbell  Alli Cam…
#> 10   2026    4433420 e518ce77-… s:40… madd… bask… Maddie     Scherr    Maddie S…
#> # ℹ 9,860 more rows
#> # ℹ 27 more variables: display_name <chr>, short_name <chr>, height <dbl>,
#> #   display_height <chr>, weight <dbl>, display_weight <chr>, age <int>,
#> #   date_of_birth <chr>, birth_city <chr>, birth_state <chr>,
#> #   birth_country <chr>, jersey <chr>, position_id <int>, position_name <chr>,
#> #   position_abbreviation <chr>, position_display_name <chr>, college_id <int>,
#> #   current_team_id <int>, headshot_href <chr>, experience_years <int>, …
# }
```
