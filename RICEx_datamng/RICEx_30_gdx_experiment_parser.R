## NAME PARSING


## Dependencies
source("RICEx_datamng/RICEx_20_RICExclass.R")

require_package("purrr")
require_package("stringr")








## FUNCTION
# which parses gdx name and data and allocates values in a tidy list
#
parse_experiment <- function(gdx_name_with_full_path){
  

  ## SANITIZATION SUB-FUNCTION
  # to interpret and expand onfiguration parsed and make them human-readable
  sanitize_runtype <- function(mystring){
    
    if(length(mystring) < 1) return(mystring) # empty value
    
    if((mystring=='OPT') || (mystring=='OP')){return("OPTIM")}
    else{return("SIMUL")}
  }
  
  sanitize_macc <- function(mystring){
    
    if(length(mystring) < 1) return(mystring) # empty value
    if(length(grep("mcED", mystring)) > 0 ){
      
      if(length(grep('pwr', mystring)) > 0 )  return("macc_EnerData_powerfit")
      if(length(grep('fxp', mystring)) > 0 )  return("macc_EnerData_fxpowerfit")
      if(length(grep('cqu', mystring)) > 0 )  return("macc_EnerData_colfquadfit")
      if(length(grep('exp', mystring)) > 0 )  return("macc_EnerData_expfit")
    } 
    if(length(grep("mcDICE", mystring)) > 0 ) return("macc_DICE2016")
    #default/no match case
    return(mystring)
  }
  
  sanitize_coop <- function(mystring){
    
    if(length(mystring) < 1) return(mystring) # empty value
    if(mystring=='coop'    | mystring=='cooppop' )                           return('coop_pop')
    if(mystring=='noncoop' | mystring=='noncooppop' | mystring=='nocooppop') return('noncoop_pop')
    if(mystring=='coopngsw'  )                                               return('coop_negishi') 
    #default/no match case
    return(mystring)
  }
  sanitize_climate <- function(mystring){
    
    if(length(mystring) < 1) return(mystring) # empty value
    if(toupper(mystring) =='CLWOGHG') return('climate_WITCHoghg')
    if(toupper(mystring) =='CLWCO2' ) return('climate_WITCHco2')
    if(toupper(mystring) =='CLSIMP' ) return('climate_SimpleClimate') 
    if(toupper(mystring) =='CLDCE16') return('climate_DICE2016') 
    #default/no match case
    return(mystring)
  }
  
  sanitize_damages <- function(mystring){
    
    if(length(mystring) < 1) return(mystring) # empty value
    if(length(grep("dmBK", mystring)) > 0 ) return(paste0("damages_BURKE",str_split(mystring, "dmBK")[[1]][2]))
    #default/no match case
    return(paste0("damages_",str_split(mystring, "dm")[[1]][2]))
  }
  
  sanitize_savings <- function(mystring){
    if(length(mystring) < 1) return(mystring) # empty value

    if(toupper(mystring) =='SVFXFIX')  return('savings_fixed_2015')
    if(toupper(mystring) =='SVFXCNV' ) return('savings_fixed_converging')
    if(toupper(mystring) =='SVFXDCE' ) return('savings_fixed_DICEoptim') 
    if(toupper(mystring) =='SVMOB')    return('savings_free') 
    #default/no match case
    return(mystring)
  }
  sanitize_runmode <- function(mystring){
    
    if(length(mystring) < 1) return(mystring) # empty value
    if(toupper(mystring) =='RRBAU')     return('BAU')
    if(toupper(mystring) =='RRBAUDAM')  return('BAUdam')
    if(toupper(mystring) =='RRCBA' )    return('CBA')
    if(length(grep("rrCTX", mystring)) > 0 ) return(paste0("CTAX",str_split(mystring, "rrCTX")[[1]][2]))
    if(length(grep("rrCEA", mystring)) > 0 ) return(paste0("CEA", str_split(mystring, "rrCEA")[[1]][2]))
    #default/no match case
    return(mystring)
  }
  
  sanitize_version <- function(mystring){ 
    
    if(length(mystring) < 1) return(mystring) # empty value
    #turn it into a string
    return(paste0("v",mystring))
  }
  
  sanitize_welfare <- function(mystring){ 
    
    if(length(mystring) < 1) return(mystring) # empty value
    
    if(toupper(mystring) =='WFDCE' ) return('welfare_DICE') 
    if(toupper(mystring) =='WFDIS')  return('welfare_disentangled')
    #default/no match case
    return(mystring)
  }

  



  # gdx filename isolated
  gdx_filename = sapply(strsplit(gdx_name_with_full_path, "/"), tail, 1)
  gdx_filename_noext =substr(gdx_filename, 1, nchar(gdx_filename)-4)
  

    
  ## DEBUG ##
  #gdx_filename_noext = "RICEx_0x100_exPBLs1_OP_ed57_ssp2_cooppop_mcEDpwr_clWco2_dmBKnSR_svFXcnv_wfDIS_rrCBA_xxBUBBA"
  ## DEBUG ##
  
  
  basename = str_split(gdx_filename_noext, "_xx")[[1]][1]
  variant  = str_split(gdx_filename_noext, "_xx")[[1]][2]
  
    
  
  # gdx infos split
  exp_infos = str_split(basename, "_")[[1]]
  
  # regex for complex parsing elements
  # remember: "^" is starting, "$" is ending, "." means exact one charachter
  regex_for_version = "^v\\w+x\\w+|^\\d+x\\d+"
  regex_for_regions = "^enerdata..|^ed..|^witch..|^r5$|^storcap\\w+\\d+|^global$"
  regex_for_coop    = "^coop$|^noncoop$|^coopngsw$|^cooppop$|^noncooppop$|^nocooppop$"
  regex_for_runtype = "^OPT$|^SIM$|^OP$|^SM$"
  regex_for_macc    = "^macc\\w+|^mc\\w+"
  regex_for_expid   = "^exp\\w+|^ex\\w+"
  regex_for_damages = "^dam\\w+|^dm\\w+"   
  regex_for_savings = "^sav\\w+|^sv\\w+"
  regex_for_runmode = "^run\\w+|^rr\\w+"
  regex_for_climate = "^cl\\w+"
  regex_for_baseline= "^ssp\\d"
  regex_for_welfare = "^wf\\w+"
  

  #info parsing 
  experiment= list() 
  experiment$ssp             =                   exp_infos[grep( regex(regex_for_baseline),exp_infos )]
  experiment$runtype         = sanitize_runtype( exp_infos[grep( regex(regex_for_runtype), exp_infos )] )
  experiment$regions         =                   exp_infos[grep( regex(regex_for_regions), exp_infos )]
  experiment$macc            = sanitize_macc(    exp_infos[grep( regex(regex_for_macc),    exp_infos )] )
  experiment$exp_id          =                   exp_infos[grep( regex(regex_for_expid),   exp_infos )]
  experiment$version         = sanitize_version( exp_infos[grep( regex(regex_for_version), exp_infos )] )
  experiment$cooperation     = sanitize_coop(    exp_infos[grep( regex(regex_for_coop),    exp_infos )] )
  experiment$climateMod      = sanitize_climate( exp_infos[grep( regex(regex_for_climate), exp_infos )] )
  experiment$damageFunction  = sanitize_damages( exp_infos[grep( regex(regex_for_damages), exp_infos )] )
  experiment$savingRate      = sanitize_savings( exp_infos[grep( regex(regex_for_savings), exp_infos )] )
  experiment$runmode         = sanitize_runmode( exp_infos[grep( regex(regex_for_runmode), exp_infos )] )
  experiment$welfare         = sanitize_welfare( exp_infos[grep( regex(regex_for_welfare), exp_infos )] )
  
  # if exeriment has variant string, append it to runmode info
  if(!is.na(variant)){
    experiment$runmode  = paste0(experiment$runmode,"__", variant) 
  } 
  
  
  
  #data extracted in RICEx S3 class
  experiment$data            = RICEx(gdx_name_with_full_path)  
  
  
  
  return(experiment)
  
}


