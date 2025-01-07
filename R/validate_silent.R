#' Validate to use progress bars.
#' @param silent logical
#' @return NULL 
#' @keywords internal
validate_silent <- function(silent) {
  # Validate the silent argument
  assertthat::assert_that(assertthat::is.flag(silent))
  
  if (!silent) {
    if (!progressr::handlers(global = NA)) {
      # If no progressr bar settings are configured, then set cli as the default.
      
      if (interactive()) {
        progressr::handlers(global = TRUE)
        progressr::handlers('cli')
        message(
          'Info: No global progress bars were found; the cli handler has been enabled. ',
          'This activation only lasts for one R session; '
        )
      }
    }
  }
}