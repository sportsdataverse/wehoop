# wjbl_parsers.R -- frames of the W League wrappers (internal; parse_* is not exported).
#
# R mirror of sdv-py sportsdataverse/basketball/wjbl/wjbl_parsers.py (origin/main e3d232ebc9): every
# frame is built from `.wjbl_specs`, one type per column, never sampled: ids and flags integer, rates
# double, everything else character. Wire names are kept; maps keyed by position or id (`seasons`,
# `teams`, `periods`) become rows in numeric key order; counted strings become numbers ('6<hon>' -> 6,
# '23<win>5<loss>' -> 23 and 5, '40.92%' -> 40.92, '3-4-7' -> 3, 4 and 7). The wire misspells
# `home_trun_over` and `home_max_differenct`; the frames spell them `home_turnovers` and
# `home_max_difference`. Contact keys and the blood type are never output, and phone numbers and
# e-mail addresses in free text are replaced by `[redacted-phone]` / `[redacted-email]`.

# ---------------------------------------------------------------------------
# Schemas (sdv-py `SCHEMAS`)
# ---------------------------------------------------------------------------

#' `"a:i b:f c:s"` -> `c(a = "i", b = "f", c = "s")` (order kept).
#' @noRd
.wjbl_spec <- function(...) {
  toks <- strsplit(trimws(paste(...)), "\\s+")[[1]]
  parts <- strsplit(toks, ":", fixed = TRUE)
  structure(vapply(parts, `[[`, "", 2L), names = vapply(parts, `[[`, "", 1L))
}

#' @noRd
.wjbl_sides <- function(tpl) paste(gsub("{s}", "home", tpl, fixed = TRUE), gsub("{s}", "away", tpl, fixed = TRUE))

#' @noRd
.WJBL_SIDE_KEYS <- paste(
  "team_id:i season_team_name:s season_team_short_name:s team_logo_image:s team_entry_flg:i season_team_area:s",
  "free_text:s winner_flg:i score:i score_p1:i score_p2:i score_p3:i score_p4:i score_ot1:i score_ot2:i",
  "score_ot3:i score_ot4:i"
)
#' @noRd
.WJBL_BOX <- "pts:i p2m:i p2a:i p3m:i p3a:i ftm:i fta:i f:i off:i def:i tot:i ast:i stl:i blk:i to:i"
#' @noRd
.WJBL_SIDE_STATS <- paste(
  "{s}_ptr:f {s}_pt2r:f {s}_pt3r:f {s}_ftr:f {s}_rebound_off:i {s}_rebound_def:i {s}_rebound_tot:i",
  "{s}_assist:i {s}_turnovers:i {s}_max_difference:i"
)
#' @noRd
.WJBL_LEADERS <- paste(outer(c("point", "assist", "rebound"), c("player", "value"), function(k, t) {
  paste0("{s}_", k, "_", t, ":s")
})[c(1, 4, 2, 5, 3, 6)], collapse = " ")
#' @noRd
.WJBL_TEAM_ROW <- "season_team_name:s season_team_short_name:s team_entry_flg:i position:i season_team_area:s"
#' @noRd
.WJBL_SCHED_SIDE <- paste(
  "{s}_team_id:i {s}_season_team_name:s {s}_season_team_short_name:s {s}_team_logo_image:s {s}_team_free_text:s",
  "{s}_team_score:i {s}_team_entry_flg:i"
)
#' @noRd
.WJBL_INFO_SIDE <- "{s}_team_id:i {s}_season_team_name:s {s}_season_team_short_name:s {s}_team_logo_image:s {s}_free_text:s"
#' @noRd
.WJBL_ROSTER_KEYS <- "league_id:i league_title:s season:i season_id:i season_full_name:s season_team_id:i team_id:i"

