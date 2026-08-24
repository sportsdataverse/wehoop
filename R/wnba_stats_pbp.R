
#' **Add players on court in WNBA Stats API play-by-play**
#' @name .players_on_court
NULL
#' @title
#' **Add players on court in WNBA Stats API play-by-play**
#' @author Vladislav Shufinskiy
#' @param pbp_data PlayByPlay data frame received `wnba_pbp` function
#' @return Returns a data frame: PlayByPlay
#'
#'    Columns as documented in the shared [wnba_players_on_court_schema] table.
#'
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows as_tibble
#' @import rvest
#' @noRd
#' @family WNBA PBP Functions
.players_on_court <- function(pbp_data) {
  
  pbp_data <- dplyr::mutate(pbp_data, PCTIMESTRING = ifelse(.data$period < 5, abs((.data$minute_remaining_quarter * 60 + .data$seconds_remaining_quarter) - 600 * .data$period),
                                                            abs((.data$minute_remaining_quarter * 60 + .data$seconds_remaining_quarter) - (2400 + 300 * (.data$period - 4)))))
  
  l <- lapply(sort(unique(pbp_data$period)), function(x){
    
    pbp_data_period <- dplyr::filter(pbp_data, .data$period == x)
    all_id <- unique(c(pbp_data_period$player1_id[!pbp_data_period$event_type %in% c(9, 18) & !is.na(pbp_data_period$player1_name) & !pbp_data_period$person1type %in% c(6, 7)],
                       pbp_data_period$player2_id[!pbp_data_period$event_type %in% c(9, 18) & !is.na(pbp_data_period$player2_name) & !pbp_data_period$person2type %in% c(6, 7)],
                       pbp_data_period$player3_id[!pbp_data_period$event_type %in% c(9, 18) & !is.na(pbp_data_period$player3_name) & !pbp_data_period$person3type %in% c(6, 7)]))
    all_id <- as.numeric(all_id)
    
    all_id <- all_id[all_id != 0 & all_id < 1610612737]
    
    sub_off <- as.numeric(unique(pbp_data_period$player1_id[pbp_data_period$event_type == 8]))
    sub_on <- as.numeric(unique(pbp_data_period$player2_id[pbp_data_period$event_type == 8]))
    
    '%!in%' <- Negate(`%in%`)
    all_id <- all_id[all_id  %!in% setdiff(sub_on, sub_off)]
    
    sub_on_off <- dplyr::intersect(sub_on, sub_off)
    
    for (i in sub_on_off){
      on <- min(pbp_data_period$PCTIMESTRING[pbp_data_period$event_type == 8 & pbp_data_period$player2_id == i])
      off <- min(pbp_data_period$PCTIMESTRING[pbp_data_period$event_type == 8 & pbp_data_period$player1_id == i])
      if (off > on){
        all_id <- all_id[all_id != i]
      } else if (off == on){
        on_event <- min(as.numeric(pbp_data_period$event_num[pbp_data_period$event_type == 8 & pbp_data_period$player2_id == i]))
        off_event <- min(as.numeric(pbp_data_period$event_num[pbp_data_period$event_type == 8 & pbp_data_period$player1_id == i]))
        if(off_event > on_event){
          all_id <- all_id[all_id != i]
        }
      }
    }
    
    if((length(all_id) == 10)){
      ord_all_id <- pbp_data_period %>%
        dplyr::select("player1_id", "person1type") %>%
        dplyr::filter(.data$player1_id != 0 & .data$person1type %in% c(4, 5)) %>%
        dplyr::rename("player_id" = "player1_id", "persontype" = "person1type") %>%
        dplyr::bind_rows(pbp_data_period %>%
                           dplyr::select("player2_id", "person2type") %>%
                           dplyr::filter(.data$player2_id != 0 & .data$person2type %in% c(4, 5)) %>%
                           dplyr::rename("player_id" = "player2_id", "persontype" = "person2type")) %>%
        dplyr::bind_rows(pbp_data_period %>%
                           dplyr::select("player3_id", "person3type") %>%
                           dplyr::filter(.data$player3_id != 0 & .data$person3type %in% c(4, 5)) %>%
                           dplyr::rename("player_id" = "player3_id", "persontype" = "person3type")) %>%
        dplyr::distinct() %>%
        dplyr::arrange(dplyr::desc(.data$persontype)) %>%
        dplyr::select("player_id") %>%
        dplyr::mutate(player_id = as.numeric(.data$player_id)) %>%
        dplyr::pull()
      
      all_id <- ord_all_id[ord_all_id %in% all_id]
    }
    
    if(length(all_id) != 10){
      
      if(inherits(pbp_data$game_id[1], "integer")){
        tmp_gameid <- paste0("00", as.character(pbp_data$game_id[1]))
      } else{
        tmp_gameid <- pbp_data$game_id[1]
      }
      
      tmp_data <- wnba_boxscoretraditionalv2(game_id = tmp_gameid, start_period = x, end_period = x, range_type = 1)$PlayerStats
      
      all_id <- as.integer(tmp_data$PLAYER_ID)
      
      sub_off <- unique(pbp_data_period$player1_id[pbp_data_period$event_type == 8])
      sub_on <- unique(pbp_data_period$player2_id[pbp_data_period$event_type == 8])
      
      '%!in%' <- Negate(`%in%`)
      all_id <- all_id[all_id  %!in% setdiff(sub_on, sub_off)]
      
      sub_on_off <- dplyr::intersect(sub_on, sub_off)
      
      for (i in sub_on_off){
        on <- min(pbp_data_period$PCTIMESTRING[pbp_data_period$event_type == 8 & pbp_data_period$player2_id == i])
        off <- min(pbp_data_period$PCTIMESTRING[pbp_data_period$event_type == 8 & pbp_data_period$player1_id == i])
        if (off > on){
          all_id <- all_id[all_id != i]
        } else if (off == on){
          on_event <- min(as.numeric(pbp_data_period$event_num[pbp_data_period$event_type == 8 & pbp_data_period$player2_id == i]))
          off_event <- min(as.numeric(pbp_data_period$event_num[pbp_data_period$event_type == 8 & pbp_data_period$player1_id == i]))
          if(off_event > on_event){
            all_id <- all_id[all_id != i]
          }
        }
      }
    }
    
    columns <- paste0("player", seq(1, 10))
    pbp_data_period[columns] <- NA
    
    for(i in seq(1:10)){
      pbp_data_period[columns][i] <- all_id[i]
    }
    
    for(column in paste0("player", seq(1, 10))){
      i <- 1
      repeat{
        n <- nrow(pbp_data_period)
        if(length(which(pbp_data_period$event_type == 8 & as.numeric(pbp_data_period$player1_id) == pbp_data_period[, column])) == 0){
          break
        }
        i <- min(which(pbp_data_period$event_type == 8 & pbp_data_period[, column] == as.numeric(pbp_data_period$player1_id)))
        player_on <- as.numeric(pbp_data_period$player2_id[i])
        pbp_data_period[i:n, column] <- player_on
      }
    }
    return(dplyr::select(pbp_data_period, -"PCTIMESTRING"))
  })
  return(dplyr::bind_rows(l) %>% dplyr::rename(
    "away_player1" = 'player1',
    "away_player2" = 'player2',
    "away_player3" = 'player3',
    "away_player4" = 'player4',
    "away_player5" = 'player5',
    "home_player1" = 'player6',
    "home_player2" = 'player7',
    "home_player3" = 'player8',
    "home_player4" = 'player9',
    "home_player5" = 'player10'
  ))
}

#' **Get WNBA Stats API Play-by-Play V3**
#' @name wnba_playbyplayv3
NULL
#' @title
#' **Get WNBA Stats API Play-by-Play V3**
#' @rdname wnba_playbyplayv3
#' @author Saiem Gilani
#' @param game_id Game ID - 10-digit zero-padded ID (e.g., '1022200034')
#' @param start_period Start period filter (default: 0 = all periods).
#' @param end_period End period filter (default: 0 = all periods).
#' @param ... Additional arguments passed to an underlying function like httr.
#' @return Returns a named list of data frames: PlayByPlay, AvailableVideo
#'
#'    **PlayByPlay**
#'
#'
#'    \if{html}{\tabular{lll}{
#'       col_name \tab types \tab description \cr
#'       game_id \tab character \tab Unique game identifier. \cr
#'       action_number \tab integer \tab Sequential action number within a game (V3 PBP). \cr
#'       clock \tab character \tab Game clock value. \cr
#'       period \tab integer \tab Period of the game (1-4 quarters; 5+ for OT). \cr
#'       team_id \tab integer \tab Unique team identifier. \cr
#'       team_tricode \tab character \tab Three-letter team code (e.g. 'LAS' / 'NYL'). \cr
#'       person_id \tab integer \tab Unique player identifier (V3 endpoints). \cr
#'       player_name \tab character \tab Player name. \cr
#'       player_name_i \tab character \tab Player name i. \cr
#'       x_legacy \tab integer \tab V2-format X coordinate (preserved for V3-to-V2 compatibility). \cr
#'       y_legacy \tab integer \tab V2-format Y coordinate (preserved for V3-to-V2 compatibility). \cr
#'       shot_distance \tab numeric \tab Shot distance from the basket, in feet. \cr
#'       shot_result \tab character \tab Shot result ('Made' / 'Missed'). \cr
#'       is_field_goal \tab integer \tab 1 if the action was a field goal; 0 otherwise. \cr
#'       score_home \tab character \tab Score home. \cr
#'       score_away \tab character \tab Score away. \cr
#'       points_total \tab integer \tab Running total of points scored. \cr
#'       location \tab character \tab Filter results by game location. \cr
#'       description \tab character \tab Long-form description text. \cr
#'       action_type \tab character \tab Action type label (e.g. 'Made Shot', 'Substitution'). \cr
#'       sub_type \tab character \tab Action sub-type label. \cr
#'       video_available \tab integer \tab Video available. \cr
#'       shot_value \tab integer \tab Point value of the shot (2 or 3). \cr
#'       action_id \tab integer \tab Unique action identifier within a game (V3 PBP). \cr
#'    }}
#'    \if{latex}{See the HTML help or pkgdown reference for the column table.}
#'
#'    **AvailableVideo**
#'
#'
#'    |col_name        |types   |description      |
#'    |:---------------|:-------|:----------------|
#'    |video_available |integer |Video available. |
#'
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows as_tibble
#' @import rvest
#' @export
#' @family WNBA PBP Functions
#' @details
#' ```r
#'  wnba_playbyplayv3(game_id = "1022200034")
#' ```
wnba_playbyplayv3 <- function(
    game_id,
    start_period = 0,
    end_period = 0,
    ...) {
  .args <- mget(setdiff(names(formals()), "..."))
  endpoint <- wnba_endpoint("playbyplayv3")
  full_url <- endpoint

  params <- list(
    EndPeriod = end_period,
    GameID = pad_id(game_id),
    StartPeriod = start_period
  )

  data <- list()

  tryCatch(
    expr = {
      resp <- request_with_proxy(url = full_url, params = params)

      game_data <- resp %>%
        purrr::pluck("game")

      actions <- game_data %>%
        purrr::pluck("actions") %>%
        data.frame(stringsAsFactors = FALSE) %>%
        dplyr::as_tibble()

      actions$gameId <- game_data$gameId

      actions <- actions %>%
        dplyr::select("gameId", dplyr::everything()) %>%
        janitor::clean_names() %>%
        make_wehoop_data("WNBA Game Play-by-Play V3 Information from WNBA.com", Sys.time())

      video_available <- data.frame(
        video_available = game_data$videoAvailable %||% 0L
      ) %>%
        dplyr::as_tibble() %>%
        make_wehoop_data("WNBA Game Video Available from WNBA.com", Sys.time())

      data <- c(list(PlayByPlay = actions), list(AvailableVideo = video_available))
    },
    error = function(e) .report_api_error(
      e,
      hint = "Invalid arguments or no V3 play-by-play data for {pad_id(game_id)} available!",
      args = .args
    ),
    warning = function(w) {
    },
    finally = {
    }
  )
  return(data)
}


