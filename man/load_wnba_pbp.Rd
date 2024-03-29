% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/load_wnba.R
\name{load_wnba_pbp}
\alias{load_wnba_pbp}
\title{\strong{Load wehoop WNBA play-by-play}}
\usage{
load_wnba_pbp(
  seasons = most_recent_wnba_season(),
  ...,
  dbConnection = NULL,
  tablename = NULL
)
}
\arguments{
\item{seasons}{A vector of 4-digit years associated with given WNBA seasons. (Min: 2002)}

\item{...}{Additional arguments passed to an underlying function that writes
the season data into a database (used by \code{update_wnba_db()}).}

\item{dbConnection}{A \code{DBIConnection} object, as returned by \code{\link[DBI:dbConnect]{DBI::dbConnect()}}}

\item{tablename}{The name of the play by play data table within the database}
}
\value{
A dataframe with 42 columns
\describe{
\item{shooting_play}{Logical value (TRUE/FALSE) indicating whether the play was a shooting play}
\item{sequence_number}{Sequence number is supposed to represent a shot-possession, examine the last two numbers to see if there are multiple events that occur within the same shot-possession. A shot-possession is basically any sequence of plays until there is a shot, change in possession, and probably things like technical fouls and the like. So as soon as a shot goes up, a new sequence starts regardless, even if the shooting team retains possession via offensive or deadball rebound. The first portion of the number is usually time related (i.e. the numeric representation of when the sequence started, from a seconds remaining in the period perspective or so)}
\item{period_display_value}{Long form of period (1st quarter, 2nd Quarter, OT, etc.)}
\item{period_number}{The numeric period of play in the game }
\item{home_score}{Home score at the time of the play}
\item{coordinate_x}{The entire scale is a rectangle of size 25x47, intended as a half-court representation of the basketball court (i.e. on the side of the offense), with each coordinate unit representing a foot. It appears that the basket is roughly represented as the (25, 0) point. This is a nonsensical definition when considering that the basket overhangs the court, with the backboard aligned 48 inches from the baseline, then the center of the hoop being roughly 11 inches from there. This is an idiosyncracy of either sensor placement or software and data entry. Use your best judgement in making your charts, I think you will find that making some translations will be helpful. }
\item{coordinate_y}{}
\item{scoring_play}{Logical value (TRUE/FALSE) indicating whether the play was a play on which the offense scored}
\item{clock_display_value}{Time left within the period}
\item{team_id}{Unique team identification number for the offensive team}
\item{type_id}{Unique play type identifcation number}
\item{type_text}{Play type text description}
\item{away_score}{Away score at the time of the play}
\item{id}{Unique play identifcation number}
\item{text}{Text description of the play}
\item{score_value}{The points value of the shot taken}
\item{participants_0_athlete_id}{Unique player identification number }
\item{participants_1_athlete_id}{Unique player identification number }
\item{participants_2_athlete_id}{Unique player identification number }
\item{type_abbreviation}{Play type abbreviation}
\item{season}{Season of the game}
\item{season_type}{Season type of the game, 1 is pre-season, 2 is regular season, 3 is post-season, 4 is off-season}
\item{away_team_id}{Unique away team identification number}
\item{away_team_name}{Away team name}
\item{away_team_mascot}{Away team mascot}
\item{away_team_abbrev}{Text abbreviation for the away team}
\item{away_team_name_alt}{Alternate versions of the away team abbreviation}
\item{home_team_id}{Unique home team identification number}
\item{home_team_name}{home team name}
\item{home_team_mascot}{home team mascot}
\item{home_team_abbrev}{Text abbreviation for the home team}
\item{home_team_name_alt}{Alternate versions of the home team abbreviation}
\item{home_team_spread}{The game spread with respect to the home team}
\item{game_spread}{Game spread in (-X Team) format. There are almost none, I would recommend not trusting any of these three columns}
\item{home_favorite}{Logical (TRUE/FALSE) indicating whether the home team is favored}
\item{clock_minutes}{Clock minutes split from seconds for developer convenience}
\item{clock_seconds}{Clock seconds split from minutes for developer convenience}
\item{half}{Half of the game}
\item{lag_half}{A lag column on the half}
\item{lead_half}{A lead column on the half}
\item{game_play_number}{Game play number}
\item{game_id}{Unique identifier for the game event}
}
}
\description{
helper that loads multiple seasons from the data repo either into memory
or writes it into a db using some forwarded arguments in the dots
}
\examples{
\donttest{
  try(load_wnba_pbp())
}
}
