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
for every season ESPN tracks) returns about 19 million rows and uses 3-5
GB of memory. If you’re on something memory-constrained, restrict to a
few seasons via `seasons = 2023:2027`.

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
hit the live API at all – they download pre-built release files (rds or
parquet) from a public release bucket. That’s why they pull millions of
rows in seconds rather than the hours a per-game scrape would take.

### A first-hour tour

Let’s pull the latest season of WNBA play-by-play, plus the box scores.
Each loader takes `seasons =`, so pass a vector (or `seasons = TRUE` for
every published season) to load more. Each call below should land in
well under a minute on a typical broadband connection.

#### Every WNBA play from the latest season

``` r

tictoc::tic()
progressr::with_progress({
  wnba_pbp <- wehoop::load_wnba_pbp()
})
tictoc::toc()
```

    ## 1.834 sec elapsed

``` r

glue::glue(
  "{nrow(wnba_pbp)} rows of WNBA play-by-play data from ",
  "{length(unique(wnba_pbp$game_id))} games."
)
```

    ## 144409 rows of WNBA play-by-play data from 354 games.

``` r

dplyr::glimpse(wnba_pbp)
```

    ## Rows: 144,409
    ## Columns: 68
    ## $ game_play_number                <int> 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12,…
    ## $ id                              <dbl> 4019183104, 4019183107, 4019183108, 40…
    ## $ sequence_number                 <int> 4, 7, 8, 9, 10, 12, 14, 16, 17, 19, 21…
    ## $ type_id                         <int> 615, 144, 155, 132, 92, 45, 144, 155, …
    ## $ type_text                       <chr> "Jumpball", "Driving Floating Jump Sho…
    ## $ text                            <chr> "Kiah Stokes vs. Angel Reese (Naz Hill…
    ## $ away_score                      <int> 0, 0, 0, 2, 2, 2, 2, 2, 2, 4, 4, 4, 4,…
    ## $ home_score                      <int> 0, 0, 0, 0, 3, 3, 3, 3, 6, 6, 6, 6, 6,…
    ## $ period_number                   <int> 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,…
    ## $ period_display_value            <chr> "1st Quarter", "1st Quarter", "1st Qua…
    ## $ clock_display_value             <chr> "10:00", "9:42", "9:40", "9:19", "9:04…
    ## $ scoring_play                    <lgl> FALSE, FALSE, FALSE, TRUE, TRUE, FALSE…
    ## $ score_value                     <int> 0, 0, 0, 2, 3, 0, 0, 0, 3, 2, 0, 0, 0,…
    ## $ team_id                         <int> 20, 20, 129689, 129689, 20, 20, 129689…
    ## $ athlete_id_1                    <int> 4433402, 3142250, 2590093, 4398935, 30…
    ## $ athlete_id_2                    <int> 2590093, NA, NA, NA, 4433402, NA, 4398…
    ## $ athlete_id_3                    <int> 4398915, NA, NA, NA, NA, NA, NA, NA, N…
    ## $ wallclock                       <chr> "2026-10-29T16:41:47Z", "2026-10-29T16…
    ## $ shooting_play                   <lgl> FALSE, TRUE, FALSE, TRUE, TRUE, FALSE,…
    ## $ coordinate_x_raw                <dbl> -214748340, 23, 23, 39, 47, 30, 28, 28…
    ## $ coordinate_y_raw                <dbl> -214748365.00, 8.00, 8.00, 10.00, 9.00…
    ## $ points_attempted                <int> 0, 2, 0, 2, 3, 0, 2, 0, 3, 2, 3, 0, 0,…
    ## $ short_description               <chr> "Jump Ball", "Missed FG", "Rebound", "…
    ## $ game_id                         <int> 401918310, 401918310, 401918310, 40191…
    ## $ season                          <int> 2026, 2026, 2026, 2026, 2026, 2026, 20…
    ## $ season_type                     <int> 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3,…
    ## $ home_team_id                    <int> 20, 20, 20, 20, 20, 20, 20, 20, 20, 20…
    ## $ home_team_name                  <chr> "Atlanta", "Atlanta", "Atlanta", "Atla…
    ## $ home_team_mascot                <chr> "Dream", "Dream", "Dream", "Dream", "D…
    ## $ home_team_abbrev                <chr> "ATL", "ATL", "ATL", "ATL", "ATL", "AT…
    ## $ home_team_name_alt              <chr> "Atlanta", "Atlanta", "Atlanta", "Atla…
    ## $ away_team_id                    <int> 129689, 129689, 129689, 129689, 129689…
    ## $ away_team_name                  <chr> "Golden State", "Golden State", "Golde…
    ## $ away_team_mascot                <chr> "Valkyries", "Valkyries", "Valkyries",…
    ## $ away_team_abbrev                <chr> "GS", "GS", "GS", "GS", "GS", "GS", "G…
    ## $ away_team_name_alt              <chr> "Golden St", "Golden St", "Golden St",…
    ## $ game_spread                     <dbl> 4.5, 4.5, 4.5, 4.5, 4.5, 4.5, 4.5, 4.5…
    ## $ home_favorite                   <lgl> TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TR…
    ## $ game_spread_available           <lgl> TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TR…
    ## $ home_team_spread                <dbl> 4.5, 4.5, 4.5, 4.5, 4.5, 4.5, 4.5, 4.5…
    ## $ qtr                             <int> 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,…
    ## $ time                            <chr> "10:00", "9:42", "9:40", "9:19", "9:04…
    ## $ clock_minutes                   <int> 10, 9, 9, 9, 9, 8, 8, 8, 8, 7, 7, 7, 7…
    ## $ clock_seconds                   <dbl> 0, 42, 40, 19, 4, 45, 32, 30, 20, 56, …
    ## $ home_timeout_called             <lgl> FALSE, FALSE, FALSE, FALSE, FALSE, FAL…
    ## $ away_timeout_called             <lgl> FALSE, FALSE, FALSE, FALSE, FALSE, FAL…
    ## $ half                            <int> 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,…
    ## $ game_half                       <int> 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,…
    ## $ lag_qtr                         <int> NA, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1…
    ## $ lead_qtr                        <int> 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,…
    ## $ lag_half                        <int> NA, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1…
    ## $ lead_half                       <int> 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,…
    ## $ start_quarter_seconds_remaining <dbl> 600, 582, 580, 559, 544, 525, 512, 510…
    ## $ start_half_seconds_remaining    <dbl> 1200, 1182, 1180, 1159, 1144, 1125, 11…
    ## $ start_game_seconds_remaining    <dbl> 2400, 2382, 2380, 2359, 2344, 2325, 23…
    ## $ end_quarter_seconds_remaining   <dbl> 582, 580, 559, 544, 525, 512, 510, 500…
    ## $ end_half_seconds_remaining      <dbl> 1182, 1180, 1159, 1144, 1125, 1112, 11…
    ## $ end_game_seconds_remaining      <dbl> 2382, 2380, 2359, 2344, 2325, 2312, 23…
    ## $ period                          <int> 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,…
    ## $ coordinate_x                    <dbl> 214748406.75, 33.75, -33.75, -31.75, 3…
    ## $ coordinate_y                    <dbl> 214748365, 2, -2, 14, -22, -5, 3, -3, …
    ## $ game_date                       <date> 2026-10-29, 2026-10-29, 2026-10-29, 2…
    ## $ game_date_time                  <dttm> 2026-10-29 12:30:00, 2026-10-29 12:30…
    ## $ score_source                    <chr> "rebuilt", "rebuilt", "rebuilt", "rebu…
    ## $ athlete_name_1                  <chr> "Angel Reese", "Jordin Canada", "Kiah …
    ## $ athlete_name_2                  <chr> "Kiah Stokes", NA, NA, NA, "Angel Rees…
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

    ## 0.401 sec elapsed

