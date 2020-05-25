
source("RICEx_utils/RICEx_00_package_retriever.R")
source("RICEx_plots/RICEx_plots.R")
require_package("purrr")
require_package("stringr")
require_package("xlsx")
require_package("tidyr")
require_package("dplyr")
#conflict_prefer("select", "dplyr")
dir_data_ndcs <- here("../RICEx-Data/ndcs/")




##---- Import files ----------

ndcs_raw <- tbl_df(read.xlsx(file.path(dir_data_ndcs, "", "NDC_MIUs_Extracted.xlsx"), 1)) %>% 
  filter(Country != "EU28") %>%
  as.data.frame()

names(ndcs_raw) <- c("ISO3", 
                     "Country",
                     "EU Member",
                     "BAU PBL 2020", 
                     "BAU PBL 2025", 
                     "BAU PBL 2030", 
                     "EMI Uncond 2025",
                     "MIU Uncond 2025",
                     "EMI Cond 2025",
                     "MIU Cond 2025",
                     "EMI Uncond 2030",
                     "MIU Uncond 2030",
                     "EMI Cond 2030",
                     "MIU Cond 2030"
                     )

View(ndcs_raw) 




## ---- Plot ndcs if needed -----


ndcs_data_ISO3 <- function(year = 2030, Conditioned = TRUE, decimal = FALSE){
  
  
  iso3shp   <- st_read("qgis/shape_outfile/geo_iso3/geo_iso3.shp")    %>% rename(n= ISO3)
  
  if(Conditioned){condition_selection = "Cond"} else {condition_selection = "Uncond"}
  columns_to_select = c("ISO3", paste0("MIU ", condition_selection, " ", year))
  MYDF <- ndcs_raw %>% select(all_of(columns_to_select))
  names(MYDF) <- c("n", "value")
  if(!decimal){ MYDF = MYDF %>% mutate(value = value *100)  }
  
  return(MYDF)
}

plot_ndcs_ISO3 <- function(year = 2030, Conditioned = TRUE, decimal = FALSE){
  

  iso3shp   <- st_read("qgis/shape_outfile/geo_iso3/geo_iso3.shp")    %>% rename(n= ISO3)

  if(Conditioned){condition_selection = "Cond"} else {condition_selection = "Uncond"}
  columns_to_select = c("ISO3", paste0("MIU ", condition_selection, " ", year))
  MYDF <- ndcs_raw %>% select(all_of(columns_to_select))
  names(MYDF) <- c("n", "value")
  if(!decimal){ MYDF = MYDF %>% mutate(value = value *100)  }
  
  
 NDCs_Map = RICEx.plot.map(   
        data = MYDF 
        ,legend = "Mitigation [%BAU]"
        ,title = paste0("Mitigation pledges in ", year, ", ", condition_selection, ". [%BAU]")
        ,palette = (RColorBrewer::brewer.pal(9, "OrRd"))
        ,shape = iso3shp
        ,min_data = 0
        ,max_data = 120  
        ,centre_data = 60  )



 return(NDCs_Map)
}


plot_ndcs_ISO3()





xlsx_sspDB_all_baseline_CO2_ffi             <- tbl_df(read.xlsx(file.path(dir_data_ssp, "", "SSPall_Emissions_CO2_FFI.xlsx"), 1)) %>% select(-Notes) %>% as.data.frame()
xlsx_sspDB_all_regions_baseline_CO2_ffi     <- tbl_df(read.xlsx(file.path(dir_data_ssp, "", "SSPall_Regions_Emissions_CO2_FFI.xlsx"), 1)) %>% select(-Notes)

csv_sspDB_IAM_native_regions_CO2_ffi        <- tbl_df(read.csv(file.path(dir_data_ssp, "", "SSP_IAM_native_regions_2018-02-19.csv"), 1))          %>%  # HEAVY!
  filter(VARIABLE == "Emissions|CO2|Fossil Fuels and Industry")                                  %>% 
  rename(Model = MODEL, Scenario = SCENARIO, Region = REGION, Variable = VARIABLE, Unit = UNIT)  %>% 
  as.data.frame()

xlsx_sspDB_total_forcing           <- tbl_df(read.xlsx(file.path(dir_data_ssp, "", "SSPworld_total_forcing.xlsx"), 1)) %>% select(-Notes) %>% as.data.frame()
