# fox_basketball.R -- Fox Sports "Bifrost" basketball wrappers (WNBA + WBB).
#
# Read-only wrappers over api.foxsports.com/bifrost/v1/{wnba,wcbk}/*, flattening
# Fox's layout JSON (sections -> tables -> rows -> cells) into tidy wehoop
# tibbles. Basketball play-by-play is period-based (QUARTER/HALF -> plays).
# WNBA uses the `wnba` slug; women's college basketball (WBB) uses the `wcbk`
# slug. Reverse-engineering notes + an OpenAPI spec live in the
# sdv-internal-refs repo.

# Fox's public Bifrost apikey. Resolvable from `getOption("wehoop.fox_data_key")`
# or the `WEHOOP_FOX_DATA_KEY` env var, with the literal as the final fallback.
.fox_bb_key <- function() {
  getOption(
    "wehoop.fox_data_key",
    Sys.getenv("WEHOOP_FOX_DATA_KEY", unset = "jE7yBJVRNAwdDesMgTzTXUUSx1It41Fq")
  )
}
.fox_or <- function(a, b) if (is.null(a) || length(a) == 0) b else a

# Internal: GET a Fox Bifrost layout document and parse it. Routes through the
# shared `.retry_request()` helper so the Fox path inherits the package-wide
# timeout, jittered exponential backoff, and proxy resolution (explicit arg ->
# `getOption("wehoop.proxy")` -> `http(s)_proxy` env vars).
#' @keywords internal
#' @importFrom jsonlite fromJSON
.fox_bb_get <- function(path, query = list()) {
  query[["apikey"]] <- .fox_or(query[["apikey"]], .fox_bb_key())
  query[["api-version"]] <- .fox_or(query[["api-version"]], "1.1")
  resp <- .retry_request(
    url = paste0("https://api.foxsports.com/bifrost/v1/", path),
    params = query,
    headers = c(Origin = "https://www.foxsports.com",
                Referer = "https://www.foxsports.com/")
  )
  check_status(resp)
  .resp_text(resp) |>
    jsonlite::fromJSON(simplifyDataFrame = FALSE, simplifyVector = FALSE, simplifyMatrix = FALSE)
}

.fox_cells <- function(cols) {
  vapply(cols, function(c) {
    v <- if (is.list(c)) c[["text"]] else c
    if (is.null(v) || length(v) == 0) NA_character_ else as.character(v)[1]
  }, character(1))
}
.fox_uri_id <- function(uri) {
  if (is.null(uri)) return(NA_character_)
  m <- regmatches(uri, regexpr("[0-9]+$", uri)); if (length(m)) m else NA_character_
}
#' @importFrom janitor make_clean_names
.fox_table_df <- function(tbl, extra = list()) {
  if (is.null(tbl)) return(NULL)
  hdr <- .fox_cells(tbl[["headers"]][[1]][["columns"]])
  nm <- janitor::make_clean_names(ifelse(is.na(hdr) | hdr == "", paste0("v", seq_along(hdr)), hdr))
  rws <- .fox_or(tbl[["rows"]], list()); if (!length(rws)) return(NULL)
  recs <- lapply(rws, function(r) {
    cells <- .fox_cells(r[["columns"]]); vals <- as.list(cells); names(vals) <- nm[seq_along(vals)]
    eid <- .fox_uri_id(.fox_or(r[["entityLink"]][["contentUri"]], NULL))
    as.data.frame(c(extra, vals, list(entity_id = eid)), stringsAsFactors = FALSE)
  })
  dplyr::bind_rows(recs)
}