#' **Build player roster lookup from WNBA boxscore data**
#' @name .build_player_roster_wnba
#' @keywords internal
NULL
#' @title
#' **Build player roster lookup from WNBA boxscore data**
#' @param game_id Game ID - 10-digit zero-padded ID
#' @return Returns a data frame with person_id, first_name, family_name, name_i,
#'   full_name, team_id, team_name, team_city, team_tricode
#' @noRd
#' @family WNBA PBP Functions
.build_player_roster_wnba <- function(game_id) {
  .args <- mget(setdiff(names(formals()), "..."))
  empty_roster <- NULL

  tryCatch(
    {
      box <- wnba_boxscoretraditionalv3(game_id = game_id)
      home <- box$home_team_player_traditional
      away <- box$away_team_player_traditional

      cols <- c(
        "person_id", "first_name", "family_name", "name_i",
        "team_id", "team_name", "team_city", "team_tricode"
      )

      empty_roster <- dplyr::tibble(
        person_id = character(),
        first_name = character(),
        family_name = character(),
        name_i = character(),
        team_id = character(),
        team_name = character(),
        team_city = character(),
        team_tricode = character(),
        full_name = character()
      )

      if (is.null(home) || is.null(away) ||
        !all(cols %in% colnames(home)) || !all(cols %in% colnames(away))) {
        return(empty_roster)
      }

      roster <- dplyr::bind_rows(
        home[, cols, drop = FALSE],
        away[, cols, drop = FALSE]
      )
      roster$full_name <- paste(roster$first_name, roster$family_name)
      roster$person_id <- as.character(roster$person_id)
      roster$team_id <- as.character(roster$team_id)
      roster
    },
    error = function(e) .report_api_error(
      e,
      hint = "Could not retrieve boxscore for player roster lookup.",
      args = .args
    )
  )
}


