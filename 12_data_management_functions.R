



# Dependencies 

source("10_data_basic_functions.R")




## GENERAL FUNCTIONS -------------------------------------------


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
    filter(year >= year_start) %>%
    filter(year <= year_limit)
  
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
  
  my_gdx[as.character(variable_name)] %>%    
    mutate(year = t_to_y(as.integer(t)) ) %>% 
    make_t_integer() %>%
    make_year_integer() %>%
    filter(year >= year_start) %>%
    filter(year <= year_limit)

}


## CUMULATIVE FUNCTIONS -------------------------------------------




# CUMULATIVE ACROSS REGIONS 


getVariable_CUMLn_y <- function(variable_name,
                                 gdx_file,
                                 year_start = 0,
                                 year_limit=2300){
  
  getVariable_GENERAL_nty(variable_name,
                          gdx_file,
                          year_start,
                          year_limit)%>%
    group_by(year, t)                %>%
    summarise(value = sum(value))    %>%
    select(t, year, value)
  
}


## CUMULATIVE ACROSS 5 YEARS by multiplying 


getVariable_CUML5y_n <- function(variable_name,
                                gdx_file,
                                cumlyear_min = 0,
                                cumlyear_max=2300){
  
 getVariable_GENERAL_nty(variable_name,
                         gdx_file,
                         cumlyear_min,
                         cumlyear_max) %>%
    group_by(n)                        %>%
    summarise(value = sum(value*5))    %>%  # multiplied because is the 
    select(n, value)
  
}



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
    select(n, value)
  
}


## SPECIFIC FUNCTIONS -------------------------------------------









