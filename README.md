
# wehoop <a href='http://saiemgilani.github.io/wehoop'><img src="man/figures/logo.png" align="right" height="139"/></a>

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
professional basketball data. A scraping and aggregating interface for
ESPN’s women’s college basketball and WNBA statistics. It provides users
with the capability to access the API’s game play-by-plays, box scores,
standings and results to analyze the data for themselves.

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

## Documentation

For more information on the package and function reference, please see
the [**`wehoop`** documentation
website](https://saiemgilani.github.io/wehoop/).

## **Breaking Changes**

[**Full News on
Releases**](https://saiemgilani.github.io/wehoop/news/index.html)

# **wehoop 0.3.0**

## **Dependencies**

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

## **Test coverage**

  - Added tests for all ESPN functions

#### **Function Naming Convention Change**

  - Similarly, data and metrics sourced from ESPN will begin with
    `espn_` as opposed to `wbb_` or `wnba_`.

  - Data sourced directly from the NCAA website will start the function
    with `ncaa_`

<details>

<summary>View more version news</summary>

#### **v0.2.0**: Support for ESPN’s WNBA game data

See the following six functions:

  - [`wehoop::wnba_espn_game_all()`](https://saiemgilani.github.io/wehoop/reference/wnba_espn_game_all.html)
  - [`wehoop::wnba_espn_pbp()`](https://saiemgilani.github.io/wehoop/reference/wnba_espn_pbp.html)
  - [`wehoop::wnba_espn_team_box()`](https://saiemgilani.github.io/wehoop/reference/wnba_espn_team_box.html)
  - [`wehoop::wnba_espn_player_box()`](https://saiemgilani.github.io/wehoop/reference/wnba_espn_player_box.html)
  - [`wehoop::wnba_espn_teams()`](https://saiemgilani.github.io/wehoop/reference/wnba_espn_teams.html)
  - [`wehoop::wnba_espn_scoreboard()`](https://saiemgilani.github.io/wehoop/reference/wnba_espn_scoreboard.html)

#### **v0.1.0**: Support for ESPN’s women’s college basketball game data and NCAA NET Rankings

See the following eight functions:

  - [`wehoop::wbb_espn_game_all()`](https://saiemgilani.github.io/wehoop/reference/wbb_espn_game_all.html)

  - [`wehoop::wbb_espn_pbp()`](https://saiemgilani.github.io/wehoop/reference/wbb_espn_pbp.html)

  - [`wehoop::wbb_espn_team_box()`](https://saiemgilani.github.io/wehoop/reference/wbb_espn_team_box.html)

  - [`wehoop::wbb_espn_player_box()`](https://saiemgilani.github.io/wehoop/reference/wbb_espn_player_box.html)

  - [`wehoop::wbb_espn_teams()`](https://saiemgilani.github.io/wehoop/reference/wbb_espn_teams.html)

<!-- - [```wehoop::wbb_espn_conferences()```](https://saiemgilani.github.io/wehoop/reference/wbb_espn_conferences.html)  -->

  - [`wehoop::wbb_espn_scoreboard()`](https://saiemgilani.github.io/wehoop/reference/wbb_espn_scoreboard.html)
  - [`wehoop::wbb_ncaa_NET_rankings()`](https://saiemgilani.github.io/wehoop/reference/wbb_ncaa_NET_rankings.html)
  - [`wehoop::wbb_rankings()`](https://saiemgilani.github.io/wehoop/reference/wbb_rankings.html)

</details>

## Current Issues

| issue | icon | title | labels | opened\_by | date | closed |
| :---- | :--- | :---- | :----- | :--------- | :--- | :----- |
| NA    | NA   | NA    | NA     | NA         | NA   | NA     |

<details>

<summary>View More</summary>

| issue | icon                                                                                                                                         | title                                                                                                                   | labels | opened\_by                                    | date       | closed              |
| :---- | :------------------------------------------------------------------------------------------------------------------------------------------- | :---------------------------------------------------------------------------------------------------------------------- | :----- | :-------------------------------------------- | :--------- | :------------------ |
| 2     | <span title="Merged Pull Request"><img src="https://github.com/yonicd/issue/blob/master/inst/icons/pull-request-merged.png?raw=true"></span> | <span title="">[remove rankings and conferences functions for now](https://github.com/saiemgilani/wehoop/pull/2)</span> |        | [saiemgilani](https://github.com/saiemgilani) | 2021-04-06 | 2021-04-06 17:46:25 |

</details>

<br>

## **Our Authors**

  - [Saiem Gilani](https://twitter.com/saiemgilani)  
    <a href="https://twitter.com/saiemgilani" target="blank"><img src="https://img.shields.io/twitter/follow/saiemgilani?color=blue&label=%40saiemgilani&logo=twitter&style=for-the-badge" alt="@saiemgilani" /></a>
    <a href="https://github.com/saiemgilani" target="blank"><img src="https://img.shields.io/github/followers/saiemgilani?color=eee&logo=Github&style=for-the-badge" alt="@saiemgilani" /></a>

  - [Geoff Hutchinson](https://twitter.com/hutchngo)  
    <a href="https://twitter.com/hutchngo" target="blank"><img src="https://img.shields.io/twitter/follow/hutchngo?color=blue&label=%40hutchngo&logo=twitter&style=for-the-badge" alt="@hutchngo" /></a>
    <a href="https://github.com/hutchngo" target="blank"><img src="https://img.shields.io/github/followers/hutchngo?color=eee&logo=Github&style=for-the-badge" alt="@hutchngo" /></a>