#' Documented columns and types of each frame (`i` integer, `f` double, `s` character).
#' @noRd
.wjbl_specs <- list(
  leagues = .wjbl_spec("league_id:i league_title:s season:i"),
  game_months = .wjbl_spec("league_id:i season:i game_month:s game_month_jpn:s"),
  schedule = .wjbl_spec(
    "league_id:i league_title:s season:i season_id:i season_title:s season_full_name:s play_schedule_id:i",
    "game_year:i game_date:s game_day:s game_date_week_day_name:s game_start_time:s started_at:s opening_time:s",
    "venue:s venue_address:s game_icon:i ticket_url:s vod_link:s live_link:s game_status:s box_flg:i pbp_flg:i",
    "cancel_flg:i delay_flg:i ot_flg:i", .wjbl_sides(.WJBL_SCHED_SIDE)
  ),
  game = .wjbl_spec(
    "play_schedule_id:i game_status:s",
    paste(paste0("home_", strsplit(.WJBL_SIDE_KEYS, " ")[[1]]), collapse = " "),
    paste(paste0("away_", strsplit(.WJBL_SIDE_KEYS, " ")[[1]]), collapse = " ")
  ),
  period_scores = .wjbl_spec("play_schedule_id:i team_side:s team_id:i period:i period_label:s score:i"),
  game_info = .wjbl_spec(
    "play_schedule_id:i league_id:i league_title:s season:i season_id:i season_title:s season_full_name:s",
    "game_date:s game_day:s game_start_time:s started_at:s opening_time:s venue:s game_icon:i venue_address:s",
    "venue_others:s allow_shoes_on:i allow_shoes_on_others:s ticket_info:s ticket_url:s event_info:s live_link:s",
    "vod_link:s bs_url:s cs_url:s ground_url:s other_url:s cancel_flg:i delay_flg:i game_status:s box_flg:i",
    "pbp_flg:i referee_name:s sub_referee_name1:s sub_referee_name2:s comment:s report:s",
    .wjbl_sides(.WJBL_INFO_SIDE)
  ),
  box_score = .wjbl_spec(
    "play_schedule_id:i team_side:s team_id:i player_id:i player_name:s player_number:s gs:i", .WJBL_BOX,
    "min:s min_seconds:i"
  ),
  team_box_score = .wjbl_spec(
    "play_schedule_id:i team_side:s team_id:i row_type:s", .WJBL_BOX, "min:s min_seconds:i p2p:f p3p:f ftp:f fgp:f"
  ),
  pbp = .wjbl_spec(
    "play_schedule_id:i no:i period:i rest_time:s seconds_remaining:i team_id:i team_name:s team_side:s",
    "player_number1:s player_number2:s player_name1:s player_name2:s player_id1:i player_id2:i play_text:s",
    "score:s home_score:i away_score:i end_period_flg:i end_game_flg:i action1:s action2:s action3:s home_away:i"
  ),
  team_period_stats = .wjbl_spec(
    "play_schedule_id:i home_team_id:i away_team_id:i period_category:i period_label:s",
    .wjbl_sides(.WJBL_SIDE_STATS), "lead_count:i tie_count:i"
  ),
  player_period_leaders = .wjbl_spec(
    "play_schedule_id:i home_team_id:i away_team_id:i period_category:i period_label:s",
    .wjbl_sides(.WJBL_LEADERS)
  ),
  standing_seasons = .wjbl_spec(
    "season_id:i season_full_name:s season:i season_league_name:s team_standings_flg:i",
    "season_tournament_text_flg:i season_tournament_text:s"
  ),
  team_standings = .wjbl_spec(
    "season_id:i season_title:s league_name:s season_league_name:s season_league_flg:i update_date:s team_id:i",
    .WJBL_TEAM_ROW, "win_lost:s wins:i losses:i"
  ),
  head_to_head = .wjbl_spec("season_id:i team_id:i opponent_team_id:i game_number:i win:i losg:i result:s"),
  team_ranking = .wjbl_spec(
    "league_id:i league_title:s season:i season_id:i season_title:s season_full_name:s season_league_name:s",
    "season_league_flg:i season_league_img:s season_tournament_text:s update_info:s team_id:i", .WJBL_TEAM_ROW,
    "win:i lost:i winning_rate:f ppg:f opp:f fg:f opp_fg:f p3pg:f rpg:f apg:f spg:f bpg:f tpg:f gpd:f",
    "win_point:s unsatisfied:s"
  ),
  teams = .wjbl_spec("team_id:i team_name:s"),
  roster = .wjbl_spec(
    .WJBL_ROSTER_KEYS,
    "coach_id:i coach_name:s team_comment:s player_id:i player_name:s player_number:s captain_flg:i",
    "sub_captain_flg:i transfer_flg:i position:s rookie:i early_entry:i picture:s foreign_national_flg:i",
    "naturalized_flg:i"
  ),
  staff = .wjbl_spec(.WJBL_ROSTER_KEYS, "staff_name:s position:s url:s"),
  player = .wjbl_spec(
    "player_id:i player_name:s player_name_en:s player_furigana:s team_id:i season_team_name:s",
    "season_team_short_name:s season_team_player_number:s team_logo_image:s team_url:s player_birthday:s",
    "player_nickname:s player_position:s player_home_town:s player_height:s player_weight:s player_height_cm:i",
    "player_weight_kg:i player_affiliation_history:s player_independent_flg:i player_national_team:s",
    "player_awards:s player_coach_history:s player_coach_record:s player_picture:s player_wjbl_flg:i",
    "player_rookie:i player_early_entry:i player_foreign_national_flg:i player_naturalized_flg:i player_appeal:s",
    "player_championships:s player_url:s player_facebook_url:s player_twitter_url:s player_instagram_url:s"
  )
)

