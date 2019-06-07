source("00_environment_setting.R")
source("23_sDC_new_experiments_import.R")
library(conflicted)







last_import_time = 0




SHITexp = list()
experiment_id = "SHIT"
SHITexp = import_new_results(experiment_id, SHITexp, last_import_time)




IEWexp = list() 
experiment_id = "IEW"
IEWexp = import_new_results(experiment_id, IEWexp, last_import_time)







last_import_time <-  Sys.time()





#check correct import
#IEWexp$kaliBASALT$enerdata56$ssp2$noncoop$clWITCHco2$damBURKEbase$polCBA$get_CUML_ABATECOST_perc_n(end_year = 2100)
#rm(last_import_time)
