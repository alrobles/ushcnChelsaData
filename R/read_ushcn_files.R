#' Read a station text file from ushcn downloaded tar.gz file.
#' The US HSN data is stored in a .tar.gz file with all the stations.
#' This function read each file stored in the .tar.gz once
#' by time. The first file of the .tar.gz correspond
#' to the directory containing all the data,
#' 
#' @param file the tar.gz ushcn file downloaded
#' @param stationIndex Index of the texfile to be reader as data.frame
#' @return A tibble with the ushcn data
#' @keywords internal
read_ushcn_files <- function(file, stationIndex){
  # if(stationIndex == 1){
  #   return(NULL)
  # }
  #fixed width columns
  fileWidths <- c(16, rep(9, 12))
  archive::archive_read(file, file = stationIndex) |>
    readr::read_lines() |>
    base::I() |> #read file "AsIs" to pass to the parser 
    readr::read_fwf( readr::fwf_widths(fileWidths),
                      show_col_types = FALSE,
                      col_types = c("ccccccccccccc") )
}