# **Get WNBA Stats API League Standings V3**

**Get WNBA Stats API League Standings V3**

**Get WNBA Stats API League Standings V3**

## Usage

``` r
wnba_leaguestandingsv3(
  league_id = "10",
  season = most_recent_wnba_season(),
  season_type = "Regular Season",
  season_year = "",
  ...
)
```

## Arguments

- league_id:

  league_id

- season:

  season

- season_type:

  season_type

- season_year:

  season_year

- ...:

  Additional arguments passed to an underlying function like httr.

## Value

Return a named list of data frames: Standings

**Standings**

|                         |           |
|-------------------------|-----------|
| col_name                | types     |
| LeagueID                | character |
| SeasonID                | character |
| TeamID                  | character |
| TeamCity                | character |
| TeamName                | character |
| TeamSlug                | character |
| Conference              | character |
| ConferenceRecord        | character |
| PlayoffRank             | character |
| ClinchIndicator         | character |
| Division                | character |
| DivisionRecord          | character |
| DivisionRank            | character |
| WINS                    | character |
| LOSSES                  | character |
| WinPCT                  | character |
| LeagueRank              | character |
| Record                  | character |
| HOME                    | character |
| ROAD                    | character |
| L10                     | character |
| Last10Home              | character |
| Last10Road              | character |
| OT                      | character |
| ThreePTSOrLess          | character |
| TenPTSOrMore            | character |
| LongHomeStreak          | character |
| strLongHomeStreak       | character |
| LongRoadStreak          | character |
| strLongRoadStreak       | character |
| LongWinStreak           | character |
| LongLossStreak          | character |
| CurrentHomeStreak       | character |
| strCurrentHomeStreak    | character |
| CurrentRoadStreak       | character |
| strCurrentRoadStreak    | character |
| CurrentStreak           | character |
| strCurrentStreak        | character |
| ConferenceGamesBack     | character |
| DivisionGamesBack       | character |
| ClinchedConferenceTitle | character |
| ClinchedDivisionTitle   | character |
| ClinchedPlayoffBirth    | character |
| ClinchedPlayIn          | character |
| EliminatedConference    | character |
| EliminatedDivision      | character |
| AheadAtHalf             | character |
| BehindAtHalf            | character |
| TiedAtHalf              | character |
| AheadAtThird            | character |
| BehindAtThird           | character |
| TiedAtThird             | character |
| Score100PTS             | character |
| OppScore100PTS          | character |
| OppOver500              | character |
| LeadInFGPCT             | character |
| LeadInReb               | character |
| FewerTurnovers          | character |
| PointsPG                | character |
| OppPointsPG             | character |
| DiffPointsPG            | character |
| vsEast                  | character |
| vsAtlantic              | character |
| vsCentral               | character |
| vsSoutheast             | character |
| vsWest                  | character |
| vsNorthwest             | character |
| vsPacific               | character |
| vsSouthwest             | character |
| Jan                     | character |
| Feb                     | character |
| Mar                     | character |
| Apr                     | character |
| May                     | character |
| Jun                     | character |
| Jul                     | character |
| Aug                     | character |
| Sep                     | character |
| Oct                     | character |
| Nov                     | character |
| Dec                     | character |
| Score_80_Plus           | character |
| Opp_Score_80_Plus       | character |
| Score_Below_80          | character |
| Opp_Score_Below_80      | character |
| TotalPoints             | character |
| OppTotalPoints          | character |
| DiffTotalPoints         | character |

## Details

[League Standings](https://www.wnba.com/standings/#?season=2022)

      wnba_leaguestandingsv3(league_id = '10', season = most_recent_wnba_season() - 1)

## See also

Other WNBA League Functions:
[`wnba_leaguedashlineups()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguedashlineups.md),
[`wnba_leaguedashplayerbiostats()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguedashplayerbiostats.md),
[`wnba_leaguedashplayerclutch()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguedashplayerclutch.md),
[`wnba_leaguedashplayershotlocations()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguedashplayershotlocations.md),
[`wnba_leaguedashplayerstats()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguedashplayerstats.md),
[`wnba_leaguedashteamclutch()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguedashteamclutch.md),
[`wnba_leaguedashteamshotlocations()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguedashteamshotlocations.md),
[`wnba_leaguedashteamstats()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguedashteamstats.md),
[`wnba_leaguegamefinder()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguegamefinder.md),
[`wnba_leaguegamelog()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguegamelog.md),
[`wnba_leaguelineupviz()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguelineupviz.md),
[`wnba_leagueplayerondetails()`](https://wehoop.sportsdataverse.org/reference/wnba_leagueplayerondetails.md),
[`wnba_leagueseasonmatchups()`](https://wehoop.sportsdataverse.org/reference/wnba_leagueseasonmatchups.md),
[`wnba_shotchartleaguewide()`](https://wehoop.sportsdataverse.org/reference/wnba_shotchartleaguewide.md)

## Author

Saiem Gilani
