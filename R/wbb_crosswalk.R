# wbb_crosswalk.R -- exported WBB cross-source crosswalk builder.
# ESPN-anchored: one row per ESPN team per season, joined to Fox Sports
# (by normalized display_name) and Torvik/Bart (by normalized school location
# + curated alias table). Yahoo columns are NA placeholders.

# ---------------------------------------------------------------------------
# Torvik -> ESPN location alias table
# Maps a Torvik `team` name to the matching ESPN `team` (location/school).
# Applied BEFORE normalizing so the resulting keys align.
# ---------------------------------------------------------------------------
.wbb_bart_alias <- c(
  "Connecticut"            = "UConn",
  "Mississippi"            = "Ole Miss",
  "N.C. State"             = "NC State",
  "Appalachian St."        = "App State",
  "Southeastern Louisiana" = "SE Louisiana",
  "Albany"                 = "UAlbany",
  "Illinois Chicago"       = "UIC",
  "Hawaii"                 = "Hawai'i",
  "Penn"                   = "Pennsylvania",
  "St. Thomas"             = "St. Thomas-Minnesota",
  "Tennessee Martin"       = "UT Martin",
  "Louisiana Monroe"       = "UL Monroe",
  "Nebraska Omaha"         = "Omaha",
  "Sam Houston St."        = "Sam Houston",
  "Nicholls St."           = "Nicholls",
  "Cal Baptist"            = "California Baptist",
  "Texas A&M Corpus Chris" = "Texas A&M-Corpus Christi",
  "IU Indy"                = "IU Indianapolis",
  "Grambling St."          = "Grambling",
  "Loyola MD"              = "Loyola Maryland",
  "McNeese St."            = "McNeese",
  "Seattle"                = "Seattle U",
  "Miami FL"               = "Miami",
  "UMKC"                   = "Kansas City",
  "FIU"                    = "Florida International",
  "LIU"                    = "Long Island University",
  "USC Upstate"            = "South Carolina Upstate"
)

# Fox display_name -> ESPN display_name alias table (normalized key -> key).
# The join uses .bb_normalize_team() on both sides; these aliases map Fox
# fox_team_name values (after normalization) to ESPN display_name values
# (after normalization) where the strings diverge.
.wbb_fox_display_alias <- c(
  # Fox keeps "State" / drops university suffixes differently
  "american eagles"                    = "american university eagles",
  "appalachian state mountaineers"     = "app state mountaineers",
  "central connecticut state blue devils"
                                       = "central connecticut blue devils",
  "delaware fightin blue hens"         = "delaware blue hens",
  "east tennessee state buccaneers"    = "east tennessee state bucs",
  "fdu knights"                        = "fairleigh dickinson knights",
  "grambling state lady tigers"        = "grambling lady tigers",
  "iu indy jaguars"                    = "iu indianapolis jaguars",
  "jackson state tigers"               = "jackson state lady tigers",
  "liu sharks"                         = "long island university sharks",
  "louisiana monroe warhawks"          = "ul monroe warhawks",
  "mcneese cowgirls"                   = "mcneese cowgirls",
  "nicholls state colonels"            = "nicholls colonels",
  # Fox "Southeastern Louisiana" vs ESPN "SE Louisiana"
  "southeastern louisiana lady lions"  = "se louisiana lady lions",
  "seattle redhawks"                   = "seattle u redhawks",
  "siu edwardsville cougars"           = "siu edwardsville cougars",
  "southern university jaguars"        = "southern jaguars",
  "st thomas tommies"                  = "st thomas minnesota tommies",
  "tennessee martin skyhawks"          = "ut martin skyhawks",
  "tennessee state tigers"             = "tennessee state lady tigers",
  "uconn huskies"                      = "uconn huskies",
  "uic flames"                         = "uic flames",
  "university at albany great danes"   = "ualbany great danes",
  "umass minutewomen"                  = "massachusetts minutewomen",
  "usc upstate spartans"               = "south carolina upstate spartans",
  # Fox "Miami (Fl)" vs ESPN "Miami"
  "miami fl hurricanes"                = "miami hurricanes",
  # Fox "Penn" vs ESPN "Pennsylvania"
  "penn quakers"                       = "pennsylvania quakers",
  # Fox "St. Francis (Pa)" vs ESPN "Saint Francis"
  "st francis pa red flash"            = "saint francis red flash"
)

