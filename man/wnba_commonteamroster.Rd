% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/wnba_stats_roster.R
\name{wnba_commonteamroster}
\alias{wnba_commonteamroster}
\title{\strong{Get WNBA Stats API Team Roster}}
\usage{
wnba_commonteamroster(
  league_id = "10",
  season = most_recent_wnba_season() - 1,
  team_id = "1611661317",
  ...
)
}
\arguments{
\item{league_id}{league_id}

\item{season}{season}

\item{team_id}{team_id}

\item{...}{Additional arguments passed to an underlying function like httr.}
}
\value{
Return a named list of data frames: Coaches, CommonTeamRoster

\strong{CommonTeamRoster}\tabular{ll}{
   col_name \tab types \cr
   TeamID \tab character \cr
   SEASON \tab character \cr
   LeagueID \tab character \cr
   PLAYER \tab character \cr
   NICKNAME \tab character \cr
   PLAYER_SLUG \tab character \cr
   NUM \tab character \cr
   POSITION \tab character \cr
   HEIGHT \tab character \cr
   WEIGHT \tab character \cr
   BIRTH_DATE \tab character \cr
   AGE \tab character \cr
   EXP \tab character \cr
   SCHOOL \tab character \cr
   PLAYER_ID \tab character \cr
   HOW_ACQUIRED \tab character \cr
}


\strong{Coaches}\tabular{ll}{
   col_name \tab types \cr
   TEAM_ID \tab character \cr
   SEASON \tab character \cr
   COACH_ID \tab character \cr
   FIRST_NAME \tab character \cr
   LAST_NAME \tab character \cr
   COACH_NAME \tab character \cr
   IS_ASSISTANT \tab character \cr
   COACH_TYPE \tab character \cr
   SORT_SEQUENCE \tab character \cr
   SUB_SORT_SEQUENCE \tab character \cr
}
}
\description{
\strong{Get WNBA Stats API Team Roster}

\strong{Get WNBA Stats API Team Roster}
}
\details{
\if{html}{\out{<div class="sourceCode r">}}\preformatted{  wnba_commonteamroster(season = most_recent_wnba_season() - 1, team_id = '1611661317')
}\if{html}{\out{</div>}}
}
\seealso{
Other WNBA Roster Functions: 
\code{\link{wnba_commonallplayers}()},
\code{\link{wnba_commonplayerinfo}()}
}
\author{
Saiem Gilani
}
\concept{WNBA Roster Functions}
