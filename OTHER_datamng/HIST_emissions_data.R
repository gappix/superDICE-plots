
# if it is present a gdx in plot folder
historical_values_gdx = gdx("./OTHER_datamng/RICExdata_historical_values.gdx")



## OECD
E_hist_OECD_ny = historical_values_gdx["q_emi_valid_oecd"] %>% filter(e== "co2ffi") %>% select(-e)
# !APPLY ONLY ONCE!  conversion from Carbon to CO2
E_hist_OECD_ny$value = E_hist_OECD_ny$value * 44 /12
E_hist_OECD_ny$year = as.integer(E_hist_OECD_ny$year)



## PRIMAP 
E_hist_PRIMAP_ny  = historical_values_gdx["q_emi_valid_primap"] %>% filter(e== "co2ffi") %>% select(-e)
# !APPLY ONLY ONCE!  conversion from Carbon to CO2
E_hist_PRIMAP_ny$value = E_hist_PRIMAP_ny$value * 44 /12
E_hist_PRIMAP_ny$year  = as.integer(E_hist_PRIMAP_ny$year)


E_hist_PRIMAP_world_y = E_hist_PRIMAP_ny %>% group_by(year) %>% summarise(value=sum(value)) %>% as.data.frame()