# ---- parsers (return data.frame) ------------------------------------------
.fox_bb_pbp <- function(raw, game_id) {
  rows <- list()
  for (sec in .fox_or(raw[["pbp"]][["sections"]], list())) {
    for (grp in .fox_or(sec[["groups"]], list())) {
      period <- .fox_or(grp[["title"]], NA_character_)
      left <- .fox_or(grp[["leftTeamAbbr"]], NA_character_)
      right <- .fox_or(grp[["rightTeamAbbr"]], NA_character_)
      for (p in .fox_or(grp[["plays"]], list())) {
        rows[[length(rows) + 1]] <- data.frame(
          game_id = as.character(game_id), period = period, left_team = left, right_team = right,
          play_id = as.character(.fox_or(p[["id"]], NA_character_)),
          clock = .fox_or(p[["timeOfPlay"]], NA_character_),
          team = .fox_or(p[["entityLink"]][["title"]], .fox_or(p[["imageAltText"]], NA_character_)),
          left_score_change = as.character(.fox_or(p[["leftTeamScoreChange"]], NA)),
          right_score_change = as.character(.fox_or(p[["rightTeamScoreChange"]], NA)),
          play_text = .fox_or(p[["playDescription"]], NA_character_), stringsAsFactors = FALSE)
      }
    }
  }
  if (length(rows)) do.call(rbind, rows) else data.frame()
}
.fox_bb_boxscore <- function(raw, game_id) {
  rows <- list()
  for (sec in .fox_or(raw[["boxscore"]][["boxscoreSections"]], list())) {
    team <- .fox_or(sec[["title"]], NA_character_)
    for (item in .fox_or(sec[["boxscoreItems"]], list())) {
      tbl <- item[["boxscoreTable"]]; if (is.null(tbl)) next
      hdr <- .fox_cells(tbl[["headers"]][[1]][["columns"]])
      stat_group <- .fox_or(hdr[1], NA_character_)
      stat_names <- janitor::make_clean_names(.fox_or(hdr[-1], character(0)))
      for (r in .fox_or(tbl[["rows"]], list())) {
        cells <- .fox_cells(r[["columns"]]); player <- .fox_or(cells[1], NA_character_)
        aid <- .fox_uri_id(.fox_or(r[["entityLink"]][["contentUri"]], NULL)); vals <- cells[-1]
        for (j in seq_along(vals)) {
          rows[[length(rows) + 1]] <- data.frame(
            game_id = as.character(game_id), team = team, stat_group = stat_group,
            player = player, athlete_id = aid,
            stat = .fox_or(stat_names[j], paste0("v", j)), value = vals[j], stringsAsFactors = FALSE)
        }
      }
    }
  }
  if (length(rows)) do.call(rbind, rows) else data.frame()
}
.fox_bb_roster <- function(raw, team_id) {
  rows <- list()
  for (g in .fox_or(raw[["groups"]], list())) {
    hdr <- .fox_cells(g[["headers"]][[1]][["columns"]])
    group_label <- .fox_or(g[["title"]], .fox_or(hdr[1], NA_character_))
    col_names <- c("player", tolower(.fox_or(hdr[-1], character(0))))
    for (r in .fox_or(g[["rows"]], list())) {
      uri <- .fox_or(r[["entityLink"]][["contentUri"]], NULL)
      if (is.null(uri) || !grepl("athletes/", uri)) next
      cells <- .fox_cells(r[["columns"]]); vals <- as.list(cells); names(vals) <- col_names[seq_along(vals)]
      rows[[length(rows) + 1]] <- data.frame(
        team_id = as.character(team_id), position_group = group_label,
        as.data.frame(vals, stringsAsFactors = FALSE), athlete_id = .fox_uri_id(uri), stringsAsFactors = FALSE)
    }
  }
  if (length(rows)) dplyr::bind_rows(rows) else data.frame()
}
.fox_bb_team_stats <- function(raw, team_id) {
  rows <- list()
  for (sec in .fox_or(raw[["leadersSections"]], list())) {
    for (ld in .fox_or(sec[["leaders"]], list())) {
      rows[[length(rows) + 1]] <- data.frame(
        team_id = as.character(team_id), category = .fox_or(sec[["title"]], NA_character_),
        stat = .fox_or(ld[["title"]], NA_character_),
        stat_abbreviation = .fox_or(ld[["statAbbreviation"]], NA_character_),
        player = .fox_or(ld[["name"]], NA_character_), value = .fox_or(ld[["statValue"]], NA_character_),
        stringsAsFactors = FALSE)
    }
  }
  if (length(rows)) do.call(rbind, rows) else data.frame()
}
.fox_bb_gamelog <- function(raw, team_id) {
  rows <- list()
  for (sec in .fox_or(raw[["sectionList"]], list())) {
    category <- .fox_or(sec[["id"]], NA_character_)
    for (tbl in .fox_or(sec[["tables"]], list())) {
      hdr <- .fox_cells(tbl[["headers"]][[1]][["columns"]])
      season_type <- .fox_or(hdr[1], NA_character_)
      stat_names <- janitor::make_clean_names(.fox_or(hdr[-(1:2)], character(0)))
      for (r in .fox_or(tbl[["rows"]], list())) {
        cells <- .fox_cells(r[["columns"]]); gid <- .fox_uri_id(.fox_or(r[["entityLink"]][["contentUri"]], NULL))
        vals <- cells[-(1:2)]
        for (j in seq_along(vals)) {
          rows[[length(rows) + 1]] <- data.frame(
            team_id = as.character(team_id), season_type = season_type, category = category, game_id = gid,
            game_date = .fox_or(cells[1], NA_character_), opponent = .fox_or(cells[2], NA_character_),
            stat = .fox_or(stat_names[j], paste0("v", j)), value = vals[j], stringsAsFactors = FALSE)
        }
      }
    }
  }
  if (length(rows)) do.call(rbind, rows) else data.frame()
}
.fox_bb_standings <- function(raw, team_id) {
  parts <- list()
  for (s in .fox_or(raw[["standingsSections"]], list())) {
    for (tbl in .fox_or(s[["standings"]], list())) {
      parts[[length(parts) + 1]] <- .fox_table_df(
        tbl, extra = list(team_id = as.character(team_id), section = .fox_or(s[["title"]], NA_character_)))
    }
  }
  dplyr::bind_rows(parts)
}
.fox_bb_teams <- function(raw) {
  rows <- list()
  for (s in .fox_or(raw[["standingsSections"]], list())) {
    section <- .fox_or(s[["title"]], NA_character_)
    for (tbl in .fox_or(s[["standings"]], list())) {
      for (r in .fox_or(tbl[["rows"]], list())) {
        cells <- .fox_cells(r[["columns"]])
        eid <- .fox_uri_id(.fox_or(r[["entityLink"]][["contentUri"]], NULL))
        if (is.na(eid)) next
        # entityLink$title carries the full team name (e.g. "NEW YORK LIBERTY");
        # the table cells lead with the rank, so fall back to the second cell.
        title <- .fox_or(r[["entityLink"]][["title"]], NA_character_)
        nm <- if (!is.na(title)) stringr::str_to_title(tolower(title)) else .fox_or(cells[2], NA_character_)
        rows[[length(rows) + 1]] <- data.frame(
          fox_team_id = eid,
          fox_team_name = nm,
          fox_section = section,
          stringsAsFactors = FALSE)
      }
    }
  }
  if (!length(rows)) return(data.frame())
  out <- dplyr::bind_rows(rows)
  out[!duplicated(out$fox_team_id), , drop = FALSE]
}
.fox_bb_leaders <- function(raw) {
  parts <- lapply(.fox_or(raw[["sectionList"]], list()), function(s) .fox_table_df(s[["table"]]))
  dplyr::bind_rows(parts)
}
.fox_bb_odds <- function(raw, game_id) {
  sp <- raw[["sixPack"]]; o <- if (is.null(sp)) NULL else sp[["odds"]]; rows <- list()
  if (!is.null(o)) {
    hdr <- janitor::make_clean_names(.fox_cells(o[["columnHeaders"]]))
    for (r in .fox_or(o[["rows"]], list())) {
      vals <- vapply(.fox_or(r[["values"]], list()),
                     function(v) as.character(.fox_or(v[["odds"]], NA_character_)), character(1))
      rec <- as.list(vals); names(rec) <- hdr[seq_along(rec)]
      rows[[length(rows) + 1]] <- data.frame(
        game_id = as.character(game_id), team = .fox_or(r[["fullText"]], .fox_or(r[["text"]], NA_character_)),
        as.data.frame(rec, stringsAsFactors = FALSE), stringsAsFactors = FALSE)
    }
  }
  if (length(rows)) dplyr::bind_rows(rows) else data.frame()
}

