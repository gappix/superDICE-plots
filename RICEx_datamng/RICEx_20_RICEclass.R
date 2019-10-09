### RICEx S3 class 
# contains an handful set of pre-configured data manipulation functions

# Dependencies 
source("RICEx_utils/RICEx_00_package_retriever.R")
source("RICEx_datamng/RICEx_00_global_settings.R")
source("RICEx_datamng/RICEx_01_data_basic_functions.R")
source("RICEx_datamng/RICEx_10_data_management_functions.R")

require_package("data.table")
require_package("dplyr")
require_gdxtools()


## FUNCTION
# to retrieve s3 class in absence of
RICEx_nofullpath <- function(gdx_source_file, region_id, experiment_id){

  # get global setting
  results_folder = RICEx_results_folder

  #gdx directory: default or explicited
  gdx_dir <- paste0(results_folder,"/",experiment_id, "/",region_id ,"/")

  #retrieve gdx file
  gdx_file_with_path = paste0(gdx_dir, gdx_source_file, ".gdx")

  RICEx(gdx_file_with_path)

}






## S3 CLASS

RICEx <- function(gdx_file_with_path){
  
  
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

      
  ## -------------:  SPECIFIC VALUES GETTERS  :-----------------------

  my_TATM_ty             =  my_getVariable_ty("TATM")

  my_EMI_nty             =  my_getVariable_nty("E")
  my_EIND_nty            =  my_getVariable_nty("EIND")
  my_MIU_nty             =  my_getVariable_nty("MIU")
  my_DAMAGES_nty         =  my_getVariable_nty("DAMAGES")

  my_worldEMItot_ty      =  my_VAR_WORLDagg_ntyTOty("E")
  my_worldEMIffi_ty      =  my_VAR_WORLDagg_ntyTOty("EIND")
    
  


  ## .............:  SPECIFIC EVALUATED GETTERS  :--------------------

  my_CUML5y_EMISSIONS_n      <- function( year_start = 0,
                                          year_limit = RICEx_default_time_horizon){
      
      my_VAR_CUML5y_n( variable_name = "E", 
                       year_start,
                       year_limit  )
  }

    
  # Evaluates total abatement costs [%cmlGDP] per each region
  # from start_year to end_year 
  # (abatecosts and gdp are multiplied 5 times each timestamp value)
  #
  my_CUML5y_EMISSIONSperc_n      <- function(year_start = 0,
                                             year_limit = RICEx_default_time_horizon){


    cum_emi        = my_VAR_CUML5y_n( variable_name = "E", 
                                      year_start,
                                      year_limit) %>%  rename("emissions" = "value") 
    
    
    cum_gdp        = my_VAR_CUML5y_n( variable_name = "YGROSS", 
                                      year_start,
                                      year_limit) %>%  rename("ygross" = "value") 
    
    merge(cum_emi,cum_gdp, by = c("n")) %>% mutate(value = emissions/ygross) %>% dplyr::select(n,value)
    
    
  }


  
    
  
  # Evaluates total damages [Trill USD] per each region
  # from start_year to end_year 
  # multiplying 5 times each timestamp value
  #
  my_CUML5y_DAMAGES_n      <- function(syear_start = 0,
                                          year_limit = RICEx_default_time_horizon){
      
      my_VAR_CUML5y_n( variable_name = "DAMAGES", 
                       year_start,
                       year_limit  )
  }


  # Evaluates total abatement costs [%cmlGDP] per each region
  # from start_year to end_year 
  # (abatecosts and gdp are multiplied 5 times each timestamp value)
  #
  my_CUML5y_DAMAGESperc_n      <-  function(year_start = 0,
                                             year_limit = RICEx_default_time_horizon){


    cum_damages    = my_VAR_CUML5y_n( variable_name = "DAMAGES", 
                                      year_start,
                                      year_limit) %>%  rename("damages" = "value") 
    
    
    cum_gdp        = my_VAR_CUML5y_n( variable_name = "YGROSS", 
                                      year_start,
                                      year_limit) %>%  rename("ygross" = "value")
    
    merge(cum_damages,cum_gdp, by = c("n")) %>% mutate(value = damages/ygross) %>% dplyr::select(n,value)
    
    
  }
  





  
  
  # Evaluates total abatement costs [Trill USD] per each region
  # from start_year to end_year 
  # multiplying 5 times each timestamp value
  my_CUML5y_ABATECOST_n      <- function(syear_start = 0,
                                          year_limit = RICEx_default_time_horizon){
      
      my_VAR_CUML5y_n( variable_name = "ABATECOST", 
                       year_start,
                       year_limit  )
  }
  
  



  # Evaluates total abatement costs [%cmlGDP] per each region
  # from start_year to end_year 
  # (abatecosts and gdp are multiplied 5 times each timestamp value)
  #
  my_CUML5y_ABATECOSTperc_n      <- function(year_start = 0,
                                             year_limit = RICEx_default_time_horizon){


    cum_abatecosts = my_VAR_CUML5y_n( variable_name = "ABATECOST", 
                                      year_start,
                                      year_limit) %>%  rename("abatecost" = "value") 
    
    
    cum_gdp        = my_VAR_CUML5y_n( variable_name = "YGROSS", 
                                      year_start,
                                      year_limit) %>%  rename("ygross" = "value")
    
    merge(cum_abatecosts,cum_gdp, by = c("n")) %>% mutate(value = abatecost/ygross) %>% dplyr::select(n,value)
     
  }
 


  ## LEGACY
  # # Maps total damages costs [Trill USD] per each iso3 region
  # #
  # my_CUML_DAMAGES_abs_iso3    <- function(start_year= 0, end_year = 2300){
    
  #   d_n = my_CUML_DAMAGES_perc_n( start_year  = start_year,  
  #                                 end_year    = end_year   )
  #   map_n_iso3 = my_getParameter("map_n_iso3")
  #   iso3_damages = merge(map_n_iso3,d_n,by=c("n")) %>% sanitizeISO3()
  #   return(iso3_damages)
  # }
  
  
  




  
    
    
  ## .............:  S3 CLASS EXPOSED METHODS :--------------------

    # Create the list as before..
    me <- list(
      
      #... with the environment
      thisEnv = thisEnv,
      

      # exposed specific values
      
      get_TATM_ty                        = my_TATM_ty,

      get_EMI_nty                        = my_EMI_nty,
      get_EIND_nty                       = my_EIND_nty,
      get_MIU_nty                        = my_MIU_nty,
      get_DAMAGES_nty                    = my_DAMAGES_nty,  

      get_worldEMItot_ty                 = my_worldEMItot_ty,
      get_worldEMIffi_ty                 = my_worldEMIffi_ty,   

         
      # specific evaluated getters

      get_CUML5y_EMISSIONS_n             = my_CUML5y_EMISSIONS_n,     
      get_CUML5y_EMISSIONSperc_n         = my_CUML5y_EMISSIONSperc_n,  
      get_CUML5y_DAMAGES_n               = my_CUML5y_DAMAGES_n,
      get_CUML5y_DAMAGESperc_n           = my_CUML5y_DAMAGESperc_n, 
      get_CUML5y_ABATECOST_n             = my_CUML5y_ABATECOST_n,
      get_CUML5y_ABATECOST_perc_n        = my_CUML5y_ABATECOSTperc_n,   


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
  
  
  
  class(me) <- append(class(me),"RICEx")
  return(me)
  
}


