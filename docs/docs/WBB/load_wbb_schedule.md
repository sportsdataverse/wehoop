---
title: load_wbb_schedule
sidebar_label: load_wbb_schedule
---
# `load_wbb_schedule`

Load wehoop women's college basketball schedule


## Description

helper that loads multiple seasons from the data repo either into memory
 or writes it into a db using some forwarded arguments in the dots


## Usage

```r
load_wbb_schedule(seasons, ..., qs = FALSE)
```


## Arguments

Argument      |Description
------------- |----------------
`seasons`     |     A vector of 4-digit years associated with given women's college basketball seasons.
`...`     |     Additional arguments passed to an underlying function that writes the season data into a database (used by `update_wbb_db()` ).
`qs`     |     Wheter to use the function [`qs::qdeserialize()`](#qs::qdeserialize()) for more efficient loading.


## Examples

```r
future::plan("multisession")
load_wbb_schedule(2002:2021)
```


