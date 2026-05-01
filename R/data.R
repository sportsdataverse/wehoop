#' **WNBA Stats API Parameter Descriptions**
#' Reference table for parameters used across `wnba_*()` functions.
#'
#' @format A data frame with 52 rows and 5 variables:
#' \describe{
#'   \item{\code{parameter}}{character. R-side argument name (snake_case).}
#'   \item{\code{api_name}}{character. WNBA Stats API CamelCase parameter name.}
#'   \item{\code{description}}{character. One-sentence description of the parameter.}
#'   \item{\code{valid_values}}{character. Comma-separated enum values; empty string for free-form parameters.}
#'   \item{\code{default}}{character. Default value as it appears in function signatures.}
#' }
"parameter_descriptions"
