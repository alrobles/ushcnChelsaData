#' Get Chelsa time series files
#'
#' @param variable A string with the possible variable. Could be pr, tas, tasmax or tasmin
#' @param model A string with the CMIP5 model ACCESS1-3, CESM1-BGC, CMCC-CM or MIROC5
#' @param scenario A string with CMIP5 scenario, historical, rcp45 or rcp85
#' @param yearStart The initial year in the CHELSA raster file
#' @param yearEnd The final year in the CHELSA raster file
#'
#' @return Download Chelsa required files
#' @export
#' @examples
#' get_chelsa_files("test")
get_chelsa_files <- function(variable, model, scenario, yearStart, yearEnd){
  
  testURL <- "https://os.zhdk.cloud.switch.ch/chelsav1/chelsa_cmip5_ts"
  
  if(variable == "test"){
    if (!url_exists(testURL)) {
      return("Can't access to CHELSA data.")
    } else {
      return("CHELSA data is online")
    }
  }
  
  url <- chelsa_ts_url(variable, model, scenario, yearStart, yearEnd)
  filename <- chelsa_filename(variable, model, scenario, yearStart, yearEnd)
  
  root <- system.file(package = "ushcnChelsaData") 
  chelsaDir <-  file.path(root, "inst", "extdata", "chelsa")
  if(!dir.exists(chelsaDir)){
    dir.create(chelsaDir, recursive = TRUE)
  } 
  
  filePath <- file.path(chelsaDir, filename)
  
  if(!file.exists(filePath)){
    # check if the url exists
    if (!url_exists(url)) {
      return("Can't access environmental data.")
    }
    
    req <- httr2::request(url) |>
      httr2::req_progress()
    req |> httr2::req_perform(path = filePath)
  }
}
