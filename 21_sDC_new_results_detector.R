## RESULT LIST RETRIEVER

# Dependencies
# Use library here
if(!require(here)) {
  install.packages("here", repos="https://cloud.r-project.org")
  if(!require(here)) stop("Package here not found")
}





# 
# Function to retrieve all already-created gdxs
#
find_newest_gdx = function(input_directory, last_import_time) {
  
  result = list()
  
  input_gdx = file.info(Sys.glob(file.path(input_directory, "sunRC_*.gdx")))
  max_time_found = max(input_gdx$mtime)
  
  if(max_time_found > last_import_time){
    
    result$found = TRUE
    result$gdx = rownames(input_gdx)[which.max(input_gdx$mtime)]
    result$mtime = max_time_found
    return(result)
    
  }

  result$found = FALSE
  return(result)
}




# FUnction to retrieve all already-created gdxs
find_new_gdx = function(input_directory, last_import_time) {
  
  
  input_gdx = Sys.glob(file.path(input_directory, "sunRC_*.gdx"))
  
  
  todo = file.mtime(input_gdx) > last_import_time
  return(input_gdx[is.na(todo) | todo])
}






#
# Retrieve LATEST-created gdx inside results folder (and subones)
#
find_latest_gdx <- function(){
  
  dir_sDC_results = here("../sDC-results/")

  
  #list all directories inside path
  regions_subdir = list.dirs(path = dir_sDC_results, full.names = TRUE, recursive = TRUE)
  

  
  
  # initialize best time
  my_newest_gdx_time = 0
  
  # check every subdirectory  
  for(subdir in regions_subdir){     
    
    # found a gdx newer than current my_last_import_time! 
    result        = find_newest_gdx(subdir, my_newest_gdx_time)
    
    if(result$found == TRUE){
      
      newest_gdx       = result$gdx
      my_newest_gdx_time = result$mtime
      
    }
    
  }
  
  # return the result (newest by construction)
  return(newest_gdx)
}



















# FUnction to 
find_new_results <- function(experiment_id, last_import_time = 0){
  
  dir_sDC_results = here("../sDC-results/")
  dir_experiment  = paste0(dir_sDC_results, "/",experiment_id, "/")
  
  
  #list all directories inside path
  regions_subdir = list.dirs(path = dir_experiment, full.names = TRUE, recursive = TRUE)
  
  new_results = list()  
  
  # check every subdirectory
  for(subdir in regions_subdir){     
    
  #retrieve all gdx contained in subdirectory created after last import
  gdx_found    = find_new_gdx(subdir, last_import_time)
  new_results = list_merge(new_results, gdx_found)
  
  }
  
  return(new_results[[1]])
}



