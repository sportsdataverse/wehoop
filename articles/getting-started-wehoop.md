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

    ## 1.775 sec elapsed

``` r

## 13.91 sec elapsed

glue::glue(
  "{nrow(wnba_pbp)} rows of WNBA play-by-play data from ",
  "{length(unique(wnba_pbp$game_id))} games."
)
```

    ## 140365 rows of WNBA play-by-play data from 344 games.

``` r

## 1782985 rows of WNBA play-by-play data from 4674 games.

dplyr::glimpse(wnba_pbp)
```

    ## Rows: 140,365
    ## Columns: 67
    ## $ game_play_number                <int> 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12,…
    ## $ id                              <dbl> 4019182954, 4019182957, 4019182958, 40…
    ## $ sequence_number                 <int> 4, 7, 8, 9, 11, 13, 14, 15, 16, 18, 20…
    ## $ type_id                         <int> 615, 131, 155, 128, 92, 64, 95, 155, 4…
    ## $ type_text                       <chr> "Jumpball", "Pullup Jump Shot", "Defen…
    ## $ text                            <chr> "Jonquel Jones vs. Angel Reese (Naz Hi…
    ## $ away_score                      <int> 0, 0, 0, 2, 2, 2, 2, 2, 2, 2, 3, 4, 4,…
    ## $ home_score                      <int> 0, 0, 0, 0, 3, 3, 3, 3, 3, 3, 3, 3, 6,…
    ## $ period_number                   <int> 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,…
    ## $ period_display_value            <chr> "1st Quarter", "1st Quarter", "1st Qua…
    ## $ clock_display_value             <chr> "10:00", "9:39", "9:38", "9:24", "9:07…
    ## $ scoring_play                    <lgl> FALSE, FALSE, FALSE, TRUE, TRUE, FALSE…
    ## $ score_value                     <int> 0, 0, 0, 2, 3, 0, 0, 0, 0, 0, 1, 1, 3,…
    ## $ team_id                         <int> 20, 20, 9, 9, 20, 9, 20, 9, 20, 20, 9,…
    ## $ athlete_id_1                    <int> 4433402, 3058901, 2999101, 5345320, 30…
    ## $ athlete_id_2                    <int> 2999101, NA, NA, 2998928, 4398915, NA,…
    ## $ athlete_id_3                    <int> 4398915, NA, NA, NA, NA, NA, NA, NA, N…
    ## $ wallclock                       <chr> "2026-10-04T18:04:22Z", "2026-10-04T18…
    ## $ shooting_play                   <lgl> FALSE, TRUE, FALSE, TRUE, TRUE, FALSE,…
    ## $ coordinate_x_raw                <dbl> -214748340, 30, 30, 25, 25, 22, 25, 25…
    ## $ coordinate_y_raw                <dbl> -214748365.00, 3.00, 3.00, 1.00, 24.00…
    ## $ points_attempted                <int> 0, 2, 0, 2, 3, 0, 2, 0, 0, 0, 1, 1, 3,…
    ## $ short_description               <chr> "Jump Ball", "Missed FG", "Rebound", "…
    ## $ game_id                         <int> 401918295, 401918295, 401918295, 40191…
    ## $ season                          <int> 2026, 2026, 2026, 2026, 2026, 2026, 20…
    ## $ season_type                     <int> 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3,…
    ## $ home_team_id                    <int> 20, 20, 20, 20, 20, 20, 20, 20, 20, 20…
    ## $ home_team_name                  <chr> "Atlanta", "Atlanta", "Atlanta", "Atla…
    ## $ home_team_mascot                <chr> "Dream", "Dream", "Dream", "Dream", "D…
    ## $ home_team_abbrev                <chr> "ATL", "ATL", "ATL", "ATL", "ATL", "AT…
    ## $ home_team_name_alt              <chr> "Atlanta", "Atlanta", "Atlanta", "Atla…
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
    ## $ time                            <chr> "10:00", "9:39", "9:38", "9:24", "9:07…
    ## $ clock_minutes                   <int> 10, 9, 9, 9, 9, 8, 8, 8, 8, 7, 7, 7, 7…
    ## $ clock_seconds                   <dbl> 0, 39, 38, 24, 7, 44, 24, 23, 10, 58, …
    ## $ home_timeout_called             <lgl> FALSE, FALSE, FALSE, FALSE, FALSE, FAL…
    ## $ away_timeout_called             <lgl> FALSE, FALSE, FALSE, FALSE, FALSE, FAL…
    ## $ half                            <int> 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,…
    ## $ game_half                       <int> 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,…
    ## $ lag_qtr                         <int> NA, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1…
    ## $ lead_qtr                        <int> 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,…
    ## $ lag_half                        <int> NA, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1…
    ## $ lead_half                       <int> 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,…
    ## $ start_quarter_seconds_remaining <dbl> 600, 579, 578, 564, 547, 524, 504, 503…
    ## $ start_half_seconds_remaining    <dbl> 1200, 1179, 1178, 1164, 1147, 1124, 11…
    ## $ start_game_seconds_remaining    <dbl> 2400, 2379, 2378, 2364, 2347, 2324, 23…
    ## $ end_quarter_seconds_remaining   <dbl> 600, 578, 564, 547, 524, 504, 503, 490…
    ## $ end_half_seconds_remaining      <dbl> 1200, 1178, 1164, 1147, 1124, 1104, 11…
    ## $ end_game_seconds_remaining      <dbl> 2400, 2378, 2364, 2347, 2324, 2304, 23…
    ## $ period                          <int> 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,…
    ## $ coordinate_x                    <dbl> 214748406.75, 38.75, -38.75, -40.75, 1…
    ## $ coordinate_y                    <dbl> 214748365, -5, 5, 0, 0, -3, 0, 0, 7, 0…
    ## $ game_date                       <date> 2026-10-04, 2026-10-04, 2026-10-04, 2…
    ## $ game_date_time                  <dttm> 2026-10-04 14:00:00, 2026-10-04 14:00…
    ## $ athlete_name_1                  <chr> "Angel Reese", "Allisha Gray", "Jonque…
    ## $ athlete_name_2                  <chr> "Jonquel Jones", NA, NA, "Breanna Stew…
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

    ## 0.479 sec elapsed

