# ESPN basketball endpoints -- WBB & WNBA

## What this vignette covers

If you’ve used `wehoop` before, you’ve probably reached for
[`espn_wbb_pbp()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_pbp.md),
[`espn_wnba_pbp()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_pbp.md),
and the box score wrappers. Those get you the bulk of any analysis built
around individual games. The package now also wraps a much wider slice
of ESPN’s basketball API – team rosters, schedules, league news, athlete
biographies and gamelogs, in-game win probabilities, officials,
broadcast info, the WNBA draft, free agency, transactions, and
league-wide catalogs of venues, coaches, and statistical leaders. Eighty
ESPN endpoint wrappers in total, split roughly evenly between women’s
college basketball (`espn_wbb_*`) and the WNBA (`espn_wnba_*`).

This vignette is a tour of what’s available and how to compose the
pieces. None of the chunks evaluate during `R CMD check` – they all hit
the live ESPN API – but every one of them works when you copy it into an
interactive session.

## A note on the API surface

ESPN exposes basketball data through three public, unauthenticated API
hosts, and `wehoop` reaches into each:

- **`site.api.espn.com/apis/site/v2/sports/basketball/{league}`** is the
  most stable. It serves scoreboards, teams, rosters, schedules, news,
  injuries, standings, and player and team season stats.
- **`sports.core.api.espn.com/v2/sports/basketball/{league}`** carries
  the deeper resources: athlete indexes, per-event detail (odds, win
  probabilities, officials, broadcasts), seasons, venues, coaches, the
  WNBA draft, and transactions. Big collections paginate via `$ref`
  links.
- **`site.web.api.espn.com/apis/common/v3/sports/basketball/{league}`**
  carries per-athlete deep detail – season overview, stats by category,
  game-by-game logs, situational splits. It’s the least stable of the
  three; older seasons sometimes return 404, and not every athlete is
  represented.

There’s a fourth host (`cdn.espn.com/core`) that surfaces the same
information as the site-v2 `/summary` endpoint we already parse, so we
don’t wrap it.

The league slugs in URL paths are `womens-college-basketball` and
`wnba`. Those only matter if you’re building requests by hand.

**Rate limits.** ESPN doesn’t publish them. In practice, requests
arriving faster than about one per second occasionally come back as HTTP
429 or as silently empty payloads. If you’re looping over many games or
athletes, drop a `Sys.sleep(1)` between calls.

**Proxies.** ESPN wrappers don’t accept a per-call `proxy =` argument;
they call into the package’s HTTP layer directly. Set the proxy once at
the top of your session with
`options(wehoop.proxy = "http://host:port")` (or a list, for
authenticated proxies) and every ESPN call will pick it up
automatically.

## What’s available, by use case

The tables below are grouped by what you’re likely trying to do.
Function names are clickable on the pkgdown reference.

### Game data

These all key off `game_id` (also called `event_id` in some endpoints –
they’re the same thing).

| Function | Returns |
|----|----|
| [`espn_wbb_game_all()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_game_all.md) / [`espn_wnba_game_all()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_all.md) | Full game summary as a named list |
| [`espn_wbb_pbp()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_pbp.md) / [`espn_wnba_pbp()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_pbp.md) | Play-by-play |
| [`espn_wbb_team_box()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_team_box.md) / [`espn_wnba_team_box()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team_box.md) | Team box score |
| [`espn_wbb_player_box()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_player_box.md) / [`espn_wnba_player_box()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_player_box.md) | Player box score |
| [`espn_wbb_game_rosters()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_game_rosters.md) / [`espn_wnba_game_rosters()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_rosters.md) | Game-day rosters |

### Scoreboard, conferences, and league reference

