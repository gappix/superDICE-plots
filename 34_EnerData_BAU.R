
source("00_environment_setting.R")



path_macc_enerdata = "../sDC-data/enerdata/"



##  ETL OF EMISSIONS DATA     --------------------------------------------------------------
#///////////////////////////////////////////////////////////////////////////////////////////


#LOAD the Enerdata input file 
MACC_C <- tbl_df(read.csv(file.path(path_macc_enerdata, "", "macc_enerdata_caramel.csv"), header= TRUE, sep=","))


# SECTOR selection (for the moment, at least)
MACC_C = MACC_C  %>% select(-X)  %>% filter(sector=="Total_CO2")

# Check oeu presence
# MACC_C %>% filter(n=="oeu")









##  EMISSION BAU EXTRACTIONS  --------------------------------------------------------------
#///////////////////////////////////////////////////////////////////////////////////////////




EnerData57_Emissions <- MACC_C %>%
  filter(scenario == 'Ener-Blue') %>%
  filter(cost == 0) %>% # by selecting only CTAX = 0 you're retrieving 
  # the BAU baseline projection
  select(n,  year, emissions)  



rm(MACC_C)



EnerData_World_BAU = EnerData57_Emissions %>% as.data.frame() %>% group_by(year) %>% summarise(value = sum(emissions)/1000000) %>% as.data.frame()


