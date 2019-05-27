
source("19_sDC_class.R")






tide_new_experiment = function(experiment,original_list){
  
  
  
  add_experiment_to_general_structure(  original_list = original_list,
                                        ssp           = experiment$ssp,            
                                        regions       = experiment$regions,        
                                        kali          = experiment$kali,           
                                        cooperation   = experiment$cooperation,    
                                        climateModule = experiment$climateMod,     
                                        damageModule  = experiment$damageFunction, 
                                        policy        = experiment$policy,         
                                        sDC_dataS3    = experiment$data    )
  
}




add_experiment_to_general_structure = function(original_list,
                                               kali,
                                               regions,
                                               ssp,
                                               cooperation,
                                               climateModule,
                                               damageModule,
                                               policy,
                                               sDC_dataS3){
  
  
  
  eval(parse(text = paste0('original_list',
                           '$',kali,
                           '$',regions,
                           '$',ssp,
                           '$',cooperation,
                           '$',climateModule,
                           '$',damageModule,
                           '$',policy,
                           ' <- sDC_dataS3')))
  
  original_list
  
}

