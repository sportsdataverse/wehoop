# Genius per-competition aliases (R/genius_competitions.R, minted by R/zzz_genius_competitions.R). Offline.

gc_path <- function(...) testthat::test_path("fixtures", "genius", ...)
gc_text <- function(rel) {
  p <- gc_path(rel)
  con <- if (grepl("\\.gz$", p)) gzfile(p, "rb") else file(p, "rb")
  on.exit(close(con))
  x <- rawToChar(readBin(con, "raw", 5e7))
  Encoding(x) <- "UTF-8"
  x
}
gc_resp <- function(status = 200L, text = "") {
  httr2::response(status_code = status, url = "https://example.invalid", body = charToRaw(enc2utf8(text)))
}
gc_re <- function(x) gsub(" ", "\\s+", x, fixed = TRUE)

# Answer by URL: `routes` maps a regex to a response, or to a list of responses served in turn.
gc_mock <- function(routes, env = parent.frame()) {
  rm(list = ls(.genius_cache, all.names = TRUE), envir = .genius_cache)
  seen <- new.env()
  seen$urls <- character()
  testthat::local_mocked_bindings(
    .intl_response = function(url, ...) {
      seen$urls <- c(seen$urls, url)
      for (re in names(routes)) {
        if (grepl(re, url)) {
          r <- routes[[re]]
          if (inherits(r, "httr2_response")) return(r)
          n <- sum(grepl(re, seen$urls))
          return(r[[min(n, length(r))]])
        }
      }
      stop("unmocked URL ", url)
    },
    .env = env, .package = "wehoop"
  )
  seen
}

GAME <- "/data/2902690/data\\.json$"
U_ESAKE <- "/u/ESAKE/2902690/$"

# The chooser, label-rule and shell-check machinery is registry-driven; wehoop's registry holds
# only WBBL and LFB, so the ESAKE fixtures (the only real chooser and /u/ shell sdv-py captured)
# drive it through hoopR's ESAKE entry, copied here verbatim.
ESAKE <- list(key = "esake", prefix = "esake", label = "Greek Basket League (ESAKE)",
              ids = list(org = "ESAKE", live_org = "ESAKE"), gender = "men",
              season_rule = "END year; Genius year + 1 (2022-23 = 2023)",
              label_include = "basket league|gbl", label_exclude = "super cup|woman")

gc_parity <- function(df, csv, schema) {
  py <- utils::read.csv(gc_path("parity", csv), colClasses = "character", na.strings = "<NA>",
                        encoding = "UTF-8", check.names = FALSE)
  expect_s3_class(df, "wehoop_data")
  expect_identical(names(df), names(py))
  expect_identical(names(df), names(.genius_schemas[[schema]]))
  expect_equal(nrow(df), nrow(py))
  bad <- vapply(names(py), function(col) {
    a <- df[[col]]
    b <- py[[col]]
    eq <- if (is.double(a)) {
      (is.na(a) & is.na(b)) | (!is.na(a) & !is.na(b) & abs(a - suppressWarnings(as.numeric(b))) < 1e-9)
    } else if (is.logical(a)) {
      (is.na(a) & is.na(b)) | (!is.na(a) & !is.na(b) & toupper(as.character(a)) == toupper(b))
    } else {
      (is.na(a) & is.na(b)) | (!is.na(a) & !is.na(b) & as.character(a) == b)
    }
    sum(!(eq %in% TRUE))
  }, numeric(1))
  expect_equal(sum(bad), 0, label = paste(csv, paste(names(bad)[bad > 0], collapse = ",")))
}

test_that("every registry entry mints its six exported aliases with the documented formals", {
  entries <- .intl_basketball_competitions$genius
  expect_true(all(vapply(entries, function(e) e$gender %in% c("women", "both"), logical(1))))
  exports <- getNamespaceExports("wehoop")
  for (e in entries) {
    names6 <- paste0(e$prefix, "_", c("competitions", "schedule", "team_box", "player_box", "pbp", "shots"))
    expect_true(all(names6 %in% exports))
    expect_identical(names(formals(get(names6[1]))), "return_parsed")
    expect_identical(names(formals(get(names6[2]))), c("season", "comp_id", "round_number", "return_parsed"))
    expect_identical(formals(get(names6[2]))$round_number, -1)
    for (g in names6[3:6]) expect_identical(names(formals(get(g))), c("match_id", "return_parsed"))
  }
  expect_setequal(vapply(entries, function(e) e$prefix, ""), c("wbbl", "lfb"))
  expect_false(any(c("slb_pbp", "esake_pbp", "nznbl_pbp") %in% exports))  # men's entries are hoopR's
  expect_identical(sort(.genius_alias_names()), sort(grep("^(wbbl|lfb)_", exports, value = TRUE)))
})

