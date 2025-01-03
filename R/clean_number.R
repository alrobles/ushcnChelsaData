#' Clean nunber. This function remove NA data and flagged
#' data from us hcn files. Remove all the flags in the
#' raw data and preserve only numeric data
#'
#' @param x A string with the ushcn value to be cleaned
#'
#' @return A double value with the us hcn data cleaned
#' @keywords internal
clean_number <- function(x) {
  x <- stringr::str_remove_all(x, "\\s\\d") |>
    stringr::str_remove_all("\\s\\W") |>
    stringr::str_remove_all("[A-Z]\\d") |>
    stringr::str_remove_all("[a-zA-Z]") |>
    as.numeric()
  ifelse(x == -9999, NA, x)
}