# ---- dispatcher ------------------------------------------------------------
#' @keywords internal
#' @importFrom janitor clean_names
#' @importFrom dplyr as_tibble bind_rows
.fox_bb_resource <- function(sport, resource, game_id = NULL, team_id = NULL,
                             category = "scoring", who = "player", page = 0) {
  .args <- .capture_args()

  out <- data.frame()
  tryCatch(
    expr = {
      raw <- switch(
        resource,
        pbp = , boxscore = .fox_bb_get(paste0(sport, "/event/", game_id, "/data")),
        odds = .fox_bb_get(paste0(sport, "/event/", game_id, "/odds")),
        league_leaders = .fox_bb_get(paste0(sport, "/league/stats-con/", who, "/", category, "/", page)),
        roster = .fox_bb_get(paste0(sport, "/team/", team_id, "/roster")),
        team_stats = .fox_bb_get(paste0(sport, "/team/", team_id, "/stats")),
        gamelog = .fox_bb_get(paste0(sport, "/team/", team_id, "/gamelog")),
        standings = .fox_bb_get(paste0(sport, "/team/", team_id, "/standings")),
        teams = .fox_bb_get(paste0(sport, "/team/", team_id, "/standings")))
      df <- switch(
        resource,
        pbp = .fox_bb_pbp(raw, game_id), boxscore = .fox_bb_boxscore(raw, game_id),
        odds = .fox_bb_odds(raw, game_id), roster = .fox_bb_roster(raw, team_id),
        team_stats = .fox_bb_team_stats(raw, team_id), gamelog = .fox_bb_gamelog(raw, team_id),
        standings = .fox_bb_standings(raw, team_id), league_leaders = .fox_bb_leaders(raw),
        teams = .fox_bb_teams(raw))
      out <- df |>
        dplyr::as_tibble() |>
        janitor::clean_names() |>
        make_wehoop_data(paste0("Fox Sports ", toupper(sport), " ", resource), Sys.time())
    },
    error = function(e) {
      .report_api_error(
        e, hint = "Invalid arguments or no Fox {sport} {resource} data available!", args = .args)
    },
    warning = function(w) {
      .report_api_warning(
        w, hint = "Warning fetching Fox {sport} {resource}", args = .args)
    },
    finally = {
    }
  )
  out
}

