% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/chelsa_ts_url.R
\name{chelsa_ts_url}
\alias{chelsa_ts_url}
\title{Get and check url from CHELSA time series data}
\usage{
chelsa_ts_url(variable, model, scenario, yearStart, yearEnd)
}
\arguments{
\item{variable}{A string with the possible variable. Could be pr, tas, tasmax or tasmin}

\item{model}{A string with the CMIP5 model ACCESS1-3, CESM1-BGC, CMCC-CM or MIROC5}

\item{scenario}{A string with CMIP5 scenario, historical, rcp45 or rcp85}

\item{yearStart}{The initial year in the CHELSA raster file}

\item{yearEnd}{The final year in the CHELSA raster file}
}
\value{
A string value with the CHELSA time series name file
}
\description{
Get and check url from CHELSA time series data
}
\keyword{internal}
