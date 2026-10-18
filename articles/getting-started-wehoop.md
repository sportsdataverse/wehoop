# Getting Started with wehoop

Welcome folks,

I’m Saiem Gilani, one of the
[authors](https://wehoop.sportsdataverse.org/authors.html "Authors and contributors to wehoop")
of [`wehoop`](https://wehoop.sportsdataverse.org/), and I built it to
give the women’s basketball community a serious, well-tested R toolkit
for play-by-play, box score, and reference data – the same kind of
analytical foundation our colleagues on the men’s side have had for
years through `hoopR` and `cfbfastR`. This vignette walks you from a
clean install through the most common kinds of analysis you can run in
your first hour with the package.

If you’ve never opened R before, the next section will get you set up.
If you already have R, RStudio, and the package installed, jump to
**What’s in `wehoop`**.

### What you’ll need

`wehoop` runs on R 4.1.0 or newer. Most data pulls work fine on a laptop
– the heaviest single call
([`load_wbb_pbp()`](https://wehoop.sportsdataverse.org/reference/load_wbb_game_rosters.md)
for every season ESPN tracks) returns roughly 7 million rows and uses
about 1-2 GB of memory. If you’re on something memory-constrained,
restrict to a few seasons via `seasons = 2023:2027`.

#### Installing R and RStudio

If you’re starting from zero:

1.  Head to <https://cran.r-project.org>.
2.  Pick the link for your operating system:
    - **Windows** – choose “base”, then download the most recent
      installer.
    - **macOS** – pick the Latest Release. If your Mac is on an older OS
      version, scroll down to “Binaries for Legacy macOS Systems”.
    - **Linux** – pick your distro and follow the install instructions.
3.  Then grab RStudio from
    [Posit](https://posit.co/download/rstudio-desktop/#download) and
    follow its installer.
4.  The [RStudio IDE
    Cheatsheet](https://raw.githubusercontent.com/rstudio/cheatsheets/main/rstudio-ide.pdf)
    is worth printing – it’s one page, and it covers the keyboard
    shortcuts you’ll use every day.
5.  Windows users: also install
    [Rtools](https://cran.r-project.org/bin/windows/Rtools/). It’s not
    an R package – it’s the C/C++ toolchain R uses to build other
    packages from source. You’ll need it eventually even if you don’t
    think you do today.

#### Installing `wehoop`

You can pull a CRAN release with `install.packages("wehoop")`, but most
readers will want the development version, which is on a faster release
cycle than CRAN.

``` r

# pak handles dependency resolution well across OSes
if (!requireNamespace("pak", quietly = TRUE)) install.packages("pak")
pak::pkg_install(c("wehoop", "dplyr", "glue", "progressr", "tictoc"))

# Or for the development version straight from GitHub:
# pak::pak("sportsdataverse/wehoop")
```

The four other packages above (`dplyr`, `glue`, `progressr`, `tictoc`)
aren’t strictly required by `wehoop`, but every example in this vignette
uses one of them.

### What’s in `wehoop`

It helps to know the layout of the package up front. `wehoop` wraps
**three different upstream data sources**, and the function name tells
you which one you’re hitting:

| Prefix | Source | Best for |
|----|----|----|
| `wnba_*` | WNBA Stats API (stats.wnba.com) | Deep WNBA-only stats: hustle, lineups, shot charts, draft combine, league dashboards. |
| `espn_wnba_*` | ESPN’s WNBA endpoints | Tidy WNBA play-by-play, box scores, schedules, rosters, news. |
| `espn_wbb_*` | ESPN’s women’s college endpoints | The same shape of data for NCAA Division I women’s basketball. |
| `ncaa_wbb_*` | NCAA.com | NCAA-specific reference (NET rankings, conference standings). |
| `load_*` | sportsdataverse releases bucket | Pre-aggregated, multi-season parquet/RDS files. The fastest path to “every play, every season”. |

The naming is consistent enough that once you know the prefix, you can
usually guess the function. `espn_wbb_pbp(game_id)` and
`espn_wnba_pbp(game_id)` work the same way; so do their `_team_box()`
and `_player_box()` siblings. `wnba_*` functions are deeper but are tied
to ESPN’s older, less-tidied API surface and tend to require parameter
tuning.

The `load_*` functions are the ones you’ll reach for most. They don’t
hit the live API at all – they download nightly-built parquet files from
a public release bucket. That’s why they pull millions of rows in
seconds rather than the hours a per-game scrape would take.

### A first-hour tour

Let’s pull every season of WNBA and WBB play-by-play that exists, plus
the box scores. Each call below should land in well under a minute on a
typical broadband connection.

#### Every WNBA play, 2002 onward

``` r

tictoc::tic()
progressr::with_progress({
  wnba_pbp <- wehoop::load_wnba_pbp()
})
tictoc::toc()
```

    ## 1.914 sec elapsed

``` r

## 13.91 sec elapsed

glue::glue(
  "{nrow(wnba_pbp)} rows of WNBA play-by-play data from ",
  "{length(unique(wnba_pbp$game_id))} games."
)
```

    ## 142398 rows of WNBA play-by-play data from 349 games.

``` r

## 1782985 rows of WNBA play-by-play data from 4674 games.

dplyr::glimpse(wnba_pbp)
```

    ## Rows: 142,398
    ## Columns: 68
    ## $ game_play_number                <int> 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12,…
    ## $ id                              <dbl> 4019183054, 4019183057, 4019183059, 40…
    ## $ sequence_number                 <int> 4, 7, 9, 10, 12, 13, 14, 15, 16, 18, 1…
    ## $ type_id                         <int> 615, 110, 92, 155, 132, 155, 131, 155,…
    ## $ type_text                       <chr> "Jumpball", "Driving Layup Shot", "Jum…
    ## $ text                            <chr> "Angel Reese vs. Kiah Stokes (Naz Hill…
    ## $ away_score                      <int> 0, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 5, 5,…
    ## $ home_score                      <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 2, 2,…
    ## $ period_number                   <int> 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,…
    ## $ period_display_value            <chr> "1st Quarter", "1st Quarter", "1st Qua…
    ## $ clock_display_value             <chr> "10:00", "9:46", "9:29", "9:26", "9:10…
    ## $ scoring_play                    <lgl> FALSE, TRUE, FALSE, FALSE, FALSE, FALS…
    ## $ score_value                     <int> 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 2, 3, 0,…
    ## $ team_id                         <int> 20, 20, 129689, 20, 20, 129689, 129689…
    ## $ athlete_id_1                    <int> 4433402, 3058901, 4257500, NA, 4398674…
    ## $ athlete_id_2                    <int> 2590093, 3142250, NA, NA, NA, NA, NA, …
    ## $ athlete_id_3                    <int> 4398915, NA, NA, NA, NA, NA, NA, NA, N…
    ## $ wallclock                       <chr> "2026-10-17T19:43:49Z", "2026-10-17T19…
    ## $ shooting_play                   <lgl> FALSE, TRUE, TRUE, FALSE, TRUE, FALSE,…
    ## $ coordinate_x_raw                <dbl> -214748340, 22, 9, 9, 43, 43, 22, 22, …
    ## $ coordinate_y_raw                <dbl> -214748365.00, 3.00, 18.00, 18.00, 19.…
    ## $ points_attempted                <int> 0, 2, 3, 0, 3, 0, 2, 0, 2, 0, 2, 3, 3,…
    ## $ short_description               <chr> "Jump Ball", "+2 Points", "Missed 3PT"…
    ## $ game_id                         <int> 401918305, 401918305, 401918305, 40191…
    ## $ season                          <int> 2026, 2026, 2026, 2026, 2026, 2026, 20…
    ## $ season_type                     <int> 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3,…
    ## $ home_team_id                    <int> 129689, 129689, 129689, 129689, 129689…
    ## $ home_team_name                  <chr> "Golden State", "Golden State", "Golde…
    ## $ home_team_mascot                <chr> "Valkyries", "Valkyries", "Valkyries",…
    ## $ home_team_abbrev                <chr> "GS", "GS", "GS", "GS", "GS", "GS", "G…
    ## $ home_team_name_alt              <chr> "Golden St", "Golden St", "Golden St",…
    ## $ away_team_id                    <int> 20, 20, 20, 20, 20, 20, 20, 20, 20, 20…
    ## $ away_team_name                  <chr> "Atlanta", "Atlanta", "Atlanta", "Atla…
    ## $ away_team_mascot                <chr> "Dream", "Dream", "Dream", "Dream", "D…
    ## $ away_team_abbrev                <chr> "ATL", "ATL", "ATL", "ATL", "ATL", "AT…
    ## $ away_team_name_alt              <chr> "Atlanta", "Atlanta", "Atlanta", "Atla…
    ## $ game_spread                     <dbl> 2.5, 2.5, 2.5, 2.5, 2.5, 2.5, 2.5, 2.5…
    ## $ home_favorite                   <lgl> TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TR…
    ## $ game_spread_available           <lgl> TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TR…
    ## $ home_team_spread                <dbl> 2.5, 2.5, 2.5, 2.5, 2.5, 2.5, 2.5, 2.5…
    ## $ qtr                             <int> 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,…
    ## $ time                            <chr> "10:00", "9:46", "9:29", "9:26", "9:10…
    ## $ clock_minutes                   <int> 10, 9, 9, 9, 9, 9, 8, 8, 8, 8, 8, 8, 7…
    ## $ clock_seconds                   <dbl> 0, 46, 29, 26, 10, 7, 58, 56, 49, 47, …
    ## $ home_timeout_called             <lgl> FALSE, FALSE, FALSE, FALSE, FALSE, FAL…
    ## $ away_timeout_called             <lgl> FALSE, FALSE, FALSE, FALSE, FALSE, FAL…
    ## $ half                            <int> 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,…
    ## $ game_half                       <int> 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,…
    ## $ lag_qtr                         <int> NA, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1…
    ## $ lead_qtr                        <int> 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,…
    ## $ lag_half                        <int> NA, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1…
    ## $ lead_half                       <int> 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,…
    ## $ start_quarter_seconds_remaining <dbl> 600, 586, 569, 566, 550, 547, 538, 536…
    ## $ start_half_seconds_remaining    <dbl> 1200, 1186, 1169, 1166, 1150, 1147, 11…
    ## $ start_game_seconds_remaining    <dbl> 2400, 2386, 2369, 2366, 2350, 2347, 23…
    ## $ end_quarter_seconds_remaining   <dbl> 600, 569, 566, 550, 547, 538, 536, 529…
    ## $ end_half_seconds_remaining      <dbl> 1200, 1169, 1166, 1150, 1147, 1138, 11…
    ## $ end_game_seconds_remaining      <dbl> 2400, 2369, 2366, 2350, 2347, 2338, 23…
    ## $ period                          <int> 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,…
    ## $ coordinate_x                    <dbl> -214748406.75, -38.75, 23.75, -23.75, …
    ## $ coordinate_y                    <dbl> -214748365, -3, 16, -16, 18, -18, 3, -…
    ## $ game_date                       <date> 2026-10-17, 2026-10-17, 2026-10-17, 2…
    ## $ game_date_time                  <dttm> 2026-10-17 15:30:00, 2026-10-17 15:30…
    ## $ score_source                    <chr> "rebuilt", "rebuilt", "rebuilt", "rebu…
    ## $ athlete_name_1                  <chr> "Angel Reese", "Allisha Gray", "Cecili…
    ## $ athlete_name_2                  <chr> "Kiah Stokes", "Jordin Canada", NA, NA…
    ## $ athlete_name_3                  <chr> "Naz Hillmon", NA, NA, NA, NA, NA, NA,…
    ## $ type_abbreviation               <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA…

That single tibble is the foundation for nearly any WNBA analysis you’d
want to run. The columns map cleanly onto basketball concepts:
`period_number`, `clock_display_value`, `team_id`, `coordinate_x`,
`coordinate_y`, `score_value`, `scoring_play`, and so on. Each row is
one play.

A first thing you might do: count three-point attempts per team per
season.

``` r

wnba_threes <- wnba_pbp %>%
  dplyr::filter(
    shooting_play == TRUE,
    score_value %in% c(0, 3),
    grepl("3", type_text, ignore.case = TRUE)
  ) %>%
  dplyr::count(season, team_id, name = "three_attempts") %>%
  dplyr::arrange(desc(season), desc(three_attempts))
```

Or pull every shot that fell with under 5 seconds left in regulation:

``` r

clutch <- wnba_pbp %>%
  dplyr::filter(
    period_number == 4,
    clock_minutes == 0,
    clock_seconds <= 5,
    scoring_play == TRUE
  )
```

The PBP table is large, so do your filtering before any grouping or
summarising.

#### Team and player box scores

Box scores arrive at one row per (game, team) and one row per (game,
player), respectively.

``` r

tictoc::tic()
progressr::with_progress({
  wnba_team_box <- wehoop::load_wnba_team_box()
})
tictoc::toc()
```

    ## 0.54 sec elapsed

``` r

glue::glue(
  "{nrow(wnba_team_box)} rows of WNBA team boxscore data from ",
  "{length(unique(wnba_team_box$game_id))} games."
)
```

    ## 698 rows of WNBA team boxscore data from 349 games.

``` r

dplyr::glimpse(wnba_team_box)
```

    ## Rows: 698
    ## Columns: 59
    ## $ game_id                           <int> 401918305, 401918305, 401918299, 401…
    ## $ season                            <int> 2026, 2026, 2026, 2026, 2026, 2026, …
    ## $ season_type                       <int> 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, …
    ## $ game_date                         <date> 2026-10-17, 2026-10-17, 2026-10-09,…
    ## $ game_date_time                    <dttm> 2026-10-17 15:30:00, 2026-10-17 15:…
    ## $ team_id                           <int> 20, 129689, 20, 9, 129689, 17, 9, 20…
    ## $ team_uid                          <chr> "s:40~l:59~t:20", "s:40~l:59~t:12968…
    ## $ team_slug                         <chr> "atlanta-dream", "golden-state-valky…
    ## $ team_location                     <chr> "Atlanta", "Golden State", "Atlanta"…
    ## $ team_name                         <chr> "Dream", "Valkyries", "Dream", "Libe…
    ## $ team_abbreviation                 <chr> "ATL", "GS", "ATL", "NY", "GS", "LV"…
    ## $ team_display_name                 <chr> "Atlanta Dream", "Golden State Valky…
    ## $ team_short_display_name           <chr> "Dream", "Valkyries", "Dream", "Libe…
    ## $ team_color                        <chr> "e31837", "b38fcf", "e31837", "86ceb…
    ## $ team_alternate_color              <chr> "5091cc", "000000", "5091cc", "00000…
    ## $ team_logo                         <chr> "https://a.espncdn.com/i/teamlogos/w…
    ## $ team_home_away                    <chr> "away", "home", "away", "home", "awa…
    ## $ team_score                        <int> 64, 68, 85, 83, 87, 77, 98, 101, 81,…
    ## $ team_winner                       <lgl> FALSE, TRUE, TRUE, FALSE, TRUE, FALS…
    ## $ assists                           <int> 15, 15, 19, 15, 16, 13, 23, 22, 19, …
    ## $ blocks                            <int> 5, 10, 4, 6, 4, 6, 7, 2, 2, 1, 9, 4,…
    ## $ defensive_rebounds                <int> 28, 29, 24, 21, 33, 29, 31, 24, 19, …
    ## $ fast_break_points                 <chr> "11", "6", "7", "2", "11", "5", "8",…
    ## $ field_goal_pct                    <dbl> 33, 32, 41, 44, 41, 38, 55, 40, 44, …
    ## $ field_goals_made                  <int> 21, 25, 28, 27, 30, 26, 35, 34, 25, …
    ## $ field_goals_attempted             <int> 64, 78, 69, 62, 74, 68, 64, 84, 57, …
    ## $ flagrant_fouls                    <int> 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, …
    ## $ fouls                             <int> 14, 13, 22, 20, 23, 18, 25, 18, 17, …
    ## $ free_throw_pct                    <dbl> 86, 69, 92, 95, 91, 82, 70, 91, 88, …
    ## $ free_throws_made                  <int> 18, 11, 22, 20, 20, 18, 16, 21, 23, …
    ## $ free_throws_attempted             <int> 21, 16, 24, 21, 22, 22, 23, 23, 26, …
    ## $ largest_lead                      <chr> "9", "5", "12", "5", "10", "11", "7"…
    ## $ lead_changes                      <chr> "7", "7", "7", "7", "3", "3", "17", …
    ## $ lead_percentage                   <chr> "79", "15", "76", "19", "21", "72", …
    ## $ offensive_rebounds                <int> 7, 12, 9, 8, 10, 6, 5, 11, 6, 10, 7,…
    ## $ points_in_paint                   <chr> "30", "32", "34", "36", "40", "32", …
    ## $ steals                            <int> 5, 7, 5, 4, 12, 3, 6, 7, 8, 7, 6, 14…
    ## $ team_turnovers                    <int> 0, 2, 1, 1, 1, 0, 1, 2, 1, 3, 2, 0, …
    ## $ technical_fouls                   <int> 0, 0, 1, 1, 0, 1, 0, 0, 1, 0, 0, 0, …
    ## $ three_point_field_goal_pct        <dbl> 16, 21, 35, 31, 29, 35, 48, 40, 42, …
    ## $ three_point_field_goals_made      <int> 4, 7, 7, 9, 7, 7, 12, 12, 8, 10, 11,…
    ## $ three_point_field_goals_attempted <int> 25, 33, 20, 29, 24, 20, 25, 30, 19, …
    ## $ total_rebounds                    <int> 35, 41, 33, 29, 43, 35, 36, 35, 25, …
    ## $ total_technical_fouls             <int> 0, 0, 1, 1, 0, 1, 0, 0, 1, 0, 0, 0, …
    ## $ total_turnovers                   <int> 12, 10, 8, 11, 11, 15, 17, 9, 12, 15…
    ## $ turnover_points                   <chr> "17", "8", "7", "12", "7", "17", "28…
    ## $ turnovers                         <int> 12, 8, 7, 10, 10, 15, 16, 7, 11, 12,…
    ## $ opponent_team_id                  <int> 129689, 20, 9, 20, 17, 129689, 20, 9…
    ## $ opponent_team_uid                 <chr> "s:40~l:59~t:129689", "s:40~l:59~t:2…
    ## $ opponent_team_slug                <chr> "golden-state-valkyries", "atlanta-d…
    ## $ opponent_team_location            <chr> "Golden State", "Atlanta", "New York…
    ## $ opponent_team_name                <chr> "Valkyries", "Dream", "Liberty", "Dr…
    ## $ opponent_team_abbreviation        <chr> "GS", "ATL", "NY", "ATL", "LV", "GS"…
    ## $ opponent_team_display_name        <chr> "Golden State Valkyries", "Atlanta D…
    ## $ opponent_team_short_display_name  <chr> "Valkyries", "Dream", "Liberty", "Dr…
    ## $ opponent_team_color               <chr> "b38fcf", "e31837", "86cebc", "e3183…
    ## $ opponent_team_alternate_color     <chr> "000000", "5091cc", "000000", "5091c…
    ## $ opponent_team_logo                <chr> "https://a.espncdn.com/i/teamlogos/w…
    ## $ opponent_team_score               <int> 68, 64, 83, 85, 77, 87, 101, 98, 83,…

``` r

tictoc::tic()
progressr::with_progress({
  wnba_player_box <- wehoop::load_wnba_player_box()
})
tictoc::toc()
```

    ## 0.559 sec elapsed

``` r

length(unique(wnba_player_box$game_id))
```

    ## [1] 349

``` r

nrow(wnba_player_box)
```

    ## [1] 8466

A few common operations on the player box:

``` r

# Player season averages
wnba_player_box %>%
  dplyr::filter(season == wehoop::most_recent_wnba_season()) %>%
  dplyr::group_by(athlete_id, athlete_display_name) %>%
  dplyr::summarise(
    games   = dplyr::n(),
    ppg     = mean(points,   na.rm = TRUE),
    rpg     = mean(rebounds, na.rm = TRUE),
    apg     = mean(assists,  na.rm = TRUE),
    .groups = "drop"
  ) %>%
  dplyr::arrange(desc(ppg))

# Career totals for one player
caitlin <- wnba_player_box %>%
  dplyr::filter(athlete_display_name == "Caitlin Clark") %>%
  dplyr::summarise(
    games        = dplyr::n(),
    total_points = sum(points,    na.rm = TRUE),
    total_assts  = sum(assists,   na.rm = TRUE),
    fg_pct       = sum(field_goals_made,    na.rm = TRUE) /
                   sum(field_goals_attempted, na.rm = TRUE)
  )
```

#### Women’s college basketball

The WBB side mirrors the WNBA side – same column shapes, same idioms,
just larger volumes (Division I has ~360 programs and ~5,000 games per
season).

``` r

tictoc::tic()
progressr::with_progress({
  wbb_pbp <- wehoop::load_wbb_pbp()
})
tictoc::toc()
```

    ## 0.321 sec elapsed

``` r

length(unique(wbb_pbp$game_id))
```

    ## [1] 0

``` r

nrow(wbb_pbp)
```

    ## [1] 0

``` r

tictoc::tic()
progressr::with_progress({
  wbb_team_box <- wehoop::load_wbb_team_box()
})
tictoc::toc()
```

    ## 0.429 sec elapsed

``` r

length(unique(wbb_team_box$game_id))
```

    ## [1] 0

``` r

nrow(wbb_team_box)
```

    ## [1] 0

``` r

tictoc::tic()
progressr::with_progress({
  wbb_player_box <- wehoop::load_wbb_player_box()
})
tictoc::toc()
```

    ## 0.306 sec elapsed

``` r

length(unique(wbb_player_box$game_id))
```

    ## [1] 0

``` r

nrow(wbb_player_box)
```

    ## [1] 0

If you only need a handful of seasons, both `load_wbb_*()` and
`load_wnba_*()` accept a `seasons =` argument:

``` r

# Just last season's WBB box scores
recent <- wehoop::load_wbb_player_box(
  seasons = (wehoop::most_recent_wbb_season() - 1):wehoop::most_recent_wbb_season()
)
```

### Bulk datasets beyond pbp and box scores

In `wehoop` 3.0.0 the `load_*()` family expanded well past play-by-play
and box scores. The same release-bucket pattern now powers loaders for
rosters, season-aggregated player and team stats, standings, draft
picks, shot events, per-game rosters, and game officials – across all
three data sources (ESPN WBB, ESPN WNBA, and the WNBA Stats API). They
all accept the same arguments as
[`load_wnba_pbp()`](https://wehoop.sportsdataverse.org/reference/load_wnba_draft.md):
a vector of `seasons =`, optional `dbConnection =` / `tablename =` for
streaming straight into a database, and
[`progressively()`](https://wehoop.sportsdataverse.org/reference/progressively.md)
decoration of the per-season download.

A quick tour through three of them and the alternate WNBA Stats API
source:

``` r

# Season-level WNBA rosters (ESPN view)
rosters_2025 <- wehoop::load_wnba_rosters(seasons = 2025)

# Per-event shots derived from PBP — every made/missed shot with court coordinates
shot_chart <- wehoop::load_wnba_shots(seasons = 2024)

# Same standings dataset, alternate source: WNBA Stats API rather than ESPN.
# Useful when you need the WNBA's official team_id keying.
stats_standings <- wehoop::load_wnba_stats_standings(seasons = 2024)

# WBB team-season stats (ESPN) for last two seasons
wbb_teams <- wehoop::load_wbb_team_stats(
  seasons = (wehoop::most_recent_wbb_season() - 1):wehoop::most_recent_wbb_season()
)
```

The ESPN-backed and WNBA Stats API-backed WNBA loaders cover overlapping
ground (rosters, player stats, team stats, standings, draft, shots, game
rosters, officials), so you can pick whichever joins more cleanly into
the rest of your pipeline. WBB has only the ESPN-backed family today.

### Live API endpoints

`load_*()` is the right entry point when you want history. When you want
**today’s data**, reach for the live wrappers. They hit ESPN or
stats.wnba.com directly, get back JSON, and return tidy tibbles.

A few quick tasters. (None of these chunks evaluate during vignette
build because they require network access; copy them into a session to
run them.)

``` r

library(wehoop)

# Today's WNBA scoreboard
today_wnba <- espn_wnba_scoreboard(season = format(Sys.Date(), "%Y%m%d"))

# UConn's current roster (team_id = 2509)
uconn_roster <- espn_wbb_team_roster(team_id = 2509, season = 2025)

# A single completed game's play-by-play, team and player box, all at once
game <- espn_wnba_game_all(game_id = "401736171")
names(game)   # play_by_play, Team, Player, Boxscore_team, ...

# WNBA season-leaders leaderboard
leaders <- espn_wnba_leaders(season = 2024, season_type = 2)

# Win probability per play for a single game (handy for charting momentum)
wp <- espn_wnba_game_probabilities(event_id = "401736171", limit = 200)
```

The full ESPN surface – 80 wrappers covering rosters, schedules, news,
injuries, athletes, draft, free agency, transactions, venues, coaches,
and more – is documented in the [ESPN basketball endpoints
vignette](https://wehoop.sportsdataverse.org/articles/espn-endpoints.md).

For deeper WNBA stats (hustle, lineups, shot charts, draft combine), the
`wnba_*` family hits the WNBA Stats API directly. Those endpoints take
more parameters than the ESPN wrappers, and the [parameter descriptions
table](https://wehoop.sportsdataverse.org/articles/parameter-descriptions.md)
is the easiest reference for what each one accepts.

### A note on rate limits and proxies

ESPN and the WNBA Stats API don’t publish official rate limits, but in
practice both will return HTTP 429s or silent empty responses if you
hammer them. If you’re looping over hundreds of game IDs:

- Add `Sys.sleep(1)` (ESPN) or `Sys.sleep(3)` (WNBA Stats API) between
  calls.
- Wrap your loop in
  [`tryCatch()`](https://rdrr.io/r/base/conditions.html) so a single
  transient failure doesn’t halt the whole job.

If you’re behind a corporate proxy, set it once per session and every
wehoop call will route through it:

``` r

options(wehoop.proxy = "http://proxy.host.example:8080")
# or, for an authenticated proxy:
options(wehoop.proxy = list(
  url = "http://proxy.host.example", port = 8080,
  username = "me", password = "pw", auth = "basic"
))
```

The WNBA Stats API wrappers also accept a per-call `proxy =` argument
that takes precedence over the option.

### Where to go from here

- [**ESPN basketball endpoints
  vignette**](https://wehoop.sportsdataverse.org/articles/espn-endpoints.md)
  – a guided tour of all 80 ESPN wrappers, grouped by use case.
- [**Parameter descriptions
  reference**](https://wehoop.sportsdataverse.org/articles/parameter-descriptions.md)
  – searchable table of every WNBA Stats API query parameter.
- [**`wehoop` reference
  index**](https://wehoop.sportsdataverse.org/reference/) – every
  exported function, organized by data family.
- The [`hoopR`](https://hoopr.sportsdataverse.org),
  [`cfbfastR`](https://cfbfastR.sportsdataverse.org), and
  [`fastRhockey`](https://fastrhockey.sportsdataverse.org) packages
  share the same idioms and many of the same column conventions, if you
  work across multiple sports.

If you build something interesting with `wehoop`, please share it – DM
me on X ([@saiemgilani](https://x.com/saiemgilani)) or open a discussion
on [GitHub](https://github.com/sportsdataverse/wehoop/discussions). The
package gets meaningfully better when users tell us what’s missing.

## **Our Authors**

- [Saiem Gilani](https://x.com/saiemgilani)
  [![@saiemgilani](https://img.shields.io/twitter/follow/saiemgilani?color=blue&label=%40saiemgilani&logo=x&style=for-the-badge)](https://x.com/saiemgilani)
  [![@saiemgilani](https://img.shields.io/github/followers/saiemgilani?color=eee&logo=Github&style=for-the-badge)](https://github.com/saiemgilani)
- [Geoffery Hutchinson](https://x.com/hutchngo)
  [![@hutchngo](https://img.shields.io/twitter/follow/hutchngo?color=blue&label=%40hutchngo&logo=x&style=for-the-badge)](https://x.com/hutchngo)
  [![@hutchngo](https://img.shields.io/github/followers/hutchngo?color=eee&logo=Github&style=for-the-badge)](https://github.com/hutchngo)

### **Citation**

To cite the [**`wehoop`**](https://wehoop.sportsdataverse.org/) R
package in publications, use:

BibTeX Citation

``` bibtex
@misc{wehoop,
  author = {Saiem Gilani and Geoffery Hutchinson},
  title = {wehoop: The SportsDataverse},
  url = {https://wehoop.sportsdataverse.org/},
  year = {2026}
}
```

### **Related SportsDataverse packages**

- [**cfbfastR**](https://cfbfastR.sportsdataverse.org/) - college
  football
- [**hoopR**](https://hoopR.sportsdataverse.org/) - men’s basketball
- [**wehoop**](https://wehoop.sportsdataverse.org/) - women’s basketball
- [**baseballr**](https://baseballr.sportsdataverse.org/) - baseball
- [**fastRhockey**](https://fastRhockey.sportsdataverse.org/) - hockey
- [**oddsapiR**](https://oddsapiR.sportsdataverse.org/) - betting odds
- [**sportyR**](https://sportyR.sportsdataverse.org/) - playing surfaces
- [**sportsdataverse-py**](https://py.sportsdataverse.org/) - the Python
  package
- [**sportsdataverse-R**](https://r.sportsdataverse.org/) - the R
  meta-package
