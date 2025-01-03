#' Check filename from chelsa time series data
#' @param variable A string with the possible variable. Could be pr, tas, tasmax or tasmin
#' @param model A string with the CMIP5 model ACCESS1-3, CESM1-BGC, CMCC-CM or MIROC5
#' @param scenario A string with CMIP5 scenario, historical, rcp45 or rcp85
#' @param yearStart The initial year in the CHELSA raster file
#' @param yearEnd The final year in the CHELSA raster file
#' @return A string value with the CHELSA time series name file
#' @keywords internal
chelsa_filename <- function(variable, model, scenario, yearStart, yearEnd){
  stringr::str_glue("CHELSAcmip5ts_{variable}_{mod0el}_{scenario}_{yearStart}-{yearEnd}_V1.1.nc")
}