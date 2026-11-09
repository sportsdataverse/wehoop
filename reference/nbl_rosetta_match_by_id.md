# **NBL Rosetta Match by Id**

One match's header (the same body as nbl_rosetta_match): status, scores,
venue, season and teams.

Endpoint: `GET https://prod.rosetta.nbl.com.au/get/match/{match_id}`

## Usage

``` r
nbl_rosetta_match_by_id(match_id)
```

## Arguments

- match_id:

  (*character* required): DataCore fixture id of the match (match_id of
  nbl_rosetta_matches), a UUID, e.g.
  b217a699-4bef-11f0-bc08-933162362355.

## Value

A `wehoop_data` tibble (one row), with the same columns as
[`nbl_rosetta_match()`](https://wehoop.sportsdataverse.org/reference/nbl_rosetta_match.md)
(listed there).

Columns the body adds beyond these follow, in body order
(sportsdataverse-py keeps them too).

## Details

Source, terms of use, request pacing, seasons, ids, coverage and error
classes of this family: see the notes in
[`nbl_rosetta_seasons()`](https://wehoop.sportsdataverse.org/reference/nbl_rosetta_seasons.md).

     nbl_rosetta_match_by_id(match_id = "b217a699-4bef-11f0-bc08-933162362355")

## See also

[family_nbl_rosetta](https://wehoop.sportsdataverse.org/reference/family_nbl_rosetta.md)
lists every function in this family.