# Internal: apply the Torvik alias table to a vector of Torvik team names.
#' @keywords internal
.wbb_apply_bart_alias <- function(x) {
  hit <- match(x, names(.wbb_bart_alias))
  ifelse(!is.na(hit), unname(.wbb_bart_alias[hit]), x)
}

# Internal: apply the Fox display-name alias table to a vector of normalized
# Fox team-name keys, returning the corresponding ESPN normalized key where
# an alias exists.
#' @keywords internal
.wbb_apply_fox_alias <- function(x) {
  hit <- match(x, names(.wbb_fox_display_alias))
  ifelse(!is.na(hit), unname(.wbb_fox_display_alias[hit]), x)
}

# ---------------------------------------------------------------------------
# Internal assembler (takes already-fetched source frames as plain data.frames)
# ---------------------------------------------------------------------------

#' @keywords internal
#' @importFrom dplyr transmute left_join mutate select if_else case_when
.bb_assemble_team_crosswalk_wbb <- function(espn, fox, bart, season) {

  # -- ESPN (dedupe, build keys) -------------------------------------------
  espn2 <- dplyr::transmute(
    espn[!duplicated(espn[["team_id"]]), ],
    espn_team_id      = as.integer(.data$team_id),
    espn_abbreviation = as.character(.data$abbreviation),
    espn_display_name = as.character(.data$display_name),
    espn_short_name   = as.character(.data$short_name),
    espn_location     = as.character(.data$team),
    espn_mascot       = as.character(.data$mascot),
    espn_conference   = as.character(.data$conference_name),
    # Fox match key: full mascot name normalized (e.g. "south carolina gamecocks")
    .fox_key  = .bb_normalize_team(.data$display_name),
    # Torvik match key: school/location normalized (e.g. "south carolina")
    .bart_key = .bb_normalize_college_team(.data$team)
  )

  # -- Fox (build key with alias bridge) ------------------------------------
  if (is.null(fox) || !nrow(fox)) {
    fox2 <- data.frame(
      fox_team_id   = character(),
      fox_team_name = character(),
      fox_section   = character(),
      .fox_key      = character(),
      stringsAsFactors = FALSE
    )
  } else {
    fox_norm <- .bb_normalize_team(fox[["fox_team_name"]])
    # Apply alias: where Fox normalized name differs from ESPN, redirect to
    # the ESPN normalized key.
    fox_key_bridged <- .wbb_apply_fox_alias(fox_norm)
    fox2 <- data.frame(
      fox_team_id   = as.character(fox[["fox_team_id"]]),
      fox_team_name = as.character(fox[["fox_team_name"]]),
      fox_section   = as.character(fox[["fox_section"]]),
      .fox_key      = fox_key_bridged,
      stringsAsFactors = FALSE
    )
    fox2 <- fox2[!duplicated(fox2$.fox_key), ]
  }

  # -- Torvik (alias + build key) ------------------------------------------
  bart_loc_aliased <- .wbb_apply_bart_alias(bart[["team"]])
  bart2 <- data.frame(
    bart_team  = as.character(bart[["team"]]),
    bart_conf  = as.character(bart[["conf"]]),
    .bart_key  = .bb_normalize_college_team(bart_loc_aliased),
    stringsAsFactors = FALSE
  )
  bart2 <- bart2[!duplicated(bart2$.bart_key), ]

  # -- Join (exact on normalized keys) ------------------------------------
  out <- espn2 |>
    dplyr::left_join(fox2,  by = ".fox_key") |>
    dplyr::left_join(bart2, by = ".bart_key") |>
    dplyr::mutate(
      season                = as.integer(season),
      yahoo_team_id         = NA_character_,
      yahoo_team_name       = NA_character_,
      fox_match_confidence  = dplyr::if_else(
        !is.na(.data$fox_team_id),  1, NA_real_
      ),
      bart_match_confidence = dplyr::if_else(
        !is.na(.data$bart_team), 1, NA_real_
      ),
      match_method = dplyr::case_when(
        !is.na(.data$fox_team_id) & !is.na(.data$bart_team) ~ "fox+bart",
        !is.na(.data$fox_team_id)                            ~ "fox_only",
        !is.na(.data$bart_team)                              ~ "bart_only",
        TRUE                                                 ~ "espn_only"
      )
    ) |>
    dplyr::select(
      "season",
      "espn_team_id", "espn_abbreviation", "espn_display_name",
      "espn_short_name", "espn_location", "espn_mascot", "espn_conference",
      "fox_team_id", "fox_team_name", "fox_section",
      "bart_team", "bart_conf",
      "yahoo_team_id", "yahoo_team_name",
      "fox_match_confidence", "bart_match_confidence", "match_method"
    )
  out
}

