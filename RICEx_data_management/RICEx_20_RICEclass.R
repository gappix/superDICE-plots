### RICEx S3 class 
# contains an handful set of pre-configured data manipulation functions

# Dependencies 
source("RICEx_utils/RICEx_00_package_retriever.R")
source("RICEx_data_management/RICEx_00_global_settings.R")
source("RICEx_data_management/RICEx_01_data_basic_functions.R")
source("RICEx_data_management/RICEx_10_data_management_functions.R")

require_package("data.table")
require_package("dplyr")
require_gdxtools()
invisible(igdx(dirname(Sys.which('gams'))))

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
    
    #to10
    PAR_nty =  my_getParameter_nty(parameter_name, year_start,year_limit)
    PAR_ty  =  WORLDaggr_ntyTOty(PAR_nty)
    
    return(PAR_ty)
    
  }

   my_VAR_WORLDagg_ntyTOty  <- function(  variable_name, 
                                          year_start = 0,
                                          year_limit = RICEx_default_time_horizon){
    
     #to10
    VAR_nty =  my_getParameter_nty(variable_name, year_start,year_limit)
    VAR_ty  =  WORLDaggr_ntyTOty(VAR_nty)
    
    return(VAR_ty)
    
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
      #to10
      d_n = my_getVariable_nty(variable_name, year_start,year_limit)
      map_n_iso3 = my_getParameter("map_n_iso3")
      iso3_variable = merge(map_n_iso3,d_n,by=c("n")) %>% sanitizeISO3()
      return(iso3_variable)
  }



  my_PAR_dsagg_ntyTOiso3ty <- function(   parameter_name, 
                                          year_start = 0,
                                          year_limit = 2200 ){
      #to10
      d_n = my_getParameter_nty(parameter_name, year_start,year_limit)
      map_n_iso3 = my_getParameter("map_n_iso3")
      iso3_parameter = merge(map_n_iso3,d_n,by=c("n")) %>% sanitizeISO3()
      return(iso3_parameter)
  }  

      
  ## -------------:  SPECIFIC VALUES GETTERS  :-----------------------

  my_TATM_ty             =  my_getVariable_ty("TATM")

  my_EMI_nty             =  my_getVariable_nty("E")
  my_EIND_nty            =  my_getVariable_nty("EIND")
  my_MIU_nty             =  my_getVariable_nty("MIU")
  my_DAMAGES_nty         =  my_getVariable_nty("DAMAGES")

  my_worldEMItot_ty      =  my_VAR_WORLDagg_ntyTOty("E")
  my_worldEMIffi_ty      =  my_VAR_WORLDagg_ntyTOty("EIND")
    
  


    
    
    ## ----------------------:  LEGACY  :-------------------------------

  


  

    
    
    
    my_getVariable_CUMLy_n <- function(variable_name,
                                        cumlyear_min = 0,
                                        cumlyear_max=2300){
      
      getVariable_CUMLy_n(  variable_name,
                            gdx_file = my_gdx,
                            cumlyear_min,
                            cumlyear_max)
    }
    
    

    
    
    

    
    # SPECIFIC GETTERS :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    


    # Evaluates total emissioni [GtCO2] per each region
    # from start_year to end_year 
    # multiplying 5 times each timestamp value
    #
    my_CUML_EMISSIONS_abs_n      <- function(start_year= 0, end_year = 2300){
      
      my_getVariable_CUML5y_n(variable_name = "E", 
                              cumlyear_min  = start_year,
                              cumlyear_max  = end_year)
    }

    
    # Evaluates total abatement costs [%cmlGDP] per each region
    # from start_year to end_year 
    # (abatecosts and gdp are multiplied 5 times each timestamp value)
    #
    my_CUML_EMISSIONS_perc_n      <- function(start_year= 0, end_year = 2300){
      
      cum_emi        = my_getVariable_CUML5y_n(variable_name = "EMISSIONS", 
                                               cumlyear_min  = start_year,
                                               cumlyear_max  = end_year) %>%  rename("emissions" = "value") 
      
      
      cum_gdp        = my_getVariable_CUML5y_n(variable_name = "YGROSS", 
                                               cumlyear_min  = start_year,
                                               cumlyear_max  = end_year)%>%  rename("ygross" = "value") 
      
      merge(cum_emi,cum_gdp, by = c("n")) %>% mutate(value = emissions/ygross) %>% dplyr::select(n,value)
      
      
    }
    
    
    
    # Evaluates total damages [Trill USD] per each region
    # from start_year to end_year 
    # multiplying 5 times each timestamp value
    #
    my_CUML_DAMAGES_abs_n      <- function(start_year= 0, end_year = 2300){
      
      my_getVariable_CUML5y_n(variable_name = "DAMAGES", 
                              cumlyear_min  = start_year,
                              cumlyear_max  = end_year)
    }


    # Evaluates total abatement costs [%cmlGDP] per each region
    # from start_year to end_year 
    # (abatecosts and gdp are multiplied 5 times each timestamp value)
    #
    my_CUML_DAMAGES_perc_n      <- function(start_year= 0, end_year = 2300){
      
      cum_damages    = my_getVariable_CUML5y_n(variable_name = "DAMAGES", 
                                                cumlyear_min  = start_year,
                                                cumlyear_max  = end_year) %>%  rename("damages" = "value") 
      
      
      cum_gdp        = my_getVariable_CUML5y_n(variable_name = "YGROSS", 
                                               cumlyear_min  = start_year,
                                               cumlyear_max  = end_year)%>%  rename("ygross" = "value") 
      
      merge(cum_damages,cum_gdp, by = c("n")) %>% mutate(value = damages/ygross) %>% dplyr::select(n,value)
      
      
    }
    
    # Maps total damages costs [Trill USD] per each iso3 region
    #
    my_CUML_DAMAGES_abs_iso3    <- function(start_year= 0, end_year = 2300){
      
      d_n = my_CUML_DAMAGES_perc_n( start_year  = start_year,  
                                    end_year    = end_year   )
      map_n_iso3 = my_getParameter("map_n_iso3")
      iso3_damages = merge(map_n_iso3,d_n,by=c("n")) %>% sanitizeISO3()
      return(iso3_damages)
    }
    
    
    
    # Maps total damages costs [%cmlGDP] per each iso3 region
    #
    my_CUML_DAMAGES_perc_iso3    <- function(start_year= 0, end_year = 2300){
      
      d_n  = my_CUML_DAMAGES_perc_n ( start_year  = start_year,  
                                      end_year    = end_year    )
      map_n_iso3 = my_getParameter("map_n_iso3")
      iso3_damages = merge(map_n_iso3,d_n,by=c("n")) %>% sanitizeISO3()
      return(iso3_damages)
    }
    
    
    
    # Evaluates total abatement costs [Trill USD] per each region
    # from start_year to end_year 
    # multiplying 5 times each timestamp value
    my_CUML_ABATECOST_abs_n      <- function(start_year= 0, end_year = 2300){
      
      my_getVariable_CUML5y_n(variable_name = "ABATECOST", 
                              cumlyear_min  = start_year,
                              cumlyear_max  = end_year)
    }
    
    
    # Evaluates total abatement costs [%cmlGDP] per each region
    # from start_year to end_year 
    # (abatecosts and gdp are multiplied 5 times each timestamp value)
    #
    my_CUML_ABATECOST_perc_n      <- function(start_year= 0, end_year = 2300){
      
      cum_abatecosts = my_getVariable_CUML5y_n(variable_name = "ABATECOST", 
                                                cumlyear_min  = start_year,
                                                cumlyear_max  = end_year) %>%  rename("abatecost" = "value") 
      
      
      cum_gdp        = my_getVariable_CUML5y_n(variable_name = "YGROSS", 
                                               cumlyear_min  = start_year,
                                               cumlyear_max  = end_year)%>%  rename("ygross" = "value") 
      
      merge(cum_abatecosts,cum_gdp, by = c("n")) %>% mutate(value = abatecost/ygross) %>% dplyr::select(n,value)
      
      
    }
    
    
    # Maps total abatement costs [Trill USD] per each iso3 region
    #
    my_CUML_ABATECOST_abs_iso3    <- function(start_year= 0, end_year = 2300){
      
      d_n = my_CUML_ABATECOST_abs_n ( start_year  = start_year,  
                                      end_year    = end_year   )
      map_n_iso3 = my_getParameter("map_n_iso3")
      iso3_damages = merge(map_n_iso3,d_n,by=c("n")) %>% sanitizeISO3()
      return(iso3_damages)
    }
    
    
    # Maps total abatement costs [%cmlGDP] per each iso3 region
    #
    my_CUML_ABATECOST_perc_iso3    <- function(start_year= 0, end_year = 2300){
      
      d_n  = my_CUML_ABATECOST_perc_n ( start_year  = start_year,  
                                        end_year    = end_year    )
      map_n_iso3 = my_getParameter("map_n_iso3")
      iso3_damages = merge(map_n_iso3,d_n,by=c("n")) %>% sanitizeISO3()
      return(iso3_damages)
    }
    


  
    
    
    
    ## EXPOSED METHODS   ############################################################
    
    

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


      # aggregating function #underrevisions

      get_PARAMETER_WORLDagg_ntyTOty    =  my_PAR_WORLDagg_ntyTOty,
      get_VARIABLE_WORLDagg_ntyTOty     =  my_VAR_WORLDagg_ntyTOty,
      get_VARIABLE_CUML5y_n              = my_getVariable_CUML5y_n,    
         
      get_CUML_EMISSIONS_abs_n           = my_CUML_EMISSIONS_abs_n,     
      get_CUML_EMISSIONS_perc_n          = my_CUML_EMISSIONS_perc_n,      
      get_CUML_DAMAGES_abs_n             = my_CUML_DAMAGES_abs_n,
      get_CUML_DAMAGES_perc_n            = my_CUML_DAMAGES_perc_n,     
      get_CUML_DAMAGES_abs_iso3          = my_CUML_DAMAGES_abs_iso3,
      get_CUML_DAMAGES_perc_iso3         = my_CUML_DAMAGES_perc_iso3,
      get_CUML_ABATECOST_abs_n           = my_CUML_ABATECOST_abs_n,
      get_CUML_ABATECOST_perc_n          = my_CUML_ABATECOST_perc_n,  
      get_CUML_ABATECOST_abs_iso3        = my_CUML_ABATECOST_abs_iso3,  
      get_CUML_ABATECOST_perc_iso3       = my_CUML_ABATECOST_perc_iso3,

      # disaggregating functions

      get_VARIABLE_dsagg_ntyTOiso3ty   = my_VAR_dsagg_ntyTOiso3ty,
      get_PARAMETER_dsagg_ntyTOiso3ty  = my_PAR_dsagg_ntyTOiso3ty,


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


