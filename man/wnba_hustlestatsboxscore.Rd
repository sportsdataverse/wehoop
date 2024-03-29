% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/wnba_stats_boxscore.R
\name{wnba_hustlestatsboxscore}
\alias{wnba_hustlestatsboxscore}
\title{\strong{Get WNBA Stats API Hustle Stats Boxscore}}
\usage{
wnba_hustlestatsboxscore(game_id, ...)
}
\arguments{
\item{game_id}{Game ID}

\item{...}{Additional arguments passed to an underlying function like httr.}
}
\value{
Returns a named list of data frames: HustleStatsAvailable, PlayerStats, TeamStats

\strong{HustleStatsAvailable}\tabular{ll}{
   col_name \tab types \cr
   GAME_ID \tab character \cr
   HUSTLE_STATUS \tab character \cr
}


\strong{PlayerStats}\tabular{ll}{
   col_name \tab types \cr
   GAME_ID \tab character \cr
   TEAM_ID \tab character \cr
   TEAM_ABBREVIATION \tab character \cr
   TEAM_CITY \tab character \cr
   PLAYER_ID \tab character \cr
   PLAYER_NAME \tab character \cr
   START_POSITION \tab character \cr
   COMMENT \tab character \cr
   MINUTES \tab character \cr
   PTS \tab character \cr
   CONTESTED_SHOTS \tab character \cr
   CONTESTED_SHOTS_2PT \tab character \cr
   CONTESTED_SHOTS_3PT \tab character \cr
   DEFLECTIONS \tab character \cr
   CHARGES_DRAWN \tab character \cr
   SCREEN_ASSISTS \tab character \cr
   SCREEN_AST_PTS \tab character \cr
   OFF_LOOSE_BALLS_RECOVERED \tab character \cr
   DEF_LOOSE_BALLS_RECOVERED \tab character \cr
   LOOSE_BALLS_RECOVERED \tab character \cr
   OFF_BOXOUTS \tab character \cr
   DEF_BOXOUTS \tab character \cr
   BOX_OUT_PLAYER_TEAM_REBS \tab character \cr
   BOX_OUT_PLAYER_REBS \tab character \cr
   BOX_OUTS \tab character \cr
}


\strong{TeamStats}\tabular{ll}{
   col_name \tab types \cr
   GAME_ID \tab character \cr
   TEAM_ID \tab character \cr
   TEAM_NAME \tab character \cr
   TEAM_ABBREVIATION \tab character \cr
   TEAM_CITY \tab character \cr
   MINUTES \tab character \cr
   PTS \tab character \cr
   CONTESTED_SHOTS \tab character \cr
   CONTESTED_SHOTS_2PT \tab character \cr
   CONTESTED_SHOTS_3PT \tab character \cr
   DEFLECTIONS \tab character \cr
   CHARGES_DRAWN \tab character \cr
   SCREEN_ASSISTS \tab character \cr
   SCREEN_AST_PTS \tab character \cr
   OFF_LOOSE_BALLS_RECOVERED \tab character \cr
   DEF_LOOSE_BALLS_RECOVERED \tab character \cr
   LOOSE_BALLS_RECOVERED \tab character \cr
   OFF_BOXOUTS \tab character \cr
   DEF_BOXOUTS \tab character \cr
   BOX_OUT_PLAYER_TEAM_REBS \tab character \cr
   BOX_OUT_PLAYER_REBS \tab character \cr
   BOX_OUTS \tab character \cr
}
}
\description{
\strong{Get WNBA Stats API Hustle Stats Boxscore}

\strong{Get WNBA Stats API Hustle Stats Boxscore}
}
\details{
\if{html}{\out{<div class="sourceCode r">}}\preformatted{  wnba_hustlestatsboxscore(game_id = "1022200034")
}\if{html}{\out{</div>}}
}
\seealso{
Other WNBA Boxscore Functions: 
\code{\link{wnba_boxscoreadvancedv2}()},
\code{\link{wnba_boxscorefourfactorsv2}()},
\code{\link{wnba_boxscoremiscv2}()},
\code{\link{wnba_boxscoreplayertrackv2}()},
\code{\link{wnba_boxscorescoringv2}()},
\code{\link{wnba_boxscoresummaryv2}()},
\code{\link{wnba_boxscoretraditionalv2}()},
\code{\link{wnba_boxscoreusagev2}()},
\code{\link{wnba_gamerotation}()}

Other WNBA Hustle Functions: 
\code{\link{wnba_leaguehustlestatsplayerleaders}()},
\code{\link{wnba_leaguehustlestatsplayer}()},
\code{\link{wnba_leaguehustlestatsteamleaders}()},
\code{\link{wnba_leaguehustlestatsteam}()}
}
\author{
Saiem Gilani
}
\concept{WNBA Boxscore Functions}
\concept{WNBA Hustle Functions}