#' Free-text columns, where a phone number or an e-mail address can sit; other strings are kept as sent.
#' @noRd
.WJBL_FREE_TEXT <- c(
  "ticket_info", "event_info", "comment", "report", "venue_others", "allow_shoes_on_others", "team_comment",
  "player_affiliation_history", "player_national_team", "player_awards", "player_coach_history",
  "player_coach_record", "player_appeal", "player_championships", "player_nickname", "player_home_town"
)

#' sdv-py `_PHONE`: a Japanese phone number, ASCII or full-width digits, with or without separators.
#' @noRd
.WJBL_PHONE <- paste0(
  "(?<![0-9\uff10-\uff19])[(\uff08]?[0\uff10][0-9\uff10-\uff19]{1,4}[)\uff09]?",
  "[-\uff0d\u2010\u30fc\u2212\u2015 \u3000]?[0-9\uff10-\uff19]{1,4}",
  "[-\uff0d\u2010\u30fc\u2212\u2015 \u3000]?[0-9\uff10-\uff19]{3,4}(?![0-9\uff10-\uff19])"
)

#' sdv-py `_EMAIL` (Python's `\w` is Unicode, hence UCP).
#' @noRd
.WJBL_EMAIL <- "(*UCP)[\\w.+-]+@[\\w-]+\\.[\\w.]+"

# ---------------------------------------------------------------------------
# Casts (sdv-py `_int`, `_float`, `_text`, `_clean`)
# ---------------------------------------------------------------------------

#' An integer from an integer, a whole double or an integer string; never a logical; else `NA`.
#' @noRd
.wjbl_i <- function(v) {
  v <- .intl_ascii_digits(v) # full-width digits, as sdv-py's \d / int() read them
  if (!.wjbl_scalar(v) || is.logical(v)) return(NA_integer_)
  if (is.integer(v)) return(v)
  if (is.double(v)) {
    if (!is.finite(v) || v != trunc(v) || abs(v) > .Machine$integer.max) return(NA_integer_)
    return(as.integer(v))
  }
  if (is.character(v) && grepl("(*UCP)^\\s*-?[0-9]+\\s*$", v, perl = TRUE)) {
    return(suppressWarnings(as.integer(trimws(v))))
  }
  NA_integer_
}

