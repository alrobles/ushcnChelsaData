#' Get US HCN files
#'
#' @param variable A string with the climatic variable avaliable in US hcn monthly
#'  database. Possible options are prcp, tavg, tmin, tmax, and test.
#'  If test is provided checks if US HCN server is online
#'
#' @return Download us hcn required files
#' @export
#' @examples
#' get_ushcn_files("test")
get_ushcn_files <- function(variable){
  
  baseURL <- "https://www.ncei.noaa.gov/pub/data/ushcn/v2.5/"
  
  if(variable == "test"){
    if (!url_exists(baseURL)) {
      return("Can't access to USHCN data.")
    } else {
      return("USHCN data is online")
    }
  }
  
  if(variable == "pr"){
    variable <- "prcp"
  }
  if(variable == "tas"){
    variable <- "tavg"
  }
  
  filename <- stringr::str_glue("ushcn.{variable}.latest.FLs.52j.tar.gz")
  
  url <- stringr::str_glue("{baseURL}{filename}")
  root <- system.file(package = "ushcnChelsaData") 
  ushcnDir <-  file.path(root, "inst", "extdata", "ushcn")
  if(!dir.exists(ushcnDir)){
    dir.create(ushcnDir, recursive = TRUE)
  } 
  
  filePath <- file.path(ushcnDir, filename)
  
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

