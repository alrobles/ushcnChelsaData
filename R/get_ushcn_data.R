#' Get ushcn data stored from tar.gz files for an specific variable 
#'
#' @param variable String, could choose between, tmax, tmin, tavg, prcp. Alias
#' for prcp (pr) and tavg (tas) are avaliable to be consistent with chelsa data.
#' If variable is test, you check if the us hcn server is online.
#' @return A time serires data frame with station, year, and month from 1 to 12 
#' @export
#'
#' @examples
#' get_ushcn_data("tmin")
get_ushcn_data <- function(variable, allow_parallel = TRUE, silent = FALSE){
  
  validate_silent(silent)
  
  if(variable == "test"){
    return(get_ushcn_files(variable))
  }
  
  if(variable == "pr"){
    variable <- "prcp"
  }
  if(variable == "tas"){
    variable <- "tavg"
  }
  
  fileName <- stringr::str_glue("ushcn.{variable}.latest.FLs.52j.tar.gz")
  root <- system.file(package = "ushcnChelsaData") 
  chelsaDir <-  file.path(root, "inst", "extdata", "ushcn")
  filePath <- file.path(chelsaDir, fileName)
  if(!file.exists(filePath)){
    get_ushcn_files(variable)
  }
  
  
  get_iterator <- function(allow_parallel) {
    if (allow_parallel) {
      iter <- furrr::future_map_dfr
    } else {
      iter <- purrr::map_dfr
    }
    iter
  }
  
  iter <- get_iterator(allow_parallel)
  
  fileList <- untar(filePath, list = TRUE)
  
  
  index <- 2:lenght(fileList)
  p <- progressr::progressor(steps = length(index))
  
  
  df <- iter(1, function(x){
    p()
    ushcnChelsaData:::read_ushcn_files(filePath, x)})
  
  df
}
  


