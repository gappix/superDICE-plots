
source("RICEx_utils/RICEx_00_package_retriever.R")

require_package("here")

RICEx.model.results_folder_name <- "RICEx-Results"

RICEx.model.codename = "RICEx"
RICEx.model.default_year_horizon = 2200


find_project_folder <- function(){
  
  #1st attempt: search here 
  matching_folders <- list.files(path = paste0(here()),
                                 pattern=RICEx.model.results_folder_name, 
                                 include.dirs = TRUE,
                                 full.names = TRUE, 
                                 recursive = TRUE)
  

  #2nd attempt: go 1 level upwards and try again
  if(length(matching_folders)==0){
  matching_folders <- list.files(path = paste0(here("..")),
                                 pattern=RICEx.model.results_folder_name, 
                                 include.dirs = TRUE,
                                 full.names = TRUE, 
                                 recursive = TRUE)
  }
  
  #3rd attempt: go 2 levels upwards and try again
  if(length(matching_folders)==0){
  matching_folders <- list.files(path = paste0(here("../..")),
                                 pattern=RICEx.model.results_folder_name, 
                                 include.dirs = TRUE,
                                 full.names = TRUE, 
                                 recursive = TRUE)
  }
  
  #4th and last attempt: go 3 levels upwards and try again
  if(length(matching_folders)==0){
  matching_folders <- list.files(path = paste0(here("../../..")),
                                 pattern=RICEx.model.results_folder_name, 
                                 include.dirs = TRUE,
                                 full.names = TRUE, 
                                 recursive = TRUE)
  }
  
  #Directory not found: notify user
  if(length(matching_folders)==0){ 
    
    print("WARNInG: No RICE50x results folder automatically detected. Please set it using R50x::set_results_folder(path::string) function.")
    return(NULL)
    
  } else{
    
    print(paste0("INFO: <",matching_folders[[1]],"> automatically set as RICE50x model results-folder. To change that use < RICE50xPlots::set_results_folder(path:string) > function."))
    return(matching_folders[[1]])
  }
}

RICEx.model.results_folder = find_project_folder()