#' **Convert V3 play-by-play to V2-compatible format (WNBA)**
#' @name .v3_to_v2_format_wnba
#' @keywords internal
NULL
#' @title
#' **Convert V3 play-by-play to V2-compatible format (WNBA)**
#' @param pbp_data PlayByPlay data frame from `wnba_playbyplayv3()`
#' @param player_roster Player roster data frame from `.build_player_roster_wnba()`
#' @return Returns a data frame with V2-compatible columns plus retained V3 columns
#' @noRd
#' @family WNBA PBP Functions
.v3_to_v2_format_wnba <- function(pbp_data, player_roster = NULL) {
  required_roster_cols <- c(
    "person_id", "first_name", "family_name", "name_i",
    "full_name", "team_id", "team_name", "team_city", "team_tricode"
  )

  if (is.null(player_roster) || !all(required_roster_cols %in% colnames(player_roster))) {
    player_roster <- NULL
  }

  # V3 event_type mapping to V2 EVENTMSGTYPE numeric codes
  event_type_map <- c(
    "period" = "12",
    "Jump Ball" = "10",
    "Made Shot" = "1",
    "Missed Shot" = "2",
    "Free Throw" = "3",
    "Rebound" = "4",
    "Turnover" = "5",
    "Foul" = "6",
    "Violation" = "7",
    "Substitution" = "8",
    "Timeout" = "9",
    "Ejection" = "11",
    "Instant Replay" = "18",
    "Game" = "12",
    "Stoppage" = "18"
  )

  shot_action_map <- c(
    "Jump Shot" = "1",
    "Hook Shot" = "3",
    "Layup" = "5", "Layup Shot" = "5",
    "Dunk" = "7", "Dunk Shot" = "7",
    "Running Layup" = "41", "Running Layup Shot" = "41",
    "Driving Layup" = "42", "Driving Layup Shot" = "42",
    "Alley Oop Layup" = "43", "Alley Oop Layup Shot" = "43",
    "Alley Oop Dunk Shot" = "43", "Running Alley Oop Dunk Shot" = "43",
    "Running Jump Shot" = "46",
    "Turnaround Jump Shot" = "47",
    "Driving Dunk" = "49", "Driving Dunk Shot" = "49",
    "Running Dunk" = "50", "Running Dunk Shot" = "50",
    "Driving Hook Shot" = "57",
    "Turnaround Hook Shot" = "58",
    "Fadeaway Jumper" = "63", "Fadeaway Jump Shot" = "63",
    "Jump Bank Shot" = "66",
    "Putback Layup" = "72", "Putback Layup Shot" = "72",
    "Driving Reverse Layup" = "73", "Driving Reverse Layup Shot" = "73",
    "Running Finger Roll Layup" = "76", "Running Finger Roll Layup Shot" = "76",
    "Floating Jump Shot" = "78", "Floating Jump shot" = "78",
    "Driving Floating Jump Shot" = "78",
    "Driving Floating Bank Jump Shot" = "78",
    "Pullup Jump Shot" = "79", "Pullup Jump shot" = "79",
    "Running Pull-Up Jump Shot" = "79",
    "Step Back Jump Shot" = "80", "Step Back Jump shot" = "80",
    "Step Back Bank Jump Shot" = "80",
    "Driving Bank Shot" = "82",
    "Turnaround Fadeaway" = "86", "Turnaround Fadeaway shot" = "86",
    "Tip Layup Shot" = "97",
    "Cutting Layup Shot" = "98",
    "Cutting Dunk Shot" = "108",
    "Tip Dunk Shot" = "108",
    "Cutting Finger Roll Layup Shot" = "98",
    "Driving Finger Roll Layup Shot" = "42",
    "Finger Roll Layup Shot" = "76"
  )

  ft_action_map <- c(
    "Free Throw 1 of 1" = "10",
    "Free Throw 1 of 2" = "11",
    "Free Throw 2 of 2" = "12",
    "Free Throw 1 of 3" = "13",
    "Free Throw 2 of 3" = "14",
    "Free Throw 3 of 3" = "15",
    "Free Throw Technical" = "16",
    "Free Throw Flagrant 1 of 2" = "18",
    "Free Throw Flagrant 2 of 2" = "19",
    "Free Throw Flagrant 1 of 1" = "20",
    "Free Throw Clear Path 1 of 2" = "25",
    "Free Throw Clear Path 2 of 2" = "26",
    "Free Throw Flagrant 1 of 3" = "27",
    "Free Throw Flagrant 2 of 3" = "28",
    "Free Throw Flagrant 3 of 3" = "29"
  )

  to_action_map <- c(
    "Bad Pass" = "1",
    "Lost Ball" = "2",
    "Traveling" = "4",
    "Offensive Foul Turnover" = "37",
    "Double Dribble" = "6",
    "Discontinue Dribble" = "7",
    "3 Second Violation" = "8",
    "5 Second Violation" = "9",
    "8 Second Violation" = "10",
    "Shot Clock Violation" = "11", "Shot Clock" = "11",
    "Inbound Turnover" = "12",
    "Backcourt Turnover" = "13", "Backcourt" = "13",
    "Offensive Goaltending" = "15",
    "Lane Violation" = "17",
    "Kicked Ball Violation" = "19",
    "Palming" = "21",
    "5 Second Inbound" = "38",
    "Step Out of Bounds" = "39",
    "Out of Bounds Lost Ball Turnover" = "40",
    "Out of Bounds - Bad Pass Turnover" = "45"
  )

  foul_action_map <- c(
    "Personal" = "1",
    "Shooting" = "2",
    "Loose Ball" = "3",
    "Offensive" = "4",
    "Intentional" = "5",
    "Away From Play" = "6",
    "Clear Path" = "9",
    "Double Technical" = "10",
    "Technical" = "11",
    "Flagrant 1" = "14", "Flagrant Type 1" = "14",
    "Flagrant 2" = "15", "Flagrant Type 2" = "15",
    "Defense 3 Second" = "17",
    "Taunting" = "19",
    "Excess Timeout" = "25",
    "Charge" = "26",
    "Block" = "27",
    "Personal Take" = "28",
    "Shooting Block" = "29"
  )

  timeout_action_map <- c(
    "Regular" = "1",
    "Short" = "2",
    "Official" = "4"
  )

  violation_action_map <- c(
    "Delay Of Game" = "1", "Delay of Game" = "1",
    "Defensive Goaltending" = "2",
    "Lane Violation" = "3",
    "Jump Ball Violation" = "4",
    "Kicked Ball" = "5", "Kicked Ball Violation" = "5",
    "Double Lane Violation" = "6"
  )

  # --- Consolidate blank action_type rows (blocks/steals) into parent actions ---
  is_block <- pbp_data$action_type == "" & grepl("BLOCK", pbp_data$description)
  is_steal <- pbp_data$action_type == "" & grepl("STEAL", pbp_data$description)

  pbp_data$block_person_id <- NA_integer_
  pbp_data$block_player_name <- NA_character_
  pbp_data$steal_person_id <- NA_integer_
  pbp_data$steal_player_name <- NA_character_

  block_indices <- which(is_block)
  for (bi in block_indices) {
    for (j in (bi - 1):max(1, bi - 5)) {
      if (pbp_data$action_type[j] == "Missed Shot" &&
        pbp_data$period[j] == pbp_data$period[bi] &&
        pbp_data$clock[j] == pbp_data$clock[bi]) {
        pbp_data$block_person_id[j] <- pbp_data$person_id[bi]
        pbp_data$block_player_name[j] <- pbp_data$player_name[bi]
        break
      }
    }
  }

  steal_indices <- which(is_steal)
  for (si in steal_indices) {
    found <- FALSE
    for (j in (si - 1):max(1, si - 5)) {
      if (pbp_data$action_type[j] == "Turnover" &&
        pbp_data$period[j] == pbp_data$period[si] &&
        pbp_data$clock[j] == pbp_data$clock[si]) {
        pbp_data$steal_person_id[j] <- pbp_data$person_id[si]
        pbp_data$steal_player_name[j] <- pbp_data$steal_player_name[si] %||% pbp_data$player_name[si]
        found <- TRUE
        break
      }
    }
    if (!found) {
      for (j in (si + 1):min(nrow(pbp_data), si + 5)) {
        if (pbp_data$action_type[j] == "Turnover" &&
          pbp_data$period[j] == pbp_data$period[si] &&
          pbp_data$clock[j] == pbp_data$clock[si]) {
          pbp_data$steal_person_id[j] <- pbp_data$person_id[si]
          pbp_data$steal_player_name[j] <- pbp_data$steal_player_name[si] %||% pbp_data$player_name[si]
          break
        }
      }
    }
  }

  pbp_data <- pbp_data[!(is_block | is_steal), ]

  # --- Parse assist info from Made Shot descriptions ---
  assist_match <- regmatches(
    pbp_data$description,
    regexec("\\(([^)]+?)\\s+[0-9]+\\s+AST\\)", pbp_data$description)
  )
  pbp_data$assist_player_name <- vapply(
    assist_match,
    function(m) if (length(m) >= 2) m[2] else NA_character_,
    character(1)
  )

  # --- Parse substitution incoming player ---
  sub_in_match <- regmatches(
    pbp_data$description,
    regexec("SUB:\\s+(.+?)\\s+FOR\\s+.+", pbp_data$description)
  )
  pbp_data$sub_in_player_name <- vapply(
    sub_in_match,
    function(m) if (length(m) >= 2) m[2] else NA_character_,
    character(1)
  )

  # --- Parse jump ball players ---
  jb_match <- regmatches(
    pbp_data$description,
    regexec("Jump Ball\\s+.+?\\s+vs\\.\\s+(.+?)(?::\\s+Tip to\\s+(.+?))?\\s*$", pbp_data$description, perl = TRUE)
  )
  pbp_data$jb_player2_name <- vapply(
    jb_match,
    function(m) if (length(m) >= 2 && nchar(m[2]) > 0) m[2] else NA_character_,
    character(1)
  )
  pbp_data$jb_player3_name <- vapply(
    jb_match,
    function(m) if (length(m) >= 3 && nchar(m[3]) > 0) m[3] else NA_character_,
    character(1)
  )

  # --- Resolve player2/player3 IDs from roster lookup ---
  .lookup_player <- function(name, roster) {
    if (is.null(roster) || is.na(name) || nchar(name) == 0) {
      return(list(
        person_id = NA_character_, team_id = NA_character_,
        team_city = NA_character_, team_name = NA_character_,
        team_tricode = NA_character_, full_name = NA_character_
      ))
    }
    idx <- which(roster$family_name == name)
    if (length(idx) == 0) idx <- which(roster$name_i == name)
    if (length(idx) == 0) {
      idx <- which(vapply(seq_len(nrow(roster)), function(r) {
        fn <- roster$first_name[r]
        ln <- roster$family_name[r]
        abbr <- paste0(substr(fn, 1, 1), ". ", ln)
        abbr == name
      }, logical(1)))
    }
    if (length(idx) == 0) {
      idx <- which(vapply(seq_len(nrow(roster)), function(r) {
        grepl(name, roster$full_name[r], fixed = TRUE) ||
          grepl(name, roster$family_name[r], fixed = TRUE)
      }, logical(1)))
    }
    if (length(idx) == 0) {
      return(list(
        person_id = NA_character_, team_id = NA_character_,
        team_city = NA_character_, team_name = NA_character_,
        team_tricode = NA_character_, full_name = name
      ))
    }
    r <- roster[idx[1], ]
    list(
      person_id = as.character(r$person_id),
      team_id = as.character(r$team_id),
      team_city = r$team_city,
      team_name = r$team_name,
      team_tricode = r$team_tricode,
      full_name = r$full_name
    )
  }

  n <- nrow(pbp_data)
  p2_id <- rep(NA_character_, n)
  p2_name <- rep(NA_character_, n)
  p2_team_id <- rep(NA_character_, n)
  p2_team_city <- rep(NA_character_, n)
  p2_team_nickname <- rep(NA_character_, n)
  p2_team_abbr <- rep(NA_character_, n)
  p2type <- rep(NA_character_, n)

  p3_id <- rep(NA_character_, n)
  p3_name <- rep(NA_character_, n)
  p3_team_id <- rep(NA_character_, n)
  p3_team_city <- rep(NA_character_, n)
  p3_team_nickname <- rep(NA_character_, n)
  p3_team_abbr <- rep(NA_character_, n)
  p3type <- rep(NA_character_, n)

  for (i in seq_len(n)) {
    at <- pbp_data$action_type[i]

    if (at == "Made Shot" && !is.na(pbp_data$assist_player_name[i])) {
      info <- .lookup_player(pbp_data$assist_player_name[i], player_roster)
      p2_id[i] <- info$person_id
      p2_name[i] <- info$full_name
      p2_team_id[i] <- info$team_id
      p2_team_city[i] <- info$team_city
      p2_team_nickname[i] <- info$team_name
      p2_team_abbr[i] <- info$team_tricode
    }

    if (at == "Missed Shot" && !is.na(pbp_data$block_person_id[i])) {
      p3_id[i] <- as.character(pbp_data$block_person_id[i])
      p3_name[i] <- pbp_data$block_player_name[i]
      if (!is.null(player_roster)) {
        info <- .lookup_player(pbp_data$block_player_name[i], player_roster)
        if (!is.na(info$person_id)) p3_id[i] <- info$person_id
        p3_name[i] <- info$full_name %||% pbp_data$block_player_name[i]
        p3_team_id[i] <- info$team_id
        p3_team_city[i] <- info$team_city
        p3_team_nickname[i] <- info$team_name
        p3_team_abbr[i] <- info$team_tricode
      }
    }

    if (at == "Turnover" && !is.na(pbp_data$steal_person_id[i])) {
      p2_id[i] <- as.character(pbp_data$steal_person_id[i])
      p2_name[i] <- pbp_data$steal_player_name[i]
      if (!is.null(player_roster)) {
        info <- .lookup_player(pbp_data$steal_player_name[i], player_roster)
        if (!is.na(info$person_id)) p2_id[i] <- info$person_id
        p2_name[i] <- info$full_name %||% pbp_data$steal_player_name[i]
        p2_team_id[i] <- info$team_id
        p2_team_city[i] <- info$team_city
        p2_team_nickname[i] <- info$team_name
        p2_team_abbr[i] <- info$team_tricode
      }
    }

    if (at == "Substitution" && !is.na(pbp_data$sub_in_player_name[i])) {
      info <- .lookup_player(pbp_data$sub_in_player_name[i], player_roster)
      p2_id[i] <- info$person_id
      p2_name[i] <- info$full_name %||% pbp_data$sub_in_player_name[i]
      p2_team_id[i] <- info$team_id %||% as.character(pbp_data$team_id[i])
      p2_team_city[i] <- info$team_city
      p2_team_nickname[i] <- info$team_name
      p2_team_abbr[i] <- info$team_tricode %||% as.character(pbp_data$team_tricode[i])
    }

    if (at == "Jump Ball") {
      if (!is.na(pbp_data$jb_player2_name[i])) {
        info <- .lookup_player(pbp_data$jb_player2_name[i], player_roster)
        p2_id[i] <- info$person_id
        p2_name[i] <- info$full_name
        p2_team_id[i] <- info$team_id
        p2_team_city[i] <- info$team_city
        p2_team_nickname[i] <- info$team_name
        p2_team_abbr[i] <- info$team_tricode
      }
      if (!is.na(pbp_data$jb_player3_name[i])) {
        info <- .lookup_player(pbp_data$jb_player3_name[i], player_roster)
        p3_id[i] <- info$person_id
        p3_name[i] <- info$full_name
        p3_team_id[i] <- info$team_id
        p3_team_city[i] <- info$team_city
        p3_team_nickname[i] <- info$team_name
        p3_team_abbr[i] <- info$team_tricode
      }
    }
  }

  # Parse V3 clock "PT10M30.00S" -> minutes and seconds remaining
  matches <- regmatches(pbp_data$clock, regexec("PT([0-9]+)M([0-9.]+)S", pbp_data$clock))
  mins <- vapply(matches, function(m) if (length(m) == 3) as.numeric(m[2]) else NA_real_, numeric(1))
  secs <- vapply(matches, function(m) if (length(m) == 3) as.numeric(m[3]) else NA_real_, numeric(1))

  period <- as.numeric(pbp_data$period)

  minute_remaining_quarter <- as.numeric(floor(mins))
  seconds_remaining_quarter <- as.numeric(floor(secs))
  time_quarter <- sprintf("%02d:%02d", as.integer(minute_remaining_quarter), as.integer(seconds_remaining_quarter))

  # WNBA: 10-minute quarters, 5-minute OT
  quarter_len <- ifelse(period <= 4, 10, 5)
  elapsed_in_period <- quarter_len - (minute_remaining_quarter + seconds_remaining_quarter / 60)
  minute_game <- ifelse(
    period <= 4,
    (period - 1) * 10 + elapsed_in_period,
    40 + (period - 5) * 5 + elapsed_in_period
  )
  minute_game <- round(minute_game, 2)

  # Time remaining: for regulation, remaining until end of 4Q
  time_remaining <- ifelse(
    period <= 4,
    (4 - period) * 10 + minute_remaining_quarter + seconds_remaining_quarter / 60,
    minute_remaining_quarter + seconds_remaining_quarter / 60
  )
  time_remaining <- round(time_remaining, 2)

  # Score columns with forward-fill
  home_score <- suppressWarnings(as.numeric(pbp_data$score_home))
  away_score <- suppressWarnings(as.numeric(pbp_data$score_away))

  last_home <- 0
  last_away <- 0
  for (i in seq_along(home_score)) {
    if (!is.na(home_score[i])) {
      last_home <- home_score[i]
      last_away <- away_score[i]
    } else {
      home_score[i] <- last_home
      away_score[i] <- last_away
    }
  }

  score <- paste(away_score, "-", home_score)
  score_margin <- as.character(home_score - away_score)
  team_leading <- dplyr::case_when(
    home_score == away_score ~ "Tie",
    home_score > away_score ~ "Home",
    TRUE ~ "Away"
  )

  location <- pbp_data$location
  description <- pbp_data$description
  home_description <- ifelse(location == "h", description, NA_character_)
  neutral_description <- ifelse(is.na(location) | location == "", description, NA_character_)
  visitor_description <- ifelse(location == "v", description, NA_character_)

  is_period_end <- pbp_data$action_type == "period" & pbp_data$sub_type == "end"
  event_type <- event_type_map[pbp_data$action_type]
  event_type <- ifelse(is.na(event_type), "0", unname(event_type))
  event_type[is_period_end] <- "13"

  action_type_v3 <- pbp_data$action_type
  sub_type_v3 <- pbp_data$sub_type

  event_action_type <- vapply(seq_len(n), function(i) {
    at <- action_type_v3[i]
    st <- sub_type_v3[i]
    if (is.na(st) || nchar(st) == 0) {
      return("0")
    }
    result <- switch(at,
      "Made Shot" = ,
      "Missed Shot" = shot_action_map[st] %||% "0",
      "Free Throw" = ft_action_map[st] %||% "0",
      "Turnover" = to_action_map[st] %||% "0",
      "Foul" = foul_action_map[st] %||% "0",
      "Timeout" = timeout_action_map[st] %||% "0",
      "Violation" = violation_action_map[st] %||% "0",
      "Substitution" = "0",
      "Jump Ball" = "0",
      "Rebound" = "0",
      "0"
    )
    unname(result)
  }, character(1))

  person1type <- dplyr::case_when(
    location == "h" ~ "4",
    location == "v" ~ "5",
    TRUE ~ "0"
  )

  result <- dplyr::tibble(
    game_id = as.character(pbp_data$game_id),
    event_num = as.character(pbp_data$action_number),
    event_type = event_type,
    event_action_type = event_action_type,
    period = period,
    clock = pbp_data$clock,
    minute_game = minute_game,
    time_remaining = time_remaining,
    wc_time_string = NA_character_,
    time_quarter = time_quarter,
    minute_remaining_quarter = minute_remaining_quarter,
    seconds_remaining_quarter = seconds_remaining_quarter,
    action_type = pbp_data$action_type,
    sub_type = pbp_data$sub_type,
    home_description = home_description,
    neutral_description = neutral_description,
    visitor_description = visitor_description,
    description = pbp_data$description,
    location = pbp_data$location,
    score = score,
    away_score = away_score,
    home_score = home_score,
    score_margin = score_margin,
    person1type = person1type,
    player1_id = as.character(pbp_data$person_id),
    player1_name = ifelse(!is.na(pbp_data$player_name), pbp_data$player_name, NA_character_),
    player1_team_id = as.character(pbp_data$team_id),
    player1_team_city = NA_character_,
    player1_team_nickname = NA_character_,
    player1_team_abbreviation = as.character(pbp_data$team_tricode),
    person2type = p2type,
    player2_id = p2_id,
    player2_name = p2_name,
    player2_team_id = p2_team_id,
    player2_team_city = p2_team_city,
    player2_team_nickname = p2_team_nickname,
    player2_team_abbreviation = p2_team_abbr,
    person3type = p3type,
    player3_id = p3_id,
    player3_name = p3_name,
    player3_team_id = p3_team_id,
    player3_team_city = p3_team_city,
    player3_team_nickname = p3_team_nickname,
    player3_team_abbreviation = p3_team_abbr,
    video_available_flag = as.character(pbp_data$video_available),
    team_leading = team_leading,
    x_legacy = pbp_data$x_legacy,
    y_legacy = pbp_data$y_legacy,
    shot_distance = pbp_data$shot_distance,
    shot_result = pbp_data$shot_result,
    is_field_goal = pbp_data$is_field_goal,
    points_total = pbp_data$points_total,
    shot_value = pbp_data$shot_value,
    action_number = as.integer(pbp_data$action_number),
    team_id = as.integer(pbp_data$team_id),
    team_tricode = as.character(pbp_data$team_tricode),
    person_id = as.integer(pbp_data$person_id),
    player_name = as.character(pbp_data$player_name),
    player_name_i = as.character(pbp_data$player_name_i),
    score_home = as.character(pbp_data$score_home),
    score_away = as.character(pbp_data$score_away),
    video_available = pbp_data$video_available,
    action_id = as.integer(pbp_data$action_id)
  )

  result <- make_wehoop_data(result, "WNBA Game Play-by-Play Information from WNBA.com", Sys.time())
  return(result)
}


