---
title: espn_wnba_scoreboard
description: Get WNBA schedule for a specific year/date from ESPN's API
featured: true

recommended: null
---
# `espn_wnba_scoreboard`

Get WNBA schedule for a specific year/date from ESPN's API


## Description

Get WNBA schedule for a specific year/date from ESPN's API


## Usage

```r
espn_wnba_scoreboard(season)
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
# Get schedule from 2020 season (returns 1000 results, max allowable.)
# Must iterate through dates to get full year's schedule, as below:
espn_wnba_scoreboard (season = 2020)
# Get schedule from date 2020-08-29
espn_wnba_scoreboard (season = "20200829")
```
