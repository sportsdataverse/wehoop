# **Get W League Teams**

Every franchise (team_id) the site knows, all-star sides included.

Endpoint: `GET https://api.wjbl.01core.app/api/teams/base`

## Usage

``` r
wjbl_teams()
```

## Value

A `wehoop_data` tibble, one row per record; the columns are always
these, in this order (sportsdataverse-py `wjbl_teams`):

|  |  |  |
|----|----|----|
| col_name | type | description |
| team_id | integer | Franchise id team_id (key space: W League franchises, STABLE across seasons and sponsor renames: 13 = Toyota Antelopes, 12 = Denso Iris, 8 = ENEOS Sunflowers; all-star sides have their own ids, e.g. 591). The team_id of /team/roster and of the site's /team/roster/?team_id=. Not season_team_id. |
| team_name | character | Franchise name, Japanese or English (Fujitsu Red Wave; all-star side Team Sirius). |

## Details

Source, terms of use, request pacing, seasons, ids, coverage and error
classes of this family: see the notes in
[`wjbl_leagues()`](https://wehoop.sportsdataverse.org/reference/wjbl_leagues.md).

     wjbl_teams()

## See also

[family_wjbl](https://wehoop.sportsdataverse.org/reference/family_wjbl.md)
lists every function in this family.
