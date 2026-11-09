# **FIBA GDAP: games between**

Games of EVERY FIBA competition in a local-time window (how competitions
and games are discovered).

Endpoint:
`GET https://digital-api.fiba.basketball/hapi/getgdapgamesbetweentwodates`

## Usage

``` r
fiba_gdap_games_between(date_from, date_to, return_parsed = TRUE)
```

## Arguments

- date_from:

  (character, required) Required. Window start as YYYY-MM-DD, compared
  with the venue-local gameDateTime (not UTC).

- date_to:

  (character, required) Required. Window end as YYYY-MM-DD, EXCLUSIVE
  (date_from = date_to returns nothing).

- return_parsed:

  Parse the payload into a tibble (default `TRUE`); `FALSE` returns the
  raw JSON list.

## Value

A `wehoop_data` tibble (the raw JSON list when `return_parsed = FALSE`),
with the same columns as
[`fiba_gdap_federation_games()`](https://wehoop.sportsdataverse.org/reference/fiba_gdap_federation_games.md)
(listed there).

## Details

Source, terms of use, request pacing, seasons, ids, coverage and error
classes of this family: see the notes in
[`fiba_gdap_awards()`](https://wehoop.sportsdataverse.org/reference/fiba_gdap_awards.md).

     fiba_gdap_games_between(date_from = "2023-09-08", date_to = "2023-09-11")

## See also

[family_fiba](https://wehoop.sportsdataverse.org/reference/family_fiba.md)
lists every function in this family.
