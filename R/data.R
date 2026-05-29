#' **WNBA Stats API Parameter Descriptions**
#' Reference table for parameters used across `wnba_*()` functions.
#'
#' @format A data frame with 52 rows and 5 variables:
#'
#' | col_name | description |
#' |---|---|
#' | \code{parameter} | character. R-side argument name (snake_case). |
#' | \code{api_name} | character. WNBA Stats API CamelCase parameter name. |
#' | \code{description} | character. One-sentence description of the parameter. |
#' | \code{valid_values} | character. Comma-separated enum values; empty string for free-form parameters. |
#' | \code{default} | character. Default value as it appears in function signatures. |
#'
"parameter_descriptions"
