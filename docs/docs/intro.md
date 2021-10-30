
# wehoop <a href='https://wehoop.sportsdataverse.org'><img src="https://wehoop.sportsdataverse.org/img/logo.png" align="right" height="139"/></a>

<!-- badges: start -->

[![Version-Number](https://img.shields.io/github/r-package/v/saiemgilani/wehoop?label=wehoop&logo=R&style=for-the-badge)](https://github.com/saiemgilani/wehoop)
[![R-CMD-check](https://img.shields.io/github/workflow/status/saiemgilani/wehoop/R-CMD-check?label=R-CMD-Check&logo=R&logoColor=blue&style=for-the-badge)](https://github.com/saiemgilani/wehoop/actions/workflows/R-CMD-check.yaml)
[![Lifecycle:maturing](https://img.shields.io/badge/lifecycle-maturing-blue.svg?style=for-the-badge&logo=github)](https://github.com/saiemgilani/wehoop)
[![Twitter
Follow](https://img.shields.io/twitter/follow/saiemgilani?color=blue&label=%40saiemgilani&logo=twitter&style=for-the-badge)](https://twitter.com/saiemgilani)
[![Twitter
Follow](https://img.shields.io/twitter/follow/hutchngo?color=blue&label=%40hutchngo&logo=twitter&style=for-the-badge)](https://twitter.com/hutchngo)

<!-- badges: end -->

`wehoop` is an R package for working with women’s college and
professional basketball data. The package has functions to access **live
play by play and box score** data from ESPN with shot locations when
available.

A scraping and aggregating interface for ESPN’s women’s college
basketball and WNBA statistics. It provides users with the capability to
access the API’s game play-by-plays, box scores, standings and results
to analyze the data for themselves.

## Installation

You can install the released version of
[**`wehoop`**](https://github.com/saiemgilani/wehoop) from
[GitHub](https://github.com/saiemgilani/wehoop) with:

``` r
# You can install using the pacman package using the following code:
if (!requireNamespace('pacman', quietly = TRUE)){
  install.packages('pacman')
}
pacman::p_load_current_gh("saiemgilani/wehoop", dependencies = TRUE, update = TRUE)
```

``` r
# if you would prefer devtools installation
if (!requireNamespace('devtools', quietly = TRUE)){
  install.packages('devtools')
}
# Alternatively, using the devtools package:
devtools::install_github(repo = "saiemgilani/wehoop")
```

## Quick Start

### **WNBA full play-by-play seasons (2002-2021) \~ 1-2 minutes**

``` r
# You can install using the pacman package using the following code:
if (!requireNamespace('pacman', quietly = TRUE)){
  install.packages('pacman')
}
pacman::p_load_current_gh("saiemgilani/wehoop")
tictoc::tic()
progressr::with_progress({
  wnba_pbp <- wehoop::load_wnba_pbp(2002:2021)
})
tictoc::toc()
```

    ## 9.78 sec elapsed

``` r
glue::glue("{nrow(wnba_pbp)} rows of WNBA play-by-play data from {length(unique(wnba_pbp$game_id))} games.")
```

    ## 1784144 rows of WNBA play-by-play data from 4677 games.

### **Women’s college basketball full play-by-play seasons (2004-2021) \~ 2-3 minutes**

``` r
tictoc::tic()
progressr::with_progress({
  wbb_pbp <- wehoop::load_wbb_pbp(2004:2021)
})
tictoc::toc()
```

    ## 43.88 sec elapsed

``` r
glue::glue("{nrow(wbb_pbp)} rows of women's college basketball play-by-play data from {length(unique(wbb_pbp$game_id))} games.")
```

    ## 8650487 rows of women's college basketball play-by-play data from 26023 games.

## Documentation

For more information on the package and function reference, please see
the [**`wehoop`** documentation
website](https://wehoop.sportsdataverse.org).

## **Breaking Changes**

[**Full News on
Releases**](https://wehoop.sportsdataverse.org/CHANGELOG)

# **Our Authors**

-   [Saiem Gilani](https://twitter.com/saiemgilani)  
    <a href="https://twitter.com/saiemgilani" target="blank"><img src="https://img.shields.io/twitter/follow/saiemgilani?color=blue&label=%40saiemgilani&logo=twitter&style=for-the-badge" alt="@saiemgilani" /></a>
    <a href="https://github.com/saiemgilani" target="blank"><img src="https://img.shields.io/github/followers/saiemgilani?color=eee&logo=Github&style=for-the-badge" alt="@saiemgilani" /></a>

-   [Geoff Hutchinson](https://twitter.com/hutchngo)  
    <a href="https://twitter.com/hutchngo" target="blank"><img src="https://img.shields.io/twitter/follow/hutchngo?color=blue&label=%40hutchngo&logo=twitter&style=for-the-badge" alt="@hutchngo" /></a>
    <a href="https://github.com/hutchngo" target="blank"><img src="https://img.shields.io/github/followers/hutchngo?color=eee&logo=Github&style=for-the-badge" alt="@hutchngo" /></a>

## **Citations**

To cite the [**`wehoop`**](https://wehoop.sportsdataverse.org) R package
in publications, use:

BibTex Citation

``` bibtex
@misc{hutchinson_gilani_2021_wehoop,
  author = {Saiem Gilani and Geoff Hutchinson},
  title = {wehoop: The SportsDataverse's R Package for Women's Basketball Data.},
  url = {https://wehoop.sportsdataverse.org},
  year = {2021}
}
```