#' **Add players on court in WNBA Stats API V3 play-by-play**
#' @name .players_on_court_v3_wnba
#' @keywords internal
NULL
#' @title
#' **Add players on court in WNBA Stats API V3 play-by-play**
#' @author Saiem Gilani
#' @param pbp_data PlayByPlay data frame (V2-formatted via `.v3_to_v2_format_wnba`)
#' @return Returns a data frame: PlayByPlay with on-court player columns
#' @noRd
#' @family WNBA PBP Functions
.players_on_court_v3_wnba <- function(pbp_data) {
  .args <- mget(setdiff(names(formals()), "..."))
  game_id <- pbp_data$game_id[1]
  if (inherits(game_id, "integer")) {
    game_id <- paste0("00", as.character(game_id))
  }

  rotation <- tryCatch(
    wnba_gamerotation(game_id = game_id),
    error = function(e) .report_api_error(
      e,
      hint = "Could not retrieve game rotation for {game_id}. On-court data will be NA.",
      args = .args
    )
  )

  empty_rotation <- is.null(rotation) || length(rotation) == 0 ||
    is.null(rotation$AwayTeam) || is.null(rotation$HomeTeam) ||
    nrow(rotation$AwayTeam) == 0 || nrow(rotation$HomeTeam) == 0

  if (empty_rotation) {
    # gamerotation is flaky under batched calls: infer lineups from
    # substitution events (the pre-v3 path) before degrading to all-NA
    fallback <- tryCatch(.players_on_court(pbp_data), error = function(e) NULL)
    if (!is.null(fallback)) {
      cli::cli_alert_warning(
        "No game rotation for {game_id}: on-court players inferred from substitution events."
      )
      # bind_rows inside .players_on_court drops the wehoop_data attributes;
      # re-normalize so this path returns the same contract as the rotation path
      fallback <- make_wehoop_data(fallback, "WNBA Game Play-by-Play Information from WNBA.com", Sys.time())
      return(fallback)
    }
  }

  for (i in 1:5) {
    pbp_data[[paste0("away_player", i)]] <- NA_real_
  }
  for (i in 1:5) {
    pbp_data[[paste0("home_player", i)]] <- NA_real_
  }

  if (empty_rotation) {
    cli::cli_alert_warning(
      "No game rotation for {game_id}: on-court player columns are NA."
    )
    return(pbp_data)
  }

  # WNBA: 10-minute quarters (600 seconds), 5-minute OT (300 seconds)
  remaining_sec <- pbp_data$minute_remaining_quarter * 60 + pbp_data$seconds_remaining_quarter
  pbp_times <- ifelse(
    pbp_data$period <= 4,
    ((pbp_data$period - 1) * 600 + (600 - remaining_sec)) * 10,
    (2400 + (pbp_data$period - 5) * 300 + (300 - remaining_sec)) * 10
  )

  .resolve_team_oncourt <- function(stints, times) {
    in_times <- as.numeric(stints$IN_TIME_REAL)
    out_times <- as.numeric(stints$OUT_TIME_REAL)
    person_ids <- as.numeric(stints$PERSON_ID)
    n_pbp <- length(times)

    boundaries <- sort(unique(c(in_times, out_times)))
    n_bounds <- length(boundaries)

    if (n_bounds < 2) {
      active <- unique(person_ids)
      lineup <- rep(NA_real_, 5)
      n_a <- min(length(active), 5)
      if (n_a > 0) lineup[1:n_a] <- active[1:n_a]
      return(matrix(rep(lineup, each = n_pbp), nrow = n_pbp, ncol = 5))
    }

    n_intervals <- n_bounds - 1
    midpoints <- (boundaries[-n_bounds] + boundaries[-1]) / 2
    lineup_mat <- matrix(NA_real_, nrow = n_intervals, ncol = 5)
    for (k in seq_len(n_intervals)) {
      mid <- midpoints[k]
      active <- unique(person_ids[in_times <= mid & out_times > mid])
      n_a <- min(length(active), 5)
      if (n_a > 0) lineup_mat[k, 1:n_a] <- active[1:n_a]
    }

    max_t <- boundaries[n_bounds]
    final_active <- unique(person_ids[in_times <= max_t & out_times >= max_t])
    final_lineup <- rep(NA_real_, 5)
    n_f <- min(length(final_active), 5)
    if (n_f > 0) final_lineup[1:n_f] <- final_active[1:n_f]

    all_lineups <- rbind(lineup_mat, matrix(final_lineup, nrow = 1))

    idx <- findInterval(times, boundaries)
    idx[idx == 0L] <- 1L
    idx[idx == n_bounds] <- n_intervals + 1L
    idx <- pmin(pmax(idx, 1L), n_intervals + 1L)

    return(all_lineups[idx, , drop = FALSE])
  }

  away_mat <- .resolve_team_oncourt(rotation$AwayTeam, pbp_times)
  home_mat <- .resolve_team_oncourt(rotation$HomeTeam, pbp_times)

  for (i in 1:5) {
    pbp_data[[paste0("away_player", i)]] <- away_mat[, i]
  }
  for (i in 1:5) {
    pbp_data[[paste0("home_player", i)]] <- home_mat[, i]
  }

  away_team_id <- rotation$AwayTeam$TEAM_ID[1]
  away_team_city <- rotation$AwayTeam$TEAM_CITY[1]
  away_team_name <- rotation$AwayTeam$TEAM_NAME[1]
  home_team_id <- rotation$HomeTeam$TEAM_ID[1]
  home_team_city <- rotation$HomeTeam$TEAM_CITY[1]
  home_team_name <- rotation$HomeTeam$TEAM_NAME[1]

  is_away <- pbp_data$player1_team_id == away_team_id
  is_home <- pbp_data$player1_team_id == home_team_id
  is_away[is.na(is_away)] <- FALSE
  is_home[is.na(is_home)] <- FALSE
  pbp_data$player1_team_city[is_away] <- away_team_city
  pbp_data$player1_team_city[is_home] <- home_team_city
  pbp_data$player1_team_nickname[is_away] <- away_team_name
  pbp_data$player1_team_nickname[is_home] <- home_team_name

  return(pbp_data)
}


