## NAME PARSING




## Dependencies

source("000_package_retriever.R")
source("19_sDC_class.R")
require_package("purrr")
require_package("stringr")






parse_experiment <- function(gdx_name_with_full_path){
  

  # gdx filename isolated
  gdx_filename = sapply(strsplit(gdx_name_with_full_path, "/"), tail, 1)
  gdx_filename_noext =substr(gdx_filename, 1, nchar(gdx_filename)-4)
  
  #TEST#
  #gdx_filename_noext = "sunRC__witch17__kaliPUMICE__expTBD__ssp2__noncoop__clWITCHco2__damBURKESR__SRfix__polCBA"
  
  # gdx infos split
  exp_infos = str_split(gdx_filename_noext, "__")[[1]]
  
  # regex for complex parsing elements
  # remember: "^" is starting, "$" is ending, "." means exact one charachter
  regex_for_regions = "^enerdata..|^ed..|^witch..|^r5$|^storcap\\w+\\d+|^global$"
  regex_for_coop    = "^coop$|^noncoop$|^coop\\w+"
  
  #info parsing 
  experiment= list() 
  experiment$ssp             = exp_infos[grep( regex("^ssp\\d"),         exp_infos )]
  experiment$regions         = exp_infos[grep( regex(regex_for_regions), exp_infos )]
  experiment$exp_id          = exp_infos[grep( regex("^exp\\w+"),        exp_infos )]
  experiment$kali            = exp_infos[grep( regex("^kali\\w+"),       exp_infos )]
  experiment$cooperation     = exp_infos[grep( regex(regex_for_coop),    exp_infos )]
  experiment$climateMod      = exp_infos[grep( regex("^cl\\w+"),         exp_infos )]
  experiment$damageFunction  = exp_infos[grep( regex("^dam\\w+"),        exp_infos )]
  experiment$savingRate      = exp_infos[grep( regex("^sav\\w+"),         exp_infos )]
  experiment$policy          = exp_infos[grep( regex("^pol\\w+"),        exp_infos )]
  
  #data extracted in SuperDICE S3 class
  experiment$data            = SuperDICE(gdx_name_with_full_path)  
  
  
  
  return(experiment)
  
}