#' A double from a number or a numeric string (a trailing `%` is dropped); never a logical; else `NA`.
#' @noRd
.wjbl_f <- function(v) {
  v <- .intl_ascii_digits(v) # full-width digits, as sdv-py's \d / int() read them
  if (!.wjbl_scalar(v) || is.logical(v)) return(NA_real_)
  if (is.numeric(v)) return(as.double(v))
  if (is.character(v)) {
    m <- regmatches(v, regexec("(*UCP)^\\s*(-?[0-9]+(?:\\.[0-9]+)?)\\s*%?\\s*$", v, perl = TRUE))[[1]]
    if (length(m)) return(as.double(m[[2]]))
  }
  NA_real_
}

#' A string as sent; any other scalar as Python `str()`; `NA` for a missing value.
#' @noRd
.wjbl_s <- function(v) {
  if (is.null(v) || (is.atomic(v) && length(v) == 1L && is.na(v))) return(NA_character_)
  if (is.character(v) && length(v) == 1L) return(v)
  if (is.atomic(v) && length(v) == 1L) return(.wjbl_pystr(v))
  NA_character_
}

#' A free-text string with phone numbers and e-mail addresses replaced.
#' @noRd
.wjbl_clean <- function(v) {
  text <- .wjbl_s(v)
  if (is.na(text)) return(text)
  text <- gsub(.WJBL_PHONE, "[redacted-phone]", text, perl = TRUE)
  gsub(.WJBL_EMAIL, "[redacted-email]", text, perl = TRUE)
}

#' The frame of `kind` from row lists: every spec column cast to its type, in spec order.
#' @noRd
.wjbl_finish <- function(rows, kind) {
  spec <- .wjbl_specs[[kind]]
  cols <- lapply(names(spec), function(name) {
    values <- lapply(rows, function(r) r[[name]])
    if (name %in% .WJBL_FREE_TEXT) return(vapply(values, .wjbl_clean, character(1), USE.NAMES = FALSE))
    switch(spec[[name]],
      i = vapply(values, .wjbl_i, integer(1), USE.NAMES = FALSE),
      f = vapply(values, .wjbl_f, double(1), USE.NAMES = FALSE),
      s = vapply(values, .wjbl_s, character(1), USE.NAMES = FALSE)
    )
  })
  names(cols) <- names(spec)
  dplyr::as_tibble(cols)
}

# ---------------------------------------------------------------------------
# Row helpers
# ---------------------------------------------------------------------------

#' Python `{**a, **b, ...}`: later keys win; a `NULL` value is kept as a key (Python `None`).
#' @noRd
.wjbl_merge <- function(...) {
  out <- list()
  for (x in list(...)) for (k in names(x)) out[k] <- list(x[[k]])
  out
}

#' Rows of a list route: `items` of the wrapped body, or a bare list.
#' @noRd
.wjbl_items <- function(raw) if (.wjbl_is_obj(raw)) .wjbl_rows(raw[["items"]]) else .wjbl_rows(raw)

#' @noRd
.wjbl_request <- function(raw) .wjbl_obj(.wjbl_obj(raw)[["_request"]])

#' The objects of a map keyed by a position or an id, in numeric key order (non-numeric keys last).
#' @noRd
.wjbl_keyed <- function(x) {
  if (!.wjbl_is_obj(x) || !length(x)) return(list())
  keys <- names(x)
  num <- grepl("^[0-9]+$", keys)
  ord <- c(which(num)[order(as.numeric(keys[num]))], which(!num))
  Filter(.wjbl_is_obj, unname(x[ord]))
}

#' `obj$a` when the key is present (even as `null`), else `obj$b` (Python `obj.get(a, obj.get(b))`).
#' @noRd
.wjbl_get_or <- function(obj, a, b) if (a %in% names(obj)) obj[[a]] else obj[[b]]

#' The captured groups of a perl regex, or `NULL` (`search = FALSE` anchors nothing itself).
#' @noRd
.wjbl_match <- function(x, re) {
  x <- .intl_ascii_digits(x) # full-width digits, as sdv-py's \d / int() read them
  if (!is.character(x) || length(x) != 1L || is.na(x)) return(NULL)
  m <- regmatches(x, regexec(re, x, perl = TRUE))[[1]]
  if (length(m)) m[-1] else NULL
}

