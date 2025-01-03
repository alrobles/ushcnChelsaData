library(usethis)
CHELSAcmip5ts <- readr::read_csv("data-raw/CHELSAcmip5ts.csv")



files <- purrr::pmap_chr(CHELSAcmip5ts, ushcnChelsaData:::chelsa_filename)
root <- "https://os.zhdk.cloud.switch.ch/chelsav1/chelsa_cmip5_ts/"
urls <- paste0(root, files)
urlCheck <- purrr::map_lgl(urls, ushcnChelsaData:::url_exists)
CHELSAcmip5ts$file <- files
CHELSAcmip5ts$url <- urls
CHELSAcmip5ts$online <- urlCheck 
usethis::use_data(CHELSAcmip5ts, overwrite = TRUE)
