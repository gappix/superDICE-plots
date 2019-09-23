
path_hist = "C:/Users/GaPPi/Documents/PhD Projects/sunRICE/sunRICE-development/sDCdata_enerdata56_t58/"


##### SIGMA DATA               ------------------------------------------------
sigma_fut_gdx        = gdx(paste0(dir_sR_data,"sigma_fut.gdx"))
sigma_hist_gdx       = gdx(paste0(dir_sR_data,"sigma_hist.gdx"))
sigma_2015_gdx       = gdx(paste0(dir_sR_data,"sigma_2015_regression.gdx"))

all_items(sigma_2015_gdx)

sigma_hist = sigma_hist_gdx["sigma_hist"] %>% make_year_integer()
sigma_fut = sigma_fut_gdx["sigma_fut"] %>% make_year_integer()
sigma_2015 = sigma_2015_gdx["sigma_2015"] %>% make_year_integer()




#___________________________

####  EMISSIONS HISTORICAL        ---------------------------------------------

## OECD
E_hist_OECD_ny = historical_values_gdx["q_emi_valid_oecd"] %>% 
  filter(V1== "co2ffi") %>%
  select(-V1) %>%
  rename(year = V2) %>%
  make_year_integer()
# !APPLY ONLY ONCE!  conversion from Carbon to CO2
E_hist_OECD_ny$value = E_hist_OECD_ny$value * 44 /12



## PRIMAP 
E_hist_PRIMAP_ny  = historical_values_gdx["q_emi_valid_primap"]%>% 
  filter(V1== "co2ffi") %>%
  select(-V1) %>%
  rename(year = V2) %>%
  make_year_integer()
# !APPLY ONLY ONCE!  conversion from Carbon to CO2
E_hist_PRIMAP_ny$value = E_hist_PRIMAP_ny$value * 44 /12



#___________________________


####  Y HISTORICAL         -----------------------------------
y_hist_ny = historical_values_gdx["ykali_valid_weo"] %>%
  rename(year = V1) %>%
  make_year_integer()





####  SIGMA HISTORICAL
sigma_hist_long_ny = merge(E_hist_PRIMAP_ny, y_hist_ny,by=c("year", "n"))%>%
  rename(emissions = value.x, gdp = value.y) %>%
  mutate(sigma = emissions/gdp)




####  SIGMA HISTORICAL PLOT
regionToPlot = "usa" # <<<<< select this


plottigat= ggplot()+ 

  geom_point(data = sigma_hist_long_ny %>% filter(n==regionToPlot), 
             aes(x=year, y=sigma, color = "PRIMAP")) +
  geom_line(data = sigma_sR_OECD_nty %>% filter(n==regionToPlot), aes(x=year, y=value, color="OECD unc", group = n),  size=1.2) + 
  xlab("Year") +
  ylab("Carbon Intensity [GtCO2eq/Trill USD]"); plottigat



####  EMISSIONS HISTORICAL PLOT
regionToPlot = "usa" # <<<<< select this


plottigat= ggplot()+ 
  
  geom_point(data = E_hist_OECD_ny %>% filter(n==regionToPlot), 
             aes(x=year, y=value, color = "OECD")) +
  geom_point(data = E_hist_PRIMAP_ny %>% filter(n==regionToPlot), 
             aes(x=year, y=value, color = "PRIMAP")) +
  
  xlab("Year") +
  ylab("Carbon Emissions [GtCO2eq]"); plottigat