#' Seconds in a `m:ss` / `mmm:ss` clock string, else `NA`.
#' @noRd
.wjbl_seconds <- function(clock) {
  m <- .wjbl_match(clock, "(*UCP)^\\s*([0-9]+):([0-9]{2})\\s*$")
  if (is.null(m)) NA_integer_ else as.integer(m[[1]]) * 60L + as.integer(m[[2]])
}

#' The integer in a counted string ('6<hon>', '0<kai>'), else `NA`.
#' @noRd
.wjbl_counter <- function(v) {
  if (is.character(v) && length(v) == 1L) {
    m <- .wjbl_match(v, "(*UCP)^\\s*([0-9]+)\\s*\\D{0,2}\\s*$") # Python \D: any non-digit, Unicode-aware
    return(if (is.null(m)) NA_integer_ else as.integer(m[[1]]))
  }
  .wjbl_i(v)
}

#' Q1-Q4, OT1-OT10 (5-14), H1 / H2 (15 / 16), OT (17, all overtimes) and GAME (18) for a period category.
#' @noRd
.wjbl_period_label <- function(category) {
  if (is.na(category)) return(NA_character_)
  if (category >= 1L && category <= 4L) return(paste0("Q", category))
  if (category >= 5L && category <= 14L) return(paste0("OT", category - 4L))
  unname(c(`15` = "H1", `16` = "H2", `17` = "OT", `18` = "GAME")[as.character(category)])
}

#' ISO date from `('2026', '04.04')` or from a Japanese date ('2026<Y>4<M>4<D>(<weekday>)'); else `NA`.
#' @noRd
.wjbl_game_day <- function(value, year = NULL) {
  m <- .wjbl_match(value, "(*UCP)^\\s*([0-9]{4})\u5e74([0-9]{1,2})\u6708([0-9]{1,2})\u65e5")
  if (!is.null(m)) return(sprintf("%04d-%02d-%02d", as.integer(m[[1]]), as.integer(m[[2]]), as.integer(m[[3]])))
  m <- .wjbl_match(value, "(*UCP)^\\s*([0-9]{2})\\.([0-9]{2})\\s*$")
  y <- .wjbl_i(year)
  if (!is.null(m) && !is.na(y)) return(sprintf("%04d-%s-%s", y, m[[1]], m[[2]]))
  NA_character_
}

#' @noRd
.wjbl_prefix <- function(block, side) structure(block, names = paste0(side, "_", names(block)))

# ---------------------------------------------------------------------------
# Parsers (one per wrapper)
# ---------------------------------------------------------------------------

#' @noRd
.wjbl_parse_leagues <- function(raw) {
  rows <- lapply(.wjbl_items(raw), function(r) .wjbl_merge(r, list(season = .wjbl_season_of_title(r[["league_title"]]))))
  .wjbl_finish(rows, "leagues")
}

#' @noRd
.wjbl_parse_game_months <- function(raw) {
  body <- .wjbl_obj(raw)
  head <- list(league_id = .wjbl_i(body[["league_id"]]), season = .wjbl_request(raw)[["season"]])
  .wjbl_finish(lapply(.wjbl_rows(body[["game_months"]]), function(m) .wjbl_merge(m, head)), "game_months")
}

#' @noRd
.wjbl_parse_schedule <- function(raw) {
  body <- .wjbl_obj(raw)
  head <- list(league_id = body[["league_id"]], league_title = body[["league_title"]],
               season = .wjbl_season_of_title(body[["league_title"]]))
  rows <- list()
  for (phase in .wjbl_keyed(body[["seasons"]])) {
    ph <- list(season_id = phase[["season_id"]], season_title = phase[["season_title"]],
               season_full_name = phase[["season_full_name"]])
    for (game in .wjbl_rows(phase[["play_schedules"]])) {
      row <- .wjbl_merge(head, ph, game)
      row["game_day"] <- list(.wjbl_game_day(game[["game_date"]], game[["game_year"]]))
      rows[[length(rows) + 1L]] <- row
    }
  }
  .wjbl_finish(rows, "schedule")
}

