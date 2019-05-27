source("00_environment_setting.R")


dir_data_ssp <- here("../../SSP DB/")



sspDB_all_baseline_CO2_total   <- tbl_df(read.xlsx(file.path(dir_data_ssp, "", "SSPall_Emissions_CO2_Total.xlsx"), 1)) %>% select(-Notes)
sspDB_all_baseline_CO2_ffi     <- tbl_df(read.xlsx(file.path(dir_data_ssp, "", "SSPall_Emissions_CO2_FFI.xlsx"), 1)) %>% select(-Notes)



cleanIIASAdata = function (ssp_db){
  
  # Unpivoting table with 2 new columns: 
  # cost (Policy MARGINAL Costs) and abatement (effective amount of abatement ktCO2eq)
  # MACC_6m = melt(MACC_6, id = c("Location", "Year", "Code", "Scenario", "Unit", "variable", "sector"), variable.name="cost", value.name="value")
  ssp_db = ssp_db %>% gather(Year, Value, X2005:X2100)  
  
  
  # Year column changed type (was factor, now is numeric)
  ssp_db$Year <- ssp_db$Year %>%  str_replace_all("X","")
  ssp_db$Year <- as.numeric(as.character(ssp_db$Year))

    
  # !APPLY ONLY ONCE! Conversion from MtCO2 to GtCO2
  ssp_db$Value = ssp_db$Value / 1000
  ssp_db$Unit = "Gt CO2/yr"
  
  # Final names
  ssp_db <- ssp_db %>% rename(model = Model,
                                      scenario = Scenario,
                                      region = Region,
                                      variable = Variable,
                                      unit = Unit,
                                      year = Year,
                                      value = Value)

  
}


sspDB_all_baseline_CO2_total <- cleanIIASAdata(sspDB_all_baseline_CO2_total)
sspDB_all_baseline_CO2_ffi   <- cleanIIASAdata(sspDB_all_baseline_CO2_ffi)




# 
# 
# ssp_db_pop                  <- read.csv(paste0(dir_data_ssp,"SspDb_country_data_2013-06-12.csv"))
# ssp_db_TotEmi                  <- tbl_df(read.xlsx(file.path(dir_data_ssp, "", "SSP2_Emissions_CO2_Total.xlsx"), 1)) %>% select(-Notes)
# iamc_ssp2_rcp26_Effi                <- tbl_df(read.xlsx(file.path(dir_data_ssp, "", "iamc_ssp2_rcp26_Effi.xlsx"), 1)) %>% select(-Notes)
# 
# 
# ssp_db_emi      = cleanIIASAdata()
# iamcDB_ssp2_rcp26_EFFI = cleanIIASAdata(iamc_ssp2_rcp26_Effi) %>% filter(grepl("26",scenario))
# bubba  = cleanIIASAdata(ssp_db_emi) %>% filter(grepl("26",scenario))
# 
# 
# 
# 
# 
# # Emissions from ssp
# sspDB_emi_Baseline = ssp_db_emi %>% filter(grepl("Baseline",scenario))
# 
# 
# # Emissions from RCP2.6
# ssp2_rcp26_Effi = ssp2_rcp26_Effi 
