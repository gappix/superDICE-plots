## GENERAL ENVIRONMENT SETTING


source("000_package_retriever.R")

pkgs <- c('broom',
          'classInt',
          'data.table',
          'dplyr',
          'dtplyr',
          'ggplot2',
          'grid',
          'plotly',
          'purrr',
          'RColorBrewer',
          'rworldmap',
          'stringr',
          'tidyr',
          'xlsx')

res <- lapply(pkgs,require_package) 

require_gdxtools()
igdx(dirname(Sys.which('gams'))) 

# Use library here
if(!require(here)) {
  install.packages("here", repos="https://cloud.r-project.org")
  if(!require(here)) stop("Package here not found")
}