# ---------------------------------------------------------------------------
# Exported builder
# ---------------------------------------------------------------------------

#' **Get the WBB cross-source team crosswalk**
#' @name wbb_team_crosswalk
NULL
#' @title
#' **Get the WBB cross-source team crosswalk**
#' @rdname wbb_team_crosswalk
#' @description
#' Build a wide, one-row-per-team-per-season crosswalk linking ESPN,
#' Fox Sports (Bifrost), and Bart Torvik (barttorvik.com/ncaaw) women's
#' college basketball team identities, keyed on `espn_team_id`. Yahoo
#' columns are NA placeholders. ESPN is deduped by `team_id` (first
#' occurrence kept). Fox is joined on the full normalized mascot name (with
#' a curated alias bridge for cases where Fox and ESPN differ); Torvik is
#' joined on the normalized school/location name after a curated alias pass
#' for common divergences (e.g. "UConn" / "Connecticut", "Ole Miss" /
#' "Mississippi").
#'
#' @param season Season year (4-digit, e.g. `2025`). Defaults to
#'   `most_recent_wbb_season()`.
#' @param fox An already-fetched `fox_wbb_teams_all()` frame, or `NULL`
#'   (default) to fetch live. Accepts a pre-fetched frame to avoid the
#'   ~60-second Fox enumeration when calling repeatedly.
#' @return A `wehoop_data` tibble, one row per ESPN team:
#'
#'   |col_name               |types     |description                                      |
#'   |:----------------------|:---------|:------------------------------------------------|
#'   |season                 |integer   |Season year.                                     |
#'   |espn_team_id           |integer   |ESPN team id (canonical key).                    |
#'   |espn_abbreviation      |character |ESPN abbreviation.                               |
#'   |espn_display_name      |character |ESPN display name (school + mascot).             |
#'   |espn_short_name        |character |ESPN short name.                                 |
#'   |espn_location          |character |ESPN school/location only.                       |
#'   |espn_mascot            |character |ESPN mascot/nickname.                            |
#'   |espn_conference        |character |ESPN conference name.                            |
#'   |fox_team_id            |character |Fox Bifrost team id (NA if unmatched).           |
#'   |fox_team_name          |character |Fox team name (NA if unmatched).                 |
#'   |fox_section            |character |Fox conference/section label (NA if unmatched).  |
#'   |bart_team              |character |Torvik team name (NA if unmatched).              |
#'   |bart_conf              |character |Torvik conference abbreviation (NA if unmatched).|
#'   |yahoo_team_id          |character |Yahoo team id (NA placeholder).                  |
#'   |yahoo_team_name        |character |Yahoo team name (NA placeholder).                |
#'   |fox_match_confidence   |numeric   |1 for matched, NA for unmatched.                 |
#'   |bart_match_confidence  |numeric   |1 for matched, NA for unmatched.                 |
#'   |match_method           |character |"fox+bart"/"fox_only"/"bart_only"/"espn_only".   |
#'
#' @importFrom dplyr transmute left_join mutate select if_else case_when
#' @export
#' @family WBB Crosswalk Functions
#' @examples
#' \donttest{
#'   try(wbb_team_crosswalk(season = 2025))
#' }
wbb_team_crosswalk <- function(season = most_recent_wbb_season(),
                               fox = NULL) {
  .args <- .capture_args()
  out <- data.frame()
  tryCatch(
    expr = {
      espn_raw <- espn_wbb_teams(year = season)
      bart_raw <- bart_wbb_ratings(year = season)
      fox_raw  <- if (!is.null(fox)) fox else {
        tryCatch(fox_wbb_teams_all(), error = function(e) NULL)
      }
      out <- .bb_assemble_team_crosswalk_wbb(
        espn   = as.data.frame(espn_raw),
        fox    = if (!is.null(fox_raw)) as.data.frame(fox_raw) else NULL,
        bart   = as.data.frame(bart_raw),
        season = season
      ) |>
        make_wehoop_data(
          "WBB team crosswalk (ESPN / Fox / Torvik)",
          Sys.time()
        )
    },
    error   = function(e) .report_api_error(
      e,
      hint = "Could not build WBB team crosswalk for {season}!",
      args = .args
    ),
    warning = function(w) .report_api_warning(
      w,
      hint = "Warning building WBB team crosswalk for {season}",
      args = .args
    ),
    finally = {}
  )
  out
}

