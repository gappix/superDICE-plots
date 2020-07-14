

require_package("tcltk")


#' Selects an item and links it to all passed experiments dimensions
#' 
#' @param exp_code could be either a simple string (to search thorugh a single exp_code) or a vector of strings (to search across all passed exp_codes)
#' 
#' @param element_selection_function a RICExselection.
#' 
#' @description
#' The map function transform the input, returning a vector the same length
#' as the input. 
compare_across_experiments <- function(exp_codes,
                                       RICExclass_selection_function = NULL,
                                       element_nty = NULL,
                                       element_ty = NULL,
                                       element_simple = NULL,
                                       specific_year = NULL,
                                       time_interval_year_start = NULL,
                                       time_interval_year_end = NULL
                                       ){
  
  
  # Check selection function: if no custom selection function is provided
  # we have to build one according to preferences passed.
  if(is.null(RICExclass_selection_function)){
    
    
  RICExclass_selection_function <- create_custom_RICExclass_selection_function( element_nty,
                                                                                element_ty,
                                                                                element_simple,
                                                                                specific_year,
                                                                                time_interval_year_start,
                                                                                time_interval_year_end   )
  
  }
  
  # TEST BOX .........................
  exp_codes = c("Paper" )#,"SENSgamma")
  #..................................
  
  
  #_________
  # STEP 0:  retrieve all results gdxs in experiment space

  gdxs_with_path_list = list()
  
  for(experiment_id in exp_codes){
    
    new_gdxs_with_path_found =  find_new_results(experiment_id)
    
    if(length(new_gdxs_with_path_found) <=  0){  warning(paste0("No result-file found for ", new_gdxs_with_path_found ))
    }else{ gdxs_with_path_list = list_merge(gdxs_with_path_list, new_gdxs_with_path_found) }
    
  }
  
  if (length(gdxs_with_path_list) <=  0) stop("No result-file found for indicated experiment_id(s)")

  
  
  #_________
  # STEP 1:  retrieve all dimensions in experiments space
  
  exp_dimensions <- retrieve_experiment_space_dimensions(exp_codes)
  
  
  
  #_________
  # STEP 2:  for each experiment extract data and fill a dataframe with all dimensions detail
  
  
  myDF = NULL
  
  
  # create progress bar
  i = 1
  tot = length(gdxs_with_path_list)
  pb <- tkProgressBar(title = "progress", min = 0, max = tot, width = 300)
  
  
  for(gdx_element in gdxs_with_path_list){
    
    # TEST box ...............................
    # gdx_element <- gdxs_with_path_list[[1]][2]
    # .........................................
    
    # show progress
    Sys.sleep(0.1)
    setTkProgressBar(pb, i, label=paste( round(i/tot*100, 0),"% done"))
    
    
    # 2a: parse gdx data and experiment info automatically
    exp_data_and_info =  parse_experiment(gdx_element)
    
    # 2b: extract data
    selectedDF = exp_data_and_info$data %>% RICExclass_selection_function()
    
    
    # 2c: create table with data
    data_clean_table    =  tide_data_and_exp_info(selectedDF, exp_data_and_info, exp_dimensions)
    
    
    # 2d: keep track of all data
    if(is.null(myDF)){ myDF = data_clean_table }
    else{ myDF = rbind(myDF,data_clean_table )}
    
    
    
    
    
    i= i+1
  }
  
  
  
}






bubba <- function(df){
  
  
  return(df$get_TATM_ty %>% filter(year == 2100))
  
}
















######   _____ PRIVATE functions ______ ######   






#' Create a custom selection function for RICExclass
#'
#'
#'
#' @noRd
tide_data_and_exp_info <- function(data_DF, exp_data_and_info, exp_dimensions){
  
  
  
  
  
  
}
