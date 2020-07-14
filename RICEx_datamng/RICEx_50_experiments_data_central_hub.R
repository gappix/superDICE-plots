## RICEx Experiments central hub
# Provides a lot of utilities to retrieve experimets results in whichever format 
# for further analyisis

# Dependencies 
source("RICEx_datamng/RICEx_40_new_experiments_import.R")
source("RICEx_datamng/RICEx_41_specific_experiment_import.R")
source("RICEx_datamng/RICEx_42_last_experiment_import.R")

source("RICEx_datamng/40_new_experiments_import.R")



last_exp_import_time = 0



#' Load all experiments tagged by given id into a tidy list
#' 
#' @param exp_list list-structure to store experiments
#' @param experiment_id current experiment codename
#' @param save_import_time flag if want to keep track of current import-time (default FALSE)
#'
RICEx.load.experiments_as_list = function( exp_list, 
                                           experiment_id, 
                                           save_import_time = FALSE){
  

  exp_list = RICEx.import.new_results_as_list(experiment_id, 
                                              exp_list, 
                                              last_exp_import_time)
  
  if(save_import_time){last_exp_import_time <-  Sys.time()}
  
  return(exp_list)
}


#-------------------------- OLD ---------------------------------------

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



## SPECIFIC EXPERIMENT  ----------------------------------------------------------------------
#///////////////////////////////////////////////////////////////////////////////////////////



central.specific_experiment.load_as_table <- function(gdx_with_path){
  
  return(import_specific_result_as_table(gdx_with_path))
}



central.specific_experiment.load_as_table_nty<- function(gdx_with_path){
  
  return(import_specific_result_as_table_nty(gdx_with_path)) 
}



central.specific_experiment.load_as_table_ty<- function(gdx_with_path){
  
  return(import_specific_result_as_table_ty(gdx_with_path))
}



central.specific_experiment.load_as_table_pars<- function(gdx_with_path){
  
  return(import_specific_result_as_table_pars(gdx_with_path))
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




