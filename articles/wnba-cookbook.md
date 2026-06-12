# WNBA Cookbook

## Before we cook

Every recipe here is a small story: a real question about the WNBA, and
the shortest honest path from that question to a tidy data frame. Most
of the code blocks run live when this page builds, so the tables you see
are real data freshly pulled from ESPN and WNBA.com. A handful – bulk
season downloads, the database recipe, and the proxy examples – are
shown but not run, since they either take too long or would reconfigure
your session; those are flagged where they appear.

The one idea to carry through all of it: **`wehoop` function names are a
grammar, not a list to memorize.** Learn the grammar and you can *guess*
the function you need. That guessing skill is what this cookbook is
really teaching; the basketball is the delivery vehicle.

### The grammar of a `wehoop` function name

Almost every function answers three questions, in order:

1.  **Where does the data come from?** – the prefix.
    - `espn_` – ESPN’s APIs. The broadest, most stable coverage.
    - `wnba_` – the official WNBA Stats API (stats.wnba.com). Deepest
      box scores, tracking data, lineup data.
    - `load_` – pre-built bulk data. A whole season in one call.
2.  **Which league?** – for ESPN functions the league is spelled out:
    `espn_wnba_`. For the WNBA Stats API the `wnba_` prefix *is* the
    league.
3.  **What do you want?** – the rest of the name, read left to right,
    general to specific: `team_season_roster`, `athlete_career_stats`,
    `event_competitor_linescores`.