test_that("the season maps to the chooser competition by the entry's label rule", {
  seen <- gc_mock(list(
    "/ESAKE/en/schedule$" = gc_resp(200L, gc_text("html/hosted_ESAKE_schedule.html"))
  ))
  expect_identical(.genius_comp(ESAKE, 2023, NULL), 34541L)  # 'BASKET LEAGUE 2022 - 23' -> END year 2023
  expect_identical(.genius_comp(ESAKE, NULL, NULL), 34541L)  # the newest season the rule matches
  expect_equal(sum(grepl("/ESAKE/en/schedule$", seen$urls)), 1L)  # the chooser is cached per process
  expect_error(.genius_comp(ESAKE, 2021, NULL), gc_re("several competitions"), class = "wehoop_bad_request")
  expect_error(.genius_comp(ESAKE, 1980, NULL), gc_re("lists no"), class = "wehoop_no_data")
})

test_that("a women's alias schedule (lfb_schedule, comp_id) matches sdv-py's frame and skips the lookup", {
  seen <- gc_mock(list("/competition/21849/schedule$" = gc_resp(200L, gc_text("html/hosted_FFBB_21849_first3.html"))))
  df <- lfb_schedule(comp_id = 21849)
  gc_parity(df, "schedule_21849.csv", "schedule")
  expect_identical(seen$urls, "https://hosted.dcd.shared.geniussports.com/FFBB/en/competition/21849/schedule")
})

test_that("a women's game alias (wbbl_pbp) returns sdv-py's frame once the shell proves the competition", {
  rm(list = ls(.genius_cache, all.names = TRUE), envir = .genius_cache)
  shell <- new.env()
  local_mocked_bindings(
    .intl_response = function(url, ...) gc_resp(200L, gc_text("full/data_12248.json")),
    # the scope check's shell read (no WBBL /u/ shell was captured; its parsing is covered below on ESAKE)
    genius_match_competition = function(org, match_id, return_parsed = TRUE) {
      shell$org <- org
      list(competition_name = "WBBL Championship 2014-15", comp_id = 1L)
    },
    .package = "wehoop"
  )
  gc_parity(wbbl_pbp(12248), "pbp_12248.csv", "pbp")
  gc_parity(wbbl_player_box(12248), "player_box_12248.csv", "player_box")
  expect_identical(shell$org, "WBBL")
})

test_that("the shell check passes a game of the entry's competition", {
  game <- gc_resp(200L, gc_text("full/data_2902690.json.gz"))
  seen <- gc_mock(stats::setNames(list(game, gc_resp(200L, gc_text("html/u_ESAKE_2902690.html"))), c(GAME, U_ESAKE)))
  expect_true(.genius_check(ESAKE, 2902690, "genius_pbp"))
  expect_true(.genius_check(ESAKE, 2902690, "genius_shots"))
  expect_equal(sum(grepl(U_ESAKE, seen$urls)), 1L)  # the shell check is cached per process
})

test_that("a game of another org or competition is refused", {
  game <- gc_resp(200L, gc_text("full/data_2902690.json.gz"))
  gc_mock(stats::setNames(list(game, gc_resp(403L, "<Error><Code>AccessDenied</Code></Error>")),
                          c(GAME, "/u/FFBB/2902690/$")))
  expect_error(lfb_pbp(2902690), gc_re("is not a Ligue Feminine"), class = "wehoop_asset_fetch")
  gc_mock(stats::setNames(list(game, gc_resp(200L, gc_text("html/u_ESAKE_2902690.html"))),
                          c(GAME, "/u/WBBL/2902690/$")))
  expect_error(wbbl_team_box(2902690), gc_re("belongs to 'Stoiximan GBL 2026-2027'"), class = "wehoop_asset_fetch")
})

test_that("a transient shell failure is retried once; a second one or a refusal stops the frame", {
  u <- gc_resp(200L, gc_text("html/u_ESAKE_2902690.html"))
  down <- gc_resp(503L, "down")
  seen <- gc_mock(stats::setNames(list(list(down, u)), U_ESAKE))
  expect_true(.genius_check(ESAKE, 2902690, "genius_player_box"))
  expect_equal(sum(grepl(U_ESAKE, seen$urls)), 2L)
  gc_mock(stats::setNames(list(list(down, down)), U_ESAKE))
  err <- expect_error(.genius_check(ESAKE, 2902690, "genius_pbp"), gc_re("could not run"), class = "wehoop_asset_fetch")
  expect_match(conditionMessage(err), "twice")
  blocked <- gc_resp(403L, "Request blocked. Generated by cloudfront (CloudFront)")
  seen <- gc_mock(stats::setNames(list(blocked), U_ESAKE))
  expect_error(.genius_check(ESAKE, 2902690, "genius_pbp"), gc_re("could not run"), class = "wehoop_asset_fetch")
  expect_equal(sum(grepl(U_ESAKE, seen$urls)), 1L)  # a refusal is not retried
})

test_that("label rules are case-insensitive include-and-not-exclude", {
  expect_identical(.genius_label_ok(.genius_entry("lfb"),
                                    c("Ligue Feminine", "LIGUE FEMININE DE BASKET", "Ligue Feminine 2", NA)),
                   c(TRUE, TRUE, FALSE, FALSE))
  expect_identical(.genius_label_ok(.genius_entry("wbbl"),
                                    c("WBBL Championship 2025-26", "WBBL Championship Play-Offs", "WBBL Trophy")),
                   c(TRUE, FALSE, FALSE))
})
