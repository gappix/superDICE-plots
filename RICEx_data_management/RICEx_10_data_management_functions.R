# Dependencies 
source("RICEx_utils/RICEx_00_package_retriever.R")
source("RICEx_data_management/RICEx_01_data_basic_functions.R")

require_package("dplyr")



## ------------------- NEW FUNCTIONS ----------------------

getGDX_Parameter<- function(gdx_file, parameter_name){
  
  gdx_file[as.character(parameter_name)] 
  
}

getGDX_Variable<- function(gdx_file, variable_name){
  
  gdx_file[as.character(variable_name)] 
  
}


getGDX_Variable_nty <- function(  variable_name,
                                  gdx_file,
                                  year_start = 0,
                                  year_limit = 2300
                                ){
  
  gdx_file[as.character(variable_name)] %>% 
    mutate(year = t_to_y(as.integer(t))) %>%
    make_t_integer() %>%
    make_year_integer() %>%
    sanitizeISO3() %>%
    dplyr::filter(year >= year_start) %>%
    dplyr::filter(year <= year_limit)
  
}



getGDX_Variable_ty <- function( variable_name,
                                gdx_file,
                                year_start = 0,
                                year_limit = 2300
                              ){
  
  gdx_file[as.character(variable_name)] %>%    
    mutate(year = t_to_y(as.integer(t)) ) %>% 
    make_t_integer() %>%
    make_year_integer() %>%
    dplyr::filter(year >= year_start) %>%
    dplyr::filter(year <= year_limit)

}



getGDX_Parameter_nty <- function(   parameter_name,
                                    gdx_file,
                                    year_start = 0,
                                    year_limit = 2300
                                ){
  
         getGDX_Variable_nty( variable_name = parameter_name,
                              gdx_file,
                              year_start,
                              year_limit
                            )  
}



getGDX_Parameter_ty <- function(  parameter_name,
                                  gdx_file,
                                  year_start = 0,
                                  year_limit = 2300
                                ){
  
         getGDX_Variable_ty(  variable_name = parameter_name,
                              gdx_file,
                              year_start,
                              year_limit
                            ) 
}



## -------------:  AGGREGATING FUNCTIONS :-----------------------


getGDX_Variable_CUML5y_n <- function(variable_name,
                                gdx_file,
                                year_start = 0,
                                year_limit=2300){
  
 getGDX_Variable_nty( variable_name,
                      gdx_file,
                      year_start,
                      year_limit   )   %>%
    group_by(n)                        %>%
    summarise(value = sum(value*5))    %>%  # multiplied because is the 
    dplyr::select(n, value)
  
}

## -------------:  DISAGGREGATING FUNCTIONS :-----------------------

## LEGACY FUNCTIONS -------------------------------------------


# return specific nty variable with no time limits
getVariable_GENERAL_nty <- function(variable_name,
                                    gdx_file,
                                    year_start = 0,
                                    year_limit=2300){
  
  gdx_file[as.character(variable_name)] %>% 
    mutate(year = t_to_y(as.integer(t))) %>%
    make_t_integer() %>%
    make_year_integer() %>%
    sanitizeISO3() %>%
    dplyr::filter(year >= year_start) %>%
    dplyr::filter(year <= year_limit)
  
}


getParameter<- function(parameter_name,
                        gdx_file){
  
  gdx_file[as.character(parameter_name)] 
  
}




# return specific ty variable with no time limits
getVariable_GENERAL_ty <- function(variable_name,
                                   gdx_file,
                                   year_start = 0,
                                   year_limit=2300){
  
  gdx_file[as.character(variable_name)] %>%    
    mutate(year = t_to_y(as.integer(t)) ) %>% 
    make_t_integer() %>%
    make_year_integer() %>%
    dplyr::filter(year >= year_start) %>%
    dplyr::filter(year <= year_limit)

}


## CUMULATIVE FUNCTIONS -------------------------------------------




# CUMULATIVE ACROSS REGIONS 





## CUMULATIVE ACROSS 5 YEARS by multiplying 






## CUMULATIVE ACROSS YEARS as it is 


getVariable_CUMLy_n <- function(variable_name,
                                 gdx_file,
                                 cumlyear_min = 0,
                                 cumlyear_max=2300){
  
  getVariable_GENERAL_nty(variable_name,
                          gdx_file,
                          cumlyear_min,
                          cumlyear_max) %>%
    group_by(n)                         %>%
    summarise(value = sum(value))       %>%
    dplyr::select(n, value)
  
}


## SPECIFIC FUNCTIONS -------------------------------------------

# LEGACY DEPRECATED
aggregate_nty_sum_ty <- function(DF_nty){
  
  
  DF_ty =  DF_nty      %>%     
    group_by(t,year)        %>%
    summarise(value = sum(value))   %>% 
    dplyr::select(t,year, value)
  
  return(DF_ty)
  
}