# ---------------------------------------------------------------------------
# wbb_schedule_crosswalk
# ---------------------------------------------------------------------------

#' @keywords internal
#' @importFrom dplyr transmute full_join mutate select case_when if_else
.bb_assemble_schedule_crosswalk_wbb <- function(espn_games, bart_games, team_xwalk, season) {
  # Build a lookup: normalized Torvik team name -> espn_team_id
  # Use the same alias pass that wbb_team_crosswalk uses, then normalize via
  # .bb_normalize_college_team. The team_xwalk has espn_location (school name)
  # and bart_team (Torvik name); we need bart_team -> espn_team_id.
  bart_lookup <- team_xwalk[!is.na(team_xwalk$bart_team), , drop = FALSE]
  # key: normalized Torvik team name (after alias already applied in team_xwalk)
  bart_lookup$.bart_key <- .bb_normalize_college_team(
    .wbb_apply_bart_alias(as.character(bart_lookup$bart_team))
  )

  # Resolve Torvik team1/team2 names -> espn_team_id
  bart_key1 <- .bb_normalize_college_team(.wbb_apply_bart_alias(as.character(bart_games$team1)))
  bart_key2 <- .bb_normalize_college_team(.wbb_apply_bart_alias(as.character(bart_games$team2)))

  t1_espn_id <- bart_lookup$espn_team_id[match(bart_key1, bart_lookup$.bart_key)]
  t2_espn_id <- bart_lookup$espn_team_id[match(bart_key2, bart_lookup$.bart_key)]

  # Pair key: sort espn ids and paste so team1/team2 ordering doesn't matter
  .pair_key <- function(a, b) {
    ids <- matrix(c(as.integer(a), as.integer(b)), ncol = 2)
    apply(ids, 1, function(row) {
      if (any(is.na(row))) NA_character_
      else paste(sort(row), collapse = "_")
    })
  }

  # ESPN side
  espn2 <- dplyr::transmute(
    espn_games,
    game_date        = .data$game_date,
    home_espn_team_id = as.integer(.data$home_espn_team_id),
    away_espn_team_id = as.integer(.data$away_espn_team_id),
    espn_game_id     = as.character(.data$espn_game_id),
    .pair_key        = .pair_key(.data$home_espn_team_id, .data$away_espn_team_id)
  )

  # Torvik side — keep ALL games; those where either team name cannot be
  # resolved to an ESPN id get a NA pair_key and surface as bart_only rows
  # (home_espn_team_id / away_espn_team_id / espn_game_id all NA) rather than
  # being silently dropped.
  bart2 <- data.frame(
    game_date        = bart_games$game_date,
    bart_muid        = as.character(bart_games$muid),
    bart_team1       = as.character(bart_games$team1),
    bart_team2       = as.character(bart_games$team2),
    bart_winner      = as.character(bart_games$winner),
    .t1_id           = t1_espn_id,
    .t2_id           = t2_espn_id,
    stringsAsFactors = FALSE
  )
  # Pair key is NA when either team couldn't be resolved; those rows will land
  # in the full_join as bart_only (no ESPN match possible without a pair key).
  bart2$.pair_key <- .pair_key(bart2$.t1_id, bart2$.t2_id)
  bart2$.t1_id <- NULL
  bart2$.t2_id <- NULL

  key <- c("game_date", ".pair_key")
  out <- dplyr::full_join(espn2, bart2, by = key) |>
    dplyr::mutate(
      season         = as.integer(season),
      fox_game_id    = NA_character_,
      yahoo_game_id  = NA_character_,
      match_method   = dplyr::case_when(
        !is.na(.data$espn_game_id) & !is.na(.data$bart_muid) ~ "both",
        !is.na(.data$espn_game_id)                           ~ "espn_only",
        TRUE                                                  ~ "bart_only"
      ),
      match_confidence = dplyr::if_else(.data$match_method == "both", 1, NA_real_)
    ) |>
    dplyr::select(
      "season", "game_date",
      "home_espn_team_id", "away_espn_team_id",
      "espn_game_id", "bart_muid", "bart_team1", "bart_team2", "bart_winner",
      "fox_game_id", "yahoo_game_id",
      "match_method", "match_confidence"
    )
  out
}

