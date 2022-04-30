---
title: load_wnba_schedule
sidebar_label: load_wnba_player_box
---
# `load_wnba_schedule`

Load wehoop WNBA schedules


## Description

helper that loads multiple seasons from the data repo either into memory
 or writes it into a db using some forwarded arguments in the dots


## Usage

```r
load_wnba_schedule(seasons, ..., qs = FALSE)
```


## Arguments

Argument      |Description
------------- |----------------
`seasons`     |     A vector of 4-digit years associated with given WNBA seasons.
`...`     |     Additional arguments passed to an underlying function that writes the season data into a database (used by `update_wnba_db()` ).
`dbConnection`     |    A `DBIConnection` object, as returned by `DBI::dbConnect()`
`tablename`     |     The name of the schedule data table within the database


## Examples

```r
future::plan("multisession")
load_wnba_schedule(2002:2021)
```