#' @noRd
.wjbl_parse_game <- function(raw) {
  body <- .wjbl_obj(raw)
  if (!length(body) || is.null(body[["play_schedule_id"]])) return(.wjbl_finish(list(), "game"))
  row <- list(play_schedule_id = body[["play_schedule_id"]], game_status = body[["game_status"]])
  for (side in c("home", "away")) row <- .wjbl_merge(row, .wjbl_prefix(.wjbl_obj(body[[side]]), side))
  .wjbl_finish(list(row), "game")
}

#' @noRd
.wjbl_parse_period_scores <- function(raw) {
  body <- .wjbl_obj(raw)
  keys <- c(paste0("score_p", 1:4), paste0("score_ot", 1:4))
  labels <- c(paste0("Q", 1:4), paste0("OT", 1:4))
  rows <- list()
  for (side in c("home", "away")) {
    block <- .wjbl_obj(body[[side]])
    for (i in seq_along(keys)) {
      if (!is.na(.wjbl_i(block[[keys[[i]]]]))) {
        rows[[length(rows) + 1L]] <- list(
          play_schedule_id = body[["play_schedule_id"]], team_side = side, team_id = block[["team_id"]],
          period = i, period_label = labels[[i]], score = block[[keys[[i]]]]
        )
      }
    }
  }
  .wjbl_finish(rows, "period_scores")
}

#' @noRd
.wjbl_parse_game_info <- function(raw) {
  body <- .wjbl_obj(raw)
  if (!length(body) || is.null(body[["play_schedule_id"]])) return(.wjbl_finish(list(), "game_info"))
  keep <- !grepl("contact", names(body), fixed = TRUE) & !vapply(body, .wjbl_is_obj, logical(1))
  row <- .wjbl_merge(body[keep], list(season = .wjbl_season_of_title(body[["league_title"]]),
                                      game_day = .wjbl_game_day(body[["game_date"]])))
  for (side in c("home", "away")) row <- .wjbl_merge(row, .wjbl_prefix(.wjbl_obj(body[[side]]), side))
  .wjbl_finish(list(row), "game_info")
}

#' @noRd
.wjbl_parse_box_score <- function(raw) {
  body <- .wjbl_obj(raw)
  rows <- list()
  for (side in c("home", "away")) {
    block <- .wjbl_obj(body[[side]])
    for (p in .wjbl_rows(block[["players"]])) {
      rows[[length(rows) + 1L]] <- .wjbl_merge(p, list(
        play_schedule_id = body[["play_schedule_id"]], team_side = side, team_id = block[["team_id"]],
        min_seconds = .wjbl_seconds(p[["min"]])
      ))
    }
  }
  .wjbl_finish(rows, "box_score")
}

#' @noRd
.wjbl_parse_team_box_score <- function(raw) {
  body <- .wjbl_obj(raw)
  rows <- list()
  for (side in c("home", "away")) {
    block <- .wjbl_obj(body[[side]])
    for (kind in c("team", "total")) {
      line <- .wjbl_obj(block[[kind]])
      if (!length(line)) next
      pct <- if (kind == "total") .wjbl_obj(block[["percentage"]]) else list()
      rows[[length(rows) + 1L]] <- .wjbl_merge(
        line,
        list(p2p = pct[["p2p"]], p3p = pct[["p3p"]], ftp = pct[["ftp"]], fgp = pct[["fgp"]]),
        list(play_schedule_id = body[["play_schedule_id"]], team_side = side, team_id = block[["team_id"]],
             row_type = kind, min_seconds = .wjbl_seconds(line[["min"]]))
      )
    }
  }
  .wjbl_finish(rows, "team_box_score")
}

