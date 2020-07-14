
library(witchtools)



BHM_CC = read.csv("../BURKE 2015 - Replication/GDPcap_ClimateChange_RCP85_SSP5.csv") %>% 
  gather(year, gdp_pc, X2010:X2099) %>% 
  mutate(year = as.integer(str_replace(year,"X", "")))


BHM_BASE = read.csv("../BURKE 2015 - Replication/GDPcap_NOClimateChange_RCP85_SSP5.csv") %>% 
  gather(year, gdp_pc, X2010:X2099) %>% 
  mutate(year = as.integer(str_replace(year,"X", "")))



BHM_CC_ed57_gdp =  witchtools::convert_region(.x = BHM_CC %>% select(ISO3, year, gdp_pc) %>% rename(iso3=ISO3, value=gdp_pc), 
                                               from_reg ="iso3", 
                                               to_reg = "enerdata56",
                                               agg_weight = witchtools::default_weights$cst,
                                               agg_operator = "sum"  ) %>% rename(n=enerdata56)

BHM_BASE_ed57_gdp =  witchtools::convert_region(.x = BHM_BASE %>% select(ISO3, year, gdp_pc) %>% rename(iso3=ISO3, value=gdp_pc), 
                                              from_reg ="iso3", 
                                              to_reg = "enerdata56",
                                              agg_weight = witchtools::default_weights$cst,
                                              agg_operator = "sum"  ) %>% rename(n=enerdata56)



BHM_RCP85_DAM = merge(BHM_CC_ed57_gdp %>% rename(cc = value),
                      BHM_BASE_ed57_gdp %>% rename(base=value),
                      by=c("n", "year")) %>% mutate(value = (cc-base)/base)



