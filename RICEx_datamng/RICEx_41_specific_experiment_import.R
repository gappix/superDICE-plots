# IMPORT LATEST RESULT


# Dependencies 
source("RICEx_utils/RICEx_01_output_crayon_colouring.R")
source("RICEx_datamng/RICEx_30_gdx_experiment_parser.R") 
source("RICEx_datamng/RICEx_31_new_results_detector.R") 
source("RICEx_datamng/RICEx_32_results_structure_builder.R")






## IMPORT AS LIST  -----------------------------------------------------------------------
#//////////////////////////////////////////////////////////////////////////////////////////


import_specific_result_as_list <- function(gdx_with_path){

  
  my_experiment = list()
  

  
  if (length(gdx_with_path) > 0){ 
    
    cat(green("Parsing: ", gdx_with_path ," \n"))
    
    # 1: parse gdx data and experiment info automatically
    exp_data_and_info =  parse_experiment(gdx_path_element)
    
    # 2: tide infos and data in nested list structure
    my_experiment    =  tide_new_experiment_as_list(exp_data_and_info, my_experiment)
    
  }
  
  
  cat(orange$bold("Done! << 1 >> gdxfile correctly imported in a list\n"))
  
  return(my_experiment)
  
}






## IMPORT AS TABLE  -----------------------------------------------------------------------
#//////////////////////////////////////////////////////////////////////////////////////////

import_specific_result_as_table  <- function(gdx_with_path){

  if (length(gdx_with_path) > 0){ 
    
    cat(green("Parsing: ", gdx_with_path ," \n"))
    
    # 1: parse gdx data and experiment info automatically
    exp_data_and_info =  parse_experiment(gdx_with_path)
    
    # 2: tide infos and data in a well-built table
    experiments_newtable    =  tide_new_experiment_as_table(exp_data_and_info)
    
  }
  cat(orange$bold("Done! << 1 >> gdxfile correctly imported as table\n"))
  
  return(experiments_newtable)
  
}





# IMPORT AS TABLE < nty >    ------------------------------------------------------------
#////////////////////////////////////////////////////////////////////////////////////////


import_specific_result_as_table_nty <- function(gdx_with_path){

  
  if (length(gdx_with_path) > 0){ 
    
    cat(green("Parsing: ", gdx_with_path ," \n"))
    
    # 1: parse gdx data and experiment info automatically
    exp_data_and_info =  parse_experiment(gdx_with_path)
    
    # 2: tide infos and data in a well-built table
    experiments_newtable    =  tide_new_experiment_as_table_nty(exp_data_and_info)
    
  }
  cat(orange$bold("Done! << 1 >> gdxfile correctly imported in a  << nty >>  table \n"))
  
  return(experiments_newtable)
}







# IMPORT AS TABLE < ty >  ----------------------------------------------------------------------
#///////////////////////////////////////////////////////////////////////////////////////////////

import_specific_result_as_table_ty <- function(gdx_with_path){


  
  
  if (length(gdx_with_path) > 0){ 
    
    cat(green("Parsing: ", gdx_with_path ," \n"))
    
    # 1: parse gdx data and experiment info automatically
    exp_data_and_info =  parse_experiment(gdx_with_path)
    
    # 2: tide infos and data in a well-built table
    experiments_newtable    =  tide_new_experiment_as_table_ty(exp_data_and_info)
    
  }
  cat(orange$bold("Done! << 1 >> gdxfile correctly imported in a  << ty >>  table \n"))
  
  return(experiments_newtable)
}



# IMPORT AS TABLE < pars >  ----------------------------------------------------------------------
#///////////////////////////////////////////////////////////////////////////////////////////////



import_specific_result_as_table_pars <- function(gdx_with_path){
  
  

  
  if (length(gdx_with_path) > 0){ 
    
    cat(green("Parsing: ", gdx_with_path ," \n"))
    
    # 1: parse gdx data and experiment info automatically
    exp_data_and_info =  parse_experiment(gdx_with_path)
    
    # 2: tide infos and data in a well-built table
    experiments_newtable    =  tide_new_experiment_as_table_pars(exp_data_and_info)
    
  }
  cat(orange$bold("Done! << 1 >> gdxfile correctly imported in a  << pars >>  table \n"))
  
  return(experiments_newtable)
}






