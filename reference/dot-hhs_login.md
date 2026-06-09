# Internal: log into Her Hoop Stats and return the session cookie jar

GETs the Django login page (to obtain the `csrftoken` cookie and the
hidden `csrfmiddlewaretoken`), then POSTs the credentials. Returns the
cookie-jar path for reuse by authenticated requests.

## Usage

``` r
.hhs_login(email = NULL, password = NULL)
```

## Arguments

- email, password:

  Subscriber credentials (resolved from args / options / env vars when
  `NULL`).

## Value

The path to the session cookie jar (a tempfile).
