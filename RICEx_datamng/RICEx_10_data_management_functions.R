# Dependencies 
source("RICEx_utils/RICEx_00_package_retriever.R")
source("RICEx_datamng/RICEx_01_data_basic_functions.R")

require_package("dplyr")



## ------------------- NEW FUNCTIONS ----------------------



getGDX_Parameter<- function(gdx_file, 
                            parameter_name, 
                            unit = NULL){
  
  mypar = gdx_file[as.character(parameter_name)] 
  
  if(is.null(unit)){return(mypar)}
  else{return(mypar %>% mutate(unit = unit))}
}





getGDX_Variable<- function(gdx_file, 
                           variable_name, 
                           unit = NULL){
  
  myvar = gdx_file[as.character(variable_name)] 
  
  if(is.null(unit)){return(myvar)}
  else{return(myvar %>% mutate("unit" = unit))}
  
}




getGDX_Variable_nty <- function(  variable_name,
                                  gdx_file,
                                  year_start = 0,
                                  year_limit = 2300,
                                  unit = NULL
                                ){
  
  myvar = gdx_file[as.character(variable_name)] %>% 
    mutate(year = t_to_y(as.integer(t))) %>%
    make_t_integer() %>%
    make_year_integer() %>%
    sanitizeISO3() %>%
    dplyr::filter(year >= year_start) %>%
    dplyr::filter(year <= year_limit)
  
  
  if(is.null(unit)){return(myvar)}
  else{return(myvar %>% mutate(unit = unit))}
  
}



getGDX_Variable_ty <- function( variable_name,
                                gdx_file,
                                year_start = 0,
                                year_limit = 2300,
                                unit = NULL
                              ){
  
  myvar = gdx_file[as.character(variable_name)] %>%    
    mutate(year = t_to_y(as.integer(t)) ) %>% 
    make_t_integer() %>%
    make_year_integer() %>%
    dplyr::filter(year >= year_start) %>%
    dplyr::filter(year <= year_limit)
  
  
  if(is.null(unit)){return(myvar)}
  else{return(myvar %>% mutate("unit" = unit))}

}



getGDX_Parameter_nty <- function(   parameter_name,
                                    gdx_file,
                                    year_start = 0,
                                    year_limit = 2300,
                                    unit = NULL
                                ){
  
         getGDX_Variable_nty( variable_name = parameter_name,
                              gdx_file,
                              year_start,
                              year_limit,
                              unit
                            )  
}



getGDX_Parameter_ty <- function(  parameter_name,
                                  gdx_file,
                                  year_start = 0,
                                  year_limit = 2300,
                                  unit = NULL
                                ){
  
         getGDX_Variable_ty(  variable_name = parameter_name,
                              gdx_file,
                              year_start,
                              year_limit,
                              unit
                            ) 
}



## -------------:  AGGREGATING FUNCTIONS :-----------------------


getGDX_Variable_CUML5y_n <- function(variable_name,
                                gdx_file,
                                unit = NULL,
                                year_start = 0,
                                year_limit=2300){
  
 myvar =getGDX_Variable_nty(  variable_name,
                              gdx_file,
                              year_start,
                              year_limit   )   %>%
            group_by(n)                        %>%
            summarise(value = sum(value*5))    %>%  # multiplied because is the 
            dplyr::select(n, value)            %>%
            as.data.frame()
  
  
  if(is.null(unit)){return(myvar)}
  else{return(myvar %>% mutate("unit" = unit))}
  
}



getGDX_Variable_WORLDagg_ntyTOty <- function( variable_name, 
                                              gdx_file,
                                              unit = NULL,
                                              year_start = 0,
                                              year_limit = 2300 ) {

    
    VAR_nty =  getGDX_Variable_nty(variable_name, gdx_file, year_start,year_limit)
    VAR_ty  =  WORLDaggr_ntyTOty(VAR_nty)
    
    if(is.null(unit)){return(VAR_ty)}
    else{return(VAR_ty %>% mutate("unit" = unit))}
    

}



getGDX_Parameter_WORLDagg_ntyTOty <- function(  parameter_name, 
                                                gdx_file,
                                                unit = NULL,
                                                year_start = 0,
                                                year_limit = 2300 ) {

    
    PAR_nty =  getGDX_Parameter_nty(parameter_name, gdx_file, year_start,year_limit)
    PAR_ty  =  WORLDaggr_ntyTOty(PAR_nty)
    
    if(is.null(unit)){return(PAR_ty)}
    else{return(PAR_ty %>% mutate("unit" = unit))}

}

## -------------:  DISAGGREGATING FUNCTIONS :-----------------------


  getGDX_Variable_dsagg_ntyTOiso3ty <- function(   variable_name, 
                                                   gdx_file,
                                                   unit = NULL,
                                                   year_start = 0,
                                                   year_limit = 2300 ){
      
      d_n = getGDX_Variable_nty(variable_name, gdx_file, year_start,year_limit)
      map_n_iso3 = getGDX_Parameter(gdx_file,"map_n_iso3")
      iso3_variable = merge(map_n_iso3,d_n,by=c("n")) %>% sanitizeISO3()
      
      if(is.null(unit)){return(iso3_variable)}
      else{return(iso3_variable %>% mutate("unit" = unit))}

  }




  getGDX_Parameter_dsagg_ntyTOiso3ty <- function(  parameter_name, 
                                                   gdx_file,
                                                   unit = NULL,
                                                   year_start = 0,
                                                   year_limit = 2300 ){
      
      d_n = getGDX_Parameter_nty(parameter_name, gdx_file, year_start,year_limit)
      map_n_iso3 = getGDX_Parameter(gdx_file,"map_n_iso3")
      iso3_parameter = merge(map_n_iso3,d_n,by=c("n")) %>% sanitizeISO3()
      
      if(is.null(unit)){return(iso3_parameter)}
      else{return(iso3_parameter %>% mutate("unit" = unit))}
  }














