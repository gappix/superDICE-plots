### superDICE class 
# contains an handful set of pre-configured data manipulation functions


#Dependencies
source("10_data_basic_functions.R")
source("12_data_management_functions.R")





SuperDice_nofullpath <- function(gdx_source_file, region_id, experiment_id){


  results_folder = here("../sDC-results")




  #gdx directory: default or explicited
  gdx_dir <- paste0(results_folder,"/",experiment_id, "/",region_id ,"/")

  #retrieve gdx file
  gdx_file_with_path = paste0(gdx_dir, gdx_source_file, ".gdx")

  SuperDICE(gdx_file_with_path)

}







SuperDICE <- function(gdx_file_with_path){
  
  
  # Get the environment for this instance of the function.
  # !! Which is NOT the global environment, but only a local scope !! 
  thisEnv <- environment()

  default_time_horizon = 2200

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
    
    
    # SPECIFIC GETTERS :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    
    my_TATM_ty              =  my_getVariable_ty("TATM")
    
    my_Emissions_nty       =  my_getVariable_nty("E")

    my_MIU_nty             =  my_getVariable_nty("MIU")

    my_DAMAGES_nty         =  my_getVariable_nty("DAMAGES")
    
    
    my_WORLD_EmissionsTOT_ty   = my_getVariable_CUMLn_y(variable_name = "E")
    
    my_WORLD_EmissionsFFI_ty   = my_getVariable_CUMLn_y(variable_name = "EIND")
    
    
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
      
      get_gdx                       = my_getgdx,
      
      #getters
      get_Parameter                  = my_getParameter,
      
      get_Variable_nty               = my_getVariable_nty,
      get_Variable_GENERAL_nty       = my_getVariable_GENERAL_nty,
      
      get_Variable_iso3ty            = my_getVariable_iso3ty,
      get_Variable_GENERAL_iso3ty    = my_getVariable_GENERAL_iso3ty,
      
      get_Variable_ty                = my_getVariable_ty,
      get_Variable_GENERAL_ty        = my_getVariable_GENERAL_ty,
      
      get_Emissions_nty              = my_Emissions_nty,
      #get_Emissions_GENERAL_nty      = my_Emissions_GENERAL_nty,
      
      get_TATM_ty                   = my_TATM_ty,
      
      get_WORLD_EmissionsTOT_ty      = my_WORLD_EmissionsTOT_ty,
      
      get_WORLD_EmissionsFFI_ty      = my_WORLD_EmissionsFFI_ty,
      #get_WORLDEmissions_GENERAL_ty  = my_WORLDEmissions_EXTENDED_ty,
      
      get_MIU_nty                    = my_MIU_nty,
      #get_MIU_GENERAL_nty            = myMIU_EXTENDED_nty,
      
      get_DAMAGES_nty                = my_DAMAGES_nty,
      
      
      get_CUML5y_Variable_n             = my_getVariable_CUML5y_n,
      
      get_CUMLn_Variable_y            = my_getVariable_CUMLn_y,
      
      get_CUML_EMISSIONS_abs_n             = my_CUML_EMISSIONS_abs_n,
      
      get_CUML_EMISSIONS_perc_n           = my_CUML_EMISSIONS_perc_n,
      
      get_CUML_DAMAGES_abs_n             = my_CUML_DAMAGES_abs_n,

      get_CUML_DAMAGES_perc_n             = my_CUML_DAMAGES_perc_n,
      
      get_CUML_DAMAGES_abs_iso3           = my_CUML_DAMAGES_abs_iso3,

      get_CUML_DAMAGES_perc_iso3           = my_CUML_DAMAGES_perc_iso3,
      
      get_CUML_ABATECOST_abs_n             = my_CUML_ABATECOST_abs_n,
      
      get_CUML_ABATECOST_perc_n        = my_CUML_ABATECOST_perc_n,
      
      get_CUML_ABATECOST_abs_iso3       = my_CUML_ABATECOST_abs_iso3,
      
      get_CUML_ABATECOST_perc_iso3     = my_CUML_ABATECOST_perc_iso3
      
    )
  
  
  # Define the value of the list within the current environment.
  assign('this',me,envir=thisEnv) # remember? equals to say: this <- me  in  "thisEnv"-environment
  
  
  
  class(me) <- append(class(me),"SuperDICE")
  return(me)
  
}


