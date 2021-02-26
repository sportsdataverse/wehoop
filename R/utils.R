#' Utilities and Helpers for package
#' @keywords Internal
#' @importFrom attempt stop_if_not
#' @importFrom curl has_internet
check_internet <- function(){
  attempt::stop_if_not(.x = curl::has_internet(), msg = "Please check your internet connexion")
}

#' Check Status function
#' @param res Response from API
#' @keywords Internal
#' @importFrom attempt stop_if_not
#' @importFrom httr status_code
check_status <- function(res){
  attempt::stop_if_not(.x = httr::status_code(res),
                       .p = ~ .x == 200,
                       msg = "The API returned an error")
}

