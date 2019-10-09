## NAME PARSING


## Dependencies
source("RICEx_datamng/RICEx_20_RICEclass.R")

require_package("purrr")
require_package("stringr")





## FUNCTION
# which parses gdx name and data and allocates values in a tidy list
#
parse_experiment <- function(gdx_name_with_full_path){
  



  # gdx filename isolated
  gdx_filename = sapply(strsplit(gdx_name_with_full_path, "/"), tail, 1)
  gdx_filename_noext =substr(gdx_filename, 1, nchar(gdx_filename)-4)
  

    
  ## DEBUG ##
  # gdx_filename_noext = "RICEx__v1x99__OPT__ed57__expPAP__ssp2__coopngsw__clWITCHco2__damBURKEiso3SR__savFXconv__polCBA"
  ## DEBUG ##
  
    
  # gdx infos split
  exp_infos = str_split(gdx_filename_noext, "__")[[1]]
  
  # regex for complex parsing elements
  # remember: "^" is starting, "$" is ending, "." means exact one charachter
  regex_for_regions = "^enerdata..|^ed..|^witch..|^r5$|^storcap\\w+\\d+|^global$"
  regex_for_coop    = "^coop$|^noncoop$|^coopngsw$|^cooppop$|^noncooppop$"
  
  #info parsing 
  experiment= list() 
  experiment$ssp             = exp_infos[grep( regex("^ssp\\d"),         exp_infos )]
  experiment$runtype         = exp_infos[grep( regex("^OPT$|^SIM$"),     exp_infos )]
  experiment$regions         = exp_infos[grep( regex(regex_for_regions), exp_infos )]
  experiment$macc            = exp_infos[grep( regex("^macc\\w+"),       exp_infos )]
  experiment$exp_id          = exp_infos[grep( regex("^exp\\w+"),        exp_infos )]
  experiment$version         = exp_infos[grep( regex("^v\\w+x\\w+"),     exp_infos )]
  experiment$cooperation     = exp_infos[grep( regex(regex_for_coop),    exp_infos )]
  experiment$climateMod      = exp_infos[grep( regex("^cl\\w+"),         exp_infos )]
  experiment$damageFunction  = exp_infos[grep( regex("^dam\\w+"),        exp_infos )]
  experiment$savingRate      = exp_infos[grep( regex("^sav\\w+"),        exp_infos )]
  experiment$runmode         = exp_infos[grep( regex("^run\\w+"),        exp_infos )]
  
  #data extracted in RICEx S3 class
  experiment$data            = RICEx(gdx_name_with_full_path)  
  
  
  
  return(experiment)
  
}


