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

    ## 0.354 sec elapsed

``` r

## 13.91 sec elapsed

glue::glue(
  "{nrow(wnba_pbp)} rows of WNBA play-by-play data from ",
  "{length(unique(wnba_pbp$game_id))} games."
)
```

    ## 10129 rows of WNBA play-by-play data from 24 games.

``` r

## 1782985 rows of WNBA play-by-play data from 4674 games.

dplyr::glimpse(wnba_pbp)
```

    ## Rows: 10,129
    ## Columns: 64
    ## $ game_play_number                <int> 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12,…
    ## $ id                              <dbl> 4018569104, 4018569107, 4018569109, 40…
    ## $ sequence_number                 <int> 4, 7, 9, 10, 11, 12, 14, 16, 17, 18, 2…
    ## $ type_id                         <int> 615, 92, 131, 156, 125, 144, 45, 131, …
    ## $ type_text                       <chr> "Jumpball", "Jump Shot", "Pullup Jump …
    ## $ text                            <chr> "NaLyssa Smith vs. Aaliyah Edwards (Ch…
    ## $ away_score                      <int> 0, 2, 2, 2, 2, 4, 4, 4, 4, 6, 6, 6, 6,…
    ## $ home_score                      <int> 0, 0, 0, 0, 2, 2, 2, 2, 2, 2, 4, 4, 4,…
    ## $ period_number                   <int> 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,…
    ## $ period_display_value            <chr> "1st Quarter", "1st Quarter", "1st Qua…
    ## $ clock_display_value             <chr> "10:00", "9:45", "9:22", "9:20", "9:20…
    ## $ scoring_play                    <lgl> FALSE, TRUE, FALSE, FALSE, TRUE, TRUE,…
    ## $ score_value                     <int> 0, 2, 0, 0, 2, 2, 0, 0, 0, 2, 2, 0, 0,…
    ## $ team_id                         <int> 17, 17, 18, 18, 18, 17, 17, 18, 17, 17…
    ## $ athlete_id_1                    <int> 4398776, 3149391, 4898898, 3922628, 39…
    ## $ athlete_id_2                    <int> 4433408, 4065870, NA, NA, NA, 2529122,…
    ## $ athlete_id_3                    <int> 2529122, NA, NA, NA, NA, NA, NA, NA, N…
    ## $ wallclock                       <chr> "2026-05-15T23:32:54Z", "2026-05-15T23…
    ## $ shooting_play                   <lgl> FALSE, TRUE, TRUE, FALSE, TRUE, TRUE, …
    ## $ coordinate_x_raw                <dbl> -214748340, 12, 27, 27, 25, 23, 42, 20…
    ## $ coordinate_y_raw                <dbl> -214748365, 3, 1, 1, 0, 6, 21, 25, 25,…
    ## $ points_attempted                <int> 0, 2, 2, 0, 2, 2, 0, 3, 0, 2, 2, 0, 2,…
    ## $ short_description               <chr> "Jump Ball", "+2 Points", "Missed FG",…
    ## $ game_id                         <int> 401856910, 401856910, 401856910, 40185…
    ## $ season                          <int> 2026, 2026, 2026, 2026, 2026, 2026, 20…
    ## $ season_type                     <int> 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,…
    ## $ home_team_id                    <int> 18, 18, 18, 18, 18, 18, 18, 18, 18, 18…
    ## $ home_team_name                  <chr> "Connecticut", "Connecticut", "Connect…
    ## $ home_team_mascot                <chr> "Sun", "Sun", "Sun", "Sun", "Sun", "Su…
    ## $ home_team_abbrev                <chr> "CON", "CON", "CON", "CON", "CON", "CO…
    ## $ home_team_name_alt              <chr> "Connecticut", "Connecticut", "Connect…
    ## $ away_team_id                    <int> 17, 17, 17, 17, 17, 17, 17, 17, 17, 17…
    ## $ away_team_name                  <chr> "Las Vegas", "Las Vegas", "Las Vegas",…
    ## $ away_team_mascot                <chr> "Aces", "Aces", "Aces", "Aces", "Aces"…
    ## $ away_team_abbrev                <chr> "LV", "LV", "LV", "LV", "LV", "LV", "L…
    ## $ away_team_name_alt              <chr> "Las Vegas", "Las Vegas", "Las Vegas",…
    ## $ game_spread                     <dbl> 2.5, 2.5, 2.5, 2.5, 2.5, 2.5, 2.5, 2.5…
    ## $ home_favorite                   <lgl> TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TR…
    ## $ game_spread_available           <lgl> FALSE, FALSE, FALSE, FALSE, FALSE, FAL…
    ## $ home_team_spread                <dbl> 2.5, 2.5, 2.5, 2.5, 2.5, 2.5, 2.5, 2.5…
    ## $ qtr                             <int> 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,…
    ## $ time                            <chr> "10:00", "9:45", "9:22", "9:20", "9:20…
    ## $ clock_minutes                   <int> 10, 9, 9, 9, 9, 9, 8, 8, 8, 8, 8, 8, 7…
    ## $ clock_seconds                   <dbl> 0, 45, 22, 20, 20, 4, 46, 32, 29, 22, …
    ## $ home_timeout_called             <lgl> FALSE, FALSE, FALSE, FALSE, FALSE, FAL…
    ## $ away_timeout_called             <lgl> FALSE, FALSE, FALSE, FALSE, FALSE, FAL…
    ## $ half                            <int> 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,…
    ## $ game_half                       <int> 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,…
    ## $ lead_qtr                        <int> 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,…
    ## $ lead_half                       <int> 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,…
    ## $ start_quarter_seconds_remaining <dbl> 600, 585, 562, 560, 560, 544, 526, 512…
    ## $ start_half_seconds_remaining    <dbl> 1200, 1185, 1162, 1160, 1160, 1144, 11…
    ## $ start_game_seconds_remaining    <dbl> 2400, 2385, 2362, 2360, 2360, 2344, 23…
    ## $ end_quarter_seconds_remaining   <dbl> 600, 562, 560, 560, 544, 526, 512, 509…
    ## $ end_half_seconds_remaining      <dbl> 1200, 1162, 1160, 1160, 1144, 1126, 11…
    ## $ end_game_seconds_remaining      <dbl> 2400, 2362, 2360, 2360, 2344, 2326, 23…
    ## $ period                          <int> 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,…
    ## $ lag_qtr                         <int> NA, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1…
    ## $ lag_half                        <int> NA, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1…
    ## $ coordinate_x                    <dbl> -214748406.75, -38.75, 40.75, 40.75, 4…
    ## $ coordinate_y                    <dbl> -214748365, -13, -2, -2, 0, -2, 17, 5,…
    ## $ game_date                       <date> 2026-05-15, 2026-05-15, 2026-05-15, 2…
    ## $ game_date_time                  <dttm> 2026-05-15 19:30:00, 2026-05-15 19:30…
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

    ## 0.357 sec elapsed