``` r

glue::glue(
  "{nrow(wnba_team_box)} rows of WNBA team boxscore data from ",
  "{length(unique(wnba_team_box$game_id))} games."
)
```

    ## 708 rows of WNBA team boxscore data from 354 games.

``` r

dplyr::glimpse(wnba_team_box)
```

    ## Rows: 708
    ## Columns: 59
    ## $ game_id                           <int> 401918310, 401918310, 401918309, 401…
    ## $ season                            <int> 2026, 2026, 2026, 2026, 2026, 2026, …
    ## $ season_type                       <int> 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, …
    ## $ game_date                         <date> 2026-10-29, 2026-10-29, 2026-10-26,…
    ## $ game_date_time                    <dttm> 2026-10-29 12:30:00, 2026-10-29 12:…
    ## $ team_id                           <int> 129689, 20, 20, 129689, 129689, 20, …
    ## $ team_uid                          <chr> "s:40~l:59~t:129689", "s:40~l:59~t:2…
    ## $ team_slug                         <chr> "golden-state-valkyries", "atlanta-d…
    ## $ team_location                     <chr> "Golden State", "Atlanta", "Atlanta"…
    ## $ team_name                         <chr> "Valkyries", "Dream", "Dream", "Valk…
    ## $ team_abbreviation                 <chr> "GS", "ATL", "ATL", "GS", "GS", "ATL…
    ## $ team_display_name                 <chr> "Golden State Valkyries", "Atlanta D…
    ## $ team_short_display_name           <chr> "Valkyries", "Dream", "Dream", "Valk…
    ## $ team_color                        <chr> "b38fcf", "e31837", "e31837", "b38fc…
    ## $ team_alternate_color              <chr> "000000", "5091cc", "5091cc", "00000…
    ## $ team_logo                         <chr> "https://a.espncdn.com/i/teamlogos/w…
    ## $ team_home_away                    <chr> "away", "home", "away", "home", "awa…
    ## $ team_score                        <int> 69, 80, 55, 64, 67, 62, 71, 97, 79, …
    ## $ team_winner                       <lgl> FALSE, TRUE, FALSE, TRUE, TRUE, FALS…
    ## $ assists                           <int> 13, 19, 12, 14, 10, 9, 19, 26, 17, 1…
    ## $ blocks                            <int> 2, 8, 3, 9, 5, 6, 5, 4, 4, 8, 5, 10,…
    ## $ defensive_rebounds                <int> 27, 30, 32, 28, 25, 25, 25, 31, 28, …
    ## $ fast_break_points                 <chr> "10", "4", "2", "2", "7", "2", "5", …
    ## $ field_goal_pct                    <dbl> 31, 44, 29, 39, 36, 33, 35, 49, 34, …
    ## $ field_goals_made                  <int> 22, 27, 19, 24, 26, 18, 24, 34, 21, …
    ## $ field_goals_attempted             <int> 70, 62, 65, 61, 72, 54, 69, 69, 62, …
    ## $ flagrant_fouls                    <int> 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, …
    ## $ fouls                             <int> 20, 21, 17, 14, 26, 19, 21, 17, 18, …
    ## $ free_throw_pct                    <dbl> 86, 81, 79, 77, 85, 71, 65, 69, 86, …
    ## $ free_throws_made                  <int> 18, 13, 11, 10, 11, 22, 11, 20, 30, …
    ## $ free_throws_attempted             <int> 21, 16, 14, 13, 13, 31, 17, 29, 35, …
    ## $ largest_lead                      <chr> "2", "25", "1", "16", "16", "5", "0"…
    ## $ lead_changes                      <chr> "1", "1", "2", "2", "1", "1", "0", "…
    ## $ lead_percentage                   <chr> "1", "98", "2", "91", "85", "11", "0…
    ## $ offensive_rebounds                <int> 9, 5, 12, 5, 13, 12, 9, 6, 8, 6, 7, …
    ## $ points_in_paint                   <chr> "26", "26", "18", "26", "38", "28", …
    ## $ steals                            <int> 10, 6, 4, 9, 8, 4, 6, 9, 14, 8, 5, 7…
    ## $ team_turnovers                    <int> 1, 0, 2, 2, 0, 1, 2, 2, 0, 1, 0, 2, …
    ## $ technical_fouls                   <int> 0, 1, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, …
    ## $ three_point_field_goal_pct        <dbl> 26, 43, 23, 25, 16, 17, 40, 41, 28, …
    ## $ three_point_field_goals_made      <int> 7, 13, 6, 6, 4, 4, 12, 9, 7, 7, 4, 7…
    ## $ three_point_field_goals_attempted <int> 27, 30, 26, 24, 25, 23, 30, 22, 25, …
    ## $ total_rebounds                    <int> 36, 35, 44, 33, 38, 37, 34, 37, 36, …
    ## $ total_technical_fouls             <int> 0, 1, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, …
    ## $ total_turnovers                   <int> 11, 15, 17, 9, 9, 18, 17, 10, 14, 19…
    ## $ turnover_points                   <chr> "18", "12", "21", "6", "8", "16", "2…
    ## $ turnovers                         <int> 10, 15, 15, 7, 9, 17, 15, 8, 14, 18,…
    ## $ opponent_team_id                  <int> 20, 129689, 129689, 20, 20, 129689, …
    ## $ opponent_team_uid                 <chr> "s:40~l:59~t:20", "s:40~l:59~t:12968…
    ## $ opponent_team_slug                <chr> "atlanta-dream", "golden-state-valky…
    ## $ opponent_team_location            <chr> "Atlanta", "Golden State", "Golden S…
    ## $ opponent_team_name                <chr> "Dream", "Valkyries", "Valkyries", "…
    ## $ opponent_team_abbreviation        <chr> "ATL", "GS", "GS", "ATL", "ATL", "GS…
    ## $ opponent_team_display_name        <chr> "Atlanta Dream", "Golden State Valky…
    ## $ opponent_team_short_display_name  <chr> "Dream", "Valkyries", "Valkyries", "…
    ## $ opponent_team_color               <chr> "e31837", "b38fcf", "b38fcf", "e3183…
    ## $ opponent_team_alternate_color     <chr> "5091cc", "000000", "000000", "5091c…
    ## $ opponent_team_logo                <chr> "https://a.espncdn.com/i/teamlogos/w…
    ## $ opponent_team_score               <int> 80, 69, 64, 55, 62, 67, 97, 71, 65, …

