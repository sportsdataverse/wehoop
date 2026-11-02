# Women's International Basketball Data in R: FIBA, EuroLeague Women, WNBL, W League and More

**`wehoop` reaches well beyond the WNBA and NCAA: it wraps the official
data feeds behind FIBA’s national-team tournaments, Europe’s club
competitions, and domestic women’s leagues in Australia, Japan, France,
Great Britain, Germany, Spain, Turkey and Latin America.** This article
is a map of those functions: which league each family covers, how
seasons are numbered, and the function to call for a schedule,
play-by-play, box score or shot chart.

None of the code in this article is run when the site is built. Every
function here calls a live source, so copy the examples into your own
session.

## What you’ll learn

- Which `wehoop` family covers which league or competition.
- The common pattern every family follows: list the seasons, get a
  schedule, then pull a game.
- How each family numbers its seasons.
- Practical rules for calling these sources politely.

## The league map

| League or competition | Country or region | Prefix | Schedule | Play-by-play | Shots | Box scores |
|----|----|----|----|----|----|----|
| FIBA Women’s Basketball World Cup | Worldwide | `fiba_wwc_` | yes | yes | yes | player, team |
| Women’s Olympic Basketball Tournament | Worldwide | `fiba_woly_` | yes | yes | yes | player, team |
| FIBA Women’s EuroBasket | Europe | `fiba_weurobasket_` | yes | yes | yes | player, team |
| FIBA Women’s AmeriCup | Americas | `fiba_wamericup_` | yes | yes | yes | player, team |
| FIBA Women’s Asia Cup (Division A) | Asia and Oceania | `fiba_wasiacup_` | yes | yes | yes | player, team |
| FIBA Women’s AfroBasket | Africa | `fiba_wafrobasket_` | yes | yes | yes | player, team |
| EuroLeague Women | Europe (clubs) | `fiba_elw_` | yes | yes | yes | player, team |
| EuroCup Women | Europe (clubs) | `fiba_ecw_` | yes | yes | yes | player, team |
| Any FIBA competition | Worldwide | `fiba_gdap_`, `fiba_gamepage_` | yes | yes | yes | player, team |
| WNBL | Australia | `nbl_rosetta_` (`org = "wnbl"`, the default) | yes | yes |  | player, team, player by period |
| NBL1 (men’s and women’s conferences) | Australia | `nbl1_` (Atrium) or `nbl_rosetta_` (`org = "nbl1"`) | yes | yes | [`nbl1_shots()`](https://wehoop.sportsdataverse.org/reference/nbl1_competition.md) | player, team |
| W League (WJBL) | Japan | `wjbl_` | yes, by month | yes |  | player, team, by period |
| Ligue Feminine de Basket (LFB) | France | `lfb_` (Genius Sports) | yes | yes | yes | player, team |
| Women’s British Basketball League (WBBL) | Great Britain | `wbbl_` (Genius Sports) | yes | yes | yes | player, team |
| DBBL (Damen-Basketball-Bundesliga) | Germany | `scb_` (`league = "dbbl"`, the default) | yes | [`scb_game_actions()`](https://wehoop.sportsdataverse.org/reference/scb_game_actions.md) |  | player, team |
| Liga Femenina Endesa and other FEB competitions | Spain | `feb_` (`group = 4`, the default) | yes | yes | yes | player |
| KBSL (Kadinlar Basketbol Super Ligi) | Turkey | `tbf_` (`competition = "kbsl"`, the default) | yes | yes | yes | player, team |
| LNBP Femenil (with LNBP and Copa Value) | Mexico | `lnbp_` (Atrium) | yes | yes | yes | player, team |
| Liga Mayor de Baloncesto | El Salvador | `lmb_` (Atrium) | yes | yes | yes | player, team |
| LPB / LPBF | Panama | `lpb_` (Atrium) | yes | yes | yes | player, team |

Notes on the table:

- **“Both” sites.** The Atrium sites (`lnbp_`, `nbl1_`, `lmb_`, `lpb_`)
  host men’s and women’s competitions side by side. List them with the
  `*_seasons()` function and pass the women’s `competition_id` (or
  `season_id`) to the schedule, standings and teams functions.
- **LFB coverage.** Genius Sports hosts only the 2018 and 2019 LFB
  seasons.
- **TBF and FEB coverage.** TBF serves play-by-play and shots for
  finished games from the 2025-26 season. FEB `group` is the site’s menu
  group (1 Primera FEB, 2 Segunda FEB, 4 Liga Femenina Endesa, 9 and 10
  LF-2, 67 LF Challenge, 73 Copa de Espana, 74 Liga U), not a
  competition id.
- **Shot charts.** The WNBL Rosetta, W League and SCB feeds have no shot
  locations.

Each family’s reference page lists every function and its returned
columns:
[FIBA](https://wehoop.sportsdataverse.org/reference/index.html#fiba),
[FIBA
competitions](https://wehoop.sportsdataverse.org/reference/index.html#fiba-competitions),
[Genius
Sports](https://wehoop.sportsdataverse.org/reference/index.html#genius-sports),
[Genius
competitions](https://wehoop.sportsdataverse.org/reference/index.html#genius-competitions),
[Atrium](https://wehoop.sportsdataverse.org/reference/index.html#atrium-sportradar-),
[Atrium
competitions](https://wehoop.sportsdataverse.org/reference/index.html#atrium-competitions),
[NBL / WNBL
(Rosetta)](https://wehoop.sportsdataverse.org/reference/index.html#nbl-wnbl-rosetta-),
[SCB
(DBBL)](https://wehoop.sportsdataverse.org/reference/index.html#scb-dbbl-),
[FEB](https://wehoop.sportsdataverse.org/reference/index.html#feb),
[TBF](https://wehoop.sportsdataverse.org/reference/index.html#tbf) and
[WJBL](https://wehoop.sportsdataverse.org/reference/index.html#wjbl).
The whole group is the [International
Basketball](https://wehoop.sportsdataverse.org/reference/index.html#international-basketball)
section of the reference.

## How are the families built?

Most of these families sit on a handful of shared data engines:

- **FIBA GDAP** (`fiba_gdap_*()`) is FIBA’s data API for national-team
  events and FIBA club competitions; `fiba_gamepage_*()` reads the
  per-game pages of fiba.basketball.
- **Genius Sports** (`genius_*()`) hosts LiveStats and widget feeds for
  many federations; `org` picks the league.
- **Atrium** (`atrium_*()`, Sportradar) runs league stats sites;
  `website_id` picks the site.
- The rest (`nbl_rosetta_*()`, `scb_*()`, `feb_*()`, `tbf_*()`,
  `wjbl_*()`) each wrap one league’s own feed.

The per-competition prefixes (`fiba_wwc_`, `wbbl_`, `lnbp_` and so on)
are thin aliases.
[`fiba_wwc_schedule()`](https://wehoop.sportsdataverse.org/reference/fiba_wwc_competition.md)
is
[`fiba_gdap_schedule()`](https://wehoop.sportsdataverse.org/reference/fiba_gdap_schedule.md)
with the Women’s World Cup filled in;
[`wbbl_pbp()`](https://wehoop.sportsdataverse.org/reference/wbbl_competition.md)
is
[`genius_pbp()`](https://wehoop.sportsdataverse.org/reference/genius_pbp.md);
[`lnbp_shots()`](https://wehoop.sportsdataverse.org/reference/lnbp_competition.md)
is
[`atrium_shots()`](https://wehoop.sportsdataverse.org/reference/atrium_shots.md)
with the LNBP site id. Use the alias when it exists. Use the base engine
when you need a competition without one.

Every alias family follows the same three steps:

1.  List what exists: `*_editions()`, `*_seasons()` or
    `*_competitions()`.
2.  Get the schedule for a season, which returns game ids.
3.  Pass a game id to `*_pbp()`, `*_shots()`, `*_player_box()` or
    `*_team_box()`.

## How are seasons numbered?

Season labels follow the convention of each source, so check before you
loop.

| Family | `season` means | Example |
|----|----|----|
| FIBA tournaments (`fiba_wwc_`, `fiba_woly_`, `fiba_weurobasket_`, `fiba_wamericup_`, `fiba_wasiacup_`, `fiba_wafrobasket_`) | The event year | `2024` is Paris 2024 |
| EuroLeague Women, EuroCup Women (`fiba_elw_`, `fiba_ecw_`) | The **ending** year | `2025` is 2024-25 |
| WBBL, LFB | The ending year | `2026` is 2025-26 |
| WNBL (`nbl_rosetta_`) | The ending year | `2026` is 2025-26 |
| NBL1, LNBP, LMB, LPB | The calendar year | `2025` |
| W League (`wjbl_`) | The ending year | `2026` is 2025-26 |
| DBBL (`scb_`) | The ending year | `2026` is 2025-26 |
| FEB, TBF | The ending year | `2026` is 2025-26 |

## FIBA: World Cup, Olympics and continental championships

``` r

library(wehoop)

# Every edition of the Women's World Cup the API knows about
fiba_wwc_editions()

# The 2022 tournament (Sydney)
wwc_2022 <- fiba_wwc_schedule(season = 2022)

# One game: play-by-play, shot chart and box scores
game_id <- wwc_2022$game_id[1]
fiba_wwc_pbp(game_id, season = 2022)
fiba_wwc_shots(game_id, season = 2022)
fiba_wwc_player_box(game_id, season = 2022)

# Final standings and teams
fiba_wwc_standings(season = 2022)
fiba_wwc_teams(season = 2022)
```

The Olympics and the continental championships work the same way:

``` r

fiba_woly_schedule(season = 2024)          # Paris 2024
fiba_weurobasket_schedule(season = 2025)
fiba_wamericup_schedule(season = 2025)
fiba_wasiacup_schedule(season = 2025)
fiba_wafrobasket_schedule(season = 2025)
```

## EuroLeague Women and EuroCup Women

FIBA runs both European club competitions, so they share the FIBA
aliases. Their `season` is the year the season ends.

``` r

elw <- fiba_elw_schedule(season = 2025)      # 2024-25
fiba_elw_standings(season = 2025)
fiba_elw_pbp(elw$game_id[1], season = 2025)

fiba_ecw_schedule(season = 2025)             # EuroCup Women 2024-25
```

For any FIBA competition without an alias, find its edition and call the
base engine directly:
[`fiba_gdap_editions()`](https://wehoop.sportsdataverse.org/reference/fiba_gdap_editions.md)
takes a competition family id and returns the editions;
`fiba_gdap_schedule(comp = ...)` takes an edition id.

## Australia: WNBL and NBL1

The Rosetta functions default to the WNBL.

``` r

nbl_rosetta_seasons()                          # WNBL seasons
wnbl <- nbl_rosetta_matches(season = 2026)     # 2025-26
match_id <- wnbl$match_id[1]
nbl_rosetta_match_pbp(match_id)
nbl_rosetta_match_player_box(match_id)
nbl_rosetta_standings(season = 2026)

# NBL1, the second tier, has women's conferences on two feeds
nbl_rosetta_matches(season = 2025, org = "nbl1")
nbl1_seasons()        # Atrium site: pick a women's competition_id here
```

## Japan: the W League

The W League schedule is paged by month. List the months, then loop.

``` r

wjbl_leagues()
months <- wjbl_game_months(season = 2026)
games <- wjbl_schedule(season = 2026, game_month = months$game_month[1])

id <- games$play_schedule_id[1]
wjbl_pbp(id)
wjbl_box_score(id)
wjbl_team_box_score(id)
```

The source is in Japanese (team names, phases, play descriptions); the
column documentation translates the vocabulary.

## France and Great Britain: LFB and WBBL

Both run on Genius Sports.

``` r

wbbl_competitions()
wbbl_sched <- wbbl_schedule(season = 2026)
wbbl_pbp(wbbl_sched$match_id[1])
wbbl_shots(wbbl_sched$match_id[1])

lfb_schedule(season = 2019)    # Genius hosts the 2018 and 2019 LFB seasons
```

`genius_competitions(org = ...)` and `genius_schedule(org, comp_id)`
reach other Genius-hosted leagues.

## Germany, Spain and Turkey

``` r

# Germany: DBBL (the default league for the scb_ family)
dbbl <- scb_games(season = 2026)
scb_game_actions(dbbl$game_id[1])
scb_game_players(dbbl$game_id[1])
scb_standings(season = 2026)

# Spain: Liga Femenina Endesa (group 4, the default)
lf <- feb_schedule(season = 2026)
feb_pbp(lf$game_id[1])
feb_shots(lf$game_id[1])
feb_player_box(lf$game_id[1])

# Turkey: KBSL (the default competition)
kbsl <- tbf_schedule(season = 2026)
tbf_pbp(kbsl$match_id[1])
tbf_shots(kbsl$match_id[1])
tbf_standings(season = 2026)
```

## Latin America: Mexico, El Salvador and Panama

These Atrium sites carry men’s and women’s competitions. Find the
women’s competition first.

``` r

lnbp_seasons()     # look for the LNBP Femenil competition_id
femenil <- lnbp_schedule(season = 2025, competition_id = "<competition_id>")
lnbp_pbp(femenil$fixture_id[1])
lnbp_shots(femenil$fixture_id[1])

lmb_seasons()      # El Salvador
lpb_seasons()      # Panama (LPB and the women's LPBF)
```

## How do I call these sources politely?

- **Go slowly.** The international runtimes wait at least one second
  between requests to the same host. Do not wrap them in parallel loops.
- **Expect classed errors.** A game with no data raises a
  `wehoop_no_data` condition, a bad argument raises
  `wehoop_bad_request`, and anything else raises `wehoop_asset_fetch`.
  Wrap loops in [`tryCatch()`](https://rdrr.io/r/base/conditions.html)
  so one missing game does not stop the run.
- **Finished games only.** Several feeds (TBF, the W League) serve only
  final games and check that the answer matches the game you asked for.
- **Check the terms before you republish.** Some sources are unofficial
  uses of public sites. The SCB (BBL and DBBL) and W League reference
  pages quote the relevant site notices; read them before you store or
  share the data.
- **No release files.** Unlike the WNBA and NCAA, these leagues have no
  `load_*()` release loaders. Save what you pull.

## Where to go next

- [Getting
  Started](https://wehoop.sportsdataverse.org/articles/getting-started-wehoop.md):
  the package layout and the glossary.
- [Shot
  charts](https://wehoop.sportsdataverse.org/articles/wnba-womens-college-basketball-shot-charts.md):
  the plotting recipes there work for any `*_shots()` output once the
  coordinates are on a court frame. FIBA courts are drawn in meters with
  `sportyR::geom_basketball("fiba")`.
- [Advanced
  metrics](https://wehoop.sportsdataverse.org/articles/womens-basketball-advanced-metrics.md):
  the box score formulas apply to any league’s box scores.
- The [International
  Basketball](https://wehoop.sportsdataverse.org/reference/index.html#international-basketball)
  section of the function reference.
