
  - [wehoop
    <a href='https://wehoop.sportsdataverse.org'><img src="https://raw.githubusercontent.com/sportsdataverse/wehoop/main/logo.png" align="right"  width="20%" min-width="100px" alt="wehoop logo"/></a>](#wehoop-)
      - [**Data status**](#data-status)
      - [**Installation**](#installation)
      - [**Quick Start**](#quick-start)
      - [**What’s in wehoop**](#whats-in-wehoop)
      - [**Bulk datasets**](#bulk-datasets)
      - [**Plotting and related
        packages**](#plotting-and-related-packages)
      - [**Documentation**](#documentation)
      - [**Breaking Changes**](#breaking-changes)
      - [Follow the SportsDataverse (@SportsDataverse) on X and star
        this
        repo](#follow-the-sportsdataverse-sportsdataverse-on-x-and-star-this-repo)
  - [**Our Authors**](#our-authors)
      - [**Cheat sheet**](#cheat-sheet)
      - [**Citations**](#citations)

# wehoop <a href='https://wehoop.sportsdataverse.org'><img src="https://raw.githubusercontent.com/sportsdataverse/wehoop/main/logo.png" align="right"  width="20%" min-width="100px" alt="wehoop logo"/></a>

<!-- badges: start -->

[![CRAN
status](https://img.shields.io/badge/dynamic/json?style=for-the-badge&color=success&label=CRAN%20version&prefix=v&query=%24.Version&url=https%3A%2F%2Fcrandb.r-pkg.org%2Fwehoop)](https://CRAN.R-project.org/package=wehoop)
[![CRAN
downloads](https://img.shields.io/badge/dynamic/json?style=for-the-badge&color=success&label=Downloads&query=%24%5B0%5D.downloads&url=https%3A%2F%2Fcranlogs.r-pkg.org%2Fdownloads%2Ftotal%2F2021-10-26%3Alast-day%2Fwehoop)](https://CRAN.R-project.org/package=wehoop)
[![Version-Number](https://img.shields.io/github/r-package/v/sportsdataverse/wehoop?label=wehoop&logo=R&style=for-the-badge)](https://github.com/sportsdataverse/wehoop)
[![R-CMD-check](https://img.shields.io/github/actions/workflow/status/sportsdataverse/wehoop/R-CMD-check.yaml?branch=main&label=R-CMD-Check&logo=R&logoColor=white&style=for-the-badge)](https://github.com/sportsdataverse/wehoop/actions/workflows/R-CMD-check.yaml)
[![Lifecycle:stable](https://img.shields.io/badge/lifecycle-stable-brightgreen.svg?style=for-the-badge&logo=github)](https://lifecycle.r-lib.org/articles/stages.html#stable)
[![X
Follow](https://img.shields.io/twitter/follow/SaiemGilani?label=%40SaiemGilani&logo=x&style=for-the-badge)](https://x.com/SaiemGilani)
[![X
Follow](https://img.shields.io/twitter/follow/hutchngo?label=%40hutchngo&logo=x&style=for-the-badge)](https://x.com/hutchngo)
[![X
Follow](https://img.shields.io/twitter/follow/sportsdataverse?label=%40SportsDataverse&logo=x&style=for-the-badge)](https://x.com/sportsdataverse)

<!-- badges: end -->

[**`wehoop`**](https://wehoop.sportsdataverse.org/) is an R package for
working with women’s college and professional basketball data. It
exports 750 functions: live wrappers for ESPN, the WNBA Stats API, the
NCAA, Fox Sports, Basketball-Reference, Her Hoop Stats, Bart Torvik,
official.nba.com and eight international data providers, plus 98
`load_*()` functions that read pre-built season files (play-by-play, box
scores, rosters, schedules, crosswalks and model outputs) instead of
calling the sources.

## **Data status**

The `load_*()` functions read release assets on
[sportsdataverse-data](https://github.com/sportsdataverse/sportsdataverse-data/releases).
The badges below are rebuilt nightly from each producer’s latest
workflow run and newest release files; idle means the sport is out of
season. Full detail:
[sportsdataverse.org/status](https://sportsdataverse.org/status).

| Dataset                                                                                               | Data updated                                                                                                                                                                                                                                                                         | Through                                                                                                                                                                                                                                                                                | Pipeline                                                                                                                                                                                                                                                                       | Update workflows                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
| :---------------------------------------------------------------------------------------------------- | :----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [Women’s college basketball (ESPN)](https://github.com/sportsdataverse/wehoop-wbb-data)               | [![wehoop-wbb-data data updated](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fsportsdataverse%2F.github%2Fmain%2Fstatus%2Fbadges%2Fwehoop-wbb-data%2Fupdated.json)](https://github.com/sportsdataverse/sportsdataverse-data/releases)               | [![wehoop-wbb-data through season](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fsportsdataverse%2F.github%2Fmain%2Fstatus%2Fbadges%2Fwehoop-wbb-data%2Fthrough.json)](https://github.com/sportsdataverse/sportsdataverse-data/releases)               | [![wehoop-wbb-data pipeline state](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fsportsdataverse%2F.github%2Fmain%2Fstatus%2Fbadges%2Fwehoop-wbb-data%2Fstatus.json)](https://sportsdataverse.org/status#wehoop-wbb-data)                      | [![wehoop-wbb-data daily\_wbb](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fsportsdataverse%2F.github%2Fmain%2Fstatus%2Fbadges%2Fwehoop-wbb-data%2Fwf-daily_wbb.json)](https://github.com/sportsdataverse/wehoop-wbb-data/actions/workflows/daily_wbb.yml) [![wehoop-wbb-data weekly\_wbb](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fsportsdataverse%2F.github%2Fmain%2Fstatus%2Fbadges%2Fwehoop-wbb-data%2Fwf-weekly_wbb.json)](https://github.com/sportsdataverse/wehoop-wbb-data/actions/workflows/weekly_wbb.yml) [![wehoop-wbb-data wbb\_models\_cron](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fsportsdataverse%2F.github%2Fmain%2Fstatus%2Fbadges%2Fwehoop-wbb-data%2Fwf-wbb_models_cron.json)](https://github.com/sportsdataverse/wehoop-wbb-data/actions/workflows/wbb_models_cron.yml)                                                                                                                  |
| [Women’s college basketball (stats.ncaa.org)](https://github.com/sportsdataverse/ncaa-wbb-hoops-data) | [![ncaa-wbb-hoops-data data updated](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fsportsdataverse%2F.github%2Fmain%2Fstatus%2Fbadges%2Fncaa-wbb-hoops-data%2Fupdated.json)](https://github.com/sportsdataverse/sportsdataverse-data/releases)       | [![ncaa-wbb-hoops-data through season](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fsportsdataverse%2F.github%2Fmain%2Fstatus%2Fbadges%2Fncaa-wbb-hoops-data%2Fthrough.json)](https://github.com/sportsdataverse/sportsdataverse-data/releases)       | [![ncaa-wbb-hoops-data pipeline state](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fsportsdataverse%2F.github%2Fmain%2Fstatus%2Fbadges%2Fncaa-wbb-hoops-data%2Fstatus.json)](https://sportsdataverse.org/status#ncaa-wbb-hoops-data)          | [![ncaa-wbb-hoops-data ncaa\_wbb\_models](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fsportsdataverse%2F.github%2Fmain%2Fstatus%2Fbadges%2Fncaa-wbb-hoops-data%2Fwf-ncaa_wbb_models.json)](https://github.com/sportsdataverse/ncaa-wbb-hoops-data/actions/workflows/ncaa_wbb_models.yml)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
| [WNBA (ESPN)](https://github.com/sportsdataverse/wehoop-wnba-data)                                    | [![wehoop-wnba-data data updated](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fsportsdataverse%2F.github%2Fmain%2Fstatus%2Fbadges%2Fwehoop-wnba-data%2Fupdated.json)](https://github.com/sportsdataverse/sportsdataverse-data/releases)             | [![wehoop-wnba-data through season](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fsportsdataverse%2F.github%2Fmain%2Fstatus%2Fbadges%2Fwehoop-wnba-data%2Fthrough.json)](https://github.com/sportsdataverse/sportsdataverse-data/releases)             | [![wehoop-wnba-data pipeline state](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fsportsdataverse%2F.github%2Fmain%2Fstatus%2Fbadges%2Fwehoop-wnba-data%2Fstatus.json)](https://sportsdataverse.org/status#wehoop-wnba-data)                   | [![wehoop-wnba-data daily\_wnba](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fsportsdataverse%2F.github%2Fmain%2Fstatus%2Fbadges%2Fwehoop-wnba-data%2Fwf-daily_wnba.json)](https://github.com/sportsdataverse/wehoop-wnba-data/actions/workflows/daily_wnba.yml) [![wehoop-wnba-data weekly\_wnba](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fsportsdataverse%2F.github%2Fmain%2Fstatus%2Fbadges%2Fwehoop-wnba-data%2Fwf-weekly_wnba.json)](https://github.com/sportsdataverse/wehoop-wnba-data/actions/workflows/weekly_wnba.yml) [![wehoop-wnba-data annual\_wnba\_draft](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fsportsdataverse%2F.github%2Fmain%2Fstatus%2Fbadges%2Fwehoop-wnba-data%2Fwf-annual_wnba_draft.json)](https://github.com/sportsdataverse/wehoop-wnba-data/actions/workflows/annual_wnba_draft.yml)                                                                                             |
| [WNBA Stats API](https://github.com/sportsdataverse/wehoop-wnba-stats-data)                           | [![wehoop-wnba-stats-data data updated](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fsportsdataverse%2F.github%2Fmain%2Fstatus%2Fbadges%2Fwehoop-wnba-stats-data%2Fupdated.json)](https://github.com/sportsdataverse/sportsdataverse-data/releases) | [![wehoop-wnba-stats-data through season](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fsportsdataverse%2F.github%2Fmain%2Fstatus%2Fbadges%2Fwehoop-wnba-stats-data%2Fthrough.json)](https://github.com/sportsdataverse/sportsdataverse-data/releases) | [![wehoop-wnba-stats-data pipeline state](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fsportsdataverse%2F.github%2Fmain%2Fstatus%2Fbadges%2Fwehoop-wnba-stats-data%2Fstatus.json)](https://sportsdataverse.org/status#wehoop-wnba-stats-data) | [![wehoop-wnba-stats-data daily\_wnba\_stats](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fsportsdataverse%2F.github%2Fmain%2Fstatus%2Fbadges%2Fwehoop-wnba-stats-data%2Fwf-daily_wnba_stats.json)](https://github.com/sportsdataverse/wehoop-wnba-stats-data/actions/workflows/daily_wnba_stats.yml) [![wehoop-wnba-stats-data wnba\_models](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fsportsdataverse%2F.github%2Fmain%2Fstatus%2Fbadges%2Fwehoop-wnba-stats-data%2Fwf-wnba_models.json)](https://github.com/sportsdataverse/wehoop-wnba-stats-data/actions/workflows/wnba_models.yml) [![wehoop-wnba-stats-data annual\_wnba\_stats\_draft](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fsportsdataverse%2F.github%2Fmain%2Fstatus%2Fbadges%2Fwehoop-wnba-stats-data%2Fwf-annual_wnba_stats_draft.json)](https://github.com/sportsdataverse/wehoop-wnba-stats-data/actions/workflows/annual_wnba_stats_draft.yml) |
| [Conference, division and ballpark reference](https://github.com/sportsdataverse/sdv-reference-data)  | [![sdv-reference-data data updated](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fsportsdataverse%2F.github%2Fmain%2Fstatus%2Fbadges%2Fsdv-reference-data%2Fupdated.json)](https://github.com/sportsdataverse/sportsdataverse-data/releases)         | [![sdv-reference-data through season](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fsportsdataverse%2F.github%2Fmain%2Fstatus%2Fbadges%2Fsdv-reference-data%2Fthrough.json)](https://github.com/sportsdataverse/sportsdataverse-data/releases)         | [![sdv-reference-data pipeline state](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fsportsdataverse%2F.github%2Fmain%2Fstatus%2Fbadges%2Fsdv-reference-data%2Fstatus.json)](https://sportsdataverse.org/status#sdv-reference-data)             | —                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |

## **Installation**

You can install the CRAN version of
[**`wehoop`**](https://CRAN.R-project.org/package=wehoop) with:

``` r
install.packages("wehoop")
```

This documentation describes **wehoop 3.1.0**. If the CRAN release
hasn’t caught up yet, install the development version from
[GitHub](https://github.com/sportsdataverse/wehoop) instead:

``` r
# You can install using the pak package using the following code:
if (!requireNamespace('pak', quietly = TRUE)){
  install.packages('pak')
}
pak::pak("sportsdataverse/wehoop")
```

## **Quick Start**

### **WNBA play-by-play for a season**

`load_wnba_pbp()` covers 2002-2026; pass several seasons (or `seasons =
TRUE` for all of them) to load more at once.

``` r
wnba_pbp <- wehoop::load_wnba_pbp(seasons = 2026)
```

    ## 144409 rows of WNBA play-by-play data from 354 games.

### **Women’s college basketball play-by-play for a season**

`load_wbb_pbp()` covers 2004 onward. A new season’s file is published
once its games begin.

``` r
wbb_pbp <- wehoop::load_wbb_pbp(seasons = 2026)
```

    ## 2824090 rows of women's college basketball play-by-play data from 6011 games.

## **What’s in wehoop**

Each family links to its section of the [function
reference](https://wehoop.sportsdataverse.org/reference/index.html).

  - **ESPN** ([`espn_wnba_*`,
    `espn_wbb_*`](https://wehoop.sportsdataverse.org/reference/index.html#espn-data)):
    180 wrappers (88 women’s college + 92 WNBA) for play-by-play, box
    scores, schedules, standings, teams, athletes, odds, win
    probability, the draft and transactions. The [ESPN endpoints
    article](https://wehoop.sportsdataverse.org/articles/espn-endpoints.html)
    walks through them.
  - **WNBA Stats API**
    ([`wnba_*`](https://wehoop.sportsdataverse.org/reference/index.html#wnba-stats-data-functions)):
    stats.wnba.com box scores, play-by-play, league dashboards, player
    and team splits, shot charts and lineups.
  - **WNBA officiating**
    ([`wnba_referee_assignments()`](https://wehoop.sportsdataverse.org/reference/index.html#wnba-officiating-functions)):
    official.nba.com’s daily referee assignments.
  - **NCAA**
    ([`ncaa_wbb_*`](https://wehoop.sportsdataverse.org/reference/index.html#ncaa-data)):
    NCAA team lists and NET rankings.
  - **Fox Sports** ([`fox_wnba_*`,
    `fox_wbb_*`](https://wehoop.sportsdataverse.org/reference/index.html#fox-sports-data-functions)):
    play-by-play, box scores, odds, rosters, standings and leaders.
  - **Basketball-Reference**
    ([`bref_wnba_*`](https://wehoop.sportsdataverse.org/reference/index.html#wnba-basketball-reference-functions)):
    WNBA player stats, team stats and standings.
  - **Her Hoop Stats**
    ([`hhs_*`](https://wehoop.sportsdataverse.org/reference/index.html#her-hoop-stats-functions)):
    NCAA women’s team indexes, team stats and rosters, for subscribers.
  - **Bart Torvik**
    ([`bart_wbb_*`](https://wehoop.sportsdataverse.org/reference/index.html#wbb-crosswalk-functions)):
    women’s college team ratings and game schedules.
  - **Crosswalks**
    ([WNBA](https://wehoop.sportsdataverse.org/reference/index.html#wnba-crosswalk-functions),
    [WBB](https://wehoop.sportsdataverse.org/reference/index.html#wbb-crosswalk-functions)):
    team, player and game ids matched across ESPN, WNBA Stats, Fox and
    Torvik, built live (`wnba_*_crosswalk()`, `wbb_*_crosswalk()`) or
    loaded pre-built (`load_*_crosswalk()`).
  - **International**
    ([reference](https://wehoop.sportsdataverse.org/reference/index.html#international-basketball)):
    FIBA (`fiba_*`), Genius Sports (`genius_*`), Sportradar Atrium
    (`atrium_*`), NBL / WNBL (`nbl_*`), SCB / DBBL (`scb_*`), FEB
    (`feb_*`), TBF (`tbf_*`) and the W League (`wjbl_*`), plus
    per-competition aliases such as `fiba_wwc_*`, `wbbl_*` and `lfb_*`.
    289 functions in all.
  - **Release loaders**
    ([WNBA](https://wehoop.sportsdataverse.org/reference/index.html#wnba-data-functions),
    [WBB](https://wehoop.sportsdataverse.org/reference/index.html#womens-college-basketball-data-functions),
    [WNBA
    Stats](https://wehoop.sportsdataverse.org/reference/index.html#wnba-stats-api-data-loaders),
    [NCAA
    engine](https://wehoop.sportsdataverse.org/reference/index.html#ncaa-womens-college-basketball-play-by-play-engine-data-loaders),
    [models](https://wehoop.sportsdataverse.org/reference/index.html#model-dataset-loaders),
    [conference
    groups](https://wehoop.sportsdataverse.org/reference/index.html#conference-and-division-group-loaders)):
    see below.

## **Bulk datasets**

The 98 `load_*()` functions read pre-built season files (rds or parquet)
from the
[sportsdataverse-data](https://github.com/sportsdataverse/sportsdataverse-data/releases)
releases instead of calling the source APIs. Each takes `seasons` and
returns a `wehoop_data` tibble; most can also write to a database
through `dbConnection` and `tablename`.

  - **ESPN-backed** (`load_wnba_*`, `load_wbb_*`): play-by-play, player
    and team box scores, schedules, rosters, player and team season
    stats, standings, shots, game rosters, officials, player cores and
    the WNBA draft.
  - **WNBA Stats API** (`load_wnba_stats_*`): play-by-play, schedules,
    rosters, coaches, player game logs, the league dashboard cube
    (`load_wnba_stats_leaguedash()`), draft, shots, game rosters,
    officials and possessions (`load_wnba_stats_possessions()`).
  - **NCAA play-by-play engine** (`load_ncaa_wbb_*`, 13 loaders):
    play-by-play, shots, lineups, matchup stints, possessions, RAPM
    (within-team and league-wide), box scores, rosters, schedules and
    team ids, built by
    [sportsdataverse-py](https://py.sportsdataverse.org/) from
    stats.ncaa.org.
  - **Crosswalks** (`load_wnba_*_crosswalk()`,
    `load_wbb_*_crosswalk()`): the pre-built team, player and schedule
    crosswalks.
  - **Models**: `load_wnba_player_impact()`, `load_wbb_player_value()`
    and `load_wbb_ratings()`.
  - **Conference and division groups**: `load_wnba_groups()`,
    `load_wbb_groups()` and their `_group_seasons()`, `_group_aliases()`
    and `_team_group_seasons()` companions record membership as it was
    each season.

## **Plotting and related packages**

  - [**`sdvplotR`**](https://sdvplotR.sportsdataverse.org/) (0.3.0,
    `pak::pak("sportsdataverse/sdvplotR")`) adds team logos and colours
    to `ggplot2` charts and draws shot charts from the `wehoop` shot
    loaders; see its
    [WNBA](https://sdvplotR.sportsdataverse.org/articles/wnba-viz.html),
    [women’s
    college](https://sdvplotR.sportsdataverse.org/articles/wbb-viz.html)
    and [shot
    chart](https://sdvplotR.sportsdataverse.org/articles/cookbook-surfaces-shot-charts.html)
    articles.
  - [**`sportyR`**](https://sportyR.sportsdataverse.org/) (2.4.5,
    `install.packages("sportyR")`) draws WNBA, NCAA and FIBA courts to
    plot shot locations on.
  - [**`hoopR`**](https://hoopR.sportsdataverse.org/) is the men’s
    basketball companion (NBA and men’s college basketball).
  - [**`sportsdataverse-py`**](https://py.sportsdataverse.org/) is the
    Python package; most `wehoop` functions have a Python twin of the
    same name.

## **Documentation**

For more information on the package and function reference, please see
the [**`wehoop`** documentation
website](https://wehoop.sportsdataverse.org).

There is also a printable [**`wehoop` cheat sheet
(PDF)**](https://sportsdataverse.org/cheatsheets/wehoop.pdf), one of [a
set covering every SportsDataverse
package](https://sportsdataverse.org/cheatsheets).

The [Getting
started](https://wehoop.sportsdataverse.org/articles/getting-started-wehoop.html)
article is the place to begin; the
[WNBA](https://wehoop.sportsdataverse.org/articles/wnba-cookbook.html)
and [women’s
college](https://wehoop.sportsdataverse.org/articles/wbb-cookbook.html)
cookbooks have worked recipes.

## **Breaking Changes**

[**Full News on
Releases**](https://wehoop.sportsdataverse.org/news/index.html)

## Follow the SportsDataverse (@SportsDataverse) on X and star this repo

[![X
Follow](https://img.shields.io/twitter/follow/SportsDataverse?style=for-the-badge&logo=x&label=%40SportsDataverse)](https://x.com/SportsDataverse)

[![GitHub
stars](https://img.shields.io/github/stars/sportsdataverse/wehoop.svg?color=eee&logo=github&style=for-the-badge&label=Star%20wehoop&maxAge=2592000)](https://github.com/sportsdataverse/wehoop)

<a href="https://github.com/sportsdataverse/wehoop"> <picture>
<source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/sportsdataverse/wehoop/star-history/star-history-dark.svg">
<img alt="Star history of sportsdataverse/wehoop" src="https://raw.githubusercontent.com/sportsdataverse/wehoop/star-history/star-history.png" width="600">
</picture> </a>

# **Our Authors**

  - [Saiem Gilani](https://x.com/saiemgilani)

<a href="https://x.com/saiemgilani" target="blank"><img  alt="@SaiemGilani" src="https://img.shields.io/twitter/follow/SaiemGilani?style=for-the-badge&logo=x&label=%40SaiemGilani"></a>
<a href="https://github.com/saiemgilani" target="blank"><img src="https://img.shields.io/github/followers/saiemgilani?color=eee&logo=Github&style=for-the-badge" alt="@saiemgilani" /></a>

  - [Geoff Hutchinson - RIP](https://x.com/hutchngo)

<a href="https://x.com/HutchNGo" target="blank"><img src="https://img.shields.io/twitter/follow/HutchNGo?label=%40hutchngo&logo=x&style=for-the-badge" alt="@HutchNGo" /></a>
<a href="https://github.com/hutchngo" target="blank"><img src="https://img.shields.io/github/followers/hutchngo?color=eee&logo=Github&style=for-the-badge" alt="@hutchngo" /></a>

<!-- cheatsheet-section -->

## **Cheat sheet**

A printable one-page reference for **`wehoop`** — the function families,
the loaders, and what each one returns.

📄 **[Download the wehoop cheat sheet
(PDF)](https://sportsdataverse.org/cheatsheets/wehoop.pdf)**

Free to download, print and hand out; light and dark, US Letter
landscape. Every SportsDataverse package has one — browse them all at
**[sportsdataverse.org/cheatsheets](https://sportsdataverse.org/cheatsheets)**.

## **Citations**

To cite the [**`wehoop`**](https://wehoop.sportsdataverse.org) R package
in publications, use:

BibTeX Citation

``` bibtex
@misc{hutchinson_gilani_2021_wehoop,
  title = {wehoop: Access Women’s Basketball Play by Play Data},
  url = {https://doi.org/10.32614/CRAN.package.wehoop},
  doi = {10.32614/CRAN.package.wehoop},
  journal = {CRAN: Contributed Packages},
  publisher = {The R Foundation},
  author = {Gilani,  Saiem and Hutchinson,  Geoffery},
  year = {2026}
}
```
