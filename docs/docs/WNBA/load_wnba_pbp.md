---
title: load_wnba_pbp
sidebar_label: load_wnba_pbp
---
# `load_wnba_pbp`

Load wehoop WNBA play-by-play


## Description

helper that loads multiple seasons from the data repo either into memory
 or writes it into a db using some forwarded arguments in the dots


## Usage

```r
load_wnba_pbp(seasons, ..., qs = FALSE)
```


## Arguments

Argument      |Description
------------- |----------------
`seasons`     |     A vector of 4-digit years associated with given women's college basketball seasons.
`...`     |     Additional arguments passed to an underlying function that writes the season data into a database (used by `update_wnba_db()` ).
`dbConnection`     |    A `DBIConnection` object, as returned by `DBI::dbConnect()`
`tablename`     |     The name of the play by play data table within the database

## Value

A dataframe with 42 columns
  
## Examples

```r
future::plan("multisession")
load_wnba_pbp(2002:2021)
```