``` r

tictoc::tic()
progressr::with_progress({
  wnba_player_box <- wehoop::load_wnba_player_box()
})
tictoc::toc()
```

    ## 0.493 sec elapsed

``` r

length(unique(wnba_player_box$game_id))
```

    ## [1] 354

``` r

nrow(wnba_player_box)
```

    ## [1] 8593

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
```

    ## ℹ `load_wbb_pbp()`: season 2027 is not published yet; loading
    ## 2026 instead.

``` r

tictoc::toc()
```

    ## 18.409 sec elapsed

``` r

length(unique(wbb_pbp$game_id))
```

    ## [1] 6011

``` r

nrow(wbb_pbp)
```

    ## [1] 2824090

``` r

tictoc::tic()
progressr::with_progress({
  wbb_team_box <- wehoop::load_wbb_team_box()
})
```

    ## ℹ `load_wbb_team_box()`: season 2027 is not published yet; loading 2026
    ##   instead.

``` r

tictoc::toc()
```

    ## 0.773 sec elapsed

``` r

length(unique(wbb_team_box$game_id))
```

    ## [1] 6029

``` r

nrow(wbb_team_box)
```

    ## [1] 12058

``` r

tictoc::tic()
progressr::with_progress({
  wbb_player_box <- wehoop::load_wbb_player_box()
})
```

    ## ℹ `load_wbb_player_box()`: season 2027 is not published yet; loading 2026
    ##   instead.

``` r