#' **Get WNBA Stats API play-by-play**
#' @name wnba_pbp
NULL
#' @title
#' **Get WNBA Stats API play-by-play**
#' @rdname wnba_pbp
#' @param game_id Game ID
#' @param on_court IF TRUE will be added ID of players on court
#' @param version Play-by-play version - `"v3"` (default) or `"v2"`. V3 returns richer data
#'   with shot coordinates, shot values, and V3 action types. V2 is available from 2016-17 onwards.
#' @param p Progress bar
#' @param ... Additional arguments passed to an underlying function like httr.
#' @return Returns a data frame: PlayByPlay
#'
#'    \if{html}{\tabular{lll}{
#'       col_name \tab types \tab description \cr
#'       game_id \tab character \tab Unique game identifier. \cr
#'       event_num \tab character \tab Sequential event number within the game (V2 PBP). \cr
#'       event_type \tab character \tab Event / play type code (V2 PBP). \cr
#'       event_action_type \tab character \tab Numeric event-action-type code (V2 PBP). \cr
#'       period \tab numeric \tab Period of the game (1-4 quarters; 5+ for OT). \cr
#'       minute_game \tab numeric \tab Minute game. \cr
#'       time_remaining \tab numeric \tab Time remaining. \cr
#'       wc_time_string \tab character \tab Wc time string. \cr
#'       time_quarter \tab character \tab Time quarter. \cr
#'       minute_remaining_quarter \tab numeric \tab Minute remaining quarter. \cr
#'       seconds_remaining_quarter \tab numeric \tab Seconds remaining quarter. \cr
#'       home_description \tab character \tab Home team's description. \cr
#'       neutral_description \tab character \tab Neutral description. \cr
#'       visitor_description \tab character \tab Visitor description. \cr
#'       score \tab character \tab Final score. \cr
#'       away_score \tab numeric \tab Away team score at the time of the play. \cr
#'       home_score \tab numeric \tab Home team score at the time of the play. \cr
#'       score_margin \tab character \tab Score margin. \cr
#'       person1type \tab character \tab Person1type. \cr
#'       player1_id \tab character \tab V2 PBP primary player ID (e.g. shooter / fouler). \cr
#'       player1_name \tab character \tab V2 PBP primary player name. \cr
#'       player1_team_id \tab character \tab Team ID of player1. \cr
#'       player1_team_city \tab character \tab Player1 team city. \cr
#'       player1_team_nickname \tab character \tab Player1 team nickname. \cr
#'       player1_team_abbreviation \tab character \tab Player1 team abbreviation. \cr
#'       person2type \tab character \tab Person2type. \cr
#'       player2_id \tab character \tab V2 PBP secondary player ID (e.g. assister / fouled-by). \cr
#'       player2_name \tab character \tab V2 PBP secondary player name. \cr
#'       player2_team_id \tab character \tab Team ID of player2. \cr
#'       player2_team_city \tab character \tab Player2 team city. \cr
#'       player2_team_nickname \tab character \tab Player2 team nickname. \cr
#'       player2_team_abbreviation \tab character \tab Player2 team abbreviation. \cr
#'       person3type \tab character \tab Person3type. \cr
#'       player3_id \tab character \tab V2 PBP tertiary player ID (e.g. blocker). \cr
#'       player3_name \tab character \tab V2 PBP tertiary player name. \cr
#'       player3_team_id \tab character \tab Team ID of player3. \cr
#'       player3_team_city \tab character \tab Player3 team city. \cr
#'       player3_team_nickname \tab character \tab Player3 team nickname. \cr
#'       player3_team_abbreviation \tab character \tab Player3 team abbreviation. \cr
#'       video_available_flag \tab character \tab Video available flag. \cr
#'       team_leading \tab character \tab Team leading. \cr
#'    }}
#'    \if{latex}{See the HTML help or pkgdown reference for the column table.}
#'
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows as_tibble
#' @import rvest
#' @export
#' @family WNBA PBP Functions
#' @details
#' ```r
#'  wnba_pbp(game_id = "1022200034", on_court = TRUE)
#' ```
wnba_pbp <- function(game_id,
                     on_court = TRUE, 
                     version = "v3",
                     p = NULL,
                     ...){
  .args <- mget(setdiff(names(formals()), "..."))
  
  # V3 path: use the dedicated V3 endpoint and parsing
  if (version == "v3") {
    data <- data.frame()
    tryCatch(
      expr = {
        v3_result <- wnba_playbyplayv3(game_id = game_id)
        data <- v3_result$PlayByPlay
        
        player_roster <- .build_player_roster_wnba(game_id = pad_id(game_id))
        
        data <- .v3_to_v2_format_wnba(data, player_roster = player_roster)
        
        if (on_court) {
          data <- .players_on_court_v3_wnba(data)
        }
      },
      error = function(e) .report_api_error(
        e,
        hint = "Invalid arguments or no V3 play-by-play data for {pad_id(game_id)} available!",
        args = .args
      ),
      warning = function(w) .report_api_warning(w, args = .args),
      finally = {
      }
    )
    return(data)
  }
  
  # V2/V1 path
  data <- data.frame()
  if (version == "v2") {
    endpoint <- wnba_endpoint('playbyplayv2')
  } else {
    endpoint <- wnba_endpoint('playbyplay')
  }
  
  full_url <- endpoint
  
  params <- list(
    EndPeriod = 0,
    GameID = pad_id(game_id),
    StartPeriod = 0
  )
  
  tryCatch(
    expr = {
      
      resp <- request_with_proxy(url = full_url, params = params, ...)
      
      data <- resp$resultSets$rowSet[[1]] %>%
        data.frame() %>%
        dplyr::as_tibble()
      
      json_names <- resp$resultSets$headers[[1]]
      colnames(data) <- json_names
      
      # Fix version 2 Dataset
      if (version == "v2") {
        data <- data %>%
          # fix column names
          janitor::clean_names() %>%
          dplyr::rename(dplyr::any_of(c(
            "wc_time_string" = "wctimestring",
            "time_quarter" = "pctimestring",
            "score_margin" = "scoremargin",
            "event_num" = "eventnum",
            "event_type" = "eventmsgtype",
            "event_action_type" = "eventmsgactiontype",
            "home_description" = "homedescription",
            "neutral_description" = "neutraldescription",
            "visitor_description" = "visitordescription"
          ))) %>%
          ## Get Team Scores
          tidyr::separate(
            "score",
            into = c("away_score", "home_score"),
            sep = "\\ - ",
            remove = FALSE
          ) %>%
          dplyr::mutate(
            home_score = as.numeric(.data$home_score),
            away_score = as.numeric(.data$away_score),
            team_leading = dplyr::case_when(
              .data$score_margin == 0 ~ "Tie",
              .data$score_margin < 0 ~ "Away",
              is.na(.data$score_margin) ~ NA_character_,
              TRUE ~ "Home"
            )
          ) %>%
          ## Time Remaining
          tidyr::separate(
            "time_quarter",
            into = c("minute_remaining_quarter", "seconds_remaining_quarter"),
            sep = "\\:",
            remove = F
          ) %>%
          dplyr::mutate(
            minute_remaining_quarter = as.numeric(.data$minute_remaining_quarter),
            seconds_remaining_quarter = as.numeric(.data$seconds_remaining_quarter),
            period = as.numeric(.data$period)
          ) %>%
          dplyr::mutate(
            minute_game = round(((.data$period - 1) * 10) + (10 - .data$minute_remaining_quarter) +
                                  (((
                                    60 - .data$seconds_remaining_quarter
                                  ) / 60) - 1), 2),
            time_remaining = 40 - round(((.data$period - 1) * 10) - (10 - .data$minute_remaining_quarter) -
                                          ((60 - .data$seconds_remaining_quarter) / 60 - 1), 2)
          ) %>%
          dplyr::select(
            "game_id":"period",
            "minute_game",
            "time_remaining",
            dplyr::everything()
          ) %>%
          make_wehoop_data("WNBA Game Play-by-Play Information from WNBA.com", Sys.time())
        
        if(on_court){
          data <- .players_on_court(data)
        }
      }
    },
    error = function(e) .report_api_error(
      e,
      hint = "Invalid arguments or no play-by-play data for {pad_id(game_id)} available!",
      args = .args
    ),
    warning = function(w) .report_api_warning(w, args = .args),
    finally = {
    }
  )
  return(data)
}