So “a team’s roster for a season, from ESPN” assembles in your head as
`espn_` + `wnba_` + `team` + `_roster` -\>
[`espn_wnba_team_roster()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team_roster.md).
“The league leaders from WNBA.com” is `wnba_` + `leagueleaders` -\>
[`wnba_leagueleaders()`](https://wehoop.sportsdataverse.org/reference/wnba_leagueleaders.md).
Hundreds of functions, one grammar. Memorize the grammar, not the list.

We’ll point at the grammar in the margins of every recipe.

``` r

library(wehoop)
library(dplyr)
```

## Recipe 1: One game, three levels of detail

**The story.** You caught the end of a game on a stream and want to
actually study it – not the recap, the game.

ESPN serves a game at three zoom levels, and the function name tells you
which zoom you asked for. Start wide, push in.

``` r

game_id <- 401736171

# Widest: the entire game summary as a named list of tibbles.
# Read the name: espn / wnba / "game" / "all".
full_game <- espn_wnba_game_all(game_id = game_id)
names(full_game)
#> [1] "Plays"  "Team"   "Player"

# Medium: the box score. team_box and player_box are siblings -- same
# noun (box), different grain.
espn_wnba_team_box(game_id = game_id)
#> # A tibble: 2 × 57
#>     game_id season season_type game_date  game_date_time      team_id team_uid  
#>       <int>  <int>       <int> <date>     <dttm>                <int> <chr>     
#> 1 401736171   2025           2 2025-06-11 2025-06-11 22:00:00       6 s:40~l:59…
#> 2 401736171   2025           2 2025-06-11 2025-06-11 22:00:00      17 s:40~l:59…
#> # ℹ 50 more variables: team_slug <chr>, team_location <chr>, team_name <chr>,
#> #   team_abbreviation <chr>, team_display_name <chr>,
#> #   team_short_display_name <chr>, team_color <chr>,
#> #   team_alternate_color <chr>, team_logo <chr>, team_home_away <chr>,
#> #   team_score <int>, team_winner <lgl>, assists <int>, blocks <int>,
#> #   defensive_rebounds <int>, fast_break_points <chr>, field_goal_pct <dbl>,
#> #   field_goals_made <int>, field_goals_attempted <int>, …
espn_wnba_player_box(game_id = game_id)
#> # A tibble: 21 × 57
#>      game_id season season_type game_date  game_date_time      athlete_id
#>        <int>  <int>       <int> <date>     <dttm>                   <int>
#>  1 401736171   2025           2 2025-06-11 2025-06-11 22:00:00    2566106
#>  2 401736171   2025           2 2025-06-11 2025-06-11 22:00:00    3142010
#>  3 401736171   2025           2 2025-06-11 2025-06-11 22:00:00    4433630
#>  4 401736171   2025           2 2025-06-11 2025-06-11 22:00:00    2529047
#>  5 401736171   2025           2 2025-06-11 2025-06-11 22:00:00    3065570
#>  6 401736171   2025           2 2025-06-11 2025-06-11 22:00:00    2284331
#>  7 401736171   2025           2 2025-06-11 2025-06-11 22:00:00    4596309
#>  8 401736171   2025           2 2025-06-11 2025-06-11 22:00:00    3056672
#>  9 401736171   2025           2 2025-06-11 2025-06-11 22:00:00    4703794
#> 10 401736171   2025           2 2025-06-11 2025-06-11 22:00:00    4433795
#> # ℹ 11 more rows
#> # ℹ 51 more variables: athlete_display_name <chr>, team_id <int>,
#> #   team_name <chr>, team_location <chr>, team_short_display_name <chr>,
#> #   minutes <dbl>, field_goals_made <int>, field_goals_attempted <int>,
#> #   three_point_field_goals_made <int>,
#> #   three_point_field_goals_attempted <int>, free_throws_made <int>,
#> #   free_throws_attempted <int>, offensive_rebounds <int>, …

# Tightest: play-by-play, one row per possession.
espn_wnba_pbp(game_id = game_id)
#> # A tibble: 405 × 54
#>    id       sequence_number text  away_score home_score scoring_play score_value
#>    <chr>    <chr>           <chr>      <int>      <int> <lgl>              <int>
#>  1 4017361… 4               Azur…          0          0 FALSE                  0
#>  2 4017361… 7               Azur…          0          0 FALSE                  0
#>  3 4017361… 9               A'ja…          0          0 FALSE                  0
#>  4 4017361… 10              A'ja…          0          0 FALSE                  0
#>  5 4017361… 11              Jewe…          0          0 FALSE                  0
#>  6 4017361… 12              Rick…          0          0 FALSE                  0
#>  7 4017361… 13              Rick…          0          0 FALSE                  0
#>  8 4017361… 14              Kiah…          0          0 FALSE                  0
#>  9 4017361… 15              Azur…          0          0 FALSE                  0
#> 10 4017361… 17              A'ja…          0          1 TRUE                   1
#> # ℹ 395 more rows
#> # ℹ 47 more variables: wallclock <chr>, shooting_play <lgl>,
#> #   points_attempted <int>, short_description <chr>, type_id <int>,
#> #   type_text <chr>, period_number <int>, period_display_value <chr>,
#> #   clock_display_value <chr>, team_id <int>, coordinate_x_raw <dbl>,
#> #   coordinate_y_raw <dbl>, coordinate_x <dbl>, coordinate_y <dbl>,
#> #   play_id <chr>, athlete_id_1 <int>, athlete_id_2 <int>, …
```

Margin note: `team_box` and `player_box` differ by exactly one word, and
that word is the *grain* of the table. Two functions that differ by a
single noun – that noun is telling you “one row per \_\_\_.”

## Recipe 2: A franchise cornerstone’s whole career

**The story.** You want A’ja Wilson’s career arc – all of it, tidy
enough to plot – not just this season.

The word you want is **career**.

``` r

# espn / wnba / athlete / career / stats. The name is the sentence.
aja <- espn_wnba_player_career_stats(athlete_id = 3149391)

# It returns long -- one row per (stat_type x category x stat) --
# exactly the shape a faceted ggplot wants.
aja |>
  filter(category_name == "offensive", stat_name == "avgPoints") |>
  select(stat_type_id, value)
#> # A tibble: 1 × 2
#>   stat_type_id value
#>   <chr>        <dbl>
#> 1 0             21.6
```

Margin note: `athlete_career_stats()` defaults to pulling *both* regular
season and postseason and stacking them, keyed by `stat_type_id`. Many
of the newer `espn_wnba_*` functions behave this way – when “regular +
playoffs” both make sense, you get both and filter. Want just one? Pass
`season_type`.

The season-by-season index is one word away – swap `career_stats` for
`seasons`:

``` r

espn_wnba_player_seasons(athlete_id = 3149391)
#> # A tibble: 9 × 4
#>   league athlete_id season ref                                                  
#>   <chr>  <chr>       <int> <chr>                                                
#> 1 wnba   3149391      2026 http://sports.core.api.espn.com/v2/sports/basketball…
#> 2 wnba   3149391      2025 http://sports.core.api.espn.com/v2/sports/basketball…
#> 3 wnba   3149391      2024 http://sports.core.api.espn.com/v2/sports/basketball…
#> 4 wnba   3149391      2023 http://sports.core.api.espn.com/v2/sports/basketball…
#> 5 wnba   3149391      2022 http://sports.core.api.espn.com/v2/sports/basketball…
#> 6 wnba   3149391      2021 http://sports.core.api.espn.com/v2/sports/basketball…
#> 7 wnba   3149391      2020 http://sports.core.api.espn.com/v2/sports/basketball…
#> 8 wnba   3149391      2019 http://sports.core.api.espn.com/v2/sports/basketball…
#> 9 wnba   3149391      2018 http://sports.core.api.espn.com/v2/sports/basketball…
```

## Recipe 3: Game flow and the fourth-quarter swing

**The story.** That game from Recipe 1 turned on a late run. You want to
*see* it – a win-probability line.

Two engines, and the prefix tells you which:

``` r

# Route A -- ESPN's per-play win probability.
espn_wnba_game_probabilities(event_id = 401736171)
#> # A tibble: 200 × 10
#>    event_id  sequence_number play_id period clock home_win_percentage
#>    <chr>     <chr>           <chr>    <int> <chr>               <dbl>
#>  1 401736171 4               NA          NA NA                  0.764
#>  2 401736171 7               NA          NA NA                  0.756
#>  3 401736171 9               NA          NA NA                  0.744
#>  4 401736171 10              NA          NA NA                  0.761
#>  5 401736171 11              NA          NA NA                  0.743
#>  6 401736171 12              NA          NA NA                  0.737
#>  7 401736171 13              NA          NA NA                  0.753
#>  8 401736171 14              NA          NA NA                  0.759
#>  9 401736171 15              NA          NA NA                  0.781
#> 10 401736171 17              NA          NA NA                  0.789
#> # ℹ 190 more rows
#> # ℹ 4 more variables: away_win_percentage <dbl>, tie_percentage <dbl>,
#> #   secs_to_end_of_period <dbl>, secs_to_end_of_game <dbl>

# Route B -- the V3 play-by-play from the WNBA Stats API itself. The
# prefix flips to `wnba_` -> different data source, different first
# token. It keys off WNBA.com game ids, which look nothing like ESPN's,
# so lift a real one off the schedule first.
sched <- wnba_schedule()
wnba_playbyplayv3(game_id = sched$game_id[1])
#> list()
```

The grammar doing real work: when two functions look like near-synonyms,
the *prefix* is the tiebreaker. `espn_wnba_*` is ESPN’s take; `wnba_*`
is WNBA.com’s. Choose by which columns you want, not by which name you
remembered.

## Recipe 4: One player’s line from one game

**The story.** You want a single athlete’s box score from a single game,
long and tidy – not the whole `player_box`.

``` r

# espn / wnba / event / player_box. You pass the (event, team, athlete)
# trio because that triple is what uniquely names "this player in this
# game."
espn_wnba_game_player_box(
  event_id   = 401736171,
  team_id    = 17,
  athlete_id = 2590093
)
#> # A tibble: 97 × 12
#>    league event_id  team_id athlete_id stat_type category_name category_display
#>    <chr>  <chr>     <chr>   <chr>          <int> <chr>         <chr>           
#>  1 wnba   401736171 17      2590093            0 defensive     Defensive       
#>  2 wnba   401736171 17      2590093            0 defensive     Defensive       
#>  3 wnba   401736171 17      2590093            0 defensive     Defensive       
#>  4 wnba   401736171 17      2590093            0 defensive     Defensive       
#>  5 wnba   401736171 17      2590093            0 defensive     Defensive       
#>  6 wnba   401736171 17      2590093            0 defensive     Defensive       
#>  7 wnba   401736171 17      2590093            0 defensive     Defensive       
#>  8 wnba   401736171 17      2590093            0 defensive     Defensive       
#>  9 wnba   401736171 17      2590093            0 defensive     Defensive       
#> 10 wnba   401736171 17      2590093            0 general       General         
#> # ℹ 87 more rows
#> # ℹ 5 more variables: stat_name <chr>, stat_abbrev <chr>, stat_display <chr>,
#> #   value <dbl>, display_value <chr>
```

Margin note on *why three IDs*: a function’s argument list is a hint
about its grain. One ID (`game_id`) -\> a whole game. Three IDs
(`event` + `team` + `athlete`) -\> one cell of it. More identifiers,
finer grain – the arguments and the grain always move together.

The event-detail siblings all share the `espn_wnba_event_` stem:

``` r

espn_wnba_game_team_linescores(event_id = 401736171, team_id = 17)
#> # A tibble: 8 × 7
#>   league event_id  team_id period value display_value source      
#>   <chr>  <chr>     <chr>    <int> <dbl> <chr>         <chr>       
#> 1 wnba   401736171 17           1    17 17            1           
#> 2 wnba   401736171 17           1    17 17            Basic/Manual
#> 3 wnba   401736171 17           2    24 24            1           
#> 4 wnba   401736171 17           2    24 24            Basic/Manual
#> 5 wnba   401736171 17           3    24 24            1           
#> 6 wnba   401736171 17           3    24 24            Basic/Manual
#> 7 wnba   401736171 17           4    24 24            1           
#> 8 wnba   401736171 17           4    24 24            Basic/Manual
espn_wnba_game_officials(event_id = 401736171)
#> # A tibble: 3 × 8
#>   event_id  official_id full_name         display_name position_id position_name
#>   <chr>     <chr>       <chr>             <chr>        <chr>       <chr>        
#> 1 401736171 7671        Michael Price     Michael Pri… 40          Referee      
#> 2 401736171 52044       Fatou Cissoko-St… Fatou Cisso… 40          Referee      
#> 3 401736171 4879757     Jason Alabanza    Jason Alaba… 40          Referee      
#> # ℹ 2 more variables: position_type <chr>, order <int>
espn_wnba_game_play(event_id = 401736171, play_id = 4017361714)
#> # A tibble: 1 × 19
#>   league event_id  play_id    sequence_number type_id type_text text  short_text
#>   <chr>  <chr>     <chr>      <chr>           <chr>   <chr>     <chr> <chr>     
#> 1 wnba   401736171 4017361714 4               615     Jumpball  Azur… NA        
#> # ℹ 11 more variables: period <int>, clock <chr>, scoring_play <lgl>,
#> #   score_value <dbl>, away_score <int>, home_score <int>, shooting_play <lgl>,
#> #   coordinate_x <dbl>, coordinate_y <dbl>, team_ref <chr>, wallclock <chr>
```

## Recipe 5: A team’s season at a glance

**The story.** You’re previewing a team – record, schedule, roster, and
how they really stack up.

Type `espn_wnba_team` and let the grammar lay out the menu:

``` r

team_id <- 17    # Las Vegas Aces
season  <- most_recent_wnba_season()

espn_wnba_team_season_profile(team_id = team_id, season = season)
#> # A tibble: 1 × 35
#>   id    guid       uid   slug  location name  nickname abbreviation display_name
#>   <chr> <chr>      <chr> <chr> <chr>    <chr> <lgl>    <chr>        <chr>       
#> 1 17    c97eb968-… s:40… las-… Las Veg… Aces  NA       LV           Las Vegas A…
#> # ℹ 26 more variables: short_display_name <chr>, color <chr>,
#> #   alternate_color <chr>, is_active <lgl>, is_all_star <lgl>, season <int>,
#> #   logo <chr>, logo_dark <chr>, record_ref <chr>, venue_ref <chr>,
#> #   groups_ref <chr>, ranks_ref <chr>, statistics_ref <chr>, leaders_ref <chr>,
#> #   injuries_ref <chr>, notes_ref <chr>, against_the_spread_records_ref <chr>,
#> #   awards_ref <chr>, franchise_ref <chr>, depth_charts_ref <chr>,
#> #   events_ref <chr>, transactions_ref <chr>, coaches_ref <chr>, …
espn_wnba_team_schedule(team_id = team_id, season = season)
#> # A tibble: 44 × 21
#>    event_id  season season_type  week date          name  short_name opponent_id
#>    <chr>      <int>       <int> <int> <chr>         <chr> <chr>      <chr>      
#>  1 401856894   2026          NA    NA 2026-05-09T1… Phoe… PHX @ LV   NA         
#>  2 401856898   2026          NA    NA 2026-05-10T2… Las … LV @ LA    NA         
#>  3 401856905   2026          NA    NA 2026-05-14T0… Las … LV @ CON   NA         
#>  4 401856910   2026          NA    NA 2026-05-15T2… Las … LV @ CON   NA         
#>  5 401856915   2026          NA    NA 2026-05-17T1… Las … LV @ ATL   NA         
#>  6 401856932   2026          NA    NA 2026-05-24T0… Los … LA @ LV    NA         
#>  7 401856943   2026          NA    NA 2026-05-29T0… Las … LV @ DAL   NA         
#>  8 401856952   2026          NA    NA 2026-05-31T1… Las … LV @ GS    NA         
#>  9 401856958   2026          NA    NA 2026-06-03T0… Las … LV @ LA    NA         
#> 10 401856967   2026          NA    NA 2026-06-06T1… Gold… GS @ LV    NA         
#> # ℹ 34 more rows
#> # ℹ 13 more variables: opponent_abbrev <chr>, home_away <chr>,
#> #   neutral_site <lgl>, conference_competition <lgl>, venue_id <chr>,
#> #   venue_name <chr>, venue_city <chr>, venue_state <chr>, broadcast <chr>,
#> #   result <chr>, team_score <chr>, opponent_score <chr>, winner <lgl>
espn_wnba_team_roster(team_id = team_id, season = season)
#> # A tibble: 12 × 15
#>    athlete_id full_name jersey position_abbrev position_name height weight age  
#>    <chr>      <chr>     <chr>  <chr>           <chr>         <chr>  <chr>  <chr>
#>  1 4565501    Janiah B… 2      F               Forward       "6' 4… 185 l… 22   
#>  2 4433633    Kierstan… 1      F               Forward       "6' 1… 176 l… 26   
#>  3 4280892    Chennedy… 23     G               Guard         "5' 9… 143 l… 27   
#>  4 4281190    Dana Eva… 11     G               Guard         "5' 6… 145 l… 27   
#>  5 2529122    Chelsea … 12     G               Guard         "5' 1… 170 l… 33   
#>  6 2987869    Jewell L… 24     G               Guard         "5' 1… 175 l… 32   
#>  7 2529458    Cheyenne… 32     F               Forward       "6' 4… 193 l… 33   
#>  8 4398776    NaLyssa … 3      F               Forward       "6' 4… 185 l… 25   
#>  9 3099736    Stephani… 7      F               Forward       "6' 2… 192 l… 31   
#> 10 3142086    Brianna … 21     F               Forward       "6' 3… 175 l… 29   
#> 11 3149391    A'ja Wil… 22     C               Center        "6' 4… 195 l… 29   
#> 12 4065870    Jackie Y… 0      G               Guard         "6' 0… 165 l… 28   
#> # ℹ 7 more variables: birth_date <chr>, birth_place <chr>, headshot <chr>,
#> #   link_web <chr>, status <chr>, team_id <chr>, season <int>

# The full team-season stat sheet (with league rank per stat) vs. just
# the W-L record.
espn_wnba_team_season_statistics(team_id = team_id, season = season)
#> # A tibble: 98 × 13
#>    league season season_type team_id category_name category_display stat_name   
#>    <chr>   <int>       <int> <chr>   <chr>         <chr>            <chr>       
#>  1 wnba     2026           2 17      defensive     Defensive        blocks      
#>  2 wnba     2026           2 17      defensive     Defensive        defensiveRe…
#>  3 wnba     2026           2 17      defensive     Defensive        steals      
#>  4 wnba     2026           2 17      defensive     Defensive        avgDefensiv…
#>  5 wnba     2026           2 17      defensive     Defensive        avgBlocks   
#>  6 wnba     2026           2 17      defensive     Defensive        avgSteals   
#>  7 wnba     2026           2 17      defensive     Defensive        avg48Defens…
#>  8 wnba     2026           2 17      defensive     Defensive        avg48Blocks 
#>  9 wnba     2026           2 17      defensive     Defensive        avg48Steals 
#> 10 wnba     2026           2 17      general       General          disqualific…
#> # ℹ 88 more rows
#> # ℹ 6 more variables: stat_abbrev <chr>, stat_display <chr>, value <dbl>,
#> #   display_value <chr>, rank <int>, rank_display_value <chr>
espn_wnba_team_record(team_id = team_id, season = season)
#> # A tibble: 4 × 14
#>   league team_id season season_type record_id name     abbreviation display_name
#>   <chr>  <chr>    <int>       <int> <chr>     <chr>    <chr>        <chr>       
#> 1 wnba   17        2026           2 0         overall  Total        Overall     
#> 2 wnba   17        2026           2 33        Home     NA           Home        
#> 3 wnba   17        2026           2 34        Road     NA           Road        
#> 4 wnba   17        2026           2 901       Last Te… Last Ten     Last Ten Ga…
#> # ℹ 6 more variables: short_display_name <chr>, description <chr>, type <chr>,
#> #   summary <chr>, display_value <chr>, value <dbl>
```

Notice the family: `team_season_profile`, `team_season_roster`,
`team_season_statistics`. The shared middle (`team_season`) is the
subject; the last word is the lens. Find one member, you’ve found the
family.

## Recipe 6: The league-leaders board

**The story.** You want the scoring, rebounding, and assist leaders –
the bones of every MVP argument.

``` r

# WNBA.com's leaders. Prefix `wnba_` -> the official Stats API.
wnba_leagueleaders(season = "2024")
#> $LeagueLeaders
#> # A tibble: 157 × 28
#>    PLAYER_ID RANK  PLAYER     TEAM_ID TEAM  GP    MIN   FGM   FGA   FG_PCT FG3M 
#>    <chr>     <chr> <chr>      <chr>   <chr> <chr> <chr> <chr> <chr> <chr>  <chr>
#>  1 1628932   1     A'ja Wils… 161166… LVA   38    1308  385   743   0.518  19   
#>  2 1629481   2     Arike Ogu… 161166… DAL   38    1466  279   729   0.383  112  
#>  3 1627674   3     Kahleah C… 161166… PHO   37    1197  273   628   0.435  69   
#>  4 1627668   4     Breanna S… 161166… NYL   38    1243  265   578   0.458  46   
#>  5 1642286   5     Caitlin C… 161166… IND   40    1416  242   580   0.417  122  
#>  6 1628909   6     Kelsey Mi… 161166… IND   40    1280  282   602   0.468  109  
#>  7 204319    7     Jewell Lo… 161166… SEA   37    1246  224   622   0.36   59   
#>  8 1629483   8     Napheesa … 161166… MIN   34    1181  268   545   0.492  31   
#>  9 204324    9     Dearica H… 161166… LAS   40    1346  268   523   0.512  30   
#> 10 1629477   9     Sabrina I… 161166… NYL   38    1221  239   606   0.394  107  
#> # ℹ 147 more rows
#> # ℹ 17 more variables: FG3A <chr>, FG3_PCT <chr>, FTM <chr>, FTA <chr>,
#> #   FT_PCT <chr>, OREB <chr>, DREB <chr>, REB <chr>, AST <chr>, STL <chr>,
#> #   BLK <chr>, TOV <chr>, PF <chr>, PTS <chr>, EFF <chr>, AST_TOV <chr>,
#> #   STL_TOV <chr>

# ESPN's version of the same idea. Same question, different kitchen --
# the prefix tells you which before you read another word.
espn_wnba_leaders(season = most_recent_wnba_season())
#> # A tibble: 375 × 11
#>    season season_type category      abbreviation athlete_id athlete_name team_id
#>     <int>       <int> <chr>         <chr>        <chr>      <chr>        <chr>  
#>  1   2026           2 pointsPerGame PTS          3149391    NA           17     
#>  2   2026           2 pointsPerGame PTS          3065570    NA           6      
#>  3   2026           2 pointsPerGame PTS          2988756    NA           131935 
#>  4   2026           2 pointsPerGame PTS          3142191    NA           5      
#>  5   2026           2 pointsPerGame PTS          2998928    NA           9      
#>  6   2026           2 pointsPerGame PTS          4433403    NA           5      
#>  7   2026           2 pointsPerGame PTS          4433730    NA           3      
#>  8   2026           2 pointsPerGame PTS          3058901    NA           20     
#>  9   2026           2 pointsPerGame PTS          4398674    NA           20     
#> 10   2026           2 pointsPerGame PTS          3904576    NA           131935 
#> # ℹ 365 more rows
#> # ℹ 4 more variables: team_abbrev <chr>, value <dbl>, rank <int>,
#> #   display_value <chr>
```

Leaders live under *both* prefixes because both APIs publish them. That
is normal and intentional – `wehoop` mirrors the data sources honestly
rather than hiding one. You pick based on which columns you want.

## Recipe 7: Draft night

**The story.** You want to follow a draft class – order, picks, players.

The draft has its own little family, sorted general to specific exactly
as the grammar promises:

``` r

season <- most_recent_wnba_season()

espn_wnba_season_draft(season = season)        # the draft, top level
espn_wnba_draft_rounds(season = season)        # by round
espn_wnba_draft_athletes(season = season)      # every drafted player
espn_wnba_draft_pick(season = season, round = 1, pick = 1)

# Or the pre-built bulk version -- note the `load_` prefix.
load_wnba_draft(seasons = 2020:2024)
```

Read it top to bottom: each step adds a word and narrows the grain.
That’s the grammar’s “general to specific, left to right” rule made
visible.

## Recipe 8: A whole season at once

**The story.** You don’t want one game. You want every game – a full
season to model on.

Looping
[`espn_wnba_pbp()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_pbp.md)
over hundreds of `game_id`s works but is slow and rude to ESPN. The
`load_` prefix exists for exactly this: pre-built, pre-cleaned season
files.

