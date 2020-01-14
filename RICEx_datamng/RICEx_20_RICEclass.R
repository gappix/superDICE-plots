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


  my_getParameter  <- function( parameter_name, 
                                unit = NULL){ 
    
    getGDX_Parameter( parameter_name, 
                      unit, 
                      gdx_file   = my_gdx)
  }


  my_getVariable  <- function( variable_name,
                               unit = NULL){ 
    
    getGDX_Variable( variable_name, 
                     unit,
                     gdx_file   = my_gdx)
  }


  my_getVariable_nty  <- function(  variable_name, 
                                    year_start = 0,
                                    year_limit = RICEx_default_time_horizon,
                                    unit = NULL
                                  ){ 
    
    getGDX_Variable_nty(	variable_name,
                          year_start,
                          year_limit, 
                          unit,
                          gdx_file   = my_gdx
                        )
  }

  my_getVariable_ty  <- function(   variable_name, 
                                    year_start = 0,
                                    year_limit = RICEx_default_time_horizon,
                                    unit = NULL
                                  ){ 
    
    getGDX_Variable_ty(	variable_name,
                        year_start,
                        year_limit, 
                        unit,
                        gdx_file   = my_gdx
                      )
  }


  my_getParameter_nty  <- function( parameter_name, 
                                    unit = NULL,
                                    year_start = 0,
                                    year_limit = RICEx_default_time_horizon
                                  ){ 
    
    getGDX_Parameter_nty(	parameter_name = parameter_name,
                          year_start,
                          year_limit, 
                          unit,
                          gdx_file   = my_gdx
                        )
  }

  my_getParameter_ty  <- function(  parameter_name,
                                    unit = NULL,
                                    year_start = 0,
                                    year_limit = RICEx_default_time_horizon
                                  ){ 
    
    getGDX_Parameter_ty(	parameter_name = parameter_name,
                          year_start,
                          year_limit,
                          unit,
                          gdx_file   = my_gdx
                        )
  }
  
  
  my_getGDX   <-   function(){  return(my_gdx)   }



  ## -------------:  AGGREGATING FUNCTIONS :-----------------------


  my_PAR_WORLDagg_ntyTOty  <- function( parameter_name, 
                                        year_start = 0,
                                        unit = NULL,
                                        year_limit = RICEx_default_time_horizon){
    
  
      getGDX_Parameter_WORLDagg_ntyTOty(  parameter_name,
                                          gdx_file = my_gdx,
                                          unit,
                                          year_start, 
                                          year_limit   )
    
  }


  my_VAR_WORLDsum_ntyTOty  <- function(  variable_name, 
                                         year_start = 0,
                                         unit = NULL,
                                         year_limit = RICEx_default_time_horizon){
    
      getGDX_Variable_WORLDagg_ntyTOty(  variable_name,
                                         gdx_file = my_gdx,
                                         unit,
                                         year_start, 
                                         year_limit   )
    
  }


    
  my_VAR_CUML5y_n <- function(variable_name,
                              unit = NULL,
                              year_start = 0,
                              year_limit = RICEx_default_time_horizon){
      
      getGDX_Variable_CUML5y_n( variable_name,
                                unit,
                                gdx_file = my_gdx,
                                year_start,
                                year_limit)
    }


  ## -------------:  DISAGGREGATING FUNCTIONS :-----------------------



  my_VAR_dsagg_ntyTOiso3ty <- function(   variable_name, 
                                          unit = NULL,
                                          year_start = 0,
                                          year_limit = 2200 ){

      getGDX_Variable_dsagg_ntyTOiso3ty(  variable_name,                            
                                          gdx_file = my_gdx,
                                          unit,
                                          year_start,
                                          year_limit 
                                        )
  }



  my_PAR_dsagg_ntyTOiso3ty <- function(   parameter_name, 
                                          unit = NULL,
                                          year_start = 0,
                                          year_limit = 2200 ){

      getGDX_Parameter_dsagg_ntyTOiso3ty( parameter_name,                            
                                          gdx_file = my_gdx,
                                          unit,
                                          year_start,
                                          year_limit 
                                        )
  }  

      
  ## -------------:  SPECIFIC VALUES GETTERS  :-----------------------

  

  # region data 
  my_ABATECOST_nty       =  my_getVariable_nty("ABATECOST",    unit = "Trill 2005 USD/year" )
  my_ABATEDEMI_nty       =  my_getVariable_nty("ABATEDEMI",    unit = "GtCO2/year"          )
  
  my_CIntensity_nty      = merge(   my_getVariable_nty("EIND"    ) %>% rename(eind    = value),
                                    my_getVariable_nty("YGROSS"  ) %>% rename(ygross  = value), 
                                    by = c("n","t","year")       
                                )   %>%  mutate(value = eind/ygross)   %>%   dplyr::select(n,t,year,value)  %>%  mutate(unit = "kgCO2/USD") 
  
  my_CONSUMPTION_nty     =  my_getVariable_nty("C",            unit = "Trill 2005 USD/year" )
  my_CPRICE_nty          =  my_getVariable_nty("CPRICE",       unit = "USD/tCO2"            )
  
  my_DAMAGEabs_nty       =  my_getVariable_nty("DAMAGES",      unit = "Trill 2005 USD/year" )
  my_DAMAGEperc_nty      =  my_getVariable_nty("DAMFRAC",      unit = "%"                   )
  
  my_EMI_nty             =  my_getVariable_nty("E",            unit = "GtCO2/year"          )
  my_EIND_nty            =  my_getVariable_nty("EIND",         unit = "GtCO2/year"          )
  
  my_MIU_nty             =  my_getVariable_nty("MIU",          unit = "%"                   )
  
  my_SCC_nty             =  my_getParameter_nty("scc",         unit = "USD/tCO2eq"          )

  my_TLOCAL_nty          =  my_getVariable_nty("T_LOCAL",      unit = "avg C degrees"       )

  
  # world data
  my_world_ABATECOST_ty   =  my_VAR_WORLDsum_ntyTOty("ABATECOST",  unit = "Trill 2005 USD/year" )
  my_world_ABATEDEMI_ty   =  my_VAR_WORLDsum_ntyTOty("ABATEDEMI",  unit = "GtCO2/year"          )
  
  my_world_CONSUMPTION_ty =  my_VAR_WORLDsum_ntyTOty("C",       unit = "Trill 2005 USD/year" )
  my_world_EMItot_ty      =  my_VAR_WORLDsum_ntyTOty("E",       unit = "GtCO2/year"          )
  my_world_EMIffi_ty      =  my_VAR_WORLDsum_ntyTOty("EIND",    unit = "GtCO2/year"          )
  
    
  my_world_DAMAGEabs_ty   =  my_VAR_WORLDsum_ntyTOty("DAMAGES", unit = "Trill 2005 USD/year" ) %>% mutate(value = value * (-1)) 
  
  my_world_DAMAGEperc_ty  =  merge(   my_VAR_WORLDsum_ntyTOty("DAMAGES" ) %>% rename(damages = value),
                                     my_VAR_WORLDsum_ntyTOty("YGROSS"  ) %>% rename(ygross  = value), 
                                     by = c("t","year")
                                  )  %>% mutate(value = -damages/ygross) %>% dplyr::select(t,year,value) %>% mutate(unit = "%") 
  
  
  my_world_CIntensity_ty  = merge(   my_VAR_WORLDsum_ntyTOty("EIND"    ) %>% rename(eind    = value),
                                    my_VAR_WORLDsum_ntyTOty("YGROSS"  ) %>% rename(ygross  = value), 
                                    by = c("t","year")
                                 )  %>% mutate(value = eind/ygross) %>% dplyr::select(t,year,value) %>% mutate(unit = "kgCO2/USD") 
                              
  my_TATM_ty              =  my_getVariable_ty("TATM",          unit = "+C degrees"          )
  
  

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
  my_CUML5y_DAMAGES_n      <- function( year_start = 0,
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
  my_CUML5y_ABATECOST_n      <- function( year_start = 0,
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
      
 
      get_ABATECOST_nty                  = my_ABATECOST_nty,
      get_ABATEDEMI_nty                  = my_ABATEDEMI_nty,
      get_CONSUMPTION_nty                = my_CONSUMPTION_nty,
      get_CIntensity_nty                 = my_CIntensity_nty,
      get_CPRICE_nty                     = my_CPRICE_nty,
      get_DAMAGEabs_nty                  = my_DAMAGEabs_nty, 
      get_DAMAGEperc_nty                 = my_DAMAGEperc_nty, 
      get_EMI_nty                        = my_EMI_nty,
      get_EIND_nty                       = my_EIND_nty,
      get_MIU_nty                        = my_MIU_nty,
      get_SCC_nty                        = my_SCC_nty,
      get_TLOCAL_nty                     = my_TLOCAL_nty,
      get_TATM_ty                        = my_TATM_ty,

      get_world_ABATECOST_ty              = my_world_ABATECOST_ty,
      get_world_ABATEDEMI_ty              = my_world_ABATEDEMI_ty,
      get_world_EMItot_ty                 = my_world_EMItot_ty,
      get_world_EMIffi_ty                 = my_world_EMIffi_ty,   
      get_world_DAMAGEabs_ty              = my_world_DAMAGEabs_ty,   
      get_world_DAMAGEperc_ty             = my_world_DAMAGEperc_ty, 
      get_world_CIntensity_ty             = my_world_CIntensity_ty,
      get_world_CONSUMPTION_ty            = my_world_CONSUMPTION_ty,
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
      get_VARIABLE_WORLDagg_ntyTOty     =  my_VAR_WORLDsum_ntyTOty,
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