#' **Get WNBA Stats API play-by-play (Multiple Games)**
#' @name wnba_pbps
NULL
#' @title
#' **Get WNBA Stats API play-by-play (Multiple Games)**
#' @rdname wnba_pbps
#' @author Jason Lee
#' @param game_ids Game IDs
#' @param on_court IF TRUE will be added ID of players on court
#' @param version Play-by-play version - `"v3"` (default) or `"v2"`. V3 returns richer data
#'   with shot coordinates, shot values, and V3 action types. V2 is available from 2016-17 onwards.
#' @param nest_data If TRUE returns nested data by game
#' @param ... Additional arguments passed to an underlying function like httr.
#' @return Returns a data frame: PlayByPlay
#'
#'    Columns as documented in the shared [wnba_players_on_court_schema] table.
#'
#' @export
#' @family WNBA PBP Functions
#' @details
#' ```r
#' y <- c("1022200034", "1022200035" )
#'
#' wnba_pbps(game_ids = y, version = "v2")
#' ```
wnba_pbps <- function(
    game_ids = NULL,
    on_court = TRUE,
    version = "v3",
    nest_data = FALSE,
    ...) {
  
  old <- options(list(stringsAsFactors = FALSE, scipen = 999))
  on.exit(options(old))
  
  if (game_ids %>% purrr::is_null()) {
    stop("Please enter game ids")
  }
  
  
  p <- NULL
  if (is_installed("progressr")) p <- progressr::progressor(along = game_ids)
  get_pbp_safe <- progressively(wnba_pbp, p)
  
  
  all_data <-
    game_ids %>%
    purrr::map_dfr(function(game_id) {
      get_pbp_safe(game_id = game_id, on_court = on_court, ..., p = p)
    })
  
  if (nest_data) {
    all_data <-
      all_data %>%
      dplyr::group_by(.data$game_id) %>%
      tidyr::nest()
  }
  
  return(all_data)
}


#' **Get WNBA Stats API Live play-by-play**
#' @name wnba_live_pbp
NULL
#' @title
#' **Get WNBA Stats API Live play-by-play**
#' @rdname wnba_live_pbp
#' @author Saiem Gilani
#' @param game_id Game ID
#' @param ... Additional arguments passed to an underlying function like httr.
#' @return Returns a data frame: PlayByPlay
#'
#'    \if{html}{\tabular{lll}{
#'       col_name \tab types \tab description \cr
#'       event_num \tab integer \tab Sequential event number within the game (V2 PBP). \cr
#'       clock \tab character \tab Game clock value. \cr
#'       time_actual \tab character \tab Time actual. \cr
#'       period \tab integer \tab Period of the game (1-4 quarters; 5+ for OT). \cr
#'       period_type \tab character \tab Period type. \cr
#'       action_type \tab character \tab Action type label (e.g. 'Made Shot', 'Substitution'). \cr
#'       sub_type \tab character \tab Action sub-type label. \cr
#'       qualifiers \tab list \tab Qualifiers. \cr
#'       player1_id \tab integer \tab V2 PBP primary player ID (e.g. shooter / fouler). \cr
#'       x \tab numeric \tab X. \cr
#'       y \tab numeric \tab Y. \cr
#'       offense_team_id \tab integer \tab Unique identifier for offense team. \cr
#'       home_score \tab character \tab Home team score at the time of the play. \cr
#'       away_score \tab character \tab Away team score at the time of the play. \cr
#'       edited \tab character \tab Edited. \cr
#'       order \tab integer \tab Display order within the result set. \cr
#'       x_legacy \tab integer \tab V2-format X coordinate (preserved for V3-to-V2 compatibility). \cr
#'       y_legacy \tab integer \tab V2-format Y coordinate (preserved for V3-to-V2 compatibility). \cr
#'       is_field_goal \tab integer \tab 1 if the action was a field goal; 0 otherwise. \cr
#'       side \tab character \tab Side label (e.g. 'home', 'away', or 'overUnder'). \cr
#'       description \tab character \tab Long-form description text. \cr
#'       person_ids_filter \tab list \tab Person ids filter. \cr
#'       team_id \tab integer \tab Unique team identifier. \cr
#'       team_tricode \tab character \tab Three-letter team code (e.g. 'LAS' / 'NYL'). \cr
#'       descriptor \tab character \tab Descriptor. \cr
#'       jump_ball_recovered_name \tab character \tab Jump ball recovered name. \cr
#'       jump_ball_recoverd_person_id \tab integer \tab Unique identifier for jump ball recoverd person. \cr
#'       player_name \tab character \tab Player name. \cr
#'       player_name_i \tab character \tab Player name i. \cr
#'       jump_ball_won_player_name \tab character \tab Jump ball won player name. \cr
#'       jump_ball_won_person_id \tab integer \tab Unique identifier for jump ball won person. \cr
#'       jump_ball_lost_player_name \tab character \tab Jump ball lost player name. \cr
#'       jump_ball_lost_person_id \tab integer \tab Unique identifier for jump ball lost person. \cr
#'       shot_distance \tab numeric \tab Shot distance from the basket, in feet. \cr
#'       shot_result \tab character \tab Shot result ('Made' / 'Missed'). \cr
#'       shot_action_number \tab integer \tab Shot action number. \cr
#'       rebound_total \tab integer \tab Rebound total. \cr
#'       rebound_defensive_total \tab integer \tab Rebound defensive total. \cr
#'       rebound_offensive_total \tab integer \tab Rebound offensive total. \cr
#'       turnover_total \tab integer \tab Turnover total. \cr
#'       steal_player_name \tab character \tab Steal player name. \cr
#'       steal_person_id \tab integer \tab Unique identifier for steal person. \cr
#'       points_total \tab integer \tab Running total of points scored. \cr
#'       assist_player_name_initial \tab character \tab Assist player name initial. \cr
#'       assist_person_id \tab integer \tab Unique identifier for assist person. \cr
#'       assist_total \tab integer \tab Assist total. \cr
#'       official_id \tab integer \tab Unique official / referee identifier. \cr
#'       foul_personal_total \tab integer \tab Foul personal total. \cr
#'       foul_technical_total \tab integer \tab Foul technical total. \cr
#'       foul_drawn_player_name \tab character \tab Foul drawn player name. \cr
#'       foul_drawn_person_id \tab integer \tab Unique identifier for foul drawn person. \cr
#'       block_player_name \tab character \tab Block player name. \cr
#'       block_person_id \tab integer \tab Unique identifier for block person. \cr
#'       value \tab character \tab Numeric or string value field. \cr
#'       player2_id \tab integer \tab V2 PBP secondary player ID (e.g. assister / fouled-by). \cr
#'       player3_id \tab integer \tab V2 PBP tertiary player ID (e.g. blocker). \cr
#'    }}
#'    \if{latex}{See the HTML help or pkgdown reference for the column table.}
#'
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows as_tibble
#' @import rvest
#' @export
#' @family WNBA PBP Functions
#' @family WNBA Live Functions
#' @details
#' ```r
#'   wnba_live_pbp(game_id = "1022200034")
#' ```
wnba_live_pbp <- function(
    game_id,
    ...){
  .args <- mget(setdiff(names(formals()), "..."))
  
  old <- options(list(stringsAsFactors = FALSE, scipen = 999))
  on.exit(options(old))
  
  endpoint <- wnba_live_endpoint('playbyplay')
  
  full_url <- paste0(endpoint,
                     "/playbyplay_",
                     pad_id(game_id),
                     ".json")
  
  data <- data.frame()

  tryCatch(
    expr = {
      
      res <- .retry_request(full_url)

      resp <- res %>%
        .resp_text() %>%
        jsonlite::fromJSON()

      data <- resp %>%
        purrr::pluck("game") %>%
        purrr::pluck("actions") %>%
        janitor::clean_names()
      
      data <- data  %>%
        dplyr::rename(dplyr::any_of(c(
          "period" = "period",
          "event_num" = "action_number",
          "clock" = "clock",
          "description" = "description",
          "locX" = "xLegacy",
          "locY" = "yLegacy",
          "action_type" = "action_type",
          "sub_type" = "sub_type",
          "descriptor" = "descriptor",
          "shot_result" = "shot_result",
          "shot_action_number" = "shot_action_number",
          "qualifiers" = "qualifiers",
          "team_id" = "team_id",
          "player1_id" = "person_id",
          "home_score" = "score_home",
          "away_score" = "score_away",
          "offense_team_id" = "possession",
          "order" = "order_number"))) %>%
        dplyr::mutate(
          player2_id = dplyr::case_when(
            !is.na(.data$assist_person_id) ~ .data$assist_person_id,
            TRUE ~ NA_integer_),
          player3_id = dplyr::case_when(
            !is.na(.data$block_person_id) ~ .data$block_person_id,
            !is.na(.data$steal_person_id) ~ .data$steal_person_id,
            !is.na(.data$foul_drawn_person_id) ~ .data$foul_drawn_person_id,
            TRUE ~ NA_integer_
          )) %>%
        make_wehoop_data("WNBA Game Play-by-Play Information from WNBA.com", Sys.time())
      
      
    },
    error = function(e) .report_api_error(
      e,
      hint = "Invalid arguments or no play-by-play data for {game_id} available!",
      args = .args
    ),
    warning = function(w) .report_api_warning(w, args = .args),
    finally = {
    }
  )
  return(data)
}


