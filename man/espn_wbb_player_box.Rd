% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/espn_wbb_data.R
\name{espn_wbb_player_box}
\alias{espn_wbb_player_box}
\title{Get ESPN women's college basketball player box}
\usage{
espn_wbb_player_box(game_id)
}
\arguments{
\item{game_id}{Game ID}
}
\value{
Returns a player boxscore data frame

\strong{Player}\tabular{ll}{
   col_name \tab types \cr
   game_id \tab integer \cr
   season \tab integer \cr
   season_type \tab integer \cr
   game_date \tab Date \cr
   game_date_time \tab POSIXct \cr
   athlete_id \tab integer \cr
   athlete_display_name \tab character \cr
   team_id \tab integer \cr
   team_name \tab character \cr
   team_location \tab character \cr
   team_short_display_name \tab character \cr
   minutes \tab numeric \cr
   field_goals_made \tab integer \cr
   field_goals_attempted \tab integer \cr
   three_point_field_goals_made \tab integer \cr
   three_point_field_goals_attempted \tab integer \cr
   free_throws_made \tab integer \cr
   free_throws_attempted \tab integer \cr
   offensive_rebounds \tab integer \cr
   defensive_rebounds \tab integer \cr
   rebounds \tab integer \cr
   assists \tab integer \cr
   steals \tab integer \cr
   blocks \tab integer \cr
   turnovers \tab integer \cr
   fouls \tab integer \cr
   points \tab integer \cr
   starter \tab logical \cr
   ejected \tab logical \cr
   did_not_play \tab logical \cr
   active \tab logical \cr
   athlete_jersey \tab character \cr
   athlete_short_name \tab character \cr
   athlete_headshot_href \tab character \cr
   athlete_position_name \tab character \cr
   athlete_position_abbreviation \tab character \cr
   team_display_name \tab character \cr
   team_uid \tab character \cr
   team_slug \tab character \cr
   team_logo \tab character \cr
   team_abbreviation \tab character \cr
   team_color \tab character \cr
   team_alternate_color \tab character \cr
   home_away \tab character \cr
   team_winner \tab logical \cr
   team_score \tab integer \cr
   opponent_team_id \tab integer \cr
   opponent_team_name \tab character \cr
   opponent_team_location \tab character \cr
   opponent_team_display_name \tab character \cr
   opponent_team_abbreviation \tab character \cr
   opponent_team_logo \tab character \cr
   opponent_team_color \tab character \cr
   opponent_team_alternate_color \tab character \cr
   opponent_team_score \tab integer \cr
}
}
\description{
Get ESPN women's college basketball player box
}
\examples{
\donttest{
  try(espn_wbb_player_box(game_id = 401276115))
}
}
\seealso{
Other ESPN WBB Functions: 
\code{\link{espn_wbb_conferences}()},
\code{\link{espn_wbb_game_all}()},
\code{\link{espn_wbb_game_rosters}()},
\code{\link{espn_wbb_pbp}()},
\code{\link{espn_wbb_player_stats}()},
\code{\link{espn_wbb_rankings}()},
\code{\link{espn_wbb_scoreboard}()},
\code{\link{espn_wbb_standings}()},
\code{\link{espn_wbb_team_box}()},
\code{\link{espn_wbb_team_stats}()},
\code{\link{espn_wbb_teams}()}
}
\author{
Saiem Gilani
}
\concept{ESPN WBB Functions}
\keyword{Box}
\keyword{Player}
\keyword{WBB}