| Function | Returns |
|----|----|
| [`espn_wbb_scoreboard()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_scoreboard.md) / [`espn_wnba_scoreboard()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_scoreboard.md) | Daily scoreboard |
| [`espn_wbb_teams()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_teams.md) / [`espn_wnba_teams()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_teams.md) | All teams |
| [`espn_wbb_conferences()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_conferences.md) / [`espn_wnba_conferences()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_conferences.md) | Conferences |
| [`espn_wbb_rankings()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_rankings.md) | AP / coaches poll (WBB only – WNBA has no poll) |
| [`espn_wbb_standings()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_standings.md) / [`espn_wnba_standings()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_standings.md) | Conference / league standings |
| [`espn_wbb_news()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_news.md) / [`espn_wnba_news()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_news.md) | League-wide news feed |
| [`espn_wbb_calendar()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_calendar.md) / [`espn_wnba_calendar()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_calendar.md) | Season calendar weeks |

### Team detail

| Function | Returns |
|----|----|
| [`espn_wbb_team()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_team.md) / [`espn_wnba_team()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team.md) | Single-team info, record, coaches |
| [`espn_wbb_team_roster()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_team_roster.md) / [`espn_wnba_team_roster()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team_roster.md) | Roster |
| [`espn_wbb_team_schedule()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_team_schedule.md) / [`espn_wnba_team_schedule()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team_schedule.md) | Schedule |
| [`espn_wbb_team_leaders()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_team_leaders.md) / [`espn_wnba_team_leaders()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team_leaders.md) | Statistical leaders |
| [`espn_wbb_team_news()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_team_news.md) / [`espn_wnba_team_news()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team_news.md) | Team news feed |
| [`espn_wbb_team_stats()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_team_stats.md) / [`espn_wnba_team_stats()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team_stats.md) | Team-level season stats |
| [`espn_wbb_team_injuries()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_team_injuries.md) / [`espn_wnba_team_injuries()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team_injuries.md) | Team injury report |
| [`espn_wbb_injuries()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_injuries.md) / [`espn_wnba_injuries()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_injuries.md) | League-wide injury report |

### Athlete detail

| Function | Returns |
|----|----|
| [`espn_wbb_athlete_info()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_athlete_info.md) / [`espn_wnba_athlete_info()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_athlete_info.md) | Bio and profile |
| [`espn_wbb_athlete_overview()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_athlete_overview.md) / [`espn_wnba_athlete_overview()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_athlete_overview.md) | Season overview (web-common-v3) |
| [`espn_wbb_athlete_stats()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_athlete_stats.md) / [`espn_wnba_athlete_stats()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_athlete_stats.md) | Season stats by category |
| [`espn_wbb_athlete_gamelog()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_athlete_gamelog.md) / [`espn_wnba_athlete_gamelog()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_athlete_gamelog.md) | Game-by-game log |
| [`espn_wbb_athlete_splits()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_athlete_splits.md) / [`espn_wnba_athlete_splits()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_athlete_splits.md) | Situational splits |
| [`espn_wbb_athlete_eventlog()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_athlete_eventlog.md) / [`espn_wnba_athlete_eventlog()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_athlete_eventlog.md) | Event log (`$ref` links) |
| [`espn_wbb_athlete_awards()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_athlete_awards.md) / [`espn_wnba_athlete_awards()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_athlete_awards.md) | Awards history |
| [`espn_wbb_athlete_statisticslog()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_athlete_statisticslog.md) / [`espn_wnba_athlete_statisticslog()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_athlete_statisticslog.md) | Stats log (core-v2) |
| [`espn_wbb_player_stats()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_player_stats.md) / [`espn_wnba_player_stats()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_player_stats.md) | Cross-athlete season stats |

### Per-event enrichment

These take an `event_id` and complement the play-by-play.

| Function | Returns |
|----|----|
| [`espn_wbb_event_odds()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_event_odds.md) / [`espn_wnba_event_odds()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_event_odds.md) | Opening / closing lines (WNBA only – empty for WBB) |
| [`espn_wbb_event_probabilities()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_event_probabilities.md) / [`espn_wnba_event_probabilities()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_event_probabilities.md) | Win probability per play |
| [`espn_wbb_event_officials()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_event_officials.md) / [`espn_wnba_event_officials()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_event_officials.md) | Officials |
| [`espn_wbb_event_broadcasts()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_event_broadcasts.md) / [`espn_wnba_event_broadcasts()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_event_broadcasts.md) | Broadcast outlets |

### League-wide catalogs

| Function | Returns |
|----|----|
| [`espn_wbb_leaders()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_leaders.md) / [`espn_wnba_leaders()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_leaders.md) | League statistical leaders |
| [`espn_wbb_venues()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_venues.md) / [`espn_wnba_venues()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_venues.md) | Arenas |
| [`espn_wbb_coaches()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_coaches.md) / [`espn_wnba_coaches()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_coaches.md) | Coaches |
| [`espn_wbb_athletes_index()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_athletes_index.md) / [`espn_wnba_athletes_index()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_athletes_index.md) | Full athlete index |
| [`espn_wbb_seasons()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_seasons.md) / [`espn_wnba_seasons()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_seasons.md) | Seasons on record |
| [`espn_wbb_season_info()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_season_info.md) / [`espn_wnba_season_info()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_season_info.md) | Single-season metadata |

### WNBA-only

The pro-league side has draft, free agency, and transaction logs that
don’t have NCAA equivalents.

| Function | Returns |
|----|----|
| [`espn_wnba_draft()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_draft.md) | Draft picks by season |
| [`espn_wnba_freeagents()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_freeagents.md) | Free agents (during the FA window) |
| [`espn_wnba_transactions()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_transactions.md) | Transactions log |

