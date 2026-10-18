# intl_basketball_competitions.R -- the per-competition alias registry.
#
# Copied from sdv-py tools/codegen/basketball_competitions.yaml (sdv-py origin/main
# e3d232e), keeping the wehoop genders only (women + both). One entry per competition
# over the three multi-competition engines:
#   fiba    ids$family_id = GDAP competitionMarketingNameId (one edition per season)
#   genius  ids$org = hosted ORG code, ids$live_org = LiveStats ORG of its /u/ shells;
#           label_include / label_exclude = case-insensitive regexes over the
#           competition label that pick THE competition of a season
#   atrium  ids$website_id = the embed site config id
# Every entry carries key, prefix (the alias prefix, `<prefix>_schedule`), label,
# ids, gender and season_rule; extra engine fields follow. The alias functions
# themselves live in each engine's own file (R/fiba*.R, R/genius*.R, R/atrium*.R),
# not here. To add a competition: add it to the sdv-py YAML first, then copy the
# entry here if its gender is women + both.

#' Competition registry, by engine (internal).
#' @noRd
.intl_basketball_competitions <- list(
  fiba = list(
    list(
      key = "womens_world_cup",
      prefix = "fiba_wwc",
      label = "FIBA Women's Basketball World Cup",
      ids = list(family_id = 306L),
      gender = "women",
      season_rule = "event year (2022 = 2022)",
      example_season = 2022L
    ),
    list(
      key = "olympics_women",
      prefix = "fiba_woly",
      label = "Women's Olympic Basketball Tournament",
      ids = list(family_id = 352L),
      gender = "women",
      season_rule = "event year (Paris 2024 = 2024)",
      example_season = 2024L
    ),
    list(
      key = "euroleague_women",
      prefix = "fiba_elw",
      label = "EuroLeague Women (FIBA Women's European Club Competitions Tier 1)",
      ids = list(family_id = 211L),
      gender = "women",
      season_rule = "END year (2024-25 = 2025)",
      example_season = 2025L
    ),
    list(
      key = "womens_eurobasket",
      prefix = "fiba_weurobasket",
      label = "FIBA Women's EuroBasket",
      ids = list(family_id = 297L),
      gender = "women",
      season_rule = "event year (2025 = 2025)",
      example_season = 2025L
    ),
    list(
      key = "eurocup_women",
      prefix = "fiba_ecw",
      label = "EuroCup Women (FIBA Women's European Club Competitions Tier 2)",
      ids = list(family_id = 165L),
      gender = "women",
      season_rule = "END year (2024-25 = 2025)",
      example_season = 2025L
    ),
    list(
      key = "womens_americup",
      prefix = "fiba_wamericup",
      label = "FIBA Women's AmeriCup",
      ids = list(family_id = 303L),
      gender = "women",
      season_rule = "event year (2025 = 2025)",
      example_season = 2025L
    ),
    list(
      key = "womens_asia_cup",
      prefix = "fiba_wasiacup",
      label = "FIBA Women's Asia Cup (Division A)",
      ids = list(family_id = 305L),
      gender = "women",
      season_rule = "event year (2025 = 2025)",
      example_season = 2025L
    ),
    list(
      key = "womens_afrobasket",
      prefix = "fiba_wafrobasket",
      label = "FIBA Women's AfroBasket",
      ids = list(family_id = 302L),
      gender = "women",
      season_rule = "event year (2025 = 2025)",
      example_season = 2025L
    )
  ),
  genius = list(
    list(
      key = "wbbl",
      prefix = "wbbl",
      label = "Women's British Basketball League",
      ids = list(org = "WBBL", live_org = "WBBL"),
      gender = "women",
      season_rule = "END year; the label span 2025-26 = 2026",
      label_include = "Championship",
      label_exclude = "Play-?Offs"
    ),
    list(
      key = "lfb",
      prefix = "lfb",
      label = "Ligue Feminine de Basket (France, FFBB)",
      ids = list(org = "FFBB", live_org = "FFBB"),
      gender = "women",
      season_rule = "END year; Genius year + 1 (2018-19 = 2019); Genius hosts only 2018 and 2019",
      label_include = "^ligue feminine( de basket)?$",
      label_exclude = "^$"
    )
  ),
  atrium = list(
    list(
      key = "lnbp",
      prefix = "lnbp",
      label = "LNBP (Mexico, with COPA VALUE and LNBP FEMENIL)",
      ids = list(website_id = 14L),
      gender = "both",
      season_rule = "calendar year"
    ),
    list(
      key = "nbl1",
      prefix = "nbl1",
      label = "NBL1 (Australia)",
      ids = list(website_id = 3L),
      gender = "both",
      season_rule = "calendar year, Mar-Aug (END year); conferences are competition_ids"
    ),
    list(
      key = "lmb",
      prefix = "lmb",
      label = "Liga Mayor de Baloncesto (El Salvador)",
      ids = list(website_id = 13L),
      gender = "both",
      season_rule = "calendar year"
    ),
    list(
      key = "lpb",
      prefix = "lpb",
      label = "LPB / LPBF Liga Profesional de Baloncesto (Panama)",
      ids = list(website_id = 22L),
      gender = "both",
      season_rule = "calendar year"
    )
  )
)
