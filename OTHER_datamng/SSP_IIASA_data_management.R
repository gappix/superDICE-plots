
source("RICEx_utils/RICEx_00_package_retriever.R")
require_package("purrr")
require_package("stringr")
require_package("xlsx")
require_package("tidyr")
#conflict_prefer("select", "dplyr")
dir_data_ssp <- here("../RICEx-Data/ssp/")



xlsx_sspDB_all_baseline_CO2_total           <- tbl_df(read.xlsx(file.path(dir_data_ssp, "", "SSPall_Emissions_CO2_Total.xlsx"), 1)) %>% select(-Notes) %>% as.data.frame()
xlsx_sspDB_all_baseline_CO2_ffi             <- tbl_df(read.xlsx(file.path(dir_data_ssp, "", "SSPall_Emissions_CO2_FFI.xlsx"), 1)) %>% select(-Notes) %>% as.data.frame()
xlsx_sspDB_all_regions_baseline_CO2_ffi     <- tbl_df(read.xlsx(file.path(dir_data_ssp, "", "SSPall_Regions_Emissions_CO2_FFI.xlsx"), 1)) %>% select(-Notes)

csv_sspDB_IAM_native_regions_CO2_ffi        <- tbl_df(read.csv(file.path(dir_data_ssp, "", "SSP_IAM_native_regions_2018-02-19.csv"), 1))          %>%  # HEAVY!
                                                  filter(VARIABLE == "Emissions|CO2|Fossil Fuels and Industry")                                  %>% 
                                                  rename(Model = MODEL, Scenario = SCENARIO, Region = REGION, Variable = VARIABLE, Unit = UNIT)  %>% 
                                                  as.data.frame()
                                                
xlsx_sspDB_total_forcing           <- tbl_df(read.xlsx(file.path(dir_data_ssp, "", "SSPworld_total_forcing.xlsx"), 1)) %>% select(-Notes) %>% as.data.frame()


## FUNCTION 
# to clean up data
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
  
  
  # Apply substitution in regions (it appies only for Regional SSPs data)
  ssp_db$Region <- factor(unlist(ssp_db$Region %>% lapply(function(x){gsub("\\.2","",tolower(x))})))
  
  
  # Final names
  ssp_db <- ssp_db %>% 
    rename( model = Model,
            scenario = Scenario,
            region = Region,
            variable = Variable,
            unit = Unit,
            year = Year,
            value = Value) %>% 
    mutate(ssp = str_extract(tolower(scenario), "ssp\\d"))
  
  
  
  
  
  ssp_db = ssp_db[!is.na(ssp_db$value), ] %>% as.data.frame()
  
  # some transformation (for GCAM regions mainly)
  ssp_db$region = ssp_db$region%>% 
                    str_replace_all(" ","_") %>%
                    str_replace_all("-","_") 
    
  ssp_db 
  
}



# data tied by applying former function
sspDB_all_baseline_CO2_total       <- cleanIIASAdata(xlsx_sspDB_all_baseline_CO2_total)
sspDB_all_baseline_CO2_ffi         <- cleanIIASAdata(xlsx_sspDB_all_baseline_CO2_ffi)
sspDB_r5regions_baseline_CO2_ffi   <- cleanIIASAdata(xlsx_sspDB_all_regions_baseline_CO2_ffi)
sspDB_IAM_native_regions_CO2_ffi   <- cleanIIASAdata(csv_sspDB_IAM_native_regions_CO2_ffi)

sspDB_total_forcing                <- cleanIIASAdata(xlsx_sspDB_total_forcing) %>% mutate(value = value*1000)%>% mutate(unit = "W/m2")

# check dataframe classes are correct
#sapply(sspDB_r5regions_baseline_CO2_ffi, class)






##-------------------:   WORLD MEDIAN   :---------------------------------


ssp_CO2_ffi_median = sspDB_all_baseline_CO2_ffi %>%
  filter(year >=2015) %>%
  select(model,ssp, year, value) %>%
  group_by(ssp, year)  %>%
  summarise(value = median(value)) %>%
  mutate(t = (year - 2010)/5 ) %>%
  as.data.frame()%>%
  select(ssp,t,value)




##-------------------:  NORMALIZED MEDIAN   :----------------------------


#View(sspDB_r5regions_baseline_CO2_ffi)


# 2015 as linear interpolation of 2020 and 2010

r5_2010_emi = sspDB_r5regions_baseline_CO2_ffi %>% filter(year == 2010) %>% rename(y2010 =value) %>% select(-year)
r5_2020_emi = sspDB_r5regions_baseline_CO2_ffi %>% filter(year == 2020) %>% rename(y2020 =value) %>% select(-year)

r5_2015_emi = r5_2020_emi %>% 
  merge(r5_2010_emi, by = c("model", "scenario","region","variable","unit","ssp")) %>% 
  mutate(value2015 = ((y2020 + y2010)/2)) %>% 
  select(-c("y2020","y2010"))


