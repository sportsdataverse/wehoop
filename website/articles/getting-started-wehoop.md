---
title: "Getting Started with wehoop"
description: "Getting started with using <code>wehoop</code> and women's basketball data."
author: "Saiem Gilani <br><a href='https://twitter.com/saiemgilani' target='blank'><img src='https://img.shields.io/twitter/follow/saiemgilani?color=blue&amp;label=%40saiemgilani&amp;logo=twitter&amp;style=for-the-badge' alt='@saiemgilani'/></a> <a href='https://github.com/saiemgilani' target='blank'><img src='https://img.shields.io/github/followers/saiemgilani?color=eee&amp;logo=Github&amp;style=for-the-badge' alt='@saiemgilani'/></a>"
opengraph:
  image: 
    src: "https://github.com/saiemgilani/wehoop-data/blob/master/themes/wehoop_gh.png?raw=true"
  twitter:
    card: summary_large_image
    creator: "@saiemgilani"
output: html_document
---


Welcome folks,

I'm Saiem Gilani, one of the [authors](https://saiemgilani.github.io/wehoop/authors.html "Authors and contributors to wehoop") of [`wehoop`](https://saiemgilani.github.io/wehoop/), and I hope to give the community a high-quality resource for accessing women's basketball data for statistical analysis, basketball research, and more. I am excited to show you some of what you can do with this edition of the package.

### **Installing R and RStudio**

1.  Head to <https://cran.r-project.org>
2.  Select the appropriate link for your operating system (Windows, Mac OS X, or Linux)

-   **Windows** - Select base and download the most recent version
-   **Mac OS X** - Select Latest Release, but check to make sure your OS is the correct version. Look through Binaries for Legacy OS X Systems if you are on an older release
-   **Linux** - Select the appropriate distro and follow the installation instructions

3.  Head to [RStudio.com](https://www.rstudio.com/products/rstudio/download/#download "Download the appropriate version of RStudio (Free) for your operating system to use with R")
4.  Follow the associated download and installation instructions for RStudio.
5.  Start peering over the [RStudio IDE Cheatsheet](https://github.com/rstudio/cheatsheets/raw/master/rstudio-ide.pdf). *An IDE is an integrated development environment.*


## **Install** [**`wehoop`**](https://saiemgilani.github.io/wehoop/)

```r
# You can install using the pacman package using the following code:
if (!requireNamespace('pacman', quietly = TRUE)){
  install.packages('pacman')
}
pacman::p_load_current_gh("saiemgilani/wehoop")
```

## **Quick Start**

### **WNBA full play-by-play seasons (2002-2021) ~ 1-2 minutes**

```r
future::plan("multisession")
tictoc::tic()
progressr::with_progress({
  wnba_pbp <- wehoop::load_wnba_pbp(2002:2021)
})
tictoc::toc()
```

```
## 15.56 sec elapsed
```

```r
## 10.36 sec elapsed
length(unique(wnba_pbp$game_id))
```

```
## [1] 4497
```

```r
nrow(wnba_pbp)
```

```
## [1] 1715851
```
### **WNBA full team box score seasons (2002-2021) ~ 5-30 seconds**

```r
future::plan("multisession")
tictoc::tic()
progressr::with_progress({
  wnba_team_box <- wehoop::load_wnba_team_box(2002:2021)
})
tictoc::toc()
```

```
## 7.58 sec elapsed
```

```r
length(unique(wnba_team_box$game_id))
```

```
## [1] 4135
```

```r
nrow(wnba_team_box)
```

```
## [1] 8270
```
### **WNBA full player box score seasons (2002-2021) ~ 5-30 seconds**

```r
future::plan("multisession")
tictoc::tic()
progressr::with_progress({
  wnba_player_box <- wehoop::load_wnba_player_box(2002:2021)
})
tictoc::toc()
```

```
## 7.08 sec elapsed
```

```r
length(unique(wnba_player_box$game_id))
```

```
## [1] 4500
```

```r
nrow(wnba_player_box)
```

```
## [1] 97385
```

### **Women's college basketball full play-by-play seasons (2002-2021) ~ 45-90 seconds**


```r
future::plan("multisession")
tictoc::tic()
progressr::with_progress({
  wbb_pbp <- wehoop::load_wbb_pbp(2002:2021)
})
tictoc::toc()
```

```
## 50.14 sec elapsed
```

```r
length(unique(wbb_pbp$game_id))
```

```
## [1] 26023
```

```r
nrow(wbb_pbp)
```

```
## [1] 8650487
```

### **Women's college basketball full team box score seasons (2002-2021) ~ 5-30 seconds**


```r
future::plan("multisession")
tictoc::tic()
progressr::with_progress({
  wbb_team_box <- wehoop::load_wbb_team_box(2002:2021)
})
tictoc::toc()
```

```
## 7.37 sec elapsed
```

```r
length(unique(wbb_team_box$game_id))
```

```
## [1] 20762
```

```r
nrow(wbb_team_box)
```

```
## [1] 41524
```

### **Women's college basketball full player box score seasons (2002-2021) ~ 5-30 seconds**


```r
future::plan("multisession")
tictoc::tic()
progressr::with_progress({
  wbb_player_box <- wehoop::load_wbb_player_box(2002:2021)
})
tictoc::toc()
```

```
## 9.2 sec elapsed
```

```r
length(unique(wbb_player_box$game_id))
```

```
## [1] 28957
```

```r
nrow(wbb_player_box)
```

```
## [1] 488041
```


# **Our Authors**

-   [Saiem Gilani](https://twitter.com/saiemgilani)       
<a href="https://twitter.com/saiemgilani" target="blank"><img src="https://img.shields.io/twitter/follow/saiemgilani?color=blue&label=%40saiemgilani&logo=twitter&style=for-the-badge" alt="@saiemgilani" /></a>
<a href="https://github.com/saiemgilani" target="blank"><img src="https://img.shields.io/github/followers/saiemgilani?color=eee&logo=Github&style=for-the-badge" alt="@saiemgilani" /></a>

-   [Geoff Hutchinson](https://twitter.com/hutchngo)       
<a href="https://twitter.com/hutchngo" target="blank"><img src="https://img.shields.io/twitter/follow/hutchngo?color=blue&label=%40hutchngo&logo=twitter&style=for-the-badge" alt="@hutchngo" /></a>
<a href="https://github.com/hutchngo" target="blank"><img src="https://img.shields.io/github/followers/hutchngo?color=eee&logo=Github&style=for-the-badge" alt="@hutchngo" /></a>


