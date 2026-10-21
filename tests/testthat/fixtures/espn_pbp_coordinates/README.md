# Processed-payload coordinate fixtures

sportsdataverse-py's processed `json/final` payloads for `tests/testthat/test-espn_pbp_coordinates.R`.
Each is the payload the wehoop-wnba-raw / wehoop-wbb-raw raw repos write and the data repos' R creation scripts read: the real
ESPN summary in `../score_repair/<game>.json.gz` run through `espn_<lg>_pbp(raw = True)` (download served from
that file) -> `<lg>_pbp_disk()` -> `helper_<lg>_pbp()`, exactly as `<lg>-raw/python/espn_<lg>_02_pbp_scrape.py`
does, then gzipped. Written from sportsdataverse-py @ a268196c9064ca47863edf2e67a47d990a308e71
(`devel-basketball`, which carries sportsdataverse-py#844: plays ship `coordinate.x` / `coordinate.y` already
transformed, with ESPN's pair in `coordinate.x.raw` / `coordinate.y.raw`). Never hand-edit; regenerate with the
same pipeline from a sportsdataverse-py checkout.

| File | Source summary |
|---|---|
| `wnba_240618004_final.json.gz` | `../score_repair/wnba_240618004.json.gz` |
| `summary_wbb_final.json.gz` | `../score_repair/summary_wbb.json.gz` (WBB types every free throw "MadeFreeThrow") |
