---
title: espn_wbb_scoreboard
sidebar_label: espn_wbb_scoreboard
---

# `espn_wbb_scoreboard`

## Description

Get women's college basketball schedule for a specific year from ESPN's API


## Usage

```r
espn_wbb_scoreboard(season)
```


## Arguments

Argument      |Description
------------- |----------------
`season`     |     Either numeric or character


## Value

Returns a tibble


## Author

Thomas Mock, you a genius for this one.


## Examples

```r
# Get schedule returns 1000 results, max allowable.
# Get schedule from date 2021-02-15, then next date and so on.
espn_wbb_scoreboard (season = "20210215")
```
