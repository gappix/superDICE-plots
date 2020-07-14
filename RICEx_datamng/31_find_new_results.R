
# Dependencies
source("RICEx_datamng/00_model_global_settings.R")

# LEGACY Dependencies
source("RICEx_datamng/RICEx_20_RICExclass.R")




#' Finds all results under specific < experiment_id > scenario.
#' 
#' @param experiment_id 
#' @param model_results_folder = NULL
#' @param last_import_time = 0 
#'
RICEx.find.new_results <- function(experiment_id
                                   ,results_folder = NULL
                                   ,last_import_time = 0){
  
  # get global option
  dir_results = RICEx.model.results_folder

  
  dir_experiment  = paste0(dir_results, "/",experiment_id, "/")
  
  
  #list all directories inside path
  regions_subdir = list.dirs(path = dir_experiment, full.names = TRUE, recursive = TRUE)
  
  new_results = list()  
  
  # check every subdirectory
  for(subdir in regions_subdir){     
    
    #retrieve all gdx contained in subdirectory created after last import
    gdx_found    = RICEx.find.new_gdx(subdir, last_import_time)
    new_results = list_merge(new_results, gdx_found)
    
  }
  
  return(new_results[[1]])
}



## ------------------------:  UTILITY FUNCTIONS  :-----------------------------




#' .
#' 
#' @param input_directory 
#' @param last_import_time 
#'
#' @noRd
#' 
RICEx.find.new_gdx = function(input_directory, last_import_time) {
  
  
  input_gdx = Sys.glob(file.path(input_directory, paste0(RICEx.model.codename,"_*.gdx")))
  
  
  todo = file.mtime(input_gdx) > last_import_time
  return(input_gdx[is.na(todo) | todo])
}
