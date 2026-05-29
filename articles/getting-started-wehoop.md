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

    ## 0.472 sec elapsed

``` r

## 13.91 sec elapsed

glue::glue(
  "{nrow(wnba_pbp)} rows of WNBA play-by-play data from ",
  "{length(unique(wnba_pbp$game_id))} games."
)
```

    ## 22967 rows of WNBA play-by-play data from 55 games.

``` r

## 1782985 rows of WNBA play-by-play data from 4674 games.

dplyr::glimpse(wnba_pbp)
```

    ## Rows: 22,967
    ## Columns: 64
    ## $ game_play_number                <int> 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12,…
    ## $ id                              <dbl> 4018569434, 4018569437, 4018569438, 40…
    ## $ sequence_number                 <int> 4, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16…
    ## $ type_id                         <int> 615, 131, 155, 130, 155, 90, 92, 155, …
    ## $ type_text                       <chr> "Jumpball", "Pullup Jump Shot", "Defen…
    ## $ text                            <chr> "NaLyssa Smith vs. Jessica Shepard (Ja…
    ## $ away_score                      <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,…
    ## $ home_score                      <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3,…
    ## $ period_number                   <int> 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,…
    ## $ period_display_value            <chr> "1st Quarter", "1st Quarter", "1st Qua…
    ## $ clock_display_value             <chr> "10:00", "9:40", "9:38", "9:21", "9:18…
    ## $ scoring_play                    <lgl> FALSE, FALSE, FALSE, FALSE, FALSE, FAL…
    ## $ score_value                     <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3,…
    ## $ team_id                         <int> 17, 17, 3, 3, 17, 17, 3, 17, 17, 17, 3…
    ## $ athlete_id_1                    <int> 4398776, 4065870, 4399415, 3906949, 43…
    ## $ athlete_id_2                    <int> 3906949, NA, NA, NA, NA, NA, NA, NA, N…
    ## $ athlete_id_3                    <int> 4065870, NA, NA, NA, NA, NA, NA, NA, N…
    ## $ wallclock                       <chr> "2026-05-29T00:06:21Z", "2026-05-29T00…
    ## $ shooting_play                   <lgl> FALSE, TRUE, FALSE, TRUE, FALSE, FALSE…
    ## $ coordinate_x_raw                <dbl> -214748340, 39, 39, 21, 21, 39, 40, 40…
    ## $ coordinate_y_raw                <dbl> -214748365, 2, 2, 12, 12, 21, 21, 21, …
    ## $ points_attempted                <int> 0, 2, 0, 2, 0, 0, 3, 0, 3, 0, 0, 0, 3,…
    ## $ short_description               <chr> "Jump Ball", "Missed FG", "Rebound", "…
    ## $ game_id                         <int> 401856943, 401856943, 401856943, 40185…
    ## $ season                          <int> 2026, 2026, 2026, 2026, 2026, 2026, 20…
    ## $ season_type                     <int> 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,…
    ## $ home_team_id                    <int> 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3,…
    ## $ home_team_name                  <chr> "Dallas", "Dallas", "Dallas", "Dallas"…
    ## $ home_team_mascot                <chr> "Wings", "Wings", "Wings", "Wings", "W…
    ## $ home_team_abbrev                <chr> "DAL", "DAL", "DAL", "DAL", "DAL", "DA…
    ## $ home_team_name_alt              <chr> "Dallas", "Dallas", "Dallas", "Dallas"…
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
    ## $ time                            <chr> "10:00", "9:40", "9:38", "9:21", "9:18…
    ## $ clock_minutes                   <int> 10, 9, 9, 9, 9, 9, 8, 8, 8, 8, 8, 8, 8…
    ## $ clock_seconds                   <dbl> 0, 40, 38, 21, 18, 7, 49, 47, 36, 35, …
    ## $ home_timeout_called             <lgl> FALSE, FALSE, FALSE, FALSE, FALSE, FAL…
    ## $ away_timeout_called             <lgl> FALSE, FALSE, FALSE, FALSE, FALSE, FAL…
    ## $ half                            <int> 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,…
    ## $ game_half                       <int> 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,…
    ## $ lead_qtr                        <int> 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,…
    ## $ lead_half                       <int> 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,…
    ## $ start_quarter_seconds_remaining <dbl> 600, 580, 578, 561, 558, 547, 529, 527…
    ## $ start_half_seconds_remaining    <dbl> 1200, 1180, 1178, 1161, 1158, 1147, 11…
    ## $ start_game_seconds_remaining    <dbl> 2400, 2380, 2378, 2361, 2358, 2347, 23…
    ## $ end_quarter_seconds_remaining   <dbl> 600, 578, 561, 558, 547, 529, 527, 516…
    ## $ end_half_seconds_remaining      <dbl> 1200, 1178, 1161, 1158, 1147, 1129, 11…
    ## $ end_game_seconds_remaining      <dbl> 2400, 2378, 2361, 2358, 2347, 2329, 23…
    ## $ period                          <int> 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,…
    ## $ lag_qtr                         <int> NA, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1…
    ## $ lag_half                        <int> NA, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1…
    ## $ coordinate_x                    <dbl> -214748406.75, -39.75, 39.75, 29.75, -…
    ## $ coordinate_y                    <dbl> -214748365, 14, -14, 4, -4, 14, -15, 1…
    ## $ game_date                       <date> 2026-05-28, 2026-05-28, 2026-05-28, 2…
    ## $ game_date_time                  <dttm> 2026-05-28 20:00:00, 2026-05-28 20:00…
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

    ## 0.586 sec elapsed