#' @noRd
.wjbl_parse_pbp <- function(raw) {
  body <- .wjbl_obj(raw)
  rows <- lapply(.wjbl_rows(body[["play_by_plays"]]), function(p) {
    m <- .wjbl_match(p[["score"]], "(*UCP)^\\s*([0-9]+)-([0-9]+)\\s*$")
    side <- .wjbl_i(p[["home_away"]])
    .wjbl_merge(p, list(
      play_schedule_id = body[["play_schedule_id"]], seconds_remaining = .wjbl_seconds(p[["rest_time"]]),
      team_side = if (identical(side, 1L)) "home" else if (identical(side, 2L)) "away" else NULL,
      home_score = if (is.null(m)) NULL else as.integer(m[[1]]),
      away_score = if (is.null(m)) NULL else as.integer(m[[2]])
    ))
  })
  .wjbl_finish(rows, "pbp")
}

#' @noRd
.wjbl_period_rows <- function(raw) {
  body <- .wjbl_obj(raw)
  base <- list(play_schedule_id = body[["play_schedule_id"]], home_team_id = body[["home_team_id"]],
               away_team_id = body[["away_team_id"]])
  lapply(.wjbl_keyed(body[["periods"]]), function(p) {
    category <- .wjbl_i(.wjbl_get_or(p, "period_category", "periodCategory"))
    .wjbl_merge(base, p, list(period_category = category, period_label = .wjbl_period_label(category)))
  })
}

#' @noRd
.wjbl_parse_team_period_stats <- function(raw) {
  rows <- lapply(.wjbl_period_rows(raw), function(p) {
    row <- p
    for (side in c("home", "away")) {
      parts <- .wjbl_match(p[[paste0(side, "_rebound")]], "(*UCP)^\\s*([0-9]+)-([0-9]+)-([0-9]+)\\s*$")
      for (i in 1:3) {
        row[paste0(side, "_rebound_", c("off", "def", "tot")[[i]])] <- list(if (is.null(parts)) NULL else
          as.integer(parts[[i]]))
      }
      row[paste0(side, "_turnovers")] <- list(.wjbl_counter(.wjbl_get_or(p, paste0(side, "_trun_over"),
                                                                         paste0(side, "_turnovers"))))
      row[paste0(side, "_max_difference")] <- list(.wjbl_get_or(p, paste0(side, "_max_differenct"),
                                                                paste0(side, "_max_difference")))
    }
    row["lead_count"] <- list(.wjbl_counter(p[["lead_count"]]))
    row["tie_count"] <- list(.wjbl_counter(p[["tie_count"]]))
    row
  })
  .wjbl_finish(rows, "team_period_stats")
}

#' @noRd
.wjbl_parse_player_period_leaders <- function(raw) .wjbl_finish(.wjbl_period_rows(raw), "player_period_leaders")

#' The END year of an edition name: its first two space-separated words read as a league title.
#' @noRd
.wjbl_name_end <- function(name) {
  if (!is.character(name) || length(name) != 1L || is.na(name)) return(NA_integer_)
  at <- regexpr(" ", name, fixed = TRUE)
  if (at < 0) return(NA_integer_)
  rest <- substring(name, at + 1L)
  nxt <- regexpr(" ", rest, fixed = TRUE)
  second <- if (nxt < 0) rest else substr(rest, 1L, nxt - 1L)
  .wjbl_season_of_title(paste(substr(name, 1L, at - 1L), second))
}

#' @noRd
.wjbl_parse_standing_seasons <- function(raw) {
  rows <- list()
  for (edition in .wjbl_items(raw)) {
    name <- edition[["season_full_name"]]
    end <- .wjbl_name_end(name)
    for (phase in .wjbl_keyed(edition[["seasons"]])) {
      rows[[length(rows) + 1L]] <- .wjbl_merge(phase, list(season_full_name = name, season = end))
    }
  }
  .wjbl_finish(rows, "standing_seasons")
}