#' **Get the WBB cross-source schedule crosswalk**
#' @name wbb_schedule_crosswalk
NULL
#' @title
#' **Get the WBB cross-source schedule crosswalk**
#' @rdname wbb_schedule_crosswalk
#' @description
#' Build a wide, one-row-per-game crosswalk linking ESPN and Bart Torvik
#' (barttorvik.com/ncaaw) game identifiers for a WBB season. Fox Sports and
#' Yahoo game IDs are NA placeholders. Dates are reduced to Eastern-Time game
#' dates before joining; Torvik `team1`/`team2` are unordered (the join uses
#' a sorted team-pair key, so home/away from the Torvik side is not preserved).
#' Games where either Torvik team name cannot be resolved to an ESPN id via
#' `wbb_team_crosswalk()` are kept as `bart_only` rows.
#'
#' @param season Season year (4-digit, e.g. `2025`). Defaults to
#'   `most_recent_wbb_season()`.
#' @return A `wehoop_data` tibble, one row per game:
#'
#'    |col_name            |types     |description                                       |
#'    |:-------------------|:---------|:-------------------------------------------------|
#'    |season              |integer   |Season year.                                      |
#'    |game_date           |Date      |ET game date.                                     |
#'    |home_espn_team_id   |integer   |ESPN home team id (NA for bart-only rows).        |
#'    |away_espn_team_id   |integer   |ESPN away team id (NA for bart-only rows).        |
#'    |espn_game_id        |character |ESPN game id (NA for bart-only rows).             |
#'    |bart_muid           |character |Torvik muid (NA for espn-only rows).              |
#'    |bart_team1          |character |Torvik team1 name (NA for espn-only rows).        |
#'    |bart_team2          |character |Torvik team2 name (NA for espn-only rows).        |
#'    |bart_winner         |character |Torvik winner name (NA for espn-only rows).       |
#'    |fox_game_id         |character |Fox game id (NA placeholder).                     |
#'    |yahoo_game_id       |character |Yahoo game id (NA placeholder).                   |
#'    |match_method        |character |"both"/"espn_only"/"bart_only".                   |
#'    |match_confidence    |numeric   |1 for matched, NA for unmatched.                  |
#'
#' @importFrom dplyr transmute bind_rows
#' @export
#' @family WBB Crosswalk Functions
#' @examples
#' \donttest{
#'   try(wbb_schedule_crosswalk(season = 2025))
#' }
wbb_schedule_crosswalk <- function(season = most_recent_wbb_season()) {
  .args <- .capture_args()
  out <- data.frame()
  tryCatch(
    expr = {
      # Pass an empty Fox frame so wbb_team_crosswalk() skips the expensive
      # fox_wbb_teams_all() enumeration (~40-60 network calls). The schedule
      # crosswalk only needs espn_team_id + bart_team from the team crosswalk;
      # fox_team_id is not required here (wbb_player_crosswalk() does need Fox,
      # so its call to wbb_team_crosswalk() is left as-is with fox = NULL).
      .empty_fox <- data.frame(
        fox_team_id   = character(),
        fox_team_name = character(),
        fox_section   = character(),
        stringsAsFactors = FALSE
      )
      team_xwalk <- wbb_team_crosswalk(season = season, fox = .empty_fox)

      # --- Torvik side -------------------------------------------------------
      bart_raw  <- bart_wbb_game_schedule(year = season)
      bart_games <- dplyr::transmute(
        bart_raw,
        muid    = as.character(.data$muid),
        game_date = as.Date(as.character(.data$date), format = "%m/%d/%y"),
        team1   = as.character(.data$team1),
        team2   = as.character(.data$team2),
        winner  = as.character(.data$winner)
      )
      # Drop rows with unparseable dates
      bart_games <- bart_games[!is.na(bart_games$game_date), , drop = FALSE]

      # --- ESPN side ---------------------------------------------------------
      # Derive unique ET dates from Torvik and call the WBB scoreboard once
      # per date. ~150 calls for a full season.
      dates <- sort(unique(bart_games$game_date))
      espn_list <- lapply(dates, function(d) {
        sb <- tryCatch(
          espn_wbb_scoreboard(season = as.integer(format(d, "%Y%m%d"))),
          error = function(e) NULL
        )
        if (is.null(sb) || !nrow(sb)) return(NULL)
        dplyr::transmute(
          sb,
          espn_game_id      = as.character(.data$game_id),
          game_date         = .bb_to_eastern(.data$game_date_time),
          home_espn_team_id = as.integer(.data$home_team_id),
          away_espn_team_id = as.integer(.data$away_team_id)
        )
      })
      espn_games <- dplyr::bind_rows(espn_list)

      out <- .bb_assemble_schedule_crosswalk_wbb(
        espn_games  = espn_games,
        bart_games  = bart_games,
        team_xwalk  = as.data.frame(team_xwalk),
        season      = season
      ) |>
        make_wehoop_data("WBB schedule crosswalk (ESPN / Torvik)", Sys.time())
    },
    error   = function(e) .report_api_error(
      e, hint = "Could not build WBB schedule crosswalk for {season}!", args = .args
    ),
    warning = function(w) .report_api_warning(
      w, hint = "Warning building WBB schedule crosswalk for {season}", args = .args
    ),
    finally = {}
  )
  out
}

