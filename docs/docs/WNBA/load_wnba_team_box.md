---
title: load_wnba_team_box
sidebar_label: load_wnba_team_box
---
# `load_wnba_team_box`

Load wehoop WNBA team box scores


## Description

helper that loads multiple seasons from the data repo either into memory
 or writes it into a db using some forwarded arguments in the dots


## Usage

```r
load_wnba_team_box(seasons, ..., qs = FALSE)
```


## Arguments

Argument      |Description
------------- |----------------
`seasons`     |     A vector of 4-digit years associated with given WNBA seasons.
`...`     |     Additional arguments passed to an underlying function that writes the season data into a database (used by `update_wnba_db()` ).
`dbConnection`     |    A `DBIConnection` object, as returned by `DBI::dbConnect()`
`tablename`     |     The name of the team box data table within the database


## Examples

```r
future::plan("multisession")
load_wnba_team_box(2002:2021)
```