``` r

glue::glue(
  "{nrow(wnba_team_box)} rows of WNBA team boxscore data from ",
  "{length(unique(wnba_team_box$game_id))} games."
)
```

    ## 110 rows of WNBA team boxscore data from 55 games.

``` r

dplyr::glimpse(wnba_team_box)
```

    ## Rows: 110
    ## Columns: 59
    ## $ game_id                           <int> 401856944, 401856944, 401856943, 401…
    ## $ season                            <int> 2026, 2026, 2026, 2026, 2026, 2026, …
    ## $ season_type                       <int> 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, …
    ## $ game_date                         <date> 2026-05-28, 2026-05-28, 2026-05-28,…
    ## $ game_date_time                    <dttm> 2026-05-28 22:00:00, 2026-05-28 22:…
    ## $ team_id                           <int> 5, 129689, 17, 3, 18, 132052, 16, 14…
    ## $ team_uid                          <chr> "s:40~l:59~t:5", "s:40~l:59~t:129689…
    ## $ team_slug                         <chr> "indiana-fever", "golden-state-valky…
    ## $ team_location                     <chr> "Indiana", "Golden State", "Las Vega…
    ## $ team_name                         <chr> "Fever", "Valkyries", "Aces", "Wings…
    ## $ team_abbreviation                 <chr> "IND", "GS", "LV", "DAL", "CON", "PO…
    ## $ team_display_name                 <chr> "Indiana Fever", "Golden State Valky…
    ## $ team_short_display_name           <chr> "Fever", "Valkyries", "Aces", "Wings…
    ## $ team_color                        <chr> "002d62", "b38fcf", "a7a8aa", "002b5…
    ## $ team_alternate_color              <chr> "e03a3e", "000000", "000000", "c4d60…
    ## $ team_logo                         <chr> "https://a.espncdn.com/i/teamlogos/w…
    ## $ team_home_away                    <chr> "away", "home", "away", "home", "awa…
    ## $ team_score                        <int> 88, 90, 87, 95, 61, 71, 78, 64, 81, …
    ## $ team_winner                       <lgl> FALSE, TRUE, FALSE, TRUE, FALSE, TRU…
    ## $ assists                           <int> 22, 24, 21, 23, 17, 16, 19, 14, 23, …
    ## $ blocks                            <int> 5, 11, 3, 5, 3, 3, 2, 3, 2, 2, 4, 3,…
    ## $ defensive_rebounds                <int> 27, 29, 25, 31, 19, 20, 27, 19, 17, …
    ## $ fast_break_points                 <chr> "12", "11", "7", "4", "10", "6", "2"…
    ## $ field_goal_pct                    <dbl> 41, 46, 44, 49, 39, 46, 42, 35, 45, …
    ## $ field_goals_made                  <int> 30, 31, 36, 33, 24, 24, 28, 22, 29, …
    ## $ field_goals_attempted             <int> 73, 68, 82, 67, 62, 52, 66, 63, 65, …
    ## $ flagrant_fouls                    <int> 0, 0, 0, 1, 0, 1, 0, 0, 1, 0, 1, 0, …
    ## $ fouls                             <int> 25, 21, 15, 16, 22, 21, 22, 21, 10, …
    ## $ free_throw_pct                    <dbl> 90, 71, 58, 86, 55, 67, 94, 79, 75, …
    ## $ free_throws_made                  <int> 19, 20, 7, 19, 12, 16, 15, 15, 12, 9…
    ## $ free_throws_attempted             <int> 21, 28, 12, 22, 22, 24, 16, 19, 16, …
    ## $ largest_lead                      <chr> "7", "11", "13", "12", "5", "11", "2…
    ## $ lead_changes                      <chr> "9", "9", "6", "6", "13", "13", "0",…
    ## $ lead_percentage                   <chr> "15", "69", "57", "32", "21", "74", …
    ## $ offensive_rebounds                <int> 7, 8, 8, 8, 14, 6, 13, 12, 10, 5, 10…
    ## $ points_in_paint                   <chr> "40", "42", "48", "38", "38", "32", …
    ## $ steals                            <int> 7, 5, 5, 1, 9, 10, 4, 7, 5, 10, 6, 7…
    ## $ team_turnovers                    <int> 0, 0, 0, 0, 5, 2, 0, 1, 2, 0, 1, 0, …
    ## $ technical_fouls                   <int> 0, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0, 0, …
    ## $ three_point_field_goal_pct        <dbl> 32, 38, 40, 45, 5, 32, 33, 22, 35, 3…
    ## $ three_point_field_goals_made      <int> 9, 8, 8, 10, 1, 7, 7, 5, 11, 7, 12, …
    ## $ three_point_field_goals_attempted <int> 28, 21, 20, 22, 21, 22, 21, 23, 31, …
    ## $ total_rebounds                    <int> 34, 37, 33, 39, 33, 26, 40, 31, 27, …
    ## $ total_technical_fouls             <int> 0, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0, 0, …
    ## $ total_turnovers                   <int> 11, 11, 5, 10, 22, 21, 12, 12, 18, 1…
    ## $ turnover_points                   <chr> "8", "15", "7", "12", "28", "19", "8…
    ## $ turnovers                         <int> 11, 11, 5, 10, 17, 19, 12, 11, 16, 1…
    ## $ opponent_team_id                  <int> 129689, 5, 3, 17, 132052, 18, 14, 16…
    ## $ opponent_team_uid                 <chr> "s:40~l:59~t:129689", "s:40~l:59~t:5…
    ## $ opponent_team_slug                <chr> "golden-state-valkyries", "indiana-f…
    ## $ opponent_team_location            <chr> "Golden State", "Indiana", "Dallas",…
    ## $ opponent_team_name                <chr> "Valkyries", "Fever", "Wings", "Aces…
    ## $ opponent_team_abbreviation        <chr> "GS", "IND", "DAL", "LV", "POR", "CO…
    ## $ opponent_team_display_name        <chr> "Golden State Valkyries", "Indiana F…
    ## $ opponent_team_short_display_name  <chr> "Valkyries", "Fever", "Wings", "Aces…
    ## $ opponent_team_color               <chr> "b38fcf", "002d62", "002b5c", "a7a8a…
    ## $ opponent_team_alternate_color     <chr> "000000", "e03a3e", "c4d600", "00000…
    ## $ opponent_team_logo                <chr> "https://a.espncdn.com/i/teamlogos/w…
    ## $ opponent_team_score               <int> 90, 88, 95, 87, 71, 61, 64, 78, 96, …

``` r

tictoc::tic()
progressr::with_progress({
  wnba_player_box <- wehoop::load_wnba_player_box()
})
tictoc::toc()
```

    ## 0.352 sec elapsed

``` r

length(unique(wnba_player_box$game_id))
```

    ## [1] 55

``` r

nrow(wnba_player_box)
```

    ## [1] 1321

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

    ## 18.394 sec elapsed

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

    ## 1.3 sec elapsed

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
