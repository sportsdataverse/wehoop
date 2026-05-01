# Getting Started with wehoop

Welcome folks,

I’m Saiem Gilani, one of the
[authors](https://saiemgilani.github.io/wehoop/authors.html "Authors and contributors to wehoop")
of [`wehoop`](https://saiemgilani.github.io/wehoop/), and I hope to give
the community a high-quality resource for accessing women’s basketball
data for statistical analysis, basketball research, and more. I am
excited to show you some of what you can do with this edition of the
package.

#### **Installing R and RStudio**

1.  Head to <https://cran.r-project.org>
2.  Select the appropriate link for your operating system (Windows, Mac
    OS X, or Linux)

- **Windows** - Select base and download the most recent version
- **Mac OS X** - Select Latest Release, but check to make sure your OS
  is the correct version. Look through Binaries for Legacy OS X Systems
  if you are on an older release
- **Linux** - Select the appropriate distro and follow the installation
  instructions

3.  Head to
    [Posit.co](https://posit.co/download/rstudio-desktop/#download "Download the appropriate version of RStudio (Free) for your operating system to use with R")
4.  Follow the associated download and installation instructions for
    RStudio.
5.  Start peering over the [RStudio IDE
    Cheatsheet](https://raw.githubusercontent.com/rstudio/cheatsheets/main/rstudio-ide.pdf).
    *An IDE is an integrated development environment.*
6.  For **Windows** users: I recommend you install
    [Rtools](https://cran.r-project.org/bin/windows/Rtools/). This is
    not an R package! It is “a collection of resources for building
    packages for R under Microsoft Windows, or for building R itself”.
    Go to <https://cran.r-project.org/bin/windows/Rtools/> and follow
    the directions for installation.

### **Install** [**`wehoop`**](https://saiemgilani.github.io/wehoop/)

``` r

# You can install using the pak package using the following code:
if (!requireNamespace('pak')){
  install.packages('pak')
}
pak::pkg_install(c("wehoop", "dplyr", "glue", "progressr", "tictoc"))
```

### **Quick Start**

#### **WNBA full play-by-play seasons (2002-2026) ~ 30-60 seconds**

``` r

tictoc::tic()
progressr::with_progress({
  wnba_pbp <- wehoop::load_wnba_pbp()
})
tictoc::toc()
```

    ## 0.171 sec elapsed

``` r

## 13.91 sec elapsed
glue::glue("{nrow(wnba_pbp)} rows of WNBA play-by-play data from {length(unique(wnba_pbp$game_id))} games.")
```

    ## 0 rows of WNBA play-by-play data from 0 games.

``` r

## 1782985 rows of WNBA play-by-play data from 4674 games.
dplyr::glimpse(wnba_pbp)
```

    ## Rows: 0
    ## Columns: 0

#### **WNBA full team box score seasons (2003-2026) ~ 5-30 seconds**

``` r

tictoc::tic()
progressr::with_progress({
  wnba_team_box <- wehoop::load_wnba_team_box()
})

tictoc::toc()
```

    ## 0.178 sec elapsed

``` r

glue::glue("{nrow(wnba_team_box)} rows of WNBA team boxscore data from {length(unique(wnba_team_box$game_id))} games.")
```

    ## 0 rows of WNBA team boxscore data from 0 games.

``` r

dplyr::glimpse(wnba_team_box)
```

    ## Rows: 0
    ## Columns: 0

#### **WNBA full player box score seasons (2002-2026) ~ 5-30 seconds**

``` r

tictoc::tic()
progressr::with_progress({
  wnba_player_box <- wehoop::load_wnba_player_box()
})
tictoc::toc()
```

    ## 0.163 sec elapsed

``` r

length(unique(wnba_player_box$game_id))
```

    ## [1] 0

``` r

nrow(wnba_player_box)
```

    ## [1] 0

#### **Women’s college basketball full play-by-play seasons (2004-2026) ~ 45-90 seconds**

``` r

tictoc::tic()
progressr::with_progress({
  wbb_pbp <- wehoop::load_wbb_pbp()
})
tictoc::toc()
```

    ## 14.501 sec elapsed

``` r

length(unique(wbb_pbp$game_id))
```

    ## [1] 6011

``` r

nrow(wbb_pbp)
```

    ## [1] 2824090

#### **Women’s college basketball full team box score seasons (2006-2026) ~ 5-30 seconds**

``` r

tictoc::tic()
progressr::with_progress({
  wbb_team_box <- wehoop::load_wbb_team_box()
})
tictoc::toc()
```

    ## 0.364 sec elapsed

``` r

length(unique(wbb_team_box$game_id))
```

    ## [1] 6029

``` r

nrow(wbb_team_box)
```

    ## [1] 12058

#### **Women’s college basketball full player box score seasons (2006-2026) ~ 5-30 seconds**

``` r

tictoc::tic()
progressr::with_progress({
  wbb_player_box <- wehoop::load_wbb_player_box()
})
tictoc::toc()
```

    ## 1.071 sec elapsed

``` r

length(unique(wbb_player_box$game_id))
```

    ## [1] 6029

``` r

nrow(wbb_player_box)
```

    ## [1] 168228

## **Our Authors**

- [Saiem Gilani](https://twitter.com/saiemgilani)  
  [![@saiemgilani](https://img.shields.io/twitter/follow/saiemgilani?label=%40saiemgilani&logo=x&style=for-the-badge)](https://twitter.com/saiemgilani)
  [![@saiemgilani](https://img.shields.io/github/followers/saiemgilani?color=eee&logo=Github&style=for-the-badge)](https://github.com/saiemgilani)

- [Geoff Hutchinson - RIP](https://twitter.com/hutchngo)  
  [![@hutchngo](https://img.shields.io/twitter/follow/hutchngo?label=%40hutchngo&logo=x&style=for-the-badge)](https://twitter.com/hutchngo)
  [![@hutchngo](https://img.shields.io/github/followers/hutchngo?color=eee&logo=Github&style=for-the-badge)](https://github.com/hutchngo)