tictoc::toc()
```

    ## 1.385 sec elapsed

``` r

length(unique(wbb_player_box$game_id))
```

    ## [1] 6029

``` r

nrow(wbb_player_box)
```

    ## [1] 168228

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

# Alternate source: the WNBA Stats API league dashboard cube (player, team
# and lineup measures), keyed on the WNBA's official ids.
stats_standings <- wehoop::load_wnba_stats_leaguedash(seasons = 2024, table = "standings")

# WBB team-season stats (ESPN) for last two seasons
wbb_teams <- wehoop::load_wbb_team_stats(
  seasons = (wehoop::most_recent_wbb_season() - 1):wehoop::most_recent_wbb_season()
)
```

The ESPN-backed and WNBA Stats API-backed WNBA loaders cover overlapping
ground (rosters, draft, shots, game rosters, officials; WNBA Stats
player, team and lineup stats now live in
[`load_wnba_stats_leaguedash()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_leaguedash.md)),
so you can pick whichever joins more cleanly into the rest of your
pipeline. WBB has the ESPN-backed family plus the NCAA-sourced
`load_ncaa_wbb_*()` family (play-by-play, shots, lineups and more);
there is no WNBA Stats-style source for WBB.

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

The full ESPN surface – 180 wrappers covering rosters, schedules, news,
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
  – a guided tour of all 180 ESPN wrappers, grouped by use case.
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