``` r

glue::glue(
  "{nrow(wnba_team_box)} rows of WNBA team boxscore data from ",
  "{length(unique(wnba_team_box$game_id))} games."
)
```

    ## 48 rows of WNBA team boxscore data from 24 games.

``` r

dplyr::glimpse(wnba_team_box)
```

    ## Rows: 48
    ## Columns: 59
    ## $ game_id                           <int> 401856912, 401856912, 401856913, 401…
    ## $ season                            <int> 2026, 2026, 2026, 2026, 2026, 2026, …
    ## $ season_type                       <int> 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, …
    ## $ game_date                         <date> 2026-05-15, 2026-05-15, 2026-05-15,…
    ## $ game_date_time                    <dttm> 2026-05-15 22:00:00, 2026-05-15 22:…
    ## $ team_id                           <int> 131935, 6, 19, 11, 17, 18, 16, 5, 9,…
    ## $ team_uid                          <chr> "s:40~l:59~t:131935", "s:40~l:59~t:6…
    ## $ team_slug                         <chr> "toronto-tempo", "los-angeles-sparks…
    ## $ team_location                     <chr> "Toronto", "Los Angeles", "Chicago",…
    ## $ team_name                         <chr> "Tempo", "Sparks", "Sky", "Mercury",…
    ## $ team_abbreviation                 <chr> "TOR", "LA", "CHI", "PHX", "LV", "CO…
    ## $ team_display_name                 <chr> "Toronto Tempo", "Los Angeles Sparks…
    ## $ team_short_display_name           <chr> "Tempo", "Sparks", "Sky", "Mercury",…
    ## $ team_color                        <chr> "33476D", "552583", "5091cd", "3c286…
    ## $ team_alternate_color              <chr> "7B1B38", "fdb927", "ffd520", "fa4b0…
    ## $ team_logo                         <chr> "https://a.espncdn.com/i/teamlogos/w…
    ## $ team_home_away                    <chr> "away", "home", "away", "home", "awa…
    ## $ team_score                        <int> 95, 99, 83, 91, 101, 94, 104, 102, 1…
    ## $ team_winner                       <lgl> FALSE, TRUE, FALSE, TRUE, TRUE, FALS…
    ## $ assists                           <int> 22, 26, 16, 12, 24, 24, 18, 21, 32, …
    ## $ blocks                            <int> 4, 1, 7, 7, 6, 2, 8, 4, 0, 2, 7, 3, …
    ## $ defensive_rebounds                <int> 16, 22, 21, 30, 25, 21, 36, 18, 28, …
    ## $ fast_break_points                 <chr> "11", "6", "12", "14", "12", "12", "…
    ## $ field_goal_pct                    <dbl> 44, 64, 43, 39, 60, 44, 56, 39, 51, …
    ## $ field_goals_made                  <int> 31, 37, 29, 24, 35, 36, 38, 36, 34, …
    ## $ field_goals_attempted             <int> 70, 58, 68, 62, 58, 81, 68, 92, 67, …
    ## $ flagrant_fouls                    <int> 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, …
    ## $ fouls                             <int> 24, 18, 30, 22, 18, 25, 28, 25, 19, …
    ## $ free_throw_pct                    <dbl> 95, 80, 73, 90, 78, 87, 79, 68, 85, …
    ## $ free_throws_made                  <int> 21, 16, 19, 37, 25, 13, 22, 13, 17, …
    ## $ free_throws_attempted             <int> 22, 20, 26, 41, 32, 15, 28, 19, 20, …
    ## $ largest_lead                      <chr> "0", "20", "2", "17", "15", "0", "14…
    ## $ lead_changes                      <chr> "0", "0", "4", "4", "0", "0", "10", …
    ## $ lead_percentage                   <chr> "0", "99", "3", "91", "99", "0", "69…
    ## $ offensive_rebounds                <int> 10, 2, 6, 10, 3, 11, 8, 11, 4, 7, 6,…
    ## $ points_in_paint                   <chr> "30", "54", "38", "32", "54", "44", …
    ## $ steals                            <int> 13, 6, 5, 5, 6, 11, 3, 13, 7, 7, 6, …
    ## $ team_turnovers                    <int> 1, 0, 2, 0, 1, 0, 1, 0, 0, 1, 1, 2, …
    ## $ technical_fouls                   <int> 0, 3, 0, 1, 1, 0, 1, 0, 0, 0, 1, 0, …
    ## $ three_point_field_goal_pct        <dbl> 36, 43, 27, 29, 46, 36, 38, 40, 39, …
    ## $ three_point_field_goals_made      <int> 12, 9, 6, 6, 6, 9, 6, 17, 15, 9, 6, …
    ## $ three_point_field_goals_attempted <int> 33, 21, 22, 21, 13, 25, 16, 42, 38, …
    ## $ total_rebounds                    <int> 26, 24, 27, 40, 28, 32, 44, 29, 32, …
    ## $ total_technical_fouls             <int> 0, 3, 0, 1, 1, 0, 1, 0, 0, 0, 1, 0, …
    ## $ total_turnovers                   <int> 14, 16, 13, 15, 18, 13, 21, 11, 12, …
    ## $ turnover_points                   <chr> "20", "19", "15", "19", "18", "15", …
    ## $ turnovers                         <int> 13, 16, 11, 15, 17, 13, 20, 11, 12, …
    ## $ opponent_team_id                  <int> 6, 131935, 11, 19, 18, 17, 5, 16, 13…
    ## $ opponent_team_uid                 <chr> "s:40~l:59~t:6", "s:40~l:59~t:131935…
    ## $ opponent_team_slug                <chr> "los-angeles-sparks", "toronto-tempo…
    ## $ opponent_team_location            <chr> "Los Angeles", "Toronto", "Phoenix",…
    ## $ opponent_team_name                <chr> "Sparks", "Tempo", "Mercury", "Sky",…
    ## $ opponent_team_abbreviation        <chr> "LA", "TOR", "PHX", "CHI", "CON", "L…
    ## $ opponent_team_display_name        <chr> "Los Angeles Sparks", "Toronto Tempo…
    ## $ opponent_team_short_display_name  <chr> "Sparks", "Tempo", "Mercury", "Sky",…
    ## $ opponent_team_color               <chr> "552583", "33476D", "3c286e", "5091c…
    ## $ opponent_team_alternate_color     <chr> "fdb927", "7B1B38", "fa4b0a", "ffd52…
    ## $ opponent_team_logo                <chr> "https://a.espncdn.com/i/teamlogos/w…
    ## $ opponent_team_score               <int> 99, 95, 91, 83, 94, 101, 102, 104, 8…

``` r

tictoc::tic()
progressr::with_progress({
  wnba_player_box <- wehoop::load_wnba_player_box()
})
tictoc::toc()
```

    ## 0.297 sec elapsed

``` r

length(unique(wnba_player_box$game_id))
```

    ## [1] 24

``` r

nrow(wnba_player_box)
```

    ## [1] 562

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

    ## 15.613 sec elapsed

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

    ## 0.439 sec elapsed

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

    ## 1.236 sec elapsed

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
wp <- espn_wnba_event_probabilities(event_id = "401736171", limit = 200)
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