# ---------------------------------------------------------------------------
# wbb_player_crosswalk
# ---------------------------------------------------------------------------

#' @keywords internal
#' @importFrom dplyr transmute left_join mutate select
.bb_assemble_player_crosswalk_wbb <- function(espn, fox, season, min_confidence = 0.92) {
  espn2 <- dplyr::mutate(
    espn,
    .block    = as.character(.data$espn_team_id),
    .name_key = .bb_normalize_name(.data$espn_full_name)
  )

  l <- dplyr::transmute(
    espn2,
    .block    = .data$.block,
    .id       = .data$espn_athlete_id,
    .name_key = .data$.name_key,
    .jersey   = as.character(.data$espn_jersey)
  )

  if (nrow(fox)) {
    rf <- dplyr::transmute(
      fox,
      .block    = as.character(.data$espn_team_id),
      .id       = as.character(.data$fox_athlete_id),
      .name_key = .bb_normalize_name(.data$fox_player),
      .jersey   = as.character(.data$fox_jersey)
    )
    lf <- dplyr::transmute(
      espn2,
      .block    = .data$.block,
      .id       = .data$espn_athlete_id,
      .name_key = .data$.name_key,
      .jersey   = as.character(.data$espn_jersey)
    )
    m_fox <- .bb_fuzzy_match(lf, rf, min_confidence = min_confidence)
  } else {
    m_fox <- data.frame(
      left_id          = l$.id,
      right_id         = NA_character_,
      match_method     = "unmatched",
      match_confidence = NA_real_,
      stringsAsFactors = FALSE
    )
  }

  out <- espn2 |>
    dplyr::transmute(
      season            = as.integer(season),
      espn_team_id      = as.integer(.data$espn_team_id),
      team_abbreviation = as.character(.data$team_abbreviation),
      player_name       = .data$.name_key,
      espn_athlete_id   = as.character(.data$espn_athlete_id),
      espn_full_name    = as.character(.data$espn_full_name),
      espn_jersey       = as.character(.data$espn_jersey),
      espn_position     = as.character(.data$espn_position)
    ) |>
    dplyr::left_join(
      dplyr::transmute(
        m_fox,
        espn_athlete_id  = .data$left_id,
        fox_athlete_id   = .data$right_id,
        match_method     = .data$match_method,
        match_confidence = .data$match_confidence
      ),
      by = "espn_athlete_id"
    )

  if (nrow(fox)) {
    out <- dplyr::left_join(
      out,
      dplyr::transmute(
        fox,
        fox_athlete_id   = as.character(.data$fox_athlete_id),
        fox_player       = .data$fox_player,
        fox_jersey       = as.character(.data$fox_jersey),
        fox_position_group = .data$fox_position_group
      ),
      by = "fox_athlete_id"
    )
  } else {
    out$fox_player        <- NA_character_
    out$fox_jersey        <- NA_character_
    out$fox_position_group <- NA_character_
  }

  out |>
    dplyr::mutate(
      yahoo_player_id   = NA_character_,
      yahoo_player_name = NA_character_,
      match_keys        = NA_character_
    ) |>
    dplyr::select(
      "season", "espn_team_id", "team_abbreviation", "player_name",
      "espn_athlete_id", "espn_full_name", "espn_jersey", "espn_position",
      "fox_athlete_id", "fox_player", "fox_jersey", "fox_position_group",
      "yahoo_player_id", "yahoo_player_name",
      "match_method", "match_confidence", "match_keys"
    )
}

