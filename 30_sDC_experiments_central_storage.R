source("00_environment_setting.R")
source("23_sDC_new_experiments_import.R")
source("24_sDC_latest_experiment_import.R")





last_exp_import_time = 0



## LIST LOADER

experiments_load_as_list = function(exp_list, experiment_id, save_import_time = FALSE){
  
  exp_list = import_new_results_as_list(experiment_id, exp_list, last_exp_import_time)
  if(save_import_time){last_exp_import_time <-  Sys.time()}
  
  return(exp_list)
  
}





## TABLE LOADER

experiments_load_as_table = function(experiment_id, save_import_time = FALSE){
  
  exp_table = import_new_results_as_table(experiment_id, last_exp_import_time)
  if(save_import_time){last_exp_import_time <-  Sys.time()}
  
  return(exp_table)
  
}




# nty detail

experiments_load_as_table_nty = function(experiment_id, save_import_time = FALSE){
  
  exp_table = import_new_results_as_table_nty(experiment_id, last_exp_import_time)
  if(save_import_time){last_exp_import_time <-  Sys.time()}
  
  return(exp_table)
  
}





# ty detail

experiments_load_as_table_ty = function(experiment_id, save_import_time = FALSE){
  
  exp_table = import_new_results_as_table_ty(experiment_id, last_exp_import_time)
  if(save_import_time){last_exp_import_time <-  Sys.time()}
  
  return(exp_table)
  
}




## LATEST EXPERIMENT  ----------------------------------------------------------------------
#///////////////////////////////////////////////////////////////////////////////////////////




latest_experiment_load_as_table <- function(){
  
  return(import_latest_result_as_table())
}



latest_experiment_load_as_table_nty<- function(){
 
  return(import_latest_result_as_table_nty()) 
}



latest_experiment_load_as_table_ty<- function(){
  
  return(import_latest_result_as_table_ty())
}



latest_experiment_load_as_table_pars<- function(){
  
  return(import_latest_result_as_table_pars())
}




