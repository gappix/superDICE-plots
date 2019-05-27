source("00_environment_setting.R")
source("23_sDC_new_experiments_import.R")



last_import_time = 0
experiment_id = "IEW"
IEWexp = list()





IEWexp = import_new_results(experiment_id, IEWexp, last_import_time)
last_import_time <-  Sys.time()



IEWexp$kaliBASALT$enerdata56$ssp2$noncoop$clWITCHco2$damBURKEbase$polCBA$get_CUML_DAMAGES_iso3()