``` r

# load / wnba / pbp -- one call, one season.
pbp_2024 <- load_wnba_pbp(seasons = 2024)

load_wnba_player_box(seasons = 2024)
load_wnba_team_box(seasons = 2024)
load_wnba_schedule(seasons = 2024)
load_wnba_shots(seasons = 2024)        # shot locations, ready to chart
```

There’s also a deeper, WNBA-Stats-API-sourced bulk family under the
`load_wnba_stats_` stem – richer play-by-play with on-court lineups,
possession assignment, and a garbage-time flag:

``` r

load_wnba_stats_pbp(seasons = 2024)
load_wnba_stats_player_game_logs(seasons = 2024)
load_wnba_stats_lineups(seasons = 2024)
```

The grammar lesson: `load_wnba_` and `load_wnba_stats_` are two bulk
families, and the extra `stats_` token tells you the *source* – the
plain family is ESPN-shaped, the `stats_` family is WNBA.com-shaped. An
extra token in the middle of a name is never noise; it’s always
narrowing something.

## Recipe 9: Pour a season straight into a database

**The story.** A season of play-by-play is big. You’d rather query it
from disk than hold it in memory.

Every `load_` function shares the same optional plumbing – learn it
once, you’ve learned it everywhere:

``` r

library(DBI)
con <- dbConnect(RSQLite::SQLite(), "wnba.sqlite")

load_wnba_pbp(
  seasons      = 2020:2024,
  dbConnection = con,
  tablename    = "wnba_pbp"
)

dbDisconnect(con)
```

