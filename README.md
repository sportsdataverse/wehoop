
# wehoop <a href='http://saiemgilani.github.io/wehoop'><img src="man/figures/logo.png" align="right" height="139"/></a>

<!-- badges: start -->

[![Version-Number](https://img.shields.io/github/r-package/v/saiemgilani/wehoop?label=wehoop&logo=R&logoColor=white&style=for-the-badge)](https://github.com/saiemgilani/wehoop)
[![R-CMD-check](https://img.shields.io/github/workflow/status/saiemgilani/wehoop/R-CMD-check?label=R-CMD-Check&logo=R&logoColor=white&style=for-the-badge)](https://github.com/saiemgilani/wehoop/actions/workflows/R-CMD-check.yaml)
[![Lifecycle:maturing](https://img.shields.io/badge/lifecycle-maturing-blue.svg?style=for-the-badge&logo=github)](https://github.com/saiemgilani/wehoop)
[![Twitter
Follow](https://img.shields.io/twitter/follow/saiemgilani?color=blue&label=%40saiemgilani&logo=twitter&style=for-the-badge)](https://twitter.com/saiemgilani)
[![Twitter
Follow](https://img.shields.io/twitter/follow/hutchngo?color=blue&label=%40hutchngo&logo=twitter&style=for-the-badge)](https://twitter.com/hutchngo)
![Contributors](https://img.shields.io/github/contributors/saiemgilani/wehoop?style=for-the-badge)

<!-- badges: end -->

[**`wehoop`**](http://saiemgilani.github.io/wehoop) is an R package for
working with women’s college and professional basketball data. The
package has functions to access **live play by play and box score** data
from ESPN with shot locations when available.

A scraping and aggregating interface for ESPN’s women’s college
basketball and WNBA statistics. It provides users with the capability to
access the API’s game play-by-plays, box scores, standings and results
to analyze the data for themselves.

## Installation

You can install the released version of
[**`wehoop`**](https://github.com/saiemgilani/wehoop/) from
[GitHub](https://github.com/saiemgilani/wehoop) with:

``` r
# You can install using the pacman package using the following code:
if (!requireNamespace('pacman', quietly = TRUE)){
  install.packages('pacman')
}
pacman::p_load_current_gh("saiemgilani/wehoop")
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
future::plan("multisession")
tictoc::tic()
progressr::with_progress({
  pbp <- wehoop::load_wnba_pbp(2002:2021)
})
tictoc::toc()
## 10.36 sec elapsed
length(unique(pbp$game_id))
nrow(pbp)
```

### **Women’s college basketball full play-by-play seasons (2002-2021) \~ 2-3 minutes**

``` r
# You can install using the pacman package using the following code:
if (!requireNamespace('pacman', quietly = TRUE)){
  install.packages('pacman')
}
pacman::p_load_current_gh("saiemgilani/wehoop")
future::plan("multisession")
tictoc::tic()
progressr::with_progress({
  pbp <- wehoop::load_wbb_pbp(2002:2021)
})
tictoc::toc()

## 73.39 sec elapsed
length(unique(pbp$game_id))
nrow(pbp)
```

## Documentation

For more information on the package and function reference, please see
the [**`wehoop`** documentation
website](https://saiemgilani.github.io/wehoop/).

## **Breaking Changes**

[**Full News on
Releases**](https://saiemgilani.github.io/wehoop/news/index.html)

# **wehoop 1.1.0**

### **Add schedule loaders**

  - [`wehoop::load_wbb_schedule()`](https://saiemgilani.github.io/wehoop/reference/load_wbb_schedule.html)
    function added
  - [`wehoop::load_wnba_schedule()`](https://saiemgilani.github.io/wehoop/reference/load_wnba_schedule.html)
    function added

# 

<details>

<summary>View more version news</summary>

## **wehoop 1.0.0**

### **Add team box score loaders**

  - [`wehoop::load_wbb_team_box()`](https://saiemgilani.github.io/wehoop/reference/load_wbb_team_box.html)
    function added
  - [`wehoop::load_wnba_team_box()`](https://saiemgilani.github.io/wehoop/reference/load_wnba_team_box.html)
    function added

### **Add player box score loaders**

  - [`wehoop::load_wbb_player_box()`](https://saiemgilani.github.io/wehoop/reference/load_wbb_player_box.html)
    function added
  - [`wehoop::load_wnba_player_box()`](https://saiemgilani.github.io/wehoop/reference/load_wnba_player_box.html)
    function added

### **Standings functions**

  - [`wehoop::espn_wnba_standings()`](https://saiemgilani.github.io/wehoop/reference/espn_wnba_standings.html)
  - [`wehoop::espn_wbb_standings()`](https://saiemgilani.github.io/wehoop/reference/espn_wbb_standings.html)

### **Getting Started vignette**

  - [Getting started with wehoop
    data](https://saiemgilani.github.io/wehoop/articles/getting-started-wehoop.html)

## **wehoop 0.9.2**

  - Added
    [`wehoop::espn_wbb_conferences()`](https://saiemgilani.github.io/wehoop/reference/espn_wbb_conferences.html)
    function

### **Quick fix for update db functions**

### **Dependency pruning**

This update is a non-user facing change to package dependencies to
shrink the list of dependencies.

## **wehoop 0.9.1**

### **Clean names and team returns**

  - All functions have now been given the
    [`janitor::clean_names()`](https://rdrr.io/cran/janitor/man/clean_names.html)
    treatment
  - [`wehoop::espn_wbb_teams()`](https://saiemgilani.github.io/wehoop/reference/espn_wbb_teams.html)
    has updated the returns to be more identity information related only
  - [`wehoop::espn_wnba_teams()`](https://saiemgilani.github.io/wehoop/reference/espn_wnba_teams.html)
    to be more identity information related only
  - All tests were updated

## **wehoop 0.9.0**

### **Loading capabilities added to the package**

  - [`wehoop::load_wbb_pbp()`](https://saiemgilani.github.io/wehoop/reference/load_wbb_pbp.html)
    and
    [`wehoop::update_wbb_db()`](https://saiemgilani.github.io/wehoop/reference/update_wbb_db.html)
    functions added
  - [`wehoop::load_wnba_pbp()`](https://saiemgilani.github.io/wehoop/reference/load_wnba_pbp.html)
    and
    [`wehoop::update_wnba_db()`](https://saiemgilani.github.io/wehoop/reference/update_wnba_db.html)
    functions added

## **wehoop 0.3.0**

### **Dependencies**

  - `R` version 3.5.0 or greater dependency added
  - `purrr` version 0.3.0 or greater dependency added
  - `rvest` version 1.0.0 or greater dependency added
  - `progressr` version 0.6.0 or greater dependency added
  - `usethis` version 1.6.0 or greater dependency added
  - `xgboost` version 1.1.0 or greater dependency added
  - `tidyr` version 1.0.0 or greater dependency added
  - `stringr` version 1.3.0 or greater dependency added
  - `tibble` version 3.0.0 or greater dependency added
  - `furrr` dependency added
  - `future` dependency added

### **Test coverage**

  - Added tests for all ESPN functions \#\#\# **Function Naming
    Convention Change**
  - Similarly, data and metrics sourced from ESPN will begin with
    `espn_` as opposed to `wbb_` or `wnba_`.
  - Data sourced directly from the NCAA website will start the function
    with `ncaa_`

## **v0.2.0**: Support for ESPN’s WNBA game data

See the following six functions: -
[`wehoop::wnba_espn_game_all()`](https://saiemgilani.github.io/wehoop/reference/wnba_espn_game_all.html)
-
[`wehoop::wnba_espn_pbp()`](https://saiemgilani.github.io/wehoop/reference/wnba_espn_pbp.html)
-
[`wehoop::wnba_espn_team_box()`](https://saiemgilani.github.io/wehoop/reference/wnba_espn_team_box.html)
-
[`wehoop::wnba_espn_player_box()`](https://saiemgilani.github.io/wehoop/reference/wnba_espn_player_box.html)
-
[`wehoop::wnba_espn_teams()`](https://saiemgilani.github.io/wehoop/reference/wnba_espn_teams.html)
-
[`wehoop::wnba_espn_scoreboard()`](https://saiemgilani.github.io/wehoop/reference/wnba_espn_scoreboard.html)

## **v0.1.0**: Support for ESPN’s women’s college basketball game data and NCAA NET Rankings

See the following eight functions: -
[`wehoop::wbb_espn_game_all()`](https://saiemgilani.github.io/wehoop/reference/wbb_espn_game_all.html)
-
[`wehoop::wbb_espn_pbp()`](https://saiemgilani.github.io/wehoop/reference/wbb_espn_pbp.html)
-
[`wehoop::wbb_espn_team_box()`](https://saiemgilani.github.io/wehoop/reference/wbb_espn_team_box.html)

  - [`wehoop::wbb_espn_player_box()`](https://saiemgilani.github.io/wehoop/reference/wbb_espn_player_box.html)

  - [`wehoop::wbb_espn_teams()`](https://saiemgilani.github.io/wehoop/reference/wbb_espn_teams.html)

<!-- - [```wehoop::wbb_espn_conferences()```](https://saiemgilani.github.io/wehoop/reference/wbb_espn_conferences.html)  -->

  - [`wehoop::wbb_espn_scoreboard()`](https://saiemgilani.github.io/wehoop/reference/wbb_espn_scoreboard.html)
  - [`wehoop::wbb_ncaa_NET_rankings()`](https://saiemgilani.github.io/wehoop/reference/wbb_ncaa_NET_rankings.html)
  - [`wehoop::wbb_rankings()`](https://saiemgilani.github.io/wehoop/reference/wbb_rankings.html)

</details>

# Current Issues

| issue | icon | title | labels | opened\_by | date | closed |
| :---- | :--- | :---- | :----- | :--------- | :--- | :----- |
| NA    | NA   | NA    | NA     | NA         | NA   | NA     |

<details>

<summary>View More</summary>

| issue | icon                                                                                                                                         | title                                                                                                                             | labels | opened\_by                                    | date       | closed              |
| :---- | :------------------------------------------------------------------------------------------------------------------------------------------- | :-------------------------------------------------------------------------------------------------------------------------------- | :----- | :-------------------------------------------- | :--------- | :------------------ |
| 8     | <span title="Merged Pull Request"><img src="https://github.com/yonicd/issue/blob/master/inst/icons/pull-request-merged.png?raw=true"></span> | <span title="We exporting the schedule loading functions">[Schedule loaders](https://github.com/saiemgilani/wehoop/pull/8)</span> |        | [saiemgilani](https://github.com/saiemgilani) | 2021-06-26 | 2021-06-26 00:30:11 |

</details>

<br>

# **Our Authors**

  - [Saiem Gilani](https://twitter.com/saiemgilani)  
    <a href="https://twitter.com/saiemgilani" target="blank"><img src="https://img.shields.io/twitter/follow/saiemgilani?color=blue&label=%40saiemgilani&logo=twitter&style=for-the-badge" alt="@saiemgilani" /></a>
    <a href="https://github.com/saiemgilani" target="blank"><img src="https://img.shields.io/github/followers/saiemgilani?color=eee&logo=Github&style=for-the-badge" alt="@saiemgilani" /></a>

  - [Geoff Hutchinson](https://twitter.com/hutchngo)  
    <a href="https://twitter.com/hutchngo" target="blank"><img src="https://img.shields.io/twitter/follow/hutchngo?color=blue&label=%40hutchngo&logo=twitter&style=for-the-badge" alt="@hutchngo" /></a>
    <a href="https://github.com/hutchngo" target="blank"><img src="https://img.shields.io/github/followers/hutchngo?color=eee&logo=Github&style=for-the-badge" alt="@hutchngo" /></a>

## **Citations**

To cite the [**`wehoop`**](https://saiemgilani.github.io/wehoop/) R
package in publications, use:

BibTex Citation

``` bibtex
@misc{hutchingsongilani2021wehoop,
  author = {Saiem Gilani and Geoff Hutchinson},
  title = {wehoop: The SportsDataverse's R Package for Women's Basketball Data.},
  url = {https://saiemgilani.github.io/wehoop/},
  year = {2021}
}
```
