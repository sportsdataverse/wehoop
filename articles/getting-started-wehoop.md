# Getting Started with wehoop: WNBA and Women's College Basketball Data in R

**`wehoop` is an R package for women’s basketball data: the WNBA, NCAA
women’s college basketball, and a growing list of women’s leagues and
national team competitions around the world.** It gives you two ways in.
Release loaders (`load_*()`) download whole seasons of pre-built
play-by-play, box scores and model outputs in seconds. Live wrappers
(`espn_*()`, `wnba_*()`, and the international families) call a source
directly when you need today’s game or a dataset nobody has pre-built.

This guide is for students and newcomers. It assumes no prior experience
with sports data and only a little R.

### What you’ll learn

- How to install `wehoop` and the packages used in this guide.
- How the function names map to data sources, so you can guess the
  function you need.
- How to load a full WNBA season of team box scores and play-by-play.
- How to turn a box score into a team statistic and draw your first
  chart with `ggplot2`.
- The basketball analytics vocabulary (possessions, pace, ratings, true
  shooting and the rest) used across the other articles.
- Where to go next.

### How do I install wehoop?

`wehoop` needs R 4.1.0 or newer. If you are starting from zero, install
R from [CRAN](https://cran.r-project.org) and then the free [RStudio
Desktop](https://posit.co/download/rstudio-desktop/) editor. Windows
users should also install
[Rtools](https://cran.r-project.org/bin/windows/Rtools/), which R uses
to build packages from source.

Then install the package. The CRAN release is the stable choice. The
GitHub version gets new data sources first.

``` r

# CRAN release
install.packages("wehoop")

# Development version from GitHub
if (!requireNamespace("pak", quietly = TRUE)) install.packages("pak")
pak::pak("sportsdataverse/wehoop")

# Packages used in the examples below
install.packages(c("dplyr", "ggplot2", "tidyr"))
```

A few loaders read Apache Parquet files. They need the `arrow` package
(`install.packages("arrow")`). The functions that fit a RAPM model need
`glmnet` and `Matrix`.

``` r

library(wehoop)
library(dplyr)
library(ggplot2)
```

### Which function reads which source?

The prefix of a function name tells you where its data comes from. Learn
the prefixes and the rest of the package becomes guessable:
[`espn_wnba_pbp()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_all.md)
and
[`espn_wbb_pbp()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_game_all.md)
take the same arguments and return the same columns, one for the WNBA
and one for women’s college basketball.

| Prefix | Source | What you get | Network call? |
|----|----|----|----|
| `load_wnba_*()` | sportsdataverse GitHub releases (ESPN-derived) | Whole WNBA seasons: play-by-play, team and player box scores, schedules, rosters, shots, officials | Downloads a pre-built file |
| `load_wbb_*()` | sportsdataverse GitHub releases (ESPN-derived) | The same tables for NCAA women’s college basketball, plus [`load_wbb_ratings()`](https://wehoop.sportsdataverse.org/reference/load_wbb_player_value.md) and [`load_wbb_player_value()`](https://wehoop.sportsdataverse.org/reference/load_wbb_player_value.md) | Downloads a pre-built file |
| `load_wnba_stats_*()` | sportsdataverse GitHub releases (WNBA Stats API-derived) | WNBA Stats schedules, play-by-play, shots, lineups, league dashboards, possessions | Downloads a pre-built file |
| `load_ncaa_wbb_*()` | sportsdataverse GitHub releases (stats.ncaa.org-derived) | NCAA play-by-play, shots, lineups, stints, possessions, RAPM | Downloads a pre-built file |
| `espn_wnba_*()`, `espn_wbb_*()` | ESPN site and core APIs | Live scoreboards, games, rosters, athletes, standings, odds, news | Yes |
| `wnba_*()` | WNBA Stats API (stats.wnba.com) | Deep WNBA stats: league dashboards, hustle, tracking, lineups, shot charts | Yes |
| `ncaa_wbb_*()` | NCAA.com | NET rankings and the team list | Yes |
| `fox_*()` | Fox Sports | WNBA and WBB scores, box scores, play-by-play | Yes |
| `bref_wnba_*()`, `hhs_*()`, `bart_wbb_*()` | Basketball-Reference, Her Hoop Stats (subscription), Bart Torvik | Season tables and ratings | Yes |
| `fiba_*()`, `genius_*()`, `atrium_*()`, `nbl_rosetta_*()`, `scb_*()`, `feb_*()`, `tbf_*()`, `wjbl_*()`, `wbbl_*()`, `lfb_*()`, … | International league and federation feeds | Women’s World Cup, Olympics, EuroLeague Women, WNBL, W League and more | Yes |

The full list, grouped by family, is the [function
reference](https://wehoop.sportsdataverse.org/reference/index.md). Jump
straight to a group:

- [Release loaders (wehoop
  Data)](https://wehoop.sportsdataverse.org/reference/index.html#wehoop-data):
  [WNBA](https://wehoop.sportsdataverse.org/reference/index.html#wnba-data-functions),
  [women’s
  college](https://wehoop.sportsdataverse.org/reference/index.html#women-s-college-basketball-data-functions),
  [WNBA Stats
  API](https://wehoop.sportsdataverse.org/reference/index.html#wnba-stats-api-data-loaders),
  [NCAA play-by-play
  engine](https://wehoop.sportsdataverse.org/reference/index.html#ncaa-women-s-college-basketball-play-by-play-engine-data-loaders),
  and [model
  datasets](https://wehoop.sportsdataverse.org/reference/index.html#model-dataset-loaders).
- [ESPN live
  wrappers](https://wehoop.sportsdataverse.org/reference/index.html#espn-data).
- [WNBA Stats API live
  wrappers](https://wehoop.sportsdataverse.org/reference/index.html#wnba-stats-data).
- [NCAA.com](https://wehoop.sportsdataverse.org/reference/index.html#ncaa-data).
- [International
  basketball](https://wehoop.sportsdataverse.org/reference/index.html#international-basketball).

#### Release loaders or live wrappers?

Reach for a `load_*()` function whenever you want history. It reads one
file per season from a public GitHub release, so a full season arrives
in seconds and you never hit a rate limit. Every loader takes a
`seasons` argument: a single year, a vector such as `2022:2025`, or
`TRUE` for every published season.

Reach for a live wrapper when you need a game that finished an hour ago,
or a dataset that is not pre-built. Live wrappers are slower, and the
sources behind them can throttle you if you loop over hundreds of
requests.

A season is labelled by the calendar year for the WNBA (`2025` is the
2025 season) and by the **ending** year for college (`2026` is the
2025-26 season).
[`most_recent_wnba_season()`](https://wehoop.sportsdataverse.org/reference/most_recent_wnba_season.md)
and
[`most_recent_wbb_season()`](https://wehoop.sportsdataverse.org/reference/most_recent_wbb_season.md)
return the current label.

### A first worked example: a WNBA season in five minutes

This guide uses the 2025 WNBA season, the most recent one with a full
regular season and playoffs at the time of writing.

``` r

wnba_season <- 2025
```

#### Load the team box scores

[`load_wnba_team_box()`](https://wehoop.sportsdataverse.org/reference/load_wnba_draft.md)
returns one row per team per game.

``` r

team_box <- load_wnba_team_box(seasons = wnba_season)

dim(team_box)
#> [1] 624  57

team_box |>
  select(game_date, team_abbreviation, team_score,
         opponent_team_abbreviation, opponent_team_score, season_type) |>
  head()
#> # A tibble: 6 × 6
#>   game_date  team_abbreviation team_score opponent_team_abbreviation
#>   <date>     <chr>                  <int> <chr>                     
#> 1 2025-10-10 LV                        97 PHX                       
#> 2 2025-10-10 PHX                       86 LV                        
#> 3 2025-10-08 LV                        90 PHX                       
#> 4 2025-10-08 PHX                       88 LV                        
#> 5 2025-10-05 PHX                       78 LV                        
#> 6 2025-10-05 LV                        91 PHX                       
#> # ℹ 2 more variables: opponent_team_score <int>, season_type <int>
```

`season_type` is `2` for the regular season and `3` for the playoffs.
Each game appears twice, once from each team’s side, which is why
`opponent_*` columns sit next to the team’s own. The release covers 312
games for 2025.

#### Compute a team statistic

Raw points per game mixes two things: how efficient a team is, and how
many chances it gets. Analysts separate them by counting
**possessions**, the number of times a team has the ball. A box score
does not record possessions directly, so we estimate them from field
goal attempts, offensive rebounds, turnovers and free throw attempts
(the formula is in the [glossary](#glossary)). Points per 100
possessions is called **offensive rating**.

``` r

team_ratings <- team_box |>
  filter(season_type == 2) |>
  mutate(
    possessions = field_goals_attempted - offensive_rebounds +
      turnovers + 0.44 * free_throws_attempted
  ) |>
  group_by(team_abbreviation) |>
  summarise(
    games = n(),
    points = sum(team_score),
    points_allowed = sum(opponent_team_score),
    possessions = sum(possessions),
    .groups = "drop"
  ) |>
  # The All-Star Game is filed as a regular-season game between two
  # one-off "teams"; keep only the real franchises.
  filter(games >= 20) |>
  mutate(
    off_rating = 100 * points / possessions,
    def_rating = 100 * points_allowed / possessions,
    net_rating = off_rating - def_rating
  ) |>
  arrange(desc(net_rating))

team_ratings
#> # A tibble: 13 × 8
#>    team_abbreviation games points points_allowed possessions off_rating
#>    <chr>             <int>  <int>          <int>       <dbl>      <dbl>
#>  1 MIN                  45   3846           3447       3540.      109. 
#>  2 ATL                  44   3712           3378       3449.      108. 
#>  3 NY                   44   3713           3534       3506.      106. 
#>  4 IND                  45   3808           3645       3621.      105. 
#>  5 LV                   44   3680           3552       3502.      105. 
#>  6 PHX                  44   3643           3525       3531.      103. 
#>  7 SEA                  44   3614           3524       3561.      101. 
#>  8 GS                   44   3420           3359       3405.      100. 
#>  9 LA                   44   3769           3882       3618.      104. 
#> 10 WSH                  44   3394           3589       3489.       97.3
#> 11 DAL                  44   3594           3871       3620.       99.3
#> 12 CHI                  44   3335           3777       3487.       95.6
#> 13 CON                  44   3337           3782       3505.       95.2
#> # ℹ 2 more variables: def_rating <dbl>, net_rating <dbl>
```

(We use the team’s own possessions as the denominator for both ratings.
Both teams have nearly the same number of possessions in a game, so the
difference is small. The [advanced metrics
article](https://wehoop.sportsdataverse.org/articles/womens-basketball-advanced-metrics.md)
covers the refinements.)

#### Draw your first chart

``` r

ggplot(team_ratings, aes(off_rating, def_rating)) +
  geom_hline(yintercept = mean(team_ratings$def_rating), linetype = "dashed", color = "grey60") +
  geom_vline(xintercept = mean(team_ratings$off_rating), linetype = "dashed", color = "grey60") +
  geom_point(size = 3, color = "#221A4D") +
  geom_text(aes(label = team_abbreviation), vjust = -0.9, size = 3.5) +
  scale_y_reverse() +
  labs(
    title = paste(wnba_season, "WNBA regular season: team efficiency"),
    subtitle = "Points scored and allowed per 100 estimated possessions. Up and to the right is better.",
    x = "Offensive rating", y = "Defensive rating (reversed)",
    caption = "Data: wehoop::load_wnba_team_box()"
  ) +
  theme_minimal()
```

![Scatter plot of 2025 WNBA teams: offensive rating on the x-axis and
defensive rating on the y-axis, with the y-axis reversed so better
defenses sit
higher.](getting-started-wehoop_files/figure-html/first-plot-1.png)

Teams in the top-right quadrant score efficiently and defend well.

#### Load play-by-play

Play-by-play (often shortened to **pbp**) has one row per event: every
shot, rebound, foul, turnover, substitution and timeout, with the clock
and score at that moment.

``` r

pbp <- load_wnba_pbp(seasons = wnba_season)

nrow(pbp)
#> [1] 121342
length(unique(pbp$game_id))
#> [1] 312

pbp |>
  select(game_id, period_number, clock_display_value, type_text,
         scoring_play, score_value, home_score, away_score) |>
  head()
#> # A tibble: 6 × 8
#>     game_id period_number clock_display_value type_text scoring_play score_value
#>       <int>         <int> <chr>               <chr>     <lgl>              <int>
#> 1 401820329             1 10:00               Jumpball  FALSE                  0
#> 2 401820329             1 9:48                Pullup J… FALSE                  0
#> 3 401820329             1 9:45                Defensiv… FALSE                  0
#> 4 401820329             1 9:28                Layup Sh… FALSE                  0
#> 5 401820329             1 9:22                Offensiv… FALSE                  0
#> 6 401820329             1 9:21                Layup Sh… TRUE                   2
#> # ℹ 2 more variables: home_score <int>, away_score <int>
```

A quick question pbp can answer and a box score cannot: when in the game
do points get scored?

``` r

pbp |>
  filter(scoring_play == TRUE, period_number <= 4) |>
  group_by(period_number) |>
  summarise(points = sum(score_value), games = n_distinct(game_id), .groups = "drop") |>
  mutate(points_per_game = points / games)
#> # A tibble: 4 × 4
#>   period_number points games points_per_game
#>           <int>  <int> <int>           <dbl>
#> 1             1  12988   312            41.6
#> 2             2  12632   312            40.5
#> 3             3  12966   312            41.6
#> 4             4  12318   312            39.5
```

The `pbp` table also carries `game_spread`, `home_favorite`,
`game_spread_available` and `home_team_spread`. In the current releases
these columns hold a placeholder value, not a real market line, so leave
them out of any analysis.

#### Load player box scores

``` r

player_box <- load_wnba_player_box(seasons = wnba_season)

player_box |>
  filter(season_type == 2, did_not_play == FALSE) |>
  group_by(athlete_display_name, team_abbreviation) |>
  summarise(
    games = n(),
    ppg = mean(points, na.rm = TRUE),
    rpg = mean(rebounds, na.rm = TRUE),
    apg = mean(assists, na.rm = TRUE),
    .groups = "drop"
  ) |>
  filter(games >= 20) |>
  arrange(desc(ppg)) |>
  head(10)
#> # A tibble: 10 × 6
#>    athlete_display_name team_abbreviation games   ppg   rpg   apg
#>    <chr>                <chr>             <int> <dbl> <dbl> <dbl>
#>  1 A'ja Wilson          LV                   40  23.4 10.2   3.05
#>  2 Napheesa Collier     MIN                  34  22.6  7.35  3.18
#>  3 Kelsey Mitchell      IND                  45  20.0  1.73  3.4 
#>  4 Kelsey Plum          LA                   43  19.5  3.07  5.74
#>  5 Paige Bueckers       DAL                  36  19.2  3.94  5.39
#>  6 Dearica Hamby        LA                   44  18.4  7.93  3.27
#>  7 Allisha Gray         ATL                  42  18.4  5.31  3.5 
#>  8 Breanna Stewart      NY                   31  18.3  6.55  3.48
#>  9 Nneka Ogwumike       SEA                  44  18.2  7.02  2.25
#> 10 Sabrina Ionescu      NY                   38  18.2  4.87  5.68
```

#### The same code works for college

Swap `wnba` for `wbb` and use a college season label. The tables are
larger: Division I has more than 360 teams and plays several thousand
games a season.

``` r

wbb_team_box <- load_wbb_team_box(seasons = 2026)
wbb_pbp <- load_wbb_pbp(seasons = 2026)
```

#### Live data for a single game

When a game has just finished, the live ESPN wrappers return it straight
from the source. These calls need a network connection, so they are not
run here.

``` r

# Today's WNBA scoreboard
espn_wnba_scoreboard(season = format(Sys.Date(), "%Y%m%d"))

# Play-by-play, team box and player box for one game in a single list
game <- espn_wnba_game_all(game_id = "401736171")
names(game)

# A college team's roster (UConn, ESPN team id 2509)
espn_wbb_team_roster(team_id = 2509, season = 2026)
```

The [ESPN endpoints
article](https://wehoop.sportsdataverse.org/articles/espn-endpoints.md)
is a tour of every ESPN wrapper. The WNBA Stats API wrappers
(`wnba_*()`) take more parameters; the [parameter
descriptions](https://wehoop.sportsdataverse.org/articles/parameter-descriptions.md)
table explains each one.

### Glossary

These terms appear throughout the `wehoop` articles. Formulas use box
score abbreviations: FGA field goal attempts, FGM makes, 3PM
three-pointers made, FTA free throw attempts, OREB and DREB offensive
and defensive rebounds, TOV turnovers.

**Possession.** One team’s turn with the ball, which ends with a made
shot, a defensive rebound, a turnover or the end of a period. An
offensive rebound continues the same possession. Estimated from a box
score as `FGA - OREB + TOV + 0.44 * FTA`; the 0.44 accounts for free
throws that come in pairs and those that do not end a possession.
Play-by-play lets you count possessions directly, as
[`load_wnba_stats_possessions()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_coaches.md)
and
[`load_ncaa_wbb_possessions()`](https://wehoop.sportsdataverse.org/reference/load_ncaa_wbb_lineups.md)
do.

**Pace.** Possessions per 40 minutes (both the WNBA and NCAA play
40-minute games). A faster team creates more possessions, which inflates
its per-game totals.

**Offensive rating (ORtg).** Points scored per 100 possessions.
**Defensive rating (DRtg)** is points allowed per 100 possessions, and
**net rating** is ORtg minus DRtg.

**Effective field goal percentage (eFG%).** `(FGM + 0.5 * 3PM) / FGA`.
Gives a three-pointer 1.5 times the credit of a two.

**True shooting percentage (TS%).** `PTS / (2 * (FGA + 0.44 * FTA))`.
Shooting efficiency including free throws.

**Usage rate.** The share of a team’s possessions a player uses (by
shooting, getting to the line, or turning it over) while she is on the
court.

**Four factors.** Dean Oliver’s four drivers of winning: shooting
(eFG%), turnovers (TOV%), offensive rebounding (OREB%) and getting to
the free throw line (FT rate, `FTA / FGA` or `FTM / FGA`). Each is
measured for a team’s offense and its defense.

**Plus/minus.** The point differential while a player is on the court.
The `plus_minus` column in
[`load_wnba_player_box()`](https://wehoop.sportsdataverse.org/reference/load_wnba_draft.md)
is per game.

**Stint.** A stretch of game time in which the same ten players are on
the court. A substitution ends a stint.
[`load_ncaa_wbb_matchup_stints()`](https://wehoop.sportsdataverse.org/reference/load_ncaa_wbb_lineups.md)
publishes them for college.

**Lineup.** The five players one team has on the court.
[`load_wnba_stats_lineups()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_coaches.md)
and
[`load_ncaa_wbb_lineups()`](https://wehoop.sportsdataverse.org/reference/load_ncaa_wbb_lineups.md)
summarise lineup performance.

**RAPM (regularized adjusted plus-minus).** A regression that estimates
each player’s effect on points per 100 possessions while holding the
other nine players fixed. Ridge regularization pulls players with little
playing time toward zero. See the [WNBA player
impact](https://wehoop.sportsdataverse.org/articles/wnba-player-impact-model.md)
and [women’s college
RAPM](https://wehoop.sportsdataverse.org/articles/womens-college-basketball-rapm-model.md)
model articles.

**Box plus/minus (BPM).** An estimate of a player’s impact per 100
possessions from box score statistics alone. See the [player value
model](https://wehoop.sportsdataverse.org/articles/womens-college-basketball-player-value-model.md).

**Win probability (WP).** The chance a team wins from a given game state
(score, time, possession). See the [win probability
model](https://wehoop.sportsdataverse.org/articles/womens-college-basketball-win-probability-model.md).

### Where to go next

**Recipes and tours**

- [WNBA
  Cookbook](https://wehoop.sportsdataverse.org/articles/wnba-cookbook.md)
  and [WBB
  Cookbook](https://wehoop.sportsdataverse.org/articles/wbb-cookbook.md):
  short recipes for common questions, league by league.
- [ESPN
  Endpoints](https://wehoop.sportsdataverse.org/articles/espn-endpoints.md):
  every ESPN wrapper, grouped by task.
- [Parameter
  Descriptions](https://wehoop.sportsdataverse.org/articles/parameter-descriptions.md):
  the WNBA Stats API query parameters.

**Analysis**

- [Shot
  charts](https://wehoop.sportsdataverse.org/articles/wnba-womens-college-basketball-shot-charts.md):
  plot shots on a court, compare makes and misses, and compute field
  goal percentage by zone.
- [Advanced
  metrics](https://wehoop.sportsdataverse.org/articles/womens-basketball-advanced-metrics.md):
  possessions, pace, ratings, the four factors, true shooting and usage,
  with every formula shown.
- [International women’s
  basketball](https://wehoop.sportsdataverse.org/articles/womens-international-basketball-leagues.md):
  which league and competition each international family covers.

**Models**

- [WNBA player
  impact](https://wehoop.sportsdataverse.org/articles/wnba-player-impact-model.md):
  RAPM, SPM, BPM, WAR and a DARKO-style projection for every WNBA
  player-season.
- [Women’s college
  RAPM](https://wehoop.sportsdataverse.org/articles/womens-college-basketball-rapm-model.md):
  league-wide and within-team RAPM for Division I, plus fitting your own
  RAPM with
  [`wnba_rapm()`](https://wehoop.sportsdataverse.org/reference/wnba_rapm.md).
- [Women’s college team
  ratings](https://wehoop.sportsdataverse.org/articles/womens-college-basketball-team-ratings-model.md):
  opponent-adjusted offensive and defensive efficiency.
- [Women’s college player
  value](https://wehoop.sportsdataverse.org/articles/womens-college-basketball-player-value-model.md):
  box plus/minus.
- [Women’s college win
  probability](https://wehoop.sportsdataverse.org/articles/womens-college-basketball-win-probability-model.md):
  the in-game win probability columns in the play-by-play.

**Reference**

- The [function
  reference](https://wehoop.sportsdataverse.org/reference/index.md),
  grouped by data family.
- [`hoopR`](https://hoopR.sportsdataverse.org/), the men’s basketball
  sister package, shares the same function grammar and column
  conventions.

If you build something with `wehoop`, share it: tag
[@saiemgilani](https://x.com/saiemgilani) on X or open a discussion on
[GitHub](https://github.com/sportsdataverse/wehoop/discussions).

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
- [**sdvplotR**](https://sdvplotR.sportsdataverse.org/) - team colors,
  logos and surfaces
- [**sportsdataverse-py**](https://py.sportsdataverse.org/) - the Python
  package
- [**sportsdataverse-R**](https://r.sportsdataverse.org/) - the R
  meta-package
