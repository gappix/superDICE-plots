
source("RICEx_datamng/RICEx_20_RICExclass.R")



# Variables to put in result table (WATCH OUT COMPLEXITY GROWTH!)

nty_variables_to_extract = c("ABATECOST","C","DAMAGES","DAMFRAC",
                             "E","EIND","I","K","S","Y","YGROSS","pop","scc") #nty parameter here as well

ty_variables_to_extract  = c("TATM")


parameters_to_extract = c("dk","elasmu","prstp")





## TIDE NEW EXPERIMENT AS LIST   -----

tide_new_experiment_as_list = function(experiment,original_list){
  
  
  
  add_experiment_to_general_structure(  original_list = original_list,
                                        ssp           = experiment$ssp, 
                                        runtype       = experiment$runtype,
                                        regions       = experiment$regions,        
                                        version       = experiment$version,  
                                        macc          = experiment$macc,
                                        cooperation   = experiment$cooperation,    
                                        climateModule = experiment$climateMod,     
                                        damageModule  = experiment$damageFunction, 
                                        savingRate    = experiment$savingRate,
                                        runmode       = experiment$runmode,  
                                        welfare       = experiment$welfare, 
                                        RICEx_S3data  = experiment$data    )
  
}




## TIDE EXPERIMENT AS TABLE   -------------------------------------------------------------
#///////////////////////////////////////////////////////////////////////////////////////////




#
# Extract both nty and ty variables
#
tide_new_experiment_as_table = function(experiment,
                                        experiment_id = experiment$exp_id){
  
  
  
  #TEST#:::::::::::
  #experiment = exp_data_and_info
  
  
  #create new table
  new_table = data.table(
             experiment_tag        = experiment_id,
             ssp                   = experiment$ssp,  
             runtype               = experiment$runtype,
             regional_aggregation  = experiment$regions,        
             model_version         = experiment$version,           
             cooperation           = experiment$cooperation,
             macc                  = experiment$macc,
             climate_module        = experiment$climateMod,     
             damage_module         = experiment$damageFunction, 
             saving_rate           = experiment$savingRate,
             welfare               = experiment$welfare, 
             runmode               = experiment$runmode        
             )
  # initialize n-t-y-dimensions with a null-by merge (MIU is one good choice)
  new_table = merge.data.frame(new_table,
                               experiment$data$get_VARIABLE_nty("MIU"), 
                               by= NULL )  %>% rename(MIU = value)
  
  
  
  # Add nty-dependent variables
  
  for(nty_var in  nty_variables_to_extract ) {
    
    #TEST#
    #nty_var = nty_variables_to_extract[2]
    
    new_table = add_nty_variable_to_table(new_table,
                                          experiment$data,
                                          nty_var)
  }
  
  # Add ty-dependent variables
  
  for(ty_var in   ty_variables_to_extract ) {
    new_table = add_ty_variable_to_table(new_table,
                                         experiment$data,
                                         ty_var)
  }
  
  
  # Add extra aggregated variables

  new_table = new_table %>% 
    
    #WORLD_Emissions
    merge.data.frame(experiment$data$get_world_EMItot_ty,    
                     by= c("t","year") )  %>% rename("WORLD_E" = value)
  
  
  
  # Return it
  
  return(new_table)
  
}






#
# Extracting nty variables only
#
tide_new_experiment_as_table_nty = function(experiment,
                                            experiment_id = experiment$exp_id){
  
  
  
  #TEST#
  #experiment = exp_data_and_info
  
  
  #create new table
  new_table = data.table(
    experiment_tag        = experiment_id,
    runtype               = experiment$runtype,
    ssp                   = experiment$ssp,  
    regional_aggregation  = experiment$regions,        
    model_version         = experiment$version,           
    cooperation           = experiment$cooperation, 
    macc                  = experiment$macc,
    climate_module        = experiment$climateMod,     
    damage_module         = experiment$damageFunction, 
    saving_rate           = experiment$savingRate,
    welfare               = experiment$welfare, 
    runmode               = experiment$runmode        
  )
  
  # initialize n-t-y-dimensions with a null-by merge (MIU is one good choice)
  new_table = data.frame(cbind(new_table, as.data.frame(experiment$data$get_VARIABLE_nty("MIU"))) %>% rename(MIU = value))

  
  
  # Add nty-dependent variables
  
  for(nty_var in  nty_variables_to_extract ) {
    
    #TEST#
    #bubba = new_table
    #nty_var = nty_variables_to_extract[2]
    
    if(length(nty_var) >0){
      new_table = add_nty_variable_to_table(as.data.frame(new_table), experiment$data,nty_var)
    }
    
  }
  
  
  # Return it
  
  return(new_table)
  
}



