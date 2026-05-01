# wehoop

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

### **WNBA full play-by-play seasons (2002-2025) ~ 1-2 minutes**

``` r

tictoc::tic()
progressr::with_progress({
  wnba_pbp <- wehoop::load_wnba_pbp()
})
tictoc::toc()
```

``` R
## 0.86 sec elapsed

## 87618 rows of WNBA play-by-play data from 223 games.
```

### **Women’s college basketball full play-by-play seasons (2004-2025) ~ 2-3 minutes**

``` r

tictoc::tic()
progressr::with_progress({
  wbb_pbp <- wehoop::load_wbb_pbp()
})
tictoc::toc()
```

``` R
## 8.72 sec elapsed

## 1973907 rows of women's college basketball play-by-play data from 5473 games.
```

## **Documentation**

For more information on the package and function reference, please see
the [**`wehoop`** documentation
website](https://wehoop.sportsdataverse.org).

## **Breaking Changes**

[**Full News on
Releases**](https://wehoop.sportsdataverse.org/news/index.html)

## Follow the SportsDataverse (@SportsDataverse) on Twitter and star this repo

[![Twitter
Follow](https://img.shields.io/twitter/follow/SportsDataverse?style=for-the-badge&logo=x&label=%40SportsDataverse)](https://twitter.com/SportsDataverse)

[![GitHub
stars](https://img.shields.io/github/stars/sportsdataverse/wehoop.svg?color=eee&logo=github&style=for-the-badge&label=Star%20wehoop&maxAge=2592000)](https://github.com/sportsdataverse/wehoop/stargazers/)

# **Our Authors**

- [Saiem Gilani](https://twitter.com/saiemgilani)

[![@SaiemGilani](https://img.shields.io/twitter/follow/SaiemGilani?style=for-the-badge&logo=x&label=%40SaiemGilani)](https://twitter.com/saiemgilani)
[![@saiemgilani](https://img.shields.io/github/followers/saiemgilani?color=eee&logo=Github&style=for-the-badge)](https://github.com/saiemgilani)

- [Geoff Hutchinson - RIP](https://twitter.com/hutchngo)

[![@HutchNGo](https://img.shields.io/twitter/follow/HutchNGo?label=%40hutchngo&logo=x&style=for-the-badge)](https://twitter.com/HutchNGo)
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