## Worked examples

The examples below use UConn (`team_id = 2509`) for WBB and the Las
Vegas Aces (`team_id = 17`) for the WNBA. Most ESPN team IDs and athlete
IDs are easy to discover with
[`espn_wbb_teams()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_teams.md)
/
[`espn_wnba_teams()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_teams.md)
and the various roster endpoints.

### Browsing news and the season calendar

When you’re starting a new analysis, the easiest way to confirm the
season is active and you’re hitting current data is to pull the news
feed and the calendar.

``` r

library(wehoop)

# Latest 10 WBB news items
wbb_news <- espn_wbb_news(limit = 10)
head(wbb_news[, c("headline", "published")])

# 2025 WBB season calendar
wbb_cal <- espn_wbb_calendar(season = 2025)
head(wbb_cal)

# Same on the WNBA side
wnba_news <- espn_wnba_news(limit = 10)
wnba_cal  <- espn_wnba_calendar(season = 2025)
```

The calendar tibble carries one row per scheduling block (preseason,
regular season, postseason, championship weeks, etc.), with start and
end dates. It’s useful for filtering schedules and scoreboards down to a
specific portion of the year.

### Looking at a team

[`espn_wbb_team()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_team.md)
and
[`espn_wnba_team()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team.md)
return a small named list with high-level identity, record, next event,
and coaching info. Pair it with the roster, schedule, and team-leader
wrappers when you want a fuller picture.

``` r

# UConn at a glance
uconn <- espn_wbb_team(team_id = 2509, season = 2025)
names(uconn)        # Info, Record, NextEvent, StandingSummary, Coaches

# Current roster
uconn_roster <- espn_wbb_team_roster(team_id = 2509, season = 2025)
head(uconn_roster[, c("athlete_display_name", "position_name", "jersey")])

# Regular-season schedule
uconn_sched <- espn_wbb_team_schedule(
  team_id = 2509, season = 2025, season_type = 2
)
head(uconn_sched[, c("name", "date", "home_away", "score")])

# Statistical leaders for the team
uconn_ldrs <- espn_wbb_team_leaders(team_id = 2509, season = 2025)
head(uconn_ldrs)
```

The same shape applies to WNBA teams – `espn_wnba_team(17, 2025)` for
the Aces, plus `_team_roster()`, `_team_schedule()`, and so on.

A small caveat on the roster and leaders endpoints: ESPN serves only the
*current* roster and leaders for each team, regardless of any `season`
you pass. The argument is preserved in the function signature for API
symmetry, but it doesn’t change the request URL.

### Tracking injuries

Injury data is a soft spot in ESPN’s WBB coverage – most college games
don’t carry an active injury report. WNBA injuries are more reliably
populated when the league is in season.

``` r

# Whole league
wnba_inj <- espn_wnba_injuries(season = 2025)

# Single team
aces_inj <- espn_wnba_team_injuries(team_id = 17)

# WBB injuries are sparse on ESPN -- an empty tibble is the normal case
wbb_inj <- espn_wbb_injuries(season = 2025)
```

