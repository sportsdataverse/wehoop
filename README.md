
# wehoop <a href='https://wehoop.sportsdataverse.org'><img src="https://raw.githubusercontent.com/sportsdataverse/wehoop/main/logo.png" align="right"  width="20%" min-width="100px"/></a>

<!-- badges: start -->

[![CRAN
status](https://img.shields.io/badge/dynamic/json?style=for-the-badge&color=success&label=CRAN%20version&prefix=v&query=%24.Version&url=https%3A%2F%2Fcrandb.r-pkg.org%2Fwehoop)](https://CRAN.R-project.org/package=wehoop)
[![CRAN
downloads](https://img.shields.io/badge/dynamic/json?style=for-the-badge&color=success&label=Downloads&query=%24%5B0%5D.downloads&url=https%3A%2F%2Fcranlogs.r-pkg.org%2Fdownloads%2Ftotal%2F2021-10-26%3Alast-day%2Fwehoop)](https://CRAN.R-project.org/package=wehoop)
[![Version-Number](https://img.shields.io/github/r-package/v/sportsdataverse/wehoop?label=wehoop&logo=R&style=for-the-badge)](https://github.com/sportsdataverse/wehoop)
[![R-CMD-check](https://img.shields.io/github/actions/workflow/status/sportsdataverse/wehoop/R-CMD-check.yaml?branch=main&label=R-CMD-Check&logo=R&logoColor=white&style=for-the-badge)](https://github.com/sportsdataverse/wehoop/actions/workflows/R-CMD-check.yaml)
[![Lifecycle:maturing](https://img.shields.io/badge/lifecycle-maturing-blue.svg?style=for-the-badge&logo=github)](https://github.com/sportsdataverse/wehoop)

<!-- [![Twitter Follow](https://img.shields.io/twitter/follow/SaiemGilani?color=blue&label=%40SaiemGilani&logo=twitter&style=for-the-badge)](https://twitter.com/SaiemGilani) -->
<!-- [![Twitter Follow](https://img.shields.io/twitter/follow/hutchngo?color=blue&label=%40hutchngo&logo=twitter&style=for-the-badge)](https://twitter.com/hutchngo) [![Twitter Follow](https://img.shields.io/twitter/follow/sportsdataverse?color=blue&label=%40SportsDataverse&logo=twitter&style=for-the-badge)](https://twitter.com/sportsdataverse)  -->
<!-- badges: end -->

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
# You can install using the pacman package using the following code:
if (!requireNamespace('pacman', quietly = TRUE)){
  install.packages('pacman')
}
pacman::p_load_current_gh("sportsdataverse/wehoop", dependencies = TRUE, update = TRUE)
```

## **Quick Start**

### **WNBA full play-by-play seasons (2002-2024) ~ 1-2 minutes**

``` r
tictoc::tic()
progressr::with_progress({
  wnba_pbp <- wehoop::load_wnba_pbp()
})
tictoc::toc()
```

    ## 1.16 sec elapsed

    ## 58334 rows of WNBA play-by-play data from 150 games.

### **Women’s college basketball full play-by-play seasons (2004-2024) ~ 2-3 minutes**

``` r
tictoc::tic()
progressr::with_progress({
  wbb_pbp <- wehoop::load_wbb_pbp()
})
tictoc::toc()
```

    ## 6.3 sec elapsed

    ## 1908679 rows of women's college basketball play-by-play data from 5779 games.

## **Documentation**

For more information on the package and function reference, please see
the [**`wehoop`** documentation
website](https://wehoop.sportsdataverse.org).

## **Breaking Changes**

[**Full News on
Releases**](https://wehoop.sportsdataverse.org/news/index.html)

## Follow the SportsDataverse (@SportsDataverse) on Twitter and star this repo

<!-- [![Twitter Follow](https://img.shields.io/twitter/follow/SportsDataverse?color=blue&label=%40SportsDataverse&logo=twitter&style=for-the-badge)](https://twitter.com/SportsDataverse)  -->

[![GitHub
stars](https://img.shields.io/github/stars/sportsdataverse/wehoop.svg?color=eee&logo=github&style=for-the-badge&label=Star%20wehoop&maxAge=2592000)](https://github.com/sportsdataverse/wehoop/stargazers/)

# **Our Authors**

- Saiem Gilani (@saiemgilani)  
  <!-- <a href="https://twitter.com/saiemgilani" target="blank"><img src="https://img.shields.io/twitter/follow/saiemgilani?color=blue&label=%40saiemgilani&logo=twitter&style=for-the-badge" alt="@saiemgilani" /></a> -->

<a href="https://github.com/saiemgilani" target="blank"><img src="https://img.shields.io/github/followers/saiemgilani?color=eee&logo=Github&style=for-the-badge" alt="@saiemgilani" /></a>

- Geoff Hutchinson (@HutchNGo)  
  <!-- <a href="https://twitter.com/HutchNGo" target="blank"><img src="https://img.shields.io/twitter/follow/HutchNGo?color=blue&label=%40hutchngo&logo=twitter&style=for-the-badge" alt="@HutchNGo" /></a> -->

<a href="https://github.com/hutchngo" target="blank"><img src="https://img.shields.io/github/followers/hutchngo?color=eee&logo=Github&style=for-the-badge" alt="@hutchngo" /></a>

## **Citations**

To cite the [**`wehoop`**](https://wehoop.sportsdataverse.org) R package
in publications, use:

BibTex Citation

``` bibtex
@misc{hutchinson_gilani_2021_wehoop,
  title = {wehoop: Access Women’s Basketball Play by Play Data},
  url = {http://dx.doi.org/10.32614/CRAN.package.wehoop},
  DOI = {10.32614/cran.package.wehoop},
  journal = {CRAN: Contributed Packages},
  publisher = {The R Foundation},
  author = {Gilani,  Saiem and Hutchinson,  Geoffery},
  year = {2021},
  month = nov 
}
```