# ---- public wrappers (WNBA + WBB share each resource via @rdname) -----------
#' @title
#' **Get Fox Sports basketball play-by-play**
#' @description
#' **Get Fox Sports (Bifrost) WNBA / women's college basketball (WBB)
#' play-by-play.** `fox_wnba_pbp()` hits the `wnba` slug; `fox_wbb_pbp()` hits
#' the `wcbk` slug.
#' @name fox_basketball_pbp
#' @param game_id Fox Bifrost event id (e.g. `"2215"`).
#' @return A `wehoop_data` tibble, one row per play: `game_id`, `period`,
#'   `left_team`, `right_team`, `play_id`, `clock`, `team`, `left_score_change`,
#'   `right_score_change`, `play_text`.
#' @importFrom janitor clean_names
#' @importFrom dplyr as_tibble bind_rows
#' @export
#' @family Fox Sports Functions
#' @examples
#' \donttest{
#'   try(fox_wnba_pbp("2215"))
#' }
fox_wnba_pbp <- function(game_id) .fox_bb_resource("wnba", "pbp", game_id = game_id)
#' @rdname fox_basketball_pbp
#' @export
#' @examples
#' \donttest{
#'   try(fox_wbb_pbp("388986"))
#' }
fox_wbb_pbp <- function(game_id) .fox_bb_resource("wcbk", "pbp", game_id = game_id)

#' @title
#' **Get Fox Sports basketball boxscore**
#' @description
#' **Get Fox Sports (Bifrost) WNBA / women's college basketball (WBB) boxscore.**
#' `fox_wnba_boxscore()` hits the `wnba` slug; `fox_wbb_boxscore()` hits the
#' `wcbk` slug.
#' @name fox_basketball_boxscore
#' @param game_id Fox Bifrost event id.
#' @return A `wehoop_data` tibble (long), one row per (player, stat): `game_id`,
#'   `team`, `stat_group`, `player`, `athlete_id`, `stat`, `value`.
#' @importFrom janitor clean_names
#' @importFrom dplyr as_tibble bind_rows
#' @export
#' @family Fox Sports Functions
#' @examples
#' \donttest{
#'   try(fox_wnba_boxscore("2215"))
#' }
fox_wnba_boxscore <- function(game_id) .fox_bb_resource("wnba", "boxscore", game_id = game_id)
#' @rdname fox_basketball_boxscore
#' @export
#' @examples
#' \donttest{
#'   try(fox_wbb_boxscore("388986"))
#' }
fox_wbb_boxscore <- function(game_id) .fox_bb_resource("wcbk", "boxscore", game_id = game_id)

