# wehoop

- [wehoop](#wehoop-) [![wehoop
  logo](https://raw.githubusercontent.com/sportsdataverse/wehoop/main/logo.png)](https://wehoop.sportsdataverse.org)
  - [**Data status**](#data-status)
  - [**Installation**](#installation)
  - [**Quick Start**](#quick-start)
  - [**Documentation**](#documentation)
  - [**Breaking Changes**](#breaking-changes)
  - [Follow the SportsDataverse (@SportsDataverse) on X and star this
    repo](#follow-the-sportsdataverse-sportsdataverse-on-x-and-star-this-repo)
- [**Our Authors**](#our-authors)
  - [**Citations**](#citations)

`wehoop` is an R package for working with women’s college and
professional basketball data. The package has functions to access **live
play by play and box score** data from ESPN with shot locations when
available.

A scraping and aggregating interface for ESPN’s women’s college
basketball and WNBA statistics. It provides users with the capability to
access the API’s game play-by-plays, box scores, standings and results
to analyze the data for themselves.

## **Data status**

The `load_*()` functions read release assets on
[sportsdataverse-data](https://github.com/sportsdataverse/sportsdataverse-data/releases).
The badges below are rebuilt nightly from each producer’s latest
workflow run and newest release files; idle means the sport is out of
season. Full detail:
[sportsdataverse.org/status](https://sportsdataverse.org/status).

| Dataset | Data updated | Through | Pipeline | Update workflows |
|:---|:---|:---|:---|:---|
| [Women’s college basketball (ESPN)](https://github.com/sportsdataverse/wehoop-wbb-data) | [![wehoop-wbb-data data updated](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fsportsdataverse%2F.github%2Fmain%2Fstatus%2Fbadges%2Fwehoop-wbb-data%2Fupdated.json)](https://github.com/sportsdataverse/sportsdataverse-data/releases) | [![wehoop-wbb-data through season](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fsportsdataverse%2F.github%2Fmain%2Fstatus%2Fbadges%2Fwehoop-wbb-data%2Fthrough.json)](https://github.com/sportsdataverse/sportsdataverse-data/releases) | [![wehoop-wbb-data pipeline state](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fsportsdataverse%2F.github%2Fmain%2Fstatus%2Fbadges%2Fwehoop-wbb-data%2Fstatus.json)](https://sportsdataverse.org/status#wehoop-wbb-data) | [![wehoop-wbb-data daily_wbb](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fsportsdataverse%2F.github%2Fmain%2Fstatus%2Fbadges%2Fwehoop-wbb-data%2Fwf-daily_wbb.json)](https://github.com/sportsdataverse/wehoop-wbb-data/actions/workflows/daily_wbb.yml) [![wehoop-wbb-data weekly_wbb](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fsportsdataverse%2F.github%2Fmain%2Fstatus%2Fbadges%2Fwehoop-wbb-data%2Fwf-weekly_wbb.json)](https://github.com/sportsdataverse/wehoop-wbb-data/actions/workflows/weekly_wbb.yml) [![wehoop-wbb-data wbb_models_cron](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fsportsdataverse%2F.github%2Fmain%2Fstatus%2Fbadges%2Fwehoop-wbb-data%2Fwf-wbb_models_cron.json)](https://github.com/sportsdataverse/wehoop-wbb-data/actions/workflows/wbb_models_cron.yml) |
| [Women’s college basketball (stats.ncaa.org)](https://github.com/sportsdataverse/ncaa-wbb-hoops-data) | [![ncaa-wbb-hoops-data data updated](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fsportsdataverse%2F.github%2Fmain%2Fstatus%2Fbadges%2Fncaa-wbb-hoops-data%2Fupdated.json)](https://github.com/sportsdataverse/sportsdataverse-data/releases) | [![ncaa-wbb-hoops-data through season](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fsportsdataverse%2F.github%2Fmain%2Fstatus%2Fbadges%2Fncaa-wbb-hoops-data%2Fthrough.json)](https://github.com/sportsdataverse/sportsdataverse-data/releases) | [![ncaa-wbb-hoops-data pipeline state](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fsportsdataverse%2F.github%2Fmain%2Fstatus%2Fbadges%2Fncaa-wbb-hoops-data%2Fstatus.json)](https://sportsdataverse.org/status#ncaa-wbb-hoops-data) | [![ncaa-wbb-hoops-data ncaa_wbb_models](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fsportsdataverse%2F.github%2Fmain%2Fstatus%2Fbadges%2Fncaa-wbb-hoops-data%2Fwf-ncaa_wbb_models.json)](https://github.com/sportsdataverse/ncaa-wbb-hoops-data/actions/workflows/ncaa_wbb_models.yml) |
| [WNBA (ESPN)](https://github.com/sportsdataverse/wehoop-wnba-data) | [![wehoop-wnba-data data updated](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fsportsdataverse%2F.github%2Fmain%2Fstatus%2Fbadges%2Fwehoop-wnba-data%2Fupdated.json)](https://github.com/sportsdataverse/sportsdataverse-data/releases) | [![wehoop-wnba-data through season](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fsportsdataverse%2F.github%2Fmain%2Fstatus%2Fbadges%2Fwehoop-wnba-data%2Fthrough.json)](https://github.com/sportsdataverse/sportsdataverse-data/releases) | [![wehoop-wnba-data pipeline state](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fsportsdataverse%2F.github%2Fmain%2Fstatus%2Fbadges%2Fwehoop-wnba-data%2Fstatus.json)](https://sportsdataverse.org/status#wehoop-wnba-data) | [![wehoop-wnba-data daily_wnba](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fsportsdataverse%2F.github%2Fmain%2Fstatus%2Fbadges%2Fwehoop-wnba-data%2Fwf-daily_wnba.json)](https://github.com/sportsdataverse/wehoop-wnba-data/actions/workflows/daily_wnba.yml) [![wehoop-wnba-data weekly_wnba](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fsportsdataverse%2F.github%2Fmain%2Fstatus%2Fbadges%2Fwehoop-wnba-data%2Fwf-weekly_wnba.json)](https://github.com/sportsdataverse/wehoop-wnba-data/actions/workflows/weekly_wnba.yml) [![wehoop-wnba-data annual_wnba_draft](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fsportsdataverse%2F.github%2Fmain%2Fstatus%2Fbadges%2Fwehoop-wnba-data%2Fwf-annual_wnba_draft.json)](https://github.com/sportsdataverse/wehoop-wnba-data/actions/workflows/annual_wnba_draft.yml) |
| [WNBA Stats API](https://github.com/sportsdataverse/wehoop-wnba-stats-data) | [![wehoop-wnba-stats-data data updated](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fsportsdataverse%2F.github%2Fmain%2Fstatus%2Fbadges%2Fwehoop-wnba-stats-data%2Fupdated.json)](https://github.com/sportsdataverse/sportsdataverse-data/releases) | [![wehoop-wnba-stats-data through season](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fsportsdataverse%2F.github%2Fmain%2Fstatus%2Fbadges%2Fwehoop-wnba-stats-data%2Fthrough.json)](https://github.com/sportsdataverse/sportsdataverse-data/releases) | [![wehoop-wnba-stats-data pipeline state](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fsportsdataverse%2F.github%2Fmain%2Fstatus%2Fbadges%2Fwehoop-wnba-stats-data%2Fstatus.json)](https://sportsdataverse.org/status#wehoop-wnba-stats-data) | [![wehoop-wnba-stats-data daily_wnba_stats](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fsportsdataverse%2F.github%2Fmain%2Fstatus%2Fbadges%2Fwehoop-wnba-stats-data%2Fwf-daily_wnba_stats.json)](https://github.com/sportsdataverse/wehoop-wnba-stats-data/actions/workflows/daily_wnba_stats.yml) [![wehoop-wnba-stats-data wnba_models](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fsportsdataverse%2F.github%2Fmain%2Fstatus%2Fbadges%2Fwehoop-wnba-stats-data%2Fwf-wnba_models.json)](https://github.com/sportsdataverse/wehoop-wnba-stats-data/actions/workflows/wnba_models.yml) [![wehoop-wnba-stats-data annual_wnba_stats_draft](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fsportsdataverse%2F.github%2Fmain%2Fstatus%2Fbadges%2Fwehoop-wnba-stats-data%2Fwf-annual_wnba_stats_draft.json)](https://github.com/sportsdataverse/wehoop-wnba-stats-data/actions/workflows/annual_wnba_stats_draft.yml) |
| [Conference, division and ballpark reference](https://github.com/sportsdataverse/sdv-reference-data) | [![sdv-reference-data data updated](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fsportsdataverse%2F.github%2Fmain%2Fstatus%2Fbadges%2Fsdv-reference-data%2Fupdated.json)](https://github.com/sportsdataverse/sportsdataverse-data/releases) | [![sdv-reference-data through season](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fsportsdataverse%2F.github%2Fmain%2Fstatus%2Fbadges%2Fsdv-reference-data%2Fthrough.json)](https://github.com/sportsdataverse/sportsdataverse-data/releases) | [![sdv-reference-data pipeline state](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fsportsdataverse%2F.github%2Fmain%2Fstatus%2Fbadges%2Fsdv-reference-data%2Fstatus.json)](https://sportsdataverse.org/status#sdv-reference-data) | — |

## **Installation**

You can install the CRAN version of
[**`wehoop`**](https://CRAN.R-project.org/package=wehoop) with:

``` r

install.packages("wehoop")
```

This documentation describes **wehoop 3.0.0**. If the CRAN release
hasn’t caught up yet, install the GitHub development version instead:

``` r

# You can install using the pak package using the following code:
if (!requireNamespace('pak', quietly = TRUE)){
  install.packages('pak')
}
pak::pak("sportsdataverse/wehoop")
```

## **Quick Start**

### **WNBA full play-by-play seasons (2002-2026) ~ 1-2 minutes**

``` r

tictoc::tic()
progressr::with_progress({
  wnba_pbp <- wehoop::load_wnba_pbp()
})
```

``` R
## Warning in readRDS(con): cannot open URL
## 'https://github.com/sportsdataverse/sportsdataverse-data/releases/download/espn_wnba_pbp/play_by_play_2026.rds':
## HTTP status was '404 Not Found'

## Warning: Failed to readRDS from
## <https://github.com/sportsdataverse/sportsdataverse-data/releases/download/espn_wnba_pbp/play_by_play_2026.rds>
```

``` r

tictoc::toc()
```

``` R
## 0.3 sec elapsed

## Warning: Unknown or uninitialised column: `game_id`.

## 0 rows of WNBA play-by-play data from 0 games.
```

### **Women’s college basketball full play-by-play seasons (2004-2026) ~ 2-3 minutes**

``` r

tictoc::tic()
progressr::with_progress({
  wbb_pbp <- wehoop::load_wbb_pbp()
})
tictoc::toc()
```

``` R
## 10.58 sec elapsed

## 2824090 rows of women's college basketball play-by-play data from 6011 games.
```

## **Documentation**

For more information on the package and function reference, please see
the [**`wehoop`** documentation
website](https://wehoop.sportsdataverse.org).

There is also a printable [**`wehoop` cheat sheet
(PDF)**](https://sportsdataverse.org/cheatsheets/wehoop.pdf), one of [a
set covering every SportsDataverse
package](https://sportsdataverse.org/cheatsheets).

`wehoop` 3.0.0 ships **180 ESPN basketball endpoint wrappers** (88
`espn_wbb_*` + 92 `espn_wnba_*`) covering reference and catalog data,
team detail, athlete coverage, event-level enrichments (odds, win
probability, officials, broadcasts), WNBA-only artifacts (draft, free
agents, transactions), and league-wide catalogs. See the [ESPN
basketball endpoints
vignette](https://wehoop.sportsdataverse.org/articles/espn-endpoints.html)
for a full walkthrough.

Beyond the live ESPN scrapers, `wehoop` ships **90 `load_*()`
release-dataset loaders** that pull pre-built season parquet/rds instead
of hitting the source APIs: `load_wnba_*` / `load_wbb_*` (ESPN-backed
pbp, box scores, rosters, standings, crosswalks), `load_wnba_stats_*`
(WNBA Stats API, including
[`load_wnba_stats_possessions()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_coaches.md)),
and the **`load_ncaa_wbb_*` family** (`pbp`, `shots`, `lineups`,
`matchup_stints`, `possessions`, `rapm_within_team`, `rapm`
(league-wide), `player_box`, `team_box`, `rosters`, `team_rosters`,
`schedule`, `team_ids`; seasons 2010-2026, `shots` 2019-2026, `rapm`
2011-2026) backed by the sportsdataverse-py NCAA engine. Model-dataset
loaders round out the surface:
[`load_wnba_player_impact()`](https://wehoop.sportsdataverse.org/reference/load_wbb_player_value.md),
[`load_wbb_player_value()`](https://wehoop.sportsdataverse.org/reference/load_wbb_player_value.md),
and
[`load_wbb_ratings()`](https://wehoop.sportsdataverse.org/reference/load_wbb_player_value.md).

## **Breaking Changes**

[**Full News on
Releases**](https://wehoop.sportsdataverse.org/news/index.html)

## Follow the SportsDataverse (@SportsDataverse) on X and star this repo

[![X
Follow](https://img.shields.io/twitter/follow/SportsDataverse?style=for-the-badge&logo=x&label=%40SportsDataverse)](https://x.com/SportsDataverse)

[![GitHub
stars](https://img.shields.io/github/stars/sportsdataverse/wehoop.svg?color=eee&logo=github&style=for-the-badge&label=Star%20wehoop&maxAge=2592000)](https://github.com/sportsdataverse/wehoop)

# **Our Authors**

- [Saiem Gilani](https://x.com/saiemgilani)

[![@SaiemGilani](https://img.shields.io/twitter/follow/SaiemGilani?style=for-the-badge&logo=x&label=%40SaiemGilani)](https://x.com/saiemgilani)
[![@saiemgilani](https://img.shields.io/github/followers/saiemgilani?color=eee&logo=Github&style=for-the-badge)](https://github.com/saiemgilani)

- [Geoff Hutchinson - RIP](https://x.com/hutchngo)

[![@HutchNGo](https://img.shields.io/twitter/follow/HutchNGo?label=%40hutchngo&logo=x&style=for-the-badge)](https://x.com/HutchNGo)
[![@hutchngo](https://img.shields.io/github/followers/hutchngo?color=eee&logo=Github&style=for-the-badge)](https://github.com/hutchngo)

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

BibTex Citation

``` bibtex
@misc{hutchinson_gilani_2021_wehoop,
  title = {wehoop: Access Women’s Basketball Play by Play Data},
  url = {https://doi.org/10.32614/CRAN.package.wehoop},
  doi = {10.32614/CRAN.package.wehoop},
  journal = {CRAN: Contributed Packages},
  publisher = {The R Foundation},
  author = {Gilani,  Saiem and Hutchinson,  Geoffery},
  year = {2026},
  month = nov
}
```
