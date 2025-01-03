#' Chelsa CMIP5 time series 
#' A data frame with the avaliable CHELSA CMIP5 time series. This
#' data has a monthly frequence for acummulated precipitation, 
#' average surface temperture, maximum surface temperature and
#' minimum temperature
#'
#' @format ## `CHELSAcmip5ts`
#' A data frame with 288 rows and 5 columns:
#' \describe{
#'   \item{variable}{The climatica variable. Could be tas (average temperatu(re of the
#'    surface), tasmax (maximum temperature of the surface),
#'    tasmin (minimum temperature of the surface) or pr (monthly accumulated precipitation)}
#'   \item{model}{2 & 3 letter ISO country codes}
#'   \item{scenario}{Year}
#'   \item{yearStart}{Year}
#'   \item{yearEnd}{Year}
#'   \item{file}{File name}
#'   \item{url}{url for the CHELSA file}
#'   ...
#' }
#' @source <https://chelsa-climate.org/>
"CHELSAcmip5ts"