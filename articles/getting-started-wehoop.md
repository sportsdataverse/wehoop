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
([`load_wbb_pbp()`](https://wehoop.sportsdataverse.org/reference/load_wbb_pbp.md)
for every season ESPN tracks) returns roughly 7 million rows and uses
about 1-2 GB of memory. If you’re on something memory-constrained,
restrict to a few seasons via `seasons = 2023:2026`.

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

    ## 0.685 sec elapsed

``` r

## 13.91 sec elapsed

glue::glue(
  "{nrow(wnba_pbp)} rows of WNBA play-by-play data from ",
  "{length(unique(wnba_pbp$game_id))} games."
)
```

    ## 35346 rows of WNBA play-by-play data from 85 games.

``` r

## 1782985 rows of WNBA play-by-play data from 4674 games.

dplyr::glimpse(wnba_pbp)
```

    ## Rows: 35,346
    ## Columns: 64
    ## $ game_play_number                <int> 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12,…
    ## $ id                              <dbl> 4018569724, 4018569728, 4018569729, 40…
    ## $ sequence_number                 <int> 4, 8, 9, 10, 11, 13, 15, 16, 17, 19, 2…
    ## $ type_id                         <int> 615, 72, 95, 155, 121, 45, 92, 155, 44…
    ## $ type_text                       <chr> "Jumpball", "Back Court Turnover", "La…
    ## $ text                            <chr> "Han Xu vs. Olivia Nelson-Ododa (Aaliy…
    ## $ away_score                      <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2,…
    ## $ home_score                      <int> 0, 0, 0, 0, 2, 2, 2, 2, 2, 3, 3, 3, 3,…
    ## $ period_number                   <int> 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,…
    ## $ period_display_value            <chr> "1st Quarter", "1st Quarter", "1st Qua…
    ## $ clock_display_value             <chr> "10:00", "9:57", "9:42", "9:39", "9:25…
    ## $ scoring_play                    <lgl> FALSE, FALSE, FALSE, FALSE, TRUE, FALS…
    ## $ score_value                     <int> 0, 0, 0, 0, 2, 0, 0, 0, 0, 1, 0, 0, 2,…
    ## $ team_id                         <int> 18, 18, 9, 18, 18, 18, 9, 18, 9, 18, 1…
    ## $ athlete_id_1                    <int> 4398966, 4433408, 4337216, 4433635, 44…
    ## $ athlete_id_2                    <int> 4337216, NA, NA, NA, 4433514, NA, NA, …
    ## $ athlete_id_3                    <int> 4433408, NA, NA, NA, NA, NA, NA, NA, N…
    ## $ wallclock                       <chr> "2026-06-08T23:02:53Z", "2026-06-08T23…
    ## $ shooting_play                   <lgl> FALSE, FALSE, TRUE, FALSE, TRUE, FALSE…
    ## $ coordinate_x_raw                <dbl> -214748340, 40, 21, 21, 23, 18, 11, 11…
    ## $ coordinate_y_raw                <dbl> -214748365.00, 39.00, 2.00, 2.00, 7.00…
    ## $ points_attempted                <int> 0, 0, 2, 0, 2, 0, 3, 0, 0, 1, 1, 0, 2,…
    ## $ short_description               <chr> "Jump Ball", "Turnover", "Missed FG", …
    ## $ game_id                         <int> 401856972, 401856972, 401856972, 40185…
    ## $ season                          <int> 2026, 2026, 2026, 2026, 2026, 2026, 20…
    ## $ season_type                     <int> 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,…
    ## $ home_team_id                    <int> 18, 18, 18, 18, 18, 18, 18, 18, 18, 18…
    ## $ home_team_name                  <chr> "Connecticut", "Connecticut", "Connect…
    ## $ home_team_mascot                <chr> "Sun", "Sun", "Sun", "Sun", "Sun", "Su…
    ## $ home_team_abbrev                <chr> "CON", "CON", "CON", "CON", "CON", "CO…
    ## $ home_team_name_alt              <chr> "Connecticut", "Connecticut", "Connect…
    ## $ away_team_id                    <int> 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9,…
    ## $ away_team_name                  <chr> "New York", "New York", "New York", "N…
    ## $ away_team_mascot                <chr> "Liberty", "Liberty", "Liberty", "Libe…
    ## $ away_team_abbrev                <chr> "NY", "NY", "NY", "NY", "NY", "NY", "N…
    ## $ away_team_name_alt              <chr> "New York", "New York", "New York", "N…
    ## $ game_spread                     <dbl> 2.5, 2.5, 2.5, 2.5, 2.5, 2.5, 2.5, 2.5…
    ## $ home_favorite                   <lgl> TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TR…
    ## $ game_spread_available           <lgl> FALSE, FALSE, FALSE, FALSE, FALSE, FAL…
    ## $ home_team_spread                <dbl> 2.5, 2.5, 2.5, 2.5, 2.5, 2.5, 2.5, 2.5…
    ## $ qtr                             <int> 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,…
    ## $ time                            <chr> "10:00", "9:57", "9:42", "9:39", "9:25…
    ## $ clock_minutes                   <int> 10, 9, 9, 9, 9, 9, 9, 9, 8, 8, 8, 8, 8…
    ## $ clock_seconds                   <dbl> 0, 57, 42, 39, 25, 12, 5, 2, 44, 44, 4…
    ## $ home_timeout_called             <lgl> FALSE, FALSE, FALSE, FALSE, FALSE, FAL…
    ## $ away_timeout_called             <lgl> FALSE, FALSE, FALSE, FALSE, FALSE, FAL…
    ## $ half                            <int> 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,…
    ## $ game_half                       <int> 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,…
    ## $ lead_qtr                        <int> 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,…
    ## $ lead_half                       <int> 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,…
    ## $ start_quarter_seconds_remaining <dbl> 600, 597, 582, 579, 565, 552, 545, 542…
    ## $ start_half_seconds_remaining    <dbl> 1200, 1197, 1182, 1179, 1165, 1152, 11…
    ## $ start_game_seconds_remaining    <dbl> 2400, 2397, 2382, 2379, 2365, 2352, 23…
    ## $ end_quarter_seconds_remaining   <dbl> 600, 582, 579, 565, 552, 545, 542, 524…
    ## $ end_half_seconds_remaining      <dbl> 1200, 1182, 1179, 1165, 1152, 1145, 11…
    ## $ end_game_seconds_remaining      <dbl> 2400, 2382, 2379, 2365, 2352, 2345, 23…
    ## $ period                          <int> 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,…
    ## $ lag_qtr                         <int> NA, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1…
    ## $ lag_half                        <int> NA, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1…
    ## $ coordinate_x                    <dbl> 214748406.75, 2.75, -39.75, 39.75, 34.…
    ## $ coordinate_y                    <dbl> 214748365, -15, -4, 4, 2, 7, -14, 14, …
    ## $ game_date                       <date> 2026-06-08, 2026-06-08, 2026-06-08, 2…
    ## $ game_date_time                  <dttm> 2026-06-08 19:00:00, 2026-06-08 19:00…
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

    ## 0.524 sec elapsed

``` r

glue::glue(
  "{nrow(wnba_team_box)} rows of WNBA team boxscore data from ",
  "{length(unique(wnba_team_box$game_id))} games."
)
```

    ## 170 rows of WNBA team boxscore data from 85 games.

``` r

dplyr::glimpse(wnba_team_box)
```

    ## Rows: 170
    ## Columns: 59
    ## $ game_id                           <int> 401856974, 401856974, 401856972, 401…
    ## $ season                            <int> 2026, 2026, 2026, 2026, 2026, 2026, …
    ## $ season_type                       <int> 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, …
    ## $ game_date                         <date> 2026-06-08, 2026-06-08, 2026-06-08,…
    ## $ game_date_time                    <dttm> 2026-06-08 22:00:00, 2026-06-08 22:…
    ## $ team_id                           <int> 14, 17, 9, 18, 5, 16, 132052, 6, 19,…
    ## $ team_uid                          <chr> "s:40~l:59~t:14", "s:40~l:59~t:17", …
    ## $ team_slug                         <chr> "seattle-storm", "las-vegas-aces", "…
    ## $ team_location                     <chr> "Seattle", "Las Vegas", "New York", …
    ## $ team_name                         <chr> "Storm", "Aces", "Liberty", "Sun", "…
    ## $ team_abbreviation                 <chr> "SEA", "LV", "NY", "CON", "IND", "WS…
    ## $ team_display_name                 <chr> "Seattle Storm", "Las Vegas Aces", "…
    ## $ team_short_display_name           <chr> "Storm", "Aces", "Liberty", "Sun", "…
    ## $ team_color                        <chr> "2c5235", "a7a8aa", "86cebc", "f0502…
    ## $ team_alternate_color              <chr> "fee11a", "000000", "000000", "0a224…
    ## $ team_logo                         <chr> "https://a.espncdn.com/i/teamlogos/w…
    ## $ team_home_away                    <chr> "away", "home", "away", "home", "awa…
    ## $ team_score                        <int> 91, 101, 89, 80, 78, 76, 72, 89, 68,…
    ## $ team_winner                       <lgl> FALSE, TRUE, TRUE, FALSE, TRUE, FALS…
    ## $ assists                           <int> 22, 27, 17, 21, 19, 21, 19, 17, 15, …
    ## $ blocks                            <int> 1, 5, 4, 3, 4, 6, 5, 4, 5, 4, 5, 2, …
    ## $ defensive_rebounds                <int> 21, 28, 33, 21, 25, 26, 28, 27, 30, …
    ## $ fast_break_points                 <chr> "10", "4", "6", "6", "15", "10", "11…
    ## $ field_goal_pct                    <dbl> 45, 50, 48, 46, 44, 43, 36, 43, 35, …
    ## $ field_goals_made                  <int> 33, 35, 29, 32, 29, 25, 26, 32, 23, …
    ## $ field_goals_attempted             <int> 74, 70, 61, 70, 66, 58, 72, 75, 65, …
    ## $ flagrant_fouls                    <int> 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, …
    ## $ fouls                             <int> 23, 13, 24, 28, 26, 23, 21, 22, 24, …
    ## $ free_throw_pct                    <dbl> 87, 88, 86, 57, 71, 71, 77, 77, 62, …
    ## $ free_throws_made                  <int> 13, 21, 25, 13, 10, 17, 17, 17, 16, …
    ## $ free_throws_attempted             <int> 15, 24, 29, 23, 14, 24, 22, 22, 26, …
    ## $ largest_lead                      <chr> "6", "15", "13", "3", "17", "2", "2"…
    ## $ lead_changes                      <chr> "10", "10", "3", "3", "5", "5", "8",…
    ## $ lead_percentage                   <chr> "18", "75", "90", "8", "90", "8", "9…
    ## $ offensive_rebounds                <int> 6, 11, 9, 7, 3, 5, 14, 15, 7, 11, 9,…
    ## $ points_in_paint                   <chr> "36", "40", "38", "48", "34", "32", …
    ## $ steals                            <int> 10, 4, 4, 8, 8, 5, 5, 11, 4, 7, 4, 9…
    ## $ team_turnovers                    <int> 0, 1, 0, 0, 3, 0, 2, 0, 0, 1, 1, 0, …
    ## $ technical_fouls                   <int> 1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, …
    ## $ three_point_field_goal_pct        <dbl> 44, 36, 27, 23, 34, 50, 11, 27, 24, …
    ## $ three_point_field_goals_made      <int> 12, 10, 6, 3, 10, 9, 3, 8, 6, 4, 8, …
    ## $ three_point_field_goals_attempted <int> 27, 28, 22, 13, 29, 18, 28, 30, 25, …
    ## $ total_rebounds                    <int> 27, 39, 42, 28, 28, 31, 42, 42, 37, …
    ## $ total_technical_fouls             <int> 1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, …
    ## $ total_turnovers                   <int> 9, 13, 19, 10, 20, 15, 17, 12, 16, 1…
    ## $ turnover_points                   <chr> "10", "19", "11", "5", "21", "17", "…
    ## $ turnovers                         <int> 9, 12, 19, 10, 17, 15, 15, 12, 16, 9…
    ## $ opponent_team_id                  <int> 17, 14, 18, 9, 16, 5, 6, 132052, 131…
    ## $ opponent_team_uid                 <chr> "s:40~l:59~t:17", "s:40~l:59~t:14", …
    ## $ opponent_team_slug                <chr> "las-vegas-aces", "seattle-storm", "…
    ## $ opponent_team_location            <chr> "Las Vegas", "Seattle", "Connecticut…
    ## $ opponent_team_name                <chr> "Aces", "Storm", "Sun", "Liberty", "…
    ## $ opponent_team_abbreviation        <chr> "LV", "SEA", "CON", "NY", "WSH", "IN…
    ## $ opponent_team_display_name        <chr> "Las Vegas Aces", "Seattle Storm", "…
    ## $ opponent_team_short_display_name  <chr> "Aces", "Storm", "Sun", "Liberty", "…
    ## $ opponent_team_color               <chr> "a7a8aa", "2c5235", "f05023", "86ceb…
    ## $ opponent_team_alternate_color     <chr> "000000", "fee11a", "0a2240", "00000…
    ## $ opponent_team_logo                <chr> "https://a.espncdn.com/i/teamlogos/w…
    ## $ opponent_team_score               <int> 101, 91, 80, 89, 76, 78, 89, 72, 85,…

``` r

tictoc::tic()
progressr::with_progress({
  wnba_player_box <- wehoop::load_wnba_player_box()
})
tictoc::toc()
```

    ## 0.55 sec elapsed

``` r

length(unique(wnba_player_box$game_id))
```

    ## [1] 85

``` r

nrow(wnba_player_box)
```

    ## [1] 2052

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

    ## 15.99 sec elapsed

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
tictoc::toc()
```

    ## 0.612 sec elapsed

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
tictoc::toc()
```

    ## 1.451 sec elapsed

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
[`load_wnba_pbp()`](https://wehoop.sportsdataverse.org/reference/load_wnba_pbp.md):
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
  [![@saiemgilani](https://img.shields.io/twitter/follow/saiemgilani?label=%40saiemgilani&logo=x&style=for-the-badge)](https://x.com/saiemgilani)
  [![@saiemgilani](https://img.shields.io/github/followers/saiemgilani?color=eee&logo=Github&style=for-the-badge)](https://github.com/saiemgilani)

- [Geoff Hutchinson - RIP](https://x.com/hutchngo)
  [![@hutchngo](https://img.shields.io/twitter/follow/hutchngo?label=%40hutchngo&logo=x&style=for-the-badge)](https://x.com/hutchngo)
  [![@hutchngo](https://img.shields.io/github/followers/hutchngo?color=eee&logo=Github&style=for-the-badge)](https://github.com/hutchngo)
