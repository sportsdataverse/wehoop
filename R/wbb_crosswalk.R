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
#' @author Saiem Gilani
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
