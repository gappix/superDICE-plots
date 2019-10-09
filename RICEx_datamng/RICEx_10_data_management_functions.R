# Dependencies 
source("RICEx_utils/RICEx_00_package_retriever.R")
source("RICEx_datamng/RICEx_01_data_basic_functions.R")

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
    dplyr::select(n, value)            %>%
    as.data.frame()
  
}



getGDX_Variable_WORLDagg_ntyTOty <- function( variable_name, 
                                              gdx_file,
                                              year_start = 0,
                                              year_limit = 2300 ) {

    
    VAR_nty =  getGDX_Variable_nty(variable_name, gdx_file, year_start,year_limit)
    VAR_ty  =  WORLDaggr_ntyTOty(VAR_nty)
    
    return(VAR_ty)

}



getGDX_Parameter_WORLDagg_ntyTOty <- function(  parameter_name, 
                                                gdx_file,
                                                year_start = 0,
                                                year_limit = 2300 ) {

    
    PAR_nty =  getGDX_Parameter_nty(parameter_name, gdx_file, year_start,year_limit)
    PAR_ty  =  WORLDaggr_ntyTOty(PAR_nty)
    
    return(PAR_ty)

}

## -------------:  DISAGGREGATING FUNCTIONS :-----------------------


  getGDX_Variable_dsagg_ntyTOiso3ty <- function(   variable_name, 
                                                   gdx_file,
                                                   year_start = 0,
                                                   year_limit = 2300 ){
      
      d_n = getGDX_Variable_nty(variable_name, gdx_file, year_start,year_limit)
      map_n_iso3 = getGDX_Parameter(gdx_file,"map_n_iso3")
      iso3_variable = merge(map_n_iso3,d_n,by=c("n")) %>% sanitizeISO3()
      return(iso3_variable)
  }




  getGDX_Parameter_dsagg_ntyTOiso3ty <- function(  parameter_name, 
                                                   gdx_file,
                                                   year_start = 0,
                                                   year_limit = 2300 ){
      
      d_n = getGDX_Parameter_nty(parameter_name, gdx_file, year_start,year_limit)
      map_n_iso3 = getGDX_Parameter(gdx_file,"map_n_iso3")
      iso3_parameter = merge(map_n_iso3,d_n,by=c("n")) %>% sanitizeISO3()
      return(iso3_parameter)
  }