Margin note: consistency is a feature. Because every `load_` function
shares the `(seasons, ..., dbConnection, tablename)` signature, learning
one teaches you all of them – guess the arguments the same way you guess
the names.

## Working through a proxy

On a corporate or campus network your traffic may need a proxy. `wehoop`
understands proxies in three layers – use the least invasive one that
works.

**Layer 1 – set it once for the session.** This covers everything: ESPN,
WNBA Stats, loaders.

``` r

# Plain proxy.
options(wehoop.proxy = "http://proxy.company.com:8080")

# Authenticated proxy -- pass a list and it's spread into the request.
options(wehoop.proxy = list(
  url      = "http://proxy.company.com",
  port     = 8080,
  username = "saiem",
  password = Sys.getenv("PROXY_PASS")
))

# From here on, nothing changes -- just call functions normally.
espn_wnba_team_roster(team_id = 17, season = most_recent_wnba_season())
wnba_leagueleaders(season = "2024")
```

**Layer 2 – one call, one proxy.** Every WNBA Stats API function
(`wnba_*`) threads `...` down to the HTTP layer, so you can override the
proxy for a single call:

``` r

wnba_playbyplayv3(
  game_id = "1022400001",
  proxy   = "http://other-proxy.company.com:3128"
)
#> list()
```

A grammar-flavored caveat: per-call `proxy =` works for the `wnba_*`
Stats API functions because they pass `...` through. The `espn_*` and
`load_*` functions call the HTTP layer directly and don’t take a
per-call proxy – for those, use the session option in Layer 1. The
prefix tells you the capability: `wnba_` functions are the ones wired
for per-call overrides.

**Layer 3 – let the environment decide.** If you’d rather keep proxies
out of your R code entirely, `wehoop` honors the standard environment
variables:

``` r

Sys.setenv(
  http_proxy  = "http://proxy.company.com:8080",
  https_proxy = "http://proxy.company.com:8080",
  no_proxy    = "localhost,127.0.0.1"
)
```

libcurl reads these automatically whenever you haven’t set an explicit
proxy. It’s the right layer for shared scripts and CI, where the proxy
is a property of the machine, not the analysis.

## Where to go next

You have the grammar now. Every recipe above was the same move: decide
where the data lives (the prefix), name the league, then name the thing
general to specific. The WNBA surface in `wehoop` is large but *regular*
– and regular things are guessable.

The women’s college game runs on the same package with the same grammar
– swap `wnba` for `wbb`, meet the NCAA-sourced functions, and keep
cooking. That’s the WBB cookbook.