#' **Get WNBA Stats API Live Boxscore**
#' @name wnba_live_boxscore
NULL
#' @title
#' **Get WNBA Stats API Live Boxscore**
#' @rdname wnba_live_boxscore
#' @author Saiem Gilani
#' @param game_id Game ID
#' @param ... Additional arguments passed to an underlying function like httr.
#' @return Returns a named list of data frames: game_details, arena, officials, home_team_boxscore,
#' away_team_boxscore, home_team_player_boxscore, away_team_player_boxscore, home_team_linescores,
#' away_team_linescores
#'
#'    **game_details**
#'
#'
#'    \if{html}{\tabular{lll}{
#'       col_name \tab types \tab description \cr
#'       game_id \tab character \tab Unique game identifier. \cr
#'       game_time_local \tab character \tab Game time local. \cr
#'       game_time_utc \tab character \tab Game start time in UTC (ISO 8601 timestamp). \cr
#'       game_time_home \tab character \tab Game time home. \cr
#'       game_time_away \tab character \tab Game time away. \cr
#'       game_et \tab character \tab Game et. \cr
#'       duration \tab integer \tab Duration. \cr
#'       game_code \tab character \tab ESPN game code (numeric identifier). \cr
#'       game_status_text \tab character \tab Game status display text (e.g. 'Final', '4:32 - 4th'). \cr
#'       game_status \tab integer \tab Game status label. \cr
#'       regulation_periods \tab integer \tab Regulation periods. \cr
#'       period \tab integer \tab Period of the game (1-4 quarters; 5+ for OT). \cr
#'       game_clock \tab character \tab Game clock. \cr
#'       attendance \tab integer \tab Reported attendance. \cr
#'       sellout \tab character \tab Sellout. \cr
#'       home_team_id \tab integer \tab Unique identifier for the home team. \cr
#'       home_team_name \tab character \tab Home team name. \cr
#'       home_team_city \tab character \tab Home team city / location. \cr
#'       home_team_tricode \tab character \tab Home team three-letter code. \cr
#'       home_team_score \tab integer \tab Home team's score. \cr
#'       home_team_in_bonus \tab character \tab Home team's team in bonus. \cr
#'       home_team_timeouts_remaining \tab integer \tab Home team's team timeouts remaining. \cr
#'       away_team_id \tab integer \tab Unique identifier for the away team. \cr
#'       away_team_name \tab character \tab Away team name. \cr
#'       away_team_city \tab character \tab Away team city / location. \cr
#'       away_team_tricode \tab character \tab Away team three-letter code. \cr
#'       away_team_score \tab integer \tab Away team's score. \cr
#'       away_team_in_bonus \tab character \tab Away team's team in bonus. \cr
#'       away_team_timeouts_remaining \tab integer \tab Away team's team timeouts remaining. \cr
#'    }}
#'    \if{latex}{See the HTML help or pkgdown reference for the column table.}
#'
#'    **arena**
#'
#'
#'    |col_name       |types     |description                  |
#'    |:--------------|:---------|:----------------------------|
#'    |arena_id       |integer   |Unique identifier for arena. |
#'    |arena_name     |character |Arena name.                  |
#'    |arena_city     |character |Arena city.                  |
#'    |arena_state    |character |Arena state.                 |
#'    |arena_country  |character |Arena country.               |
#'    |arena_timezone |character |Arena timezone.              |
#'
#'    **officials**
#'
#'
#'    |col_name    |types     |description                              |
#'    |:-----------|:---------|:----------------------------------------|
#'    |person_id   |integer   |Unique player identifier (V3 endpoints). |
#'    |name        |character |Display name.                            |
#'    |name_i      |character |Initialed name (e.g. 'A. Wilson').       |
#'    |first_name  |character |Player's first name.                     |
#'    |family_name |character |Player's family / last name.             |
#'    |jersey_num  |character |Jersey number worn by the player.        |
#'    |assignment  |character |Assignment.                              |
#'
#'    **home_team_boxscore**
#'
#'
#'    \if{html}{\tabular{lll}{
#'       col_name \tab types \tab description \cr
#'       team_id \tab integer \tab Unique team identifier. \cr
#'       team_name \tab character \tab Full team display name (e.g. 'Las Vegas Aces'). \cr
#'       team_city \tab character \tab Team city or region (e.g. 'Las Vegas'). \cr
#'       team_tricode \tab character \tab Three-letter team code (e.g. 'LAS' / 'NYL'). \cr
#'       team_score \tab integer \tab Team's score / final score. \cr
#'       team_in_bonus \tab character \tab Team in bonus. \cr
#'       team_timeouts_remaining \tab integer \tab Team timeouts remaining. \cr
#'       assists \tab integer \tab Total assists. \cr
#'       assists_turnover_ratio \tab numeric \tab Assists turnover ratio. \cr
#'       bench_points \tab integer \tab Points scored by the bench. \cr
#'       biggest_lead \tab integer \tab Biggest lead. \cr
#'       biggest_lead_score \tab character \tab Biggest lead score. \cr
#'       biggest_scoring_run \tab integer \tab Biggest scoring run. \cr
#'       biggest_scoring_run_score \tab character \tab Biggest scoring run score. \cr
#'       blocks \tab integer \tab Total blocks. \cr
#'       blocks_received \tab integer \tab Shots blocked by opponents while attempting. \cr
#'       fast_break_points_attempted \tab integer \tab Number of fast break points attempted. \cr
#'       fast_break_points_made \tab integer \tab Number of fast break points made. \cr
#'       fast_break_points_percentage \tab numeric \tab Fast break points percentage (0-1 decimal). \cr
#'       field_goals_attempted \tab integer \tab Field goal attempts (2-pt + 3-pt). \cr
#'       field_goals_effective_adjusted \tab numeric \tab Field goals effective adjusted. \cr
#'       field_goals_made \tab integer \tab Field goals made (2-pt + 3-pt). \cr
#'       field_goals_percentage \tab numeric \tab Field goal percentage (0-1 decimal). \cr
#'       fouls_offensive \tab integer \tab Offensive fouls. \cr
#'       fouls_drawn \tab integer \tab Personal fouls drawn (by opponent's actions). \cr
#'       fouls_personal \tab integer \tab Personal fouls. \cr
#'       fouls_team \tab integer \tab Fouls team. \cr
#'       fouls_technical \tab integer \tab Technical fouls. \cr
#'       fouls_team_technical \tab integer \tab Fouls team technical. \cr
#'       free_throws_attempted \tab integer \tab Free throw attempts. \cr
#'       free_throws_made \tab integer \tab Free throws made. \cr
#'       free_throws_percentage \tab numeric \tab Free throw percentage (0-1 decimal). \cr
#'       lead_changes \tab integer \tab Lead changes. \cr
#'       minutes \tab character \tab Minutes played, formatted MM:SS (V3 PT-duration parsed) or decimal minutes (V2). \cr
#'       minutes_calculated \tab character \tab Minutes calculated from game-clock differences. \cr
#'       points \tab integer \tab Points scored. \cr
#'       points_against \tab integer \tab Points allowed. \cr
#'       points_fast_break \tab integer \tab Fast-break points scored. \cr
#'       points_from_turnovers \tab integer \tab Points from turnovers. \cr
#'       points_in_the_paint \tab integer \tab Points in the paint. \cr
#'       points_in_the_paint_attempted \tab integer \tab Number of points in the paint attempted. \cr
#'       points_in_the_paint_made \tab integer \tab Number of points in the paint made. \cr
#'       points_in_the_paint_percentage \tab numeric \tab Points in the paint percentage (0-1 decimal). \cr
#'       points_second_chance \tab integer \tab Second-chance points scored. \cr
#'       rebounds_defensive \tab integer \tab Defensive rebounds. \cr
#'       rebounds_offensive \tab integer \tab Offensive rebounds. \cr
#'       rebounds_personal \tab integer \tab Rebounds personal. \cr
#'       rebounds_team \tab integer \tab Rebounds team. \cr
#'       rebounds_team_defensive \tab integer \tab Rebounds team defensive. \cr
#'       rebounds_team_offensive \tab integer \tab Rebounds team offensive. \cr
#'       rebounds_total \tab integer \tab Total rebounds. \cr
#'       second_chance_points_attempted \tab integer \tab Number of second chance points attempted. \cr
#'       second_chance_points_made \tab integer \tab Number of second chance points made. \cr
#'       second_chance_points_percentage \tab numeric \tab Second chance points percentage (0-1 decimal). \cr
#'       steals \tab integer \tab Total steals. \cr
#'       three_pointers_attempted \tab integer \tab Three-point field goal attempts. \cr
#'       three_pointers_made \tab integer \tab Three-point field goals made. \cr
#'       three_pointers_percentage \tab numeric \tab Three-point field goal percentage (0-1 decimal). \cr
#'       time_leading \tab character \tab Time leading. \cr
#'       times_tied \tab integer \tab Times tied. \cr
#'       true_shooting_attempts \tab numeric \tab Number of true shooting attempted. \cr
#'       true_shooting_percentage \tab numeric \tab True shooting percentage (0-1). \cr
#'       turnovers \tab integer \tab Total turnovers. \cr
#'       turnovers_team \tab integer \tab Turnovers team. \cr
#'       turnovers_total \tab integer \tab Turnovers total. \cr
#'       two_pointers_attempted \tab integer \tab Number of two pointers attempted. \cr
#'       two_pointers_made \tab integer \tab Number of two pointers made. \cr
#'       two_pointers_percentage \tab numeric \tab Two pointers percentage (0-1 decimal). \cr
#'    }}
#'    \if{latex}{See the HTML help or pkgdown reference for the column table.}
#'
#'    **away_team_boxscore**
#'
#'
#'    Same columns as the **home_team_boxscore** table above.
#'
#'    **home_team_player_boxscore**
#'
#'
#'    \if{html}{\tabular{lll}{
#'       col_name \tab types \tab description \cr
#'       team_id \tab integer \tab Unique team identifier. \cr
#'       team_name \tab character \tab Full team display name (e.g. 'Las Vegas Aces'). \cr
#'       team_city \tab character \tab Team city or region (e.g. 'Las Vegas'). \cr
#'       team_tricode \tab character \tab Three-letter team code (e.g. 'LAS' / 'NYL'). \cr
#'       team_score \tab integer \tab Team's score / final score. \cr
#'       team_in_bonus \tab character \tab Team in bonus. \cr
#'       team_timeouts_remaining \tab integer \tab Team timeouts remaining. \cr
#'       status \tab character \tab Status label. \cr
#'       order \tab integer \tab Display order within the result set. \cr
#'       person_id \tab integer \tab Unique player identifier (V3 endpoints). \cr
#'       jersey_num \tab character \tab Jersey number worn by the player. \cr
#'       position \tab character \tab Listed roster position (G, F, C, etc.). \cr
#'       starter \tab character \tab TRUE if the player was in the starting lineup; FALSE otherwise. \cr
#'       oncourt \tab character \tab Oncourt. \cr
#'       played \tab character \tab Played. \cr
#'       assists \tab integer \tab Total assists. \cr
#'       blocks \tab integer \tab Total blocks. \cr
#'       blocks_received \tab integer \tab Shots blocked by opponents while attempting. \cr
#'       field_goals_attempted \tab integer \tab Field goal attempts (2-pt + 3-pt). \cr
#'       field_goals_made \tab integer \tab Field goals made (2-pt + 3-pt). \cr
#'       field_goals_percentage \tab numeric \tab Field goal percentage (0-1 decimal). \cr
#'       fouls_offensive \tab integer \tab Offensive fouls. \cr
#'       fouls_drawn \tab integer \tab Personal fouls drawn (by opponent's actions). \cr
#'       fouls_personal \tab integer \tab Personal fouls. \cr
#'       fouls_technical \tab integer \tab Technical fouls. \cr
#'       free_throws_attempted \tab integer \tab Free throw attempts. \cr
#'       free_throws_made \tab integer \tab Free throws made. \cr
#'       free_throws_percentage \tab numeric \tab Free throw percentage (0-1 decimal). \cr
#'       minus \tab numeric \tab Minus. \cr
#'       minutes \tab character \tab Minutes played, formatted MM:SS (V3 PT-duration parsed) or decimal minutes (V2). \cr
#'       minutes_calculated \tab character \tab Minutes calculated from game-clock differences. \cr
#'       plus \tab numeric \tab Plus. \cr
#'       plus_minus_points \tab numeric \tab Plus/minus point differential while on court. \cr
#'       points \tab integer \tab Points scored. \cr
#'       points_fast_break \tab integer \tab Fast-break points scored. \cr
#'       points_in_the_paint \tab integer \tab Points in the paint. \cr
#'       points_second_chance \tab integer \tab Second-chance points scored. \cr
#'       rebounds_defensive \tab integer \tab Defensive rebounds. \cr
#'       rebounds_offensive \tab integer \tab Offensive rebounds. \cr
#'       rebounds_total \tab integer \tab Total rebounds. \cr
#'       steals \tab integer \tab Total steals. \cr
#'       three_pointers_attempted \tab integer \tab Three-point field goal attempts. \cr
#'       three_pointers_made \tab integer \tab Three-point field goals made. \cr
#'       three_pointers_percentage \tab numeric \tab Three-point field goal percentage (0-1 decimal). \cr
#'       turnovers \tab integer \tab Total turnovers. \cr
#'       two_pointers_attempted \tab integer \tab Number of two pointers attempted. \cr
#'       two_pointers_made \tab integer \tab Number of two pointers made. \cr
#'       two_pointers_percentage \tab numeric \tab Two pointers percentage (0-1 decimal). \cr
#'       name \tab character \tab Display name. \cr
#'       name_i \tab character \tab Initialed name (e.g. 'A. Wilson'). \cr
#'       first_name \tab character \tab Player's first name. \cr
#'       family_name \tab character \tab Player's family / last name. \cr
#'       not_playing_reason \tab character \tab Not playing reason. \cr
#'       not_playing_description \tab character \tab Not playing description. \cr
#'    }}
#'    \if{latex}{See the HTML help or pkgdown reference for the column table.}
#'
#'    **away_team_player_boxscore**
#'
#'
#'    Same columns as the **home_team_player_boxscore** table above.
#'
#'    **home_team_linescores**
#'
#'
#'    |col_name    |types     |description                                   |
#'    |:-----------|:---------|:---------------------------------------------|
#'    |period      |integer   |Period of the game (1-4 quarters; 5+ for OT). |
#'    |period_type |character |Period type.                                  |
#'    |score       |integer   |Final score.                                  |
#'
#'    **away_team_linescores**
#'
#'
#'    Same columns as the **home_team_linescores** table above.
#'
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows as_tibble
#' @import rvest
#' @export
#' @family NBA Boxscore Functions
#' @family NBA Live Functions
#' @details
#' ```r
#'  wnba_live_boxscore(game_id = "1022200034")
#' ```
wnba_live_boxscore <- function(
    game_id,
    ...){
  .args <- mget(setdiff(names(formals()), "..."))
  
  old <- options(list(stringsAsFactors = FALSE, scipen = 999))
  on.exit(options(old))
  
  endpoint <- wnba_live_endpoint('boxscore')
  
  full_url <- paste0(endpoint,
                     "/boxscore_",
                     pad_id(game_id),
                     ".json")
  
  df_list <- list()

  tryCatch(
    expr = {
      
      res <- .retry_request(full_url)

      resp <- res %>%
        .resp_text() %>%
        jsonlite::fromJSON()

      data <- resp %>%
        purrr::pluck("game")

      game_details <- data.frame(
        game_id = data %>% purrr::pluck("gameId"),
        game_time_local = data %>% purrr::pluck("gameTimeLocal"),
        game_time_utc = data %>% purrr::pluck("gameTimeUTC"),
        game_time_home = data %>% purrr::pluck("gameTimeHome"),
        game_time_away = data %>% purrr::pluck("gameTimeAway"),
        game_et = data %>% purrr::pluck("gameEt"),
        duration = data %>% purrr::pluck("duration"),
        game_code = data %>% purrr::pluck("gameCode"),
        game_status_text = data %>% purrr::pluck("gameStatusText"),
        game_status = data %>% purrr::pluck("gameStatus"),
        regulation_periods = data %>% purrr::pluck("regulationPeriods"),
        period = data %>% purrr::pluck("period"),
        game_clock = data %>% purrr::pluck("gameClock"),
        attendance = data %>% purrr::pluck("attendance"),
        sellout = data %>% purrr::pluck("sellout")
      )
      
      arena <- data %>%
        purrr::pluck("arena") %>%
        data.frame() %>%
        janitor::clean_names() %>%
        make_wehoop_data("WNBA Game Arena Information from WNBA.com", Sys.time())
      
      officials <- data %>%
        purrr::pluck("officials") %>%
        data.frame() %>%
        janitor::clean_names() %>%
        make_wehoop_data("WNBA Game Officials Information from WNBA.com", Sys.time())
      
      if ("homeTeam" %in% names(data)) {
        
        home_team <- data %>%
          purrr::pluck("homeTeam")
        
        home_team_info <- data.frame(
          team_id = home_team %>% purrr::pluck("teamId"),
          team_name = home_team %>% purrr::pluck("teamName"),
          team_city = home_team %>% purrr::pluck("teamCity"),
          team_tricode = home_team %>% purrr::pluck("teamTricode"),
          team_score = home_team %>% purrr::pluck("score"),
          team_in_bonus = home_team %>% purrr::pluck("inBonus"),
          team_timeouts_remaining = home_team %>% purrr::pluck("timeoutsRemaining")
        )
        
        home_team_box <- home_team %>%
          purrr::pluck("statistics") %>%
          data.frame()
        
        home_team_linescores <- home_team$periods %>%
          janitor::clean_names()
        
        home_team_players <- home_team %>%
          purrr::pluck("players") %>%
          tidyr::unnest("statistics")
        
        home_team_player_boxscore <- home_team_info %>%
          dplyr::bind_cols(home_team_players) %>%
          janitor::clean_names() %>%
          make_wehoop_data("WNBA Game Player Boxscore Information from WNBA.com", Sys.time())
        
        home_team_boxscore <- home_team_info %>%
          dplyr::bind_cols(home_team_box) %>%
          janitor::clean_names() %>%
          make_wehoop_data("WNBA Game Team Boxscore Information from WNBA.com", Sys.time())
        
      }
      
      if ("awayTeam" %in% names(data)) {
        
        away_team <- data %>%
          purrr::pluck("awayTeam")
        
        away_team_info <- data.frame(
          team_id = away_team %>% purrr::pluck("teamId"),
          team_name = away_team %>% purrr::pluck("teamName"),
          team_city = away_team %>% purrr::pluck("teamCity"),
          team_tricode = away_team %>% purrr::pluck("teamTricode"),
          team_score = away_team %>% purrr::pluck("score"),
          team_in_bonus = away_team %>% purrr::pluck("inBonus"),
          team_timeouts_remaining = away_team %>% purrr::pluck("timeoutsRemaining")
        )
        
        away_team_box <- away_team %>%
          purrr::pluck("statistics") %>%
          data.frame()
        
        away_team_linescores <- away_team$periods %>%
          janitor::clean_names() %>%
          make_wehoop_data("WNBA Game Linescore Information from WNBA.com", Sys.time())
        
        away_team_players <- away_team %>%
          purrr::pluck("players") %>%
          tidyr::unnest("statistics")
        
        away_team_player_boxscore <- away_team_info %>%
          dplyr::bind_cols(away_team_players) %>%
          janitor::clean_names() %>%
          make_wehoop_data("WNBA Game Player Boxscore Information from WNBA.com", Sys.time())
        
        away_team_boxscore <- away_team_info %>%
          dplyr::bind_cols(away_team_box) %>%
          janitor::clean_names() %>%
          make_wehoop_data("WNBA Game Team Boxscore Information from WNBA.com", Sys.time())
        
      }
      
      colnames(home_team_info) <- paste0("home_", colnames(home_team_info))
      colnames(away_team_info) <- paste0("away_", colnames(away_team_info))
      
      game_details <- game_details %>%
        dplyr::bind_cols(home_team_info) %>%
        dplyr::bind_cols(away_team_info) %>%
        make_wehoop_data("WNBA Game Linescore Information from WNBA.com", Sys.time())
      
      df_list <- c(
        list(game_details),
        list(arena),
        list(officials),
        list(home_team_boxscore),
        list(away_team_boxscore),
        list(home_team_player_boxscore),
        list(away_team_player_boxscore),
        list(home_team_linescores),
        list(away_team_linescores)
      )
      
      names(df_list) = c(
        "game_details",
        "arena",
        "officials",
        "home_team_boxscore",
        "away_team_boxscore",
        "home_team_player_boxscore",
        "away_team_player_boxscore",
        "home_team_linescores",
        "away_team_linescores"
      )
      
    },
    error = function(e) .report_api_error(
      e,
      hint = "Invalid arguments or no boxscore data for {game_id} available!",
      args = .args
    ),
    warning = function(w) .report_api_warning(w, args = .args),
    finally = {
    }
  )
  return(df_list)
}
