# **Build/update wehoop WNBA Stats database**

`update_wnba_stats_db()` writes one or more WNBA Stats API datasets into
a database. Mirrors the WNBA / WBB `update_*_db()` shape but points at
the `load_wnba_stats_*` family. Each dataset is written to its own
table, named `wnba_stats_<dataset>`.

## Usage

``` r
update_wnba_stats_db(
  dbdir = ".",
  dbname = "wehoop_db",
  datasets = NULL,
  seasons = TRUE,
  db_connection = NULL
)
```

## Arguments

- dbdir:

  Directory in which the database is or shall be located.

- dbname:

  File name of an existing or desired SQLite database within `dbdir`.

- datasets:

  Character vector of dataset shortnames (see Details).

- seasons:

  Optional integer vector of seasons to load. Defaults to all available
  seasons (`seasons = TRUE`).

- db_connection:

  A `DBIConnection` object. When supplied, `dbdir` and `dbname` are
  ignored.

## Value

Invisibly returns `TRUE` on success.

## Details

Unlike
[`update_wnba_db()`](https://wehoop.sportsdataverse.org/reference/update_wnba_db.md)
/
[`update_wbb_db()`](https://wehoop.sportsdataverse.org/reference/update_wbb_db.md),
there is no historical "play-by-play table" default to preserve, so
`datasets` is required.

Valid `datasets` values: `"rosters"`, `"coaches"`, `"player_stats"`,
`"lineups"`, `"team_stats"`, `"standings"`, `"draft"`, `"shots"`,
`"game_rosters"`, `"officials"`.