#
# Extract ty variables only
#
tide_new_experiment_as_table_ty <-  function(experiment,
                                             experiment_id = experiment$exp_id){
  
  
  
  #TEST#
  #experiment = exp_data_and_info
  
  
  #create new table
  new_table = data.table(
    experiment_tag        = experiment_id,
    runtype               = experiment$runtype,
    ssp                   = experiment$ssp,            
    regional_aggregation  = experiment$regions,        
    model_version         = experiment$version,           
    cooperation           = experiment$cooperation, 
    macc                  = experiment$macc,
    climate_module        = experiment$climateMod,     
    damage_module         = experiment$damageFunction, 
    saving_rate           = experiment$savingRate,
    welfare               = experiment$welfare, 
    runmode               = experiment$runmode        
  )
  # initialize t-y-dimensions with a null-by merge (WORLD_E is one good choice)
  new_table = cbind(new_table, as.data.frame(experiment$data$get_world_EMItot_ty)) %>% rename(WORLD_E = value)
  
  
  
  # Add ty-dependent variables
  
  for(ty_var in   ty_variables_to_extract ) {
    new_table = add_ty_variable_to_table(new_table,
                                         experiment$data,
                                         ty_var)
  }
  
  
  # Add extra aggregated variables
  
  # new_table = new_table %>% 
  #   
  #   #WORLD_Emissions
  #   merge.data.frame(experiment$data$get_WORLD_EmissionsTOT_ty,    
  #                    by= c("t","year") ) %>% rename("WORLD_E" = value)
  
  
  
  # Return it
  
  return(new_table)
  
}





#
# Extract parameters only
#
tide_new_experiment_as_table_pars <-  function(experiment,
                                               experiment_id = experiment$exp_id){
  
  
  
  #TEST#
  #experiment = exp_data_and_info
  
  
  #create new table
  new_table = data.table(
    experiment_tag        = experiment_id,
    runtype               = experiment$runtype,
    ssp                   = experiment$ssp, 
    regional_aggregation  = experiment$regions,        
    model_version         = experiment$version,           
    cooperation           = experiment$cooperation, 
    macc                  = experiment$macc,
    climate_module        = experiment$climateMod,     
    damage_module         = experiment$damageFunction, 
    saving_rate           = experiment$savingRate,
    welfare               = experiment$welfare, 
    runmode               = experiment$runmode        
  )
  
  
  
  
  # Add single-value parameters
  
  for(par in  parameters_to_extract ) {
    
    par_value = experiment$data$get_PARAMETER(parameter_name = par)
    
    if(length(rownames(par_value)) > 0){   new_table[ , eval(par) := as.numeric(par_value[1])  ]
    } else {
      new_table[ , eval(par) := "NA"] 
    }
  } #end for

  
  
  # Return it
  return(new_table)
  
}


















## ADD EXPERIMENT TO  LIST  STRUCTURE  -----------------------------------------------------
#///////////////////////////////////////////////////////////////////////////////////////////

add_experiment_to_general_structure = function(original_list,
                                               version,
                                               runtype,
                                               macc,
                                               regions,
                                               ssp,
                                               cooperation,
                                               climateModule,
                                               damageModule,
                                               savingRate,
                                               welfare,
                                               runmode,
                                               RICEx_S3data){
  
 if(length( version       ) < 1) { version       = "UNKvers"         }
 if(length( runtype       ) < 1) { runtype       = "UNKruntype"      }
 if(length( macc          ) < 1) { macc          = "UNKmacc"         }
 if(length( regions       ) < 1) { regions       = "UNKregions"      }
 if(length( ssp           ) < 1) { ssp           = "UNKssp"          }
 if(length( cooperation   ) < 1) { cooperation   = "UNKcooperation"  }
 if(length( climateModule ) < 1) { climateModule = "UNKclimateModule"}
 if(length( damageModule  ) < 1) { damageModule  = "UNKdamageModule" }
 if(length( savingRate    ) < 1) { savingRate    = "UNKsavingRate"   }
 if(length( welfare       ) < 1) { welfare       = "UNKwelfare"      }
 if(length( runmode       ) < 1) { runmode       = "UNKrunmode"      }
  
  eval(parse(text = paste0('original_list',
                           '$',version,
                           '$',runtype,
                           '$',regions,
                           '$',ssp,
                           '$',cooperation,
                           '$',macc,
                           '$',climateModule,
                           '$',damageModule,
                           '$',welfare,
                           '$',savingRate,
                           '$',runmode,
                           ' <- RICEx_S3data')))
  
  original_list
  
}




## ADD VARIABLES TO TABLE STRUCTURE  -----------------------------------------------------
#///////////////////////////////////////////////////////////////////////////////////////////


#
# ADD NTY Variables
#
add_nty_variable_to_table <- function(my_table, RICEx_S3data,  variable_name_nty){
  
  #TEST.......
  #my_table = new_table
  #RICEx_S3data = experiment$data
  #variable_name_nty = nty_var
  
  new_df = RICEx_S3data$get_VARIABLE_nty(variable_name_nty)
  
  
  if(length(rownames(new_df)) > 0){

    my_table = merge.data.frame(my_table, new_df, by= c("t","n","year") ) %>% 
      rename(!!variable_name_nty := value)  
    
  } else {
    
    my_table = my_table %>% mutate(!!variable_name_nty := 0) 
    
  }
  

  return(my_table)
  
}






#
# ADD TY Variables
#
add_ty_variable_to_table <- function(my_table, RICEx_S3data,  variable_name_ty){
  
  new_df = RICEx_S3data$get_VARIABLE_ty(variable_name_ty)
  
  
  if(length(rownames(new_df)) > 0){
    
    my_table = merge.data.frame(my_table, new_df, by= c("t","year") ) %>% 
      rename(!!variable_name_ty := value)  
    
  } else {
    
    my_table = my_table %>% mutate(!!variable_name_ty := 0) 
    
  }
  
  return(my_table)
  
}