#' @title
#' **Get Fox Sports basketball game odds**
#' @description
#' **Get Fox Sports (Bifrost) WNBA / women's college basketball (WBB) game
#' odds.** `fox_wnba_odds()` hits the `wnba` slug; `fox_wbb_odds()` hits the
#' `wcbk` slug.
#' @name fox_basketball_odds
#' @param game_id Fox Bifrost event id.
#' @return A `wehoop_data` tibble, one row per team: `game_id`, `team`, plus the
#'   six-pack odds columns (spread / to-win / total). Empty when no market.
#' @importFrom janitor clean_names
#' @importFrom dplyr as_tibble bind_rows
#' @export
#' @family Fox Sports Functions
#' @examples
#' \donttest{
#'   try(fox_wnba_odds("2215"))
#' }
fox_wnba_odds <- function(game_id) .fox_bb_resource("wnba", "odds", game_id = game_id)
#' @rdname fox_basketball_odds
#' @export
#' @examples
#' \donttest{
#'   try(fox_wbb_odds("388986"))
#' }
fox_wbb_odds <- function(game_id) .fox_bb_resource("wcbk", "odds", game_id = game_id)

#' @title
#' **Get Fox Sports basketball team roster**
#' @description
#' **Get Fox Sports (Bifrost) WNBA / women's college basketball (WBB) team
#' roster.** `fox_wnba_team_roster()` hits the `wnba` slug;
#' `fox_wbb_team_roster()` hits the `wcbk` slug.
#' @name fox_basketball_team_roster
#' @param team_id Fox Bifrost team id (e.g. `"1"`). Discover via the league team directory.
#' @return A `wehoop_data` tibble, one row per player: `team_id`, `position_group`,
#'   `player`, position/age/etc. columns, `athlete_id`.
#' @importFrom janitor clean_names
#' @importFrom dplyr as_tibble bind_rows
#' @export
#' @family Fox Sports Functions
#' @examples
#' \donttest{
#'   try(fox_wnba_team_roster("1"))
#' }
fox_wnba_team_roster <- function(team_id) .fox_bb_resource("wnba", "roster", team_id = team_id)
#' @rdname fox_basketball_team_roster
#' @export
#' @examples
#' \donttest{
#'   try(fox_wbb_team_roster("11"))
#' }
fox_wbb_team_roster <- function(team_id) .fox_bb_resource("wcbk", "roster", team_id = team_id)

#' @title
#' **Get Fox Sports basketball team stat leaders**
#' @description
#' **Get Fox Sports (Bifrost) WNBA / women's college basketball (WBB) team stat
#' leaders.** `fox_wnba_team_stats()` hits the `wnba` slug;
#' `fox_wbb_team_stats()` hits the `wcbk` slug.
#' @name fox_basketball_team_stats
#' @param team_id Fox Bifrost team id.
#' @return A `wehoop_data` tibble: `team_id`, `category`, `stat`,
#'   `stat_abbreviation`, `player`, `value`.
#' @importFrom janitor clean_names
#' @importFrom dplyr as_tibble bind_rows
#' @export
#' @family Fox Sports Functions
#' @examples
#' \donttest{
#'   try(fox_wnba_team_stats("1"))
#' }
fox_wnba_team_stats <- function(team_id) .fox_bb_resource("wnba", "team_stats", team_id = team_id)
#' @rdname fox_basketball_team_stats
#' @export
#' @examples
#' \donttest{
#'   try(fox_wbb_team_stats("11"))
#' }
fox_wbb_team_stats <- function(team_id) .fox_bb_resource("wcbk", "team_stats", team_id = team_id)

#' @title
#' **Get Fox Sports basketball team game log**
#' @description
#' **Get Fox Sports (Bifrost) WNBA / women's college basketball (WBB) team game
#' log.** `fox_wnba_team_gamelog()` hits the `wnba` slug;
#' `fox_wbb_team_gamelog()` hits the `wcbk` slug.
#' @name fox_basketball_team_gamelog
#' @param team_id Fox Bifrost team id.
#' @return A `wehoop_data` tibble (long): `team_id`, `season_type`, `category`,
#'   `game_id`, `game_date`, `opponent`, `stat`, `value`.
#' @importFrom janitor clean_names
#' @importFrom dplyr as_tibble bind_rows
#' @export
#' @family Fox Sports Functions
#' @examples
#' \donttest{
#'   try(fox_wnba_team_gamelog("1"))
#' }
fox_wnba_team_gamelog <- function(team_id) .fox_bb_resource("wnba", "gamelog", team_id = team_id)
#' @rdname fox_basketball_team_gamelog
#' @export
#' @examples
#' \donttest{
#'   try(fox_wbb_team_gamelog("11"))
#' }
fox_wbb_team_gamelog <- function(team_id) .fox_bb_resource("wcbk", "gamelog", team_id = team_id)

