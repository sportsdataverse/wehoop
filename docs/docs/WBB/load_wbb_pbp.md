---
title: load_wbb_pbp
sidebar_label: load_wbb_pbp
---
# `load_wbb_pbp`

Load wehoop women's college basketball play-by-play


## Description

Helper that loads multiple seasons from the data repo either into memory
 or writes it into a db using some forwarded arguments in the dots


## Usage

```r
load_wbb_pbp(seasons, ..., qs = FALSE)
```


## Arguments

Argument      |Description
------------- |----------------
`seasons`     |     A vector of 4-digit years associated with given women's college basketball seasons.
`...`     |     Additional arguments passed to an underlying function that writes the season data into a database (used by `update_wbb_db()` ).
`qs`     |     Wheter to use the function [`qs::qdeserialize()`](#qs::qdeserialize()) for more efficient loading.


## Value

A dataframe with 55 columns

## Examples

```r
future::plan("multisession")
load_wbb_pbp(2002:2021)
```


