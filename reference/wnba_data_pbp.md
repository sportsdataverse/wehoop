# **Get WNBA Data API Play-by-Play**

**Get WNBA Data API Play-by-Play**

**Get WNBA Data API Play-by-Play**

## Usage

``` r
wnba_data_pbp(game_id = "1022200034", ...)
```

## Arguments

- game_id:

  Game ID - 10 digits, i.e. "0021900001"

- ...:

  Additional arguments passed to an underlying function like httr.

## Value

Returns a tibble

|                   |           |
|-------------------|-----------|
| col_name          | types     |
| game_id           | character |
| league            | character |
| period            | integer   |
| event_num         | integer   |
| clock             | character |
| description       | character |
| locX              | integer   |
| locY              | integer   |
| opt1              | integer   |
| opt2              | integer   |
| event_action_type | integer   |
| event_type        | integer   |
| team_id           | integer   |
| offense_team_id   | integer   |
| player1_id        | integer   |
| player2_id        | integer   |
| player3_id        | integer   |
| home_score        | integer   |
| away_score        | integer   |
| order             | integer   |

Event Message Types (event_type):

1 -\> MAKE

2 -\> MISS

3 -\> FreeThrow

4 -\> Rebound

5 -\> Turnover

6 -\> Foul

7 -\> Violation

8 -\> Substitution

9 -\> Timeout

10 -\> JumpBall

11 -\> Ejection

12 -\> StartOfPeriod

13 -\> EndOfPeriod

14 -\> Empty

## Details

      wnba_data_pbp(game_id = "1022200034")

## See also

Other WNBA PBP Functions:
[`wnba_live_pbp()`](https://wehoop.sportsdataverse.org/reference/wnba_live_pbp.md),
[`wnba_pbp()`](https://wehoop.sportsdataverse.org/reference/wnba_pbp.md),
[`wnba_pbps()`](https://wehoop.sportsdataverse.org/reference/wnba_pbps.md),
[`wnba_playbyplayv3()`](https://wehoop.sportsdataverse.org/reference/wnba_playbyplayv3.md)

## Author

Saiem Gilani