``` r

glue::glue(
  "{nrow(wnba_team_box)} rows of WNBA team boxscore data from ",
  "{length(unique(wnba_team_box$game_id))} games."
)
```

    ## 688 rows of WNBA team boxscore data from 344 games.

``` r

dplyr::glimpse(wnba_team_box)
```

    ## Rows: 688
    ## Columns: 59
    ## $ game_id                           <int> 401918295, 401918295, 401918296, 401…
    ## $ season                            <int> 2026, 2026, 2026, 2026, 2026, 2026, …
    ## $ season_type                       <int> 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, …
    ## $ game_date                         <date> 2026-10-04, 2026-10-04, 2026-10-04,…
    ## $ game_date_time                    <dttm> 2026-10-04 14:00:00, 2026-10-04 14:…
    ## $ team_id                           <int> 9, 20, 17, 129689, 3, 129689, 5, 17,…
    ## $ team_uid                          <chr> "s:40~l:59~t:9", "s:40~l:59~t:20", "…
    ## $ team_slug                         <chr> "new-york-liberty", "atlanta-dream",…
    ## $ team_location                     <chr> "New York", "Atlanta", "Las Vegas", …
    ## $ team_name                         <chr> "Liberty", "Dream", "Aces", "Valkyri…
    ## $ team_abbreviation                 <chr> "NY", "ATL", "LV", "GS", "DAL", "GS"…
    ## $ team_display_name                 <chr> "New York Liberty", "Atlanta Dream",…
    ## $ team_short_display_name           <chr> "Liberty", "Dream", "Aces", "Valkyri…
    ## $ team_color                        <chr> "86cebc", "e31837", "a7a8aa", "b38fc…
    ## $ team_alternate_color              <chr> "000000", "5091cc", "000000", "00000…
    ## $ team_logo                         <chr> "https://a.espncdn.com/i/teamlogos/w…
    ## $ team_home_away                    <chr> "away", "home", "away", "home", "awa…
    ## $ team_score                        <int> 82, 92, 60, 71, 73, 77, 83, 94, 93, …
    ## $ team_winner                       <lgl> FALSE, TRUE, FALSE, TRUE, FALSE, TRU…
    ## $ assists                           <int> 17, 20, 12, 13, 13, 17, 16, 15, 23, …
    ## $ blocks                            <int> 9, 4, 3, 6, 5, 5, 6, 4, 4, 1, 2, 2, …
    ## $ defensive_rebounds                <int> 27, 25, 23, 35, 30, 26, 29, 32, 20, …
    ## $ fast_break_points                 <chr> "0", "18", "3", "8", "2", "10", "11"…
    ## $ field_goal_pct                    <dbl> 43, 45, 34, 38, 44, 35, 38, 45, 45, …
    ## $ field_goals_made                  <int> 28, 32, 21, 26, 26, 27, 30, 29, 30, …
    ## $ field_goals_attempted             <int> 65, 71, 62, 69, 59, 77, 78, 64, 67, …
    ## $ flagrant_fouls                    <int> 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, …
    ## $ fouls                             <int> 17, 12, 13, 15, 23, 18, 27, 19, 26, …
    ## $ free_throw_pct                    <dbl> 100, 78, 73, 75, 84, 78, 70, 80, 91,…
    ## $ free_throws_made                  <int> 15, 18, 11, 12, 16, 14, 14, 28, 20, …
    ## $ free_throws_attempted             <int> 15, 23, 15, 16, 19, 18, 20, 35, 22, …
    ## $ largest_lead                      <chr> "6", "16", "3", "13", "16", "4", "8"…
    ## $ lead_changes                      <chr> "15", "15", "7", "7", "5", "5", "7",…
    ## $ lead_percentage                   <chr> "43", "55", "12", "81", "77", "10", …
    ## $ offensive_rebounds                <int> 7, 9, 2, 17, 6, 14, 9, 2, 7, 12, 6, …
    ## $ points_in_paint                   <chr> "30", "38", "18", "34", "32", "34", …
    ## $ steals                            <int> 6, 14, 9, 5, 4, 5, 8, 4, 10, 3, 8, 6…
    ## $ team_turnovers                    <int> 2, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, …
    ## $ technical_fouls                   <int> 0, 0, 0, 0, 0, 1, 2, 1, 1, 0, 0, 0, …
    ## $ three_point_field_goal_pct        <dbl> 39, 38, 33, 29, 31, 31, 28, 40, 41, …
    ## $ three_point_field_goals_made      <int> 11, 10, 7, 7, 5, 9, 9, 8, 13, 7, 12,…
    ## $ three_point_field_goals_attempted <int> 28, 26, 21, 24, 16, 29, 32, 20, 32, …
    ## $ total_rebounds                    <int> 34, 34, 25, 52, 36, 40, 38, 34, 27, …
    ## $ total_technical_fouls             <int> 0, 0, 0, 0, 0, 1, 2, 1, 1, 0, 0, 0, …
    ## $ total_turnovers                   <int> 21, 13, 6, 14, 11, 6, 10, 10, 8, 19,…
    ## $ turnover_points                   <chr> "32", "14", "11", "11", "10", "9", "…
    ## $ turnovers                         <int> 19, 13, 6, 13, 10, 6, 10, 10, 8, 19,…
    ## $ opponent_team_id                  <int> 20, 9, 129689, 17, 129689, 3, 17, 5,…
    ## $ opponent_team_uid                 <chr> "s:40~l:59~t:20", "s:40~l:59~t:9", "…
    ## $ opponent_team_slug                <chr> "atlanta-dream", "new-york-liberty",…
    ## $ opponent_team_location            <chr> "Atlanta", "New York", "Golden State…
    ## $ opponent_team_name                <chr> "Dream", "Liberty", "Valkyries", "Ac…
    ## $ opponent_team_abbreviation        <chr> "ATL", "NY", "GS", "LV", "GS", "DAL"…
    ## $ opponent_team_display_name        <chr> "Atlanta Dream", "New York Liberty",…
    ## $ opponent_team_short_display_name  <chr> "Dream", "Liberty", "Valkyries", "Ac…
    ## $ opponent_team_color               <chr> "e31837", "86cebc", "b38fcf", "a7a8a…
    ## $ opponent_team_alternate_color     <chr> "5091cc", "000000", "000000", "00000…
    ## $ opponent_team_logo                <chr> "https://a.espncdn.com/i/teamlogos/w…
    ## $ opponent_team_score               <int> 92, 82, 71, 60, 77, 73, 94, 83, 75, …

``` r

tictoc::tic()
progressr::with_progress({
  wnba_player_box <- wehoop::load_wnba_player_box()
})
tictoc::toc()
```

    ## 0.589 sec elapsed

``` r

length(unique(wnba_player_box$game_id))
```

    ## [1] 344

``` r

nrow(wnba_player_box)
```

    ## [1] 8342

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

    ## 0.337 sec elapsed

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

    ## 0.32 sec elapsed

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

    ## 0.341 sec elapsed

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
