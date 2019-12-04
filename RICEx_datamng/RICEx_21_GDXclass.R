### GDXclass (S3 class)
# contains an handful set of pre-configured data manipulation functions

# Dependencies 
source("RICEx_utils/RICEx_00_package_retriever.R")
source("RICEx_datamng/RICEx_00_global_settings.R")
source("RICEx_datamng/RICEx_01_data_basic_functions.R")
source("RICEx_datamng/RICEx_10_data_management_functions.R")

require_package("data.table")
require_package("dplyr")
require_gdxtools()



## GDXclass as S3 CLASS

GDXclass <- function(gdx_file_with_path){
  
  
  # Get the environment for this instance of the function.
  # !! Which is NOT the global environment, but only a local scope !! 
  thisEnv <- environment()
  
  
  
  #retrieve gdx file          
  my_gdx   <- gdx(gdx_file_with_path) 
  
  
  ## -------------:  GENERAL PURPOSE GETTERS  :-----------------------
  
  
  my_getParameter  <- function(parameter_name){ 
    
    getGDX_Parameter( parameter_name, 
                      gdx_file   = my_gdx)
  }
  
  
  my_getVariable  <- function(variable_name){ 
    
    getGDX_Variable( variable_name, 
                     gdx_file   = my_gdx)
  }
  
  
  my_getVariable_nty  <- function(  variable_name, 
                                    year_start = 0,
                                    year_limit = RICEx_default_time_horizon
  ){ 
    
    getGDX_Variable_nty(	variable_name,
                         year_start,
                         year_limit, 
                         gdx_file   = my_gdx
    )
  }
  
  my_getVariable_ty  <- function(   variable_name, 
                                    year_start = 0,
                                    year_limit = RICEx_default_time_horizon
  ){ 
    
    getGDX_Variable_ty(	variable_name,
                        year_start,
                        year_limit, 
                        gdx_file   = my_gdx
    )
  }
  
  
  my_getParameter_nty  <- function( parameter_name, 
                                    year_start = 0,
                                    year_limit = RICEx_default_time_horizon
  ){ 
    
    getGDX_Parameter_nty(	parameter_name = parameter_name,
                          year_start,
                          year_limit, 
                          gdx_file   = my_gdx
    )
  }
  
  my_getParameter_ty  <- function(  parameter_name, 
                                    year_start = 0,
                                    year_limit = RICEx_default_time_horizon
  ){ 
    
    getGDX_Parameter_ty(	parameter_name = parameter_name,
                         year_start,
                         year_limit, 
                         gdx_file   = my_gdx
    )
  }
  
  my_getGDX   <-   function(){  return(my_gdx)   }
  
  
  
  ## -------------:  AGGREGATING FUNCTIONS :-----------------------
  
  
  my_PAR_WORLDagg_ntyTOty  <- function( parameter_name, 
                                        year_start = 0,
                                        year_limit = RICEx_default_time_horizon){
    
    
    getGDX_Parameter_WORLDagg_ntyTOty(  parameter_name,
                                        gdx_file = my_gdx,
                                        year_start, 
                                        year_limit   )
    
  }
  
  
  my_VAR_WORLDagg_ntyTOty  <- function(  variable_name, 
                                         year_start = 0,
                                         year_limit = RICEx_default_time_horizon){
    
    getGDX_Variable_WORLDagg_ntyTOty(  variable_name,
                                       gdx_file = my_gdx,
                                       year_start, 
                                       year_limit   )
    
  }
  
  
  
  my_VAR_CUML5y_n <- function(variable_name,
                              year_start = 0,
                              year_limit = RICEx_default_time_horizon){
    
    getGDX_Variable_CUML5y_n( variable_name,
                              gdx_file = my_gdx,
                              year_start,
                              year_limit)
  }
  
  
  ## -------------:  DISAGGREGATING FUNCTIONS :-----------------------
  
  
  
  my_VAR_dsagg_ntyTOiso3ty <- function(   variable_name, 
                                          year_start = 0,
                                          year_limit = 2200 ){
    
    getGDX_Variable_dsagg_ntyTOiso3ty(  variable_name,                            
                                        gdx_file = my_gdx,
                                        year_start,
                                        year_limit 
    )
  }
  
  
  
  my_PAR_dsagg_ntyTOiso3ty <- function(   parameter_name, 
                                          year_start = 0,
                                          year_limit = 2200 ){
    
    getGDX_Parameter_dsagg_ntyTOiso3ty( parameter_name,                            
                                        gdx_file = my_gdx,
                                        year_start,
                                        year_limit 
    )
  }  
  
  

  
  
  
  
  
  
  
  
  ## .............:  S3 CLASS EXPOSED METHODS :--------------------
  
  # Create the list as before..
  me <- list(
    
    #... with the environment
    thisEnv = thisEnv,
    
    
    # disaggregating functions
    
    get_VARIABLE_dsagg_ntyTOiso3ty   = my_VAR_dsagg_ntyTOiso3ty,
    get_PARAMETER_dsagg_ntyTOiso3ty  = my_PAR_dsagg_ntyTOiso3ty,
    
    # aggregating functions
    
    get_PARAMETER_WORLDagg_ntyTOty    =  my_PAR_WORLDagg_ntyTOty,
    get_VARIABLE_WORLDagg_ntyTOty     =  my_VAR_WORLDagg_ntyTOty,
    get_VARIABLE_CUML5y_n              = my_VAR_CUML5y_n,   
    
    
    # exposed general-purpouse functions
    
    get_PARAMETER_nty                = my_getParameter_nty,
    get_PARAMETER_ty                 = my_getParameter_ty,
    get_VARIABLE_nty                 = my_getVariable_nty,
    get_VARIABLE_ty                  = my_getVariable_ty,
    get_PARAMETER                    = my_getParameter,
    get_VARIABLE                     = my_getVariable,
    
    get_GDX                          = my_getGDX
    
    
    
    
    
  )
  
  
  # Define the value of the list within the current environment.
  assign('this',me,envir=thisEnv) # remember? equals to say: this <- me  in  "thisEnv"-environment
  
  
  
  class(me) <- append(class(me),"GDXclass")
  return(me)
  
}