If you’re building a workflow that depends on injury data, gate
downstream code on `nrow(...) > 0`.

### Following an athlete

The athlete endpoints are the deepest part of the surface. Pull a
roster, pick a player, and you have biographical data, season-level
totals, a per-game log, situational splits, and an awards history all
keyed off the same `athlete_id`.

``` r

library(dplyr)

uconn_roster <- espn_wbb_team_roster(team_id = 2509, season = 2025)

athlete_id   <- uconn_roster$athlete_id[1]
athlete_name <- uconn_roster$athlete_display_name[1]
message("Selected: ", athlete_name, " (", athlete_id, ")")

# Bio and profile
bio <- espn_wbb_athlete_info(athlete_id = athlete_id)
glimpse(bio)

# Season overview (web-common-v3)
overview <- espn_wbb_athlete_overview(
  athlete_id = athlete_id, season = 2025
)
names(overview)

# Game-by-game log
gamelog <- espn_wbb_athlete_gamelog(
  athlete_id = athlete_id, season = 2025
)
head(gamelog[, c("game_date", "opponent", "points", "rebounds", "assists")])

# Situational splits (home/away, by month, vs ranked, ...)
splits <- espn_wbb_athlete_splits(
  athlete_id = athlete_id, season = 2025
)
head(splits)
```

Everything above works the same on the WNBA side – swap `espn_wbb_*` for
`espn_wnba_*` and use a WNBA `athlete_id` (A’ja Wilson is `"3149391"`).

A few things to know about the athlete endpoints:

- `espn_*_athlete_eventlog()` returns `$ref` URL columns rather than
  parsed game stats. Reach for `espn_*_athlete_gamelog()` if you want
  per-game numbers in tibble form.
- `espn_*_athlete_awards()` is sparse. Many athletes have no
  ESPN-recorded awards, so an empty tibble is normal.
- The web-common-v3 endpoints (`_athlete_overview`, `_athlete_stats`,
  `_athlete_gamelog`, `_athlete_splits`) are less stable than the rest
  of the surface. Some seasons before roughly 2018 return HTTP 404, and
  not every athlete is in the index.

### Charting win probability

The combination of `_pbp()` and `_event_probabilities()` is the quickest
way to chart a game’s momentum. Event `'401736171'` below is a 2024 WNBA
regular-season game.

``` r

library(wehoop)
library(dplyr)
library(ggplot2)

game_id <- "401736171"

pbp   <- espn_wnba_pbp(game_id = game_id)
probs <- espn_wnba_event_probabilities(event_id = game_id, limit = 200)

plot_data <- probs %>%
  mutate(seq = as.integer(sequence_number)) %>%
  arrange(seq)

ggplot(plot_data, aes(x = seq, y = as.numeric(home_win_percentage))) +
  geom_line(color = "#221A4D", linewidth = 0.8) +
  geom_hline(yintercept = 0.5, linetype = "dashed", color = "grey50") +
  labs(
    title = paste("Win probability --", game_id),
    x = "Play sequence",
    y = "Home team win probability"
  ) +
  theme_minimal()
```

You can layer in scoring plays from `pbp` to label momentum swings, or
join `_event_officials()` and `_event_broadcasts()` if you want
contextual annotations.

``` r

# Pre-game odds (populated when ESPN carries lines)
odds <- espn_wnba_event_odds(event_id = game_id)

# Officials
officials <- espn_wnba_event_officials(event_id = game_id)
officials[, c("full_name", "position")]

# Broadcast outlets
broadcasts <- espn_wnba_event_broadcasts(event_id = game_id)
broadcasts[, c("market", "names")]
```

