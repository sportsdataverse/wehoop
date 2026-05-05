# **WNBA Stats API Parameter Descriptions** Reference table for parameters used across `wnba_*()` functions.

**WNBA Stats API Parameter Descriptions** Reference table for parameters
used across `wnba_*()` functions.

## Usage

``` r
parameter_descriptions
```

## Format

A data frame with 52 rows and 5 variables:

- `parameter`:

  character. R-side argument name (snake_case).

- `api_name`:

  character. WNBA Stats API CamelCase parameter name.

- `description`:

  character. One-sentence description of the parameter.

- `valid_values`:

  character. Comma-separated enum values; empty string for free-form
  parameters.

- `default`:

  character. Default value as it appears in function signatures.
