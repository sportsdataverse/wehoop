# Get Women's college basketball NET rankings for the current date from the NCAA website

Get Women's college basketball NET rankings for the current date from
the NCAA website

## Usage

``` r
ncaa_wbb_NET_rankings()
```

## Value

Returns a tibble

|            |           |
|------------|-----------|
| col_name   | types     |
| rank       | integer   |
| previous   | integer   |
| school     | character |
| conference | character |
| record     | character |
| road       | character |
| neutral    | character |
| home       | character |
| non_div_i  | character |

## Author

Saiem Gilani

## Examples

``` r
# Get current NCAA NET rankings
# \donttest{
  try(ncaa_wbb_NET_rankings())
#> ── NCAA WBB NET Rankings Information from NCAA.com ───────────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-04-14 04:27:58 UTC
#> # A tibble: 363 × 13
#>     rank school  record conference road  neutral home  non_div_i previous quad_1
#>    <int> <chr>   <chr>  <chr>      <chr> <chr>   <chr> <chr>        <int> <chr> 
#>  1     1 UConn   38-1   Big East   12-0  9-1     17-0  0-0              1 11-1  
#>  2     2 UCLA    37-1   Big Ten    9-0   12-1    16-0  0-0              2 22-1  
#>  3     3 South … 36-4   SEC        11-1  7-3     18-0  0-0              3 17-4  
#>  4     4 Texas   35-4   SEC        7-3   8-1     20-0  0-0              4 16-4  
#>  5     5 LSU     29-6   SEC        10-2  4-2     15-2  0-0              5 9-6   
#>  6     6 Michig… 28-7   Big Ten    8-2   4-4     16-1  0-0              6 10-7  
#>  7     7 Vander… 29-5   SEC        7-2   4-3     18-0  0-0              7 9-5   
#>  8     8 Duke    27-9   ACC        9-3   4-5     14-1  0-0              8 8-8   
#>  9     9 Minnes… 24-9   Big Ten    8-3   1-3     15-3  0-0              9 6-8   
#> 10    10 TCU     32-6   Big 12     7-3   5-3     20-0  0-0             12 5-4   
#> # ℹ 353 more rows
#> # ℹ 3 more variables: quad_2 <chr>, quad_3 <chr>, quad_4 <chr>
# }
```
