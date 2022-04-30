---
title: load_wbb_player_box
sidebar_label: load_wbb_player_box
---
# `load_wbb_player_box`

Load wehoop women's college basketball player box scores


## Description

helper that loads multiple seasons from the data repo either into memory
 or writes it into a db using some forwarded arguments in the dots


## Usage

```r
load_wbb_player_box(seasons, ..., qs = FALSE)
```


## Arguments

Argument      |Description
------------- |----------------
`seasons`     |     A vector of 4-digit years associated with given women's college basketball seasons.
`...`     |     Additional arguments passed to an underlying function that writes the season data into a database (used by `update_wbb_db()` ).
`dbConnection`     |    A `DBIConnection` object, as returned by `DBI::dbConnect()`
`tablename`     |     The name of the player box data table within the database


## Examples

```r
future::plan("multisession")
load_wbb_player_box(2002:2021)
```