#' @title
#' **Get Fox Sports basketball standings**
#' @description
#' **Get Fox Sports (Bifrost) WNBA / women's college basketball (WBB)
#' standings.** `fox_wnba_standings()` hits the `wnba` slug;
#' `fox_wbb_standings()` hits the `wcbk` slug.
#' @name fox_basketball_standings
#' @param team_id Fox Bifrost team id (standings of that team's conference/division).
#' @return A `wehoop_data` tibble of standings rows (`team_id`, `section`, the
#'   standings columns, `entity_id`).
#' @importFrom janitor clean_names
#' @importFrom dplyr as_tibble bind_rows
#' @export
#' @family Fox Sports Functions
#' @examples
#' \donttest{
#'   try(fox_wnba_standings("1"))
#' }
fox_wnba_standings <- function(team_id) .fox_bb_resource("wnba", "standings", team_id = team_id)
#' @rdname fox_basketball_standings
#' @export
#' @examples
#' \donttest{
#'   try(fox_wbb_standings("11"))
#' }
fox_wbb_standings <- function(team_id) .fox_bb_resource("wcbk", "standings", team_id = team_id)

#' @title
#' **Get Fox Sports basketball team directory**
#' @description
#' **Get the Fox Sports (Bifrost) WNBA / women's college basketball (WBB) team
#' directory**, derived from the standings endpoint. `fox_wnba_teams()` hits the
#' `wnba` slug; `fox_wbb_teams()` hits the `wcbk` slug.
#' @name fox_basketball_teams
#' @param team_id Fox Bifrost seed team id used to fetch league standings
#'   (default `"3"`). The standings response enumerates every team in the seed's
#'   league sections.
#' @return A `wehoop_data` tibble, one row per team: `fox_team_id`,
#'   `fox_team_name`, `fox_section`.
#' @author Saiem Gilani
#' @importFrom janitor clean_names
#' @importFrom dplyr as_tibble bind_rows
#' @export
#' @family Fox Sports Functions
#' @examples
#' \donttest{
#'   try(fox_wnba_teams())
#' }
fox_wnba_teams <- function(team_id = "3") .fox_bb_resource("wnba", "teams", team_id = team_id)
#' @rdname fox_basketball_teams
#' @export
#' @examples
#' \donttest{
#'   try(fox_wbb_teams("11"))
#' }
fox_wbb_teams <- function(team_id = "11") .fox_bb_resource("wcbk", "teams", team_id = team_id)

#' @title
#' **Get Fox Sports basketball statistical leaders**
#' @description
#' **Get Fox Sports (Bifrost) WNBA / women's college basketball (WBB)
#' statistical leaders.** `fox_wnba_league_leaders()` hits the `wnba` slug;
#' `fox_wbb_league_leaders()` hits the `wcbk` slug.
#' @name fox_basketball_league_leaders
#' @param category Stat category (default `"scoring"`).
#' @param who `"player"` or `"team"` (default `"player"`).
#' @param page 0-based page index (default `0`).
#' @return A `wehoop_data` tibble of leaderboard rows (`entity_id` + stat columns).
#' @importFrom janitor clean_names
#' @importFrom dplyr as_tibble bind_rows
#' @export
#' @family Fox Sports Functions
#' @examples
#' \donttest{
#'   try(fox_wnba_league_leaders("scoring"))
#' }
fox_wnba_league_leaders <- function(category = "scoring", who = "player", page = 0) {
  .fox_bb_resource("wnba", "league_leaders", category = category, who = who, page = page)
}
#' @rdname fox_basketball_league_leaders
#' @export
#' @examples
#' \donttest{
#'   try(fox_wbb_league_leaders("scoring"))
#' }
fox_wbb_league_leaders <- function(category = "scoring", who = "player", page = 0) {
  .fox_bb_resource("wcbk", "league_leaders", category = category, who = who, page = page)
}
