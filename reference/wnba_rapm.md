# **Fit a Ridge-Regression RAPM Model from WNBA Possession Data**

**Fit a Ridge-Regression RAPM Model from WNBA Possession Data**

**Fit a Ridge-Regression RAPM Model from WNBA Possession Data**

## Usage

``` r
wnba_rapm(possessions, ...)
```

## Arguments

- possessions:

  A possession-level stint matrix as produced by
  [`wnba_possession_lineups()`](https://wehoop.sportsdataverse.org/reference/wnba_possession_lineups.md),
  with columns `off_player_1` through `off_player_5`, `def_player_1`
  through `def_player_5` (integer WNBA Stats person IDs), and `points`
  (numeric, points scored on that possession).

- ...:

  Reserved for future keyword arguments (currently ignored).

## Value

Returns a `data.frame` with one row per player:

|  |  |  |
|----|----|----|
| col_name | types | description |
| player_id | integer | WNBA Stats person ID. Rows are sorted ascending by player_id. |
| o_rapm | numeric | Offensive RAPM (per-100-possession points added on offense). Positive = better offensive player. |
| d_rapm | numeric | Defensive RAPM (per-100-possession points saved on defense). Positive = better defensive player (sign is flipped so good defense is positive). |
| rapm | numeric | Total RAPM = o_rapm + d_rapm. Positive = net positive impact. |
| off_poss | integer | Number of possessions the player appeared on offense. |
| def_poss | integer | Number of possessions the player appeared on defense. |

Returns a 0-row frame with the same schema when input is empty or all
possessions have NA lineup cells (never-raise).

**Note:** RAPM is expressed in per-100-possession units. A **full
season** of possessions (~3,000–5,000) is needed for statistically
meaningful estimates. Results from a single game (~120–200 possessions)
are highly unstable and are provided here for pipeline illustration
only.

Results are **deterministic**: the cross-validation uses fixed,
construction-based folds (not random), so repeated calls on the same
possessions return identical output with no need to set a seed.

## See also

Other WNBA Lineup Functions:
[`wnba_gamerotation()`](https://wehoop.sportsdataverse.org/reference/wnba_gamerotation.md),
[`wnba_leaguedashlineups()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguedashlineups.md),
[`wnba_leaguelineupviz()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguelineupviz.md),
[`wnba_possession_lineups()`](https://wehoop.sportsdataverse.org/reference/wnba_possession_lineups.md),
[`wnba_shot_zones()`](https://wehoop.sportsdataverse.org/reference/wnba_shot_zones.md),
[`wnba_shotchartlineupdetail()`](https://wehoop.sportsdataverse.org/reference/wnba_shotchartlineupdetail.md),
[`wnba_teamdashlineups()`](https://wehoop.sportsdataverse.org/reference/wnba_teamdashlineups.md)

## Author

Saiem Gilani
