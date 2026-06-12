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

    ## 0.482 sec elapsed

``` r

## 13.91 sec elapsed

glue::glue(
  "{nrow(wnba_pbp)} rows of WNBA play-by-play data from ",
  "{length(unique(wnba_pbp$game_id))} games."
)
```

    ## 37416 rows of WNBA play-by-play data from 90 games.

``` r

## 1782985 rows of WNBA play-by-play data from 4674 games.

dplyr::glimpse(wnba_pbp)
```

    ## Rows: 37,416
    ## Columns: 64
    ## $ game_play_number                <int> 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12,…
    ## $ id                              <dbl> 4018569784, 4018569787, 4018569788, 40…
    ## $ sequence_number                 <int> 4, 7, 8, 9, 11, 13, 16, 17, 18, 19, 20…
    ## $ type_id                         <int> 615, 144, 156, 92, 114, 141, 128, 90, …
    ## $ type_text                       <chr> "Jumpball", "Driving Floating Jump Sho…
    ## $ text                            <chr> "Olivia Nelson-Ododa vs. Nyara Sabally…
    ## $ away_score                      <int> 0, 0, 0, 0, 2, 2, 4, 4, 4, 4, 4, 4, 7,…
    ## $ home_score                      <int> 0, 0, 0, 3, 3, 5, 5, 5, 5, 5, 5, 7, 7,…
    ## $ period_number                   <int> 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,…
    ## $ period_display_value            <chr> "1st Quarter", "1st Quarter", "1st Qua…
    ## $ clock_display_value             <chr> "10:00", "9:44", "9:43", "9:41", "9:12…
    ## $ scoring_play                    <lgl> FALSE, FALSE, FALSE, TRUE, TRUE, TRUE,…
    ## $ score_value                     <int> 0, 0, 0, 3, 2, 2, 2, 0, 0, 0, 0, 2, 3,…
    ## $ team_id                         <int> 131935, 131935, 131935, 131935, 18, 13…
    ## $ athlete_id_1                    <int> 4398768, 3904576, 5345444, 3904576, 44…
    ## $ athlete_id_2                    <int> 4398966, NA, NA, 5345444, 4433514, 400…
    ## $ athlete_id_3                    <int> 2988756, NA, NA, NA, NA, NA, NA, NA, N…
    ## $ wallclock                       <chr> "2026-06-10T23:03:46Z", "2026-06-10T23…
    ## $ shooting_play                   <lgl> FALSE, TRUE, FALSE, TRUE, TRUE, TRUE, …
    ## $ coordinate_x_raw                <dbl> -214748340, 28, 28, 1, 26, 27, 24, 18,…
    ## $ coordinate_y_raw                <dbl> -214748365.00, 6.00, 6.00, 2.00, 8.00,…
    ## $ points_attempted                <int> 0, 2, 0, 3, 2, 2, 2, 0, 0, 3, 0, 2, 3,…
    ## $ short_description               <chr> "Jump Ball", "Missed FG", "Rebound", "…
    ## $ game_id                         <int> 401856978, 401856978, 401856978, 40185…
    ## $ season                          <int> 2026, 2026, 2026, 2026, 2026, 2026, 20…
    ## $ season_type                     <int> 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,…
    ## $ home_team_id                    <int> 131935, 131935, 131935, 131935, 131935…
    ## $ home_team_name                  <chr> "Toronto", "Toronto", "Toronto", "Toro…
    ## $ home_team_mascot                <chr> "Tempo", "Tempo", "Tempo", "Tempo", "T…
    ## $ home_team_abbrev                <chr> "TOR", "TOR", "TOR", "TOR", "TOR", "TO…
    ## $ home_team_name_alt              <chr> "Toronto", "Toronto", "Toronto", "Toro…
    ## $ away_team_id                    <int> 18, 18, 18, 18, 18, 18, 18, 18, 18, 18…
    ## $ away_team_name                  <chr> "Connecticut", "Connecticut", "Connect…
    ## $ away_team_mascot                <chr> "Sun", "Sun", "Sun", "Sun", "Sun", "Su…
    ## $ away_team_abbrev                <chr> "CON", "CON", "CON", "CON", "CON", "CO…
    ## $ away_team_name_alt              <chr> "Connecticut", "Connecticut", "Connect…
    ## $ game_spread                     <dbl> 2.5, 2.5, 2.5, 2.5, 2.5, 2.5, 2.5, 2.5…
    ## $ home_favorite                   <lgl> TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TR…
    ## $ game_spread_available           <lgl> FALSE, FALSE, FALSE, FALSE, FALSE, FAL…
    ## $ home_team_spread                <dbl> 2.5, 2.5, 2.5, 2.5, 2.5, 2.5, 2.5, 2.5…
    ## $ qtr                             <int> 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,…
    ## $ time                            <chr> "10:00", "9:44", "9:43", "9:41", "9:12…
    ## $ clock_minutes                   <int> 10, 9, 9, 9, 9, 8, 8, 8, 8, 7, 7, 7, 7…
    ## $ clock_seconds                   <dbl> 0, 44, 43, 41, 12, 55, 34, 22, 9, 57, …
    ## $ home_timeout_called             <lgl> FALSE, FALSE, FALSE, FALSE, FALSE, FAL…
    ## $ away_timeout_called             <lgl> FALSE, FALSE, FALSE, FALSE, FALSE, FAL…
    ## $ half                            <int> 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,…
    ## $ game_half                       <int> 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,…
    ## $ lead_qtr                        <int> 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,…
    ## $ lead_half                       <int> 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,…
    ## $ start_quarter_seconds_remaining <dbl> 600, 584, 583, 581, 552, 535, 514, 502…
    ## $ start_half_seconds_remaining    <dbl> 1200, 1184, 1183, 1181, 1152, 1135, 11…
    ## $ start_game_seconds_remaining    <dbl> 2400, 2384, 2383, 2381, 2352, 2335, 23…
    ## $ end_quarter_seconds_remaining   <dbl> 600, 583, 581, 552, 535, 514, 502, 489…
    ## $ end_half_seconds_remaining      <dbl> 1200, 1183, 1181, 1152, 1135, 1114, 11…
    ## $ end_game_seconds_remaining      <dbl> 2400, 2383, 2381, 2352, 2335, 2314, 23…
    ## $ period                          <int> 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,…
    ## $ lag_qtr                         <int> NA, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1…
    ## $ lag_half                        <int> NA, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1…
    ## $ coordinate_x                    <dbl> 214748406.75, 35.75, 35.75, 39.75, -33…
    ## $ coordinate_y                    <dbl> 214748365, -3, -3, 24, 1, -2, -1, 7, -…
    ## $ game_date                       <date> 2026-06-10, 2026-06-10, 2026-06-10, 2…
    ## $ game_date_time                  <dttm> 2026-06-10 19:00:00, 2026-06-10 19:00…
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

    ## 0.288 sec elapsed

