---
title: load_wnba_schedule
description: helper that loads multiple seasons from the data repo either into memory
 or writes it into a db using some forwarded arguments in the dots
featured: true

recommended: null
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
`qs`     |     Wheter to use the function [`qs::qdeserialize()`](#qs::qdeserialize()) for more efficient loading.


## Examples

```r
future::plan("multisession")
load_wnba_schedule(2002:2021)
```