#' **Get the WBB cross-source player crosswalk**
#' @name wbb_player_crosswalk
NULL
#' @title
#' **Get the WBB cross-source player crosswalk**
#' @rdname wbb_player_crosswalk
#' @description
#' Build a wide, one-row-per-player-per-team crosswalk linking ESPN and Fox
#' Sports (Bifrost) WBB player identities for a season. ESPN is the anchor
#' source; Fox is matched by normalized name (exact first, then Jaro-Winkler
#' fuzzy with jersey tiebreaker) within each team block. Yahoo columns are NA
#' placeholders. Torvik and the WNBA Stats API have no per-player tables for
#' WBB, so neither source is joined.
#'
#' @param season Season year (4-digit, e.g. `2025`). Defaults to
#'   `most_recent_wbb_season()`.
#' @param min_confidence Jaro-Winkler similarity floor for fuzzy matches
#'   (default 0.92).
#' @return A `wehoop_data` tibble, one row per player per team (ESPN-anchored):
#'
#'    |col_name            |types     |description                                       |
#'    |:-------------------|:---------|:-------------------------------------------------|
#'    |season              |integer   |Season year.                                      |
#'    |espn_team_id        |integer   |ESPN team id (canonical key).                     |
#'    |team_abbreviation   |character |ESPN team abbreviation.                           |
#'    |player_name         |character |Normalized player name (matching key).            |
#'    |espn_athlete_id     |character |ESPN athlete id.                                  |
#'    |espn_full_name      |character |ESPN full name.                                   |
#'    |espn_jersey         |character |ESPN jersey number.                               |
#'    |espn_position       |character |ESPN position abbreviation.                       |
#'    |fox_athlete_id      |character |Fox athlete id (NA if unmatched).                 |
#'    |fox_player          |character |Fox player name (NA if unmatched).                |
#'    |fox_jersey          |character |Fox jersey number (NA if unmatched).              |
#'    |fox_position_group  |character |Fox position group label (NA if unmatched).       |
#'    |yahoo_player_id     |character |Yahoo player id (NA placeholder).                 |
#'    |yahoo_player_name   |character |Yahoo player name (NA placeholder).               |
#'    |match_method        |character |"exact_name"/"fuzzy_jw"/"unmatched".              |
#'    |match_confidence    |numeric   |Jaro-Winkler score or 1 for exact (NA if none).  |
#'    |match_keys          |character |NA (reserved for future use).                     |
#'
#' @importFrom dplyr transmute bind_rows
#' @importFrom purrr map list_rbind
#' @export
#' @family WBB Crosswalk Functions
#' @examples
#' \donttest{
#'   try(wbb_player_crosswalk(season = 2025))
#' }
wbb_player_crosswalk <- function(season = most_recent_wbb_season(),
                                  min_confidence = 0.92) {
  .args <- .capture_args()
  out <- data.frame()
  tryCatch(
    expr = {
      team_xwalk <- wbb_team_crosswalk(season = season)

      fetch_team <- function(i) {
        espn_id <- team_xwalk$espn_team_id[i]
        fox_id  <- team_xwalk$fox_team_id[i]
        abbr    <- team_xwalk$espn_abbreviation[i]

        er <- tryCatch(
          espn_wbb_team_roster(team_id = espn_id, season = season),
          error = function(e) NULL
        )
        if (is.null(er) || !nrow(er)) return(NULL)
        espn <- dplyr::transmute(
          er,
          espn_team_id      = as.integer(espn_id),
          team_abbreviation = abbr,
          espn_athlete_id   = as.character(.data$athlete_id),
          espn_full_name    = .data$full_name,
          espn_jersey       = .data$jersey,
          espn_position     = .data$position_abbrev
        )

        fr <- if (!is.na(fox_id))
          tryCatch(fox_wbb_team_roster(team_id = fox_id), error = function(e) NULL)
        else
          NULL
        fox <- if (!is.null(fr) && nrow(fr)) dplyr::transmute(
          fr,
          espn_team_id   = as.integer(espn_id),
          fox_athlete_id = as.character(.data$athlete_id),
          fox_player     = .data$player,
          fox_jersey     = if ("x" %in% names(fr)) as.character(.data$x)
                           else if ("jersey" %in% names(fr)) as.character(.data$jersey)
                           else NA_character_,
          fox_position_group = .data$position_group
        )
        else
          data.frame(
            espn_team_id       = integer(),
            fox_athlete_id     = character(),
            fox_player         = character(),
            fox_jersey         = character(),
            fox_position_group = character(),
            stringsAsFactors   = FALSE
          )

        .bb_assemble_player_crosswalk_wbb(espn, fox, season, min_confidence)
      }

      out <- purrr::map(seq_len(nrow(team_xwalk)), fetch_team) |>
        purrr::list_rbind() |>
        make_wehoop_data("WBB player crosswalk (ESPN / Fox)", Sys.time())
    },
    error   = function(e) .report_api_error(
      e, hint = "Could not build WBB player crosswalk for {season}!", args = .args
    ),
    warning = function(w) .report_api_warning(
      w, hint = "Warning building WBB player crosswalk for {season}", args = .args
    ),
    finally = {}
  )
  out
}
