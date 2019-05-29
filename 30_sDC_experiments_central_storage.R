source("00_environment_setting.R")
source("23_sDC_new_experiments_import.R")


if(!exists("last_import_time")){
  
  last_import_time = 0
  IEWexp = list() 
}

experiment_id = "IEW"






IEWexp = import_new_results(experiment_id, IEWexp, last_import_time)
last_import_time <-  Sys.time()


#check correct import
#IEWexp$kaliBASALT$enerdata56$ssp2$noncoop$clWITCHco2$damBURKEbase$polCBA$get_CUML_DAMAGES_iso3()


#rm(last_import_time)