# emissions normalized by dividing their 2015-level

sspDB_r5regions_nomalized_CO2_ffi = sspDB_r5regions_baseline_CO2_ffi %>%
  merge(r5_2015_emi,by = c("model", "scenario","region","variable","unit","ssp")) %>%
  mutate(value = value/value2015) %>% 
  select(-value2015)



# median across all models

sspDB_r5regions_normalized_median_CO2_ffi = sspDB_r5regions_nomalized_CO2_ffi %>%
  filter(year >=2015) %>%
  select(model, region, scenario, year, value, ssp) %>% 
  group_by(region, scenario, year, ssp)  %>%
  summarise(value = median(value)) %>% 
  mutate(t = (year - 2010)/5 ) %>%
  mutate(ssp = tolower(str_split(scenario, "-")[[1]][1])) %>%
  as.data.frame()%>%
  rename(r5 = region) %>%
  select(ssp,r5,t,value) 




## -----------------  WORLD MARKER   ----------------------------

ssp_world_markers_CO2_ffi <- sspDB_all_baseline_CO2_ffi %>%
  filter(year >=2015) %>%
  mutate(t = (year - 2010)/5 ) %>%
  filter(    (model == "IMAGE"            & scenario == "SSP1-Baseline") | 
             (model == "MESSAGE-GLOBIOM"  & scenario == "SSP2-Baseline") | 
             (model == "AIM/CGE"          & scenario == "SSP3-Baseline") |
             (model == "GCAM4"            & scenario == "SSP4-Baseline") |
             (model == "REMIND-MAGPIE"    & scenario == "SSP5-Baseline")
           
  )  %>%
  select(ssp,t,value) %>%
  as.data.frame()







## ----------------:  R5 MARKER  :--------------------------




ssp_r5_markers_CO2_ffi <- sspDB_r5regions_baseline_CO2_ffi %>%
  filter(year >=2015) %>%
  mutate(t = (year - 2010)/5 ) %>%
  filter(    (model == "IMAGE"            & scenario == "SSP1-Baseline") | 
             (model == "MESSAGE-GLOBIOM"  & scenario == "SSP2-Baseline") | 
             (model == "AIM/CGE"          & scenario == "SSP3-Baseline") |
             (model == "GCAM4"            & scenario == "SSP4-Baseline") |
             (model == "REMIND-MAGPIE"    & scenario == "SSP5-Baseline")
           
  )  %>%
  rename( r5 = region )  %>%
  select(ssp,r5,t,value) %>%
  as.data.frame()




## ----------------:  R5 MARKER NORMALIZED  :--------------------------

#/!\ DEPEDENCY:   sspDB_r5regions_nomalized_CO2_ffi 

ssp_r5_markers_normalized_CO2_ffi <- sspDB_r5regions_nomalized_CO2_ffi %>%
  filter(year >=2015) %>%
  mutate(t = (year - 2010)/5 ) %>%
  filter(    (model == "IMAGE"            & scenario == "SSP1-Baseline") | 
             (model == "MESSAGE-GLOBIOM"  & scenario == "SSP2-Baseline") | 
             (model == "AIM/CGE"          & scenario == "SSP3-Baseline") |
             (model == "GCAM4"            & scenario == "SSP4-Baseline") |
             (model == "REMIND-MAGPIE"    & scenario == "SSP5-Baseline")
           
  )  %>%
  rename( r5 = region )  %>%
  select(ssp,r5,t,value) %>%
  as.data.frame()





## ----------------: NATIVE REGIONS MARKERS :--------------------------

# SSP1

sspDB_ssp1_native_regions_CO2_ffi  <- sspDB_IAM_native_regions_CO2_ffi %>%
  filter(year >=2010) %>%
  mutate(t = (year - 2010)/5 ) %>%
  filter(    (model == "IMAGE") & grepl("SSP1-Ref", scenario)) %>%
  rename( nssp1 = region )  %>%
  select(ssp,nssp1,t,value) %>%
  as.data.table()  
# interpolation to add values
sspDB_ssp1_native_regions_CO2_ffi = sspDB_ssp1_native_regions_CO2_ffi[,approx(t,value, xout = c(0:18)), by = nssp1] %>% 
  rename(t = x, value = y)



# SSP2

sspDB_ssp2_native_regions_CO2_ffi  <- sspDB_IAM_native_regions_CO2_ffi  %>%
  filter(year >=2010) %>%
  mutate(t = (year - 2010)/5 ) %>%
  filter(    (model == "MESSAGE-GLOBIOM") & grepl("SSP2-Ref", scenario)) %>%
  rename( nssp2 = region )  %>%
  select(ssp,nssp2,t,value) %>%
  as.data.table()
