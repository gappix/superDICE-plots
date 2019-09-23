source("30_sDC_experiments_central_storage.R")
library(conflicted)
conflict_prefer("filter", "dplyr")
conflict_prefer("select", "dplyr")




# NTY
temp_table_nty = central.specific_experiment.load_as_table_nty(my_gdx_with_path) %>% 
  mutate(exp_id = paste0(experiment_tag,"_",
                         regional_aggregation, "_",
                         ssp, "_",
                         cooperation, "_",
                         climate_module, "_",
                         damage_module, "_",
                         saving_rate, "_",
                         policy) ) %>% 
  mutate(reg_n_id = paste0(regional_aggregation,"_",n))


output_table_nty = temp_table_nty %>% select(-c("experiment_tag",
                                                "ssp",
                                                "regional_aggregation",
                                                "calibration_id",
                                                "cooperation",
                                                "climate_module",
                                                "damage_module",
                                                "saving_rate",
                                                "policy"))

# TY 
temp_table_ty = central.specific_experiment.load_as_table_ty(my_gdx_with_path) %>% 
  mutate(exp_id = paste0( experiment_tag,"_",
                          regional_aggregation, "_",
                          ssp, "_",
                          cooperation, "_",
                          climate_module, "_",
                          damage_module, "_",
                          saving_rate, "_",
                          policy) )

output_table_ty  =  temp_table_ty %>% select(-c("experiment_tag",
                                                "ssp",
                                                "regional_aggregation",
                                                "calibration_id",
                                                "cooperation",
                                                "climate_module",
                                                "damage_module",
                                                "saving_rate",
                                                "policy"))


## PARS
output_table_pars = central.specific_experiment.load_as_table_pars(my_gdx_with_path) %>% 
                                                      mutate(exp_id = paste0(experiment_tag,"_",
                                                                             regional_aggregation, "_",
                                                                             ssp, "_",
                                                                             cooperation, "_",
                                                                             climate_module, "_",
                                                                             damage_module, "_",
                                                                             saving_rate, "_",
                                                                             policy) )

# bridge experiments
bridge_experiment_table =  temp_table_ty %>% select( "exp_id",
                                                     "experiment_tag",
                                                     "ssp",
                                                     "regional_aggregation",
                                                     "calibration_id",
                                                     "cooperation",
                                                     "climate_module",
                                                     "damage_module",
                                                     "saving_rate",
                                                     "policy" )
#......................................

output_filename = paste0("LAST_experiment_clean_data")
output_dir      = "output"

# nty

write.csv2(output_table_nty, paste0(output_dir,"//",output_filename,"_nty.csv"), row.names = FALSE)


# ty

write.csv2(output_table_ty, paste0(output_dir,"//",output_filename,"_ty.csv"), row.names = FALSE)

# pars

write.csv2(output_table_pars, paste0(output_dir,"//",output_filename,"_pars.csv"), row.names = FALSE)

# bridge experiments

write.csv2(bridge_experiment_table, paste0(output_dir,"//","LAST_experiment_bridge.csv"), row.names = FALSE)

