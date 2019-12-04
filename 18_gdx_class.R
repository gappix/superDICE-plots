### superDICE class 
# contains an handful set of pre-configured data manipulation functions


# Dependencies 
source("RICEx_utils/RICEx_00_package_retriever.R")
source("RICEx_datamng/RICEx_00_global_settings.R")
source("RICEx_datamng/RICEx_01_data_basic_functions.R")
source("RICEx_datamng/RICEx_10_data_management_functions.R")


# 
# GDXP_nofullpath <- function(gdx_source_file, region_id, experiment_id){
#   
#   
#   results_folder = here("../sDC-results")
#   
#   
#   
#   
#   #gdx directory: default or explicited
#   gdx_dir <- paste0(results_folder,"/",experiment_id, "/",region_id ,"/")
#   
#   #retrieve gdx file
#   gdx_file_with_path = paste0(gdx_dir, gdx_source_file, ".gdx")
#   
#   SuperDICE(gdx_file_with_path)
#   
# }
# 
# 


default_time_horizon = 2300


GDXclass <- function(gdx_file_with_path){
  
  
  # Get the environment for this instance of the function.
  # !! Which is NOT the global environment, but only a local scope !! 
  thisEnv <- environment()
  
  #retrieve gdx file          
  my_gdx   <- gdx(gdx_file_with_path) 
  
  
  ## GENERAL PURPOSE GETTERS -----------------------
  
  my_getVariable_nty  <- function(variable_name){ 
    
    getVariable_GENERAL_nty(	variable_name,
                             gdx_file   = my_gdx,
                             year_limit = default_time_horizon )
  }
  
  
  my_getVariable_iso3ty <- function(variable_name){ 
    
    my_getVariable_GENERAL_iso3ty(	variable_name, year_limit = default_time_horizon )
  }
  
  ##
  my_getParameter  <- function(parameter_name){ 
    
    getParameter(parameter_name,
                 gdx_file   = my_gdx)
  }
  
  ##
  my_getgdx   <- function(){return(my_gdx)}
  
  ##
  my_getVariable_GENERAL_nty  <- function(variable_name, 
                                          year_start = 0,
                                          year_limit = 2300 ){ 
    
    getVariable_GENERAL_nty(  variable_name,
                              gdx_file   = my_gdx,
                              year_start,
                              year_limit )
  }
  
  ##
  my_getVariable_GENERAL_iso3ty    <- function(variable_name, 
                                               year_start = 0,
                                               year_limit = 2300 ){
    
    d_n = my_getVariable_GENERAL_nty(variable_name, year_start,year_limit)
    map_n_iso3 = my_getParameter("map_n_iso3")
    iso3_variable = merge(map_n_iso3,d_n,by=c("n")) %>% sanitizeISO3()
    return(iso3_variable)
  }
  
  
  my_getVariable_ty <- function(variable_name){ 
    
    getVariable_GENERAL_ty(	variable_name,
                            gdx_file   = my_gdx,
                            year_limit = default_time_horizon )
  }
  
  
  
  my_getVariable_GENERAL_ty  <- function(variable_name, 
                                         year_start = 0,
                                         year_limit = 2300 ){ 
    
    getVariable_GENERAL_ty(  variable_name,
                             gdx_file   = my_gdx,
                             year_start,
                             year_limit )
  }
  
  
  my_getVariable_CUMLn_y  <- function(variable_name, 
                                      year_start = 0,
                                      year_limit = 2300 ){ 
    
    getVariable_CUMLn_y(  variable_name,
                          gdx_file   = my_gdx,
                          year_start,
                          year_limit )
  }
  
  
  my_getVariable_CUML5y_n <- function(variable_name,
                                      cumlyear_min = 0,
                                      cumlyear_max=2300){
    
    getVariable_CUML5y_n( variable_name,
                          gdx_file = my_gdx,
                          cumlyear_min,
                          cumlyear_max)
  }
  
  
  
  my_getVariable_CUMLy_n <- function(variable_name,
                                     cumlyear_min = 0,
                                     cumlyear_max=2300){
    
    getVariable_CUMLy_n(  variable_name,
                          gdx_file = my_gdx,
                          cumlyear_min,
                          cumlyear_max)
  }
  
  
  # NEW GETTERS     -----------------------------------------------------
  #///////////////////////////////////////////////////////////////////////////////////////
  
  my_VAR_nty  <- function(variable_name, ext2300 = FALSE){ 
    
    getVariable_GENERAL_nty( variable_name,
                             gdx_file   = my_gdx,
                             year_limit = default_time_horizon )#TODO check this
  }
  
  
  my_PAR_nty  <- function(parameter_name, ext2300 = FALSE){ 
    
    getVariable_GENERAL_nty( parameter_name,
                             gdx_file   = my_gdx,
                             year_limit = default_time_horizon )#TODO check this
  }
  
  
  
  my_WORLDagg_VARnty_ty  <- function(variable_name, ext2300 = FALSE){
    
    
    VAR_nty =  my_VAR_nty(variable_name, ext2300)
    VAR_ty  =  aggregate_nty_sum_ty(VAR_nty)
    
    return(VAR_ty)
    
  }
  
  
  

  


  
  

  
  
  
  ## EXPOSED METHODS   ############################################################
  
  
  
  # Create the list as before..
  me <- list(
    
    #... with the environment
    thisEnv = thisEnv,
    
    
    # NEW PROGRESS EXPOSITION
    get_WORLDagg_VARnty_ty           =  my_WORLDagg_VARnty_ty,
    #get_base_VAR_nty
    
    # OLD 
    get_gdx                       = my_getgdx,
    
    #getters
    get_Parameter                  = my_getParameter,
    
    get_Variable_nty               = my_getVariable_nty,
    get_Variable_GENERAL_nty       = my_getVariable_GENERAL_nty,
    
    get_Variable_iso3ty            = my_getVariable_iso3ty,
    get_Variable_GENERAL_iso3ty    = my_getVariable_GENERAL_iso3ty,
    
    get_Variable_ty                = my_getVariable_ty,
    get_Variable_GENERAL_ty        = my_getVariable_GENERAL_ty,
    
    get_CUML5y_Variable_n             = my_getVariable_CUML5y_n,
    
    get_CUMLn_Variable_y            = my_getVariable_CUMLn_y
    
    
  )
  
  
  # Define the value of the list within the current environment.
  assign('this',me,envir=thisEnv) # remember? equals to say: this <- me  in  "thisEnv"-environment
  
  
  
  class(me) <- append(class(me),"GDXclass")
  return(me)
  
}


