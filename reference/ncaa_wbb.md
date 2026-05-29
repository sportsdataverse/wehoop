# **NCAA Women's Basketball Endpoint Overview**

Wrappers around NCAA-side women's college basketball endpoints beyond
what ESPN exposes (rankings, teams reference, etc.). All requests use
the same
[`.retry_request()`](https://wehoop.sportsdataverse.org/reference/dot-retry_request.md)
HTTP layer as the rest of the package.

## Details

### **NCAA endpoints**

|  |  |
|----|----|
| Function | Purpose |
| [`ncaa_wbb_teams()`](https://wehoop.sportsdataverse.org/reference/ncaa_wbb_teams.md) | NCAA WBB team reference |
| [`ncaa_wbb_NET_rankings()`](https://wehoop.sportsdataverse.org/reference/ncaa_wbb_NET_rankings.md) | NCAA NET rankings |

### **Resilience pattern**

NCAA endpoints occasionally drop columns. The wrappers use
[`dplyr::any_of()`](https://tidyselect.r-lib.org/reference/all_of.html)
/ `dplyr::rename(any_of(c(new = "old")))` so schema drift doesn't crash
the parser — see
[`ncaa_wbb_NET_rankings()`](https://wehoop.sportsdataverse.org/reference/ncaa_wbb_NET_rankings.md)
for the reference implementation.
