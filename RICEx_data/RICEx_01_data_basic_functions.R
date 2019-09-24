

## FUNCTION 
# to transform t into years (starting from 2015)
t_to_y = function(t){
  
  baseYear  = 2010
  tstep     = 5
  year      = baseYear + (t * tstep)
  
  year  }


## FUNCTION 
# to transform years (baseyear 2015) into t 
y_to_t = function(year){
  
  baseYear  = 2010
  tstep     = 5
  t =  (year - baseYear)/tstep
  
  t }



## FUNCTION 
# to transform WITCH-t into years for a better understanding
wt_to_y = function(t){
  
  baseYear  = 2000
  tstep     = 5
  year      = baseYear + (t * tstep)
  
  year  }



make_year_integer = function(df){
  df$year = as.integer(df$year)
  df
}

make_t_integer = function(df){
  df$t = as.integer(df$t)
  df
}




sanitizeISO3 = function(df){
  
  if("iso3" %in% colnames(df)){
    
    df$iso3 = toupper(df$iso3)
    df = df %>% dplyr::filter( iso3 != "ATA") %>% dplyr::filter( iso3 != "GRL")#remove anctartica and greenland
  }
  df
  
}

# FUNCTION
# to build artificially constrints point for sigma 
get_sigma_constraints = function(constraint=""){
  
  yy=""
  sig_con=""
  
  if(constraint=="100s7_250s2_300s1") {
    yy = c(2100,2250, 2300)
    sig_con = c(0.7, 0.2, 0.1) 
  }
  
  
  if(constraint=="300s1") {
    yy = c( 2300)
    sig_con = c(0.1) 
  }
  
  if(constraint=="100s7_200s2") {
    yy = c( 2100, 2200)
    sig_con = c(0.7,  0.2) 
  }
  
  if(constraint=="100s4_200s1") {
    yy = c( 2100, 2200)
    sig_con = c(0.4,  0.1) 
  }
  
  if(constraint=="100s4") {
    yy = c( 2100)
    sig_con = c(0.4) 
  }
  
  if(constraint=="100s6") {
    yy = c( 2100)
    sig_con = c(0.6) 
  }
  
  data.frame(year=yy, value=sig_con)
}

