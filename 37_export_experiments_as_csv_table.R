source("30_sDC_experiments_central_storage.R")



experiment_id = "TBD"  # <<< SET THIS 

# NTY
temp_table_nty = experiments_load_as_table_nty(experiment_id ) %>% 
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
temp_table_ty = experiments_load_as_table_ty(experiment_id ) %>% mutate(exp_id = paste0(experiment_tag,"_",
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

output_filename = paste0(experiment_id, "_experiments_clean_data")
output_dir      = "output"

# nty

write.csv(output_table_nty, paste0(output_dir,"//",output_filename,"_nty.csv"), row.names = FALSE)


# ty

write.csv(output_table_ty, paste0(output_dir,"//",output_filename,"_ty.csv"), row.names = FALSE)

# bridge experiments

write.csv(bridge_experiment_table, paste0(output_dir,"//",experiment_id,"_experiemnt_bridge.csv"), row.names = FALSE)




## EXTRA: Experiments for bridging tables ----------------------------------------------------------------------
#///////////////////////////////////////////////////////////////////////////////////////////////////////////////

TBDexp = list()
TBDexp  =  experiments_load_as_list(TBDexp, experiment_id)


## time table

time_table_csv =  TBDexp$kaliPUMICE$enerdata56$ssp2$coop$clWITCHco2$damBURKESR$SRfix$polCBA$get_MIU_nty %>% select(t,year) %>% distinct()

#......................................
write.csv(time_table_csv, paste0(output_dir,"//","t_year_bridge.csv"), row.names = FALSE)





## mapping n - region_id - iso3

n_iso3_regid_table 



# enerdata56
rr_id = "enerdata56"
new_table = TBDexp$kaliPUMICE$enerdata56$ssp2$coop$clWITCHco2$damBURKESR$SRfix$polCBA$get_Parameter("map_n_iso3")  %>% mutate("region_key" = paste0(rr_id,"_",n))
n_iso3_regid_table = new_table

# enerdata35
rr_id = "enerdata35"
new_table = TBDexp$kaliPUMICE$enerdata35$ssp2$coop$clWITCHco2$damBURKESR$SRfix$polCBA$get_Parameter("map_n_iso3") %>% mutate("region_key" = paste0(rr_id,"_",n))
n_iso3_regid_table = rbind(n_iso3_regid_table, new_table)

# witch17
rr_id = "witch17"
new_table = TBDexp$kaliPUMICE$witch17$ssp2$coop$clWITCHco2$damBURKESR$SRfix$polCBA$get_Parameter("map_n_iso3") %>% mutate("region_key" = paste0(rr_id,"_",n))
n_iso3_regid_table =rbind(n_iso3_regid_table, new_table)


# r5
rr_id = "r5"
new_table = TBDexp$kaliPUMICE$r5$ssp2$coop$clWITCHco2$damBURKESR$SRfix$polCBA$get_Parameter("map_n_iso3")  %>% mutate("region_key" = paste0(rr_id,"_",n))
n_iso3_regid_table =rbind(n_iso3_regid_table, new_table)

# global
rr_id = "global"
new_table = TBDexp$kaliPUMICE$global$ssp2$coop$clWITCHco2$damBURKESR$SRfix$polCBA$get_Parameter("map_n_iso3") %>% mutate("region_key" = paste0(rr_id,"_",n))
n_iso3_regid_table =rbind(n_iso3_regid_table, new_table)



#......................................

write.csv(n_iso3_regid_table, paste0(output_dir,"//","n_iso3_regid_bridge.csv"), row.names = FALSE)