# interpolation to add values
sspDB_ssp2_native_regions_CO2_ffi = sspDB_ssp2_native_regions_CO2_ffi[,approx(t,value, xout = c(0:18)), by = nssp2] %>% 
  rename(t = x, value = y)


# SSP3

sspDB_ssp3_native_regions_CO2_ffi  <- sspDB_IAM_native_regions_CO2_ffi %>%
  filter(year >=2010) %>%
  mutate(t = (year - 2010)/5 ) %>%
  filter(    (model == "AIM/CGE") & grepl("SSP3-Ref", scenario)) %>%
  rename( nssp3 = region )  %>%
  select(ssp,nssp3,t,value) %>%
  as.data.table()
# interpolation to add values
sspDB_ssp3_native_regions_CO2_ffi = sspDB_ssp3_native_regions_CO2_ffi[,approx(t,value, xout = c(0:18)), by = nssp3] %>% 
  rename(t = x, value = y)


# SSP4

sspDB_ssp4_native_regions_CO2_ffi   <- sspDB_IAM_native_regions_CO2_ffi %>%
  filter(year >=2010) %>%
  mutate(t = (year - 2010)/5 ) %>%
  filter(    (model == "GCAM4") & grepl("SSP4-Ref", scenario)) %>%
  rename( nssp4 = region )  %>%
  select(ssp,nssp4,t,value) %>%
  as.data.table()
# interpolation to add values
sspDB_ssp4_native_regions_CO2_ffi = sspDB_ssp4_native_regions_CO2_ffi[,approx(t,value, xout = c(0:18)), by = nssp4] %>% 
  rename(t = x, value = y)


# SSP5

sspDB_ssp5_native_regions_CO2_ffi <- sspDB_IAM_native_regions_CO2_ffi %>%
  filter(year >=2010) %>%
  mutate(t = (year - 2010)/5 ) %>%
  filter(    (model == "REMIND-MAGPIE") & grepl("SSP5-Ref", scenario)) %>%
  rename( nssp5 = region )  %>%
  filter( !(nssp5 == "world")) %>%
  select(ssp,nssp5,t,value) %>%
  as.data.table()
# interpolation to add values
sspDB_ssp5_native_regions_CO2_ffi = sspDB_ssp5_native_regions_CO2_ffi[,approx(t,value, xout = c(0:18)), by = nssp5] %>% 
  rename(t = x, value = y)




sspDB_ssp3_native_regions_CO2_ffi %>% select(nssp3) %>% distinct()
sspDB_ssp4_native_regions_CO2_ffi %>% dplyr::select(nssp4) %>% distinct()
sspDB_ssp5_native_regions_CO2_ffi %>% dplyr::select(nssp5) %>% distinct()









## ----------------: NATIVE REGIONS MARKERS NORMALIZED :--------------------------


## FUNCTION
# which takes in inputs emissions (both regionalized and world)
# and normalizes them on 2015 (estimated) value
normalize_IIASA_sspDB <- function(sspDB_IAM_sspX){
  
  ssp_2010_emi = sspDB_IAM_sspX %>% filter(t == 0) %>% rename(y2010 =value) %>% select(-t)
  ssp_2020_emi = sspDB_IAM_sspX %>% filter(t == 2) %>% rename(y2020 =value) %>% select(-t)
  
  join_columns <- colnames(ssp_2020_emi) 
  join_columns = join_columns[join_columns != "y2020"]
  
  ssp_2015_emi = ssp_2020_emi %>% 
    merge(ssp_2010_emi, by = join_columns) %>% 
    mutate(value2015 = ((y2020 + y2010)/2)) %>% 
    select(-c("y2020","y2010"))
  
  sspDB_IAM_sspX_NORMALIZED = sspDB_IAM_sspX %>%
    merge(ssp_2015_emi,by = join_columns) %>%
    mutate(value = value/value2015) %>% 
    select(-value2015) %>% filter(t >= 2)
  
  return(sspDB_IAM_sspX_NORMALIZED)
}

sspDB_ssp1_native_regions_CO2_ffi_normalized <- normalize_IIASA_sspDB(sspDB_ssp1_native_regions_CO2_ffi)
sspDB_ssp2_native_regions_CO2_ffi_normalized <- normalize_IIASA_sspDB(sspDB_ssp2_native_regions_CO2_ffi)
sspDB_ssp3_native_regions_CO2_ffi_normalized <- normalize_IIASA_sspDB(sspDB_ssp3_native_regions_CO2_ffi)
sspDB_ssp4_native_regions_CO2_ffi_normalized <- normalize_IIASA_sspDB(sspDB_ssp4_native_regions_CO2_ffi)
sspDB_ssp5_native_regions_CO2_ffi_normalized <- normalize_IIASA_sspDB(sspDB_ssp5_native_regions_CO2_ffi)

