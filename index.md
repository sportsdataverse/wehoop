# wehoop

- [wehoop](#wehoop-)
  [![](https://raw.githubusercontent.com/sportsdataverse/wehoop/main/logo.png)](https://wehoop.sportsdataverse.org)
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

## **Installation**

You can install the CRAN version of
[**`wehoop`**](https://CRAN.R-project.org/package=wehoop) with:

``` r

install.packages("wehoop")
```

You can install the released version of
[**`wehoop`**](https://github.com/sportsdataverse/wehoop) from
[GitHub](https://github.com/sportsdataverse/wehoop) with:

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

`wehoop` 3.0.0 ships **80 ESPN basketball endpoint wrappers** (39
`espn_wbb_*` + 41 `espn_wnba_*`) covering reference and catalog data,
team detail, athlete coverage, event-level enrichments (odds, win
probability, officials, broadcasts), WNBA-only artifacts (draft, free
agents, transactions), and league-wide catalogs. See the [ESPN
basketball endpoints
vignette](https://wehoop.sportsdataverse.org/articles/espn-endpoints.html)
for a full walkthrough.

## **Breaking Changes**

[**Full News on
Releases**](https://wehoop.sportsdataverse.org/news/index.html)

## Follow the SportsDataverse (@SportsDataverse) on X and star this repo

[![X
Follow](https://img.shields.io/twitter/follow/SportsDataverse?style=for-the-badge&logo=x&label=%40SportsDataverse)](https://x.com/SportsDataverse)

[![GitHub
stars](https://img.shields.io/github/stars/sportsdataverse/wehoop.svg?color=eee&logo=github&style=for-the-badge&label=Star%20wehoop&maxAge=2592000)](https://github.com/sportsdataverse/wehoop/stargazers/)

# **Our Authors**

- [Saiem Gilani](https://x.com/saiemgilani)

[![@SaiemGilani](https://img.shields.io/twitter/follow/SaiemGilani?style=for-the-badge&logo=x&label=%40SaiemGilani)](https://x.com/saiemgilani)
[![@saiemgilani](https://img.shields.io/github/followers/saiemgilani?color=eee&logo=Github&style=for-the-badge)](https://github.com/saiemgilani)

- [Geoff Hutchinson - RIP](https://x.com/hutchngo)

[![@HutchNGo](https://img.shields.io/twitter/follow/HutchNGo?label=%40hutchngo&logo=x&style=for-the-badge)](https://x.com/HutchNGo)
[![@hutchngo](https://img.shields.io/github/followers/hutchngo?color=eee&logo=Github&style=for-the-badge)](https://github.com/hutchngo)

## **Citations**

To cite the [**`wehoop`**](https://wehoop.sportsdataverse.org) R package
in publications, use:

BibTex Citation

``` bibtex
@misc{hutchinson_gilani_2021_wehoop,
  title = {wehoop: Access Women’s Basketball Play by Play Data},
  url = {http://doi.org/10.32614/CRAN.package.wehoop},
  DOI = {10.32614/cran.package.wehoop},
  journal = {CRAN: Contributed Packages},
  publisher = {The R Foundation},
  author = {Gilani,  Saiem and Hutchinson,  Geoffery},
  year = {2021},
  month = nov
}
```