ESPN doesn’t carry betting lines for NCAA games, so
[`espn_wbb_event_odds()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_event_odds.md)
always returns an empty tibble. The function exists for API symmetry;
it’s not a bug. Win probabilities, officials, and broadcasts are all
populated for both leagues.

### Working with the WNBA draft and transactions

The draft, free agency, and transaction logs only exist on the WNBA side
– the NCAA doesn’t have a pro-style draft on ESPN, and the transfer
portal isn’t part of ESPN’s basketball API.

``` r

# 2025 WNBA draft picks
draft_2025 <- espn_wnba_draft(season = 2025)
head(draft_2025[, c("pick", "round", "team_name", "athlete_display_name")])

# Recent transactions (waivers, trades, signings)
txn <- espn_wnba_transactions(season = 2025, limit = 100)
head(txn[, c("date", "type", "athlete_display_name", "team_name")])

# Free agents -- empty outside the FA window, which is roughly
# January through April each year
fa <- espn_wnba_freeagents(season = 2025)
nrow(fa)
```

If you’re stitching together a roster history, the natural sequence is
draft -\> free agents -\> transactions, joined on `athlete_id`.

### Browsing league-wide catalogs

Sometimes you don’t have a specific team or athlete in mind – you want
the league-wide leaderboard, every venue, every coach, or the full
athlete index. The catalog endpoints cover that.

``` r

# Statistical leaders (points, rebounds, assists, ...)
wnba_ldrs <- espn_wnba_leaders(season = 2024, season_type = 2)
head(wnba_ldrs)

# Every WNBA arena ESPN tracks
wnba_venues <- espn_wnba_venues()
head(wnba_venues[, c("full_name", "city", "state", "capacity")])

# Coaches (current season)
wbb_coaches <- espn_wbb_coaches(season = 2025)
head(wbb_coaches[, c("full_name", "team_name", "experience")])
```

The athlete index is the largest of the catalog endpoints – expect
6,000+ rows for a recent WBB season. Pagination is handled internally,
but for exploratory pulls you’ll usually want a small `limit`.

``` r

# WNBA -- a couple hundred active players
wnba_athletes <- espn_wnba_athletes_index(
  season = 2025, active = TRUE, limit = 5000
)
nrow(wnba_athletes)
head(wnba_athletes[, c("display_name", "position_name", "team_name")])

# WBB -- cap at 50 rows just to peek; the default limit is 25,000
wbb_athletes <- espn_wbb_athletes_index(season = 2025, limit = 50)
head(wbb_athletes[, c("display_name", "position_name", "team_name")])
```

The seasons catalog is mostly handy when you want to know which years
ESPN has on record before you start a multi-season pull.

``` r

wnba_seasons <- espn_wnba_seasons()
head(wnba_seasons[, c("year", "start_date", "end_date")])

# Single-season metadata is mostly $ref URLs to sub-resources, so
# espn_*_seasons() is usually the more useful starting point
wnba_s2025 <- espn_wnba_season_info(season = 2025)
```

## What’s not here

A few endpoints exist on ESPN but are deliberately not wrapped:

| Endpoint | Why we skip it |
|----|----|
| `/teams/{id}/depth-charts` | ESPN basketball doesn’t carry depth charts |
| `cdn.espn.com/core` game summary | Fully redundant with `espn_*_game_all()` |
| core-v2 `/events/{id}/plays` | Strict downgrade of `espn_*_pbp()`; needs per-play `$ref` resolution and returns less data |
| `espn_wnba_rankings` (would-be) | The WNBA has no poll; only WBB has [`espn_wbb_rankings()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_rankings.md) |
| WBB transfer portal | Not on ESPN’s basketball API |

And a handful of endpoints we do wrap that have known data quirks:

- **[`espn_wbb_injuries()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_injuries.md)
  and
  [`espn_wbb_team_injuries()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_team_injuries.md)**
  – ESPN rarely populates injury data for college basketball.
- **[`espn_wbb_event_odds()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_event_odds.md)**
  – always empty; ESPN doesn’t carry NCAA lines.
- **[`espn_wnba_freeagents()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_freeagents.md)**
  – empty outside the FA window.
- **`espn_*_athlete_awards()`** – sparse for most athletes.
- **`espn_*_athlete_eventlog()`** – returns `$ref` URLs, not parsed
  stats. Use `_athlete_gamelog()` instead.
- **`espn_*_season_info()`** – mostly `$ref` URLs.
- **web-common-v3 endpoints** – some legacy seasons return HTTP 404.

When something looks off, an empty tibble is far more often the correct,
expected return than a bug. ESPN’s basketball coverage is uneven across
leagues, seasons, and franchise tenures, and `wehoop` mirrors that
unevenness honestly rather than papering over it.
