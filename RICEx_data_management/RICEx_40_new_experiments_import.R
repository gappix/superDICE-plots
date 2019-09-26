# IMPORT NEW RESULTS

# Dependencies 
source("RICEx_data_management/RICEx_30_gdx_experiment_parser.R") 
source("RICEx_data_management/RICEx_31_new_results_detector.R") 
source("RICEx_data_management/RICEx_32_results_structure_builder.R")






## IMPORT AS LIST  -----------------------------------------------------------------------
#//////////////////////////////////////////////////////////////////////////////////////////

import_new_results_as_list <- function(experiment_id,    #current experiment codename
                                       my_experiments,   #list-structure for experiments
                                       last_import_time  #sys time of last import (to detect new files)
                                       ){
  
  
  # Step1: find new results
  gdx_with_path_list  =  find_new_results(experiment_id, last_import_time)
  
  if (length(gdx_with_path_list) > 0){ 
  
    
    cat(orange$bold("Importing << ", length(gdx_with_path_list) ," >> new gdxfile experiments \n"))
    i = 1
    
    # Step2: extract and organize each new data-experiment
    for(gdx_path_element in gdx_with_path_list){ 
      
      
      cat(green(i, " Parsing: ", gdx_path_element ," \n"))
      
      
      # 2a: parse gdx data and experiment info automatically
      exp_data_and_info =  parse_experiment(gdx_path_element)
      
      # 2b: tide infos and data in nested list structure
      my_experiments    =  tide_new_experiment_as_list(exp_data_and_info, my_experiments)
      
      
      
      i= i+1
      
    }
  }
  
  
  cat(orange$bold("Done! << ", length(gdx_with_path_list) ," >> gdxfiles correctly imported in a list\n"))
  
  return(my_experiments)
  
}






## IMPORT AS TABLE  -----------------------------------------------------------------------
#//////////////////////////////////////////////////////////////////////////////////////////

import_new_results_as_table <- function( experiment_id,     # current experiment codename
                                         last_import_time   # sys time of last import (to detect new files)
){
  
  
  # Step1: find new results
  gdx_with_path_list  =  find_new_results(experiment_id, last_import_time)
  
  if (length(gdx_with_path_list) > 0){ 
    
    
    cat(orange$bold("Importing << ", length(gdx_with_path_list) ," >> new gdxfile experiments \n"))
    
    
    i = 1
    
    # Step2: extract and organize each new data-experiment
    for(gdx_path_element in gdx_with_path_list){ 
      
      #TEST# 
      #gdx_path_element = gdx_with_path_list[1]
      
      cat(green(i, " Parsing: ", gdx_path_element ," \n"))
      
      
      # 2a: parse gdx data and experiment info automatically
      exp_data_and_info =  parse_experiment(gdx_path_element)
      
      # 2b: tide infos and data in a well-built table
      experiments_newtable    =  tide_new_experiment_as_table(exp_data_and_info, experiment_id)
      
      # 2c: append tables
      if(i==1) { experiments_table = experiments_newtable }
      else{ experiments_table = rbind(experiments_table, experiments_newtable )}
      
      i= i+1
      
    }
  }
  
  
  cat(orange$bold("Done! << ", length(gdx_with_path_list) ," >> gdxfiles correctly imported \n"))
  
  return(experiments_table)
  
}





# IMPORT AS TABLE < nty >    ------------------------------------------------------------
#////////////////////////////////////////////////////////////////////////////////////////



import_new_results_as_table_nty <- function( experiment_id,     # current experiment codename
                                             last_import_time   # sys time of last import (to detect new files)
){
  
  
  # Step1: find new results
  gdx_with_path_list  =  find_new_results(experiment_id, last_import_time)
  
  if (length(gdx_with_path_list) > 0){ 
    
    
    cat(orange$bold("Importing << ", length(gdx_with_path_list) ," >> new gdxfile experiments \n"))
    
    
    i = 1
    
    # Step2: extract and organize each new data-experiment
    for(gdx_path_element in gdx_with_path_list){ 
      
      #TEST# 
      #gdx_path_element = gdx_with_path_list[1]
      
      cat(green(i, " Parsing: ", gdx_path_element ," \n"))
      
      
      # 2a: parse gdx data and experiment info automatically
      exp_data_and_info =  parse_experiment(gdx_path_element)
      
      # 2b: tide infos and data in a well-built table
      experiments_newtable    =  tide_new_experiment_as_table_nty(exp_data_and_info, experiment_id)
      
      # 2c: append tables
      if(i==1) { experiments_table = experiments_newtable }
      else{ experiments_table = rbind(experiments_table, experiments_newtable )}
      
      i= i+1
      
    }
  }
  
  
  cat(orange$bold("Done! << ", length(gdx_with_path_list) ," >> gdxfiles correctly imported in a  << nty >>  table \n"))
  
  return(experiments_table)
  
}






# IMPORT AS TABLE < ty >  ----------------------------------------------------------------------
#///////////////////////////////////////////////////////////////////////////////////////////////



import_new_results_as_table_ty <- function( experiment_id,     # current experiment codename
                                         last_import_time   # sys time of last import (to detect new files)
){
  
  
  # Step1: find new results
  gdx_with_path_list  =  find_new_results(experiment_id, last_import_time)
  
  if (length(gdx_with_path_list) > 0){ 
    
    
    cat(orange$bold("Importing << ", length(gdx_with_path_list) ," >> new gdxfile experiments \n"))
    
    
    i = 1
    
    # Step2: extract and organize each new data-experiment
    for(gdx_path_element in gdx_with_path_list){ 
      
      #TEST# 
      #gdx_path_element = gdx_with_path_list[1]
      
      cat(green(i, " Parsing: ", gdx_path_element ," \n"))
      
      
      # 2a: parse gdx data and experiment info automatically
      exp_data_and_info =  parse_experiment(gdx_path_element)
      
      # 2b: tide infos and data in a well-built table
      experiments_newtable    =  tide_new_experiment_as_table_ty(exp_data_and_info, experiment_id)
      
      # 2c: append tables
      if(i==1) { experiments_table = experiments_newtable }
      else{ experiments_table = rbind(experiments_table, experiments_newtable )}
      
      i= i+1
      
    }
  }
  
  
  cat(orange$bold("Done! << ", length(gdx_with_path_list) ," >> gdxfiles correctly imported in a  << ty >>  table \n"))
  
  return(experiments_table)
  
}