``` r

glue::glue(
  "{nrow(wnba_team_box)} rows of WNBA team boxscore data from ",
  "{length(unique(wnba_team_box$game_id))} games."
)
```

    ## 180 rows of WNBA team boxscore data from 90 games.

``` r

dplyr::glimpse(wnba_team_box)
```

    ## Rows: 180
    ## Columns: 59
    ## $ game_id                           <int> 401856979, 401856979, 401856978, 401…
    ## $ season                            <int> 2026, 2026, 2026, 2026, 2026, 2026, …
    ## $ season_type                       <int> 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, …
    ## $ game_date                         <date> 2026-06-10, 2026-06-10, 2026-06-10,…
    ## $ game_date_time                    <dttm> 2026-06-10 22:00:00, 2026-06-10 22:…
    ## $ team_id                           <int> 6, 14, 18, 131935, 11, 129689, 3, 8,…
    ## $ team_uid                          <chr> "s:40~l:59~t:6", "s:40~l:59~t:14", "…
    ## $ team_slug                         <chr> "los-angeles-sparks", "seattle-storm…
    ## $ team_location                     <chr> "Los Angeles", "Seattle", "Connectic…
    ## $ team_name                         <chr> "Sparks", "Storm", "Sun", "Tempo", "…
    ## $ team_abbreviation                 <chr> "LA", "SEA", "CON", "TOR", "PHX", "G…
    ## $ team_display_name                 <chr> "Los Angeles Sparks", "Seattle Storm…
    ## $ team_short_display_name           <chr> "Sparks", "Storm", "Sun", "Tempo", "…
    ## $ team_color                        <chr> "552583", "2c5235", "f05023", "33476…
    ## $ team_alternate_color              <chr> "fdb927", "fee11a", "0a2240", "7B1B3…
    ## $ team_logo                         <chr> "https://a.espncdn.com/i/teamlogos/w…
    ## $ team_home_away                    <chr> "away", "home", "away", "home", "awa…
    ## $ team_score                        <int> 88, 83, 102, 106, 81, 87, 76, 100, 8…
    ## $ team_winner                       <lgl> TRUE, FALSE, FALSE, TRUE, FALSE, TRU…
    ## $ assists                           <int> 20, 26, 21, 18, 23, 18, 19, 21, 18, …
    ## $ blocks                            <int> 4, 4, 6, 3, 2, 2, 3, 3, 0, 7, 1, 5, …
    ## $ defensive_rebounds                <int> 25, 30, 24, 17, 24, 21, 23, 35, 24, …
    ## $ fast_break_points                 <chr> "9", "10", "11", "12", "20", "4", "1…
    ## $ field_goal_pct                    <dbl> 39, 47, 46, 45, 46, 44, 38, 54, 44, …
    ## $ field_goals_made                  <int> 29, 30, 34, 31, 30, 27, 29, 38, 31, …
    ## $ field_goals_attempted             <int> 75, 64, 74, 69, 65, 61, 77, 71, 70, …
    ## $ flagrant_fouls                    <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, …
    ## $ fouls                             <int> 17, 21, 29, 32, 20, 21, 18, 11, 15, …
    ## $ free_throw_pct                    <dbl> 84, 88, 68, 84, 67, 82, 100, 94, 94,…
    ## $ free_throws_made                  <int> 21, 14, 25, 36, 12, 23, 10, 17, 15, …
    ## $ free_throws_attempted             <int> 25, 16, 37, 43, 18, 28, 10, 18, 16, …
    ## $ largest_lead                      <chr> "9", "9", "14", "6", "6", "18", "2",…
    ## $ lead_changes                      <chr> "11", "11", "8", "8", "4", "4", "3",…
    ## $ lead_percentage                   <chr> "54", "37", "72", "19", "11", "87", …
    ## $ offensive_rebounds                <int> 13, 5, 18, 11, 9, 6, 8, 6, 12, 4, 6,…
    ## $ points_in_paint                   <chr> "34", "36", "40", "42", "32", "34", …
    ## $ steals                            <int> 10, 5, 3, 12, 7, 8, 9, 9, 9, 6, 10, …
    ## $ team_turnovers                    <int> 1, 0, 1, 0, 4, 0, 1, 0, 1, 1, 0, 1, …
    ## $ technical_fouls                   <int> 0, 0, 1, 0, 2, 0, 1, 0, 0, 1, 1, 0, …
    ## $ three_point_field_goal_pct        <dbl> 26, 31, 36, 33, 36, 34, 29, 50, 19, …
    ## $ three_point_field_goals_made      <int> 9, 9, 9, 8, 9, 10, 8, 7, 5, 8, 12, 1…
    ## $ three_point_field_goals_attempted <int> 35, 29, 25, 24, 25, 29, 28, 14, 26, …
    ## $ total_rebounds                    <int> 38, 35, 42, 28, 33, 27, 31, 41, 36, …
    ## $ total_technical_fouls             <int> 0, 0, 1, 0, 2, 0, 1, 0, 0, 1, 1, 0, …
    ## $ total_turnovers                   <int> 10, 15, 19, 11, 16, 9, 13, 12, 17, 1…
    ## $ turnover_points                   <chr> "11", "13", "23", "12", "17", "11", …
    ## $ turnovers                         <int> 9, 15, 18, 11, 12, 9, 12, 12, 16, 15…
    ## $ opponent_team_id                  <int> 14, 6, 131935, 18, 129689, 11, 8, 3,…
    ## $ opponent_team_uid                 <chr> "s:40~l:59~t:14", "s:40~l:59~t:6", "…
    ## $ opponent_team_slug                <chr> "seattle-storm", "los-angeles-sparks…
    ## $ opponent_team_location            <chr> "Seattle", "Los Angeles", "Toronto",…
    ## $ opponent_team_name                <chr> "Storm", "Sparks", "Tempo", "Sun", "…
    ## $ opponent_team_abbreviation        <chr> "SEA", "LA", "TOR", "CON", "GS", "PH…
    ## $ opponent_team_display_name        <chr> "Seattle Storm", "Los Angeles Sparks…
    ## $ opponent_team_short_display_name  <chr> "Storm", "Sparks", "Tempo", "Sun", "…
    ## $ opponent_team_color               <chr> "2c5235", "552583", "33476D", "f0502…
    ## $ opponent_team_alternate_color     <chr> "fee11a", "fdb927", "7B1B38", "0a224…
    ## $ opponent_team_logo                <chr> "https://a.espncdn.com/i/teamlogos/w…
    ## $ opponent_team_score               <int> 83, 88, 106, 102, 87, 81, 100, 76, 7…

``` r

tictoc::tic()
progressr::with_progress({
  wnba_player_box <- wehoop::load_wnba_player_box()
})
tictoc::toc()
```

    ## 0.294 sec elapsed

``` r

length(unique(wnba_player_box$game_id))
```

    ## [1] 90

``` r

nrow(wnba_player_box)
```

    ## [1] 2173

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

    ## 16.402 sec elapsed

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

    ## 0.374 sec elapsed

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

    ## 1.288 sec elapsed

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