#' @noRd
.wjbl_parse_team_standings <- function(raw) {
  rows <- list()
  for (phase in .wjbl_items(raw)) {
    for (t in .wjbl_keyed(phase[["teams"]])) {
      wl <- t[["win_lost"]]
      m <- if (is.character(wl) && length(wl) == 1L && !is.na(wl)) {
        .wjbl_match(wl, "(*UCP)([0-9]+)\u52dd\\s*([0-9]+)\u8ca0")
      }
      rows[[length(rows) + 1L]] <- .wjbl_merge(phase, t, list(
        wins = if (is.null(m)) NULL else as.integer(m[[1]]),
        losses = if (is.null(m)) NULL else as.integer(m[[2]])
      ))
    }
  }
  .wjbl_finish(rows, "team_standings")
}

#' @noRd
.wjbl_parse_head_to_head <- function(raw) {
  rows <- list()
  for (phase in .wjbl_items(raw)) {
    for (t in .wjbl_keyed(phase[["teams"]])) {
      for (opp in .wjbl_keyed(t[["vs_teams"]])) {
        games <- .wjbl_rows(opp[["scores"]])
        for (n in seq_along(games)) {
          rows[[length(rows) + 1L]] <- .wjbl_merge(games[[n]], list(
            season_id = phase[["season_id"]], team_id = t[["team_id"]], opponent_team_id = opp[["team_id"]],
            game_number = n
          ))
        }
      }
    }
  }
  .wjbl_finish(rows, "head_to_head")
}

#' @noRd
.wjbl_parse_team_ranking <- function(raw) {
  body <- .wjbl_obj(raw)
  head <- list(league_id = body[["league_id"]], league_title = body[["league_title"]],
               season = .wjbl_season_of_title(body[["league_title"]]))
  rows <- list()
  for (phase in .wjbl_keyed(body[["seasons"]])) {
    for (t in .wjbl_keyed(phase[["teams"]])) rows[[length(rows) + 1L]] <- .wjbl_merge(head, phase, t)
  }
  .wjbl_finish(rows, "team_ranking")
}

#' @noRd
.wjbl_parse_teams <- function(raw) .wjbl_finish(.wjbl_items(raw), "teams")

#' @noRd
.wjbl_roster_head <- function(raw) {
  body <- .wjbl_obj(raw)
  keys <- c("league_id", "league_title", "season_id", "season_full_name", "season_team_id", "team_id")
  .wjbl_merge(structure(lapply(keys, function(k) body[[k]]), names = keys),
              list(season = .wjbl_season_of_title(body[["league_title"]])))
}

#' @noRd
.wjbl_parse_roster <- function(raw) {
  body <- .wjbl_obj(raw)
  head <- .wjbl_merge(.wjbl_roster_head(raw), list(coach_id = body[["coach_id"]], coach_name = body[["coach_name"]],
                                                   team_comment = body[["comment"]]))
  .wjbl_finish(lapply(.wjbl_rows(body[["players"]]), function(p) .wjbl_merge(head, p)), "roster")
}

#' @noRd
.wjbl_parse_staff <- function(raw) {
  head <- .wjbl_roster_head(raw)
  .wjbl_finish(lapply(.wjbl_rows(.wjbl_obj(raw)[["staffs"]]), function(s) .wjbl_merge(head, s)), "staff")
}

#' @noRd
.wjbl_parse_player <- function(raw) {
  body <- .wjbl_obj(raw)
  if (is.null(body[["player_id"]])) return(.wjbl_finish(list(), "player"))
  keep <- names(body) != "player_blood" & !vapply(body, is.list, logical(1))
  row <- body[keep]
  for (pair in list(c("player_height", "player_height_cm"), c("player_weight", "player_weight_kg"))) {
    v <- row[[pair[[1]]]]
    m <- if (is.character(v) && length(v) == 1L && !is.na(v)) .wjbl_match(v, "(-?[0-9]+(?:\\.[0-9]+)?)")
    row[pair[[2]]] <- list(if (is.null(m)) NULL else as.integer(trunc(as.double(m[[1]]))))
  }
  .wjbl_finish(list(row), "player")
}

#' A `wehoop_data` tibble.
#' @noRd
.wjbl_out <- function(df, type) make_wehoop_data(df, type, Sys.time())
